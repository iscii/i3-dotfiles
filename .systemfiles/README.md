/usr/share/X11/xorg.conf.d/40-libinput.conf
    - Input settings for mouse [acceleration off] and touchpad [acceleration on, tap to click] for G14
/etc/udev/hwdb.d/90-nkey.hwdb
    - Enables mic mute toggling key on G14
/etc/systemd/system/suspend@.service
    $ sudo systemctl enable suspend@<user>.service
    - Runs i3lock-color script upon system suspend/sleep (including lid close)

