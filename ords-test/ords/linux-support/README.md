### ORACLE ORDS SYSTEMD AND SYSTEM V INTEGRATION
## Description:
The files on this folder are needed to setup your Oracle ORDS to start with the Linux service manager (Systemd or System V ).

**Note:** this only apply if you have installed Oracle ORDS through a zip file if you have installed your Oracle ORDS with RPM you can go directly to step **"3. Add service to Linux service manager".** 

## Dependency:
[lsof :](https://lsof.readthedocs.io/en/latest/) lsof is a Unix command for list open files and is packaged in many Linux Distributions. You can install lsof from package managers:

If you use Debian/Ubuntu/apt-based Linux distros:
```
sudo apt install lsof
```
If you use Oracle Linux/CentOS/yum-based Linux distros:
```
sudo dnf install lsof
```
If you use Arch/pacman-based Linux distros:
```
sudo pacman -Syu lsof
```
If you use NixOS/nix-based Linux distros:
```
nix-env -i lsof
```

## 1. Setup files
As root copy man files to the correct place and give it permissions.

 ```
	sudo cp man/ords.1 /usr/share/man/man1/ords.1.gz
	sudo chmod 644 /usr/share/man/man1/ords.1.gz
	sudo chown root:root /usr/share/man/man1/ords.1.gz
	sudo cp man/ords.conf.5 /usr/share/man/man5/ords.conf.5.gz
	sudo chmod 644 /usr/share/man/man5/ords.conf.5.gz
	sudo chown root:root /usr/share/man/man5/ords.conf.5.gz
	sudo cp man/ords.service.8 /usr/share/man/man8/ords.service.8.gz
	sudo chmod 644 /usr/share/man/man8/ords.service.8.gz
	sudo chown root:root /usr/share/man/man8/ords.service.8.gz
```

 Copy configuration file service file and init script

```
	sudo cp ords.sh /etc/init.d/ords
	sudo chown root:root /etc/init.d/ords
	sudo chmod 755 /etc/init.d/ords
	sudo cp ords.conf /etc/ords.conf
	sudo chown oracle:oinstall /etc/ords.conf
	sudo chmod 750 /etc/ords.conf
	sudo cp ords.service /etc/systemd/system/ords.service
	sudo chown root:root /etc/systemd/system/ords.service
	sudo chmod 644 /etc/systemd/system/ords.service
```

Create a symlink for ords bin.
```
sudo ln -s <ORDS_BASE>/bin/ords /usr/local/bin/ords 
```

ORDS_BASE: Where you have uncompressed you Oracle ORDS Zip file

## 2. Edit configuration file.

Open `/etc/ords.conf` with you favorite text editor and set the ORDS_BASE and ORDS_CONFIG variables.

## 3. Add ORDS to Linux service Manager.

Execute below command to know wich service manager is running.
```
ps --no-headers -o comm 1
```

If the output of above command is `systemd` please run below command to add Oracle ORDS to start up services.
```
sudo  systemctl enable ords
```

If the output of above command is `init` please run below command to add Oracle ORDS to start up services.
```
sudo  sudo chkconfig --add ords
```
