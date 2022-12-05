# pkg install sox
directorio_nahfer_os=$(pwd);
#setterm -foreground green
version=$"Nahfer-OS : version : 2.0 buil : 6"
creador=$"Creador : Capitan comando"
rm -rf .git
cp -r .dialogrc ~/


function loading(){
####
clear
if [ ! "$(command -v sox)" ]; then
       echo -e "\e[31mInstalando paquete [sox]\e[0m"
       apt install sox -y
fi

if [ ! "$(command -v dialog)" ]; then
       echo -e "\e[31mInstalando paquete [dialog]\e[0m"
       apt install dialog -y
fi

clear

if [[ -d "/usr/bin" ]]; then
    echo -e "\e[31mEstas en software basado en [debian]\e[0m"
    echo -e "\e[31mDirectorio Actual:$directorio_nahfer_os\e[0m"
else
    echo -e "\e[31mEstas en software basado en [termux]\e[0m"
    echo -e "\e[31mDirectorio Actual:$directorio_nahfer_os\e[0m"
fi

sleep 5
####
for i in $(seq 0 30 100)
do
    sleep 0.5
    echo $i | dialog --gauge "loading..." 10 70 0
done
}
########################
function info(){
play -q $directorio_nahfer_os/termux_desktop/.audios/comenzemos.mp3 &
dialog --title "INFORMACION" --infobox "NAHFER-OS ES UN PARCHE DE ESCRITORIO XFCE4, DE DISTROS LINUX BASADAS EN DEBIAN Y TERMUX.

BIEN COMENZEMOS

$creador

$version" 10 50
sleep 7
}

function inicio(){
clear
sleep 1
play -q $directorio_nahfer_os/termux_desktop/.audios/selec.mp3 &
inicio_menu=$(dialog --backtitle "NAHFER HACKING" --stdout --title "NAHFER-OS-INSTALL" \
    --menu "$version" 15 61 7 \
    "1" "Instalar xfce4       [ Install xfce4    ]" \
    "2" "Configuracion Nahfer [ Setup Nahfer     ]" \
    "3" "Instalar aplications [ install recurses ]" \
    "4" "Desinstalar          [ Uninstaller      ]" \
    "5" "Actualizar script    [ update script    ]" \
    "6" "Ayuda.               [ Help             ]")

chosen=$?

case $chosen in
    0)
        echo $(clear)
        if [[ $inicio_menu == 1 ]]; then
            install_xfce4_menu
        elif [[ $inicio_menu == 2 ]]; then
            configuracion_nahfer
        elif [[ $inicio_menu == 3 ]]; then
            install_aplications
        elif [[ $inicio_menu == 4 ]]; then
             desinstalar
        elif [[ $inicio_menu == 5 ]]; then
             update_script
        elif [[ $inicio_menu == 6 ]]; then
             ayuda_nahfer
        else
            echo "exit"
        fi
        ;;
    1)
        echo "cancelado .."
        ;;
    255)
        echo ""
        ;;

esac
}

