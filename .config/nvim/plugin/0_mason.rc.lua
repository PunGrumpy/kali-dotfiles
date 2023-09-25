local status, mason = pcall(require, "mason")
if (not status) then return end
local status_mason, lspconfig = pcall(require, "mason-lspconfig")
if (not status_mason) then return end

mason.setup({})

lspconfig.setup {
  automatic_installation = true
}
