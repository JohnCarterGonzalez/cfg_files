local cmd = vim.cmd
local fn = vim.fn
local api = vim.api

require("config.lsp")
require("config.trouble")
require("config.telescope")
require("config.lualine")
require("config.which-key")
require("config.comment")

-- Global object
_G.NVMM = {}

local packer_bootstrap = false -- Indicate first time installation

-- packer.nvim configuration
local conf = {
	profile = {
		enable = true,
		threshold = 0, -- the amount in ms that a plugins load time must be over for it to be included in the profile
	},

	display = {
		open_fn = function()
			return require("packer.util").float({ border = "rounded" })
		end,
	},
}

local function packer_init()
	-- Check if packer.nvim is installed
	local install_path = fn.stdpath("data") .. "/site/pack/packer/start/packer.nvim"
	if fn.empty(fn.glob(install_path)) > 0 then
		packer_bootstrap = fn.system({
			"git",
			"clone",
			"--depth",
			"1",
			"https://github.com/wbthomason/packer.nvim",
			install_path,
		})
		cmd([[packadd packer.nvim]])
	end

	-- Run PackerCompile if there are changes in this file
	local packerGrp = api.nvim_create_augroup("packer_user_config", { clear = true })
	api.nvim_create_autocmd(
		{ "BufWritePost" },
		{ pattern = "init.lua", command = "source <afile> | PackerCompile", group = packerGrp }
	)
end

-- Plugins
local function plugins(use)
	use({ "wbthomason/packer.nvim" })

	-- Aesthetic
	use({ "kyazdani42/nvim-web-devicons" })
	use({ 'rose-pine/neovim', as = 'rose-pine' })
	use({ "nvim-lualine/lualine.nvim" })

	-- Core Config
	use({ "nvim-lua/plenary.nvim" })
	use ({
	'nvim-telescope/telescope.nvim', tag = '0.1.x',
	requires = { {'nvim-lua/plenary.nvim'} }
	})
	use ({
	'ThePrimeagen/harpoon',
	requires = { {'nvim-lua/plenary.nvim'} }
	})
	use({
	"echasnovski/mini.nvim",
	config = function()
		require("config.mini")
	end,
	})
	use({ "tpope/vim-endwise"})
	use({ "tpope/vim-fugitive"})
	use({ "tpope/vim-rhubarb"})
	use({ "tpope/vim-sleuth"})
	use({ "jiangmiao/auto-pairs"})
	use({ "folke/which-key.nvim"})
	use({ "preservim/nerdcommenter"})

	-- LSP
	use {
	  'VonHeikemen/lsp-zero.nvim',
	  branch = 'v2.x',
	  requires = {
	    {'neovim/nvim-lspconfig'},             -- Required
	    {                                      -- Optional
	      'williamboman/mason.nvim',
	      run = function()
		pcall(vim.cmd, 'MasonUpdate')
	      end,
	    },
	    {'williamboman/mason-lspconfig.nvim'}, -- Optional

	    -- Autocompletion
	    {'hrsh7th/nvim-cmp'},     -- Required
	    {'hrsh7th/cmp-nvim-lsp'}, -- Required
	    {'L3MON4D3/LuaSnip'},     -- Required
	    { 'hrsh7th/cmp-path' },
	    { 'hrsh7th/cmp-cmdline' },
	    { 'hrsh7th/cmp-buffer' },
	  }
	}
	use {
		"zbirenbaum/copilot.lua",
		cmd = "Copilot",
		event = "InsertEnter",
		config = function()
			require("config.copilot")
		end,
	}
	-- Highlight them errors
	use({
	"folke/trouble.nvim",
	requires = "nvim-tree/nvim-web-devicons",
	})
	-- 
	use({
		"nvim-treesitter/nvim-treesitter",
		run = ":TSUpdate",
		config = function()
			require("config.treesitter")
		end,
	})
	use({ "nvim-treesitter/playground" })
use {
    "nvim-neorg/neorg",
    config = function()
        require('neorg').setup {
            load = {
                ["core.defaults"] = {}, -- Loads default behaviour
                ["core.concealer"] = {}, -- Adds pretty icons to your documents
                ["core.dirman"] = { -- Manages Neorg workspaces
                    config = {
                        workspaces = {
                            notes = "~/.notes",
                        },
                    },
                },
            },
        }
    end,
    requires = "nvim-lua/plenary.nvim",
}
	-- Bootstrap Neovim
	if packer_bootstrap then
		print("Neovim restart is required after installation!")
		require("packer").sync()
	end
end

-- packer.nvim
packer_init()
local packer = require("packer")
packer.init(conf)
packer.startup(plugins)
