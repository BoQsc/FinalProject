**Quick steps to solve:**
1. Boot up into Windows 10
2. Disable **fast startup**
3. Shut-down Windows 10
4. **Boot up Ubuntu and see that you can:** create, write, edit, delete, modify files and folders
5. ???
6. Profit

### Original Solution

```
Make sure you have fast startup disabled in Windows, otherwise you won't be able to write to NTFS partitions. If you previously disabled fast startup, a subsequent Windows update may have re-enabled it. Irritating, but true. In case you need it, here's how to disable fast startup:

https://www.tenforums.com/tutorials/...dows-10-a.html

Also. Don't do a restart from Windows. Even if you have fast startup disabled, I believe Windows will do a hybrid shutdown when you select restart/reboot or whatever it is called in Windows. You need to shutdown from Windows and then do a cold boot into Ubuntu.

By the way, by fast startup, I'm referring to the Windows "feature", not fast boot in BIOS. 
```
**Solution Source:** https://ubuntuforums.org/showthread.php?t=2381014&p=13724183#post13724183