function install_aplications(){
clear
play -q $directorio_nahfer_os/termux_desktop/.audios/install_aplications.mp3 &
sleep 3
sudo su
apt install bluefish -y

inicio
}
ayuda_nahfer(){
clear
echo -e "\e[35m################################################### \e[0m"
echo -e "\e[33m 
Para Iniciar el servicio vncserver por el puerto 1
es con el siguente comando:  $ vncserver :1

para cerrar la conexion vncserver por el puerto 1
es con el siguente comando $ vncserver -kill :1

Para listar las conexiones abiertas en el vncserver
es con el siguente comando: $ vncserver -list

para aclarar el numero :1 es el puerto del localhost
ustedes pueden abrir el puerto que deseen ejemplo
abriendo el puerto :3 del localhost, $ vncserver :3

para mas informacion escribe el comando $ vncserver -h

una vez que ya abriste el puerto local en la terminal
debes ir ala apk [vnc viewer] y configurar la conexion
de esta manera:  addres : localhost:1
                 name   : Termux\e[0m"

echo -e "\e[35m################################################### \e[0m"
read -p "-->"
inicio
}

function install_xfce4_debian(){
setterm -foreground green
sudo su
apt-get install keyboard-configuration -y                                                apt-get install tightvncserver -y
apt-get install sudo wget -y                                                             apt-get install xfe -y
apt-get instalm xfe tightvncserver -y
apt-get install xfce4 xfce4-terminal tigervnc-standalone-server -y 
apt-get clean
inicio
}

function install_xfce4_termux(){
clear
play -q $directorio_nahfer_os/termux_desktop/.audios/install_xfce4_termux.mp3 &
	echo -e "\e[31m Instalando Termux-Desktop\e[0m"
setterm -foreground green
#apt update && apt upgrade -y
setterm -foreground green
pkg install x11-repo -y
pkg install tigervnc -y
pkg install -y xfce4
pkg install -y xfce4-terminal
pkg install -y xfce4-taskmanager
pkg install -y xfce4-whiskermenu-plugin
pkg install -y xfce4-clipman-plugin
play -q $directorio_nahfer_os/termux_desktop/.audios/aplicaciones_de_escritorio &
pkg install -y xarchiver
pkg install -y geany
pkg install -y geany-plugins
pkg install -y gtk3 gtk2
pkg install -y mtpaint
pkg install -y netsurf
pkg install -y recordmydesktop
pkg install -y feh
pkg install -y dosbox
# pkg install -y vim-gtk
pkh install mousepad -y
pkg install -y xorg-xhostk
pkg install -y mpv
pkg install -y tumbler
pkg install -y ristretto
pkg install -y loqui
apt install mpv -y
apt install mpv-x -y
apt install otter-browser -y
apt install vim-gtk -y
apt install galculator -y
apt install tmux -y
apt install getconf -y
apt install scrub -y
pkg install audacious -y
pkg install audacious-plugins -y
apt install pulseaudio -y
play -q $directorio_nahfer_os/termux_desktop/.audios/configurando_vnc.mp3 &
echo -e "\e[31m\nConfigurando VNCSERVER\n\e[0m"
sleep 5
play -q $directorio_nahfer_os/termux_desktop/.audios/pass_vnc.mp3 &
vncserver -localhost
sleep 0.5
cd termux_desktop
cp xstartup ~/.vnc
chmod +x ~/.vnc/xstartup
cd ..
sleep 5
#File bashrc
if [[ -f "$HOME/.bashrc" ]]; then
    echo "export DISPLAY=\":1\"" >> ~/.bashrc
else
    echo "export DISPLAY=\":1\"" > ~/.bashrc
fi

sleep 2
export DISPLAY=":1"
play -q $directorio_nahfer_os/termux_desktop/.audios/confi_nahfer_terminada.mp3 &
sleep 3
echo -e "\n\e[31mConfiguracion Terminada\n\e[0m"
echo -e "\e[31mIniciando Servicio VNCSERVER\e[0m"
#xfce4-session &
play -q $directorio_nahfer_os/termux_desktop/.audios/xfce4_instalado.mp3 &
echo -e "\n\e[31mXfce4 Instalado Correctamente\n\e[0m"
echo "localhost:1"
sleep 8
inicio
}

function configuracion_nahfer(){
clear
### verificar si existe config_nahfer.zip
if [[ -f "$directorio_nahfer_os/termux_desktop/confi_nahfer.zip" ]]; then
    wget --no-check-certificate --continue https://servernahferos.000webhostapp.com/archivo/confi_nahfer.zip -P $directorio_nahfer_os/termux_desktop
    echo -e "\e[32mArchivo Nahfer: Existe [+]...\e[0m"
    sleep 2
else
   echo -e "\e[31m Archivo Nahfer: No existe [x]...\e[0m"
   sleep 2
   echo -e "\e[32m Descargando archivos...\e[0m"
   wget --no-check-certificate --continue https://servernahferos.000webhostapp.com/archivo/confi_nahfer.zip -P $directorio_nahfer_os/termux_desktop
   echo -e "\e[35m Archivo descargado...\e[0m"
fi

# verifica si la descarga es correcta
#wget --no-check-certificate --continue https://servernahferos.000webhostapp.com/archivo/confi_nahfer.zip -P $directorio_nahfer_os/termux_desktop
#sleep 2
### terminado

	echo
echo -e "\e[35m configurando setup Nahfer Hacking \e[0m"
    echo
setterm -foreground green
    sleep 5.4
play -q $directorio_nahfer_os/termux_desktop/.audios/confi_nahfer.mp3 &
	clear
################
#cd $directorio_nahfer_os/termux_desktop
#unzip Pictures.zip
#mv Pictures ~/
if [[ -d "/usr/bin" ]]; then
    cd $directorio_nahfer_os/termux_desktop
    echo -e "\e[31mEstas en software basado en [debian]\e[0m"
    echo -e "\e[31mDirectorio Actual:$directorio_nahfer_os\e[0m"
    cp -r xfce /usr/share/backgrounds/
    sleep 3
    cp -r confi_nahfer.zip ~/
    cp -r config_debian.zip ~/
    cd ~/
    unzip confi_nahfer.zip
    rm -rf .config
    sleep 3
    unzip config_debian.zip
    sleep 3
    rm -rf confi_nahfer.zip
    rm -rf config_debian.zip
else
    cd $directorio_nahfer_os/termux_desktop
    echo -e "\e[31mEstas en software basado en [termux]\e[0m"
    echo -e "\e[31mDirectorio Actual:$directorio_nahfer_os\e[0m"
    cp -r xfce /data/data/com.termux/files/usr/share/backgrounds/usr/share/backgrounds/
    sleep 3
    cp -r confi_nahfer.zip ~/
    cp -r config.zip ~/
    cd ~/
    unzip confi_nahfer.zip
    clear
    rm -rf .config
    sleep 2
    unzip config.zip
    rm -rf confi_nahfer.zip
    rm -rf config.zip
fi

#cp -r xfce /data/data/com.termux/files/usr/share/backgrounds/
#sleep 3
################## mueve files .config, .themes, .icons a home y los descomprime luego borra el zip
#cp -r confi_nahfer.zip ~/
#cp -r config.zip ~/
#cd ~/
#unzip confi_nahfer.zip
#clear
#rm -rf .config
#sleep 2
#unzip config.zip
#rm -rf confi_nahfer.zip
#rm -rf config.zip
echo

play -q $directorio_nahfer_os/termux_desktop/.audios/confi_nahfer_terminada.mp3 &
sleep 3
echo -e "\e[35m configuracion terminada!!! \e[0m"
echo
################
inicio
}

function configuracion_nahfer_uninstaller(){
clear
play -q $directorio_nahfer_os/termux_desktop/.audios/uninstall_setup_nahfer.mp3 &
sleep 3
echo -e "\e[35m Desinstalando configuracion Nahfer!!! \e[0m"
setterm -foreground green
rm -rf ~/.icons
rm -rf ~/.config
rm -rf ~/.themes
rm -rf ~/Pictures
play -q $directorio_nahfer_os/termux_desktop/.audios/uninstall_correct.mp3 &
sleep 3
inicio
}

function install_xfce4_menu(){
clear
play -q $directorio_nahfer_os/termux_desktop/.audios/distro.mp3 &
inicio_menu=$(dialog --backtitle "NAHFER HACKING" --stdout --title "NAHFER-OS-INSTALL" \
    --menu "" 15 61 7 \
    "1" "Termux       [ Termux            ]" \
    "2" "debian       [ Debian y basados  ]" \
    "3" "Atras        [ Atras             ]")

chosen=$?

case $chosen in
    0)
        echo $(clear)
        if [[ $inicio_menu == 1 ]]; then
           install_xfce4_termux
        elif [[ $inicio_menu == 2 ]]; then
           install_xfce4_debian
        elif [[ $inicio_menu == 3 ]]; then
             inicio
        else
            echo "exit"
        fi
        ;;

esac
}

