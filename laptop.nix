{ config, input, pkgs, ...}:
{
environment.systemPackages= [
pkgs.sbctl
pkgs.koreader
];
boot.lanzaboote = {
  enable=true;
  configurationLimit = 8;
  pkiBundle = "/var/lib/sbctl";
  autoGenerateKeys.enable = true;
  autoEnrollKeys = {
      includeMicrosoftKeys = false;
      allowBrickingMyMachine = true;
      enable = true;
    };
  measuredBoot = {
     enable = true;
     pcrs = [ 0 4 7];
   };
 };
boot.initrd.systemd.enable = true;
}
