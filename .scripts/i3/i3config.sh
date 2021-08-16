#!/bin/sh

# Courtesy to https://www.unixsheikh.com/tutorials/how-you-can-manage-the-i3-window-manager-on-multiple-computers.html

# This script generates the i3 config file (v4)

# Apps
menu="rofi -modi drun,run -show drun"
terminal="alacritty"
browser="firefox"
painter="gimp"
screenshot="flameshot gui"

# Colors
gray="#70727f"
light_Gray="bab9c2"
blue_purple="#495c97"
purple="#a6a8d9"
light_purple="#d6afb4"
dark_pink="#d6afb4"
pink="#efd7d1"

red="#ff0000"
white="#ffffff"
black="#000000"

# Settings
ws1="1"
ws2="2"
ws3="3" 
ws4="4"
ws5="5"
ws6="6"
ws7="7"
ws8="8"
ws9="9"
ws10="10"
ws1app="Alacritty"
ws2app="firefox"
ws3app="Spotify"
ws4app="discord"
gaps_inner=10
gaps_outer=0

cfg_file="$HOME/.config/i3/config"

# Get hostname
hostname=$HOSTNAME

# Conditional variables
use_gaps=true

# If i3 config dir exists, clean it. Otherwise create it. 
if [ -d "$HOME/.config/i3" ]; then
    rm -f $HOME/.config/i3/*
else
    mkdir -pv $HOME/.config/i3
fi

# Config options
options="# i3 config\n"

options="${options}set \$mod Mod4\n"
options="${options}font pango:Source Code Pro 8\n"

# Use xss-lock to grab a logind suspend inhibit lock. i3lock locks screen before suspend
# options="${options}exec --no-startup-id xss-lock --transfer-sleep-lock --i3lock --nofork\n"

# Use Mouse+$mod to drag floating windows to their wanted position
options="${options}floating_modifier \$mod\n"

# Enable focus following the mouse
options="${options}focus_follows_mouse yes\n"

# Kill focused window
options="${options}bindsym \$mod+Shift+q kill\n"

# Change focus
options="${options}bindsym \$mod+h focus left\n"
options="${options}bindsym \$mod+j focus down\n"
options="${options}bindsym \$mod+k focus up\n"
options="${options}bindsym \$mod+l focus right\n"

# Change focus with arrow keys
options="${options}bindsym \$mod+Left focus left\n"
options="${options}bindsym \$mod+Down focus down\n"
options="${options}bindsym \$mod+Up focus up\n"
options="${options}bindsym \$mod+Right focus right\n"

# Move focused window
options="${options}bindsym \$mod+Shift+h move left\n"
options="${options}bindsym \$mod+Shift+j move down\n"
options="${options}bindsym \$mod+Shift+k move up\n"
options="${options}bindsym \$mod+Shift+l move right\n"

# Move focused window with arrow keys
options="${options}bindsym \$mod+Shift+Left move left\n"
options="${options}bindsym \$mod+Shift+Down move down\n"
options="${options}bindsym \$mod+Shift+Up move up\n"
options="${options}bindsym \$mod+Shift+Right move right\n"

# Split in horizontal orientation
options="${options}bindsym \$mod+Shift+v split h\n"

# Split in vertical orientation
options="${options}bindsym \$mod+v split v\n"

# Enter fullscreen mode for the focused container
options="${options}bindsym \$mod+Shift+f fullscreen toggle\n"

# Change container layout (stacked, tabbed, toggle split)
options="${options}bindsym \$mod+s layout stacking\n"
options="${options}bindsym \$mod+t layout tabbed\n"
options="${options}bindsym \$mod+e layout toggle split\n"

# Toggle tiling / floating
options="${options}bindsym \$mod+Shift+space floating toggle\n"

# Change focus between tiling / floating windows
options="${options}bindsym \$mod+space focus mode_toggle\n"

# Focus the parent container
# options="${options}bindsym \$mod+a focus parent\n"

# Focus the child container
# options="${options}bindsym \$mod+d focus child\n"

# Jump to the latest "urgent" window
options="${options}bindsym \$mod+z [urgent=latest] focus\n"

# Reload the configuration file
options="${options}bindsym \$mod+Shift+c reload\n"

# Restart i3 inplace (preserves your layout/session, can be used to upgrade i3)
options="${options}bindsym \$mod+Shift+r restart\n"

# Log out session
options="${options}bindsym \$mod+Shift+e exec \"i3-nagbar -t warning -m 'You pressed the exit shortcut. Do you really want to exit i3? This will end your X session.' -B 'Yes, exit i3' 'i3-msg exit'\"\n"

# Lock session
options="${options}bindsym \$mod+Shift+x exec i3lock\n"

# Resize window (you can also use the mouse for that)
options="${options}mode resize {\n"
options="${options}    bindsym h resize shrink width 10 px or 10 ppt\n"
options="${options}    bindsym j resize grow height 10 px or 10 ppt\n"
options="${options}    bindsym k resize shrink height 10 px or 10 ppt\n"
options="${options}    bindsym l resize grow width 10 px or 10 ppt\n"

options="${options}    bindsym Left resize shrink width 10 px or 10 ppt\n"
options="${options}    bindsym Down resize grow height 10 px or 10 ppt\n"
options="${options}    bindsym Up resize shrink height 10 px or 10 ppt\n"
options="${options}    bindsym Right resize grow width 10 px or 10 ppt\n"

# Back to normal: Enter or Escape
options="${options}    bindsym Return mode \"default\"\n"
options="${options}    bindsym Escape mode \"default\"\n"
options="${options}    bindsym \$mod+r mode \"default\"\n"
options="${options}}\n"

# Window resize mode
options="${options}bindsym \$mod+r mode resize\n"

# Switch to workspace
options="${options}bindsym \$mod+1 workspace $ws1\n"
options="${options}bindsym \$mod+2 workspace $ws2\n"
options="${options}bindsym \$mod+3 workspace $ws3\n"
options="${options}bindsym \$mod+4 workspace $ws4\n"
options="${options}bindsym \$mod+5 workspace $ws5\n"
options="${options}bindsym \$mod+6 workspace $ws6\n"
options="${options}bindsym \$mod+7 workspace $ws7\n"
options="${options}bindsym \$mod+8 workspace $ws8\n"
options="${options}bindsym \$mod+9 workspace $ws9\n"
options="${options}bindsym \$mod+0 workspace $ws10\n"

# Move focused container to workspace
options="${options}bindsym \$mod+Shift+1 move container to workspace $ws1\n"
options="${options}bindsym \$mod+Shift+2 move container to workspace $ws2\n"
options="${options}bindsym \$mod+Shift+3 move container to workspace $ws3\n"
options="${options}bindsym \$mod+Shift+4 move container to workspace $ws4\n"
options="${options}bindsym \$mod+Shift+5 move container to workspace $ws5\n"
options="${options}bindsym \$mod+Shift+6 move container to workspace $ws6\n"
options="${options}bindsym \$mod+Shift+7 move container to workspace $ws7\n"
options="${options}bindsym \$mod+Shift+8 move container to workspace $ws8\n"
options="${options}bindsym \$mod+Shift+9 move container to workspace $ws9\n"
options="${options}bindsym \$mod+Shift+0 move container to workspace $ws10\n"

# Assign applications to workspaces
options="${options}assign [class=\"$ws1app\"] $ws1\n"
options="${options}assign [class=\"$ws2app\"] $ws2\n"
options="${options}for_window [class=\"$ws3app\"] move to workspace $ws3\n" # Spotify
options="${options}assign [class=\"$ws4app\"] $ws4\n"

# Running with i3-gaps
if [ $use_gaps ]; then
    options="${options}gaps inner $gaps_inner\n"
    options="${options}gaps outer $gaps_outer\n"
fi

# Disable title bars & border size
options="${options}for_window [class=\"^.*\"] border pixel 2\n"

# Float specific applications
# options="${options}for_window [class=\"<App Class>\"] floating enable\n"

# Float pop-up windows
options="${options}for_window [window_role=\"pop-up\"] floating enable\n"
options="${options}for_window [window_role=\"bubble\"] floating enable\n"
options="${options}for_window [window_role=\"task_dialog\"] floating enable\n"
options="${options}for_window [window_role=\"Preferences\"] floating enable\n"
options="${options}for_window [window_type=\"dialog\"] floating enable\n"
options="${options}for_window [window_type=\"menu\"] floating enable\n"

# Hide borders
# options="${options}hide_edge_borders both\n"

# Window colors
# <class> <borders> <bg> <text> <indicator> <child_borders>
options="${options}client.unfocused $blue_purple $blue_purple $white $blue_purple\n"
options="${options}client.focused_inactive $purple $purple $white $blue_purple\n"
options="${options}client.focused $purple $purple $white $purple\n"
options="${options}client.urgent $red $red $white $purple\n"

# Host-specific settings
if [ "$hostname" == "iZArchVM" ]; then
    # Mount shared folder
    # sharedfolder="Shared"
    # options="${options}exec sudo mount -t vboxsf -o gid=1000,uid=1000 $sharedfolder /mnt/shared\n"
    
    # Set screen resolution to 1280x720 (available resolutions with $ xrandr -d :0)
    options="${options}exec_always xrandr --output Virtual1 --mode 1280x720\n"
   
    # Use pactl to adjust volume in pulseaudio 
    options="${options}bindsym F12 exec --no-startup-id pactl set-sink-volume @DEFAULT_SINK@ +10%%\n" 
    options="${options}bindsym F11 exec --no-startup-id pactl set-sink-volume @DEFAULT_SINK@ -10%%\n" 
    options="${options}bindsym F10 exec --no-startup-id pactl set-sink-mute @DEFAULT_SINK@ toggle\n"
 
    # Use playerctl for player controls
    options="${options}bindsym F7 exec playerctl previous\n"
    options="${options}bindsym F8 exec playerctl play-pause\n"
    options="${options}bindsym F9 exec playerctl next\n"

    # Start picom
    options="${options}exec_always picom -CGb\n"
fi
if [ "$hostname" == "iZArchG14" ]; then
  # Use pactl to adjust volume in pulseaudio
    options="${options}bindsym XF86AudioRaiseVolume exec --no-startup-id pamixer -i 5\n" # [Vol Up Key]
    options="${options}bindsym XF86AudioLowerVolume exec --no-startup-id pamixer -d 5\n" # [Vol Down Key]
    options="${options}bindsym XF86AudioMute exec --no-startup-id pamixer -t\n" # [Fn+F1]
    options="${options}bindsym XF86AudioMicMute exec bash $HOME/.scripts/i3/$hostname/mic.sh\n" # [Mic Mute Key]
  
    # Use playerctl for player controls
    options="${options}bindsym XF86AudioPrev exec playerctl previous\n" # [Fn+F2]
    options="${options}bindsym XF86AudioPlay exec playerctl play-pause\n" # [Fn+F3]
    options="${options}bindsym XF86AudioNext exec playerctl next\n" #[Fn+F4]
  
    # Use asusctl to cycle fan profiles
    options="${options}bindsym XF86Launch4 exec sudo asusctl profile -n\n" # [Fn+F5]
  
    # Use brightnessctl to adjust screen brightness
    options="${options}bindsym XF86MonBrightnessUp exec brightnessctl set +5%%\n" # [Fn+F7]
    options="${options}bindsym XF86MonBrightnessDown exec brightnessctl set 5%%-\n" # [Fn+F8]
  
    # Use brightnessctl to adjust keyboard brightness
    options="${options}bindsym XF86KbdBrightnessUp exec brightnexxctl -d asus::kbd_backlight set +1\n" # [Fn+Up]
    options="${options}bindsym XF86KbdBrightnessDown exec brightnessctl -d asus::kbd_backlight set 1-\n" # [Fn+Down]

    # Use xinput to toggle touchpad
    options="${options}bindsym XF86TouchpadToggle exec back $HOME/.scripts/i3/$hostname/touchpad.sh\n" # [Fn+F10]
 
    # Unused keybinds 
    options="${options}bindsym \$mod+p exec <app>\n" # [Fn+F9]
    options="${options}bindsym XF86Launch1 exec <app>\n" # [ROG Key]

    # Start picom with experimental backends
    options="${options}exec_always picom --experimental-backends\n"
fi

# Application keybinds
options="${options}bindsym \$mod+d exec \"$menu\"\n"
options="${options}bindsym \$mod+Return exec $terminal\n"
options="${options}bindsym \$mod+f exec $browser\n"
options="${options}bindsym \$mod+g exec $painter\n"
options="${options}bindsym \$mod+shift+s exec $screenshot\n"

# Startup commands
# Set wallpaper on startup
options="${options}exec_always feh --bg-scale $HOME/Pictures/wallpapers/wallpaper.png\n"
# Start polybar
options="${options}exec_always --no-startup-id bash $HOME/.scripts/polybar/launch.sh\n"
# Start fcitx
options="${options}exec --no-startup-id fcitx5 -d\n"

# Create and write to config file
printf "$options%s" > "$cfg_file" # Invalid format errors are caused by stray % (indicator) signs. make them %%.

if [ -f "$cfg_file" ]; then
    echo "Created i3 config file"
else
    echo "Could not write config file"
fi
