
import os
import subprocess
from libqtile import bar, layout, qtile, widget
from libqtile.config import Click, Drag, Group, Key, Match, Screen
from libqtile.lazy import lazy
from libqtile.utils import guess_terminal
from libqtile import hook

@hook.subscribe.startup_once
def autostart():
    home = os.path.expanduser('~/.config/qtile/autostart.sh')
    subprocess.Popen([home])

colors = []
cache='/home/thegassyninja/.cache/wal/colors'
def load_colors(cache):
    with open(cache, 'r') as file:
        for i in range(8):
            colors.append(file.readline().strip())
    colors.append('#ffffff')
    lazy.reload()
load_colors(cache)


mod = "mod4"
terminal = guess_terminal()
floaterm = "tdrop -am -w 80% -h 65% -x 10% -y 20% -n 0 kitty --class FLOATERM"
ranger = "tdrop -am -w 80% -h 65% -x 10% -y 20% -n 1 kitty --class RANGER --hold sh -c 'ranger'"
lazygit = "tdrop -am -w 80% -h 65% -x 10% -y 20% -n 2 kitty --class LAZYGIT --hold sh -c 'lazy-git.sh'"
themes = "/home/thegassyninja/.config/qtile/Scripts/wal-themes.sh"
Scrnshot = "escrotum"

keys = [
        Key([mod], "b", lazy.hide_show_bar(), desc="Toggle bar"),
        Key([mod], "w", lazy.spawn(themes), desc="pywal-default-selector"),
        Key([], "Print", lazy.spawn(Scrnshot), desc="Launch Floaterm(Tdrop)"),
        Key([mod], "r", lazy.spawn("rofi -show drun")),

        Key([mod], "KP_End", lazy.spawn(floaterm), desc="Launch Floaterm(Tdrop)"),
        Key([mod], "KP_Down", lazy.spawn(ranger), desc="Launch Ranger(Tdrop)"),
        Key([mod], "KP_Next", lazy.spawn(lazygit), desc="Launch LazyGit(Tdrop)"),

        Key([], "XF86AudioMute", lazy.spawn("pactl set-sink-mute 0 toggle")),
        Key([], "XF86AudioPlay", lazy.spawn("playerctl play-pause")),
        Key([], "XF86AudioNext", lazy.spawn("playerctl --player spotify_player next")),
        Key([], "XF86AudioPrev", lazy.spawn("playerctl --player spotify_player previous")),
        Key([], "XF86AudioRaiseVolume", lazy.spawn("pactl set-sink-volume 0 +10%")),
        Key([], "XF86AudioLowerVolume", lazy.spawn("pactl set-sink-volume 0 -5%")),
    
    Key([mod], "h", lazy.layout.left(), desc="Move focus to left"),
    Key([mod], "l", lazy.layout.right(), desc="Move focus to right"),
    Key([mod], "j", lazy.layout.down(), desc="Move focus down"),
    Key([mod], "k", lazy.layout.up(), desc="Move focus up"),
    Key([mod], "space", lazy.layout.next(), desc="Move window focus to other window"),
    
    Key([mod, "shift"], "h", lazy.layout.shuffle_left(), desc="Move window to the left"),
    Key([mod, "shift"], "l", lazy.layout.shuffle_right(), desc="Move window to the right"),
    Key([mod, "shift"], "j", lazy.layout.shuffle_down(), desc="Move window down"),
    Key([mod, "shift"], "k", lazy.layout.shuffle_up(), desc="Move window up"),
    
    Key([mod, "control"], "h", lazy.layout.grow_left(), desc="Grow window to the left"),
    Key([mod, "control"], "l", lazy.layout.grow_right(), desc="Grow window to the right"),
    Key([mod, "control"], "j", lazy.layout.grow_down(), desc="Grow window down"),
    Key([mod, "control"], "k", lazy.layout.grow_up(), desc="Grow window up"),
    Key([mod], "n", lazy.layout.normalize(), desc="Reset all window sizes"),
    
    Key(
        [mod, "shift"], "Return", lazy.layout.toggle_split(), desc="Toggle between split and unsplit sides of stack",),
    Key([mod], "Return", lazy.spawn(terminal), desc="Launch terminal"),
    # Toggle between different layouts as defined below
    Key([mod], "Tab", lazy.next_layout(), desc="Toggle between layouts"),
    Key([mod], "c", lazy.window.kill(), desc="Kill focused window"),
    Key(
        [mod],
        "f",
        lazy.window.toggle_fullscreen(),
        desc="Toggle fullscreen on the focused window",
    ),
    Key([mod], "t", lazy.window.toggle_floating(), desc="Toggle floating on the focused window"),
    Key([mod, "control"], "r", lazy.reload_config(), desc="Reload the config"),
    Key([mod, "control"], "q", lazy.shutdown(), desc="Shutdown Qtile"),
]

