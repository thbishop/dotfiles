return {
  {
    "nvim-treesitter/nvim-treesitter",
    build = function()
      require("nvim-treesitter.install").update({ with_sync = true })
    end,
    event = { "BufEnter" },
    config = function()
      ---@diagnostic disable: missing-fields
      require("nvim-treesitter.configs").setup({
        ensure_installed = {
          "bash",
          "cmake",
          "comment",
          "css",
          "diff",
          "dockerfile",
          "embedded_template",
          "gitcommit",
          "gitignore",
          "go",
          "gomod",
          "gosum",
          "gowork",
          "graphql",
          "html",
          "java",
          "javascript",
          "jq",
          "jsdoc",
          "json",
          "lua",
          "luadoc",
          "make",
          "markdown",
          "markdown_inline",
          "mermaid",
          "python",
          "requirements",
          "ruby",
          "sql",
          "ssh_config",
          "terraform",
          "toml",
          "tsv",
          "tsx",
          "typescript",
          "vim",
          "vimdoc",
          "yaml",
        },
        sync_install = false,
        highlight = {
          enable = true,
        },
        indent = {
          enable = false,
        },
        autopairs = {
          enable = true,
        },
        autotag = {
          enable = true,
        },
      })
    end,
  },
}
