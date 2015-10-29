# Debian 7 - amd64 #

62Go ext4, 2Go swap

 * Debian 7.9 - amd64
   * Openssh-server
   * Nfs support (nfs-common, cachefilesd)
   * VirtualBox - Guest Additions 5.0.6 (dkms, linux-headers)
   * Ansible 1.9.4 (python-pycurl)
   * Vim 7.4 (backports)
   * Git 1.9.1 (backports)
   * Oh-my-zsh
   * Make 3.81

## Miscellaneous ##

 * Vagrant integration (user & public ssh key)
 * Vim customization (default editor, syntax highlighting, ...)
 * Increase git performance over nfs with *core.preloadindex true*

## Changelog ##

### 1.0.4

* No longer add vagrant public ssh key to docker build
* Disable splash screen during preseed
* Use google dns servers
* Use debian httpredir as apt sources
