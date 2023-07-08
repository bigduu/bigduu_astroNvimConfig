return {
  "nvim-treesitter/nvim-treesitter",
  opts = function(_, opts)
    -- add more things to the ensure_installed table protecting against community packs modifying it
    opts.ensure_installed = require("astronvim.utils").list_insert_unique(opts.ensure_installed, {
      "json",
      "markdown",
      "html",
      "css",
      "vim",
      "lua",
      "javascript",
      "typescript",
      "tsx",
      "rust",
      "svelte",
    })
    return {
      highlight = {
        enable = true,
        additional_vim_regex_highlighting = false,
      },
      indent = {
        enable = true,
      },
      rainbow = {
        enable = true,
        -- disable = { "jsx", "cpp" }, list of languages you want to disable the plugin for
        extended_mode = true, -- Also highlight non-bracket delimiters like html tags, boolean or table: lang -> boolean
        max_file_lines = nil, -- Do not enable for files with more than n lines, int
        colors = {
          "#95ca60",
          "#ee6985",
          "#D6A760",
          "#7794f4",
          "#b38bf5",
          "#7cc7fe",
        }, -- table of hex strings
        -- termcolors = { } -- table of colour name strings
      },
    }
  end,
}
