#!/bin/bash

clear
echo -e "\e[1;92m🔥 Installing CDR MAHID Termux Banner...\e[0m"
sleep 1

echo -e "\n\033[1;93m📦 Installing Required Packages...\033[0m"
pkg update -y > /dev/null 2>&1
pkg install -y figlet python ruby > /dev/null 2>&1
gem install lolcat > /dev/null 2>&1

echo -e "\e[1;92m✔ Packages Installed!\e[0m"
sleep 1

# ===== FILE PATHS =====
BRC="$HOME/.bashrc"
NAME_FILE="/data/data/com.termux/files/usr/etc/.termux_custom_name"

# ===== CUSTOM NAME SETUP =====
if [ ! -f "$NAME_FILE" ]; then
    echo -e "\n\033[1;93m👉 Enter your custom name:\033[0m"
    read CUSTOM_NAME
    echo "$CUSTOM_NAME" > "$NAME_FILE"
else
    CUSTOM_NAME=$(cat $NAME_FILE)
fi

# ===== WRITE ENTIRE .bashrc FILE =====
cat > $BRC <<EOF
# Dynamic Custom Name Load
CUSTOM_NAME=\$(cat /data/data/com.termux/files/usr/etc/.termux_custom_name)

clear
echo
echo "
   < ━━━━━━━━━ [★] T E R M U X [★] ━━━━━━━━━━━━ >  " | lolcat
echo
echo "  We Are \$CUSTOM_NAME" | lolcat

figlet "    \$CUSTOM_NAME" | lolcat

echo "
             Always walk the path of truth. 
                    I will not harm anyone without any reason. Inshallah
   < ━━━━━━━━━━━ [★]\$CUSTOM_NAME VAU [★] ━━━━━━━━━━━━ > " | lolcat

python /data/data/com.termux/files/usr/etc/wlc.py

if [ -x /data/data/com.termux/files/usr/libexec/termux/command-not-found ]; then
        command_not_found_handle() {
                /data/data/com.termux/files/usr/libexec/termux/command-not-found "\$1"
        }
fi

PS1='\\[\\e[1;34m┌──\\a─T─I─M─E─\\a──┐\\033[1;34m\\a┌──\\a─D─A─T─E─\\a───>\\033[1;34m
\\a┌─[\\033[1;93m \\@\\033[1;34m ]──[\\033[1;93m \\d\\033[1;34m ]\\033[1;34m
\\a├─[\\033[1;32m\\w\\033[1;34m]\\033[1;34m
\\[\\e[34m\\]└─>\\[\\e[35m\\]\$CUSTOM_NAME\\[\\e[34m\\][~]:#\\[\\e[1;32m\\] '
echo -e '\\e[6 q'
EOF

echo -e "\n\e[1;92m✔ Installation Complete!"
echo -e "➡ Restart Termux to see your new banner.\e[0m"
sleep 1
