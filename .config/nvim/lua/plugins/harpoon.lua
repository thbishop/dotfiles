return {
  {
    'ThePrimeagen/harpoon',
    branch = 'harpoon2',
    event = "VeryLazy",
    opts = function(_, opts)
      opts.settings = {
        save_on_toggle = false,
        sync_on_ui_close = false,
        save_on_change = true,
      }
    end,
  },
}
