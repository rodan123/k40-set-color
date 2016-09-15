#!/usr/bin/perl
use strict;

my $PATH = "/usr/local/bin";
my $NEWCOLOR = "00 170 00";
my $blanked = 0;
my $color;
my $profile;

open (IN, "xscreensaver-command -watch |");
while (<IN>) {
    if (m/^(BLANK|LOCK)/) {
        if (!$blanked) {
            $color=`$PATH/k40-set-color -r 2>/dev/null`;
            $profile=`$PATH/k40-set-color -n 2>/dev/null`;	
            chomp ($color);
            chomp ($profile);
            system "$PATH/k40-set-color -p$profile $NEWCOLOR > /dev/null 2>&1";
            system "$PATH/k40-set-color -a pulse > /dev/null 2>&1";
            $blanked = 1;
        }
    } elsif (m/^UNBLANK/) {
        system "$PATH/k40-set-color -a off > /dev/null 2>&1";
        system ("$PATH/k40-set-color -p$profile $color > /dev/null 2>&1");
        $blanked = 0;
    }
}
