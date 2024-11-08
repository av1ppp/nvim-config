local wk = require("which-key")
local builtin = require("telescope.builtin")

wk.add({
    mode = "n",
    {
        "<leader>f",
        group = "Find",
        { "<leader>ff", builtin.find_files, desc = "Files" },
        { "<leader>fw", builtin.live_grep, desc = "Grep" },
        { "<leader>fb", builtin.buffers, desc = "Buffers" },
        -- vim.keymap.set("n", "<leader>fh", builtin.help_tags, {})
        { "<leader>fh", builtin.help_tags, desc = "Help Tags" },
        {
            "<leader>fg",
            group = "Git",
            -- vim.keymap.set("n", "<leader>gb", builtin.git_branches, {})
            { "<leader>fgb", builtin.git_branches, desc = "Branches" },
            -- vim.keymap.set("n", "<leader>gc", builtin.git_commits, {})
            { "<leader>fgc", builtin.git_commits, desc = "Commits" },
            -- vim.keymap.set("n", "<leader>gs", builtin.git_status, {})
            { "<leader>fgs", builtin.git_status, desc = "Status" },
        },
    },
    {
        "<leader>l",
        group = "LSP",
        { "<leader>ls", builtin.lsp_document_symbols, desc = "LSP Symbols" },
    },
    { "gr", builtin.lsp_references, desc = "Show References" },
    { "gd", builtin.lsp_definitions, desc = "Go To Definition" },
})

-- vim.keymap.set("n", "<leader>ls", builtin.lsp_document_symbols, {})
-- vim.keymap.set("n", "gr", builtin.lsp_references, { noremap = true, silent = true })
-- vim.keymap.set("n", "gd", builtin.lsp_definitions, { noremap = true, silent = true })
