local wk = require("which-key")

vim.g.mapleader = " "

-- Neotree
wk.add({
    mode = "n",
    hidden = true,
    { "<leader>e", ":Neotree left focus<CR>", desc = "Neotree - Focus" },
    { "<leader>o", ":Neotree left git_status<CR>", desc = "Neotree - Git Status" },
})
-- vim.keymap.set("n", "<leader>e", ":Neotree left focus<CR>")
-- vim.keymap.set("n", "<leader>o", ":Neotree left git_status<CR>")

-- Snippy
local snippy_mappings = require("snippy.mapping")
vim.keymap.set("i", "<Tab>", snippy_mappings.expand_or_advance("<Tab>"))
vim.keymap.set("s", "<Tab>", snippy_mappings.next("<Tab>"))
vim.keymap.set({ "i", "s" }, "<S-Tab>", snippy_mappings.previous("<S-Tab>"))

-- Splits
vim.keymap.set("n", "|", ":vsplit<CR>")
vim.keymap.set("n", "-", ":split<CR>")

-- Tabs
wk.add({
    { "<Tab>", ":BufferLineCycleNext<CR>", mode = "n", hidden = true },
    { "<s-Tab>", ":BufferLineCyclePrev<CR>", mode = "n", hidden = true },
    {
        "<leader>x",
        group = "Close Buffer",
        mode = "n",
        { "<leader>xb", ":BufferLinePickClose<CR>", desc = "Pick Buffer" },
        { "<leader>xc", ":bd<CR>", desc = "Current Buffer" },
        { "<leader>xp", ":BufferLineCloseLeft<CR>", desc = "Prev Tab" },
        { "<leader>xn", ":BufferLineCloseRight<CR>", desc = "Next Tab" },
    },
})

-- Other
vim.keymap.set("i", "jj", "<Esc>")

-- Search
vim.keymap.set("n", "<f3>", ":noh <CR>")
