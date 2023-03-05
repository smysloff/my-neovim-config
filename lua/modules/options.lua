vim.opt.shiftwidth = 4
vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.expandtab = true

vim.opt.smartindent = true

vim.opt.wrap = false

vim.opt.swapfile = false
vim.opt.backup = false
vim.opt.undodir = os.getenv("HOME") .. '/.vim/undodir'
vim.opt.undofile = true

vim.opt.ignorecase = true
vim.opt.hlsearch = false
vim.opt.incsearch = true

vim.opt.termguicolors = true

vim.opt.splitbelow = true
vim.opt.splitright = true

vim.opt.fixeol = false

vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.numberwidth = 4

vim.opt.scrolloff = 8
vim.opt.sidescrolloff = 8
vim.opt.signcolumn = 'yes'
vim.opt.isfname:append('@-@')

vim.opt.colorcolumn = '80'

local fileTypIndentGroup = vim.api.nvim_create_augroup('FileTypeIndent', {
  clear = true,
})

vim.api.nvim_create_autocmd('FileType', {
  pattern = { 'lua', 'javascript', 'html', },
  callback = function()
    vim.schedule(function()
      vim.opt.softtabstop = 2
      vim.opt.shiftwidth = 2
    end)
  end,
  group = fileTypeIndentGroup,
})
