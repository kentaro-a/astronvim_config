local macro = require "user.util.macro"
local buffer = require("astronvim.utils.buffer")
local astro_utils = require("astronvim.utils")

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
		["qt"] = { function() require("astronvim.utils.buffer").close() end, desc = "Close buffer" },
		["qT"] = { function() require("astronvim.utils.buffer").close(0, true) end, desc = "Force Close buffer" },
		["<Space><Space>"] = { "yiw<cmd>lua require('lasterisk').search()require('hlslens').start()<cr>", desc =
		"Find word in current buffer" },
		["m"] = { "<cmd>lua require'hop'.hint_words()<cr>", desc = "Force Close buffer", noremap = true },
	},
	v = {
		["<S-l>"] = { "$<Left>" },
		["<S-h>"] = { "^" },
		["--"] = { "<esc><cmd>lua require('Comment.api').toggle.linewise(vim.fn.visualmode())<cr>", desc =
		"Toggle comment out" },
	},
}
