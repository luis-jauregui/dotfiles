
from libqtile.config import Key
from libqtile.command import lazy

mod = "mod4"
myTerm = "alacritty"

keys = [Key(key[0], key[1], *key[2:]) for key in [

    # ------------ Window Configs ------------

    # Switch between windows in current stack pane
    ([mod], "j", lazy.layout.down()),
    ([mod], "k", lazy.layout.up()),
    ([mod], "h", lazy.layout.left()),
    ([mod], "l", lazy.layout.right()),

    # Change window sizes (MonadTall)
    ([mod, "shift"], "l", lazy.layout.grow()),
    ([mod, "shift"], "h", lazy.layout.shrink()),

    # Toggle floating
    ([mod, "shift"], "f", lazy.window.toggle_floating()),

    # Move windows up or down in current stack
    ([mod, "shift"], "j", lazy.layout.shuffle_down()),
    ([mod, "shift"], "k", lazy.layout.shuffle_up()),

    # Toggle between different layouts as defined below
    ([mod], "Tab", lazy.next_layout()),
    ([mod, "shift"], "Tab", lazy.prev_layout()),

    # Kill window
    ([mod], "w", lazy.window.kill()),

    # Switch focus of monitors
    ([mod], "period", lazy.next_screen()),
    ([mod], "comma", lazy.prev_screen()),

    # Restart Qtile
    ([mod, "control"], "r", lazy.restart()),
    ([mod, "control"], "q", lazy.shutdown()),
    

    # ------------ APLICACIONES ------------

    # Menu

    ([mod], "m", lazy.spawn("rofi -show drun")),
    ([mod, 'shift'], "m", lazy.spawn("rofi -show")),

    # Browser

    ([mod], "b", lazy.spawn("firefox")),

    # File Manager

    ([mod], "e", lazy.spawn("thunar")),
    ([mod], "r", lazy.spawn(myTerm + " -e ranger")),

    # Terminal

    ([mod], "Return", lazy.spawn(myTerm)),

    # Redshift

    ([mod], "s", lazy.spawn("redshift -O 4400")),
    ([mod, "shift"], "s", lazy.spawn("redshift -x")),

    # ------------ SPOTIFY ------------  

    ([mod], "space", lazy.spawn("playerctl --player=spotify play-pause")),
    ([mod], "Right", lazy.spawn("playerctl next")),
    ([mod], "Left",  lazy.spawn("playerctl previous")),

    # ------------ FIREFOX------------

    #Intro
    ([mod], "KP_Enter" , lazy.spawn("firefox google.com")),
    #0
    ([mod], "KP_Insert", lazy.spawn("firefox --private-window")),
    #1
    ([mod], "KP_End",    lazy.spawn("firefox facebook.com")),
    #2
    ([mod], "KP_Down",   lazy.spawn("firefox youtube.com")),
    #3
    ([mod], "KP_Next",   lazy.spawn("firefox twitch.tv/diealis")),
    #4
    ([mod], "KP_Left",   lazy.spawn("firefox github.com")),
    #6
    ([mod], "KP_Right",  lazy.spawn("firefox crunchyroll.com")),
    #7
    ([mod], "KP_Home",   lazy.spawn("firefox web.whatsapp.com")),
    #8
    ([mod], "KP_Up",     lazy.spawn("firefox mastermind.ac")),
    #9
    
    
    # ------------ SISTEMA ------------ 
    
    ([mod, "shift", "control"], "F12", lazy.spawn("systemctl suspend")),
    ([mod, "shift", "control"], "F11", lazy.spawn("reboot")),
    ([mod, "shift", "control"], "F10", lazy.spawn("poweroff")),
    ([], "Print", lazy.spawn("scrot -e  'mv $f /home/luis/.screenshots/'")),

    # ------------ VOLUMEN ------------ 
    
    ([mod], "KP_Subtract", lazy.spawn(
    "pactl set-sink-volume @DEFAULT_SINK@ -5%"
    )),
    ([mod], "KP_Add", lazy.spawn(
    "pactl set-sink-volume @DEFAULT_SINK@ +5%"
    )),
    ([mod], "KP_Multiply", lazy.spawn(
    "pactl set-sink-mute @DEFAULT_SINK@ toggle"
    )),
    
]]