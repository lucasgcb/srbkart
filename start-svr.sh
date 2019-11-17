#!/bin/bash

function print_svr_ok () {
echo "#########################################################"
echo "Server initialized with tmux. Session name: kart_server"
echo "do 'tmux attach -t kart_server' to see logs"
echo "do 'tmux kill-session -t kart_server' to kill server"
echo "#########################################################"
}

conf="$(pwd)/adedserv.cfg"

# Characters
ralsei="$(pwd)/mods/KC_Mercedes-Benz_Ralsei_V1.pk3"
arc="$(pwd)/mods/arc.pk3"
neco="$(pwd)/mods/necoarc.pk3"
bonus="/usr/games/SRB2KART/bonuschars.kart"
allchars="${ralsei} ${bonus} ${neco} ${arc}"
mappack = "${RA}"
# Mods
combi="$(pwd)/mods/KL_combiring_v3b.lua"

if [ $# -eq 0 ];then
    tmux new-session -d -s kart_server "srb2kart -dedicated -room 28 -config ${conf} -file ${allchars}"
    print_svr_ok
elif [ $1 = "combi" ]
then
    echo "COMBI MODE!!"
    tmux new-session -d -s kart_server "srb2kart -dedicated -room 28 -config ${conf} -file ${allchars} ${combi}"
    print_svr_ok
elif [ $1 = "maps" ]
then
    echo "Thick Maps"
    tmux new-session -d -s kart_server "srb2kart -dedicated -room 28 -config ${conf} -file ${allchars} ${mappack}"
    print_svr_ok
elif [ $1 = "combimaps" ]
then
    echo "Thick Combi Maps"
    tmux new-session -d -s kart_server "srb2kart -dedicated -room 28 -config ${conf} -file ${allchars} ${combi} ${mappack}"
    print_svr_ok
else
    echo "Unknown mode for server. Nothing done."
fi
