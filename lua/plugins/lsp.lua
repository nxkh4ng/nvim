return {
	{
		"mason-org/mason.nvim",
		cmd = "Mason",
		opts = {
			ui = {
				icons = {
					package_installed = "✓",
					package_uninstalled = "✕",
				},
			},
		},
	},
	{
		"neovim/nvim-lspconfig",
		dependencies = {
			"mason-org/mason.nvim",
			"saghen/blink.cmp",
		},
		event = { "BufReadPre", "BufNewFile" },
		config = function()
			local capabilities = require("blink.cmp").get_lsp_capabilities()
			local vue_language_server_path = vim.fn.stdpath("data")
				.. "/mason/packages/vue-language-server/node_modules/@vue/language-server"
			local vue_plugin = {
				name = "@vue/typescript-plugin",
				location = vue_language_server_path,
				languages = { "vue" },
				configNamespace = "typescript",
			}

			local servers = {
				lua_ls = {
					on_init = function(client)
						if client.workspace_folders then
							local path = client.workspace_folders[1].name
							if
								path ~= vim.fn.stdpath("config")
								and (vim.uv.fs_stat(path .. "/.luarc.json") or vim.uv.fs_stat(path .. "/.luarc.jsonc"))
							then
								return
							end
						end

						client.config.settings.Lua = vim.tbl_deep_extend("force", client.config.settings.Lua, {
							runtime = {
								version = "LuaJIT",
							},
							workspace = {
								checkThirdParty = false,
								library = {
									vim.env.VIMRUNTIME,
									"${3rd}/luv/library",
								},
							},
						})
					end,

					settings = { Lua = {} },
				},

				gopls = {
					settings = {
						gopls = {
							analyses = {
								unusedparams = true,
								unusedvariable = true,
							},
							completeUnimported = true,
							staticcheck = true,
							usePlaceholders = true,
						},
					},
				},

				emmet_language_server = {
					filetypes = {
						"astro",
						"css",
						"eruby",
						"html",
						"htmlangular",
						"htmldjango",
						"javascriptreact",
						"less",
						"sass",
						"scss",
						"svelte",
						"typescriptreact",
						-- "vue",
					},
				},
				basedpyright = {},
				html = {},
				cssls = {},
				tailwindcss = {},
				csharp_ls = {},
				angularls = {},
				ts_ls = {
					init_options = {
						plugins = { vue_plugin },
					},
					filetypes = { "typescript", "javascript", "javascriptreact", "typescriptreact", "vue" },
				},
				vue_ls = {},
			}

			for name, server in pairs(servers) do
				server.capabilities = vim.tbl_deep_extend("force", {}, capabilities, server.capabilities or {})
				vim.lsp.config(name, server)
				vim.lsp.enable(name)
			end

			-- Diagnostics UI
			vim.diagnostic.config({
				severity_sort = true,
				update_in_insert = false,
				signs = {
					text = {
						[vim.diagnostic.severity.ERROR] = "",
						[vim.diagnostic.severity.WARN] = "",
						[vim.diagnostic.severity.INFO] = "",
						[vim.diagnostic.severity.HINT] = "",
					},
				},
				virtual_text = {
					prefix = "■",
					source = "if_many",
				},
				float = {
					border = "rounded",
					source = true,
				},
			})

			vim.api.nvim_create_autocmd("LspAttach", {
				group = vim.api.nvim_create_augroup("UserLspAttach", { clear = true }),
				callback = function(event)
					local buf = event.buf
					local map = function(mode, lhs, rhs, desc)
						vim.keymap.set(mode, lhs, rhs, { buffer = buf, desc = desc })
					end

					map("n", "K", vim.lsp.buf.hover, "Hover docs")
					map("n", "<leader>ca", vim.lsp.buf.code_action, "Code Actions")
					map("n", "df", vim.diagnostic.open_float, "Diagnostics Float")
					map("n", "<C-k>", vim.lsp.buf.signature_help, "Signature help")
					map("n", "<leader>rn", vim.lsp.buf.rename, "Rename symbol")

					map("n", "[d", function()
						vim.diagnostic.jump({ count = -1 })
					end, "Prev diagnostic")
					map("n", "]d", function()
						vim.diagnostic.jump({ count = 1 })
					end, "Next diagnostic")
				end,
			})
		end,
	},
}
