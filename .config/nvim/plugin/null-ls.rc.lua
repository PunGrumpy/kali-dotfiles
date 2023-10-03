local status, null_ls = pcall(require, "null-ls")
if (not status) then return end

local augroup = vim.api.nvim_create_augroup("LspFormatting", {})

local lsp_formatting = function(bufnr)
  vim.lsp.buf.format({
    filter = function(client)
      return client.name == "null-ls"
    end,
    bufnr = bufnr,
  })
end

null_ls.setup {
  sources = {
    null_ls.builtins.formatting.prettierd,
    null_ls.builtins.formatting.gofmt,
    -- null_ls.builtins.formatting.gofumpt, -- gofumpt is stricted than gofmt
    null_ls.builtins.formatting.goimports,
    null_ls.builtins.formatting.terraform_fmt,
    null_ls.builtins.formatting.fish_indent,
    null_ls.builtins.formatting.prismaFmt,
    null_ls.builtins.diagnostics.eslint_d.with({
      diagnostics_format = '[eslint] #{m}\n(#{c})'
    }),
    null_ls.builtins.diagnostics.fish,
    null_ls.builtins.diagnostics.golangci_lint,
    null_ls.builtins.diagnostics.staticcheck,
    null_ls.builtins.diagnostics.hadolint,
    null_ls.builtins.diagnostics.terraform_validate,
    null_ls.builtins.diagnostics.tfsec,
    null_ls.builtins.diagnostics.ansiblelint,
    null_ls.builtins.diagnostics.actionlint,
    null_ls.builtins.code_actions.gomodifytags,
    null_ls.builtins.code_actions.impl,
  },
  on_attach = function(client, bufnr)
    if client.supports_method("textDocument/formatting") then
      vim.api.nvim_clear_autocmds({ group = augroup, buffer = bufnr })
      vim.api.nvim_create_autocmd("BufWritePre", {
        group = augroup,
        buffer = bufnr,
        callback = function()
          lsp_formatting(bufnr)
        end,
      })
    end
  end
}

vim.api.nvim_create_user_command(
  'DisableLspFormatting',
  function()
    vim.api.nvim_clear_autocmds({ group = augroup, buffer = 0 })
  end,
  { nargs = 0 }
)
