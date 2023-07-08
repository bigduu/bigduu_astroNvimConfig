return {
  "jose-elias-alvarez/null-ls.nvim",
  opts = function(_, config)
    -- config variable is the default configuration table for the setup function call
    local null_ls = require "null-ls"

    local formatting = null_ls.builtins.formatting
    -- Check supported formatters and linters
    -- https://github.com/jose-elias-alvarez/null-ls.nvim/tree/main/lua/null-ls/builtins/formatting
    -- https://github.com/jose-elias-alvarez/null-ls.nvim/tree/main/lua/null-ls/builtins/diagnostics
    config.sources = {
      -- Set a formatter
      -- null_ls.builtins.formatting.stylua,
      -- null_ls.builtins.formatting.prettier,
      --
      -- Formatting ---------------------
      --  brew install shfmt
      formatting.shfmt,
      -- StyLua
      formatting.stylua,
      -- frontend
      formatting.prettier.with { -- 比默认少了 markdown
        filetypes = {
          "vue",
          "javascript",
          "javascriptreact",
          "typescript",
          "typescriptreact",
          "vue",
          "css",
          "scss",
          "less",
          "html",
          "json",
          "yaml",
          "graphql",
        },
        prefer_local = "node_modules/.bin",
      },
      -- rustfmt
      -- rustup component add rustfmt
      formatting.rustfmt,
      -- Python
      -- pip install black
      -- asdf reshim python
      formatting.black.with { extra_args = { "--fast" } },
      -----------------------------------------------------
      -- Ruby
      -- gem install rubocop
      formatting.rubocop,
      -----------------------------------------------------
      -- formatting.fixjson,
      -- Diagnostics  ---------------------
      -- diagnostics.eslint.with({
      --     prefer_local = "node_modules/.bin",
      -- }),
      -- diagnostics.markdownlint,
      -- markdownlint-cli2
      -- diagnostics.markdownlint.with({
      --   prefer_local = "node_modules/.bin",
      --   command = "markdownlint-cli2",
      --   args = { "$FILENAME", "#node_modules" },
      -- }),
      --
      -- code actions ---------------------
      -- code_actions.gitsigns,
      -- code_actions.eslint.with({
      --     prefer_local = "node_modules/.bin",
      -- }),
    }
    return config -- return final config table
  end,
}
