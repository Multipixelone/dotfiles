# Edit this configuration file to define what should be installed on
# your system.  Help is available in the configuration.nix(5) man page
# and in the NixOS manual (accessible by running ‘nixos-help’).

{ config, pkgs, ... }:

{
  imports =
    [ # Include the results of the hardware scan.
      ./hardware-configuration.nix
    ];

  # Use the systemd-boot EFI boot loader.
  #boot.loader.systemd-boot.enable = true;
  #boot.loader.efi.canTouchEfiVariables = true;
  #boot.loader.grub.useOSProber = true;
  boot.kernelParams = [ "intel_iommu=on" "iommu=pt" ];
  boot.loader = {
    efi = {
      canTouchEfiVariables = true;
      efiSysMountPoint = "/boot/efi"; # ← use the same mount point here.
    };
    grub = {
      efiSupport = true;
      #efiInstallAsRemovable = true; # in case canTouchEfiVariables doesn't work for your system
      device = "nodev";
      useOSProber = true;
    };
  };


  networking.hostName = "tea"; # Define your hostname.
  networking.networkmanager.enable = true;
  #networking.wireless.enable = true;  # Enables wireless support via wpa_supplicant.
    
  # Enable NVidia driver support
  #nixpkgs.config.allowUnfree = true;
  #iservices.xserver.videoDrivers = [ "nvidia" ];
  
  # Configure network proxy if necessary
  # networking.proxy.default = "http://user:password@proxy:port/";
  # networking.proxy.noProxy = "127.0.0.1,localhost,internal.domain";

  # Select internationalisation properties.
  # i18n = {
  #   consoleFont = "Lat2networking.networkmanager.enable = trui";
  #   defaultLocale = "en_US.UTF-8";
  # };

  # Set your time zone.
  time.timeZone = "America/Los_Angeles";
  


  # List packages installed in system profile. To search, run:
  # $ nix search wget
  # environment.systemPackages = with pkgs; [
  #   wget vim
  # ];

  # Some programs need SUID wrappers, can be c onfigured further or are
  # started in user sessions.
  # programs.mtr.enable = true;
  # programs.gnupg.agent = { enable = true; enableSSHSupport = true; };

  # List services that you want to enable:

  # Enable the OpenSSH daemon.
  services.openssh.enable = true;

  # Open ports in the firewall.
  # networking.firewall.allowedTCPPorts = [ ... ];
  # networking.firewall.allowedUDPPorts = [ ... ];
  # Or disable the firewall altogether.
  # networking.firewall.enable = false;

  # Enable CUPS to print documents.
  services.printing.enable = true;
  environment = {
    shells = [
      "${pkgs.fish}/bin/fish"
      "${pkgs.bash}/bin/bash"
    ];
    variables = {
      BROWSER = pkgs.lib.mkOverride 0 "firefox";
      EDITOR = pkgs.lib.mkOverride 0 "vim";
  };
    systemPackages = with pkgs; [
      # $ nix-env -qaP | grep wget to find packages

      # dev
      vim
      stow
      tmux
      tree
      screen
      git
      mosh
      fish

      python36
      dep
      ruby

      # desktop
      gnome3.gnome_terminal
      gnome3.gnome-screenshot
      gnome3.nautilus
      gnome3.eog
      gnome3.dconf
      i3lock-color
      compton
      dunst      
      feh
      polybar
      rofi
      arc-theme
      papirus-icon-theme

      # email
      mutt
      gnupg
      gnupg1compat

      # apps
      mpv
      evince
      vlc
      steam
      qbittorrent
      taskwarrior
      zscroll
 
      ncmpcpp
      screenfetch
      chromium
      firefox
      tor-browser-bundle-bin
      inkscape
      file
      wineStaging
      gnome3.file-roller
      gimp
      darktable
      
      # games
      minecraft
      steam
    ];
  };

  fonts = {
    enableCoreFonts = true;
    enableFontDir = true;
    enableGhostscriptFonts = false;
    fonts = [
       pkgs.terminus_font_ttf
       pkgs.tewi-font
       pkgs.kochi-substitute-naga10
       pkgs.source-code-pro
    ];
  };
  
  programs = {
    bash = {
      enableCompletion = true;
    };
    ssh = {
      startAgent = true;
    };
  };
  nixpkgs.config = {
    allowUnfree = true;
    packageOverrides = pkgs: rec {
      polybar = pkgs.polybar.override {
        i3GapsSupport = true;
        mpdSupport = true;
        alsaSupport = true;
        pulseSupport = true;
        nlSupport = true;
      };
    };
  };
  # Enable sound.
  sound.enable = true;
  hardware.pulseaudio.enable = true;

  # Enable the X11 windowing system.
  services.xserver = {
    enable = true;
    layout = "us";
    videoDrivers = [ "nvidia" ];
    desktopManager = {
      #sddm.enable = true;
      plasma5.enable = true;
      gnome3.enable = true;
      mate.enable = true;
    };
    windowManager = {
      i3.enable = true;
      i3.package = pkgs.i3-gaps;
    };
  };
  # services.xserver.xkbOptions = "eurosign:e";

  # Enable touchpad support.
  # services.xserver.libinput.enable = true;

  # Enable the KDE Desktop Environment.
  #services.xserver.displayManager.sddm.enable = true;
  #services.xserver.desktopManager.plasma5.enable = true;

  # Define a user account. Don't forget to set a password with ‘passwd’.
  users.users.tunnel = {
    isNormalUser = true;
    extraGroups = [ "wheel" ]; # Enable ‘sudo’ for the user.
  };

  # This value determines the NixOS release with which your system is to be
  # compatible, in order to avoid breaking some software such as database
  # servers. You should change this only after NixOS release notes say you
  # should.
  system.stateVersion = "19.03"; # Did you read the comment?

}
