{ config, pkgs, inputs, lib, ... }:

{
hardware.graphics.enable = true;
  services.xserver.videoDrivers = [ "nvidia" ];
  hardware.nvidia.open = true;  # see the note above

}
