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
  measuredBoot = {
     enable = true;
     pcrs = [ 0 1 2 3 4 7 ];
   };
 };
boot.initrd.systemd.enable = true;
}
