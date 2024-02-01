# H3 Hello Web Server

# **'KESKENERÄINEN'**

### Tero Karvisen Linux palvelimet kurssin [kolmantena tehtävänä](https://terokarvinen.com/2024/linux-palvelimet-2024-alkukevat/#h3-hello-web-server) oli:
   1. Tiivistää Artikkeli: [The Apache Software Foundation 2023: Apache HTTP Server Version 2.4 Documentation: Name-based Virtual Host Support](https://httpd.apache.org/docs/2.4/vhosts/name-based.html)
   2. Tiivistä Tero karvisen artikkeli [Name Based Virtual Hosts on Apache – Multiple Websites to Single IP Address](https://terokarvinen.com/2018/04/10/name-based-virtual-hosts-on-apache-multiple-websites-to-single-ip-address/)
   3. Testata että tunnilla asennettu weppipalvelin vastaa localhost osoitteesta
   4. Etsiä ja analysoida rivit jotka muodostuvat lokiin, kun omalta palvelimelta ladataan yksi sivu
   5. Tehdä uusi name based virtual host
   6. Tehdä validi HTML5 sivu.
   7. Antaa esimerkit curl -I ja curl -komennoista

Lisäksi vapaaehtoiset tehtävät olivat:

   8. Vapaaehtoinen: Hankkia GitHub Education -paketti
   9. Tee apachelle nimipohjainen virtuaalipaketti
   10. Laittaa sama tietokone vastaamaan kahdella eri sivulla kahdesta eri nimestä

## 1. Tiivistelmä artikkelista Name-based vs. Virtual Hosts
- IP- vai nimipohjainen virtuaalipalvelin
  - IP-pohjaisessa virtuaalipalvelimessa jokaisella nettisivulla on oma IP-osoite jonka perusteella client navigoi palvelimelle.
  - Nimipohjaisessa virtuaalipalvelimessa usea verkkosivu jakaa saman IP-osoitteen ja sivun nimi (osa HTTP headeria) kertoo mikä sivu näytetään.
  - Nimipohjaisella virtuaalipalvelimen etuja on yksinkertaisempi set-up ja vähissä olevien IP-osoitteiden säästeliäs käyttö
- Palvelin valitsee ensisijaisesti IP-osoitteen perusteella mitkä virtuaalipalvelimet ovat oikeita. Tämän ensiusijaisen valinnan voi ohittaa käyttämällä jokerimerkkiä (*) IP-osoitteen tilalla jolloin ensisijainen valinta "ohitetaan" ja palvelin tarkastelee ServerName- ja ServerAlias määrityksiä oikean virtuaalipalvelimen löytymiseen.
- ServerName nimitiedon poisjättäminen nimipohjaiselta virtuaalipalvelimelta on omiaan aiheuttamaan sekaannuksia sillä tällöin palvelin käyttää (FQDN) toimialueen nimeä.
- Jos palvelimella on useita verkkosivuja jotka vastaavat IP-osoitetta ja porttia ja ServerName tai ServerAlias vastaavuutta ei löydy, hakuun vastataan ensimmäisen hakua vastaavan IP-osoite/portti-yhdistelmän sisällöllä.
- Nimipohjaisten virtuaalipalvelimien käyttö
  - Jokaiselle halutulle verkkosivulle tulee luoda ensin oma VirtualHost-osio jonka tulee minimissään sisältää ServertName - joka kertoo mikä sivu kyseessä ja DocumentRoot - joka kertoo missä hakemistossa kyseisen Hostin sisältö on.
  - Mikäli pyyntö ei vastaa olemasaaolevaa VirtuaHostia käsitellään se globaalin palvelimenmääritysten mukaan.
  - Sekaannuksien välttämiseksi jokaiselle nimipohjaiselle virtuaalipalvelimelle olisi parasta aina määrittää Server Name yksilöllisesti. 
  - Allas kuva esimerkistä jossa kaksi virtualhostia. Ylempi toimii myös defaultHostina:
    ![1.2_eri_virtuaHostit](https://github.com/syjaka/Linux-Palvelimet-2024/blob/main/images/1.2_eri_virtuaHostit.png)
  - Jos haluaa että tietty palvelin on saavutettavissa useamman nimen avulla voidaan luoda ServerAlias. Tämän voi tehdä joko tarkasti kuten www.esim.com tai jokerin avulla *.esim.com jolloin kaikki mahdolliset yhdistelmät ennen pistettä johtavat samaan tulokseen
  - VirtualHostien asetuksia voi myös hienosäätää lisäämällä määrityksiä VirtualHost-lohkoihin siten että ne vaikuttavat vain lohkonsa VirtualHostiin. Näitä määrityksiä käsitellään ensisijaisina omassa lohkossaan, vaikka myös pääpalvelimella olisi asetettu jotain, mahdollisesti ristiriitaisia määrityksiä. 
 
## 2. Tiivistelmä artikkelista - Name Based Virtual Hosts on Apache – Multiple Websites to Single IP Address

Apachen avulla voit pitää monta domainia yhdellä IP-osoitteella

   Apache-web serverin asennus ja default-sivun korvaaminen:
    
    $ sudo apt-get -y install apache2  # Apache-web serverin asennus
    $ echo "Default"|sudo tee /var/www/html/index.html #oletustiedoston korvaaminen index.html nimisellä tiedostolla jossa "Default"-teksti hakemistossa /var/www/html

   Uuden nimipohjaisen virtuaalipalvelimen asennus:

    $ sudoedit /etc/apache2/sites-available/pyora.example.com.conf # Tämä luo konfiguraatiotiedoston jonne conffit asetetaan
    $ cat /etc/apache2/sites-available/pyora.example.com.conf # Tämä näyttää edellä luodun tiedoston
    $ sudo a2ensite pyora.example.com # tämä aktivoi luodun virtuaalipalvelimen konfiguraatiot
    $ sudo systemctl restart apache2 # tätä käynnistää apachen uudelleen muutoksien voimaansaattamiseksi

   Luo verkkosivu tavallisena käyttäjänä (ei pääkäyttäjä)

    $ mkdir -p /home/xubuntu/publicsites/pyora.example.com/ # tämä luo hakemiston seuraavaksi luotavalle tiedostolle
    $ echo pyora > /home/xubuntu/publicsites/pyora.example.com/index.html # tämä luo tiedoston jonne sivun sisältö tallennetaan

   Testaa lopputulos

    $ curl -H 'Host: pyora.example.com' localhost # tähän vastaa nimenomaisesti pyora.example.com   
    $ curl localhost # tähän vastaa virtuaalipalvelimen defaultsivu

 Tai Firefoxissa 'http:/localhost tai http://pyora.example.com

 ## 3. Testi että weppipalvelin vastaa localhost-osoitteesta - klo 30.01 klo 17.50

   ![3.1_localHost_terminaali](https://github.com/syjaka/Linux-Palvelimet-2024/blob/main/images/3.1_localHost_terminaali_.png)

   onnistui

## 4. Etsi lokista rivit jotka syntyivät äskeisestä

Haen aluksi Apachen lokitiedot. Koska kyseessä oli onnistunut haku haen access-lokeja.

    $ sudo cat /var/log/apache2/access.log

- Tulokseksi saan lokitiedostot, mutta viimeinen kellottuu tälle päivälle klo 13.20, ensimmäisen haun tein noin klo 18.00

   ![4.1_loki_1](https://github.com/syjaka/Linux-Palvelimet-2024/blob/main/images/4.1_loki_1.png)

- Ryhdyin selvittämään miksi lokit eivät näy täällä. Lähtökohtana lokin viimeinen tapahtuma näkyy kuvassa, eli lokit ovat tallentuneet tänne alussa. jokin muutos on siis tapahtunut.

- Klo 20.37 Parhaan kykyni mukaan yritin etsiä googlesta syitä, mutta mitään olosuhteisiin sopivaa ei löytynyt. Tarkistin myös error.login ja journalctl.
Päivällä apachea ensi kerran asentaessa minulla oli jonkin verran ongelmia ja mahdollista on että asiaa korjatessa jokin on mennyt pieleen. Sen vuoksi aloitan alusta ja samalla tulee harjoiteltua sähköpostitse annettua vapaaehtoista bonusta...

Apachen poisto autoremove komennolla:

    $ sudo apt autoremove apache2 apache2-utils  

poisti apachen kaikkine asetuksineen (linuxhint 2023). Yksi hakemisto jäi:

![4.2_apche_var_lib_rmv](https://github.com/syjaka/Linux-Palvelimet-2024/blob/main/images/4.2_apache_var_lib_not_rmv.png)

Tarkistin ensin sisälsikö se mitään, tyhjä oli, joten poistin sen komennolla:

    sudo rm -r /var/lib/apache2/

Seuraavaksi asensin apachen uudelleen:

    $ sudo apt-get update
    $ sudo apt-get -y install apache2
    $ echo "Default"|sudo tee /var/www/html/index.html

Sitten uusi nimi- ja virtuaalihost:

    $ sudoedit /etc/apache2/sites-available/sivu.example.com.conf #tänne määritän virtuaalipalvelimen konfiguraatiot
    $ cat /etc/apache2/sites-available/sivu.example.com.conf # Tällä komennolla avaan ne tarkasteltaviksi:
![4.3_vs_conf](https://github.com/syjaka/Linux-Palvelimet-2024/blob/main/images/4.3_vs_conf.png)

    $ sudo a2ensite sivu.example.com # komennolla aktivoin virtuaalipalvelimen konfiguratiot
    $ sudo systemctl restart apache2 # uudelleenkäynnistys saattoi voimaan uudet configuraatiot

Koska minulla oli jo kotihakemistossa sivu.example.com tuotti localhost testi toivotun tuloksen:

   ![4.4_localHost](https://github.com/syjaka/Linux-Palvelimet-2024/blob/main/images/4.4_localHost.png)

hain uudestaan lokeja komennoilla:

    $ sudo tail /var/log/apache2/access.log
    $ sudo tail /var/log/apache2/error.log

mutta yhä jäi viimeiset lokit löytymättä. 

   ![4.5_log_MIA](https://github.com/syjaka/Linux-Palvelimet-2024/blob/main/images/4.5_log_MIA.png)

Tässä vaiheessa klo 22.15 luovutin ja kyselin opettajalta/ muilta opiskelijoilta neuvoa. Tiistain työajaksi tuli noin neljä tuntia + artikkeleiden tiivistelmät

Jatkoin työskentelyäke ke 31.01 klo 18.30. Opettajalta saadun vinkin perusteella tarkistin kaikki apachen lokit.

    $ sudo ls /var/log/apache2/ # josta avasin vhost access lokin komennolla
    $ $ sudo tail /var/log/apache2/other_vhosts_access.log # tail komennossa tuo viimeisen ensin esiin

 Other_vhosts_access-lokista tapahtumat löytyivät ja alla analyysiä edellisen päivän hausta:

   ![4.6_loki_success](https://github.com/syjaka/Linux-Palvelimet-2024/blob/main/images/4.6_loki_success.png)

1. **sivu.example.com**kertoo haetun sivun url:in
2. **80 ja 127.0.0.1** 80 ovat porttinumero ja 127.0.0.1 in haun tehneen clientin IP-osoite, tässä tapauksessa omani.
3. **ensimmäinen -** mikäli käytössä olisi jokin remote log, niin sen nimi olisi tässä. Viiva edustaa placeholderia
4. **toinen -**  mikäli käytössä etäkäyttäjä, olisi tässä tämän username. Viiva edustaa placeholderia.
5. **[30/Jan/2024:21:47:10 +0200]** pyynnön aikaleima
6. **GET / HTTP/1.1** Get - pyynnön metodi, / - polku, HTTP/1.1 käytetty protokolla ja sen versio 1.1
7. **200** vastauskoodi 200 tarkoittaa OK
8. **238** Vastauksen määrä tavuina (Ayooluwa 2023)
9. **curl/7.88.1** curl on ohjelma jolla haku tehtiin ja 7.88.1 on sen versio (googlehaku curl 7.88.1)

## 5. Etusivu uusiksi 

Aluksi tein uuden name based virtual hostin:

      $ sudoedit /etc/apache2/sites-available/uusiks.example.com.conf #Komennolla aukesi nano jolla konfasin ao. asetukset uusiks.example.com virtuaalipalvelimeen

![5.1_uusiks_nano](https://github.com/syjaka/Linux-Palvelimet-2024/blob/main/images/5.1_uusiks_nano.png)

    $ sudo a2ensite uusiks.example.com # aktivoin uuden palvelimen
    $ systemctl reload apache2 # käynnistin apachen uudelleen, tämä komento avasi autentikointipyyntöikkunan jonka kuittasin

Tein uuden kansion uusiks.example.com
   
   ![5.2_mkdir_uusiks](https://github.com/syjaka/Linux-Palvelimet-2024/blob/main/images/5.2_mkdir_uusiks.png)

ja tein sinne uuden tiedoston
 
   ![5.3_echo_uusiks](https://github.com/syjaka/Linux-Palvelimet-2024/blob/main/images/5.3_echo_uusiks.png)

Tarkistan vielä että default-sivu on oikea uusi uusiks-sivu

![5.4_sites_enabled](https://github.com/syjaka/Linux-Palvelimet-2024/blob/main/images/5.4_sites_enabled.png)

Täällä on vielä edellisen harjoituksen sivu.example. Kansio järjestyy akkosjärjestyksessä ja koska localhost komennolla ei ole määritelty haluttua virtualhostia valitsee apache ensimäisen listatun täältä, muutin uusiks.example sivun nimeä lisäämällä aa alkuun, jolloin se vastaa ensimmäisenä. (apache.org)

Muutoksen tein kuten alla:

   ![5.5_mv_aauusiks](https://github.com/syjaka/Linux-Palvelimet-2024/blob/main/images/455_mv_aauusiks.png)


Muutoksen jälkeen Sites enabled kansio ei enää tunnista tiedostoa koska nimi uudistui, joten se tulee uudelleen enabloida, vanhan toimimattoman    tiedostonimen disabloin ja sitten testasin ja nyt kaikki toimi.

![5.6_localhost_toimii](https://github.com/syjaka/Linux-Palvelimet-2024/blob/main/images/5.6_localhost_toimii.png)

Tässä vaiheessa huomasin, että tehtävänannossa uusi tiedosto piti olla nimeltään hattu.example.com joten seuraavaksi harjoittelen tehtävänannon perusteellista lukemista. Mutta nyt tein kaiken edelläkerrotun uudelleen, tällä kertaa jo sujuvammin.
   1. Määritän virtuaalipalvelimen hattu.example.com konfiguraatiot samalla kun luon tiedoston sites-available hakemistoon
   2. Enabloin hattu.example.com sites-enabled hakemistoon
   3. Luon hattu.example.com hakemiston publicsites hakemistoon
   4. Luon hattu.example.com tiedoston hattu.example.com hakemistoon ja muokkaan sen sisältöä micro editorilla
   5. testaan että se toimii
![5.7_hattu_toimii](https://github.com/syjaka/Linux-Palvelimet-2024/blob/main/images/5.7_hattu_toimii.png)
   6. Jos olisin ensimmäisella tehnyt tämän oikein, toimisi hattu-sivu myös defaulttina. Koska sisällytin sites-enabled hakemistoon kuitenkin aaauusiks.example.com tiedoston menee se määrittelemättömällä haulla ensisijaiseksi aakkosjärjestyksen mukaan. Sen vuoksi poistan vielä sen sites-enabled hakemistosta.
   7. Seuraavaksi haku "curl localhost" joka tuottaa toivotun tuloksen
![4.8_localhost_hattu_toimii](https://github.com/syjaka/Linux-Palvelimet-2024/blob/main/images/5.8_localhost_hattu_toimii.png)
   8. Selaimella testatessa näytti ensin vielä edellisen sivun sisältöä. Historian ja välimuistin tyhjennyksen jälkeen sisältö oli oikea
![4.9_hattu_firefox](https://github.com/syjaka/Linux-Palvelimet-2024/blob/main/images/5.9_hattu_firefox.png)

## 6. Tee validi HTML5 sivu

Tämä tuli tehtyä jo edellisessä mutta testasin koodin vielä validatorissa:

   ![5.10_validator](https://github.com/syjaka/Linux-Palvelimet-2024/blob/main/images/5.10_validator.png)

## 7. Esimerkit curl komennoista

Curl on komentorivityökalu. Sitä käytetään tietojen lähettämiseen tai hakemiseen eri protokollia käyttäen.
Curl komennosta on oiva esimerkki edellisen tehtävän kohdan 7 kuvassa jossa olen suorittanut komennon. vastauksena komentoon saan kyseisen verkkosivun sisällön.

    $ curl localhost
Seuraavaksi kokeilen curl -I terokarvinen.com pyyntöä joka lähettää HTTP HEAD- pyynnön ts. komento pyytää ainoastaan vastauksen otsakkeita koko sisällön sijaan. 

   ![6.1_curl_-I](https://github.com/syjaka/Linux-Palvelimet-2024/blob/main/images/6.1_curl_-I.png)
   1. **HTTP/1.1 301 Moved Permanently** Kertoo että pyydetty sivu on siirretty pysyvästi uuteen sijaintiin
   2. **Date: Wed, 31 Jan 2024 22:04:19 GMT** Tämä kertoo vastauksen lähetysajan GMT-ajassa
   3. **Server: Apache/2.2.14 (Ubuntu)** Tämä kertoo että vastaus tulee Apache verkkopalvelinohjelmistolta versiossa 2.2.14 joka on asennettu Ubuntu käyttöjärjestelmälle
   4. **Location: https://terokarvinen.com/** Tämä location kertoo että sijainti on siirretty sivustolle jossa HTTPS-yhteys
   5. **Content-Type: text/html; charset=iso-8859-1** Tämä kertoo että vastaus on HTML-muodossa ja käyttää ISO-8859-1 merkkikoodausta

## 8. Hanki GitHub education paketti

Tämä oli jo olemassa
![8.1_GitHub_edu](https://github.com/syjaka/Linux-Palvelimet-2024/blob/main/images/8.1_GitHub_edu.png)
  
## 9. Nimipohjainen virtuaalipalvelin ja 10. Laita sama tietokone vastaamaan kahdella eri sivulla kahdesta eri nimestä

   Seuraavaksi tein kaksi viimeistä bonusta. Minulla on jo sivut sivu.examole.com ja hattu.example.com. Yllä oli myös käytetty aauusiks.example.com jonka nimen muokkasin. Muokkaan tämän takaisin alkuperäiseen muotoonsa ja käytän niitä tehtävään.

       $ sudoedit /etc/hosts

Komennolla muokkasin hosts tiedostoa jonne lisäsin domain-nimet ja ohjauksen localhostiin:
127.0.0.1 hattu.example.com
127.0.0.1 sivu.example.com
127.0.0.1 uusiks.example.com

Lisäyksen jälkeen hosts-tiedosto näytää tältä

![9.1_hosts]()

Ja selaimella haut onnistuvat

![9.2_hattu.com]() ![9.3_sivu.com]() ![9.4_uusiks.com]()

Valmista tuli to 1.2 klo 1.00
    
### Lähteet:

Apache.org, 2023. Luettavissa: https://httpd.apache.org/docs/2.4/vhosts/name-based.html, luettu: 30.01.2024

Ayooluwa Isaiah/Betterstack.com, How to Wiew and configure apache access and error logs. 2023. Luettavissa: https://betterstack.com/community/guides/logging/how-to-view-and-configure-apache-access-and-error-logs/, luettu 30.01.2024

Linuxhint.com, How to uninstall and remove Apache2 on Debian, 2023. Luettavissa: https://linuxhint.com/uninstall-and-remove-apache2-on-debian/, luettu 30.01.2024

Tero Karvinen, Name Based Virtual Hosts on Apache – Multiple Websites to Single IP Address, 2018. Luettavissa: https://terokarvinen.com/2018/04/10/name-based-virtual-hosts-on-apache-multiple-websites-to-single-ip-address/, luettu 30.01.2014

