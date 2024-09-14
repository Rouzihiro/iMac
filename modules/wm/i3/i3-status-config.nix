{ pkgs, lib, ... }:

{
  xsession.status = {
    enable = true;
    package = pkgs.i3status;

    config = ''
      general {
          output_format = "i3bar";
          colors = false;
          interval = 5;
          color_good = "#aaff00";
          color_degraded = "#00dddd";
          color_bad = "#ff8800";
          markup = "pango";
      }

      order += "volume master";
      order += "wireless _first_";
      order += "disk /";
      order += "memory";
      order += "cpu_temperature 0";
      order += "tztime localdate";
      order += "battery 1";
      order += "tztime localtime";

      volume master {
          format = "<span color='#00BFA5' size='large'> </span> <span bgcolor='#00BFA5' foreground='black'> %volume </span>";
          format_muted = "<span color='#D32F2F'> %volume</span>";
          device = "default";
          mixer = "Master";
          mixer_idx = 0;
      }

      wireless _first_ {
          format_up = "<span color='#3498DB' size='large'> </span> <span bgcolor='#3498DB' foreground='black'>%quality %essid </span>";
          format_down = "<span color='#D32F2F'>  Offline</span>";
      }

      disk "/" {
          format = "<span color='#27AE60' size='large'> </span> <span bgcolor='#27AE60' foreground='black'> %avail </span>";
          prefix_type = custom;
      }

      memory {
          format = "<span color='#8E44AD' size='large'> </span> <span bgcolor='#8E44AD' foreground='white'> %used </span>";
          threshold_degraded = "10%";
          format_degraded = "MEMORY: %free";
      }

      cpu_temperature 0 {
          format = "<span color='#D35400' size='large'>󱠇 </span> <span bgcolor='#D35400' foreground='white'> %degrees °C </span>";
          max_threshold = 50;
      }

      tztime localdate {
          format = "<span color='#F39C12' size='large'> </span> <span bgcolor='#F39C12' foreground='black'> %a %d-%m-%Y </span>";
      }

      battery 1 {
          format = "<span color='#34e0bf' size='large'>%status</span> <span bgcolor='#34e0bf' foreground='black'> %percentage </span>";
          format_down = "No battery";
          status_chr = "⚡ ";
          status_bat = " ";
          status_unk = "? UNK";
          status_full = "󰂄 FULL";
          path = "/sys/class/power_supply/BAT%d/uevent";
          low_threshold = 10;
          last_full_capacity = true;
      }

      tztime localtime {
          format = "<span color='#00dddd' size='large'>  </span><span bgcolor='#00dddd' foreground='black'> %I:%M %p </span>";
      }

      disk "/home" {
          format = "  %avail ";
          prefix_type = custom;
      }

      run_watch DHCP {
          pidfile = "/var/run/dhclient*.pid";
      }

      run_watch VPN {
          pidfile = "/var/run/vpnc/pid";
      }

      ethernet eno16777736 {
          format_up = " %ip ";
          format_down = "  ";
      }

      cpu_usage {
          format = "  %usage ";
      }

      load {
          format = "  %1min ";
          max_threshold = 5;
      }
    '';
  };
}

