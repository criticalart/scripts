#!/bin/bash
clear
echo
gum confirm "Would you like to transfer your Pokemon save?" && gum spin -s line --title="Connecting to SteamDeck..." -- sleep 1 || exit 1
scp deck@steamdeck:/home/deck/.config/Ryujinx/bis/user/save/0000000000000002/0/Backup.bin ~
scp deck@steamdeck:/home/deck/.config/Ryujinx/bis/user/save/0000000000000002/0/SaveData.bin ~
echo
gum confirm "Overwrite your current save?" && gum spin -s line --title="Overwriting saves..." -- sleep 1 || exit 1
rm ~/.config/Ryujinx/bis/user/save/0000000000000007/0/Backup.bin
rm ~/.config/Ryujinx/bis/user/save/0000000000000007/0/SaveData.bin
mv ~/Backup.bin ~/.config/Ryujinx/bis/user/save/0000000000000007/0/Backup.bin
mv ~/SaveData.bin ~/.config/Ryujinx/bis/user/save/0000000000000007/0/SaveData.bin
echo "Files transferred successfully!"
