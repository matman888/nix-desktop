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
     update = " cd ~/nix-config && nix flake update && sudo nixos-rebuild switch --impure --flake .";
     rebuild = "sudo nixos-rebuild switch --impure --flake .";
   };
  };
}
