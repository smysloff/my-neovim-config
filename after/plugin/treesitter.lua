require'nvim-treesitter.configs'.setup {

  ensure_installed = {
    'c',
    'lua',
    'vim',
    'help',
    'query',
    'javascript',
  },

  auto_install = false,
  sync_install = false,

  highlight = {
    enable = true,
    additional_vim_regex_highlighting = false,
  },

}
