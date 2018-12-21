#!/usr/bin/env python3

# This script checks how long it's been since the last apt dist-upgrade, and
# runs i3-nagbar if it has been over a week

from datetime import datetime, timedelta
import os

def is_dist_upgrade(line):
    return "dist-upgrade" in line


def has_been_week(line):
    dt = datetime.strptime(line[10:-1], "%Y-%m-%d  %H:%M:%S")
    delta = datetime.now() - dt
    return delta > timedelta(weeks=1)


if __name__ == "__main__":
    f = open('/var/log/apt/history.log', 'r')
    dist_upgrade = False
    week = False

    for line in f:
        if dist_upgrade:
            if line.startswith("End-Date:"):
                week = has_been_week(line)
                dist_upgrade = False
        else:
            dist_upgrade = is_dist_upgrade(line)
    
    if week:
        os.system('i3-nagbar -t warning -m "It has been over a week since you last updated your system. Run apt-get dist-upgrade!"')
