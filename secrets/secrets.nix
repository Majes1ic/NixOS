let
  maximum = "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAILXXsn0Q4UzpMAnYa5b2TE5KxTeBjLy0ck4eIwekD93b root@maximum";
in
{
  "usrPass.age".publicKeys=[maximum];
}