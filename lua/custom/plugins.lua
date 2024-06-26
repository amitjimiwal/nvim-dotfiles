local plugins={
   {
    "mfussenegger/nvim-jdtls"
  },
   {
    "rcarriga/nvim-dap-ui",
    event = "verylazy",
    dependencies = "mfussenegger/nvim-dap",
    config = function()
      local dap = require("dap")
      local dapui = require("dapui")
      require("dapui").setup()
      dap.listeners.after.event_initialized["dapui_config"] = function()
        dapui.open()
      end
      dap.listeners.before.event_terminated["dapui_config"] = function()
        dapui.close()
      end
      dap.listeners.before.event_exited["dapui_config"] = function()
        dapui.close()
      end
    end
  },{
    "mhartington/formatter.nvim",
    event = "VeryLazy",
    opts = function()
      return require "custom.configs.formatter"
    end
  },
  {
    "mfussenegger/nvim-lint",
    event = "VeryLazy",
    config = function()
      require "custom.configs.lint"
    end
  },
  -- {
  --   "mfussenegger/nvim-dap",
  --   config = function()
  --     require "custom.configs.dap"
  --     require("core.utils").load_mappings("dap")
  --   end
  -- },
  {
    "jose-elias-alvarez/null-ls.nvim",
     event = "verylazy",
    opts = function()
       return require "custom.configs.null-ls"
     end,
  },
  {
    "williamboman/mason.nvim",
      opts={
        ensure_installed={
        "eslint-lsp",
        "prettier",
          "typescript-language-server"
        }
      }
  },
  {
    "neovim/nvim-lspconfig",
    config=function ()
      require "plugins.configs.lspconfig"
      require "plugins.configs.lspconfig"
    end,
  },
}
return plugins