for vt in range(1, 8):
    keys.append(
        Key(
            ["control", "mod1"],
            f"f{vt}",
            lazy.core.change_vt(vt).when(func=lambda: qtile.core.name == "wayland"),
            desc=f"Switch to VT{vt}",
        )
    )


groups = [Group(i) for i in "123456789"]

for i in groups:
    keys.extend(
        [
            Key(
                [mod],
                i.name,
                lazy.group[i.name].toscreen(),
                desc="Switch to group {}".format(i.name),
            ),
            Key(
                [mod, "shift"],
                i.name,
                lazy.window.togroup(i.name, switch_group=True),
                desc="Switch to & move focused window to group {}".format(i.name),
            ),
        ]
    )

layouts = [
    layout.Columns(border_focus=[colors[2]],
                    border_normal=[colors[4]],  
                        border_width=4, margin=5,
                                margin_on_single=0),
    layout.Max(),
]

widget_defaults = dict(
    font="Hack Nerd Font Mono NF",
    fontsize=18,
    padding=3,
)
extension_defaults = widget_defaults.copy()

screens = [
    Screen(
        top=bar.Bar(
            [
                widget.Spacer(length=20),
                widget.WindowName(foreground=colors[3]),
                widget.Spacer(length=320),
                widget.PulseVolume(foreground=colors[3], fontsize=20),
                widget.Spacer(length=35),
                widget.Clock(format="%H:%M", foreground=colors[5], fontsize=30),
                widget.Spacer(length=150),
                widget.MemoryGraph(foreground=colors[3], graph_color=colors[5], type='linefill', border_width=0),
                widget.Spacer(length=25),
                widget.CPUGraph(foreground=colors[3], graph_color=colors[5], type='linefill', border_width=0),
                widget.Spacer(length=25),
                widget.BatteryIcon(scale=1.75),
                widget.Spacer(length=10),
            ],
            32,
            background=colors[0],
            opacity=0.7,
            border_width=2,
            border_color=colors[3],
            margin=[4, 8, 2, 8],
        ),
    ),
]

mouse = [
    Drag([mod], "Button1", lazy.window.set_position_floating(), start=lazy.window.get_position()),
    Drag([mod], "Button3", lazy.window.set_size_floating(), start=lazy.window.get_size()),
    Click([mod], "Button2", lazy.window.bring_to_front()),
]

dgroups_key_binder = None
dgroups_app_rules = []  # type: list
follow_mouse_focus = True
bring_front_click = False
floats_kept_above = True
cursor_warp = False
floating_layout = layout.Floating(border_width=3, border_focus=colors[3], border_normal=colors[4], 
    float_rules=[
        *layout.Floating.default_float_rules,
       Match(wm_class="RANGER"),  # SSH-Term
        Match(wm_class="FLOATERM"),  # SSH-Term
        Match(wm_class="LAZYGIT"),  # SSH-Term
        Match(wm_class="confirmreset"),  # gitk
        Match(wm_class="makebranch"),  # gitk
        Match(wm_class="maketag"),  # gitk
        Match(wm_class="ssh-askpass"),  # ssh-askpass
        Match(title="branchdialog"),  # gitk
        Match(title="pinentry"),  # GPG key password entry
    ]
)
auto_fullscreen = True
focus_on_window_activation = "smart"
reconfigure_screens = True

auto_minimize = True

wl_input_rules = None

wmname = "LG3D"
