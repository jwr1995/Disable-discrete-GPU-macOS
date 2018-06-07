# MPB_GPU_fix
#### (A GPU disabling method with no need to remove .kext's or use a Linux distro)
A simple shell script to disable discrete GPUs for MacBook Pros affected by GPU issues

This method requires you to remove none of the AMD or NVDIA ".kext" files from your system folder as I have seen many other methods advocating doing

For proper usage follow these instructions (skip step 1 if you are still able to log in normally)

## Step 1

In order to disable the GPU first open your computer in single user mode (cmd + s) on startup.

Use this command for the first disable:
```
sudo nvram fa4ce28d-b62f-4c99-9cc3-6815686e30f9:gpu-power-prefs=%01%00%00%00
```
Then reboot your computer:
```
reboot
```

## Step 2

Log in normally

Now copy the reset_gpu.sh file to an easily accessible location, bare in mind permissions are important so if you want to store it outside of your user account then make sure the LogoutHook can access it. Mine is located in /Users/*my username*/reset_gpu.sh for simplicity.
Note: I'd also have a copy stored in your root folder Macintosh HD/reset_gpu.sh; this is so that if for any reason the script doesn't get run at logout or shutdown and your computer tries to boot with the discrete GPU enabled then you can simply reboot in single user mode again and use the following to reset it:
```
sh reset_gpu.sh
reboot
```

## Step 3
The next step is to add reset_gpu.sh as a LogoutHook so that it runs the command mentioned in *Step 1* everytime your computer logouts.

To do this open Terminal and enter the following:
```
sudo defaults write com.apple.loginwindow LogoutHook /path/to/reset_gpu.sh
```
This should be all you need to do, so I'd advise restarting your computer now and check that it boots again with the GPU disabled.

## Footnotes
LogoutHooks are deprecated by Apple now but this method still seems to work for me, using an early 2011 Macbook Pro 15" running OSX High Sierra

For more on Login/LogoutHooks:
https://developer.apple.com/library/archive/documentation/MacOSX/Conceptual/BPSystemStartup/Chapters/CustomLogin.html
