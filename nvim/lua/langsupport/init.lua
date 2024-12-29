vim.api.nvim_create_autocmd('FileType', {
	pattern = 'sh',
	callback = function()
		vim.lsp.start({
			name = 'bash-language-server',
			cmd = { 'bash-language-server', 'start' },
		})
	end,
})

local lspconfig = require("lspconfig")
lspconfig.lua_ls.setup {}
lspconfig.gopls.setup {}

