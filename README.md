Before you install:
  1. The installation has to have both swap and root partition encrypted
  2. Copy the boot.initrd line from the original configuration.nix and put it in system/boot.nix
  3. Generate system/hardware-configuration.nix
  4. Make a personal.nix file filling these fields:
```nix
{
  login = "";
  name = "";
  email = "";
  email_smtp = "";
}
```
