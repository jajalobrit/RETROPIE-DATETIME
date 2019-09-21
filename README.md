***#RELOGIO PARA O RETROPIE***   
(Adiciona data e hora atualizadas pela internet no Retropie)






**FUNCIONAMENTO:**
<br />O script verifica a conexão e caso esteja online ele sincroniza o horário da Raspberry Pi com a internet e exibe a informação de data e hora na tela, atualizando de minuto em minuto. 
<br />Caso a Raspberry esteja offline é exibido um ícone de "sem conexão" 
<br />O relógio é omitido sempre que um emulador ou o kodi é executado e retoma após isso 

---------------------------------------------------------------------------------------------------------------------------------
**IMPORTANTE:**
Para que data e hora sejam exibidas corretamente é necessário que sua Raspberry pi esteja configurada conforme sua Timezone.

Para configurar: 
 <br />1-Entre no menu do Retropie e vá até: >Raspiconfig >4 Localisation Options >I1 Change Locale 
 <br />2-Desmarque a opção en_GB.UTF-8 UTF-8 que vem marcada por padrão 
 <br />3-Procure e marque a opção pt_BR.UTF-8 UTF-8 e dê enter, na próxima tela selecione novamente pt_BR.UTF-8 UTF-8, selecione "OK" e dê enter 
 <br />4-Entre novamente em Retropie >Raspiconfig >4 Localisation Options >I2 Change timezone 
<br />5-Selecione "America" e em seguida OK 
 <br />6-Agora selecione SAO_PAULO e OK 
 <br />7-FINISH para sair 
 <br />8-Reinicie a Rapsberry 
 
----------------------------------------------------------------------------------------------------------------------------------


**INSTALAÇÃO:** 
Com a raspberry conectada à internet abra o terminal e execute o seguinte comando:
    
<div style="display: inline">**wget -O - "https://raw.githubusercontent.com/jajalobrit/RETROPIE-DATETIME/master/INSTALL.sh" | sudo bash**
    
A instalação será realizada automaticamente e a Raspberry será reiniciada.   

----------------------------------------------------------------------------------------------------------------------------------

<br />Caso queira trocar a cor do relógio basta abrir o terminal e executar o seguinte comando trocando **NOME-DA-COR**  pelo nome da cor desejada: 

<br />**find /usr/local/bin/ -iname TIME.sh -exec sudo sed -i 's,-fill .*. -font,-fill NOME-DA-COR -font,g' {} \\;**  
<br />Em seguida reinicie a Raspberry para a que a nova cor passe a ser exibida.  


<br />Lista com as cores disponíveis: 
https://imagemagick.org/script/color.php



