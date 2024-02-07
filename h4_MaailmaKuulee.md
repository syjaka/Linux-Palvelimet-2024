# h4_Virtual Server & Oma nimipalvelin

# Keskeneräinen

- x)[ tiivistelmä](https://github.com/syjaka/Linux-Palvelimet-2024/blob/main/h4_MaailmaKuulee.md#x-tiivistelmä)
- a)[Oma virtuaalipalvelin](https://github.com/syjaka/Linux-Palvelimet-2024/blob/main/h4_MaailmaKuulee.md#a-Oma-virtuaalipalvelin)
- b)[Virtuaalipalvelin käyttökuntoon](https://github.com/syjaka/Linux-Palvelimet-2024/blob/main/h4_MaailmaKuulee.md#b-Virtuaalipalvelin-käyttökuntoon)
- c)[Asenna oma webbipalvelin](https://github.com/syjaka/Linux-Palvelimet-2024/blob/main/h4_MaailmaKuulee.md.md#c-Asenna-oma-webbipalvelin)
- d)[Oma domain käyttöön](https://github.com/syjaka/Linux-Palvelimet-2024/blob/main/h4_MaailmaKuulee.md#d-Oma-domain-käyttöön)
- y)[ Työskentely-ympäristö](https://github.com/syjaka/Linux-Palvelimet-2024/blob/main/h4_MaailmaKuulee.md#y-työskentely-ympäristö)
- z)[ Alkutoimenpiteet](https://github.com/syjaka/Linux-Palvelimet-2024/blob/main/h4_MaailmaKuulee.md#z-alkutoimenpiteet)
- 

---
  ## x) tiivistelmät

  ### Teoriasta käytäntöön pilvipalvelimen avulla
  
#### a) Pilvipalvelimen vuokraus ja asennus
- Ensimmäisessä Osiossa kerrotaan kuinka pilvipalvelun vuokraus onnistuu Digital Ocean plavelun (DO) kautta ja miten se asennetaan. Lehto vuokrasi oman pilvipalvelunsa DO-palvelusta käyttäen GitHub Educationin tarjoamaa Promokoodia. Vuokraus alkoi palveluun kirjautumisella, jonka jälkeen Leino päivitti nimitiedot ja syötti promokoodin. Seuraavaksi hän valitsi palvelun, eli loi itsellensä "Dropletin" (virtuaalikoneen).
- Seuraavissa vaiheissa Lehto valitsi virtuaalikoneen määritykset joiden jälkeen hän valitsi 'Create Droplet'. Hetken kuluttua luotu virtuaalikone oli valmis- IP-osoitteineen.
- Seuraavassa osiossa Lehto vuokrasi domainnimen. Lehto hyödynsi GitHub educationin alekoodia .me päätteiselle domainnimelle Namecheap -palvelussa. Lehto etsi käyettävissä olevaa domainnimeä sivuston search-toiminnolla ja päätyi susannalehto.me nimeen jonka rekisteröi itselleen. Tämä vaati myös Namecheap -palveluun rekisteröitymistä. Kaiken valmistuttua Lehto tarkasti kaiken olevan kunnossa Namecheapin hallintapaneelista.
- Lopuksi Lehto ohjasi domainnimen susannalehto.me osoittamaan DigitalOceanilta hankitulle virtuaalipalvelimelle. Tämä tapahtui hallintasivun Advanced DNS-välilehden kautta. Täällä Lehto poisti kaikki turhat Host recordsit ja loi uuden. Tähän uuteen Host recordiin ehto asetti DO virtuaalipalvelimen IP-osoitteen ja TTL- sarakkeen arvoksi 5 minuuttia.
  
#### b) Palvelin suojaan palomuurilla
Tässä Lehto kertoo palomuurin käyttöönotosta
  1. Yhteys virtuaalikoneelle 'ssh root@188.166.4.6'
  2. Päivitysten haku 'sudo apt-get update' ja palomuurin asennus 'sudo apt-get install ufw'
  3. Reikä palomuuriin 'sudo ufw allow 22/tpc'
  4. ja palomuurin käynnistys 'sudo ufw enable'
#### c) Kotisivut palvelimelle
Seuraavaksi Lehto asensi DO virtuaalikoneelle Apache-webbipalvelimen ja teki käyttäjälle toimivat kotisivut
  1. Käyttäjän luonti 'sudo adduser suska' ja muutos pääkäyttäjäksi 'sudo adduser suska sudo'
  2. Testi toisen koneen terminaalissa toimiiko käyttäjän oikeudet. Ensin yhteys 'ssh suska@188.166.4.6' ja sitten sudo testikomento 'sudo apt-get update'
  3. root käyttäjän lukinta 'sudo usermod –lock root'
  4. Domainnimen pingaus ping susannalehto.me joka piti päättymättömänä keskeyttää sulkemalla terminaali
  5. Uudelleenkirjautuminen ssh kautta ja saatavilla olevien päivitysten ja tietoturvapäivitysten asennus 'sudo apt-get update' 'sudo apt-get upgrade' ja sudo apt-get dist-upgrade
  6. Apache-webbipalvelimen asennus 'sudo apt-get install apache2' ja testaus 'sudo systemctl status apache2'
  7. Palomuuriin toinen reikä portille 80 'sudo ufw allow 80/tcp'
  8. Apachen testisivun korvaaminen 'echo Hello world! |sudo tee /var/www/html/index.html'
  9. Userdir-moduulin käyttöönotto 'sudo a2enmod userdir' ja uudelleen käynnistys 'sudo service apache2 restart'
  10. Julkisen public_html kansion luonti ja näkyvyyden tarkistus firefoxissa
  11. Ssh-yhteyden avaus 'sudo systemctl start ssh' ja micro editorin asennus 'sudo apt-get install micro'
  12. Tekstitiedoston luonti public_html kansioon 'cd public_html' ja 'micro index.html' jonne Lehto loi lyhyen nettisivun rungon.
  13. Viimeiseksi testaus toisen koneen selaimella 
#### d)Palvelimen ohjelmien päivitys

      2. 
e) 
f) Palvelimen ohjelmien päivitys
(Lehto 2022)
  ### First Steps on a New Virtual Private Server

  (Karvinen 2012)
