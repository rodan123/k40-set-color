# k40-set-color
Set backlight color for the Corsair K40

This is a fork of the k40-set-color project by Clément Vuchener (https://github.com/cvuchener/k40-set-color)
I found it very useful for setting up the Coarsair K40 keyboard with linux and Xwindows, along with his corsair-usb-config program 
(https://github.com/cvuchener/corsair-usb-config) to assign macros to the G-Keys. Thanks Clément!

08/12/16

1) Added a new option to read the current profile selection number (-n, --number).

2) Program's default profile was set to 0. Did not work with my K40 to set color without specifing a profile number (-p)
   Modified code to set the color for currently selected profile if the profile (-p) option is not used.

3) Included a udev rule (70-corsairk40.rules) to allow the keyboard to be wrtten to by all users. (Otherwise must be root to run program) Not recommended if on a shared computer, but it is likely one would have a K40 keyboard on a single user personal PC. Copy to /etc/udev/rules.d/

4) Included a .Xmodmap file to clear the special keys on the keyboard (Mode buttons, brightness, Macro record, and Windows Key lock), so they do not throw keystrokes to Xwindows. Copy the file to your home directory, Xwindows should pick it up when starting on most distros, otherwise execute xmodmap .Xmodmap before starting Xwindows. 

5) Included small demo perl program (k40saver.pl) to change the color and animation of the keyboard when xscreensaver starts and then restore the original values when the screensaver stops. I use the matrix screensaver, it changes the keyboard color to green and sets the animation to pulse while the screensaver is active. Edit the file to point to your installation of k40-set-color.
