#!/bin/sh
# Conky config for Arch Linux.
# Author Jonathan Sanfilippo.
# Date Mon 10 Oct 2022
# Copyright (C) 2022 Jonathan Sanfilippo <jonathansanfilippo.uk@gmail.com>



#Setting ------------------------------------------------------------------------

#Variable URL
pending="$HOME/.config/conky/pending"
iconpending="$HOME/.config/conky/iconpending"
lastcheck="$HOME/.config/conky/lastcheck"
listpending="$HOME/.config/conky/listpending"


#Variable Cmd
get_Variables(){
AUR=$(pikaur -Qqua ;)
list=$(checkupdates 2>/dev/null )
Pending=$(expr $(pikaur -Qqua | wc -l) + $(checkupdates 2>/dev/null | wc -l) )
CHECK="3600"
DataTime=$(date '+%a %d %b %H:%M '  )
}



while true; do

get_Variables
      
#Pending
if [ "$Pending" -eq 1 ]; then
             echo "$Pending Update Pending" > "$pending"
             echo "" > "$iconpending"
             echo "$list" > "$listpending"
             echo "$AUR" >> "$listpending"
             
elif [ "$Pending" -ge 1 ]; then
             echo "$Pending Updates Pending" > "$pending"
             echo "" > "$iconpending"
             echo "$list" > "$listpending"
             echo "$AUR" >> "$listpending"
else
           echo "System Updated" > "$pending"
           echo " " > "$iconpending"
           echo "" > "$listpending"

fi

#lastcheck
echo "$DataTime" > "$lastcheck"

sleep "$CHECK"
get_Variables
done
