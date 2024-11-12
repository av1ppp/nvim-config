-- Bootstrap lazy.nvim
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"

if not (vim.uv or vim.loop).fs_stat(lazypath) then
    local lazyrepo = "https://github.com/folke/lazy.nvim.git"
    local out = vim.fn.system({ "git", "clone", "--filter=blob:none", "--branch=stable", lazyrepo, lazypath })
    if vim.v.shell_error ~= 0 then
        vim.api.nvim_echo({
            { "Failed to clone lazy.nvim:\n", "ErrorMsg" },
            { out, "WarningMsg" },
            { "\nPress any key to exit..." },
        }, true, {})
        vim.fn.getchar()
        os.exit(1)
    end
end
vim.opt.rtp:prepend(lazypath)

-- Make sure to setup `mapleader` and `maplocalleader` before
-- loading lazy.nvim so that mappings are correct.
-- This is also a good place to setup other settings (vim.opt)
vim.g.mapleader = " "
vim.g.maplocalleader = "\\"

-- Setup lazy.nvim
require("lazy").setup({
    -- Files Tree
    {
        "nvim-neo-tree/neo-tree.nvim",
        branch = "v3.x",
        dependencies = {
            "nvim-lua/plenary.nvim",
            "nvim-tree/nvim-web-devicons", -- not strictly required, but recommended
            "MunifTanjim/nui.nvim",
            -- "3rd/image.nvim", -- Optional image support in preview window: See `# Preview Mode` for more information
        },
    },

    -- TreeSitter (Best syntax highlight)
    { "nvim-treesitter/nvim-treesitter" },

    -- Themes
    { "navarasu/onedark.nvim" },

    -- LSP
    { "neovim/nvim-lspconfig" },
    -- Mason (LSP manager)
    { "williamboman/mason.nvim" },
    { "williamboman/mason-lspconfig.nvim" },

    -- Autocomplete
    { "hrsh7th/cmp-nvim-lsp" },
    { "hrsh7th/cmp-buffer" },
    { "hrsh7th/cmp-path" },
    { "hrsh7th/cmp-cmdline" },
    -- { "hrsh7th/cmp-nvim-lsp-signature-help" },
    { "hrsh7th/nvim-cmp" },
    { "lewis6991/gitsigns.nvim" },

    -- Files and git navigation
    {
        "nvim-telescope/telescope.nvim",
        tag = "0.1.8",
        dependencies = { "nvim-lua/plenary.nvim" },
    },

    -- Formatter
    { "stevearc/conform.nvim" },

    -- Best comments
    { "numToStr/Comment.nvim" },

    -- Lualine (Best status bar)
    {
        "nvim-lualine/lualine.nvim",
        dependencies = {
            "nvim-tree/nvim-web-devicons",
            "linrongbin16/lsp-progress.nvim",
        },
    },

    -- Auto pairs and tags
    { "windwp/nvim-autopairs" },
    { "windwp/nvim-ts-autotag" },

    -- Bufferline
    {
        "akinsho/bufferline.nvim",
        dependencies = { "nvim-tree/nvim-web-devicons" },
    },

    -- Dashboard
    {
        "glepnir/dashboard-nvim",
        event = "VimEnter",
        dependencies = { { "nvim-tree/nvim-web-devicons" } },
    },

    -- Emmet
    { "mattn/emmet-vim" },

    -- Snippets
    { "dcampos/nvim-snippy" },
    { "dcampos/cmp-snippy" },

    -- Key helper
    {
        "folke/which-key.nvim",
        event = "VeryLazy",
        opts = {
            preset = "modern",
            triggers = {
                -- { "<auto>", mode = "nixsotc" },
                -- { "a", mode = { "n", "v" } },
                { "<leader>", mode = { "n", "v" } },
            },
        },
    },

    -- Todo comments
    {
        "folke/todo-comments.nvim",
        dependencies = { "nvim-lua/plenary.nvim" },
        opts = {
            -- your configuration comes here
            -- or leave it empty to use the default settings
            -- refer to the configuration section below
        },
    },

    -- HOP (Best navigation)
    {
        "smoka7/hop.nvim",
        version = "*",
        opts = {},
    },
})
