{ pkgs, lib, ... }:

{
  xsession.windowManager.i3 = {
    enable = true;
    package = pkgs.i3-gaps;

    config = rec {
      modifier = "Mod4";

      bars = [
        {
          statusCommand = "i3status";
          position = "top";
          trayOutput = "primary";
          font = "pango:monospace 8";
        }
      ];

      window.border = 1;
      gaps = {
        inner = 5;
        outer = 5;
      };
      smartBorders = true;

      keybindings = lib.mkOptionDefault {
        "XF86AudioRaiseVolume" = "exec --no-startup-id pactl set-sink-volume @DEFAULT_SINK@ +5% && pkill -SIGUSR1 i3status";
        "XF86AudioLowerVolume" = "exec --no-startup-id pactl set-sink-volume @DEFAULT_SINK@ -5% && pkill -SIGUSR1 i3status";
        "XF86AudioMute" = "exec --no-startup-id pactl set-sink-mute @DEFAULT_SINK@ toggle && pkill -SIGUSR1 i3status";
        "XF86AudioMicMute" = "exec --no-startup-id pactl set-source-mute @DEFAULT_SOURCE@ toggle && pkill -SIGUSR1 i3status";
        "${modifier}+Return" = "exec --no-startup-id ${pkgs.alacritty}/bin/alacritty";
        "${modifier}+f" = "exec --no-startup-id thunar";
        "${modifier}+b" = "exec --no-startup-id ${pkgs.firefox}/bin/firefox";
        "${modifier}+q" = "kill";
        "${modifier}+Print" = "exec --no-startup-id maim /users/rey/home/Pictures/screenshots/screenshot-$(date +'%H-%M-%S').png";
        "Print" = "exec --no-startup-id maim -s /users/rey/home/Pictures/screenshots/screenshot-$(date +'%H-%M-%S').png";
        "${modifier}+Shift+d" = "exec mksh /users/rey/.config/mksh/switch-display2.sh";
        "${modifier}+Shift+z" = "exec mksh /users/rey/.config/mksh/switch-display.sh";
        "F12" = "exec rofi -modi window -show window";
        "${modifier}+space" = "exec rofi -no-lazy-grab -show drun";
        "${modifier}+d" = "exec rofi -modi run -show run";
        "${modifier}+y" = "exec ${pkgs.alacritty}/bin/alacritty -e yazi";
        "${modifier}+BackSpace" = "exec lxtask";
        "${modifier}+Left" = "focus left";
        "${modifier}+Down" = "focus down";
        "${modifier}+Up" = "focus up";
        "${modifier}+Right" = "focus right";
        "${modifier}+Shift+Left" = "move left";
        "${modifier}+Shift+Down" = "move down";
        "${modifier}+Shift+Up" = "move up";
        "${modifier}+Shift+Right" = "move right";
        "${modifier}+h" = "split h";
        "${modifier}+v" = "split v";
        "${modifier}+Shift+f" = "fullscreen toggle";
        "${modifier}+s" = "layout stacking";
        "${modifier}+w" = "layout tabbed";
        "${modifier}+e" = "layout toggle split";
        "${modifier}+Tab" = "floating toggle";
        "${modifier}+Shift+space" = "focus mode_toggle";
        "${modifier}+r" = "resize";
        "${modifier}+Shift+c" = "reload";
        "${modifier}+Shift+r" = "restart";
        "${modifier}+Shift+e" = "exec 'i3-nagbar -t warning -m \"You pressed the exit shortcut. Do you really want to exit i3? This will end your X session.\" -B \"Yes, exit i3\" \"i3-msg exit\"'";
      };

      startup = [
        {
          command = "exec --no-startup-id dex --autostart --environment i3";
          always = true;
          notification = false;
        }
        {
          command = "exec --no-startup-id xss-lock --transfer-sleep-lock -- i3lock --nofork";
          always = true;
          notification = false;
        }
        {
          command = "exec --no-startup-id nm-applet";
          always = true;
          notification = false;
        }
        {
          command = "exec --no-startup-id bluetooth-applet";
          always = true;
          notification = false;
        }
        {
          command = "exec --no-startup-id blueman-manager";
          always = true;
          notification = false;
        }
        {
          command = "exec --no-startup-id nitrogen --restore";
          always = true;
          notification = false;
        }
      ];

      workspaceNames = [
        "1: PC 电脑"
        "2: Firefox 火"
        "3: Social 兑"
        "4: Video 电视"
        "5: Games 玩家"
        "6: Work 勞"
      ];

      workspaceAssignments = {
        "thunar" = "1: PC 电脑";
        "firefox" = "2: Firefox 火";
        "discord" = "3: Social 兑";
        "Discord" = "3: Social 兑";
        "telegram-desktop" = "3: Social 兑";
        "TelegramDesktop" = "3: Social 兑";
        "Telegram" = "3: Social 兑";
        "thunderbird" = "3: Social 兑";
        "Thunderbird" = "3: Social 兑";
        "mpv" = "4: Video 电视";
        "SteamTinkerLaunch-MainMenu" = "4: Video 电视";
        "steamtinkerlaunch-mainmenu" = "4: Video 电视";
        "yad" = "4: Video 电视";
        "Yad" = "4: Video 电视";
        "steam" = "5: Games 玩家";
        "Steam" = "5: Games 玩家";
        "steamwebhelper" = "5: Games 玩家";
        "Lutris" = "5: Games 玩家";
        "lutris" = "5: Games 玩家";
        "heroic" = "5: Games 玩家";
        "dolphin-emu" = "5: Games 玩家";
        "cemu" = "5: Games 玩家";
        "Cemu" = "5: Games 玩家";
        "Protontricks" = "5: Games 玩家";
        "protontricks" = "5: Games 玩家";
        "nvidia-settings" = "5: Games 玩家";
        "Nvidia-settings" = "5: Games 玩家";
        "Ryujinx" = "5: Games 玩家";
        "ryujinx" = "5: Games 玩家";
      };

      forWindow = [
        {
          class = "^.*";
          border = 0;
        }
        {
          title = "Application Finder";
          floating = true;
          resize = { width = 640; height = 480; };
        }
        {
          title = "Nitrogen";
          floating = true;
          resize = { width = 640; height = 480; };
        }
      ];
    };
  };
}

