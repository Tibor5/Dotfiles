local wezterm = require("wezterm")
local Bar = {}

function Bar.apply_to_config(config)
  local kanagawa = require("colors.kanagawa")
  config.enable_tab_bar = true
  config.use_fancy_tab_bar = false
  config.hide_tab_bar_if_only_one_tab = false
  config.tab_bar_at_bottom = true
  config.show_new_tab_button_in_tab_bar = false
  config.colors = {
    tab_bar = {
      background = kanagawa.background,
      active_tab = {
        bg_color = kanagawa.brights[1],
        fg_color = kanagawa.background,
        intensity = "Bold",
        underline = "None",
        italic = false,
        strikethrough = false,
      },
      inactive_tab = {
        bg_color = kanagawa.background,
        fg_color = kanagawa.foreground,
      },
    }
  }
  config.status_update_interval = 2000

  wezterm.on("update-status", function(window, pane)
    local basename = function(s) return string.gsub(s, "(.*[/\\])(.*)", "%2") end
    local stat_color = kanagawa.indexed[16]
    local stat = window:active_workspace()
    if window:active_key_table() then
      stat = window:active_key_table()
      stat_color = kanagawa.brights[7]
    end
    if window:leader_is_active() then
      stat = "LDR "
      stat_color = kanagawa.ansi[5]
    end
    local cwd = pane:get_current_working_dir()
    cwd = cwd and basename(cwd) or ""
    local cmd = pane:get_foreground_process_name()
    cmd = cmd and basename(cmd) or ""
    local time = wezterm.strftime("%H:%M")
    local battery = ""
    for _, b in ipairs(wezterm.battery_info()) do
      battery = string.format('%.0f%%', b.state_of_charge * 100)
    end
    window:set_left_status(wezterm.format({
      { Foreground = { Color = stat_color } },
      { Text = "| " },
      { Text = wezterm.nerdfonts.oct_table .. "  " .. stat },
      { Text = " |" },
    }))
    window:set_right_status(wezterm.format({
      { Text = wezterm.nerdfonts.md_folder .. "  " .. cwd },
      { Text = " | " },
      { Foreground = { Color = kanagawa.brights[4] } },
      { Text = wezterm.nerdfonts.fa_code .. "  " .. cmd },
      "ResetAttributes",
      { Text = " | " },
      { Text = wezterm.nerdfonts.md_clock .. "  " .. time },
      { Text = " | " },
      { Foreground = { Color = kanagawa.brights[4] } },
      { Text = wezterm.nerdfonts.fa_battery_half .. "  " .. battery },
      "ResetAttributes",
      { Text = " |" }
    }))
  end)
end

return Bar
