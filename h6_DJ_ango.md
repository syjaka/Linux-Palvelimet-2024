
# DJ ango

Kuudennessa tehtävässä tuli tiivistää alkuksi Karvisen artikkelit [Django 4 Instant Customer Databse Tutorial]() ja [Deploy Django 4 - Production Install](). 
Tiivistelmien jälkeen tuli ohjeiden avulla toteuttaa yksinkertainen esimerkkiohjelma Djangolla ja toteuttaa Djangon tuotantotyypin asennus.

- x)[ tiivistelmät](https://github.com/syjaka/Linux-Palvelimet-2024/blob/main/h6_DJ_ango.md#x-tiivistelm%C3%A4t)
- a)[ Yksinkertainen esimerkkiohjelma Djangolla](https://github.com/syjaka/Linux-Palvelimet-2024/blob/main/h6_DJ_ango.md#a-yksinkertainen-esimerkkiohjelma-djangolla)
- b)[ Djangon tuotantotyyppinen asennus](https://github.com/syjaka/Linux-Palvelimet-2024/blob/main/h6_DJ_ango.md#b-djangon-tuotantotyyppinen-asennus)
- c)[ Tiivistelmien pohjalla olevat kattavammat muistiinpanot  ](https://github.com/syjaka/Linux-Palvelimet-2024/blob/main/h6_DJ_ango.md#c-tiivistelmien-pohjalla-olevat-kattavammat-muistiinpanot)
- y)[ Työskentely-ympäristö](https://github.com/syjaka/Linux-Palvelimet-2024/blob/main/h6_DJ_ango.md#y-ty%C3%B6skentely-ymp%C3%A4rist%C3%B6)
- z)[Alkutoimenpiteet](https://github.com/syjaka/Linux-Palvelimet-2024/blob/main/h6_DJ_ango.md#z-alkutoimenpiteet)

Tällä kertaa tehtävien tekoon saatavilla ollut aika oli hyvin hajanaista, tunti siellä, minuutti täällä. Sen vuoksi luovutin ajankäytön seurannan jo alkumetreillä, eli tässä raportissa ei ole lainkaan tätä.

---
  ## x) tiivistelmät
  
  ### Django 4 Instant Customer Database Tutorial
Artikkelissa opastetaan kuinka voi rakentaa web-käyttöliittymällä toimivan asiakastietokannan käyttäen Django-4 frameworkkia. Artikkelissa myös mainitaan miten Django on suosittu web-kehityksen framework, jota mm Intagram, National Geographic ja Discus käyttävät. 

Aluksi asennetaan kehitysympäristö, jonne luodaan teroco-niminen projekti. Djangon mukana tulee ilmainen admin-käyttöliittymä. Tämä tuo mahdollisuuden hallita tietokannan sisältö web-käyttöliittymän kautta useiden eri käyttäjien toimesta, joiden luominen myös opastetaan. Sitten vuorossa on CRM-sovelluksen lounti ja käyttöönotto ja sen palautteen muokkaus käyttäjäystävällisemmäksi. (Karvinen, 2021)

### Deploy Django 4 - Production Install

Artikkelissa ohjeistetaan Python Django 4-weppisovellusten julkaisemiseen internetissä  käyttäen Apache 2.4-weppipalvelinta. Julkaisu vaatii oikeaa tuotantotason palvelinta. 
Artikkelissa käydään vaihe vaiheelta asia läpi alkaen Apachen2 asennuksesta. Apachen asennuksen jälkeen lisätään virtualhost ja asennetaan Django VirtualEnv-ympäristöön. Sitten on vuorossa ohjeistus Django-projektin luomiseen, Pythonin yhdistäminen Apacheen mod_wsgi:n avulla sekä DEBUG-tilan poisto. Ulkonäköä muokataanstaattisten tiedostojen käsittelyosiossa ja lopussa listataan yleisimipiä vikatiloja ja mahdollisia ehdotuksia niiden korjaamiseksi. (Karvinen, 2021)

Nämä tiivistelmät ovat yhteenveto kaikista artikkeleista tekemistäni muistiinpanoista jotka koin tarpeelliseksi kirjata ylös, oman oppimiseni vahvistamiseksi. Muistiinpanot kokonaisuudessaan olen jättänyt tämän raportin [loppuun](https://github.com/syjaka/Linux-Palvelimet-2024/blob/main/h6_DJ_ango.md#c-tiivistelmien-pohjalla-olevat-kattavammat-muistiinpanot) ennen lähteitä.

---

  ## y) Työskentely-ympäristö
  
  - Tehtävä toteutettiin MacBook Retina 12-inch, koneella jossa host OS on Ventura 13.6.1 käyttöjärjestelmä Suomen maa-asetuksilla ja suomen kielellä. Koneessa on 1,3GHz kaksiytiminen Intel Core i5 prosessori ja 8Gt 1867 MHz LPDDR3 muistia. Näytönohjain on Intel HD Graphics 615 jossa VRAM 1536 Mt.
  - Guest OS on Debian GNU/Linux 12 (bookworm) joka pyörii Virtual Boxin 7.0 versiossa.
    
---

  ## z) alkutoimenpiteet

 1. Ensimmäiseksi Virtualboxin käynnistys
 2. Molemmat tehtävät tyhjältä pöydältä eli alkutoimina:
    - Debianin asennus virtualboxiin.
    - Päivitysten ja palomuurin asennus.
    - Guest additions + Micro + Bash completion.
    - Apachen asennus.

---

  ## a) Yksinkertainen esimerkkiohjelma Djangolla

Tehtävänä oli tehdä esimerkkiohjelma Djangolla. Tehtävän suorittamiseen voi käytää testipalvelinta, oletuksena että se ei näy internettiin. Riittää että ohjelma näkyy esim. Django Adminissa. (Karvinen T. 2021)

Tehtävän kokonaisvaltaisena ja pääasiallisena lähteenä käytetty Tero Karvisen artikkelia Django 4 Instant Customer Database Tutorial. Niiltä osin kun on ollut tarvetta hakea lisää informaatiota netistä, on lähteet merkitty tekstiviitteisiin, sekä lähdeluetteloon.

#### 1. Virtuaaliympäristön asennus 
  
  - Aloitin asentamalla virtuaalisen kehitysympäristön `sudo apt-get -y install virtualenv`.
   > ![6.001_install_virtualenv](https://github.com/syjaka/Linux-Palvelimet-2024/blob/main/images/6.001_install_virtualenv.png)
  - Loin uuden virtuaaliympäristön `virtualenv --system-site-packages -p python3 env/`.
   > ![6.002_env_folder](https://github.com/syjaka/Linux-Palvelimet-2024/blob/main/images/6.002_env_folder.png)
  - Aktivoin luodun ympäristön `source env/bin/activate`, joka tuo promptin alkuun (env) näkyviin.
   > ![6.003_activate_env](https://github.com/syjaka/Linux-Palvelimet-2024/blob/main/images/6.003_activate_env.png)
  -  Varmistin että olen käyttämässä virtuaalista ympäristöä `which pip`.
   > ![6.004_which_pip](https://github.com/syjaka/Linux-Palvelimet-2024/blob/main/images/6.004_which_pip.png)

#### 2. Djangon asennus

  - Listasin Python-paketti "django" tekstitiedoston `micro requirements.txt` ja tarkistin kyseisen sisällön `cat requirements.txt` ja asensin Djangon
     `pip install -r requirements.txt`.
   > ![6.005_requirements_txt](https://github.com/syjaka/Linux-Palvelimet-2024/blob/main/images/6.005_requirements_txt.png)
  - Palautteen viimeiseltä riviltä selvisi että asennetuksi tuli Django 5.0.2 versio, ohjeen 4 sijaan. Koitin jatkaa tällä aluksi. Tarvittessa komento `django-admin --version` kertoisi saman. '
    
#### 3. Uusi projekti

  - Loin uuden Django-projektin kadico `django-admin startproject kadico` ja siirryin `cd kadico`, sekä käynnistin testiympäristön `./manage.py runserver`jonka jälkeen siirryin selaimella osoiteeseen `127.0.0.1:8000/` Pletussivu kertoo projektin luonnin onnistuneen.
    > ![6.006_raketti_nousee](https://github.com/syjaka/Linux-Palvelimet-2024/blob/main/images/6.006_raketti_nousee.png)
  - Päivitin tietokannan.
    > ![6.007_database_uppaa](https://github.com/syjaka/Linux-Palvelimet-2024/blob/main/images/6.007_database_uppaa.png)
  - Uutta käyttäjää varten asensin salasanageneraattorin ja generoin salasanan`sudo apt-get install pwgen`,
    `pwgen -s 20 1 # randomize a password`.
    > ![6.008_pwgen](https://github.com/syjaka/Linux-Palvelimet-2024/blob/main/images/6.008_pwgen.png)
   - Loin superuserin jolle annoin uuden generoidun salasanan. En samaa kuin kuvakaappauksen esimerkissä.
     > ![6.009_superuser](https://github.com/syjaka/Linux-Palvelimet-2024/blob/main/images/6.009_superuser.png)
  - Testasin ja lopputuloksena:
    > ![6.010_unable_to_connect](https://github.com/syjaka/Linux-Palvelimet-2024/blob/main/images/6.010_unable_to_connect.png)
  - Testasin myös 127.0.0.1:8000/ joka antoi saman herjan. Koska virhe tuli tietokantamigraation ja admin-käyttäjän luonnin jälkeen vika täytyy liittyä niihin. Kyselin ChatGPT:ltä apua lokien paikallistamiseen, ja sain neuvon että kaikki pyynnöt näkyvät kehityspalvelimen terminaalitulosteessa, **mikäli kehityspalvelin on käynnissä** (ChatGPT 2024). Koska virheellisen palautteen antanut pyyntö ei näkynyt terminaalissa tajusin aluksi uudelleenkäynnistää palvelimen  `./manage.py runserver`. Tämä ratkaisi ongelman ja tehtävän suoritus jatkui.
    > ![6.011_admin_login](https://github.com/syjaka/Linux-Palvelimet-2024/blob/main/images/6.011_admin_login.png)
  - Kirjauduin superuserina ja lisäsin uuden käyttäjän superuserin ja staffin statuksella.
    > ![6.012_user_idak](https://github.com/syjaka/Linux-Palvelimet-2024/blob/main/images/6.012_user_idak.png)
   - Loggauduin ulos ja takaisin sisään juuri luotuna superuserina ja muokkaus onnistuu.
     
#### 4. CRM-asennus

  - Loin CRM hakemiston `./manage.py startapp crm` ja `micro kadico/settings.py` avasi settings.py tiedoston jonne lisäsin `crm` INSTALLED_APPS-osioon.
    > ![6.13_settings_py_crm](https://github.com/syjaka/Linux-Palvelimet-2024/blob/main/images/6.013_settings_py_crm.png)
  - Lisäsin mallit luomalla models.py-tiedoston `micro crm/models.py` johon loin asiakas luokan. Luokan nimeksi määrittelin **Customer** ja attribuutiksi **nimi** jonka jälkeen päivitin tietokannan.
    > ![6.14_nimimalli](https://github.com/syjaka/Linux-Palvelimet-2024/blob/main/images/6.014_nimimalli.png)
    > ![6.15_tietokanta_uppii](https://github.com/syjaka/Linux-Palvelimet-2024/blob/main/images/6.015_tietokanta_uppii%5D.png)
  - Yritin loggautua selaimella, mutta taas sama virhe, kuin kohdassa 11. Olin jälleen unohtanut käynnistää ympäristön `./manage.py runserver` tämä auttoi ja testi onnistui.
  - Äsken luodun tietokannan näkeminen vaati sen rekisteröintiä `micro crm/admin.py`.
    > ![6.16_rekisteröi_crm](https://github.com/syjaka/Linux-Palvelimet-2024/blob/main/images/6.016_rekistero%CC%88i_crm.png)
  - Uudelleen palvelin ylös `./manage.py runserver`ja testi selaimella, joka näytti, että CRM on tullut käyttöön.
    > ![6.17_CRM_näkyy](https://github.com/syjaka/Linux-Palvelimet-2024/blob/main/images/6.017_CRM_na%CC%88kyy.png)
  - Lisäys, muokkaus ja poisto onnistuu molemmilla käyttäjillä.
    > ![6.018_kadi_lisää](https://github.com/syjaka/Linux-Palvelimet-2024/blob/main/images/6.018_kadi_lisa%CC%88a%CC%88.png)
    > ![6.019_idak_jatkaa](https://github.com/syjaka/Linux-Palvelimet-2024/blob/main/images/6.019_idak_jatkaa.png)
  - Muokkasin `models.py`-mallia lisäämällä sinne str-metodin joka palauttaa asiakkaan nimen stringinä `Customer object (x)` sijasta.
    > ![6.020_return_str](https://github.com/syjaka/Linux-Palvelimet-2024/blob/main/images/6.020_return_str.png)
  -  `./manage.py runserver` antoi errorin eikä käynnistänyt ympäristöä. Palaute `IndentationError: unexpected indent` ja ainut muutos edelliseen testiin oli models.py tiedostoon. Tämä antoi syyn epäillä sisennysvirhettä tiedostossa, mikä osoittautui oikeaksi. Virheen korjattuani, uusi yritys joka onnistui.
     > ![6.021_crm_nimet_näkyy](https://github.com/syjaka/Linux-Palvelimet-2024/blob/main/images/6.021_crm_nimet_na%CC%88kyy.png)
   
[ takaisin ylös](https://github.com/syjaka/Linux-Palvelimet-2024/blob/main/h6_DJ_ango.md#dj-ango)
   
---

  ## b) Djangon tuotantotyyppinen asennus

Tehtävän kokonaisvaltaisena ja pääasiallisena lähteenä käytetty Tero Karvisen artikkelia Deploy Django 4 - Production Install. Niiltä osin kun on ollut tarvetta hakea lisää informaatiota netistä, on lähteet merkitty tekstiviitteisiin, sekä lähdeluetteloon.

1. Alkutoimien jälkeen pääsin aloittamaan varsinaisen tehtävän. Aluksi virtualhostin ja sisällön luonti
  - `mkdir -p publicwsgi/kadico/static/` luo hakemiston.
  - `publicwsgi/kadico/static/index.html` luo index.html, jonne tallensin sisällöksi Djangoooo.
    > ![6.101_virtualHost](https://github.com/syjaka/Linux-Palvelimet-2024/blob/main/images/6.101_virtualHost.png)
       
2. Seuraavaksi luodun virtualhostin käyttöönotto
  - `sudo a2ensite teroco.conf` ottaa käyttöön luodun conf-tiedoston.
  - `sudo a2dissite 000-default.conf` poistaa käytöstö default-sivun.
  -  `/sbin/apache2ctl configtest` testaa tehdyt confit ennen käyttöönottoa.
        > ![6.102_ensite](https://github.com/syjaka/Linux-Palvelimet-2024/blob/main/images/6.102_ensite.png)
  -  `sudo systemctl restart apache2` uudelleenkäynnistyksellä uudet asetukset tulevat käyttöön.
  -  `curl http://localhost/static/`testasin että static-tiedosto vastaa.
        > ![6.103_static_vastaa](https://github.com/syjaka/Linux-Palvelimet-2024/blob/main/images/6.103_static_vastaa.png) ![6.104_selainstatic_vastaa](https://github.com/syjaka/Linux-Palvelimet-2024/blob/main/images/6.104_selainstatic_vastaa.png)

3. Uuden virtuaaliympäristön luonti ja Djangon asennus
  - `sudo apt-get -y install virtualenv` ensin asensin virtuaalisen kehitysympäristön.
  - Siirryin virtuaaliympäristölle luotuun hakemistoon `cd`ja `cd publicwsgi/`.
  - Tätä seurasi virtuaaliympäristön luonti `virtualenv -p python3 --system-site-packages env` uuteen **/kadi/publicwsgi/env** hakemistoon.
     > ![6.105_virtualenv_done](https://github.com/syjaka/Linux-Palvelimet-2024/blob/main/images/6.105_virtualenv_done.png)
  - `source env/bin/activate` aktivoin ympäristön, (promptiin tuli tämän myötä `(env)`-alku) ja tarkistin `which pip`että olen varmasti asentamassa oikean `env/`-hakemiston `pip`-asentajalla.
      > ![6.106_which_pip](https://github.com/syjaka/Linux-Palvelimet-2024/blob/main/images/6.106_which_pip.png)
  - `micro requirements.txt` loi requirements tekstitiedoston jonne kirjoitin asennettavan paketin **django**.
  - `pip install -r requirements.txt`asensi Djangon.
      > ![6.107_done_django](https://github.com/syjaka/Linux-Palvelimet-2024/blob/main/images/6.107_done_django.png)
  - `django-admin --version`testi palautti vielä asennetun django version 5.0.2.
      
4. Uudi Django projekti
  - `django-admin startproject kadico` komento uuden projektin aloittamiseksi antoi heti virhekoodin, joka tietenkin johtui luomastani testihakemistosta.
      > ![6.108_kadico_exists](https://github.com/syjaka/Linux-Palvelimet-2024/blob/main/images/6.108_kadico_exists.png)
  - Poistin testihakemoston ja uudelleen komento projektin aloittamiseksi.
      > ![6.109_rm_redo_kadico](https://github.com/syjaka/Linux-Palvelimet-2024/blob/main/images/6.109_rm_redo_kadico.png)
  - Seuraavaksi loin/editoin virtualhostin config-tiedoston `sudoedit /etc/apache2/sites-available/kadicoco.conf`. Tiedostoa muokatessa tarvitsen kolme absoluuttista polkua, joten avasin rinnakkaisen terminaalin näiden kopioimiseen. navigointiin käytin `cd`, `ls` ja `pwd`-komentoja.
      > ![6.110_kadico_conf](https://github.com/syjaka/Linux-Palvelimet-2024/blob/main/images/6.110_kadico_conf.png)
  - `sudo apt-get -y install libapache2-mod-wsgi-py3`komennolla asensin Apachen wsgi-moduulin, jotta apache ymmärtää mitä edellisessä kohdassa luodun conf-tiedoston WSGI-komennot tarkoittavat.
  - Ennen käyttöönottoa tarkistin vielä syntaxin oikeellisuuden.
      > ![6.111_syntax_OK](https://github.com/syjaka/Linux-Palvelimet-2024/blob/main/images/6.111_syntax_OK.png)
  - `sudo systemctl restart apache2` käyttöönotti juuri tehdyt asetukset ja `curl -sI localhost|grep Server`testi paljasti että palvelimena toimii apache eikä testiserveri sekä selainhaku `localhost` näytti että Djancon asennus oli onnistumut.
      > ![6.112_curl_apache](https://github.com/syjaka/Linux-Palvelimet-2024/blob/main/images/6.112_curl_apache.png)
  
  5. Debug-sivu pois päältä
  - Muokkaan settings.py tiedostoa hakemistossa `publiccwsgi/kadico/kadico` komennolla `micro settings.py`.
      > ![6.113_debug_pois](https://github.com/syjaka/Linux-Palvelimet-2024/blob/main/images/6.113_debug_pois.png)
  - Testasin riittääkö touch lataamaan muutokset `touch teroco/wsgi.py` ja se toimi. Eli valmista tuli.
      > ![6.114_localhost_admin](https://github.com/syjaka/Linux-Palvelimet-2024/blob/main/images/6.114_localhost_admin.png) 
    
  6. Jatkoin vielä lisäämällä CSS-muotoilua
    - Palasin muotoilemaan kohdan 7. settings.py tiedostoa, jonne lisäsin `import os`ja `STATIC_ROOT = os.path.join(BASE_DIR, 'static/')`omille paikolleen. 
     > ![6.115_import_os](https://github.com/syjaka/Linux-Palvelimet-2024/blob/main/images/6.115_import_os.png) ![6.116_static_root](https://github.com/syjaka/Linux-Palvelimet-2024/blob/main/images/6.116_static_root.png)
    - `./manage.py collectstatic`- kopioi 126 staattista tiedostoa `STATIC ROOT` kohdassa määrittelemääni sijaintiin, eli tässä tapauksessa `/home/kadi/publicwsgi/kadico/static`, jolloin ne tulivat myös localhost/admin-sivun käyttöön.
     > ![6.117_Localhost_css](https://github.com/syjaka/Linux-Palvelimet-2024/blob/main/images/6.117_Localhost_css.png)
        
  7. Viimeistely
    - Yrittäessäni kirjautua sivulle saan erroria. Tämä johtunee siitä että en ole luonut ainuttakaan käyttäjää salasanoineen.
    - Päivitin tietokannan ja loin superkäyttäjän kuten a-kohdan vaiheissa 8-10.
    - Luodulla käyttäjällä pääsin sisään.
     > ![6.118_toimii](https://github.com/syjaka/Linux-Palvelimet-2024/blob/main/images/6.118_toimii.png)
        
  [ takaisin ylös](https://github.com/syjaka/Linux-Palvelimet-2024/blob/main/h6_DJ_ango.md#dj-ango)
  
---


## c) Tiivistelmien pohjalla olevat kattavammat muistiinpanot  

 ### Django 4 Instant Customer Database Tutorial
  - Aluksi opastetaan virtuaalisen kehitysympäristön luontia komennoilla `sudo apt-get -y install virtualenv`ja `virtualenv --system-site-packages -p python3 env/`
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
  - `s./manage.py startapp crm`luo uuden kansion crm uudelle crm apille. App `crm` lisätään settings.py tiedoston INTALLED_APPS osioon.
  - `micro crm/models.py` avaa tiedoston jonne lisätään `models.Model`-luokasta periytyvä Customer-luokka. Jolloin Django luo "Name" sarakkeen "Customer" tauluun  tietokannassa.
  - Seuraavaksi taas päivitetään tietokannat: `./manage.py makemigrations`ja `./manage.py migrate`
  - `micro crm/admin.py` tiedostostoon rekisteröidään ´Customer`-malli admimnin kanssa.
  - `./manage.py runserver`käynnistää taas Django kehityspalvelimen jonka jälkeen `http://127.0.0.1:8000/admin/`avaa Djangon kirjautumissivun
  - Seuraavaksi ohjeistetaan Customer-luokan muokkaus siten että listauksessa näkyy objektien sijaan nimet.
  - `micro crm/models.py`avaa customer-luokan "määritelmä"-tiedoston. Tänne lisätään str-metodi joka palauttaa asiakkaan nimen esitettäväksi. (Karvinen, 2021)

### Deploy Django 4 - Production Install
  - Aluksi päivitetään ja asennetaan halutut lisäohjelmat.
  - Seuraavaksi asennetaan apache ja luodaan web-sisältö käyttäjäoikeuksin
      `cd` + `mkdir -p publicwsgi/teroco/static/`+ `echo "Statically see you at TeroKarvinen.com."|tee` +  `micro publicwsgi/teroco/static/index.html`.
  - Ja virtualhost joka ohjaa sisältöön `sudoedit /etc/apache2/sites-available/teroco.conf`.
  - Täytä conf-tiedostoon `Alias /static/ /home/tero/publicwsgi/teroco/static/`ja `<Directory /home/tero/publicwsgi/teroco/static/>`.
  - Seuraavaksi enabloi luotu conf ja disabloi defaultsivu.
  - `sudo a2ensite teroco.conf`tarkistaa luodut confit ennen käyttöönottoa.
  - Apachen uudelleenkäynnistys ja tarkistus että static-tiedostoihin on pääsy `curl http://localhost/static/`.
  - Jos kaikki OK luodaan uusi virtuaaliympäristö ja hakemisto.
      1. Ensin ympäristö `sudo apt-get -y install virtualenv`.
      2. Sitten hakemisto `cd`+ `cd publicwsgi/`.
      3. `virtualenv -p python3 --system-site-packages env`-komennolla system-site-packages sallii Python-pakettien käytön virtuaaliympäristön ulkopuolella ja -p python3 varmistaa että käytössä on moderni python.
  - `source env/bin/activate` aktivoi virtuaaliympäristön. Virtuaaliympäristön käyttö auttaa pitämään paketit järjestyksessä, mutta ei luo turvaa, joten pakettien asennuksessa tulee käyttää harkintaa. Virtuaaliympäristön käytön lopetus tapahtuu käänteisesti `deactivate`.
  - Tarkista vielä, että käytössä on eristetty virtuaaliympäristön pip `which pip`jolloin palaute tulisi olla `/home/tero/publicwsgi/env/bin/pip`.
  - On suositeltavaa listata `micro requirements.txt`asennettavat paketit requirements.txt tiedostoon, tässä tapauksessa sinne siis listataan vain "django".
  - Jonka jälkeen asennus `pip install -r requirements.txt`.
  - Version tarkistus `django-admin --version`.
  - `django-admin startproject teroco` luo uuden Django-projektin. Tässä voi myös käyttää aiemmin luotua CRM-projektia.
  - Seuraavaksi tarvitsee tietää kolme absoluuttista polkua, jotka määritellään virtuaalipalvelimen conf-tiedostoon.
    1. TDIR muuttuja-polun projektin päähakemiston joka sisältää manage.py-tiedoston`/home/tero/publicwsgi/teroco/`
    2. TWSGI muuttuja-plun twsgi.py tiedostoon `/home/tero/publicwsgi/teroco/teroco/wsgi.py`
    3. TVENV muuttuja-polun virtuaaliympäristön site-packages-hakemistoon`/home/tero/publicwsgi/env/lib/python3.9/site-packages`.
       Parhaiten nämä saa oikein kopioimalla ne rinnakkaisesta terminaali-ikkunasta ´ls´ja bash-completion ominaisuutta hyödyntäen, suoraan luotavaan `/etc/apache2/sites-available/teroco.conf`tiedostoon.
  -  Koko VirtualHost config-tiedosto on pitkä. Sen vuoksi on suositeltua kopioida se [täältä](https://terokarvinen.com/2022/deploy-django/) ja muokata vain yläosan muuttujat vastaamaan omia tietoja.
  - `sudo apt-get -y install libapache2-mod-wsgi-py3` asentaa Apachen WSGI moduuli ja tarkista syntaksi `/sbin/apache2ctl configtest`.
  - Apachen uudelleenkäynnistys ottaa määritykset käyttöön `sudo systemctl restart apache2`.
  - Testi `curl -s localhost|grep title`, jonka onnistunut palaute on `<title>The install worked successfully! Congratulations!</title>`.
  - Tarkista vielä että apache vastaa `curl -sI localhost|grep Server`.
  - Tässä vaiheessa selaimen tulisi näyttää raketti lentää sivu.
  - Seuraavaksi disabloidaan DEBUG `cd``cd publicwsgi/teroco/`ja `micro teroco/settings.py`.
  - Tiedosto on suuri, muokkaa sieltä `DEBUG = False` ja `ALLOWED_HOSTS = ["localhost", "hello.terokarvinen.com"]`.
  - Tavanomaiset muutokset ladataan `touch teroco/wsgi.py`, mutta esim uudet koodit vaatii sudon `sudo systemctl restart apache2`.
  - Tässä vaiheessa etusivu antaa 404 komennolla `curl -s localhost|grep title` testaa vielä uudelleen lisäämällä perään siansaksaa esim `http://localhost/tero123`.
  - seuraavaksi staattisien tyylitiedostojen määrittely `cd`+ `cd publicwsgi/teroco/`ja `micro teroco/settings.py`.
  - Täällä näemme että `STATIC_URL`on määritelty mutta `STATIC_ROOT` ei. Lisää tiedoston alkuun `import os`, sekä STATIC_URL jälkeen `STATIC_ROOT = os.path.join(BASE_DIR, 'static/')`. 
  - `/manage.py collectstatic`ja yes tuo CSS tyylit Django admin-sivulle.

    Ongelmien sattuessa:
    Vikakoodit ovat ympäripyöreitä, sillä julkisesti ei voi virheen alkuperää kertoa.
    - `sudo tail -F /var/log/apache/error.log` jonka lopetus `ctrl+C`.
    - jos virhe ei löydy lokista. Yksityisessä koneessa laita DEBUG päälle ja aja jotain `./manage.py`komentoja.
      1. `./manage.py runserver` käynnistää.
      2. `./manage.py makemigrations` +  `./manage.py migrate` päivittää tietokannan.
      3. `/sbin/apache2ctl configtest`tsekkaa apachen syntaksin.
      4. Salasanan unohtuessa `./manage.py createsuperuser` ja harkitse pwgen-käyttöä `pwgen -s 20 1`.
      5. palaute `Invalid command 'WSGIDaemonProcess` korjaantunee `sudo apt-get -y install libapache2-mod-wsgi-py3`.
      6. palaute `AH01630: Client denied by server configuration`saattaa johtua CHOWN oikeuksien virheestä tai conf tiedoston puutteesta kohdassa `Require all granted` Tarkista kaikki tiedostopolut, paras on aina copy/paste, jolloin typoja ei tule.
      8. palaute `AH00111: Config variable ${TERODIR} is not defined` Tarkista muuttujien polut ja syntaksit.
      9. Disabled DEBUG in Django, now I get 400 error on every page. Lisää palvelinosoite ALLOW_HOSTS esim localhost.
      10. set the STATIC_ROOT setting to a filesystem path. (Karvinen, 2021)

[ takaisin ylös](https://github.com/syjaka/Linux-Palvelimet-2024/blob/main/h6_DJ_ango.md#dj-ango)

---

#### Lähteet:

ChatGPT kyselyt 25.02.2024

Karvinen T. Deploy Django 4 - Production Install, 2021. Luettavissa: https://terokarvinen.com/2022/deploy-django/. Luettu 27.02.2024.

Karvinen T. Django 4 Instant Customer Database Tutorial, 2021. Luettavissa: https://terokarvinen.com/2022/django-instant-crm-tutorial/. Luettu 27.02.2024.

Karvinen T. Linux-Palvelimet Alkukevät 2024. Luettavissa: https://terokarvinen.com/2024/linux-palvelimet-2024-alkukevat/#h5-koko-juttu. Luettu 27.02.2024
