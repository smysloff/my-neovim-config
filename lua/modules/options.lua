vim.g.netrw_banner = 0

local options = {

  tabstop = 4,
  shiftwidth = 4,
  softtabstop = 4,
  expandtab = true,
  smartindent = true,

  wrap = false,
  fixeol = false,

  backup = false,
  swapfile = false,
  undodir = os.getenv('HOME') .. '/.vim/undodir',
  undofile = true,

  hlsearch = false,
  incsearch = true,
  ignorecase = true,

  termguicolors = true,

  splitbelow = true,
  splitright = true,

  number = true,
  relativenumber = true,
  numberwidth = 4,

  scrolloff = 8,
  sidescrolloff = 8,
  signcolumn = 'yes',

  colorcolumn = '80'
}

for k, v in pairs(options) do
  vim.opt[k] = v
end

vim.opt.isfname:append('@-@')

local fileTypeIndentGroup = vim.api.nvim_create_augroup('FileTypeIndent', {
  clear = true,
})

vim.api.nvim_create_autocmd('FileType', {
  pattern = { 'lua', 'javascript', 'html', },
  callback = function()
    vim.schedule(function()
      vim.opt.tabstop = 2
      vim.opt.shiftwidth = 2
      vim.opt.softtabstop = 2
    end)
  end,
  group = fileTypeIndentGroup,
})
