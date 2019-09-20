#!/bin/bash

 ########################################################################################################
##                                    DATA E HORA PARA O RETROPIE                                       ##
 ########################################################################################################
 
#Autor: Jairo Lopes
#https://github.com/jajalobrit
 
while :; do
	## verifica conexão de rede
nc -zw1 google.com 443; 
case $? in
0)  ## se estiver online:
				
		## ajusta o horário da raspberry conforme a internet		
	        sudo date -s "$(wget -qSO- --max-redirect=0 google.com 2>&1 | grep Date: | cut -d' ' -f5-8)Z" >/dev/null&&
		## pega data e hora atuais e transforma em imagem png com fundo preto usando o imagemagik
			sudo convert -size 360x87 xc:black -fill white -font Orbitron-Black -gravity east \
			-pointsize 17 -draw "text 0,0 '$(date "+%A, %d de %B")'" \
			-pointsize 30 -draw "text 0,32 '$(date "+%H:%M")'" /dev/shm/DATAHORA.png
		## converte a imagem com fundo preto em imagem com fundo transparente usando o imagemagik
			sudo convert /dev/shm/DATAHORA.png -fuzz 50% -transparent black /dev/shm/DATAHORA.png;
		## Exibe a imagem na tela durante 1 minuto usando o pngview, apaga e repete o processo	
			sudo /usr/local/bin/pngview -b 0 -l 999997 -y 40 -x 1531 /dev/shm/DATAHORA.png & sleep 1m;sudo pkill -u root pngview;
	
;;	
		
1)  ## se estiver offline:

		## exibe ícone "sem conexão" por 10 segundos usando o pngview, apaga e repete o processo
			sudo pkill -u root pngview
			sleep 2
			sudo /usr/local/bin/pngview -b 0 -l 999997 -y 36 -x 1651 /usr/local/bin/NONET.png & sleep 10;sudo pkill -u root pngview;
		
;;		
esac
done

 ##################################
##          IMPORTANTE            ##
 ##################################
 
## O SCRIPT É INTERROMPIDO QUANDO EMULADOR/KODI É ABERTO E RETOMADO ATRAVES DOS RUNCOMMANDS E DO KODI.SH DISPONIBILIZADOS
## A REGIÃO PRECISA ESTAR CONFIGURADA NA RASPBERRY PARA QUE SEJAM EXIBIDAS DATA E HORA CORRETAS

#listar fontes disponíveis na sua raspberry caso queira substituir a fonte Orbitron-Black: convert -list font
#lista de cores caso queira substituir a atual (white): https://imagemagick.org/script/color.php