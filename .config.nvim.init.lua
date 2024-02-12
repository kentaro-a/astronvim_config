
if vim.g.vscode then


  vim.cmd.packadd "packer.nvim"
  require("packer").startup(function(use)
    use 'rapan931/lasterisk.nvim'
    use 'phaazon/hop.nvim' 
  end)

  require'hop'.setup { keys = 'etovxqpdygfblzhckisuran' }



  -- vim.o.ignorecase = true
  -- vim.o.showcmd=false


  -- normal mode 
  vim.api.nvim_set_keymap('n', '<S-l>', '$', {noremap = true, silent = true})
  vim.api.nvim_set_keymap('n', '<S-h>', '^', {noremap = true, silent = true})
  vim.api.nvim_set_keymap('n', '<cr>', '$a<CR><Esc>', {noremap = true, silent = true})
  vim.api.nvim_set_keymap('n', 'x', '"_x', {noremap = true, silent = true})
  vim.api.nvim_set_keymap('n', 'gg', 'gg0', {noremap = true, silent = true})
  vim.api.nvim_set_keymap('n', 'ga', 'gg0v<S-g>$<Left>', {noremap = true, silent = true})
  vim.api.nvim_set_keymap('n', '--', "<Cmd>lua require('vscode-neovim').call('editor.action.commentLine')<CR>", {noremap = true, silent = true})
  vim.api.nvim_set_keymap('n', 'm', "<cmd>lua require'hop'.hint_words()<cr>", {noremap = true, silent = true})
  vim.api.nvim_set_keymap('n', '<Esc><Esc>', ':nohlsearch<CR>', {noremap = true, silent = true})
  vim.keymap.set('n', '<Space><Space>',  function() require("lasterisk").search() end)
  vim.api.nvim_set_keymap('n', '<Space>fc', "<Cmd>lua require('vscode-neovim').action('workbench.action.findInFiles', { args = { query = vim.fn.expand('<cword>') } })<CR>", {noremap = true, silent = true})
  vim.api.nvim_set_keymap('n', '<Space>fw', "<Cmd>lua require('vscode-neovim').action('workbench.action.findInFiles')<CR>", {noremap = true, silent = true})


  -- visual mode 
  vim.api.nvim_set_keymap('v', '--', "<Cmd>lua require('vscode-neovim').call('editor.action.commentLine')<CR><Esc>", {noremap = true, silent = true})
  vim.api.nvim_set_keymap('v', 'y', "y<Cmd>lua require('vscode-neovim').call('editor.action.clipboardCopyAction')<CR>", {noremap = true, silent = true})
  vim.api.nvim_set_keymap('v', 'H', "0", {noremap = true, silent = true})
  vim.api.nvim_set_keymap('v', 'L', "$h", {noremap = true, silent = true})
  vim.api.nvim_set_keymap('v', 'p', '"_dP', {noremap = true, silent = true})
  vim.api.nvim_set_keymap('v', 'r', "<Cmd>lua require('vscode-neovim').action('editor.action.startFindReplaceAction')<CR>", {noremap = true, silent = true})

  -- insert mode



else


  for _, source in ipairs {
    "astronvim.bootstrap",
    "astronvim.options",
    "astronvim.lazy",
    "astronvim.autocmds",
    "astronvim.mappings",
  } do
    local status_ok, fault = pcall(require, source)
    if not status_ok then vim.api.nvim_err_writeln("Failed to load " .. source .. "\n\n" .. fault) end
  end
  
  if astronvim.default_colorscheme then
    if not pcall(vim.cmd.colorscheme, astronvim.default_colorscheme) then
      require("astronvim.utils").notify("Error setting up colorscheme: " .. astronvim.default_colorscheme, "error")
    end
  end
  
  require("astronvim.utils").conditional_func(astronvim.user_opts("polish", nil, false), true)


  -- vim.o.noshowcmd = true
  -- vim.o.showcmd=false


end
