{ lib, pkgs, username, ... }:
{
  users = {
    mutableUsers = false;
    users.${username} = {
      isNormalUser = true;
      shell = pkgs.zsh;
      hashedPassword = "$y$j7T$ZfkUr9Cl/SReyolJDGCgc.$NkCzfqNX/goO9cQ.2RnReh/O2WOm8EOIxhNQ4A/JIpD";
      extraGroups = [ "wheel" ];
    };
  };

  virtualisation.vmVariant = {
    users.users.${username} = {
      password = "test";
      hashedPassword = lib.mkVMOverride null;
    };
  };
}
