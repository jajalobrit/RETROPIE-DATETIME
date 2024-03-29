#!/bin/bash

# Autor: Jairo Lopes

                                  ###############################################################
   ################################             DATA E HORA NA TELA DO RETROPIE                  ##################################
                                  ###############################################################

   
##### INSTALA O IMAGEMAGICK (SERVE PARA GERAR IMAGENS PNG A PARTIR DE TEXTO) #####
printf "\n\n"
echo "INSTALANDO IMAGEMAGICK!"
yes | sudo apt-get install imagemagick fbi &&
printf "\n\n"
echo -e "\033[1;32m IMAGEMAGICK OK! \033[0m"



############################################ DOWNLOAD DOS ARQUIVOS NECESSÁRIOS ##################################################
printf "\n\n"
echo "BAIXANDO ARQUIVOS"
cd /usr/local/bin/;
sudo wget -O TIME.sh "https://raw.githubusercontent.com/jajalobrit/RETROPIE-DATETIME/master/TIME.sh" &&
sudo chmod +x /usr/local/bin/TIME.sh;
cd /usr/local/bin/;
sudo wget -O pngview "https://raw.githubusercontent.com/jajalobrit/RETROPIE-DATETIME/master/pngview" &&
sudo chmod +x /usr/local/bin/pngview;
cd /usr/local/bin/;
sudo wget -O NONET.png "https://raw.githubusercontent.com/jajalobrit/RETROPIE-DATETIME/master/NONET.png" &&
printf "\n\n"
echo -e "\033[1;32m ARQUIVOS OK! \033[0m"



########################################### CONFIGURA RUNCOMMANDS ###############################################################
echo "CONFIGURANDO RUNCOMMAND-ONSTART"
if fgrep -q -e "sudo pkill TIME.sh" /opt/retropie/configs/all/runcommand-onstart.sh
then
printf "\n\n"
echo -e "\033[1;32m RUNCOMMAND-ONSTART OK! \033[0m"
elif
fgrep -q -e "sudo pkill radio.sh" /opt/retropie/configs/all/runcommand-onstart.sh
then
echo -e "sudo pkill TIME.sh" >> /opt/retropie/configs/all/runcommand-onstart.sh
printf "\n\n"
echo -e "\033[1;32m RUNCOMMAND-ONSTART OK! \033[0m"
elif
[ -d "/opt/retropie/configs/all/runcommand-onstart.sh" ]; then
   echo -e "sudo pkill TIME.sh
sudo pkill -u root pngview" >> /opt/retropie/configs/all/runcommand-onstart.sh
printf "\n\n"
echo -e "\033[1;32m RUNCOMMAND-ONSTART OK! \033[0m"
else
cd /opt/retropie/configs/all/;
wget -O runcommand-onstart.sh "https://raw.githubusercontent.com/jajalobrit/RETROPIE-DATETIME/master/runcommand-onstart.sh" &&
sudo chmod +x /opt/retropie/configs/all/runcommand-onstart.sh;
printf "\n\n"
echo -e "\033[1;32m RUNCOMMAND-ONSTART OK! \033[0m"
fi

echo "CONFIGURANDO RUNCOMMAND-ONEND"
if fgrep -q -e "/usr/local/bin/TIME.sh &" /opt/retropie/configs/all/runcommand-onend.sh
then
printf "\n\n"
echo -e "\033[1;32m RUNCOMMAND-ONEND OK! \033[0m"
elif
fgrep -q -e "radio.sh" /opt/retropie/configs/all/runcommand-onend.sh
then
echo -e "/usr/local/bin/TIME.sh &" >> /opt/retropie/configs/all/runcommand-onend.sh
printf "\n\n"
echo -e "\033[1;32m RUNCOMMAND-ONEND OK! \033[0m"
elif
[ -d "/opt/retropie/configs/all/runcommand-onend.sh" ]; then
   echo -e "/usr/local/bin/TIME.sh &" >> /opt/retropie/configs/all/runcommand-onend.sh
printf "\n\n"
echo -e "\033[1;32m RUNCOMMAND-ONNEND OK! \033[0m"
else
cd /opt/retropie/configs/all/;
wget -O runcommand-onend.sh "https://raw.githubusercontent.com/jajalobrit/RETROPIE-DATETIME/master/runcommand-onend.sh" &&
sudo chmod +x /opt/retropie/configs/all/runcommand-onend.sh;
printf "\n\n"
echo -e "\033[1;32m RUNCOMMAND-ONNEND OK! \033[0m"
fi


######################################################### INSTALA FONTE ##########################################################
echo "INSTALANDO FONTE"
sudo mkdir -p /usr/share/fonts/opentype &&
cd /usr/share/fonts/opentype/
sudo wget -O ORBITRON-BLACK.otf "https://raw.githubusercontent.com/jajalobrit/RETROPIE-DATETIME/master/ORBITRON-BLACK.otf" &&
printf "\n\n"
echo -e "\033[1;32m FONTE OK! \033[0m"
sleep 1

####################################################### CONFIGURA KODI.SH ########################################################
echo "CONFIGURANDO KODI.SH"
if
[ -d "/home/pi/RetroPie/roms/kodi" ]; then
cd /home/pi/RetroPie/roms/kodi/
sudo wget -O kodi.sh "https://raw.githubusercontent.com/jajalobrit/RETROPIE-DATETIME/master/kodi.sh" &&
sudo chmod +x kodi.sh
printf "\n\n"
echo -e "\033[1;32m KODI.SH OK! \033[0m"
fi

if
[ -d "/home/pi/RetroPie/roms/ports/kodi.sh" ]; then
cd /home/pi/RetroPie/roms/ports/
sudo wget -O kodi.sh "https://raw.githubusercontent.com/jajalobrit/RETROPIE-DATETIME/master/kodi.sh" &&
sudo chmod +x kodi.sh
printf "\n\n"
echo -e "\033[1;32m KODI.SH OK! \033[0m"
fi


############################ COLOCA O SCRIPT PARA SER EXECUTADO AUTOMATICAMENTE #################################################
echo "CONFIGURANDO RC.LOCAL"
if fgrep -q -e "/usr/local/bin/TIME.sh &" /etc/rc.local
then
printf "\n\n"
echo -e "\033[1;32m RC.LOCAL OK! \033[0m"
else
sudo sed -i '/fi/a /usr/local/bin/TIME.sh &' /etc/rc.local
printf "\n\n"
echo -e "\033[1;32m RC.LOCAL OK! \033[0m"
fi


############################# COLOCA A lAYER DAS SPLASHSCREENS ACIMA DO RELÓGIO #################################################
find /opt/retropie/supplementary/splashscreen/ -iname asplashscreen.sh -exec sudo sed -i 's,10000,999999,g' {} \;


################################################# FINALIZANDO ##################################################################
printf "\n\n\n"
echo -e "\033[1;32m INSTALAÇÃO CONCLUÍDA \033[0m"
echo -e "\033[1;32m REINICIANDO EM 5 SEGUNDOS \033[0m"
sleep 5 
sudo reboot
