hl.window_rule({ match = { class = "Alacritty", }, tag = "opacity", })
hl.window_rule({ match = { tag = "opacity", }, opacity = "0.95 0.9", })

hl.workspace_rule({ workspace = "w[t1]m[DP-1]", layout_opts = { orientation = "center" }, })

hl.layer_rule({ match = { namespace = "notifications", }, no_anim = 1, })
hl.layer_rule({ match = { namespace = "hyprpicker", }, no_anim = 1, })
