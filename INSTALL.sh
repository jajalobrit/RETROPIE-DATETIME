#!/bin/bash
# Autor: Jairo Lopes

 ###############################################################
##             DATA E HORA NA TELA DO RETROPIE                  ##
 ###############################################################

 
 
 
##### INSTALA O IMAGEMAGIK (SERVE PARA GERAR IMAGENS PNG A PARTIR DE TEXTO) #####
sudo apt-get install imagemagick fbi

##### DOWNLOAD DO SCRIPT E DEMAIS ARQUIVOS NECESSÁRIOS #####
git clone -b https://github.com/jajalobrit/RETROPIE-DATETIME.git
cd ~/RETROPIE-DATETIME
	sudo chmod +x pngview
	sudo cp pngview /usr/local/bin/
cd ~/RETROPIE-DATETIME/
sudo chmod +x TIME.sh
sudo cp TIME.sh /usr/local/bin
sudo cp NONET.png /usr/local/bin
sudo chmod +x runcommand-onstart.sh
sudo chmod +x runcommand-onend.sh.sh
sudo cp runcommand-onstart.sh /opt/retropie/configs/all
sudo cp runcommand-onend.sh /opt/retropie/configs/all



##### ADICIONA FONTE #####
sudo mkdir -p /usr/share/fonts/opentype
sudo cp ORBITRON-BLACK.otf /usr/share/fonts/opentype/

if
[ -d "/home/pi/RetroPie/roms/kodi" ]; then
sudo chmod +x kodi.sh
sudo cp kodi.sh /home/pi/RetroPie/roms/kodi/
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