function desinstalar(){
clear
play -q $directorio_nahfer_os/termux_desktop/.audios/selec.mp3 &
inicio_menu=$(dialog --backtitle "NAHFER HACKING" --stdout --title "NAHFER-OS-INSTALL" \
    --menu "" 15 61 7 \
    "1" "Configuracion Nahfer  [ setup Nahfer  ]" \
    "2" "Escritorio xfce4      [ Desktop xfce4 ]" \
    "3" "Volver                [ Volver        ]")

chosen=$?

case $chosen in
    0)
        echo $(clear)
        if [[ $inicio_menu == 1 ]]; then
           configuracion_nahfer_uninstaller
        elif [[ $inicio_menu == 2 ]]; then
           uninstaller_xfce4
        elif [[ $inicio_menu == 3 ]]; then
             inicio
        else
            echo "exit"
        fi
        ;;

esac
}

function uninstall_xfce4_termux(){
clear
play -q $directorio_nahfer_os/termux_desktop/.audios/uninstall_xfce4.mp3 &
echo -e "\e[35m Desinstalando xfce4 en Termux\e[0m"
setterm -foreground green
apt-get --purge autoremove tigervnc -y
apt-get --purge autoremove -y xfce4
apt-get --purge autoremove -y xfce4-terminal
apt-get --purge autoremove -y xfce4-taskmanager
apt-get --purge autoremove -y xfce4-whiskermenu-plugin
apt-get --purge autoremove -y xfce4-clipman-plugin
#
apt-get --purge autoremove -y xarchiver
apt-get --purge autoremove -y geany
apt-get --purge autoremove -y geany-plugins
apt-get --purge autoremove -y gtk3 gtk2
apt-get --purge autoremove -y mtpaint
apt-get --purge autoremove -y netsurf
apt-get --purge autoremove -y recordmydesktop
apt-get --purge autoremove -y feh
apt-get --purge autoremove -y dosbox
# pkg install -y vim-gtk
apt-get --purge autoremove mousepad -y
apt-get --purge autoremove -y xorg-xhostk
apt-get --purge autoremove -y mpv
apt-get --purge autoremove -y tumbler
apt-get --purge autoremove -y ristretto
apt-get --purge autoremove -y loqui
apt-get --purge autoremove mpv -y
apt-get --purge autoremove mpv-x -y
apt-get --purge autoremove otter-browser -y
apt-get --purge autoremove vim-gtk -y
apt-get --purge autoremove galculator -y
apt-get --purge autoremove tmux -y
apt-get --purge autoremove getconf -y
apt-get --purge autoremove scrub -y
apt-get --purge autoremove audacious -y
apt-get --purge autoremove audacious-plugins -y
#apt-get --purge autoremove pulseaudio -y
play -q $directorio_nahfer_os/termux_desktop/.audios/correct_uninstall_xfce4.mp3 &
sleep 5
inicio
}

