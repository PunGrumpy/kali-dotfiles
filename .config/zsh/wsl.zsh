#    ___       __   ________  ___          
#   |\  \     |\  \|\   ____\|\  \         
#   \ \  \    \ \  \ \  \___|\ \  \        
#    \ \  \  __\ \  \ \_____  \ \  \       
#     \ \  \|\__\_\  \|____|\  \ \  \____  
#      \ \____________\____\_\  \ \_______\
#       \|____________|\_________\|_______|
#                     \|_________|         

# Fix Interop Error that randomly occurs in vscode terminal when using WSL2
fix_wsl2_interop() {
    for i in $(pstree -np -s $$ | grep -o -E '[0-9]+'); do
        if [[ -e "/run/WSL/${i}_interop" ]]; then
            export WSL_INTEROP=/run/WSL/${i}_interop
        fi
    done
}