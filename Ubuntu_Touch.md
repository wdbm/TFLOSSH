# UBports

# devices

- [Meizu PRO 5 (turbo)](turbo.md)
- [BQ Aquaris E4.5 (krillin)](krillin.md)

# general references

- <https://ubports.com/get-involved>
- <https://www.patreon.com/ubports>
- <http://news.softpedia.com/news/ubports-to-provide-legacy-support-for-bq-ubuntu-phones-create-their-own-store-514756.shtml>
- <http://news.softpedia.com/news/ubports-to-provide-legacy-support-for-bq-ubuntu-phones-create-their-own-store-514756.shtml>

# setup: possible first steps after installation

- Turn on Rotation Lock.
- Set brightness to full.
- keyboard and buttons
    - Turn off spell-checking.
    - Turn off autocorrect.
    - Turn off word suggestions.
    - Turn off autocapitalization.
    - Turn off autopunctuation.
    - Turn off keyboard vibration.
- Turn off button vibrations.
    - System Settings
    - Sound
    - Other vibrations
- Set up hotspot.

# screenshots

volume up + volume down

# launch Anbox Application Manager

```Bash
/usr/bin/anbox launch --package=org.anbox.appmgr --component=org.anbox.appmgr.AppViewActivity
```

# staged and windowed modes (accessible now via UT Tweak Tool)

```Bash
gsettings set com.canonical.Unity8 usage-mode Windowed
gsettings set com.canonical.Unity8 usage-mode Staged
```

# apt-get setup

```Bash
sudo mount -o remount,rw /
```

# fix Apt, dpkg when there is a lack of hard drive space

Whenever installing a package, Apt downloads the package to the system and caches it in case it needs to be installed again. There can be substantial space used by this:

```Bash
sudo du -sh /var/cache/apt/archives
```

The formal way to removed cached packages is as follows:

```Bash
sudo apt-get clean
```

# fix Apt not able to open lock file

If the file `/var/cache/apt/archives/lock` does not exist, it can be created:

```Bash
sudo touch /var/cache/apt/archives/lock
```

# Libertine and X applications

- [Libertine Tweak Tool](https://open-store.io/app/libertine-tweak-tool.doniks)
- <https://docs.ubports.com/en/latest/userguide/dailyuse/libertine.html>
- <https://bugs.launchpad.net/ubuntu/+source/libertine-scope/+bug/1595944>

## setup: Libertine, Firefox, Gdmap, Geany, x11-apps

Connect to the internet. Create a Libertine container, for example called "applications" (this can take a few minutes).

```Bash
libertine-container-manager create -i applications
```

Install applications.

```Bash
libertine-container-manager install-package -i applications -p firefox
libertine-container-manager install-package -i applications -p gdmap
libertine-container-manager install-package -i applications -p geany
```

experimental:

```Bash
libertine-container-manager exec -c /usr/bin/geany
DISPLAY= libertine-launch -i applications /usr/bin/geany
libertine-launch --id applications xeyes
libertine-container-manager exec --command "geany" --id applications
DISPLAY= libertine-container-manager exec -c /usr/bin/geany
DISPLAY= libertine-launch --id applications geany
```

## XMir

- <http://forum.xda-developers.com/ubuntu-touch/help/easier-xmir-setup-t3303981>

## launchers

- <http://ubuntuforums.org/showthread.php?t=2309416>
- <http://forum.xda-developers.com/ubuntu-touch/help/easier-xmir-setup-t3303981>
- <https://www.youtube.com/watch?v=XfMLzlki9XE>
- <http://www.ceus-now.com/ubuntu-touch-how-to-create-unity-desktop-launcher-to-make-ut-terminal-to-open-and-execute-a-command>
- <http://mutse.github.io/2015/11/08/howto-launch-desktop-apps-on-utouch>

Launcher `.desktop` files should be at directory `/home/phablet/.local/share/applications`. A restart is needed before a new launcher appears in scopes.

```
[Desktop Entry]
Name=xeyes
Type=Application
Terminal=false
Icon=/usr/include/X11/bitmaps/xlogo64
X-Ubuntu-Touch=true
X-Ubuntu-XMir-Enable=true
Exec=xeyes
```
