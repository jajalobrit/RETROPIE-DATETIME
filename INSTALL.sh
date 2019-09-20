#!/bin/bash

# Autor: Jairo Lopes

 ###############################################################
##             DATA E HORA NA TELA DO RETROPIE                  ##
 ###############################################################

 
 
 
##### INSTALA O IMAGEMAGICK (SERVE PARA GERAR IMAGENS PNG A PARTIR DE TEXTO) #####
sudo apt-get install imagemagick fbi &&

##### DOWNLOAD DOS ARQUIVOS NECESSÁRIOS #####
cd /usr/local/bin/
sudo wget "https://raw.githubusercontent.com/jajalobrit/RETROPIE-DATETIME/master/TIME.sh" &&
sudo chmod +x /usr/local/bin/TIME.sh;

cd /usr/local/bin/
sudo wget "https://raw.githubusercontent.com/jajalobrit/RETROPIE-DATETIME/master/pngview" &&
sudo chmod +x /usr/local/bin/pngview;

cd /usr/local/bin/
sudo wget "https://raw.githubusercontent.com/jajalobrit/RETROPIE-DATETIME/master/NONET.png";

cd /opt/retropie/configs/all/
sudo wget "https://raw.githubusercontent.com/jajalobrit/RETROPIE-DATETIME/master/runcommand-onstart.sh" &&
sudo chmod +x /usr/local/bin/runcommand-onstart.sh;
sudo wget "https://raw.githubusercontent.com/jajalobrit/RETROPIE-DATETIME/master/runcommand-onend.sh" &&
sudo chmod +x /usr/local/bin/runcommand-onend.sh;

sudo mkdir -p /usr/share/fonts/opentype
cd /usr/share/fonts/opentype/
sudo wget "https://raw.githubusercontent.com/jajalobrit/RETROPIE-DATETIME/master/ORBITRON-BLACK.otf";

if
[ -d "/home/pi/RetroPie/roms/kodi" ]; then
cd /home/pi/RetroPie/roms/kodi/
sudo wget "https://raw.githubusercontent.com/jajalobrit/RETROPIE-DATETIME/master/kodi.sh";
sudo chmod +x kodi.sh
fi

if
[ -d "/home/pi/RetroPie/roms/ports" ]; then
cd /home/pi/RetroPie/roms/ports/
sudo wget "https://raw.githubusercontent.com/jajalobrit/RETROPIE-DATETIME/master/kodi.sh";
sudo chmod +x kodi.sh
fi



##### COLOCA O SCRIPT PARA SER EXECUTADO AUTOMATICAMENTE DURANTE O BOOT #####

sudo sed '/fi/ a "/usr/local/bin/TIME.sh"' /etc/rc.local > tmp.local && mv -f tmp.local /etc/rc.local >/dev/null


#####FINALIZADO, SÓ AGUARDAR O REBOOT"
printf "\n\n\n"
echo "INSTALACAO CONCLUIDA"
echo "O SISTEMA REINICIARA AUTOMATICAMENTE"
echo "POR FAVOR AGUARDE."
sleep 3
sudo reboot

