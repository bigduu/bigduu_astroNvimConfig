return {
  -- Configure AstroNvim updates
  updater = {
    remote = "origin", -- remote to use
    channel = "stable", -- "stable" or "nightly"
    version = "latest", -- "latest", tag name, or regex search like "v1.*" to only do updates before v2 (STABLE ONLY)
    branch = "nightly", -- branch name (NIGHTLY ONLY)
    commit = nil, -- commit hash (NIGHTLY ONLY)
    pin_plugins = nil, -- nil, true, false (nil will pin plugins on stable only)
    skip_prompts = false, -- skip prompts about breaking changes
    show_changelog = true, -- show the changelog after performing an update
    auto_quit = false, -- automatically quit the current session after a successful update
    remotes = { -- easily add new remotes to track
      --   ["remote_name"] = "https://remote_url.come/repo.git", -- full remote url
      --   ["remote2"] = "github_user/repo", -- GitHub user/repo shortcut,
      --   ["remote3"] = "github_user", -- GitHub user assume AstroNvim fork
      ["bigduu"] = "https://github.com/bigduu/bigduu_astroNvimConfig.git",
    },
  },

  -- Set colorscheme to use
  colorscheme = "tokyonight",

  -- Diagnostics configuration (for vim.diagnostics.config({...})) when diagnostics are on
  diagnostics = {
    virtual_text = true,
    underline = true,
  },
  plugins = {
    notify = false,
    rainbow = true,
    vimwiki = true,
  },
  lsp = {
    -- customize lsp formatting options
    formatting = {
      -- control auto formatting on save
      format_on_save = {
        enabled = true, -- enable or disable format on save globally
        allow_filetypes = { -- enable format on save for specified filetypes only
          -- "go",
        },
        ignore_filetypes = { -- disable format on save for specified filetypes
          -- "python",
        },
      },
      disabled = { -- disable formatting capabilities for the listed language servers
        -- disable lua_ls formatting capability if you want to use StyLua to format your lua code
        -- "lua_ls",
      },
      timeout_ms = 1000, -- default format timeout
      -- filter = function(client) -- fully override the default formatting function
      --   return true
      -- end
    },
    -- enable servers that you already have installed without mason
    servers = {
      -- "pyright"
    },
    mappings = {
      n = {
        ["<leader>la"] = {
          function() require("actions-preview").code_actions() end,
          desc = "Code action",
        },
        ["<leader>lf"] = { "<cmd>w<cr>", desc = "Format buffer" },
      },
      v = {
        ["<leader>lf"] = { "<cmd>w<cr>", desc = "Format buffer" },
      },
    },
    config = {
      rust_analyzer = {
        settings = {
          ["rust-analyzer"] = {
            procMacro = {
              enable = true,
              attributes = {
                enable = true,
              },
            },
            cargo = {
              loadOutDirsFromCheck = true,
            },
            lens = {
              enable = true,
              references = {
                adt = {
                  enable = true,
                },
              },
            },
            -- enable clippy on save
            checkOnSave = {
              command = "clippy",
            },
            typing = {
              autoClosingAngleBrackets = {
                enable = true,
              },
            },
            inlayHints = {
              maxLength = 500,
              minLines = 0,
              bindingModeHints = {
                enable = true,
              },
              closureReturnTypeHints = {
                enable = true,
              },
              lifetimeElisionHints = {
                enable = "always",
                useParameterNames = true,
              },
              closureReturnTypeHint = {
                enable = "always",
              },
              expressionAdjustmentHints = {
                enable = "always",
              },
            },
            lru = {
              capacity = 500,
            },
            workspace = {
              symbol = {
                search = {
                  limit = 5000,
                },
              },
            },
            diagnostics = {
              experimental = {
                enable = false,
              },
              disabled = {
                "inactive-code",
                "unresolved-proc-macro",
              },
            },
          },
        },
      },
    },
  },

  -- Configure require("lazy").setup() options
  lazy = {
    defaults = { lazy = true },
    performance = {
      rtp = {
        -- customize default disabled vim plugins
        disabled_plugins = { "tohtml", "gzip", "matchit", "zipPlugin", "netrwPlugin", "tarPlugin" },
      },
    },
  },

  -- This function is run last and is a good place to configuring
  -- augroups/autocommands and custom filetypes also this just pure lua so
  -- anything that doesn't fit in the normal config locations above can go here
  polish = function()
    -- Set up custom filetypes
    -- vim.filetype.add {
    --   extension = {
    --     foo = "fooscript",
    --   },
    --   filename = {
    --     ["Foofile"] = "fooscript",
    --   },
    --   pattern = {
    --     ["~/%.config/foo/.*"] = "fooscript",
    --   },
    -- }
  end,
}
