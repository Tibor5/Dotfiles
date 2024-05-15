O = {}

O.BorderSimple = { "─", "│", "─", "│", "┌", "┐", "┘", "└" }

O.Border = {
  { "┌", "Normal" },
  { "─", "Normal" },
  { "┐", "Normal" },
  { "│", "Normal" },
  { "┘", "Normal" },
  { "─", "Normal" },
  { "└", "Normal" },
  { "│", "Normal" },
}

---@return string # Mapping: mode sig -> name
O.ViModes = {
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

---@return string # Icon
O.Icons = {
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
    hint = " ",
  },
  lock = "",
  touched = "●",
  recording = "",
  kinds = {
    Array = " ",
    Boolean = "󰨙 ",
    Class = " ",
    Codeium = "󰘦 ",
    Color = " ",
    Control = " ",
    Collapsed = " ",
    Constant = "󰏿 ",
    Constructor = " ",
    Copilot = " ",
    Enum = " ",
    EnumMember = " ",
    Event = " ",
    Field = " ",
    File = " ",
    Folder = " ",
    Function = "󰊕 ",
    Interface = " ",
    Key = " ",
    Keyword = " ",
    Method = "󰊕 ",
    Module = " ",
    Namespace = "󰦮 ",
    Null = " ",
    Number = "󰎠 ",
    Object = " ",
    Operator = " ",
    Package = " ",
    Property = " ",
    Reference = " ",
    Snippet = " ",
    String = " ",
    Struct = "󰆼 ",
    TabNine = "󰏚 ",
    Text = " ",
    TypeParameter = " ",
    Unit = " ",
    Value = " ",
    Variable = "󰀫 ",
  },
}

return O
