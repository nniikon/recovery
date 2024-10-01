return {
    "pogyomo/cppguard.nvim",
    dependencies = {
        "L3MON4D3/LuaSnip"
    },
    config = function()
        local cppguard = require("cppguard")
        
        -- Function to insert include guards
        local function insert_include_guards()
            local guard = cppguard.guard_string()
            local lines = {
                "#ifndef " .. guard,
                "#define " .. guard,
                "",
                "// Your code here",
                "",
                "#endif  // " .. guard
            }
            
            -- Get the current buffer
            local bufnr = vim.api.nvim_get_current_buf()
            
            -- Replace the entire buffer content
            vim.api.nvim_buf_set_lines(bufnr, 0, -1, false, lines)
            
            -- Move the cursor to the "Your code here" line
            vim.api.nvim_win_set_cursor(0, {4, 0})
        end

        -- Set up the keymap to generate and insert include guards
        vim.api.nvim_set_keymap('n', '<C-j>', [[<Cmd>lua require("cppguard").insert_include_guards()<CR>]], { noremap = true, silent = true })
        
        -- Add the function to the cppguard module
        cppguard.insert_include_guards = insert_include_guards
        
        -- Optional: Configure the naming method (default is "google")
        -- cppguard.setup({
        --     naming_method = "google"
        -- })
    end,
    ft = { "cpp", "hpp", "h" }, -- Load for C++ file types
}
