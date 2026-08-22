{
  description = "A very basic flake";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs?ref=nixos-unstable";
    zen-browser= {
     url = "github:youwen5/zen-browser-flake";
     inputs.nixpkgs.follows = "nixpkgs";
       };
    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
     };
    plasma-manager = {
      url = "github:nix-community/plasma-manager";
      inputs.nixpkgs.follows = "nixpkgs";
      inputs.home-manager.follows = "home-manager";
    };
    
};

  outputs = { self, nixpkgs , home-manager , plasma-manager , ... } @ inputs:
  
{
  nixosConfigurations.workstation = nixpkgs.lib.nixosSystem {
     specialArgs ={ inherit inputs; };
     system ="x86_64-linux";
        modules = [
	  ./configuration.nix
          (
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

          )
          home-manager.nixosModules.home-manager
           {
             home-manager = {
               useGlobalPkgs = true;
               useUserPackages = true;
               users.matteo = import ./home.nix;
               backupFileExtension = "backup";
               sharedModules = [ plasma-manager.homeModules.plasma-manager ];
             };
          }
      ];
    };
nixosConfigurations.laptop = nixpkgs.lib.nixosSystem {
     specialArgs ={ inherit inputs; };
     system ="x86_64-linux";
        modules = [
	  ./configuration.nix
                    home-manager.nixosModules.home-manager
             {
             home-manager = {
               useGlobalPkgs = true;
               useUserPackages = true;
               users.matteo = import ./home.nix;
               backupFileExtension = "backup";
               sharedModules = [ plasma-manager.homeModules.plasma-manager ];
             };
          }
      ];
    };

  };
}
