
cd ~/nix-config/
nix flake update
if sudo nixos-rebuild switch --flake .#$(< env)
then
git add .
git commit -m "A new update"
git push origin
fi
