{
    virtualisation.virtualbox.guest.enable = true;

    virtualisation.docker = {
  	    enable = true;
  	    enableOnBoot = true;
	    storageDriver = "overlay2";
	    rootless = {
		    enable = true;
		    setSocketVariable = true;
	    };

    };
}