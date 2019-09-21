RELOGIO PARA O RETROPIE
(Adiciona data e hora na tela do Emulationstation no Retropie)



Funcionamento: 
O script verifica a conexão , caso esteja online ele sincroniza o horário da raspberry pi com a internet e exibe a informação de data e hora na tela, atualizando de minuto em minuto. Caso a raspberry esteja offline é exibido um ícone de "sem conexão".
O relógio é omitido sempre que um emulador ou o kodi é executado e retoma após isso.

---------------------------------------------------------------------------------------------------------------------------------
  **IMPORTANTE:** 
 Para que data e hora sejam exibidas corretamente é necessário que sua Raspberry pi esteja configurada conforme sua Timezone.
----------------------------------------------------------------------------------------------------------------------------------


   INSTALAÇÃO (Necessário estar conectado à internet): 

    1- Abra o terminal e execute o seguinte comando:
    
    wget -O - "https://raw.githubusercontent.com/jajalobrit/RETROPIE-DATETIME/master/INSTALL.sh" | sudo bash
    
    
    
    A instalação será realizada automaticamente e a Raspberry será reiniciada.
    
           
