require("nvim-treesitter.configs").setup({
	ensure_installed = { "lua", "ruby", "go", "javascript", "html", "css", "sql" },
	highlight = {
		enable = true,
	},
})
