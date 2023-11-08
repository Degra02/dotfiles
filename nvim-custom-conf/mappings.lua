local M = {}

M.general = {
  n = {
    [";"] = { ":", "Enter Command" },
    ["<C-h>"] = { "<cmd> TmuxNavigateLeft <CR>", "window left" },
    ["<C-k>"] = { "<cmd> TmuxNavigateUp <CR>", "window up" },
    ["<C-j>"] = { "<cmd> TmuxNavigateDown <CR>", "window down" },
    ["<C-l>"] = { "<cmd> TmuxNavigateRight <CR>", "window right" },

    ["<leader>pf"] = { "<cmd> ProjectMgr<CR>", "Open Projects"}
  }
}

M.nvterm = {
  plugin = true,

  t = {
  },

  n = {
  },
}

M.copilot = {
  n = {
    ["<leader>ce"] = { "<cmd> Copilot enable <CR>", "Copilot enable" },
    ["<leader>cd"] = { "<cmd> Copilot disable <CR>", "Copilot disable" },
  }
}

M.lspconfig = {
  n = {
    ["<leader>ld"] = {
      function()
        vim.lsp.buf.type_definition()
      end,
      "lsp definition type",
    },
  }
}

M.dap = {
  plugin = true,
  n = {
    ["<leader>db"] =  {"<cmd> DapToggleBrakPoint <CR>", "Toggle Breakpoint"},
    ["<leader>dus"] = {
      function ()
        local widgets = require("dap.ui.widgets");
        local sidebar = widgets.sidebar(widgets.scopes);
        sidebar.open()
      end,
      "Open DAP sidebar"
    }
  }
}

M.crates = {
  n = {
    ["<leader>rcu"] = {
      function ()
        require("crates").upgrade_all_crates()
      end,
      "Upgrade all crates"
    }
  }
}

return M
