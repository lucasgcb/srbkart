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
akirame = "$(pwd)/mods/KC_Akiramev1.pk3"
t54="$(pwd)/mods/KC_T-54_V1.pk3"
ralsei="$(pwd)/mods/KC_Mercedes-Benz_Ralsei_V1.pk3"
arc="$(pwd)/mods/arc.pk3"
neco="$(pwd)/mods/necoarc.pk3"
bonus="/usr/games/SRB2KART/bonuschars.kart"
allchars="${ralsei} ${bonus} ${neco} ${arc} ${t54} ${akirame}"
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
    echo "Maps removed. Normal game"
    tmux new-session -d -s kart_server "srb2kart -dedicated -room 28 -config ${conf} -file ${allchars}"
    print_svr_ok
elif [ $1 = "combimaps" ]
then
    echo "Maps removed. Normal Combi Maps"
    tmux new-session -d -s kart_server "srb2kart -dedicated -room 28 -config ${conf} -file ${allchars} ${combi}"
    print_svr_ok
else
    echo "Unknown mode for server. Nothing done."
fi
