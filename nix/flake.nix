{
  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";

    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    sops-nix = {
      url = "github:Mic92/sops-nix";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = { self, nixpkgs, home-manager, sops-nix, ... }: {

    nixosConfigurations.desktop = nixpkgs.lib.nixosSystem {
      system = "x86_64-linux";
      modules = [
        ./hosts/desktop/configuration.nix
	home-manager.nixosModules.home-manager
	sops-nix.nixosModules.sops
	{
	  home-manager.useGlobalPkgs = true;
	  home-manager.useUserPackages = true;
	  home-manager.users.serbinjulius = {
	    imports = [
	      ./home/serbinjulius-desktop.nix
	      ./home/modules/sway.nix
	      ./home/modules/qutebrowser.nix
	      ./home/modules/emacs.nix
	      ./home/modules/zsh.nix
	      ./home/modules/starship.nix
	    ];
	  };
	}
      ];
    };

    nixosConfigurations.server = nixpkgs.lib.nixosSystem {
      system = "x86_64-linux";
      modules = [
        ./hosts/server/configuration.nix
	sops-nix.nixosModules.sops
      ];
    };

  };
}
