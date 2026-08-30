

{ config, pkgs, inputs , ... }:

{
  imports =
    [ # Include the results of the hardware scan.
    ];

  # Bootloader.
  boot.loader.efi.canTouchEfiVariables = true;

  # Use latest kernel.
  boot.kernelPackages = pkgs.linuxPackages_latest;

  networking.hostName = "nixos"; # Define your hostname.


  # Enable networking
  networking.networkmanager.enable = true;

  # Set your time zone.
  time.timeZone = "Europe/Bucharest";

  # Select internationalisation properties.
  i18n.defaultLocale = "en_US.UTF-8";

  i18n.extraLocaleSettings = {
    LC_ADDRESS = "ro_RO.UTF-8";
    LC_IDENTIFICATION = "ro_RO.UTF-8";
    LC_MEASUREMENT = "ro_RO.UTF-8";
    LC_MONETARY = "ro_RO.UTF-8";
    LC_NAME = "ro_RO.UTF-8";
    LC_NUMERIC = "ro_RO.UTF-8";
    LC_PAPER = "ro_RO.UTF-8";
    LC_TELEPHONE = "ro_RO.UTF-8";
    LC_TIME = "ro_RO.UTF-8";
  };

  # Enable the X11 windowing system.
  # You can disable this if you're only using the Wayland session.
  services.xserver.enable = true;

  # Enable the KDE Plasma Desktop Environment.
  services.displayManager = {
  sddm.enable=true;
};
  services.desktopManager.plasma6.enable = true;
  environment.plasma6.excludePackages = with pkgs.kdePackages; [
    kwallet
   ]; 
  # Configure keymap in X11
  services.xserver.xkb = {
    layout = "us";
    variant = "";
  };

virtualisation.virtualbox.host.enable = true;
users.extraGroups.vboxusers.members = [ "matteo" ];

  # Enable CUPS to print documents.
  services.printing.enable = true;

  # Enable sound with pipewire.
  services.pulseaudio.enable = false;
  security.rtkit.enable = true;
  services.pipewire = {
    enable = true;
    alsa.enable = true;
    alsa.support32Bit = true;
    pulse.enable = true;

  };


  # Define a user account. Don't forget to set a password with ‘passwd’.
  users.users."matteo" = {
    isNormalUser = true;
    description = "matteo";
    extraGroups = [ "networkmanager" "wheel" "docker" ];
    packages = with pkgs; [
      kdePackages.kate
    #  thunderbird
    ];
  };

  # Install firefox.
#  programs.firefox.enable = true;

  # Allow unfree packages
  nixpkgs.config.allowUnfree = true;

  # List packages installed in system profile. To search, run:
  # $ nix search wget
  environment.systemPackages = with pkgs;
[
 vim
pciutils
git
wget
fastfetch
distrobox
lftp
mkvtoolnix
gcc
gnumake
mpv
qbittorrent
inputs.zen-browser.packages.${pkgs.stdenv.hostPlatform.system}.default
];

  system.stateVersion = "26.05"; # Did you read the comment?
  # Enable flatpak
  services.flatpak.enable = true;
  # Enable flakes

  nix.settings.experimental-features = ["nix-command" "flakes"];

# Install container manager
virtualisation.docker = {
  enable = true;
};

programs.localsend = {
  enable =true;
  openFirewall = true;
  };

nix.gc = {
   automatic = true;
   dates = "weekly";
   options = "--delete-older-than 10d";
  };


}
