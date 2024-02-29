1. Linuxin asennus VirtualBoxiin
 > - Asenna kone
 > - Testaa toimivuus navigoimalla selaimella
 > - `Install Debian`
   
2. Terminaalin "alustus"
>  - päivitykset
>     `sudo apt-get update` + `sudo apt-get -y dist-upgrade`
>  - Palomuuri
>     `sudo apt-get -y install ufw` + `sudo ufw enable` ja `sudo systemctl restart ufw`
>    ja aukot `sudo ufw allow 22/tcp` ja `sudo ufw allow 80/tcp`
>  - Guest additions - **devices** + **Insert Guest Additions** + Menen **applications** ja valitse **File manager**ista **Vbox_GAs...CDROM**
>        `cd /media/*/VBox**` + `ls` + `sudo bash VBoxLinuxAdditions.run` jonka jälkeen järjestelmän uudelleenkäynnistys
>  - leikepöytä käyttöön : **Devices** + **Shared clipboard** + **Bidirectional**

3. Muiden lisäosien asennus ja käyttöönotto
>    - Micro = `sudo apt-get -y install micro` ja sen asettaminen defaultiksi `select-editor` ja valitse micro
>        - rivien wrap microssa `ctrl+E` ja `set miniwrap on`
>        - mukavammat värit `ctrl+E` ja `set colorscheme simple`
>    - Bash comletion `sudo apt-get -y install bash-completion`
>     
4. Apache ja nimipalvelin
>    - `sudo apt-get -y install apache2`asentaa apachen ja `echo "Default"|sudo tee /var/www/html/index.html` korvaa defaultin
>    - `sudoedit /etc/apache2/sites-available/pyora.example.com.conf`luon conffin jonka sisältö:
>          <VirtualHost *:80>
>         ServerName pyora.example.com
>         ServerAlias www.pyora.example.com
>          DocumentRoot /home/kadi/publicsites/pyora.example.com
>          <Directory /home/kadi/publicsites/pyora.example.com>
>            Require all granted
>          </Directory>
>         </VirtualHost>
>     - `cat /etc/apache2/sites-available/pyora.example.com.conf`näyttää luodon conffin
>     - `sudo a2ensite pyora.example.com` aktivoi confin
>     - `sudo systemctl restart apache2`uudelleenkäynnistää asetusten käyttöönottoon
>     - `mkdir -p /home/xubuntu/publicsites/pyora.example.com/` luo hakemiston sivuston sisältötiedostolle
>     - `echo pyora > /home/xubuntu/publicsites/pyora.example.com/index.html` luo em tiedoston ja tallentee sinne sanan pyörä
>     - `curl -H 'Host: pyora.example.com' localhost`tähän vastaa confitiedoston määrittelemä sisältötiedosto
>     - `curl localhost`  tähän vastaa virtuaalipalvelimen defaultsivu eli aakkosista eka enabled
>     - `sudoedit /etc/hosts` tiedostoon lisätään domainnimet ja ohjaus localhostiin
>     - Nyt koira.example.com ja pyora.example.com vastaa selaimella

5. Lisää käyttäjä ja lukitse root ja asenna ssh

>    - `sudo adduser syrja` luo käyttäjän ja `sudo adduser syrja sudo`lisää käyttäjän sudo ryhmään
>    - `sudo apt-get -y install ssh`asentaa ssh:n
>    - testaan käyttäjää ottamalla ssh yhteyden localhostiin `ssh syrja@localhost`salasanan jälkeen sisällä joten homma ok. pois `exit`
>    - root lukitaan tarvittaessa `sudo usermod -- lock root`
>    - `sudoedit /etc/ssh/sshd_config`poistetaan SSH root login käytöstä. komento avaa conf-tiedoston jonka kohdassa `permitRootLogin`muutetetaan `no`
       
6.  kirjautumisen automatisointi julkisella SSH-avaimella
>   - tarkastan ssh tilan `systemctl status ssh`
>   - luon omalla koneellanio ssh avainparin `ssh-keygen` jatkan kolemlla returnilla
>   - `ssh-copy-id  kadi@localhost`kopioin julkisen avaimen palvelimelleni
>   - `sudoedit /etc/ssh/sshd_config` komennolla salasanakirjautuminen pois päältä. Muokataan tiedoston #PasswordAuthentication-kohta `no`
  

    - 
7.  