function uninstall_xfce4_debian(){
clear
play -q $directorio_nahfer_os/termux_desktop/.audios/uninstall_xfce4.mp3 &
sleep 2
echo -e "\e[35m Desinstalando escritorio xfce4 \e[0m"
apt-get --purge autoremove xfce4 xfce4-terminal tightvncserver -y
apt-get --purge autoremove xfe -y
sleep 2
play -q $directorio_nahfer_os/termux_desktop/.audios/correct_uninstall_xfce4.mp3 &
sleep 5
inicio
}
function uninstaller_xfce4(){
clear
play -q $directorio_nahfer_os/termux_desktop/.audios/distro.mp3 &
inicio_menu=$(dialog --backtitle "NAHFER HACKING" --stdout --title "NAHFER-OS-INSTALL" \
    --menu "" 15 61 7 \
    "1" "Termux       [ Termux            ]" \
    "2" "debian       [ Debian y basados  ]" \
    "3" "Atras        [ Atras             ]")

chosen=$?

case $chosen in
    0)
        echo $(clear)
        if [[ $inicio_menu == 1 ]]; then
           uninstall_xfce4_termux
        elif [[ $inicio_menu == 2 ]]; then
           uninstall_xfce4_debian
        elif [[ $inicio_menu == 3 ]]; then
             inicio
        else
            echo "exit"
        fi
        ;;

esac
}

function update_script(){
play -q $directorio_nahfer_os/termux_desktop/.audios/update_script.mp3 &
cd $directorio_nahfer_os
cd ..
rm -rf Nahfer-OS
git clone https://github.com/capitancomando/Nahfer-OS
cd Nahfer-OS
bash Nahfer-os.sh
}

loading
info
inicio
