## Keskeneräinen

## DJ ango

Kuudennessa tehtävässä tuli tiivistää alkuksi Karvisen artikkelit [Django 4 Instant Customer Databse Tutorial]() ja [Deploy Django 4 - Production Install](). 
Tiivistelmien jälkeen tuli ohjeiden avulla toteuttaa yksinkertainen esimerkkiohjelma Djangolla ja toteuttaa Djangon tuotantotyypin asennus.

- x)[ tiivistelmät]()
- a)[ Yksinkertainen esimerkkiohjelma Djangolla]()
- b)[ Djangon tuotantotyyppinen asennus]()
- z)[ kolmas tehtävä]()
- y)[ Työskentely-ympäristö]()
- z)[Alkutoimenpiteet]()

---
  ## x) tiivistelmät
  ### Django 4 Instant Customer Database Tutorial
  Artikkelissa opastetaan web-käyttöliittymällä toimivan asiakastietokannan rakentamisesta, johon useampi käyttäjä voi kirjautua ja muokata. Aluksi asennetaan virtuaalinen kehitysympäristö ja sitten määritellään projektin sisältö. Tässä tapauksessa luodaan CRM-app, joka sallii asiakkaiden lisäämisen tietokantaan ja sen jälkeen listaa nimet lisätyn str-metodin avulla sivulle näkyväksi. Seuraavaksi olen listannut koko artikkelin ohjeet ranskailaisin viivoin omaa ymmärtämystäni helpottamaan. Varsinainen tiivistelmnä on yllä ja kaikki allaoleva on ylimääräistä tiivistelmän "ulkopuolista" muistiinpanoa.
  - Aluksi opastetaan virtuaalisen kihitysympäristön luontia komennoilla `sudo apt-get -y install virtualenv`ja `virtualenv --system-site-packages -p python3 env/`
  - `source env/bin/activate`komennolla luotu ympäristä aktivoidaan
  - Kehoitus että ainoastaan virtuaalisissa ympäristöissä kannattaa käyttä pip-komentoja `which pip`(joka tarkastaa mikä pip versio on
  - käytössä/missä se on ja palauttaa `/home/tero/env/bin/pip`
  - Seuraavaksi luodaan tekstitiedosto joka sisältää tiedon Python paketeista, tällä kertaa vain Django `micro requirements.txt`johon kirjoitetaan django ja tallennetaan.
  - `cat requirements.txt`tarkistaa juuri luodon tiedoston sisällön
  - `pip install -r requirements.txt`asentaa tiedostossa mainitun djangon käyttäen pip ja `django-admin --version`tarkistaa asennetun djangon version
  - `django-admin startproject teroco`luo uuden Django-projektin "teroco" 
  - Seuraavaksi siirrytään teroco-projektikansioon `cd teroco`
  - `./manage.py runserver `käynnistää kehityspalvelimen käyttäen manage.py skriptiä
  - siirryttäessä selaimella osoitteeseen 127.0.0.1:8000 avautuu projektin etusivu
  -`./manage.py makemigrations`ja `./manage.py migrate`  päivittää tietokannat 
  - `./manage.py createsuperuser` lisää ylläpitokäyttäjän Komento `sudo apt-get install pwgen` asentaa salasanageneraattorin ja `pwgen -s 20 1 # randomize a password`generoi 20 merkkiä pitkän salasanan
  - Django tarjoaa hallintaliittymän veloituksetta ja `http://127.0.0.1:8000/admin/`avaa hallintaliittymän kirjautumissivun.
  - `s./manage.py startapp crm`luo nuuden kansion crm uudelle crm apille. App `crm` lisätään settings.py tiedoston INTALLED_APPS osioon.
  - `micro crm/models.py` avaa tiedoston jonne lisätään `models.Model`-luokasta periytyvä Customer-luokka. Jolloin Django luo "Name" sarakkeen "Customer" tauluun  tietokannassa.
  - Seuraavaksi taas päivitetään tietokannat: `./manage.py makemigrations`ja `./manage.py migrate`
  - `micro crm/admin.py` tiedostostoon rekisteröidään ´Customer`-malli admimnin kanssa.
  - `./manage.py runserver`käynnistää taas Django kehityspalvelimen jonka jälkeen `http://127.0.0.1:8000/admin/`avaa Djangon kirjautumissivun
  - Seuraavaksi ohjeistetaan Customer-luokan muokkaus siten että listauksessa näkyy objektien sijaan nimet.
  - `micro crm/models.py`avaa customer-luokan "määritelmä"-tiedoston. Tänne lisätään str-metodi joka palauttaa asiakkaan nimen esitettäväksi. (Karvinen, 2021)
    
### Deploy Django 4 - Production Install

Djangon avulla web-sovelluksien luominen on helppoa. Julkaiseminen internetisää vaatii oikeaa tuotantotason palvelinta. Aluksi luodaan web-sisältö ja virtuaalipalvelin. Luodaan uusi virtuaaliympäristö johon asennetaan django. Tämän jälkeen luodaan uusi Django projekti.
Seuraava askel on määrittää apache tarjoamaan Python ohjelmia, kuten Django, tämä vaatii kolemn absoluuttisen polun infoa: 1. Projekton pääkansio `manage.py`2. Polku `wsgi.py` tiedostoon, sekä 3. Virtuaaliympäristön `site-packages`-hakemiston polku

  - Aluksi päivitetään ja asennetaan halutut lisäohjelmat
  - Seuraavaksi asennetaan apache ja luodaan web-sisältö käyttäjäoikeuksin
      `cd` + `mkdir -p publicwsgi/teroco/static/`+ `echo "Statically see you at TeroKarvinen.com."|tee` +  `publicwsgi/teroco/static/index.html`
  - Ja virtualhost joka ohjaa sisältöön `sudoedit /etc/apache2/sites-available/teroco.conf`
  - Täytä conf-tiedostoon `Alias /static/ /home/tero/publicwsgi/teroco/static/`ja `<Directory /home/tero/publicwsgi/teroco/static/>`
  - Seuraavaksi enabloi luotu conf ja disabloi defaultsivu
  - `sudo a2ensite teroco.conf`tarkistaa luodut confit ennen käyttöönottoa.
  - Apachen uudelleenkäynnistys ja tarkistus että static-tiedostoihin on pääsy `curl http://localhost/static/`
  - Jos kaikki OK luodaan uusi virtuaaliympäristö ja hakemisto
      1. Ensin ympäristö `sudo apt-get -y install virtualenv`
      2. ja hakemisto `cd`+ `cd publicwsgi/`
      3. System-site-packages sallii Python-pakettien käytön virtuaaliympäristön ulkopuolella ja -p python3 varmistaa että käytössä on moderni python`virtualenv -p python3 --system-site-packages env`
  - `source env/bin/activate`aktivoi virtuaaliympäristön. Tämän käyttö auttaa pitämään paketit järjestyksessä, mutta ei luo turvaa. Käytön lopetus tapahtuu käänteisesti `deactivate`.
  - Tarkista että käytössä on eristetty virtuaaliympäristön pip `which pip`jolloin palaute tulisi olla `/home/tero/publicwsgi/env/bin/pip` 
  - On suositeltavaa listata `micro requirements.txt`asennettavat paketit requirements.txt tiedostoon, tässä tapauksessa sinne siis listataan vain "django"
  - Jonka jälkeen asennus `pip install -r requirements.txt`
  - ja version tarkistus `django-admin --version`
  - `django-admin startproject teroco`luo uuden Django-projektin- Tässä voi myös käyttää aiemmin luotua CRM-projektia.
  - Seuraavaksi tarvitsee tietää kolme absoluuttista polkua, jotka määrittéllään virtuaalipalvelimen cinf-tiedostoon
    1. TDIR muuttuja-polun projektin päähakemiston joka sisältää manage.py-tiedoston`/home/tero/publicwsgi/teroco/`
    2. TWSGI muuttuja-plun twsgi.py tiedostoon `/home/tero/publicwsgi/teroco/teroco/wsgi.py`
    3. TVENV muuttuja-polun virtuaaliympäristön site-packages-hakemistoon`/home/tero/publicwsgi/env/lib/python3.9/site-packages`
       Parhaiten nämä saa oikein kopioimalla ne rinnakkaisesta terminaali-ikkunasta ´ls´ja bash-completion ominaisuutta hyödyntäen, suoraan luotavaan `/etc/apache2/sites-available/teroco.conf`tiedostoon 
  -  
  - 

---
  ## a) Yksinkertainen esimerkkiohjelma Djangolla

[ takaisin ylös]()
   
---

  ## b) Djangon tuotantotyyppinen asennus

 - [ takaisin ylös]()
---
---

  ## y) Työskentely-ympäristö
  - Tehtävä toteutettiin MacBook Retina 12-inch, koneella jossa Ventura 13.6.1 käyttöjärjestelmä Suomen maa-asetuksilla ja suomen kielellä. Koneessa on 1,3GHz kaksiytiminen Intel Core i5 prosessori ja 8Gt 1867 MHz LPDDR3 muistia. Näytönohjain on Intel HD Graphics 615 jossa VRAM 1536 Mt.
---

  ## z) alkutoimenpiteet
  1. Virtualboxin ja virtuaalikoneen käynnistäminen
  2. Terminaalin käynnistys `Applications` -> `Terminal Emulator`






#### Lähteet:

Karvinen T. Django 4 Instant Customer Database Tutorial, 2021. Luettavissa https://terokarvinen.com/2022/django-instant-crm-tutorial/. Luettu 27.02.2024.

Karvinen T. Linux-Palvelimet Alkukevät 2024. Luettavissa: https://terokarvinen.com/2024/linux-palvelimet-2024-alkukevat/#h5-koko-juttu. Luettu 27.02.2024
