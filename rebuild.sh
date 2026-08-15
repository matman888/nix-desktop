
cd ~/nix-config/
if sudo nixos-rebuild switch --impure --flake .
then
git add .
git commit -m "A new config"
git push origin
fi
