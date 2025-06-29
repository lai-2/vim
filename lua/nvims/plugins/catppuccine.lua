return {
	"catppuccin/nvim",
	name = "catppuccin",
	lazy = false,
	priority = 1000,
	opts = {
		flavour = "macchiato", -- latte, frappe, macchiato, mocha
		background = {
			light = "latte",
			dark = "macchiato",
		},
		transparent_background = false,
		term_colors = true,
		styles = {
			comments = { "italic" },
			conditionals = { "italic" },
			loops = { "italic" },
			functions = { "italic" },
			keywords = { "bold" },
			strings = {},
			variables = {},
			numbers = {},
			booleans = {},
			properties = {},
			types = {},
			operators = {},
		},
		integrations = {
			cmp = true,
			gitsigns = true,
			telescope = true,
			treesitter = true,
			nvimtree = true,
			lsp_trouble = true,
		},
	},
}