---

---

  ## y) Työskentely-ympäristö
  - Host OS on MacBook Retina 12-inch, jossa Ventura 13.6.1 käyttöjärjestelmä Suomen maa-asetuksilla ja suomen kielellä. Koneessa on 1,3GHz kaksiytiminen Intel Core i5 prosessori ja 8Gt 1867 MHz LPDDR3 muistia. Näytönohjain on Intel HD Graphics 615 jossa VRAM 1536 Mt.
  - Guest OS minulla on Debian GNU/Linux 12 (Bookworm), 64-bit
---

  ## z) alkutoimenpiteet
  1. Virtualboxin ja virtuaalikoneen käynnistäminen
  2. Terminaalin käynnistys `Applications` -> `Terminal Emulator`

---

Tehtäviä tehdessäni käytän tietolähteenäni omia luentomuistiinpanojani sekä raporttiin merkattuja lähteitä. 


## a) Oma virtuaalipalvelin

Tässä tehtävässä vuokrasin oman virtuaalipalvelimen.palveluntarjoajalta. Aloitan tehtävän 2024.02.06 klo 14.30 ja saan sen valmiiksi noin 15.05 UCT +3

Hyödynsin tehtävässä GitHub educationin etua Digital Ocean hostauspalvelun käyttöön, koulutuspaketti tarjoaa $200 arvosta credittiä palveluun ensimmäisen vuoden ajalle.

  ![4.1.1DigitOcean_GitHub](https://github.com/syjaka/Linux-Palvelimet-2024/blob/main/images/4.1.1DigitOcean_GitHub.png)

1.  Aloitin klikkaamalla kuvassa olevaa linkkiä "Get access...", joka avasi uuden välilehden Digital Oceanin sivulle. Täällä valitsen ![4.1.2_SignUp]([)](https://github.com/syjaka/Linux-Palvelimet-2024/blob/main/images/4.1.2_SignUp.png) joka ohjasi minut kirjautumaan palveluun github-tunniksillani
2.  Seuraavaksi etenin palvelun käyttöönottoon vastaamalla esitettyihin kyselyihin. Tämän jälkeen minulta pyydettiin luottokorttitiedot henkilöllisyyteni vahvistamiseen. 
Digital Ocean teki $1 katevarauksen luottokortin oikeellisuuden tarkistamiseksi, mutta tämä häviää veloituksista hetken kuluttua.
3.  Luottokorttitietojen vahvistuksen jälkeen aukesi aloitussivu, josta haluttu palvelu tuli valita. Tässä tapauksessa valitsin 'Deploy a virtual machine'

    ![4.1.3_DeployVM](https://github.com/syjaka/Linux-Palvelimet-2024/blob/main/images/4.1.3_Deploy_VM.png)
  
4. Tässä vaiheessa tarkistelin oman tilini tilaa ja huomasin että yhteys GitHub Educationin ja Digital oceanin välillä ei ollut kirjautunut. Tutkin asiaa lisää ja klikkasin uudelleen GitHubin linkkiä (sama joka ensimmäisessä kuvassa yllä).
5. Tämä ohjasi minut uudelle autentikointisivulle, josta autorisoin Digital Oceanin. Tämän jälkeen aukesi kuittaus jossa käyttäjätunnukselleni ilmoitettiin lisätyksi $200 credit.

    ![4.1.4_AuthorizeDO](https://github.com/syjaka/Linux-Palvelimet-2024/blob/main/images/4.1.4_AuthorizeDO.png) ![4.1.5_CreditOK](https://github.com/syjaka/Linux-Palvelimet-2024/blob/main/images/4.1.5_CreditOK.png)

6. Tämän autentikoinnin jälkeen avautuva ikkuna oli hieman erilainen kuin tunnilla, mutta yläreunan Create- valikon kautta löytyi tunnilta tuttu Droplets maininta, joten valitsin sen.

  ![4.1.6_Create_Droplet](https://github.com/syjaka/Linux-Palvelimet-2024/blob/main/images/4.1.6_Create_Droplet.png)

7. Seuraavaksi avautui tunnilta tuttu sivu jossa valitaan luotavalle virtuaaliserverille määritykset:
    - Alue ja datacenterin sijainti 
       ![4.1.6_alue](https://github.com/syjaka/Linux-Palvelimet-2024/blob/main/images/4.1.6_Alue.png)
    - Haluttu OS ja versio (Valitsin uusimman saatavilla olevan Debianin: 12 on versio ja x64 kuvaa moniko bittinen prosessori)
        ![4.1.7_OS](https://github.com/syjaka/Linux-Palvelimet-2024/blob/main/images/4.1.7_OS.png)
    -  Seuraavassa kohdassa valitsin serverin ominaisuuksia. Tein valinnat opettajan antaman suosituksen mukaan.
         ![4.1.8_Server_type](https://github.com/syjaka/Linux-Palvelimet-2024/blob/main/images/4.1.8_Server_type.png)
    -  Seuraavissa kohdissa tarjottiin lisätallennustilaa ja automaattisia varmuuskopioita joita en valinnut koska en niitä tarvitse
    -  Seuraavaksi oli oli vuorossa autentikointimetodin valinta. Vaihtoehtoja olivat SSH-avain (joka olisi turvallisin) ja salasana, jonka valitsin koska tämä on tuttu. Salasana kannattaa valita huolellisesti turvalliseksi, sillä on hyvin todennäköistä, että vuokrattuja pilviservereitä yritetään kaapata.
        ![4.1.9_salasana](https://github.com/syjaka/Linux-Palvelimet-2024/blob/main/images/4.1.9_salasana.png)
    -  Seuraavassa kohdassa valitsin kulutuksen seurannan ja mahdolliset hälytykset. Tämä oli veloitukseton ominaisuus joten otin sen mukaan.
    -  Viimeisessä kohdassa valitaan montako kappaletta määritelytjä servereitä haluan ja määritin tälle serverille jonkin neutraalin ja mahdollisimman persoonattoman nimen.
       ![4.1.10_Hostname](https://github.com/syjaka/Linux-Palvelimet-2024/blob/main/images/4.1.10_Hostname.png)
    -  Viimeiseksi valitsen create Droplet  jonka jälkeen sivu rullasi noin minuutin. Lopputuloksena minulla on vuokrattuna tammari-niminen virtuaalipalvelin
       ![4.1.11_tammari_done](https://github.com/syjaka/Linux-Palvelimet-2024/blob/main/images/4.1.11_tammari_done.png)
 
---
  ## b) Virtuaalipalvelin käyttökuntoon

 Tässä osiossa tein Tee alkutoimet omalla virtuaalipalvelimellani.

 ### Palomuuri käyttöön
  1. Aloitan tehtävän ottamalla SHH-yhteyden luotuun tammari-virtuaalipalvelimeen
     - Annan terminaalissa komennon 'ssh root@104.248.205.0' ensin minulta tarkistettiin haluanhan varmasti ottaa yhteyden kyseiseen IP-osoitteeseen, jonka jälkeen minulta kysyttiin virtuaalipalvelimelleni annettua salasanaa. Salasanan antamisen jälkeen pääsin sisälle:
       ![4.2.1_sisään](https://github.com/syjaka/Linux-Palvelimet-2024/blob/main/images/4.2.1_sisa%CC%88a%CC%88n.png)
  2. Seuraavaksi asensin palomuurin, 'sudo apt-get update' & 'sudo apt-get install ufw'
  3. Seuraavaksi tein aukon palomuuriin komennolla 'sudo ufw allow 22/tcp' jossa allow sallii, 22 on portti ja tcp käytettävä on protokolla. 
  4. 'sudo ufw enable' käynnistää palomuurin. Lopputuloksena kuvan mukainen palaute
    ![4.2.2_palomuuriUp](https://github.com/syjaka/Linux-Palvelimet-2024/blob/main/images/4.2.2_palomuuriUp.png)

### Root-tunnuksen lukitseminen sekä oman käyttäjän lisäys
Tavallisesti virtuaalipalvelimelle kiorjaudutaan käyttäjänä, eikä roottina. Tärkeimipiä syitä tähän on se, että root käyttäjänä on koko ajan sudo-oikeudet, jolloin voi huomaamattaan tehdä jotain perustavanlaatuisia muutoksia/vahingoittaa järjestelmää pysyvästi (Cyber Duck 2022).  Lisäksi käyttäjä on tärkeä pystyä identifioimaan, jotta mahdolliuset muutokset voidaan kohdentaa käyttäjään (Karvinen 2024).

  1. Loin käyttäjän komennolla ' $ sudo adduser syrja` ja keksin hyvän salasanan
  2. Käyttäjätietoihin annoin nimeni, mutta muut kohdat ohitin 'return'
  3. 'sudo adduser syrja sudo' lisää luodun käyttäjän sudo-ryhmään eli tekee käyttäjästä sudo-userin
  4. Testaan että pääsen kirjautumaan palvelimelle luotuna käyttäjänä ja että salasana toimii.
    ![4.3.1_syrjaToimii](https://github.com/syjaka/Linux-Palvelimet-2024/blob/main/images/4.3.1_syrjaToimii.png)
  5. Seuraavaksi lukitsen root-käyttäjän, estääkseni salasanakirjautumisen, muut tavat ovat yhä mahdollisia. Lukitsemiseen käytän komentoa 'sudo usermod -- lock root. Testaan lukitusta yrittämällä kirjautua uudelleen root-käyttäjänä(kuten yllä kohdassa b) 1.), mutta Järjestelmä ei päästä sisään

### Ohjelmien päivitys
Seuraavaksi ryhdyin päivittämään paketteja komennoilla 'sudo apt-get update' ja 'sudo apt-get upgrade'. Lopputuloksena sain ao viestin:

![4.3.2HerjaVersiosta]
Valitsin tarkistaa erot tiedostojen välillä:

![4.3.3Erot]()
Kuvassa reunustetut kohdat kertoivat että uudessa versiossa salasanakirjautuminen on estetty root-tunnuksella sekä ClientAliveInterval 120 rivi on poistettu. Root-kirjautumisen itse muutin, mutta en keksi syytä miksi ClientAliveInterval on poistettu. Koska muita muutoksia ei näy päätän pitää nykyisen (uuden) version, jossa root on lukittu.

## c) Asenna oma webbipalvelin

Aloitan asentamalla vuokratulle virtuaalikoneelle apache-web palvelimen seuraten tehtävässä [h3_HelloWebServer](https://github.com/syjaka/Linux-Palvelimet-2024/blob/main/h3_HelloWebServer.md) toimia.

1. Apachen asennus seuraavin komennoin 'sudo apt-get update'  ja 'sudo apt-get -y install apache2'
2. Default sivun korvaaminen index.html tiedostolla 'echo "Default"|sudo tee /var/www/html/index.html'
3. Virtuaalipalvelimen conf sivun luonti 'sudoedit /etc/apache2/sites-available/sivu.example.com.conf'
    ![4.5.1_sivu_conf[(https://github.com/syjaka/Linux-Palvelimet-2024/blob/main/images/4.5.1_sivu_conf.png)
4. aktivoin juuri luodut conffit 'sudo a2ensite sivu.example.com'
    - Saan erroria koska sivu.example.com ei ole vielä olemassa
    ![4.5.2_error_not_exist](https://github.com/syjaka/Linux-Palvelimet-2024/blob/main/images/4.5.2_error_not_exist.png)
    
    - Tarkistan onko kyseinen conf tiedosto olemassa
    ![4.5.4_cat_not Found](https://github.com/syjaka/Linux-Palvelimet-2024/blob/main/images/4.5.4_cat_not%20Found.png)
    -  Ei löytynyt, joten palaan takaisin tutkimaan mitä löytyy sites-available kansiosta
    ![4.5.5_sites_available](https://github.com/syjaka/Linux-Palvelimet-2024/blob/main/images/4.5.5_sites_available.png)
    - Täältä selviää, että tiedostonimessä on virhe, korjaan sen 'mv etusivu.example.com.con sivu.example.com.conf'
    - testaan uudelleen 'sudo a2ensite sivu.example.com' ja tällä kertaa se toimii
5. muutos astuu voimaan uudelleenkäynnistyksellä 'sudo systemctl restart apache2'
6. Tein kotihakemistooni uuden kansiopolun 'mkdir /home/syrja/publicsites/sivu.example.com'
   Sain virheen
   ![4.5.3_No_such_file](https://github.com/syjaka/Linux-Palvelimet-2024/blob/main/images/4.5.3_No_such_file.png)
7. Loin saman kansion porras portaalta. Ensin kotihakemistoon 'publicsites' kansion ja seuraavaksi 'sivu.example.com
8. Loin tekemääni kansioon uuden tiedoston 'echo sivu > /home/syrja/publicsites/sivu.example.com/index.html
9. Muokkasin index.html tiedostoa 'micro index.html' lisäämällä sinne html5 -pätkän
10. Testasin että sivu vastaa 'curl -H 'Host: sivu.example.com' localhost' sain erroria vastaukseksi !  
    [4.5.6_403_forbidden](https://github.com/syjaka/Linux-Palvelimet-2024/blob/main/images/4.5.6_403_forbidden.png)
      - muokkaan pääsyoikeuksia 'chmod ugo+x $HOME $HOME/publicsites/', 'ls -ld $HOME $HOME/publicsites/' (Karvinen 2024)
      - testaan uudelleen curl -H 'Host: sivu.example.com' localhost
      - Sama 403 error, tarkistan palomuurin tilan joka näyttää olevan kunnossa 
        ![4.5.7_ufw_status](https://github.com/syjaka/Linux-Palvelimet-2024/blob/main/images/4.5.7_ufw_status.png)
      - tarkistan conf-sivun määritykset, josta löytyy virhe; korjaan sen 
       ![(4.5.8_conf_tammari](https://github.com/syjaka/Linux-Palvelimet-2024/blob/main/images/4.5.8_conf_tammari.png)
      - Testasin uudelleen, tällä kertaa haku jäi auki eli sivu ei vastannut. Tässä vaiheessa heräsi epäilys että koodissa on jokin virhe, tarkistin index.html tiedoston ja sieltä löytyi ylimääräistä ennen varsinaista html-koodia. Korvasin koko html-pätkän "testisivu" tekstillä
      - Testasin ja yhä jää kellottamaan.
      - päätin testata curl komentoani varsinaisella virtuaalikoneellani ja sama vika. Testaan samalla koneella haettua sivua Firefox selaimella ja se toimii. Tarkistin apache.logit ja 'journalctl' lokit, niistä ei löytynyt mitään merkintää siitä että systeemi jää jumiin. 2024.02.07 klo 00.12 UCT + 3 lopetan työskentelyn. Tiistain aktiiviseksi työajaksi kertyi noin 10h.
      - 2024.02.07 klo 10.30 UCT +3 alotan työskentelyn käynnistämällä virtuaalikoneeni ja ottamalla yhteyden vuokrattuun virtuaalikoneeseeni komennolla 'ssh syrja@104.248.205.0'
      - Tureilla silmillä tutkittuani eilistä vianselvitystäni löysin, että olin anatnut väärän komennon 'curl -H 'Host: sivu.example.com' eli 'localhost puuttui lopusta. Tämän korjattuani sain uudelleen 403 forbidden sivun.
      - Huomasin myös että en ollut eilen rebootannut joten tein sen komennolla 'sudo systemctl reboot'. Tämä sulki yhteyden etäkoneeseen joten avasin yhteyden uudelleen ja testasin. Tällä kertaa onnistui, joten pääsen jatkamaan:
        ![4.5.9_success]()
      - Muokkasin vielä testisivulle html5 pätkän ja varmistin että yhä toimii.
17. 
11. 
12. 
13. 
14. Se

15. 
16. 
17. 


 

18. 
19. ipjo
20. 
21. hip




 ---
 ## d) Oman verkkotunnuksen rekisteröinti

Valitsin [Namecheap](https://www.namecheap.com/) palvelua verkkotunnukseni rekisteröintiin. Ensin oli valittava sopiva verkkotunnus. Tunnilla tuli puheeksi mahdollinen ääkkösten käyttö joten kokeilin heti omaa sukunimeäni:
![4.4.1_DomainSyrja]()

Koska se oli käytettävissä valitsin sen. Vaikka tunnus oli maksullinen ajattelen että tämä saattaa olla hyödyllinen tulevaisuudessa.

Verkkotunnuksen rekisteröinti namecheap palvelun kautta tapahtui lisäämällä haluttu domainnimi ostoskoriin. Checkoutin yhteydessä tarjottiin erilaisia lisäpalveluita joista valitsin Domain privacyn. 

4.4.2_[lisapalvelut]()

Tilauksen vahvistamisen yhteydessä piti rekisteröityä palvelun käyttäjäksi.

Rekisteröitymisen jälkeen tuli vielä valita verkkotunnuksen IDN-kieli, tässä tapauksessa suomi. Englanti ei olisi edes vaihtoehto ä-kirjaimen sisältävässä domain nimessä.

![4.4.3_IDN]()

Rekisteröitymisen jälkeen lisäsin maksutiedot, ja suoritin tilauksen josta hetken kuluttua sain vahvistuksen sähköpostiini. Sähköpostissa oli myös mandaatti että WHOIS tiedot tulee vahvistaa 14 vrk kuluessa tai rekisteröinti raukeaa. Lopputuloksena sain vahvistuksen, että syrjä.com on nyt rekisteröity nimiini.

![4.4.4_Verify]()

     
(nämä tehtävät on tehty luennon muistiinpanojen ja Tero Karvisen -First Steps on a New Virtual Private Server – an Example on DigitalOcean and Ubuntu 16.04 LTS, 2017 pohjalta, ellei lähdettä ole erikseen merkitty)
---

 - [ takaisin ylös](https://github.com/syjaka/Linux-Palvelimet-2024/blob/main/h4_MaailmaKuulee.md#h4)


---

### Lähteet:

Cyber Duck 2022. Understanding the difference between Sudo and Root in Linux. Luettavissa: https://medium.com/@cyberduck1/understanding-the-difference-between-sudo-and-root-in-linux-528c84e9b43d. Luettu 2024.02.06.

Karvinen T. 2017. First Steps on a New Virtual Private Server – an Example on DigitalOcean and Ubuntu 16.04 LTS. Luettavissa: https://terokarvinen.com/2017/first-steps-on-a-new-virtual-private-server-an-example-on-digitalocean/. Luettu 2024.02.06

Karvinen, T. 2024. Linux Palvelimet 2024 alkukevät. Luettavissa: https://terokarvinen.com/2024/linux-palvelimet-2024-alkukevat/. Luettu: 2024.02.06
  
Lehto S. 2022 Teoriasta käytäntöön pilvipalvelimen avulla (h4). Luettavissa: https://susannalehto.fi/2022/teoriasta-kaytantoon-pilvipalvelimen-avulla-h4/. Luettu 2024.02.07

