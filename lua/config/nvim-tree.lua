require'nvim-tree'.setup {
    disable_netrw       = true,
    hijack_netrw        = true,
    open_on_setup       = true,
    ignore_ft_on_setup  = {},
    open_on_tab         = false,
    hijack_cursor       = false,
    update_cwd          = false,
    diagnostics = {
      enable = false,
      icons = {
        hint = "",
        info = "",
        warning = "",
        error = "",
      }
    },
    update_focused_file = {
      enable      = false,
      update_cwd  = false,
      ignore_list = {}
    },
    system_open = {
      cmd  = nil,
      args = {}
    },
    filters = {
      dotfiles = false,
      custom = {}
    },
    git = {
      enable = true,
      ignore = true,
      timeout = 500,
    },
    view = {
      width = 30,
      height = 30,
      hide_root_folder = false,
      side = 'left',
      mappings = {
        custom_only = false,
        list = {}
      },
      number = true,
      relativenumber = true,
      signcolumn = "yes"
    },
    renderer = {
      icons={
        show={
          file = false,
          folder = false,
          folder_arrow = false
        },
        glyphs = {
          default= '',
          symlink= '',
          git= {
            unstaged= "✗",
            staged= "✓",
            unmerged= "",
            renamed= "➜",
            untracked= "★",
            deleted= "",
            ignored= "◌"
          },
          folder= { 
            arrow_open= "+",
            arrow_closed= "-",
            default= "f",
            open= "o",
            empty= "e",
            empty_open= "eo",
            symlink= "s",
            symlink_open= "so",
          }
        }
      }
    },
    trash = {
      cmd = "trash",
      require_confirm = true
    }
  }
  
