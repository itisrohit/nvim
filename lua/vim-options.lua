vim.cmd("set expandtab")
vim.cmd("set tabstop=2")
vim.cmd("set softtabstop=2")
vim.cmd("set shiftwidth=2")
vim.g.mapleader = " "

vim.opt.swapfile = false
vim.opt.mouse = "a"
vim.opt.mousemoveevent = true
vim.opt.clipboard = "unnamedplus"
vim.opt.undofile = true
vim.opt.undodir = vim.fn.stdpath("config") .. "/.undo"
vim.opt.autowrite = true
vim.opt.autowriteall = true

local undo_dir = vim.fn.stdpath("config") .. "/.undo"
if vim.fn.isdirectory(undo_dir) == 0 then
  pcall(vim.fn.mkdir, undo_dir, "p")
end

vim.api.nvim_create_autocmd({ "InsertLeave", "TextChanged", "FocusLost", "BufLeave" }, {
  callback = function()
    if vim.bo.modified and vim.bo.buftype == "" and vim.fn.expand("%") ~= "" then
      vim.cmd("silent! write")
    end
  end,
})

-- Navigate vim panes better
vim.keymap.set('n', '<c-k>', ':wincmd k<CR>')
vim.keymap.set('n', '<c-j>', ':wincmd j<CR>')
vim.keymap.set('n', '<c-h>', ':wincmd h<CR>')
vim.keymap.set('n', '<c-l>', ':wincmd l<CR>')

vim.keymap.set('n', '<leader>h', ':nohlsearch<CR>')
vim.keymap.set('n', '<leader>z', 'u', { desc = "Undo" })
vim.keymap.set('n', '<leader>Z', '<C-r>', { desc = "Redo" })
vim.keymap.set({ 'n', 'v' }, '<leader>y', '"+y', { desc = "Copy to system clipboard" })
vim.keymap.set('n', '<leader>Y', '"+yy', { desc = "Copy line to system clipboard" })
vim.keymap.set({ 'n', 'v' }, '<leader>p', '"+p', { desc = "Paste from system clipboard" })
vim.keymap.set({ 'n', 'v' }, '<leader>P', '"+P', { desc = "Paste before from system clipboard" })
vim.wo.number = true
