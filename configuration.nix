{ config, pkgs, lib, ... }:

{
  imports = [ <nixpkgs/nixos/modules/installer/virtualbox-demo.nix> ];

  # Let demo build as a trusted user.
# nix.settings.trusted-users = [ "demo" ];

# Mount a VirtualBox shared folder.
# This is configurable in the VirtualBox menu at
# Machine / Settings / Shared Folders.
# fileSystems."/mnt" = {
#   fsType = "vboxsf";
#   device = "nameofdevicetomount";
#   options = [ "rw" ];
# };

console.useXkbConfig = true; 
environment.pathsToLink = ["/libexec"];

# services.xserver.desktopManager.plasma5.enable = lib.mkForce false;
# services.xserver.displayManager.sddm.enable = lib.mkForce false;

# services.xserver.windowManager.xmonad = {
#    enable = true;
#    enableContribAndExtras = true;
#    config = builtins.readFile ./xmonad.hs;
#  };

# Enable GDM/GNOME by uncommenting above two lines and two lines below.
# services.xserver.displayManager.gdm.enable = true;
# services.xserver.desktopManager.gnome.enable = true;

# Set your time zone.
# time.timeZone = "Europe/Amsterdam";

# List packages installed in system profile. To search, run:
# \$ nix search wget
environment.systemPackages = with pkgs; [
  wget (import ./vim.nix) screen sakura chromium git terminator kitty
];

environment.variables = {
  TERMINAL = "sakura";
};  

programs.zsh.enable = true;
users.defaultUserShell = pkgs.zsh;
programs.zsh.interactiveShellInit =  builtins.readFile ./zshrc;
programs.sway.enable = true;
programs.zsh.promptInit="";

# Enable the OpenSSH daemon.
services.openssh.enable = true;

# By default, the NixOS VirtualBox demo image includes SDDM and Plasma.
# If you prefer another desktop manager or display manager, you may want
# to disable the default.
services.xserver = {
  enable = true;
  layout = "gb";
  desktopManager = {
    xterm.enable = false;
    plasma5.enable = lib.mkForce false;
  };
  displayManager = {
    defaultSession = "none+i3";
    sddm.enable = lib.mkForce false;
  };
  windowManager.i3 = {
    enable = true;
    extraPackages = with pkgs; [dmenu i3status i3lock i3blocks];
    configFile = "/etc/i3.conf";
  };
};
environment.etc."i3.conf".text = pkgs.callPackage ./i3-config.nix {};

nixpkgs.config = { 
  allowUnfree = true;
};

fonts.fonts = with pkgs; [
  noto-fonts
  noto-fonts-cjk
  noto-fonts-emoji
  liberation_ttf
  fira-code
  fira-code-symbols
  mplus-outline-fonts.githubRelease
  dina-font
  proggyfonts
]; 

}
 
