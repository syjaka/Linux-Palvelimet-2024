## Keskeneräinen

## DJ ango

Kuudennessa tehtävässä tuli tiivistää alkuksi Karvisen artikkelit [Django 4 Instant Customer Databse Tutorial]() ja [Deploy Django 4 - Production Install](). 
Tiivistelmien jälkeen tuli ohjeiden avulla toteuttaa yksinkertainen esimerkkiohjelma Djangolla ja toteuttaa Djangon tuotantotyypin asennus.

- x)[ tiivistelmät](https://github.com/syjaka/Linux-Palvelimet-2024/blob/main/h6_DJ_ango.md#x-tiivistelm%C3%A4t)
- a)[ Yksinkertainen esimerkkiohjelma Djangolla](https://github.com/syjaka/Linux-Palvelimet-2024/blob/main/h6_DJ_ango.md#a-yksinkertainen-esimerkkiohjelma-djangolla)
- b)[ Djangon tuotantotyyppinen asennus](https://github.com/syjaka/Linux-Palvelimet-2024/blob/main/h6_DJ_ango.md#b-djangon-tuotantotyyppinen-asennus)
- c)[ Tiivistelmien pohjalla olevat kattavammat muistiinpanot  ]()
- y)[ Työskentely-ympäristö](https://github.com/syjaka/Linux-Palvelimet-2024/blob/main/h6_DJ_ango.md#y-ty%C3%B6skentely-ymp%C3%A4rist%C3%B6)
- z)[Alkutoimenpiteet](https://github.com/syjaka/Linux-Palvelimet-2024/blob/main/h6_DJ_ango.md#z-alkutoimenpiteet)

---

  ## y) Työskentely-ympäristö
  - Tehtävä toteutettiin MacBook Retina 12-inch, koneella jossa Ventura 13.6.1 käyttöjärjestelmä Suomen maa-asetuksilla ja suomen kielellä. Koneessa on 1,3GHz kaksiytiminen Intel Core i5 prosessori ja 8Gt 1867 MHz LPDDR3 muistia. Näytönohjain on Intel HD Graphics 615 jossa VRAM 1536 Mt.
    
---

  ## z) alkutoimenpiteet
  1. Virtualboxin ja virtuaalikoneen käynnistäminen
  2. Terminaalin käynnistys `Applications` -> `Terminal Emulator`

---
  ## x) tiivistelmät
  
  ### Django 4 Instant Customer Database Tutorial
Tässä artikkelissa opastetaan kuinka voi rakentaa web-käyttöliittymällä toimivan asiakastietokannan käyttäen Django-4 frameworkkia. Artikkelissa myös mainitaan miten Django on suosittu web-kehityksen framework, jota mm Intagram, National Geographic ja Discus käyttävät. 

Aluksi asennetaan kehitysympäristö, jonne luodaan teroco-niminen projekti. Djangon mukana tulee ilmainen admin-käyttöliittymä. Tämä tuo mahdollisuuden hallita tietokannan sisältö web-käyttöliittymän kautta useiden eri käyttäjien toimesta, joiden luominen myös opastetaan. Sitten vuorossa on CRM-sovelluksen lounti ja käyttöönotto ja sen palautteen muokkaus käyttäjäystävällisemmäksi. (Karvinen, 2021)

### Deploy Django 4 - Production Install

Tässä artikkelissa ohjeistetaan Python Django 4-weppisovellusten julkaisemiseen internetissä  käyttäen Apache 2.4-weppipalvelinta. Julkaisu vaatii oikeaa tuotantotason palvelinta. 
Artikkelissa käydään vaihe vaiheelta asia läpi alkaen Apachen2 asennuksesta. Apachen asennuksen jälkeen lisätään virtualhost ja asennetaan Django VirtualEnv-ympäristöön. Sitten on vuorossa ohjeistus Django-projektin luomiseen, Pythonin yhdistäminen Apacheen mod_wsgi:n avulla sekä DEBUG-tilan poisto. Ulkonäköä muokataanstaattisten tiedostojen käsittelyosiossa ja lopussa listataan yleisimipiä vikatiloja ja mahdollisia ehdotuksia niiden korjaamiseksi. (Karvinen, 2021)

Nämä tiivistelmät ovat yhteenveto kaikista artikkeleista tekemistäni muistiinpanoista jotka koin tarpeelliseksi kirjata ylös, oman oppimiseni vahvistamiseksi. Muistiinpanot kokonaisuudessaan olen jättänyt tämän raportin [loppuun]() ennen lähteitä.


---
  ## a) Yksinkertainen esimerkkiohjelma Djangolla

[ takaisin ylös](https://github.com/syjaka/Linux-Palvelimet-2024/blob/main/h6_DJ_ango.md#dj-ango)
   
---

  ## b) Djangon tuotantotyyppinen asennus

 - [ takaisin ylös](https://github.com/syjaka/Linux-Palvelimet-2024/blob/main/h6_DJ_ango.md#dj-ango)
---
---




### c) Tiivistelmien pohjalla olevat kattavammat muistiinpanot  

 #### Django 4 Instant Customer Database Tutorial
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

#### Deploy Django 4 - Production Install
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
  -  Koko VirtualHost config-tiedosto on pitkä. Sen vuoksi on suositeltua kopioida se [täältä](https://terokarvinen.com/2022/deploy-django/) ja muokata vain yläosan muuttujat vastaamaan omia tietoja-
  - `sudo apt-get -y install libapache2-mod-wsgi-py3`asenna Apachen WSGI moduuli ja tarkista syntaksi `/sbin/apache2ctl configtest`
  - Apachen uudelleenkäynnistys ottaa määritykset käyttöön `sudo systemctl restart apache2`
  - Testi `curl -s localhost|grep title`jonka onnistunut palaute on `<title>The install worked successfully! Congratulations!</title>`
  - Tarkista vielä että apache vastaa `curl -sI localhost|grep Server`
  - Tässä vaiheessa selaimen tulisi näyttää raketti lentää sivu
  - Seuraavaksi disabloidaan DEBUG `cd``cd publicwsgi/teroco/`ja `micro teroco/settings.py`
  - Tiedosto on suuri, muokkaa sieltä `DEBUG = False` ja `ALLOWED_HOSTS = ["localhost", "hello.terokarvinen.com"]` Jossa localhost vastaa mikä tahansa näkyy sivustolla.
  - Tavanomaiset muutokset ladataan `touch teroco/wsgi.py`, mutta esim uudet koodit vaatii sudon `sudo systemctl restart apache2`
  - Tässä vaiheessa etusivu antaa 404 komennolla `curl -s localhost|grep title` testaa vielä uudelleen lisäämällä perään siansaksaa esim `http://localhost/tero123`
  - seuraavaksi staattisien tyylitiedostojen määrittely `cd`+ `cd publicwsgi/teroco/`ja `micro teroco/settings.py`
  - Täällä näemme että `STATIC_URL`on määritelty mutta `STATIC_ROOT` ei. Korjaa kohtaan `import os` `STATIC_ROOT = os.path.join(BASE_DIR, 'static/')`
  - `/manage.py collectstatic`ja yes tuo CSS tyylit Django admin-sivulle

    Ongelmien sattuessa:
    Vikakoodit ovat ympäripyöreitä, sillä julkisesti ei voi virheen alkuperää kertoa
    - `sudo tail -F /var/log/apache/error.log` jonka lopetus `ctrl+C`
    - jos virhe ei löydy lokista. Yksityisessä koneessa laita DEBUG päälle ja aja jotain `./manage.py`komentoja.
      1. `./manage.py runserver` käynnistää
      2. `./manage.py makemigrations` +  `./manage.py migrate` päivittää tietokannan
      3. `/sbin/apache2ctl configtest`tsekkaa apachen syntaksin
      4. Salasanan unohtuessa `./manage.py createsuperuser` ja harkitse pwgen-käyttöä `pwgen -s 20 1`
      5. palaute `Invalid command 'WSGIDaemonProcess` korjaantunee `sudo apt-get -y install libapache2-mod-wsgi-py3`
      6. palaute `AH01630: Client denied by server configuration`saattaa johtua CHOWN oikeuksien virheestä tai conf tiedoston puutteesta kohdassa `Require all granted` Tarkista kaikki tiedostopolut, paras on aina copy/paste, jolloin typoja ei tule
      8. palaute `AH00111: Config variable ${TERODIR} is not defined` Tarkista muuttujien polut ja syntaksit
      9. Disabled DEBUG in Django, now I get 400 error on every page. Lisää palvelinosoite ALLOW_HOSTS esim localhost
      10. set the STATIC_ROOT setting to a filesystem path. (Karvinen, 2021)

[ takaisin ylös](https://github.com/syjaka/Linux-Palvelimet-2024/blob/main/h6_DJ_ango.md#dj-ango)

---

#### Lähteet:

Karvinen T. Django 4 Instant Customer Database Tutorial, 2021. Luettavissa https://terokarvinen.com/2022/django-instant-crm-tutorial/. Luettu 27.02.2024.

Karvinen T. Linux-Palvelimet Alkukevät 2024. Luettavissa: https://terokarvinen.com/2024/linux-palvelimet-2024-alkukevat/#h5-koko-juttu. Luettu 27.02.2024
