require("relative-motions"):setup({ show_numbers="relative", show_motion = true })

require("full-border"):setup()
require("starship"):setup()

require("yatline"):setup({
    section_separator = { open = "", close = "" },
    part_separator = { open = "", close = "" },
    inverse_separator = { open = "", close = "" },

    style_a = {
      fg = "black",
      bg_mode = {
        normal = "#78a9ff",
        select = "#be95ff",
        un_set = "#d65d0e"
      }
    },
    style_b = { bg = "#525252", fg = "#161616" },
    style_c = { bg = "#161616", fg = "#525252" },

    permissions_t_fg = "green",
    permissions_r_fg = "yellow",
    permissions_w_fg = "red",
    permissions_x_fg = "cyan",
    permissions_s_fg = "darkgray",

    tab_width = 20,
    tab_use_inverse = false,

    selected = { icon = "󰻭", fg = "yellow" },
    copied = { icon = "", fg = "green" },
    cut = { icon = "", fg = "red" },

    total = { icon = "󰮍", fg = "yellow" },
    succ = { icon = "", fg = "green" },
    fail = { icon = "", fg = "red" },
    found = { icon = "󰮕", fg = "blue" },
    processed = { icon = "󰐍", fg = "green" },

    show_background = true,

    display_header_line = true,
    display_status_line = true,

    header_line = {
      left = {
        section_a = {
        },
        section_b = {
        },
        section_c = {
        }
      },
      right = {
        section_a = {
        },
        section_b = {
        },
        section_c = {
        }
      }
    },
    status_line = {
      left = {
        section_a = {
                {type = "string", custom = false, name = "tab_mode"},
        },
        section_b = {
                {type = "string", custom = false, name = "hovered_size"},
        },
        section_c = {
                {type = "string", custom = false, name = "hovered_name"},
        }
      },
      right = {
        section_a = {
                {type = "string", custom = false, name = "cursor_position"},
        },
        section_b = {
                {type = "string", custom = false, name = "cursor_percentage"},
        },
        section_c = {
                {type = "coloreds", custom = false, name = "permissions"},
        }
      }
    },
  })
