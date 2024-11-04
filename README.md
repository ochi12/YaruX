# YaruX
An elegant icon theme that extends Yaru's beautiful icons to third party applications.

![banner](https://github.com/user-attachments/assets/d7627d12-1b63-4f31-a125-0845a950071a)

# Whats with YaruX?
* YaruX is a Yaru extender that doesnt recreate the original Yaru default icons then adding new icons for third party apps.
* YaruX is an Icon theme that is designed to be inherited by Yaru just like `Humanity` and `hicolor`.
* YaruX respects the design guidelines of YaruX only with slight modification when necessary.\
  See [guide for creating Yaru icons](https://github.com/ubuntu/yaru/wiki/%234-Help-for-creating-yaru-icons).

  <br>

# Install Guide
Fire up you favorite terminal then run this lines
```
$ git clone https://github.com/ochi12/YaruX.git && cd YaruX/
```
Add User executable privelages for install.sh and uninstall.sh.
```
$ chmod u+x install.sh uninstall.sh
```
Option 1: Locally install YaruX.
```
$ ./install.sh --user
```
Option 2: Globally install YaruX.
```
$ ./install.sh
```
Note: `Option 1` will still require sudo later on to edit `/usr/share/icons/Yaru/index.theme`

<br>

# Uninstall Guide
Similar to `Option 1` and `Option 2` but replacing `./install.sh` with `./uninstall.sh`

# Recommendations For Design Contributors
* When you clone this repository, it contains a src/templates folder which hold the basic template of Yaru. Copy these files to your file manager's template folder to easily make new files later on.
* Picking a greate vector manipulator tool is also essential. `ochii` the maintainer of this repository, personally uses the popular `inkscape` from ![inkscape.org](https://inkscape.org/release/inkscape-1.4/)




