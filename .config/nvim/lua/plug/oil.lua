return {
  "stevearc/oil.nvim",
  priority = 990,
  opts = {
    default_file_explorer = true,
    columns = { "icon" },
    buf_options = { buflisted = false, bufhidden = "hide" },
    win_options = { list = true },
    delete_to_trash = false,
    skip_confirm_for_simple_edits = false,
    prompt_save_on_select_new_entry = true,
    cleanup_delay_ms = 2000,
    lsp_file_methods = { timeout_ms = 1000, autosave_changes = true },
    constrain_cursor = "name",
    use_default_keymaps = false,
    keymaps = {
      ["?"] = "actions.show_help",
      ["~"] = "actions.open_cwd",
      ["@"] = "actions.cd",
      ["gs"] = "actions.change_sort",
      ["gx"] = "actions.open_external",
      ["g."] = "actions.toggle_hidden",
      ["g\\"] = "actions.toggle_trash",
      ["h"] = "actions.parent",
      ["l"] = "actions.select",
      ["<CR>"] = "actions.select",
      ["<C-v>"] = "actions.select_vsplit",
      ["<C-x>"] = "actions.select_split",
      ["<C-t>"] = "actions.select_tab",
      ["<C-p>"] = "actions.preview",
      ["<C-f>"] = "actions.preview_scroll_down",
      ["<C-b>"] = "actions.preview_scroll_up",
      ["<C-c>"] = "actions.close",
      ["<C-r>"] = "actions.refresh",
    },
    view_options = {
      show_hidden = true,
      is_hidden_file = function(name, _) return vim.startswith(name, ".") end,
      natural_order = false,
      sort = { { "type", "asc" }, { "name", "asc" } },
    },
    float = {
      padding = 2,
      max_width = math.floor(vim.api.nvim_win_get_width(0) * 0.4),
      max_height = math.floor(vim.api.nvim_win_get_height(0) * 0.35),
      border = S.Border,
      override = function(conf)
        conf.style = "minimal"
        return conf
      end,
    },
    keymaps_help = { border = S.Border },
  },
}
