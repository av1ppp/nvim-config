-- Setup language servers.
local lspconfig = require("lspconfig")

-- Preload languages LSP
lspconfig.ts_ls.setup({}) -- Typescript
lspconfig.pyright.setup({}) -- Python
lspconfig.gopls.setup({}) -- Golang
lspconfig.clangd.setup({}) -- C
lspconfig.rust_analyzer.setup({ -- Rust
    settings = {
        ["rust-analyzer"] = {
            diagnostics = {
                enable = true,
                experimental = {
                    enable = true,
                },
            },
        },
    },
})

-- Global mappings.
vim.keymap.set("n", "<Leader>ld", vim.diagnostic.setloclist)
vim.keymap.set("n", "<Leader>lD", vim.diagnostic.open_float)
vim.keymap.set("n", "[d", vim.diagnostic.goto_prev)
vim.keymap.set("n", "]d", vim.diagnostic.goto_next)

-- Use LspAttach autocommand to only map the following keys
-- after the language server attaches to the current buffer
vim.api.nvim_create_autocmd("LspAttach", {
    group = vim.api.nvim_create_augroup("UserLspConfig", {}),
    callback = function(ev)
        -- Enable completion triggered by <c-x><c-o>
        vim.bo[ev.buf].omnifunc = "v:lua.vim.lsp.omnifunc"

        -- Buffer local mappings.
        local opts = { buffer = ev.buf }
        vim.keymap.set("n", "gD", vim.lsp.buf.declaration, opts)
        -- vim.keymap.set("n", "gd", vim.lsp.buf.definition, opts) -- NOTE declared in telescope.lua
        vim.keymap.set("n", "K", vim.lsp.buf.hover, opts)
        -- vim.keymap.set("n", "gi", vim.lsp.buf.implementation, opts)
        vim.keymap.set("n", "<C-k>", vim.lsp.buf.signature_help, opts)
        -- vim.keymap.set('n', '<Leader>sa', vim.lsp.buf.add_workspace_folder, opts)
        -- vim.keymap.set('n', '<Leader>sr', vim.lsp.buf.remove_workspace_folder, opts)
        -- vim.keymap.set('n', '<Leader>sl', function()
        --  print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
        -- end, opts)
        -- vim.keymap.set('n', '<Leader>D', vim.lsp.buf.type_definition, opts)
        vim.keymap.set("n", "<Leader>lr", vim.lsp.buf.rename, opts)
        vim.keymap.set({ "n", "v" }, "<Leader>la", vim.lsp.buf.code_action, opts)
        -- vim.keymap.set('n', 'gr', vim.lsp.buf.references, opts)
        vim.keymap.set("n", "<Leader>lf", function()
            vim.lsp.buf.format({ async = true })
        end, opts)
    end,
})
