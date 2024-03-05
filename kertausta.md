1. Linuxin asennus VirtualBoxiin
 > - Asenna kone
 > - Testaa toimivuus navigoimalla selaimella
 > - `Install Debian`
   
2. Terminaalin "alustus"
>  - päivitykset
>     `sudo apt-get update` + `sudo apt-get -y dist-upgrade`
>  - Palomuuri
>     `sudo apt-get -y install ufw` + `sudo ufw enable` ja `sudo systemctl restart ufw`
>    ja aukot
>   - `sudo ufw allow 22/tcp` - SSH
>   - `sudo ufw allow 80/tcp` -http
>   - `sudo ufw allow/443/tcp` - TSL encrypted
>  - Guest additions - **devices** + **Insert Guest Additions** + Menen **applications** ja valitse **File manager**ista **Vbox_GAs...CDROM**
>        `cd /media/USER/VBox...` + `ls` + `sudo bash VBoxLinuxAdditions.run` jonka jälkeen järjestelmän uudelleenkäynnistys
>  - leikepöytä käyttöön : **Devices** + **Shared clipboard** + **Bidirectional**

3. Muiden lisäosien asennus ja käyttöönotto [peruskomennot]([https://terokarvinen.com/2009/command-line-basics-4/](https://terokarvinen.com/2020/command-line-basics-revisited/?fromSearch=command%20line%20basics%20revisited)) [cheatsheet](https://terokarvinen.com/2022/command-palette-cheatsheet-run-and-make-micro/)
>  - Bash comletion `sudo apt-get -y install bash-completion` 
>  - Micro = `sudo apt-get -y install micro` ja sen asettaminen defaultiksi `export EDITOR=micro` ja valitse micro
>    - plugareita microon
>       - `plugin install misspell`on luhärön paras kaveri.
>       -  `git clone https://github.com/terokarvinen/micro-run.git` luo ajettavan terminaalin suoraan microon F5 suorittaa return sulkee
>       - `git clone https://github.com/terokarvinen/micro-cheat.git` asentaa micron bash-completionia vastaavan Fi avaa uuteen ikkunaan kyseisen kielen
>        - rivien wrap microssa `ctrl+E` ja `set miniwrap on`
>        - mukavammat värit `ctrl+E` ja `set colorscheme simple`

>
4. Yleisiä niksejä
>    - `export PS1="\W\$ "`lyhentää promptin kattamaan vain nykyisen hakemiston
>    - sudo `adduser user` luo käyttäjän `su user`vaihtaa käyttäjään
>    - `sudo apt-get install pwgen` asentaa salasanavelhon ja `pwgen -s 20 1 # randomize a password` generoi niitä
>    - `sudo apt install xpad` asentaa tarralaput
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

5. Lisää käyttäjä ja lukitse root ja asenna ssh tai vaihda käyttäjää

>    - `sudo adduser syrja` luo käyttäjän ja `sudo adduser syrja sudo`lisää käyttäjän sudo ryhmään
>    - `sudo apt-get -y install ssh`asentaa ssh:n
>    - testaan käyttäjää ottamalla ssh yhteyden localhostiin `ssh syrja@localhost`salasanan jälkeen sisällä joten homma ok. pois `exit`
>    - root lukitaan tarvittaessa `sudo usermod -- lock root`
>    - `sudoedit /etc/ssh/sshd_config`poistetaan SSH root login käytöstä. komento avaa conf-tiedoston jonka kohdassa `permitRootLogin`muutetetaan `no`
>    - `su user`
       
6.  kirjautumisen automatisointi julkisella SSH-avaimella
>   - tarkastan ssh tilan `systemctl status ssh`
>   - luon omalla koneellanio ssh avainparin `ssh-keygen` jatkan kolemlla returnilla
>   - `ssh-copy-id  kadi@localhost`kopioin julkisen avaimen palvelimelleni
>   - `sudoedit /etc/ssh/sshd_config` komennolla salasanakirjautuminen pois päältä. Muokataan tiedoston #PasswordAuthentication-kohta `no`
    
7.  [Django tuotannossa](https://terokarvinen.com/2022/deploy-django/?fromSearch=django)
>  - `sudo apt-get -y install virtualenv` asentaa virtuaalisen kehitysympäristön
>  - `cd`ja `mkdir -p publicwsgi` luo hakemiston ympäristölle (tarkista onko tarpeen vai tuleeko autom. ylemmän komennnon seurauksena)
>  - `cd`ja `cd publicwsgi/` siirtyy kyseiseen hakemistoon
>  - `virtualenv -p python3 --system-site-packages env` luo virtuaaliympäristön
>  - `source env/bin/activate` aktivoi ympäristön `which pip`tsekkaa että ollaan oikeassa miljöössä
>  - `micro requirements.txt` -> `django` määrittää asennettavan paketin testaa toimiiko `django < requirements.txt` suoraan
>  - `pip install -r requirements.txt`asentaa Djangon, `django-admin --version`tarkistaa asennetun version
>  - `django-admin startproject kadico` luo uuden Django-projektin
>  - `sudoedit /etc/apache2/sites-available/kadicoco.conf`editoi virtualhost tiedostoa. [Mallisisältö](https://github.com/syjaka/Linux-Palvelimet-2024/blob/main/images/6.110_kadico_conf.png)
>  - `sudo apt-get -y install libapache2-mod-wsgi-py3`asentaa Apachen WSGI-moduulin `/sbin/apache2 configtest`testaa syntaksin
>  - 
>  - >  - 

8.  
