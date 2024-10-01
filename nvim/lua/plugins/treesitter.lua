local M = {
    "nvim-treesitter/nvim-treesitter",
    build = function()
        require("nvim-treesitter.install").update({ with_sync = true })()
    end,
    ensure_installed = { "c", "lua", "c++", "vimdoc", "query", "markdown", "markdown_inline" },
}

return { M }
