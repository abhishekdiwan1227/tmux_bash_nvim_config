-- Bootstrap lazy.nvim
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
	local lazyrepo = "https://github.com/folke/lazy.nvim.git"
	local out = vim.fn.system({ "git", "clone", "--filter=blob:none", "--branch=stable", lazyrepo, lazypath })
	if vim.v.shell_error ~= 0 then
		vim.api.nvim_echo({ { "Failed to clone lazy.nvim:\n", "ErrorMsg" }, { out, "WarningMsg" },
			{ "\nPress any key to exit..." } }, true, {})
		vim.fn.getchar()
		os.exit(1)
	end
end
vim.opt.rtp:prepend(lazypath)

-- Setup lazy.nvim
require("lazy").setup({
	spec = { {
		-- import = "plugins",
		"neovim/nvim-lspconfig",
		{ "catppuccin/nvim",       name = "catppuccin", priority = 1000 },
		"williamboman/mason.nvim",
		"williamboman/mason-lspconfig.nvim",
		"junegunn/fzf",
		"junegunn/fzf.vim",
		"hrsh7th/cmp-nvim-lsp",
		"hrsh7th/cmp-nvim-lua",
		"hrsh7th/cmp-buffer",
		"hrsh7th/cmp-path",
		"hrsh7th/cmp-cmdline",
		"hrsh7th/nvim-cmp",
		{
			"L3MON4D3/LuaSnip",
			run = "make install_jsregexp",
			dependencies = { "rafamadriz/friendly-snippets" },
		},
		"saadparwaiz1/cmp_luasnip",
		{ "stevearc/conform.nvim", opts = {}, },
		"mfussenegger/nvim-lint"

	} },
	-- install = {
	--     colorscheme = {"tokyonight", "habamax"}
	-- },
	checker = {
		enabled = true, -- check for plugin updates periodically
		notify = false -- notify on update
	},        -- automatically check for plugin updates
	performance = {
		rtp = {
			-- disable some rtp plugins
			disabled_plugins = { "gzip", -- "matchit",
				-- "matchparen",
				-- "netrwPlugin",
				"tarPlugin", "tohtml", "tutor", "zipPlugin" }
		}
	}
})

require("mason").setup()
