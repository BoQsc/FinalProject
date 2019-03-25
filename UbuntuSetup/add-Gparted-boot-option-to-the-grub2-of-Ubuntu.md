### Quick steps to solve
1. Download gparted iso https://gparted.org/download.php
   * The one I used: gparted-live-0.33.0-2-amd64.iso
2. Copy **gparted-live-0.33.0-2-amd64.iso** into folder **/home/isos/**
3. Edit existing file: **/etc/grub.d/40_custom like**
   * I used gedit: sudo `sudo gedit /etc/grub.d/40_custom like`
4. Copy this **menuentry "Gparted live":** 
```
    menuentry "Gparted live" {
      set isofile="/home/isos/gparted-live-0.28.1-1-i686.iso"
      loopback loop $isofile
      linux (loop)/live/vmlinuz boot=live config union=overlay username=user components noswap noeject vga=788 ip= net.ifnames=0 toram=filesystem.squashfs findiso=$isofile
      initrd (loop)/live/initrd.img
    }
```
5. Paste it at the **end of file** of previously opened **/etc/grub.d/40_custom like**
6. Edit the line: `set isofile="/home/isos/gparted-live-0.28.1-1-i686.iso"` into version you downloaded  
  In my case it is: **gparted-live-0.33.0-2-amd64.iso**
  
7. The final result should look like this: 

```
#!/bin/sh
exec tail -n +3 $0
# This file provides an easy way to add custom menu entries.  Simply type the
# menu entries you want to add after this comment.  Be careful not to change
# the 'exec tail' line above.

menuentry "Gparted live" {
      set isofile="/home/isos/gparted-live-0.33.0-2-amd64.iso"
      loopback loop $isofile
      linux (loop)/live/vmlinuz boot=live config union=overlay username=user components noswap noeject vga=788 ip= net.ifnames=0 toram=filesystem.squashfs findiso=$isofile
      initrd (loop)/live/initrd.img
    }
```
8. **Important:** execute the command to apply the changes you just made: `sudo update-grub2`


------------------


### Original Solution
```
Alternatively from GParted live version 0.4.8-7 onwards, you can use only the GParted live iso file in grub2 (Thanks to the patches files from grml). For example, put gparted-live-0.28.1-1-i686.iso in dir /home/isos/, then make the grub2 custom file /etc/grub.d/40_custom like:

    menuentry "Gparted live" {
      set isofile="/home/isos/gparted-live-0.28.1-1-i686.iso"
      loopback loop $isofile
      linux (loop)/live/vmlinuz boot=live config union=overlay username=user components noswap noeject vga=788 ip= net.ifnames=0 toram=filesystem.squashfs findiso=$isofile
      initrd (loop)/live/initrd.img
    }
        
```

**Solution Source:** https://gparted.org/livehd.php
