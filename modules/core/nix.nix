{ lib
, pkgs
, config
, inputs
, username
, hostname
, ...
}:
{
  nixpkgs = {
    overlays = [ ];
    config.allowUnfree = true;
  };

  nix = {
    # Allows referring to flakes with nixpkgs#flake
    registry = (lib.mapAttrs (_: flake: { inherit flake; })) ((lib.filterAttrs (_: lib.isType "flake")) inputs);

    settings = {
      # enable flakes
      experimental-features = "nix-command flakes";
      # save space by removing duplicate files from the store
      auto-optimise-store = true;
    };

    gc = {
      automatic = true;
      dates = "weekly";
      options = "--delete-older-than 7d";
    };
  };

  # Add flake inputs to the system's legacy channels
  nix.nixPath = [ "/etc/nix/path" ];
  environment.etc =
    lib.mapAttrs'
      (name: value: {
        name = "nix/path/${name}";
        value.source = value.flake;
      })
      config.nix.registry;

  # Generate rebuild command scripts
  environment.systemPackages = map
    (cmd: pkgs.writeShellApplication {
      name = "rebuild-${cmd}";
      runtimeInputs = with pkgs; [ nixos-rebuild nvd ];
      text = /*bash*/ ''
        pushd ~ >/dev/null 2>&1
        exit() {
          popd >/dev/null 2>&1
        }
        trap exit EXIT
        nixos-rebuild ${if (cmd == "diff") then "build" else cmd} \
          --use-remote-sudo --flake "/home/${username}/.config/nixos#${hostname}" "$@"
        ${lib.optionalString (cmd == "diff") /*bash*/ ''
          nvd diff /run/current-system result
        ''}
      '';
    }) [ "switch" "test" "boot" "build" "dry-build" "dry-activate" "diff" ];
}
