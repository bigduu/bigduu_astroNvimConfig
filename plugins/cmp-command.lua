---@diagnostic disable: missing-fields
return {
  "hrsh7th/nvim-cmp",
  dependencies = {
    "saadparwaiz1/cmp_luasnip",
    "hrsh7th/cmp-buffer",
    "hrsh7th/cmp-path",
    "hrsh7th/cmp-nvim-lsp",
    "hrsh7th/cmp-cmdline",
  },
  opts = function()
    local cmp = require "cmp"
    -- Use buffer source for `/`.
    cmp.setup.cmdline("/", {
      enabled = true,
      mapping = cmp.mapping.preset.cmdline {
        ["<C-k>"] = cmp.mapping.select_prev_item(),
        ["<C-j>"] = cmp.mapping.select_next_item(),
      },
      sources = {
        { name = "buffer" },
      },
    })

    -- Use cmdline & path source for ':'.
    cmp.setup.cmdline(":", {
      enabled = true,
      mapping = cmp.mapping.preset.cmdline {
        ["<C-k>"] = cmp.mapping.select_prev_item(),
        ["<C-j>"] = cmp.mapping.select_next_item(),
      },
      sources = cmp.config.sources({ { name = "cmdline" } }, { { name = "path" } }),
    })
  end,
}
