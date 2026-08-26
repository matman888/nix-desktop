{ config, input, pkgs, ...}:
{
environment.systemPackages= [
pkgs.sbctl
];
boot.lanzaboote = {
  enable=true;
  configurationLimit = 8;
  pkiBundle = "/var/lib/sbctl";
  autoGenerateKeys.enable = true;
  autoEnrollKeys.enable = true;
 };
boot.initrd.systemd.enable = true;
}
