```Openbsd manual pages for gnu/linux

requirements:
  fd
  man

installation requirements:
  git
  sudo or doas

install:
  sudo git clone https://github.com/siruidops/manpages-openbsd /opt/manpages-openbsd
  sudo cp /opt/manpages-openbsd/man_openbsd.sh /usr/local/bin/man_openbsd
  sudo chmod +x /usr/local/bin/man_openbsd
  
Usage:
  man_openbsd syle
  man_openbsd 9 style
```
