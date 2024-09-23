{pkgs, ...}: {
    # Define a user account. Don't forget to set a password with ‘passwd’.
   users.users.vova = {
     isNormalUser = true;
     extraGroups = [ "wheel" "docker" ]; # Enable ‘sudo’ for the user.
     home = "/home/vova";
     packages = with pkgs; [
     ];
   };
}
