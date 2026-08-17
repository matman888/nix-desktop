  { config, pkgs, ...}:


{
home= {
  username = "matteo";
  homeDirectory= "/home/matteo";
  stateVersion= "26.05";
  };
programs.bash = {
  enable=true;
  shellAliases = {
     update = "bash ~/nix-config/update.sh";
     rebuild = "bash ~/nix-config/rebuild.sh";
   };
  };
programs.plasma = {
  enable = true;
  workspace = {
     lookAndFeel = "org.kde.breezedark.desktop";
   };
 };
}
