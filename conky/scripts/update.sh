#!/bin/sh
# Conky config for Arch Linux.
# Author Jonathan Sanfilippo.
# Date Mon 10 Oct 2022
# Copyright (C) 2022 Jonathan Sanfilippo <jonathansanfilippo.uk@gmail.com>



#Setting ------------------------------------------------------------------------

#Variable URL
check="$HOME/.config/conky/scripts/onlycheck.sh"

sudo pikaur -Syu ; 
read -p "Press [Enter] key to continue.."

$check


