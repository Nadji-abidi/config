{ config, pkgs, ... }:

{
  # Home Manager needs a bit of information about you and the
  # paths it should manage.
  home.username = "cargo";
  home.homeDirectory = "/home/cargo";

  # You can update Home Manager without changing this value. See
  # the Home Manager release notes for a list of state version
  # changes in each release.
  home.stateVersion = "22.05";

  # Let Home Manager install and manage itself.
  programs.home-manager.enable = true;
  nixpkgs.config.allowUnfree = true;

  imports = [ 
    ./aliases.nix
    ./config.nix
  ];

  # Programs List
  services.picom.enable = true;
  services.xidlehook.enable = true;
  programs.bash.enable = true;
  programs.alacritty.enable = true;
  programs.neovim.enable = true;
  programs.lf.enable = true;


  home.packages = with pkgs; [

    # System
    bat # A cat(1) clone with syntax highlighting and Git integration
    rofi # Window switcher, run dialog and dmenu replacement
    neofetch # A fast, highly customizable system info script
    polybar # A fast and easy-to-use tool for creating status bars
    
    # Programming
    rustup # The Rust toolchain installer
    vscodium # Open source source code editor
    
    # File Manger
    android-file-transfer # Reliable MTP client with minimalistic UI

    # Media
    mpv # General-purpose media player
    sxiv # Simple X Image Viewer
    feh # A light-weight image viewer

    # Archive
    zip # Compressor/archiver for creating and modifying zipfiles
    unzip # An extraction utility for archives compressed in .zip format
    gzip # GNU zip compression program
    bzip2 # High-quality data compression program
    unrar # Utility for RAR archives

    # Tools
    jq # A lightweight and flexible command-line JSON processor

    # Wireless
    airgeddon # Multi-use TUI to audit wireless networks. 
    aircrack-ng # Wireless encryption cracking tools
    mdk4 # A tool that injects data into wireless networks
    hcxtools # Tools for capturing wlan traffic and conversion to hashcat and John the Ripper formats

  ];
}
