# **KESKENERÄINEN**
# H3 Hello Web Server

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
      ![1.1_Main_host_goes_away]()
  - Sekaannuksien välttämiseksi jokaiselle nimipohjaiselle virtuaalipalvelimelle olisi parasta aina määrittää Server Name yksilöllisesti.
  - Allas kuva esimerkistä:
    ![1.2_eri_virtuaHostit]()
  - Jos haluaa että palvelin on saavutettavissa useamman nimen avulla voidaan luoda ServerAlias. Tämän voi tehdä joko tarkasti kuten www.esim.com tai jokerin avulla *.esim.com jolloin kaikki mahdolliset yhdistelmät ennen postettä johtavat samaan tulokseen
  - VirtualHostien asetuksia voi myös hienosäätää lisäämällä määrityksiä VirtualHost-lohkoihin siten että ne vaikuttavat vain lohkonsa VirtualHostiin. Näitä määrityksiä käsitellään ensisijaisina omassa lohkossaan, vaikka myös pääpalvelimella olisi asetettu jotain mahdollisesti ristiriitaisia määrityksiä. (Apache.org, 2023)
 
## 2. Tiivistelmä artikkelista - Name Based Virtual Hosts on Apache – Multiple Websites to Single IP Address
- Apachen avulla voit pitää monta domainia yhdellä IP-osoitteella
- Web serverin asennus ja default-sivun korvaaminen:

  $ sudo apt-get - y install apache2


  

### Lähteet:

Apache.org, 2023. Luettavissa: https://httpd.apache.org/docs/2.4/vhosts/name-based.html, luettu: 30.01.2024
