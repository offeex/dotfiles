{
  description = "NixOS configuration";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";

    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    walker.url = "github:abenz1267/walker";

    ags.url = "github:Aylur/ags";

    spicetify-nix.url = "github:the-argus/spicetify-nix";

    android-nixpkgs.url = "github:tadfisher/android-nixpkgs";

    nix-inspect.url = "github:bluskript/nix-inspect";

    hyprland.url = "git+https://github.com/hyprwm/Hyprland?submodules=1";
  };

  outputs = { self, nixpkgs, home-manager, ... } @ inputs: {
    nixosConfigurations.offeex-pc = nixpkgs.lib.nixosSystem {
      system = "x86_64-linux";
      specialArgs = { inherit inputs; };
      modules = [
        ./system/configuration.nix
        home-manager.nixosModules.home-manager
        {
          home-manager = {
            useGlobalPkgs = true;
            useUserPackages = true;
            users.offeex = import ./home/home.nix;
            extraSpecialArgs = { inherit inputs; };
          };
          # мдааа, ебать его в рот конечно
          nixpkgs.overlays = [ inputs.android-nixpkgs.overlays.default ];
        }
      ];
    };
  };
}

