
cd ~/nix-config/
git pull
nix flake update
if sudo nixos-rebuild switch --flake .#$(< env)
then
git add .
git commit -m "A new update"
git push origin
fi
