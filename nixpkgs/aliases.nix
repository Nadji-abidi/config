{
  # Bash Aliases
  home.shellAliases = {
    ls  = "ls -F --color=auto";
    ll  = "ls -lH";
    la  = "ls -a";
    lla = "ls -al";
    l   = "ls -CF";
    c   = "clear";
    ".."   = "cd ..";
    "..."  = "cd ../..";
    "...." = "cd ../../..";
    disk = "doas du -sch /";
    v = "nvim";
    rd = "bat";
    gc = "git clone";
    sudo = "doas";
    randwall = "feh --bg-fill --randomize";
  };

}
