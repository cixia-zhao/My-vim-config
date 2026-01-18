-- ~/.config/nvim/lua/plugins/extras/lang/cpp.lua
-- 这是我们C++环境的最终、统一配置文件

return {
  -- 1. 修正 Mason：告诉它不要多管闲事去装 clangd
  {
    "williamboman/mason-lspconfig.nvim",
    opts = {
      ensure_installed = {},
    },
  },

  -- 2. 修正 LSP Config：明确告诉它我们需要 clangd 服务器
  {
    "neovim/nvim-lspconfig",
    opts = {
      servers = {
        clangd = {},
      },
    },
  },

  -- 3. 修正 Tree-sitter：让它只关心 C 和 C++
  {
    "nvim-treesitter/nvim-treesitter",
    opts = {
      ensure_installed = {
        "c",
        "cpp",
        -- 我们只关心 C 和 C++，这可以防止每次启动都去尝试安装
        -- 其他几十个我们用不到的、且可能导致失败的解析器。
      },
    },
  },
}
