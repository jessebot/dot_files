-- opens nvim-tree on any file opening
require("nvim-tree").setup({
	view = {
		width = 20,
	},
})

-- autoclose command for nvimtree
-- WARNING: other plugins or automation may interfere with this
vim.api.nvim_create_autocmd("BufEnter", {
  nested = true,
  callback = function()
    if #vim.api.nvim_list_wins() == 1 and vim.api.nvim_buf_get_name(0):match("NvimTree_") ~= nil then
      vim.cmd "quit"
    end
  end
})
