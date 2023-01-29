local wk = require("which-key")

wk.register({
  f = {
    name = "file", -- optional group name
    f = { "Find File" }, 
    r = { "Open Recent File"},
    t = { "Start FloatTerm Session" }
},
    t = { "Toggle FloatTerm" },
    p = {
        v = { "Explorer" },
        s = { "Grep in all files" }
    },
    c = {
        name = "Color Picker",
        c = {"Pick Color"},
        i = {"Insert Color"}
    },
    g = {
        name = "Git",
        s = { "Status" },
        d = { "<cmd>Git diff <CR>", "Diff" },
        l = { "<cmd>Git log --oneline --decorate --graph --all <CR>", "Log" },
        a = { "<cmd>Git add . <CR>", "Add current directory files to git" },
    }

}, { prefix = "<leader>" })
