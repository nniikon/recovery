return {
  'nvim-telescope/telescope.nvim', 
  tag = '0.1.5',
  dependencies = { 'nvim-lua/plenary.nvim' },
  keys = {
    { "<leader>ff", "<cmd>Telescope find_files<CR>", desc = "Find Files" },
    { "<leader>ft", "<cmd>Telescope live_grep<CR>", desc = "Find a string" },
    { "<leader>fb", "<cmd>Telescope buffers<CR>", desc = "Find buffers" },
  },
  config = function()
    require('telescope').setup {
      defaults = {
        mappings = {
          n = {
            ["d"] = require("telescope.actions").delete_buffer, -- Bind 'd' to delete buffer in normal mode
            ["q"] = require("telescope.actions").close, -- Bind 'q' to close in normal mode
          },
          i = {
            ["q"] = require("telescope.actions").close, -- Bind 'q' to close in insert mode
          },
        },
      },
    }
  end,
}
