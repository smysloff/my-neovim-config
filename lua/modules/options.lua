vim.g.netrw_banner = 0

local options = {

  tabstop = 4, -- Number of spaces that a <Tab> in the file counts for. (default 8)
  shiftwidth = 4, -- Number of spaces to use for each step of (auto)indent. Used for 'cindent', >>, <<, etc. (default 8)
  softtabstop = 4, -- Number of spaces that a <Tab> counts for while performing editing operations, like inserting a <Tab> or using <BS>. (default 0)
  expandtab = true, -- In Insert mode: Use the appropriate number of spaces to insert a <Tab>. (default off)
  smartindent = true, -- Do smart autoindenting when starting a new line. (default off)

  wrap = false, -- Lines longer than the width of the window will wrap and	displaying continues on the next line. (default on)
  fixendofline = false, -- <EOL> at the end of file will be restored if missing. (default on)

  backup = false, -- Make a backup before overwriting a file. (default off)
  swapfile = false, -- Use a swapfile for the buffer. (default on)
  undofile = true, -- Vim automatically saves undo history to an undo file when writing a buffer to a file, and restores undo history from the same file on buffer read. (default off)
  undodir = os.getenv('HOME') .. '/.vim/undodir', -- List of directory names for undo files, separated with commas. (default "$XDG_STATE_HOME/nvim/undo//")

  hlsearch = false, -- When there is a previous search pattern, highlight all its matches. (default on)
  incsearch = true, -- While typing a search command, show where the pattern, as it was typed so far, matches. (default on)
  ignorecase = true, -- Ignore case in search patterns. (default off)

  termguicolors = true, -- Enables 24-bit RGB color in the TUI. (default off)

  splitbelow = true, -- Splitting a window will put the new window below the current one. (default off)
  splitright = true, -- Vertical splitting a window will put the new window right of the current one. (default off)

  number = true, -- Print the line number in front of each line. (default off)
  relativenumber = true, -- Show the line number relative to the line with the cursor in front of each line. (default off)
  numberwidth = 4, -- Minimal number of columns to use for the line number. (default 4)

  scrolloff = 8, -- Minimal number of screen lines to keep above and below the cursor. (default 0)
  sidescrolloff = 8, -- The minimal number of screen columns to keep to the left and to the	right of the cursor if 'nowrap' is set. (default 0)
  signcolumn = 'yes', -- When and how to draw the signcolumn. (default "auto")

  colorcolumn = '80' -- A comma-separated list of screen columns that are highlighted with ColorColumn hl-ColorColumn.  Useful to align text. (default "")
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
