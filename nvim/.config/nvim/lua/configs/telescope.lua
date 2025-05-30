local defaults = require "nvchad.configs.telescope"
defaults.extensions = {
  ["ui-select"] = {
    require("telescope.themes").get_dropdown {},
  },
}

local actions = require "telescope.actions"
defaults.defaults.mappings = {
  i = {
    ["<S-tab>"] = actions.move_selection_previous + actions.toggle_selection,
  },
  n = {
    ["<S-tab>"] = actions.move_selection_previous + actions.toggle_selection,
    ["<BS>"] = actions.move_selection_previous + actions.toggle_selection,
    ["v"] = actions.select_vertical,
    ["s"] = actions.select_horizontal,
    ["t"] = actions.select_tab,
    ["q"] = actions.send_selected_to_qflist + actions.open_qflist,
  },
}

require("telescope").setup(defaults)
require("telescope").load_extension "ui-select"
