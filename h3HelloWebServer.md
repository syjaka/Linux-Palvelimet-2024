# H3 Hello Web Server

# **'KESKENERÄINEN'**

### Tero Karvisen Linux palvelimet kurssin [kolmantena tehtävänä](https://terokarvinen.com/2024/linux-palvelimet-2024-alkukevat/#h3-hello-web-server) oli:
1. Tiivistää Artikkeli: [The Apache Software Foundation 2023: Apache HTTP Server Version 2.4 Documentation: Name-based Virtual Host Support](https://httpd.apache.org/docs/2.4/vhosts/name-based.html)
2. Tiivistä Tero karvisen artikkeli [Name Based Virtual Hosts on Apache – Multiple Websites to Single IP Address](https://terokarvinen.com/2018/04/10/name-based-virtual-hosts-on-apache-multiple-websites-to-single-ip-address/)
3. Testaa että tunnilla asennettu weppipalvelin vastaa localhost osoitteesta
4. Etsi ja analysoi rivit jotka muodostuvat lokiin, kun omalta palvelimelta ladataan yksi sivu
5. Tee uusi name based virtual host
6. Tee validi HTML5 sivu.
7. Anna esimerkit curl -I ja curl -komennoista

   Lisäksi vapaaehtoiset:
9. Vapaaehtoinen: Hanki GitHub Education -paketti
10. Tee apachelle nimipohjainen virtuaalipaketti
11. Laita sama tietokone vastaamaan kahdella eri sivulla kahdesta eri nimestä

## 1. Tiivistelmä artikkelista Name-based vs. Virtual Hosts
- IP- vai nimipohjainen virtuaalipalvelin
  - IP-pohjaisessa virtuaalipalvelimessa jokaisella nettisivulla on oma IP-osoite jonka perusteella client navigoi palvelimelle.
  - Nimipohjaisessa virtuaalipalvelimessa usea verkkosivu jakaa saman IP-osoitteen ja sivun nimi (osa HTTP headeria) kertoo mikä sivu näytetään.
  - Nimipohjaisella virtuaalipalvelimen etuja on yksinkertaisempi set-up ja vähissä olevien IP-osoitteiden säästeliäs käyttö
- Palvelin valitsee ensisijaisesti IP-osoitteen perusteella mitkä virtuaalipalvelimet ovat oikeita. Tämän enbsiusijaisen valinnan voi ohittaa käyttämällä jokerimerkkiä (*) IP-osoitteessa jolloin ensisijainen valinta "ohitetaan" ja palvelin tarkastelee ServerName- ja ServerAlias määrityksiä oikean virtuaalipalvelimen löytymiseen.
- ServerName nimitiedon poisjättäminen nimipohjaiselta virtuaalipalvelimelta on omiaan aiheuttamaan sekaannuksia sillä tällöin palvelin käyttää (FQDN) toimialueen nimeä.
- Jos palvelimella on useita verkkosivuja jotka vastaavat IP-osoitetta ja porttia ja ServerName tai ServerAlias vastaavuutta ei löydy, hakuun vastataan ensimmäisen hakua vastaavan IP-osoite/portti-yhdistelmän sisällöllä.
- Nimipohjaisten virtuaalipalvelimien käyttö
  - Jokaiselle halutulle verkkosivulle tulee luoda ensin oma VirtualHost-osio jonka tulee minimissään sisältää ServertName - joka kertoo mikä sivu kyseessä ja DocumentRoot - joka kertoo missä hakemistossa kyseisen Hostin sisältö on.
  - Mikäli pyyntö ei vastaa olemasaaolevaa VirtuaHostia käsitellään se globaalin palvelimen määritysten mukaan.
  - Tätä kohtaa en ymmärrä
      ![1.1_Main_host_goes_away](https://github.com/syjaka/Linux-Palvelimet-2024/blob/main/images/1.1_Main_host_goes_away.png)
  - Sekaannuksien välttämiseksi jokaiselle nimipohjaiselle virtuaalipalvelimelle olisi parasta aina määrittää Server Name yksilöllisesti.
  - Allas kuva esimerkistä:
    ![1.2_eri_virtuaHostit](https://github.com/syjaka/Linux-Palvelimet-2024/blob/main/images/1.2_eri_virtuaHostit.png)
  - Jos haluaa että palvelin on saavutettavissa useamman nimen avulla voidaan luoda ServerAlias. Tämän voi tehdä joko tarkasti kuten www.esim.com tai jokerin avulla *.esim.com jolloin kaikki mahdolliset yhdistelmät ennen postettä johtavat samaan tulokseen
  - VirtualHostien asetuksia voi myös hienosäätää lisäämällä määrityksiä VirtualHost-lohkoihin siten että ne vaikuttavat vain lohkonsa VirtualHostiin. Näitä määrityksiä käsitellään ensisijaisina omassa lohkossaan, vaikka myös pääpalvelimella olisi asetettu jotain mahdollisesti ristiriitaisia määrityksiä. 
 
## 2. Tiivistelmä artikkelista - Name Based Virtual Hosts on Apache – Multiple Websites to Single IP Address

Apachen avulla voit pitää monta domainia yhdellä IP-osoitteella

   Web serverin asennus ja default-sivun korvaaminen:
    
    $ sudo apt-get -y install apache2  # Apache-web serverin asennus
    $ echo "Default"|sudo tee /var/www/html/index.html #oletustiedoston korvaaminen index.html nimisellä tiedostolla jossa "Default"-teksti hakemistossa /var/www/html

   Uuden nimipohjaisen virtuaalipalvelimen asennus

    $ sudoedit /etc/apache2/sites-available/pyora.example.com.conf # Avaa mainitun tiedoston muokattavaksi pääkäyttäjän oikeuksilla ja määritä VirtualHost annetuilla konfiguraatioilla
    $ cat /etc/apache2/sites-available/pyora.example.com.conf # lukee ja näyttää mainitun tiedoston sisällön
    $ sudo a2ensite pyora.example.com # tämä aktivoi virtuaalipalvelimen konfiguraatiot
    $ sudo systemctl restart apache2 # tätä käynnistää apachen uudelleen muutoksien voimaansaattamiseksi

   Luo verkkosivu tavallisena käyttäjänä (ei pääkäyttäjä)

    $ mkdir -p /home/xubuntu/publicsites/pyora.example.com/
    $ echo pyora > /home/xubuntu/publicsites/pyora.example.com/index.html

   Testaa lopputulos

    $ curl -H 'Host: pyora.example.com' localhost
    $ curl localhost

 Tai Firefoxissa 'http:/localhost tai http://pyora.example.com

 ## 3. Testi että weppipalvelin vastaa localhost-osoitteesta klo 

   ![3.1_localHost_terminaali](https://github.com/syjaka/Linux-Palvelimet-2024/blob/main/images/3.1_localHost_terminaali_.png)

## 4. Etsi lokista rivit jotka syntyivät äskeisestä

Haen aluksi Apachen lokitiedot. Koska kyseessä oli onnistunut haku haen access-lokeja.

    $ sudo cat /var/log/apache2/access.log

- Tulokseksi saan lokitiedostot, mutta viimeinen kellottuu tälle päivälle klo 13.20, haun tein noin 18...

   ![4.1_loki_1](https://github.com/syjaka/Linux-Palvelimet-2024/blob/main/images/4.1_loki_1.png)

- Eli pitää selvittää miksi lokit ei näy täällä. Lähtökohtana lokin viimeinen tapahtuma näkyy kuvassa, eli lokit ovat tallentuneet tänne. jokin muutos on siis tapahtunut.

- Klo 20.37 Parhaan kykyni mukaan yritin etsiä googlesta syitä, mutta mitään olosuhteisiin sopivaa ei löytynyt.
Päivällä apachea ensi kerran asentaessa minulla oli jonkin verran ongelmia ja mahdollista on että asiaa korjatessa jokin on mennyt pieleen. Sen vuoksi aloitan alusta ja samalla tulee harjoiteltua vapaaehtoista bonusta...

Apachen poisto autoremove komennolla:

    $ sudo apt autoremove apache2 apache2-utils  

poisti apachen kaikkine asetuksineen (linuxhint 2023). Yksi hakemisto jäi:

![4.2_apche_var_lib_rmv](https://github.com/syjaka/Linux-Palvelimet-2024/blob/main/images/4.2_apache_var_lib_not_rmv.png)

tarkistin ensin sisälsikö se mitään, tyhjä oli joten poistin sen komennolla:

    sudo rm -r /var/lib/apache2/

Seuraavaksi asensin apachen uudelleen:

    $ sudo apt-get update
    $ sudo apt-get -y install apache2
    $ echo "Default"|sudo tee /var/www/html/index.html

Sitten uusi nimi ja virtuaalihost:

    $ sudoedit /etc/apache2/sites-available/pyora.example.com.conf #tänne määritän virtuaalipalvelimen konfiguraatiot
    $ cat /etc/apache2/sites-available/pyora.example.com.conf # Tällä komennolla avaan ne tarkasteltaviksi:
![4.3_vs_conf](https://github.com/syjaka/Linux-Palvelimet-2024/blob/main/images/4.3vs_conf.png)

    $ sudo a2ensite pyora.example.com # komennolla aktivoin virtuaalipalvelimen konfiguratiot
    $ sudo systemctl restart apache2 # uudelleenkäynnistys saattaa voimaan uudet configuraatiot

Koska minulla oli jo kotihakemistossa sivu.example.com tuotti localhost testi toivotun tuloksen:

   ![4.4_localHost](https://github.com/syjaka/Linux-Palvelimet-2024/blob/main/images/4.4_localHost.png)

hain uudestaan lokeja komennoilla:

    $ sudo tail /var/log/apache2/access.log
    $ sudo tail /var/log/apache2/error.log
mutta yhä jää lokit löytymättä. Seuraavaksi koitan vaihtaa lokien talletuspaikkaa


  


### Lähteet:

Apache.org, 2023. Luettavissa: https://httpd.apache.org/docs/2.4/vhosts/name-based.html, luettu: 30.01.2024

Betterstack.com, How to Wiew and configure apache access and error logs. 2023. Luettavissa: https://betterstack.com/community/guides/logging/how-to-view-and-configure-apache-access-and-error-logs/, luettu 30.01.2024

Linuxhint.com, How to uninstall and remove Apache2 on Debian, 2023. Luettavissa: https://linuxhint.com/uninstall-and-remove-apache2-on-debian/, luettu 30.01.2024

Tero Karvinen, Name Based Virtual Hosts on Apache – Multiple Websites to Single IP Address, 2018. Luettavissa: https://terokarvinen.com/2018/04/10/name-based-virtual-hosts-on-apache-multiple-websites-to-single-ip-address/, luettu 30.01.2014

