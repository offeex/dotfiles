{ config, lib, pkgs, ... }:

{
  programs.waybar = {
    enable = true;
    systemd = {
      enable = true;
      target = "graphical-session.target";
    };
    style = ''
                    window#waybar {
          background-color: transparent;
          color: #c49de3;
          font-family: "CaskaydiaCove NF", monospace;
          font-size: 18px;
          font-weight: bold;
      }

      /* General styling */

      #workspaces, #clock, #battery, #language, #cpu, #memory, #disk, #backlight, #wireplumber, #network, #custom-playerctl, #custom-hyprpicker, #custom-randwall, #tray {
          background-color: #0a0a21;
          box-shadow: 0 0 3px #0a0a21;
          border-radius: 12px;
          padding: 0 10px 0 10px;
          margin: 4px 0 4px 0;
      }

      /* Positioning, shaping */

      #wireplumber, #cpu, #language, #custom-playerctl {
          margin-left: 10px;
          margin-right: 1px;
          border-top-right-radius: 0;
          border-bottom-right-radius: 0;
      }

      #memory, #custom-hyprpicker {
          margin-left: 1px;
          margin-right: 1px;
          border-radius: 0;
      }

      #backlight, #battery, #clock, #custom-randwall {
          margin-right: 10px;
          margin-left: 1px;
          border-top-left-radius: 0;
          border-bottom-left-radius: 0;
      }

      #network {
          color: #9d88e3;
          margin-right: 10px;
      }

      #tray {
          margin-left: 10px;
      }

      /* Colors */

      #workspaces button {
          padding: 0px 6px;
          border-radius: 8px;
          color: #c49de3;
          margin: 2px 0 2px 0;
      }

      #wireplumber, #backlight {
          color: #db736b;
      }

      #cpu, #memory, #battery {
          color: #f76aa9;
      }

      #language, #clock {
          color: #fe7df3;
      }

      #tray menu {
          background-color: #0a0a21;
          color: #c49de3;
          font-size: 15px;
          border-radius: 4px;
      }

      /* States */

      #workspaces button.active {
          color: #0a0a21;
          background-color: #e91b51;
      }

      #workspaces button:hover {
          background-color: #c49de3;
          color: #0a0a21;
      }

      #battery.charging {
          color: #889fe3;
      }

      #battery.warning:not(.charging) {
          color: #fa1955;
      }

      #wireplumber.muted {
          color: #a0a0a0;
      }

      /* Indents & Sizes correction */

      #workspaces {
          padding: 0 5px 0 5px;
      }

      #clock {
          margin-right: 8px;
      }

      #battery {
          padding-right: 20px;
      }

      #network {
          padding-right: 15px;
      }

      #custom-randwall {
          padding-right: 12px;
      }

      #custom-playerctl {
          padding-left: 12px;
      }
    '';
    settings = [{
      "position" = "bottom";
      "layer" = "top";

      "height" = 36;

      modules-left = [ "tray" "custom/playerctl" "custom/hyprpicker" "custom/randwall" "custom/warp" ];
      modules-center = [ "hyprland/workspaces" ];
      modules-right = [ "network" "wireplumber" "backlight" "cpu" "memory" "battery" "hyprland/language" "clock" ];

      # Modules configuration

      "clock" = {
        "format" = " {:%H:%M}";
        "tooltip" = "true";
        "tooltip-format" = "<big>{:%Y %B}</big>\n<tt><small>{calendar}</small></tt>";
        "format-alt" = " {:%d/%m}";
      };

      "hyprland/workspaces" = {
        "on-scroll-up" = "hyprctl dispatch workspace -1";
        "on-scroll-down" = "hyprctl dispatch workspace m+1";
        "format" = "{name}";
        "on-click" = "activate";
      };

      /* "custom/playerctl" = {
        "format" = "{icon}";
        "return-type" = "json";
        "max-length" = 64;
        "exec" = "playerctl -a metadata --format '{\"text\" = \"{{artist}} - {{markup_escape(title)}}\" \"tooltip\" = \"{{playerName}}\" \"alt\" = \"{{status}}\"}' -F";
        "on-click" = "playerctl play-pause";
        "on-scroll-up" = "playerctl previous";
        "on-scroll-down" = "playerctl next";
        "format-icons" = {
      "Playing" = "■";
      "Paused" = "▶";
        };
      } */

      "battery" = {
        "states" = {
          "warning" = 30;
          "critical" = 10;
        };
        "tooltip" = false;
        "format" = "{capacity}% {icon}";
        "format-plugged" = "{capacity}% ";
        "format-icons" = [ "" "" "" "" "" ];
      };

      "memory" = {
        "format" = "{}% 󰻠";
        "format-alt" = "{used}/{total} GiB 󰻠";
        "interval" = 5;
      };

      "cpu" = {
        "format" = "{usage}% 󰍛";
        "format-alt" = "{avg_frequency} GHz 󰍛";
        "interval" = 5;
      };

      "disk" = {
        "format" = "{}% 󰋊";
        "format-alt" = "{used} / {total} GiB 󰋊";
        "interval" = 5;
        "path" = "/";
      };

      "network" = {
        "format-wifi" = "{essid} 󰤨";
        "format-ethernet" = " {ifname}: Aesthetic";
        "format-linked" = " {ifname} (No IP)";
        "format-disconnected" = "󰤭";
        "format-alt" = " {ifname}: {ipaddr}/{cidr}";
        "tooltip-format" = "{essid}";
        "on-click-right" = "nm-connection-editor";
      };

      "tray" = {
        "icon-size" = 18;
        "spacing" = 8;
      };

      "backlight" = {
        "format" = "{percent}% {icon}";
        "format-icons" = [ "" "" "" "" "" "" "" "" "" ];
        "scroll-step" = 5;
      };

      "wireplumber" = {
        "format" = "{volume}% {icon}";
        "format-muted" = "󰝟";
        "format-icons" = [ "" "" "󰕾" ];
        "on-click" = "pulsemixer --toggle-mute";
        "on-click-right" = "alacritty -e pulsemixer";
        "scroll-step" = 5;
      };

      "custom/randwall" = {
        "format" = "󰏘";
        "on-click" = "bash $HOME/.config/waybar/scripts/randomwallpaper.sh";
      };

      "custom/wf-recorder" = {
        "format" = "{}";
        "interval" = "once";
        "exec" = "echo ''";
        "tooltip" = "false";
        "exec-if" = "pgrep 'wf-recorder'";
        "on-click" = "exec ./scripts/wlrecord.sh";
        "signal" = 8;
      };

      /* "custom/hyprpicker" = {
        "format" = "󰈋";
        "on-click" = "hyprpicker -a -f hex";
        "on-click-right" = "hyprpicker -a -f rgb";
      } */

      "hyprland/language" = {
        "format" = "{short}";
        "on-click" = "hyprctl switchxkblayout \"ite-tech.-inc.-ite-device(8910)-keyboard\" next";
        "on-click-right" = "hyprctl switchxkblayout \"ite-tech.-inc.-ite-device(8910)-keyboard\" prev";
      };

      "custom/warp" = {
        "format" = "WARP";
        "on-click" = "warp-cli connect";
        "on-click-right" = "warp-cli disconnect";
      };
    }];
  };
}
