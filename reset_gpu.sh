#!/bin/sh
# reset gpu vars on shutdown (leave AMD/NVDA driver kexts where they are)
sudo nvram fa4ce28d-b62f-4c99-9cc3-6815686e30f9:gpu-power-prefs=%01%00%00%00
