{ config, lib, pkgs, inputs, ... }:
{
     hardware.graphics.enable = true;
     services.xserver.videoDrivers = [ "nvidia" ];
     hardware.nvidia.open = true;  # see the note above
     services.displayManager = {
     autoLogin = {
       enable=true;
       user= "matteo";
    };
 };


}

