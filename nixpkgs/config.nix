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

  # sixv
  home.file.".config/sxiv/exec/key-handler".text = ''
  #!/bin/sh
  while read file
  do
          case "$1" in
          "C-d")
                   rm "$file";;
          "C-c")
                  echo -n "$file" | xclip -selection clipboard ;;
          esac
  done
  '';

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
    
    settings = {
      color256 = true;
      icons = true;
    };
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
