local macro = require "user.util.macro"
local buffer = require("astronvim.utils.buffer")

return {
	n = {
		["<S-l>"] = { "$" },
		["<S-h>"] = { "^" },
		["<cr>"] = { "$a<CR><Esc>" },
		["x"] = { '"_x' },
		["s"] = { '"_s' },
		["gg"] = { "gg0", desc = "Go to the top" },
		["ga"] = { "gg0v<S-g>$<Left>", desc = "Select whole buffer" },
		["--"] = { function() require("Comment.api").toggle.linewise.count(vim.v.count > 0 and vim.v.count or 1) end, desc =
		"Toggle comment out" },
		["<S-Right>"] = { function() buffer.nav(vim.v.count > 0 and vim.v.count or 1) end, desc = "Next buffer" },
		["<S-Left>"] = { function() buffer.nav(-(vim.v.count > 0 and vim.v.count or 1)) end, desc = "Previous buffer" },
		["<M-Right>"] = { function() buffer.move(vim.v.count > 0 and vim.v.count or 1) end, desc = "Next buffer" },
		["<M-Left>"] = { function() buffer.move(-(vim.v.count > 0 and vim.v.count or 1)) end, desc = "Previous buffer" },
		["n"] = { macro.better_search "n", desc = "Next search with center and unfold" },
		["N"] = { macro.better_search "N", desc = "previous search with center and unfold" },
		["qq"] = { function() require("astronvim.utils.buffer").close() end, desc = "Close buffer" },
		["QQ"] = { function() require("astronvim.utils.buffer").close(0, true) end, desc = "Force Close buffer" },
		["m"] = { "<cmd>lua require'hop'.hint_words()<cr>", desc = "Force Close buffer", noremap = true },
		["<Space><Space>"] = {
			"yiw<cmd>lua require('lasterisk').search()require('hlslens').start()<cr>", desc =
		"Find word in current buffer" },
		["<leader>rs"] = { "<CMD>SearchReplaceSingleBufferSelections<CR>" },
		["<leader>ro"] = { "<CMD>SearchReplaceSingleBufferOpen<CR>" },
		["<leader>rw"] = { "<CMD>SearchReplaceSingleBufferCWord<CR>" },
		["<leader>rbs"] = { "<CMD>SearchReplaceMultiBufferSelections<CR>" },
		["<leader>rbo"] = { "<CMD>SearchReplaceMultiBufferOpen<CR>" },
		["<leader>rbw"] = { "<CMD>SearchReplaceMultiBufferCWord<CR>" },
		["<leader>fw"] = { "<CMD>lua require('telescope').extensions.live_grep_args.live_grep_args()<CR>" },
		["<leader>fo"] = { "<CMD>lua require('telescope.builtin').oldfiles({only_cwd=true})<CR>" },
	},
	v = {
		["<S-l>"] = { "$<Left>" },
		["<S-h>"] = { "^" },
		["--"] = { "<esc><cmd>lua require('Comment.api').toggle.linewise(vim.fn.visualmode())<cr>", desc =
		"Toggle comment out" },
		["p"] = { '"_dP' },
		["<C-r>"] = { "<CMD>SearchReplaceSingleBufferVisualSelection<CR>" },
		["<C-s>"] = { "<CMD>SearchReplaceWithinVisualSelection<CR>" },
	},
	i = {

	},
}
