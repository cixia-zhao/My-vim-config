return {
  -- 禁用 mason-lspconfig 的自动安装功能
  {
    "williamboman/mason-lspconfig.nvim",
    opts = {
      ensure_installed = {},
    },
  },
  -- 明确告诉 lspconfig 我们需要 clangd 服务器
  {
    "neovim/nvim-lspconfig",
    opts = {
      servers = {
        clangd = {},
      },
    },
  },
}
