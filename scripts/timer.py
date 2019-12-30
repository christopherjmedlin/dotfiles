#!/usr/bin/env python3

import time 
import subprocess 
import sys
import argparse

THINKPAD_KBD_LIGHT_PATH = "/sys/class/leds/tpacpi::kbd_backlight/brightness"

def nag(path):
    mplayer = subprocess.Popen(['mplayer', '-loop', '0', path])
    nagbar = subprocess.Popen(['i3-nagbar', '-t', 'warning', '-m' '"Timer finished"'])
    while nagbar.poll() == None:
        toggle_keyboard_light()
        time.sleep(0.5)
    mplayer.kill()

    with open(THINKPAD_KBD_LIGHT_PATH, "w") as f:
        f.write("0")

def toggle_keyboard_light():
    current_state = "0"
    with open(THINKPAD_KBD_LIGHT_PATH, "r") as f:
        current_state = f.read()
    with open(THINKPAD_KBD_LIGHT_PATH, "w") as f:
        if "0" in current_state:
            print("hmm")
            f.write("2")
        else:
            f.write("0")

def parse_time(time):
    time_int = int(time[:-1])
    if time[-1] == 'm':
        return time_int * 60
    if time[-1] == 'h':
        return time_int * 3600
    else:
        return time_int

if __name__ == "__main__":
    parser = argparse.ArgumentParser(description="Set a timer")
    parser.add_argument('time', help="amount of time for timer (e.g. 5s, 10m, 1h)")
    parser.add_argument('--sound', dest='sound_path', 
                        default='/usr/share/sounds/freedesktop/stereo/alarm-clock-elapsed.oga',
                        help="path to mp3 file to play")
    args = parser.parse_args()
    args.time = parse_time(args.time)

    time.sleep(int(args.time))
    nag(args.sound_path)
