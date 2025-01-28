print("hello world")
require("neorg").setup {
    load = {
        ["core.defaults"] = {},
        ["core.neorgcmd"] = {},
        ["core.keybinds"] = {},
        ["core.concealer"] = {},
        ["core.looking-glass"] = {},
        ["core.integrations.nvim-cmp"] = {},
        ["core.syntax"] = {},
        ["core.export"] = {config = {extensions = "all"}},
        ["core.integrations.treesitter"] = {},
    }
}
