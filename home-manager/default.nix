{
  pkgs,
  ...
}:
  
{

  # Import Program Configurations
  imports = [
    ./nixpkgs
    ./programs
    ./home
    ./qt
    ./gtk
    ../config/emoji.nix
    ../config/hyprland.nix
    ../config/neovim.nix
    ../config/rofi/rofi.nix
    ../config/rofi/config-emoji.nix
    ../config/rofi/config-long.nix
    ../config/swaync.nix
    ../config/waybar.nix
    ../config/wlogout.nix
  ];

  # Place Files Inside Home Directory
  home.file."Pictures/Wallpapers" = {
    source = ../config/wallpapers;
    recursive = true;
  };
  home.file.".config/fastfetch" = {
    source = ../config/fastfetch;
    recursive = true;
  };
  home.file.".config/wlogout/icons" = {
    source = ../config/wlogout;
    recursive = true;
  };
  home.file.".face.icon".source = ../config/face.jpg;
  home.file.".config/face.jpg".source = ../config/face.jpg;
  home.file.".config/swappy/config".text = ''
    [Default]
    save_dir=/home/alpa/Pictures/Screenshots
    save_filename_format=swappy-%Y%m%d-%H%M%S.png
    show_panel=false
    line_size=5
    text_size=20
    text_font=Ubuntu
    paint_mode=brush
    early_exit=true
    fill_shape=false
  '';


  # Create XDG Dirs
  xdg = {
    userDirs = {
      enable = true;
      createDirectories = true;
    };
  };

  dconf.settings = {
    "org/virt-manager/virt-manager/connections" = {
      autoconnect = [ "qemu:///system" ];
      uris = [ "qemu:///system" ];
    };
  };

  # Styling Options
  stylix.targets.waybar.enable = false;
  stylix.targets.rofi.enable = false;
  stylix.targets.hyprland.enable = false;


  # Scripts
  home.packages = [
    (import ../scripts/emopicker9000.nix { inherit pkgs; })
    (import ../scripts/task-waybar.nix { inherit pkgs; })
    (import ../scripts/squirtle.nix { inherit pkgs; })
    (import ../scripts/nvidia-offload.nix { inherit pkgs; })
    (import ../scripts/wallsetter.nix {
      inherit pkgs;
    
    })
    (import ../scripts/web-search.nix { inherit pkgs; })
    (import ../scripts/rofi-launcher.nix { inherit pkgs; })
    (import ../scripts/screenshootin.nix { inherit pkgs; })
    (import ../scripts/list-hypr-bindings.nix {
      inherit pkgs;
    })
  ];

  services = {
    hypridle = {
      settings = {
        general = {
          after_sleep_cmd = "hyprctl dispatch dpms on";
          ignore_dbus_inhibit = false;
          lock_cmd = "hyprlock";
          starship = {
            enable = true;
            package = pkgs.starship;
          };
        };
        listener = [
          {
            timeout = 900;
            on-timeout = "hyprlock";
          }
          {
            timeout = 1200;
            on-timeout = "hyprctl dispatch dpms off";
            on-resume = "hyprctl dispatch dpms on";
          }
        ];
      };
    };
  };

  programs = {

    home-manager.enable = true;
  };
}
