return {
  "ray-x/go.nvim",
  dependencies = { -- optional packages
    "ray-x/guihua.lua",
    "neovim/nvim-lspconfig",
    "nvim-treesitter/nvim-treesitter",
  },
  opts = function()
    require("go").setup(opts)
    local format_sync_grp = vim.api.nvim_create_augroup("GoFormat", {})
    vim.api.nvim_create_autocmd("BufWritePre", {
      pattern = "*.go",
      callback = function()
        require("go.format").goimports()
      end,
      group = format_sync_grp,
    })
    return {
      -- lsp_keymaps = false,
      -- other options
      ai = {
        enable = true, -- set to true to enable AI features (GoAI, GoCmtAI)
        provider = "openai", -- 'copilot' or 'openai' (any OpenAI-compatible endpoint)
        model = "kimi-k2.5", -- model name, default: 'gpt-4o' for copilot, 'gpt-4o-mini' for openai
        api_key_env = "OPENAI_API_KEY", -- env var name that holds the API key, env only! DO NOT put your key here.
        base_url = "https://coding.dashscope.aliyuncs.com/v1",
        confirm = true, -- confirm before executing the translated command
      },
    }
  end,
  event = { "CmdlineEnter" },
  ft = { "go", "gomod" },
  build = ':lua require("go.install").update_all_sync()', -- if you need to install/update all binaries
}
