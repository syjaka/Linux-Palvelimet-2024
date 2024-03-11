## Work in progress in definately

--- 

### Tämä muistiinpanokimara on muodostunut omien kokeilujeni ja tehtävieni suorituksista. Tarkoiteksena on koota kurssin edetessä kattava cheatsheetti omaan tulevaisuuden harjoitteluun, sekä jäsentää jo opittua. 
Pääosin materiaali koostuu omasta kokemuksesta ja kokeilusta. Selvitystyössä äytetyt lähteet on merkitty loppuun.

1. Linuxin asennus VirtualBoxiin
 > - Asenna kone
 > - Testaa toimivuus navigoimalla selaimella
 > - `Install Debian`
   
2. Terminaalin "alustus"
- päivitykset
>  `sudo apt-get update` + `sudo apt-get -y dist-upgrade`
- Palomuuri
>  `sudo apt-get -y install ufw` + `sudo ufw enable` ja `sudo systemctl restart ufw`
>    ja aukot
>    `sudo ufw allow 22/tcp` - SSH
>    `sudo ufw allow 80/tcp` -http
>    `ufw status` palauttaa tilan
- Guest additions - **devices** + **Insert Guest Additions** + Menen **applications** ja valitse **File manager**ista **Vbox_GAs...CDROM**
>        `cd /media/USER/VBox...` + `ls` + `sudo bash VBoxLinuxAdditions.run` jonka jälkeen järjestelmän uudelleenkäynnistys
- leikepöytä käyttöön : **Devices** + **Shared clipboard** + **Bidirectional**

