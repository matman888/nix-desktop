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
};

  outputs = { self, nixpkgs , home-manager , ... } @ inputs:
  
{
  nixosConfigurations.nixos = nixpkgs.lib.nixosSystem {
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
             };
          }
      ];
    };
  };
}
