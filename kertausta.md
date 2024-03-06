## Work in progress in definately

--- 

### Tämä muistiinpanokimara on muodostunut omien kokeilujeni ja tehtävieni suorituksista. Tarkoiteksena on koota kurssin edetessä kattava cheatsheetti omaan tulevaisuuden harjoitteluun, sekä jäsentää jo opittua. 
Pääosin materiaali koostuu omasta kokemuksesta ja kokeilusta. Käytetyt lähteet on merkitty tekstiin ja loppuun

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

3. Muiden lisäosien asennus ja käyttöönotto [peruskomennot](https://terokarvinen.com/2020/command-line-basics-revisited/?fromSearch=command%20line%20basics%20revisited) [cheatsheet](https://terokarvinen.com/2022/command-palette-cheatsheet-run-and-make-micro/)
>  - Bash comletion `sudo apt-get -y install bash-completion` 
>  - Micro = `sudo apt-get -y install micro` ja sen asettaminen defaultiksi `export EDITOR=micro` ja valitse micro
>    - plugareita microon
>       - `micro --plugin install misspell`on luhärön paras kaveri. [lähde](https://github.com/CamilleScholtz/micro-misspell-plugin)
>         `cd $HOME/.config/micro/plug/`
>       -  `git clone https://github.com/terokarvinen/micro-run.git` luo ajettavan terminaalin suoraan microon F5 suorittaa return sulkee. 
>       - `git clone https://github.com/terokarvinen/micro-cheat.git` asentaa micron bash-completionia vastaavan Fi avaa uuteen ikkunaan kyseisen kielen
>        - rivien wrap microssa `ctrl+E` ja `set miniwrap on`
>        - mukavammat värit `ctrl+E` ja `set colorscheme simple` (Karvinen, 2020)
>

4. Yleisiä niksejä
>    - `sudo apt-get install pwgen` asentaa salasanavelhon ja `pwgen -s 20 1 # randomize a password` generoi niitä
>    - `sudo apt install xpad` asentaa tarralaput

5. Käyttäjät, ryhmät ja salasanageneraattori
>    - `export PS1="\W\$ "`lyhentää promptin kattamaan vain nykyisen hakemiston
>    - sudo `adduser user` luo käyttäjän `su user`vaihtaa käyttäjään
>    - `groupadd kayttajat`luo kayttajat ryhmän
>    - `sudo usermod -a -G kayttajat tavis` lisää tavis-käyttäjän ryhmään kayttajat (-a append lisää ja -G määrittelee mihin ryhmään)
>    - `sudo usermod -g uusiryhma tavis` -g optio asettaa taviksen uuteen pääryhmään joka on ollut tavis taviksen luonnista lähtien
>    - `getent group tavis`tarkastelee tavis-ryhmän jäseniä
>    - `groups tavis`kertoo mihin tavis kuuluu
>    -  `sudo chmod u=rwx,g=rx,o= /polku/kansio` asettaa käyttäjälle `u` kaikki oikeudet, ryhmälle `r` luku oikeudet ja muille `o``ei mitään oikeuksia
>    -  Jokaisen hakemiston oikeudet on määritelty sen metatiedoissa ja yo komennon `g`kertoo sen ryhmän oikeudet mihin kyseinen halemisto kuuluu
>    -   `sudo chown :uusiryhma /polku/kansio` muuttaa  kansio hakemiston uusiryhmälle. : rajaa kuitenkin vain oikeuksien muutoksen, omistajuus ei muutu.

5. [Apache ja nimipalvelin](https://httpd.apache.org/docs/2.4/vhosts/name-based.html)
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
>     - `sudoedit /etc/hosts` [tiedostoon](https://terokarvinen.com/2018/04/10/name-based-virtual-hosts-on-apache-multiple-websites-to-single-ip-address/) lisätään domainnimet ja ohjaus localhostiin 
>     - Nyt koira.example.com ja pyora.example.com vastaa selaimella

6. Lisää käyttäjä ja lukitse root ja asenna ssh tai vaihda käyttäjää

>    - `sudo adduser syrja` luo käyttäjän ja `sudo adduser syrja sudo`lisää käyttäjän sudo ryhmään
>    - `sudo apt-get -y install ssh`asentaa ssh:n
>    - testaan käyttäjää ottamalla ssh yhteyden localhostiin `ssh syrja@localhost`salasanan jälkeen sisällä joten homma ok. pois `exit`
>    - root lukitaan tarvittaessa `sudo usermod -- lock root`
>    - `sudoedit /etc/ssh/sshd_config`poistetaan SSH root login käytöstä. komento avaa conf-tiedoston jonka kohdassa `permitRootLogin`muutetetaan `no`
>    - `su user`
       
7.  kirjautumisen automatisointi julkisella SSH-avaimella
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
>  - 

8.  Erilaisia skriptejä / [komentojen luonti käyttäjille](https://susannalehto.fi/2022/komentojen-automatisointi-ja-skriptaus-h6/)
   Luo aluksi `mkdir automatisointi`kotihakemistoon HUOM tee nää jonain muuna kuin pääkäyttäjänä
> 1. [Bash]()
>  - Automatisointihakemistossa `mkdir tervehdibash` jonne `micro bashmoikkaa`
>  - `echo "moi kadi"` tallenna ja testaa että toimii `bash bashmoikkaa`
>  - `micro bashmoikkaa`jonne tallennetaan ekalle riville shebang (kertoo mitä tulkkia käytetään skriptin suorittamiseen)`#!/usr/bin/bash` ja toiselle riville `echo "Moikka $1!"`
>  -  `bash bashmoikkaa kadi`tulostaa terminaaliin Hei kadi! 
>  -  vaihtoehtoisesti `#!/usr/bin/bash` ja `echo "Tervetuloa $USER!"` tulostaa komennolla `bashmoikkaa` `Tervetuloa kadi!`
>  -  jos haluaa päivän ja kellonajan tervehdykseen voi listätä muuttujat `PAIVA=$(date +"%Y-%m-%d")` ja `AIKA=$(date +"%H:%M")`ja rivin `echo "Tänään on $PAIVA ja kello on $AIKA +3UCT."`
> 2. [Python]()
>  - Automatisointihakemistossa `mkdir kerroaika.py`
>  - `micro kello.py`tallennan `#!/usr/bin/bash` rv `from datetime import datetime`rv `nyt = datetime.now()` rv `kellonaika = nyt.strftime("%H:%M:%S")`rv `print(f"Kello on nyt: {kellonaika}")`
>
> Lähteet:
>
> Lehto S. 2022, Komentojen automatisointi ja skriptaus. Luettavissa https://susannalehto.fi/2022/komentojen-automatisointi-ja-skriptaus-h6/. Luettu 01.2024
> Karvinen T. 2020, CommandLineRevisited. Luettavissa: https://terokarvinen.com/2020/command-line-basics-revisited/?fromSearch=command%20line%20basics%20revisited. Luettu 01.2024

