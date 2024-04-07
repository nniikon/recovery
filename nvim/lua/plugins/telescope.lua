return
{
	'nvim-telescope/telescope.nvim', tag = '0.1.5',
	dependencies = { 'nvim-lua/plenary.nvim' },
	keys = 
	{
		{ "<leader>ff", "<cmd>Telescope find_files<CR>", desc = "Find Files" },
		{ "<leader>ft", "<cmd>Telescope live_grep<CR>", desc = "Find a string" },
		{ "<leader>fb", "<cmd>Telescope buffers<CR>", desc = "Find buffers" },
	}
}
