{ pkgs, ... }:

# Programs Configuration
{
  # Picom
  services.picom.vSync = true;

  # Alacritty
  programs.alacritty.settings.font.size = 10;

  # Bash
  programs.bash = {
    historyFileSize = 1000;
    historyIgnore = [ "exit" "clear" "c" "cd" "ll" "poweroff" "reboot" "ls" "history" ];
    historyControl = [ "erasedups" "ignoredups" "ignorespace" ];
  };

  # Lf
  programs.lf = {
    previewer.source = pkgs.writeShellScript "pv.sh" ''
    #!/bin/sh

    case "$1" in
        *.tar*) tar tf "$1";;
        *.zip) unzip -l "$1";;
        *.rar) unrar l "$1";;
        *) bat "$1";;
    esac
    '';
  };
    
  # XidleHook
  services.xidlehook = {
    not-when-audio = true;
    not-when-fullscreen = true;
    timers = [
      {
        delay = 1800;
	command = "systemctl suspend";
      }
    ];
  };
}
