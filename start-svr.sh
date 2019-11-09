#!/bin/bash

function print_svr_ok () {
echo "#########################################################"
echo "Server initialized with tmux. Session name: kart_server"
echo "do 'tmux attach -t kart_server' to see logs"
echo "do 'tmux kill-session -t kart_server' to kill server"
echo "#########################################################"
}

if [ $# -eq 0 ];then
    tmux new-session -d -s kart_server 'srb2kart -dedicated -room 28 -config "$(pwd)/adedserv.cfg" -file "/usr/games/SRB2KART/bonuschars.kart"'
    print_svr_ok
elif [ $1 = "combi" ]
then
    echo "COMBI MODE!!"
    tmux new-session -d -s kart_server 'srb2kart -dedicated -room 28 -config "$(pwd)/adedserv.cfg" -file "/usr/games/SRB2KART/bonuschars.kart" "$(pwd)/mods/KL_combiring_v3b.lua"'
    print_svr_ok
else
    echo "Unknown mode for server. Nothing done."
fi
