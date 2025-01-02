vim.api.nvim_create_autocmd({ "TabNewEntered", "VimEnter" }, {
	callback = function(args)
		if args.file == nil or args.file == "" then
			vim.cmd([[Files]])
		end
	end
})
