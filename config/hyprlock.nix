{ pkgs, lib, ... }:

{
  # Add Hypridle and Hyprlock to your packages
  home.packages = with pkgs; [
    hypridle
    hyprlock
  ];

  # Configuration for Hypridle and Hyprlock
  wayland.windowManager.hyprland = {
    extraConfig = lib.concatStrings [
      ''
        # Start hypridle and hyprlock on session start
        exec-once = hypridle &
        exec-once = hyprlock &

        # Hyprlock background settings
        hyprlock {
          background {
            monitor = 0 # Set the appropriate monitor number or remove this line
            path = /dotfiles/user/wallpapers/witcher.jpg
            blur_size = 0
            blur_passes = 0
            noise = 0.0117
            contrast = 1.3000
            brightness = 0.8000
            vibrancy = 0.2100
            vibrancy_darkness = 0.0
          }

          image {
            monitor = 0 # Set the appropriate monitor number or remove this line
            path = /dotfiles/user/wallpapers/Avatar/witcher-gerald.jpg
            size = 300
            rounding = -1
            border_size = 4
            border_color = rgb(51, 204, 255)
            rotate = 0
            reload_time = -1
            position = 0, 200
            halign = center
            valign = center
          }

          label {
            monitor = 0 # Set the appropriate monitor number or remove this line
            text = cmd[update:1000] echo "<b><big> $(date +\"%I:%M %P\") </big></b>"
            font_size = 64
            font_family = "JetBrains Mono Nerd Font 10"
            shadow_passes = 3
            shadow_size = 4
            position = 0, -70
            halign = center
            valign = center
          }

          label {
            monitor = 0 # Set the appropriate monitor number or remove this line
            text = cmd[update:18000000] echo "<b> $(date +'%A, %-d %B %Y') </b>"
            font_size = 24
            font_family = "JetBrains Mono Nerd Font 10"
            position = 0, -120
            halign = center
            valign = center
          }

          input-field {
            monitor = 0 # Set the appropriate monitor number or remove this line
            size = 250, 50
            outline_thickness = 3
            dots_size = 0.26
            dots_spacing = 0.64
            dots_center = true
            fade_on_empty = true
            placeholder_text = "<i>Password...</i>"
            hide_input = false
            check_color = rgb(40, 200, 250)
            position = 0, 50
            halign = center
            valign = bottom
          }
        }
      ''
    ];
  };
}

