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
}