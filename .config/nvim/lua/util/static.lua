S = {}

S.BorderSimple = { "─", "│", "─", "│", "┌", "┐", "┘", "└" }

S.Border = {
  { "┌", "Normal" },
  { "─", "Normal" },
  { "┐", "Normal" },
  { "│", "Normal" },
  { "┘", "Normal" },
  { "─", "Normal" },
  { "└", "Normal" },
  { "│", "Normal" },
}

S.VimModeLowercaseFull = {
  ["n"] = "normal",
  ["no"] = "normal",
  ["nov"] = "normal",
  ["noV"] = "normal",
  ["no\22"] = "normal",
  ["niI"] = "normal",
  ["niR"] = "normal",
  ["niV"] = "normal",
  ["nt"] = "normal",
  ["ntT"] = "normal",
  ["v"] = "visual",
  ["vs"] = "visual",
  ["V"] = "visual",
  ["Vs"] = "visual",
  ["\22"] = "visual",
  ["\22s"] = "visual",
  ["s"] = "select",
  ["S"] = "select",
  ["\19"] = "insert",
  ["i"] = "insert",
  ["ic"] = "insert",
  ["ix"] = "insert",
  ["R"] = "replace",
  ["Rc"] = "replace",
  ["Rx"] = "replace",
  ["Rv"] = "replace",
  ["Rvc"] = "replace",
  ["Rvx"] = "replace",
  ["c"] = "command",
  ["cv"] = "command",
  ["ce"] = "command",
  ["r"] = "...",
  ["rm"] = "M",
  ["r?"] = "?",
  ["!"] = "󰩌",
  ["t"] = "terminal",
}

S.VimModeTwo = {
  ["n"] = "NO",
  ["no"] = "OP",
  ["nov"] = "OC",
  ["noV"] = "OL",
  ["no\x16"] = "OB",
  ["\x16"] = "VB",
  ["niI"] = "IN",
  ["niR"] = "RE",
  ["niV"] = "RV",
  ["nt"] = "NT",
  ["ntT"] = "TM",
  ["v"] = "VI",
  ["vs"] = "VI",
  ["V"] = "VL",
  ["Vs"] = "VL",
  ["\x16s"] = "VB",
  ["s"] = "SE",
  ["S"] = "SL",
  ["\x13"] = "SB",
  ["i"] = "IN",
  ["ic"] = "IC",
  ["ix"] = "IX",
  ["R"] = "RE",
  ["Rc"] = "RC",
  ["Rx"] = "RX",
  ["Rv"] = "RV",
  ["Rvc"] = "RC",
  ["Rvx"] = "RX",
  ["c"] = "CO",
  ["cv"] = "CV",
  ["r"] = "PR",
  ["rm"] = "PM",
  ["r?"] = "P?",
  ["!"] = "SH",
  ["t"] = "TE",
}

S.Icons = {
  mode = "",
  normal = "",
  visual = "",
  insert = "",
  command = "",
  git = {
    branch = "",
    added = " ",
    modified = "󰝤 ",
    modified_simple = "~ ",
    removed = " ",
  },
  diagnostics = {
    error = " ",
    warn = " ",
    info = " ",
    hint = "󰌵 ",
    hintfull = " ",
  },
  ui = {
    box_full = "󰝤",
    box_empty = "󰄱",
    box_check = "",
    circle_right = "",
    circle_x = "󰰱",
    circle_full = "●",
    circle_outline = "○",
    circle_circle = "",
    circle_circle_l = "◉",
    dot_l = "•",
    dot = "",
    dot_s = "·",
    lock = "",
    langle_r = "",
    langle_l = "",
    xangle_r = "❯",
    xangle_l = "❮",
    angle_d = "",
    angle_l = "",
    angle_r = "",
    angle_u = "",
    arrow_d = "↓",
    arrow_l = "←",
    arrow_r = "→",
    arrow_u = "↑",
    cross = "󰅖",
    check = "󰄬",
    diamond = "◆",
    triangle_s_r = "",
    ellipsis = "…",
    space = "␣",
  },
}

S.root_markers = {
  ".git/",
  ".gitignore",
  ".ini",
  ".conf",
  ".json",
  "config",
  "config.ini",
  "config.toml",
  "config.conf",
  "config.json",
  "settings.ini",
  "settings.toml",
  "settings.conf",
  "settings.json",
  ".editorconfig",
  "init.lua",
  ".luacheckrc",
  ".luarc.json",
  ".luarc.jsonc",
  ".stylua.toml",
  "lazy-lock.json",
  "dune",
  "dune-project",
  "dune-workspace",
  ".ocamlformat",
  ".ocp-indent",
  ".opam",
  "compile_commands.json",
  "compile_flags.txt",
  ".clang-tidy",
  ".clang-format",
  ".ruff.toml",
  ".pyproject.toml",
  "main.go",
  "go.mod",
  "go.work",
  "go.sum",
  "Cargo.toml",
  "Cargo.lock",
  "mod.rs",
  "rust-project.json",
  "package.json",
  "Makefile",
  "makefile",
  "MAKEFILE",
  ".obsidian/",
  ".moxide.toml",
  "TODO.md",
  "README.md",
  "README.org",
  "README.txt",
  "README.pdf",
  "LICENSE",
  "src/",
  "bin/",
  "lib/",
  "test/",
  "build/",
  "_build/",
  "scripts/",
  "out/",
  "assets/",
}

S.FtSpecial = {
  "help",
  "qf",
  "git",
  "fugitive",
  "NeogitStatus",
  "lazy",
  "mason",
  "checkhealth",
}

S.FtIgnore = {
  "oil",
  "noice",
  "help",
  "qf",
  "checkhealth",
}

return S
