
#RELOGIO PARA O RETROPIE

#Adiciona data e hora na tela do Retropie.

#Funcionamento: 
#O escript verifica a conexão de internet, caso esteja online sincroniza o horário da raspberry pi com a internet e exibe a informação na tela, atualizando de minuto em minuto. Caso não haja conexão é exibido um ícone de "falta de conexão".
#O relógio é omitido sempre que um emulador ou o kodi é executado e retoma após isso.


#MUITO IMPORTANTE: 
#  Este script substitui os arquivos runcommand-ontstart e runcommand-onend e altera o arquivo rc.local
#  RECOMENDO QUE SEJA FEITO BACKUP DO SEU RETROPIE PARA O CASO DE ALGUM PROBLEMA ACONTECER**
#  PARA QUE FUNCIONE CORRETAMENTE É NECESSÁRIO QUE SUA PLACA ESTEJA CONFIGURADA CONFORME SUA TIMEZONE.
#----------------------------------------------------------------------------------------------------------------------------------
#
#
#   INSTALAÇÃO (Necessário estar conectado à internet): 
#
#    1- Baixe o arquivo INSTALL.SH e coloque na raiz da pasta de jogos do Retropie  /homi/pi/RetroPie/roms
#    2- Acesse o terminal (com usuário pi) e execute o seguinte comando:
#    Sudo chmod +x /homi/pi/RetroPie/roms/INSTALL.sh; /homi/pi/RetroPie/roms/INSTALL.sh 
#    A instalação será executada e ao final a raspberry será reiniciada automaticamente.

