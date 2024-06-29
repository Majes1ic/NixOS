{ lib, pkgs, username, config, ... }:
{
  users = {
    mutableUsers = false;
    users.${username} = {
      isNormalUser = true;
      shell = pkgs.zsh;
      hashedPasswordFile = config.age.secrets.usrPass.path;
      extraGroups = [ "wheel" ];
    };
  };
  age.secrets.usrPass.file = ../../secrets/usrPass.age;

  virtualisation.vmVariant = {
    users.users.${username} = {
      password = "test";
      hashedPassword = lib.mkVMOverride null;
    };
  };
}
