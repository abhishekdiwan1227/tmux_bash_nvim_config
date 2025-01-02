local lspconfig = require('lspconfig')
mason_lspconfig = require("mason-lspconfig")
local capabilities = vim.lsp.protocol.make_client_capabilities()
local conform = require('conform')
local cmp = require('cmp')
local lint = require('lint')

local cmp_capabilities = require('cmp_nvim_lsp').default_capabilities()
vim.tbl_extend('force', capabilities, cmp_capabilities)

lspconfig.lua_ls.setup {}
lspconfig.gopls.setup {
	capabilities = capabilities,
	auto_start = true,
}
lspconfig.bashls.setup {}

mason_lspconfig.setup()

conform.setup({
	formatters_by_ft = {
		go = { "gofumpt" }
	},
	format_on_save = {
		timeout_ms = 1000,
		lsp_format = "fallback"
	}
})

cmp.setup({
	snippet = {
		expand = function(args)
			require('luasnip').lsp_expand(args.body)
			-- vim.snippet.expand(args.body)
		end
	},
	mapping = cmp.mapping.preset.insert({
		['<C-b>'] = cmp.mapping.scroll_docs(-4),
		['<C-f>'] = cmp.mapping.scroll_docs(4),
		['<C-Space>'] = cmp.mapping.complete(),
		['<C-e>'] = cmp.mapping.abort(),
		['<C-y>'] = cmp.mapping.confirm {
			behavior = cmp.ConfirmBehavior.Insert,
			select = true, },
	}),
	sources = cmp.config.sources({
		{ name = 'nvim_lua' },
		{ name = 'nvim_lsp' },
		{ name = 'path' },
		{ name = 'luasnip' },
		{ name = 'buffer',  keyword_length = 3 },
	}),
	experimental = {
		native_menu = false,
		ghost_text = true,
	},
})

lint.linters_by_ft = {
	go = { "staticcheck" },
	lua = { "luac" }
}

vim.api.nvim_buf_set_keymap(0, 'n', 'cr', ':lua vim.lsp.buf.rename()<CR>', { noremap = true, silent = true })
vim.api.nvim_buf_set_keymap(0, 'n', '..', ':lua vim.lsp.buf.format()<CR>', { noremap = true, silent = true })
