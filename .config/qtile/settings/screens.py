from libqtile.config import Screen
from libqtile import widget
from libqtile import bar

myTerm = "alacritty"

screens = [
    Screen(
        top=bar.Bar(
            [
                widget.GroupBox(
                    foreground=["#f1ffff","#f1ffff"],
                    background=["#0f101a","#0f101a"],
                    font='UbuntuMono Nerd Font',
                    fontsize=19,
                    margin_y=3,
                    margin_x=0,
                    padding_y=8,
                    padding_x=5,
                    borderwidth=1,
                    active = ["#f1ffff","#f1ffff"],
                    inactive = ["#f1ffff","#f1ffff"],
                    rounded=False,
                    highlight_method='block',
                    this_current_screen_border = ["#a151d3" ,"#a151d3"],
                    this_screen_border = ["#5c5c5c","#5c5c5c"],
                    other_current_screen_border = ["#0f101a","#0f101a"],
                    other_screen_border = ["#0f101a","#0f101a"],
                ),
        
                widget.WindowName(
                    foreground = ["#a151d3" ,"#a151d3"],
                    background = ["#0f101a","#0f101a"],
                    fontsize = 13,
                    padding = 5,
                    font='UbuntuMono Nerd Font Bold',
                ),

                widget.TextBox(
                    text = '',
                    foreground = ["#DF5838","#DF5838"],
                    background = ["#0f101a","#0f101a"],
                    padding = 0,
                    fontsize = 45,
                    width = 17
                ),

                widget.TextBox(
                    text = " ⟳",
                    mouse_callbacks = {'Button1': lambda qtile: qtile.cmd_spawn(myTerm + ' -e sudo pacman -Syu')},
                    padding = 2,
                    foreground = ["#f1ffff","#f1ffff"],
                    background = ["#DF5838","#DF5838"],
                    fontsize = 14
                ),
                widget.Pacman(
                    update_interval = 1800,
                    foreground = ["#f1ffff","#f1ffff"],
                    background = ["#DF5838","#DF5838"],
                ),

                widget.TextBox(
                    text = '',
                    foreground = ["#FFBF00","#FFBF00"],
                    background = ["#DF5838","#DF5838"],
                    padding = 0,
                    fontsize = 45,
                    width = 17
                ),
                
                widget.TextBox(
                    text = " 🖬",
                    foreground = ["#f1ffff","#f1ffff"],
                    background = ["#FFBF00","#FFBF00"],
                    padding = 5,
                    fontsize = 20
                ),

                widget.Memory(
                    foreground = ["#f1ffff","#f1ffff"],
                    background = ["#FFBF00","#FFBF00"],
                    mouse_callbacks = {'Button1': lambda qtile: qtile.cmd_spawn(myTerm + ' -e htop')},
                    padding = 5
                ),

                widget.TextBox(
                    text = '',
                    foreground = ["#77DD77","#77DD77"],
                    background = ["#FFBF00","#FFBF00"],
                    padding = 0,
                    fontsize = 45,
                    width = 17
                ),

                widget.TextBox(
                    text = '   ',
                    mouse_callbacks = {'Button1': lambda qtile: qtile.cmd_spawn('spotify')},
                    foreground = ["#f1ffff","#f1ffff"],
                    background = ["#77DD77","#77DD77"],
                    padding = 0,
                ),

                widget.TextBox(
                    text = '  ',
                    mouse_callbacks = {'Button1': lambda qtile: qtile.cmd_spawn('playerctl previous')},
                    foreground = ["#f1ffff","#f1ffff"],
                    background = ["#77DD77","#77DD77"],
                    padding = 1
                ),

                widget.TextBox(
                    text = '懶 ',
                    mouse_callbacks = {'Button1': lambda qtile: qtile.cmd_spawn('playerctl --player=spotify play-pause')},
                    foreground = ["#f1ffff","#f1ffff"],
                    background = ["#77DD77","#77DD77"],
                    padding = 1
                ),

                widget.TextBox(
                    text = '  ',
                    mouse_callbacks = {'Button1': lambda qtile: qtile.cmd_spawn('playerctl next')},
                    foreground = ["#f1ffff","#f1ffff"],
                    background = ["#77DD77","#77DD77"],
                    padding = 1
                ),

                widget.TextBox(
                    text = '',
                    foreground = ["#F07178","#F07178"],
                    background = ["#77DD77","#77DD77"],
                    padding = 0,
                    fontsize = 45,
                    width = 17
                ),

                widget.CurrentLayoutIcon(
                    foreground = ["#0f101a","#0f101a"],
                    background = ["#F07178","#F07178"],
                    padding = 0,
                    scale=0.65
                ),
                widget.CurrentLayout(
                    foreground = ["#f1ffff","#f1ffff"],
                    background = ["#F07178","#F07178"],
                ),

                widget.TextBox(
                    text = '',
                    foreground = ["#a151d3" ,"#a151d3"],
                    background = ["#F07178","#F07178"],
                    padding = 0,
                    fontsize = 45,
                    width = 17
                ),

                widget.TextBox(
                    text = '  ',
                    foreground = ["#f1ffff","#f1ffff"],
                    background = ["#a151d3" ,"#a151d3"],
                    padding = 0,
                ),

                widget.Clock(
                    foreground = ["#f1ffff","#f1ffff"],
                    background = ["#a151d3" ,"#a151d3"],
                    format = "%A, %d" + " de " + "%B  [ %H:%M:%S ]"
                ),

                widget.TextBox(
                    text = '',
                    foreground = ["#0f101a","#0f101a"],
                    background = ["#a151d3" ,"#a151d3"],
                    padding = 0,
                    fontsize = 45,
                    width = 17
                ),

                
                widget.Systray(
                    background = ["#0f101a","#0f101a"],
                    foreground = ["#f1ffff","#f1ffff"],
                    padding = 15
                ),

                widget.Sep(
                    linewidth = 10,
                    padding = 30,
                    foreground  = ["#0f101a","#0f101a"],
                    background  = ["#0f101a","#0f101a"]
               ),

            ],
            24,
            opacity=0.80
        ),
    ),
]