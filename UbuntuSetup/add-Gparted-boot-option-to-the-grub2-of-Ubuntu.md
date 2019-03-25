
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
