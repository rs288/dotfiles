#!/bin/sh

#./.fehbg
export _JAVA_AWT_WM_NONREPARENTING=1  
[ -f ~/.config/.xprofile ] && . ~/.config/.xprofile
exec dwm
