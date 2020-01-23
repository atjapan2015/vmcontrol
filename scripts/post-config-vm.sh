#!/bin/bash

# POST config the VM

# create crontab to clean packages
(crontab -l 2>/dev/null | fgrep -v "*/5 * * * * pkcon refresh force -c -1 >/dev/null 2>&1"; echo "*/5 * * * * pkcon refresh force -c -1 >/dev/null 2>&1") | crontab -
