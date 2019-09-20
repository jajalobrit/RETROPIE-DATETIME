RELOGIO PARA O RETROPIE

Adiciona data e hora na tela do Retropie.

Funcionamento: 
O script verifica a conexão , caso esteja online ele sincroniza o horário da raspberry pi com a internet e exibe a informação de data e hora na tela, atualizando de minuto em minuto. Caso a raspberry esteja offline é exibido um ícone de "sem conexão".
O relógio é omitido sempre que um emulador ou o kodi é executado e retoma após isso.

---------------------------------------------------------------------------------------------------------------------------------
  **MUITO IMPORTANTE:** 
  Este script substitui os arquivos runcommand-ontstart e runcommand-onend e altera o arquivo rc.local. Recomendo que faça um backup do seu cartão sd antes de prosseguir.
    
  Para que funcione corretamente é necessário que sua Raspberry pi esteja configurada conforme sua Timezone.
----------------------------------------------------------------------------------------------------------------------------------


   INSTALAÇÃO (Necessário estar conectado à internet): 

    1- Baixe o arquivo INSTALL.SH e coloque na raiz da pasta de jogos do Retropie  /homi/pi/RetroPie/roms
    2- Acesse o terminal (com usuário pi) e execute o seguinte comando:
    
    Sudo chmod +x /homi/pi/RetroPie/roms/INSTALL.sh; /homi/pi/RetroPie/roms/INSTALL.sh 
    
    A instalação será executada e ao final a raspberry será reiniciada automaticamente.