3. Muiden lisäosien asennus ja käyttöönotto [peruskomennot] ja (https://terokarvinen.com/2020/command-line-basics-revisited/?fromSearch=command%20line%20basics%20revisited) [cheatsheet](https://terokarvinen.com/2022/command-palette-cheatsheet-run-and-make-micro/)
>  - Bash comletion `sudo apt-get -y install bash-completion`
>  -  `sudo apt-get install pwgen` asentaa salasanavelhon ja `pwgen -s 20 1 # pituus 20 kpl 1` generoi niitä.
>  -  `sudo apt install xpad` asentaa tarralaput
>  - Micro = `sudo apt-get -y install micro` ja sen asettaminen defaultiksi `export EDITOR=micro`
>  - plugareita microon
>    > - `ctrl + E` ja `plugin install filemanager`. Käynnistä micro uudelleen, `tree` micron komentoriviltä avaa sen ja `set filemanager.openonstart on` asettaa sen avautumaan micron kanssa. 
>    > - mukavammat värit `ctrl+E` ja `set colorscheme simple`
>    > - rivien wrap microssa `ctrl+E` ja `set miniwrap on`


5. Käyttäjät, ryhmät ja oikeudet

>    - `sudo adduser user` luo käyttäjän `su user`vaihtaa käyttäjään Ennen käyttäjän luontia tee pw `pwgen -s 20 1`
>    - `sudo groupadd kayttajat` luo kayttajat ryhmän
>    - `sudo usermod -a -G kayttajat tavis` lisää tavis-käyttäjän ryhmään kayttajat (-a append lisää ja -G määrittelee mihin ryhmään)
>    - `sudo usermod -g uusiryhma tavis` -g optio asettaa taviksen uuteen pääryhmään joka on ollut tavis taviksen luonnista lähtien
>    - `getent group tavis`tarkastelee tavis-ryhmän jäseniä
>    - `groups tavis`kertoo mihin tavis kuuluu
>    -  `sudo chmod u=rwx,g=rx,o= /polku/kansio` asettaa käyttäjälle `u` kaikki oikeudet, ryhmälle `r` luku oikeudet ja muille `o` ei mitään oikeuksia
>    -  Jokaisen hakemiston oikeudet on määritelty sen metatiedoissa ja yo komennon `g` kertoo sen ryhmän oikeudet mihin kyseinen hakemisto kuuluu
>    -   `sudo chown :uusiryhma /polku/kansio` muuttaa kansio hakemiston uusiryhmälle. `:` rajaa kuitenkin vain oikeuksien muutoksen, omistajuus ei muutu.
>    -   `sudo chgrp ryhmä /polku/kansio` siirtää omistajuudenkin

5. [Apache ja nimipalvelin](https://terokarvinen.com/2018/04/10/name-based-virtual-hosts-on-apache-multiple-websites-to-single-ip-address/) [oma repo](https://github.com/syjaka/Linux-Palvelimet-2024/blob/main/h3_HelloWebServer.md)
>    - `sudo apt-get -y install apache2` asentaa apachen ja `echo "Default"|sudo tee /var/www/html/index.html` korvaa defaultin
>    - `sudoedit /etc/apache2/sites-available/pyora.example.com.conf` luon conffin jonka sisältö:
> >     <VirtualHost *:80>
> >     ServerName pyora.example.com
> >     ServerAlias www.pyora.example.com
> >         DocumentRoot /home/kadi/publicsites/pyora.example.com
> >         <Directory /home/kadi/publicsites/pyora.example.com>
> >           Require all granted
> >        </Directory>
> >        </VirtualHost>
>    -  `cat /etc/apache2/sites-available/pyora.example.com.conf`näyttää luodun conffin
>    - `sudo a2ensite pyora.example.com` aktivoi confin `sudo a2dissite 000-default.conf `poistaa defaultin saatavilta
>    - `sudo systemctl restart apache2`uudelleenkäynnistää asetusten käyttöönottoon
>    - `mkdir -p /home/xubuntu/publicsites/pyora.example.com/` luo hakemiston sivuston sisältötiedostolle
>    - `echo pyora > /home/xubuntu/publicsites/pyora.example.com/index.html` luo em tiedoston ja tallentaa sinne sanan pyörä
>    - `curl -H 'Host: pyora.example.com' localhost `tähän vastaa confitiedoston määrittelemä sisältötiedosto
>    - `curl localhost`  tähän vastaa virtuaalipalvelimen defaultsivu eli aakkosista eka enabled
>    - `sudoedit /etc/hosts` [tiedostoon](https://terokarvinen.com/2018/04/10/name-based-virtual-hosts-on-apache-multiple-websites-to-single-ip-address/) lisätään domainnimet ja ohjaus localhostiin 
>    - Nyt pyora.example.com vastaa selaimella.
>    - apachen lokit `sudo tail /var/log/apache2/other_vhosts_access.log` tai `sudo tail /var/log/apache2/error.log` 

6. Asenna SSH
   Palvelin etäyhteydellä hallintaan
>  -  `sudo apt update`ja `sudo apt upgrade -y` päivittää ajan tasalle
>  -  `sudo apt-get -y install ssh`asentaa sekä palvelimen ja asiakasohjelman
>  -  Vaihtoehtoisesti `sudo apt install openssh-server -y`asentaa vain ssh-palvelimen
>  -  `sudo systemctl status ssh` tarkistaa palvelimen tilan
>  -  `sudo systemctl start ssh`tarvittaessa käynnistä
  Palomuuriin oikeat asetukset
>  -  `sudo ufw allow ssh` `sudo ufw enable` `sudo ufw status` Sallii SSH-palomuurissa
>  -  `ssh <käyttäjänimi>@localhost`testaa eli käynnistääää yhteyden `exit` poistuu

7.  Kirjautumisen automatisointi julkisella SSH-avaimella
>   - tarkastan ssh tilan `systemctl status ssh`
>   - luo omalla koneella ssh avainparin `ssh-keygen` jatkan kolmella returnilla.
>   - `ssh-copy-id  kadi@localhost` kopioin julkisen avaimen kadi-käyttäjän palvelimelle
>   - Pyydettäessä `sudoedit /etc/ssh/sshd_config` komennolla salasanakirjautuminen pois päältä. Muokataan tiedoston #PasswordAuthentication-kohta `no`



8. Lisää käyttäjä ja lukitse root. 
>    - `sudo adduser syrja` luo käyttäjän ja `sudo adduser syrja sudo` lisää käyttäjän sudo ryhmään
>    - testaan käyttäjää ottamalla ssh yhteyden localhostiin `ssh syrja@localhost`salasanan jälkeen sisällä joten homma ok. pois `exit`
>    - root lukitaan tarvittaessa `sudo usermod -- lock root`
>    - `sudoedit /etc/ssh/sshd_config`poistetaan SSH root login käytöstä. Komento avaa conf-tiedoston jonka kohdassa `permitRootLogin`muutetetaan `no`
>    - `su syrja` vaihtaa käyttäjän syrjaksi.
       

    
9.  [Django tuotannossa](https://terokarvinen.com/2022/deploy-django/?fromSearch=django)
   Asenna Django
>  - Testaa apache jos et oo jo testannu ennen djangon asennusta
>  - `sudo apt-get -y install virtualenv` asentaa virtuaalisen kehitysympäristön
>  - `cd`ja `mkdir -p publicwsgi` luo hakemiston ympäristölle.
>  - `cd` ja `cd publicwsgi/` siirtyy kyseiseen hakemistoon
>  - `virtualenv -p python3 --system-site-packages env` luo virtuaaliympäristön
>  - `source env/bin/activate` aktivoi ympäristön `which pip`tsekkaa että ollaan oikeassa miljöössä.
>  - `micro requirements.txt` -> `django` määrittää asennettavan paketin.
>  - `pip install -r requirements.txt` asentaa Djangon, `django-admin --version` tarkistaa asennetun version
  Luo uusi projekti - kadico
>  - `django-admin startproject kadico` luo uuden Django-projektin "kadico"
>  - `sudoedit /etc/apache2/sites-available/kadicoco.conf` editoi virtualhost tiedostoa. [Mallisisältö](https://github.com/syjaka/Linux-Palvelimet-2024/blob/main/images/6.110_kadico_conf.png)
>
>>        Define TDIR /home/kadi/publicswsgi/kadico
>>        Define TWSGI /home/kadi/publicswsgi/kadico/kadico.wsgi.py
>>        Define TUSER kadi
>>        Define TENVN /home/kadi/publicswsgi/env/lib/python3.11/site-packages
>>        
>>        <VirtualHost *:80>
>>           Alias /static ${TDIR}/static
>>            <Directory ${TDIR}/static/>
>>                Require all granted
>>            </Directory>
>>        
>>            WSGIDaemonProcess ${TUSER} user=${TUSER} group=${TUSER} threads=5 python-path="${TDIR}:${TVENV}"
>>            WSGIScriptAlias / ${TWSGI}
>>            <Directory ${TDIR}>
>>                WSGIProcessGroup ${TUSER}
>>                WSGIApplicationGroup %{GLOBAL}
>>                WSGIScriptReloading On
>>                <Files wsgi.py>
>>                    Require all granted
>>                </Files>
>>            </Directory>
>>
>>        </VirtualHost>
>>        
>>        Undefine TDIR
>>        Undefine TWSGI
>>        Undefine TUSER
>>        Undefine TENVN
>
>  - `sudo apt-get -y install libapache2-mod-wsgi-py3`asentaa Apachen WSGI-moduulin `/sbin/apache2 configtest`testaa syntaksin ja ´sudo systemctl restart apache2`ottaa uudet conffit käyttöön.
>  - Testaa toimivuus `curl -s localhost|grep title`jolloin palaute tulisi olla sivun title "The install worked..."
>  - Tarkista vielä että se on apache `curl -sI localhost|grep Server`. Selaimella pitäisi näkyä raketti.
  Debug pois
> - `cd` `cd publicwsgi/kadico` `micro kadico/settings.py` laita `DEBUG false`ja lisää `ALLOWED HOSTS sivu jonka haluat`
> - `touch teroco/wsgi.py`tai `sudo systemctl restart apache2`

8.  Erilaisia skriptejä / [komentojen luonti käyttäjille](https://susannalehto.fi/2022/komentojen-automatisointi-ja-skriptaus-h6/)
   Luo aluksi `mkdir automatisointi`kotihakemistoon HUOM tee nää jonain muuna kuin pääkäyttäjänä
> 1. [Bash]()
>  - Automatisointihakemistossa `mkdir tervehdibash` jonne `micro bashmoikkaa`
>  - `echo "moi kadi"` tallenna ja testaa että toimii `bash bashmoikkaa`
>  - `micro bashmoikkaa`jonne tallennetaan ekalle riville shebang (kertoo mitä tulkkia käytetään skriptin suorittamiseen)`#!/usr/bin/bash` ja toiselle riville `echo "Moikka $1!"`
>  -  `bash bashmoikkaa kadi`tulostaa terminaaliin Hei kadi! 
>  -  vaihtoehtoisesti `#!/usr/bin/bash` ja `echo "Tervetuloa $USER!"` tulostaa komennolla `bashmoikkaa` `Tervetuloa kadi!`
>  -  jos haluaa päivän ja kellonajan tervehdykseen voi listätä muuttujat yksinkertaisesti `date --iso=min`tai monimutkaisemmin `PAIVA=$(date +"%Y-%m-%d")` ja `AIKA=$(date +"%H:%M")`ja rivin `echo "Tänään on $PAIVA ja kello on $AIKA +3UCT."`
> 2. [Python]()
>  - Automatisointihakemistossa `mkdir kerroaika.py`
>  - `micro kello.py`tallennan `#!/usr/bin/bash` rv `from datetime import datetime`rv `nyt = datetime.now()` rv `kellonaika = nyt.strftime("%H:%M:%S")`rv `print(f"Kello on nyt: {kellonaika}")`


9. Sekalaisia komentoja
>  - `ip route`näyttää reititystaulun 
>  - `ip addr show`oman ip-osoitteen jota voi suodattaa vielä näyttämään vain ip ja ip-6 osoitteet`| grep -e inet -e inet6`
>  - `mv vanha_nimi uusi_nimi` -n estää päällekirjoituksen
>  - `rm tiedosto toinen_tiedosto kolmas_tiedosto`poistaa `rm -r hakemisto`poistaa hakemiston
> - `export PS1="\W\$ "`lyhentää promptin kattamaan vain nykyisen hakemiston
>   - `cp -r alkup_hakemisto kopio`


 Lähteet:

Debian Wiki. 2023. [SSH. Debian Wiki](https://wiki.debian.org/SSH). Luettu: 03.2024.

Hakala J. 2019 [Linux komentoja](https://hakala690012106.wordpress.com/2019/03/07/linux-komentoja/) Luettu 03.2024

Github NiclasHH 2024. [Linux-palvelimet](https://github.com/NicklasHH/Linux-palvelimet)

Github Ilona-Hiltunen 2024. [Linux-course2024](https://github.com/Ilona-Hiltunen/linux-course2024)

Lehto S. 2022, [Komentojen automatisointi ja skriptaus](https://susannalehto.fi/2022/komentojen-automatisointi-ja-skriptaus-h6/) Luettu 01.2024

Karvinen T. 2020, [CommandLineRevisited](https://terokarvinen.com/2020/command-line-basics-revisited/?fromSearch=command%20line%20basics%20revisited) Luettu 01.2024
Debian Wiki. 09.11.2023. SSH. Debian Wiki. Luettavissa: https://wiki.debian.org/SSH. Luettu: 26.02.2024.

Karvinen, T. 2021. [Deploy Django 4 - Production Install](https://terokarvinen.com/2022/deploy-django/). Luettu: 06.03.2024.

Karvinen, T. 2021. [Django 4 Instant Customer Database Tutorial](https://terokarvinen.com/2022/django-instant-crm-tutorial/). Luettu: 03.2024.

Karvinen, T. 27.09.2018. [Hello World Python3, Bash, C, C++, Go, Lua, Ruby, Java – Programming Languages on Ubuntu](https://terokarvinen.com/2018/hello-python3-bash-c-c-go-lua-ruby-java-programming-languages-on-ubuntu-18-04/?fromSearch=hello%20world) Luettu: 03.2024.

Karvinen, T. 2023. [Install Debian on Virtualbox - Updated 2023](https://terokarvinen.com/2021/install-debian-on-virtualbox/). Luettu: 02.2024

Karvinen, T. 10.04.2018. [Name Based Virtual Hosts on Apache – Multiple Websites to Single IP Address](https://terokarvinen.com/2018/04/10/name-based-virtual-hosts-on-apache-multiple-websites-to-single-ip-address/). Luettu: 26.02.2024.

Karvinen, T. 04.12.2007. [Shell Scripting](/https:/terokarvinen.com/2007/shell-scripting-4/#see_also). Luettu: 03.2024.



