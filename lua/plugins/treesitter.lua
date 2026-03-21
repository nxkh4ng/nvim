return {
    "nvim-treesitter/nvim-treesitter",
    lazy = false,
    branch = "master",
    build = ":TSUpdate",
    main = "nvim-treesitter.configs",
    opts = {
        ensure_installed = {
            "lua", "c",
            "html", "css", "javascript", "typescript",
            "vue", "angular",
            "json", "yaml", "vim", "vimdoc", "query",
            "markdown", "markdown_inline",
        },
        sync_install = false,
        auto_install = true,
        highlight = {
            enable = true,
            additional_vim_regex_highlighting = false,
            disable = function(lang, buf)
                local max_filesize = 100 * 1024  -- 100KB
                local ok, stats = pcall(vim.uv.fs_stat, vim.api.nvim_buf_get_name(buf))
                if ok and stats and stats.size > max_filesize then
                    return true
                end
            end,
        },
        indent = { enable = true },
    },
}
