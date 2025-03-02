return 
{
    "ntpeters/vim-better-whitespace",
    config = function()  
        vim.keymap.set('n', '<leader>ww', vim.cmd.StripWhitespace)
    end
}
