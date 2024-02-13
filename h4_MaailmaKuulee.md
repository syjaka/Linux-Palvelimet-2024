# h4_Virtual Server & Oma nimipalvelin


- x)[ Tiivistelmät](https://github.com/syjaka/Linux-Palvelimet-2024/blob/main/h4_MaailmaKuulee.md#x-tiivistelmät)
- a)[ Oma virtuaalipalvelin](https://github.com/syjaka/Linux-Palvelimet-2024/blob/main/h4_MaailmaKuulee.md#a-Oma-virtuaalipalvelin)
- b)[ Virtuaalipalvelin käyttökuntoon](https://github.com/syjaka/Linux-Palvelimet-2024/blob/main/h4_MaailmaKuulee.md#b-Virtuaalipalvelin-käyttökuntoon)
- c)[ Asenna oma webbipalvelin](https://github.com/syjaka/Linux-Palvelimet-2024/blob/main/h4_MaailmaKuulee.md#c-asenna-oma-webbipalvelin)
- d)[ Oma domain käyttöön](https://github.com/syjaka/Linux-Palvelimet-2024/blob/main/h4_MaailmaKuulee.md#d-Oma-domain-käyttöön)
- e) [ bonus](https://github.com/syjaka/Linux-Palvelimet-2024/blob/main/h4_MaailmaKuulee.md#bonus)
- y)[ Työskentely-ympäristö](https://github.com/syjaka/Linux-Palvelimet-2024/blob/main/h4_MaailmaKuulee.md#y-työskentely-ympäristö)
- z)[ Alkutoimenpiteet](https://github.com/syjaka/Linux-Palvelimet-2024/blob/main/h4_MaailmaKuulee.md#z-alkutoimenpiteet)


---
  ## x) tiivistelmät

  ### Teoriasta käytäntöön pilvipalvelimen avulla
  
#### a) Pilvipalvelimen vuokraus ja asennus
- Ensimmäisessä Osiossa kerrotaan kuinka pilvipalvelun vuokraus onnistuu Digital Ocean palvelun kautta ja miten se asennetaan. Lehto vuokrasi oman pilvipalvelunsa DigitalOocean-palvelusta käyttäen GitHub Educationin tarjoamaa promokoodia. Vuokraus alkoi palveluun kirjautumisella, jonka jälkeen Lehto päivitti nimitiedot ja syötti promokoodin. Seuraavaksi hän valitsi palvelun, eli loi itsellensä "Dropletin" (virtuaalikoneen).
- Seuraavissa vaiheissa Lehto valitsi virtuaalikoneen määritykset joiden jälkeen hän valitsi `Create Droplet`. Hetken kuluttua luotu virtuaalikone oli valmis- IP-osoitteineen.
- Seuraavassa osiossa Lehto vuokrasi domain-nimen. Lehto hyödynsi GitHub educationin etukoodia .me päätteiselle domainnimelle Namecheap -palvelussa. Lehto etsi käyettävissä olevaa domain-nimeä sivuston search-toiminnolla ja päätyi susannalehto.me nimeen, jonka rekisteröi itselleen. Domain-nimen rekisteröinti ja vuokraaminen vaati myös Namecheap -palveluun rekisteröitymistä. Toimien valmistuttua Lehto tarkasti kaiken olevan kunnossa, Namecheapin hallintapaneelista.
- Viimeiseksi Lehto ohjasi domain-nimen susannalehto.me osoittamaan DigitalOceanilta hankitulle virtuaalipalvelimelle. Tämä tapahtui hallintasivun Advanced DNS-välilehden kautta. Täällä Lehto poisti kaikki turhat host recordsit ja loi uudet. Näihin uusiin Host recordseihin Lehto asetti Digital Ocean-virtuaalipalvelimen IP-osoitteen ja TTL- sarakkeen arvoksi 5 minuuttia.
  
#### b) Palvelin suojaan palomuurilla
Tässä Lehto kertoo palomuurin käyttöönotosta.
  1. Yhteys Lehdon omalle virtuaalikoneelle `ssh root@188.166.4.6` 
  2. Päivitysten haku `sudo apt-get update` ja palomuurin asennus `sudo apt-get install ufw`
  3. Reikä palomuuriin `sudo ufw allow 22/tpc`
  4. ja palomuurin käynnistys `sudo ufw enable`
     
#### c) Kotisivut palvelimelle

Seuraavaksi Lehto asensi Digital Ocean virtuaalikoneelle Apache-webbipalvelimen ja teki käyttäjälle toimivat kotisivut.
  1. Käyttäjän luonti `sudo adduser suska` ja muutos pääkäyttäjäksi `sudo adduser suska sudo`
  2. Testi toisen koneen terminaalissa, toimiiko käyttäjän oikeudet. Ensin yhteys `ssh suska@188.166.4.6` ja sitten sudo testikomento `sudo apt-get update`
  3. Root käyttäjän lukinta `sudo usermod –lock root`
  4. Domain-nimen pingaus `ping susannalehto.me` joka piti päättymättömänä keskeyttää sulkemalla terminaali.
  5. Uudelleenkirjautuminen ssh kautta ja saatavilla olevien päivitysten ja tietoturvapäivitysten asennus `sudo apt-get update` `sudo apt-get upgrade` ja `sudo apt-get dist-upgrade`
  6. Apache-webbipalvelimen asennus `sudo apt-get install apache2` ja testaus `sudo systemctl status apache2`
  7. Palomuuriin toinen reikä portille 80 `sudo ufw allow 80/tcp`
  8. Apachen testisivun korvaaminen `echo Hello world! |sudo tee /var/www/html/index.html`
  9. Userdir-moduulin käyttöönotto `sudo a2enmod userdir` ja uudelleen käynnistys `sudo service apache2 restart`
  10. Julkisen public_html kansion luonti ja näkyvyyden tarkistus firefoxissa.
  11. Ssh-yhteyden avaus `sudo systemctl start ssh` ja micro editorin asennus `sudo apt-get install micro`
  12. Tekstitiedoston luonti public_html kansioon `cd public_html` ja `micro index.html` jonne Lehto loi lyhyen nettisivun rungon.
  13. Viimeiseksi varmistus kaiken toimivuudesta testaamalla toisen koneen selaimella.
      
#### d) Palvelimen ohjelmien päivitys

Päivitys tapahtui kirjautumalla virtuaalipalvelimelle ssh-yhteydellä, jonka jälkeen seuraavien päivitysten asennus komennoilla `sudo apt-get update`, `sudo apt-get upgrade` ja `sudo apt-get dist-upgrade`

(Lehto 2022)

  ### First Steps on a New Virtual Private Server
Muistiinpanoissa Karvinen listaa toimet, joilla manuaalisesti määritetään yksityinen serveri Digital Ocean palveluun ja määritetään DNS Namecheapin kautta. 
  - Luo uusi virtuaalipalvelin Digital Ocean
     - Luo palveluun tili, lisää maksutiedot ja luo Ubuntu 16.04 LTS virtuaalipalvelin.
  - Ensimmäisellä kerralla loggaudu luodulle palvelimelle roottina (tämä on myös ainut kerta)`ssh root@10.0.0.1`
  -  Tee reikä `sudo ufw allow 22/tcp` ja käynnistä palomuuri `sudo ufw enable`
  -  Luo Sudo user `sudo adduser tero` ja anna sille tarvittavat oikeuset `sudo`, `adm` tai `admin`
  -  Ennen sulkemista testaa `ssh tero@tero.example.com`
  -  Lukitse juuren salasanakirjautuminen `sudo usermod --lock root`
  -  Ja disable rootin SHH login.
  -  Päivitä ohjelmistot `sudo apt-get update`ja `sudo apt-get upgrade`
  -  Aloita käyttö, muista myös tehdä palomuuriin reikä 80-portille `sudo ufw allow 80/tcp`
  -  Käyttö on mukavampaa tero.karvinen.com nimellä, kuin ip-osoitteella, joten rekisteröi verkkotunnus esim Namecheapin kautta. Ohjeet nimipalvelimen osoittamiseen hostille löytyy linkistä [point NameCheap nameservers to your host](https://www.namecheap.com/support/knowledgebase/article.aspx/319/2237/how-can-i-set-up-an-a-address-record-for-my-domain).
  -  Lisää A-record ja testaa Firefoxilla, jottei vanha tai väärä nimi jää selaimen välimuistiin.

  (Karvinen 2012)

---

  ## y) Työskentely-ympäristö
  - Host OS on MacBook Retina 12-inch, jossa Ventura 13.6.1 käyttöjärjestelmä Suomen maa-asetuksilla ja suomen kielellä. Koneessa on 1,3GHz kaksiytiminen Intel Core i5 prosessori ja 8Gt 1867 MHz LPDDR3 muistia. Näytönohjain on Intel HD Graphics 615 jossa VRAM 1536 Mt.
  - Guest OS minulla on Debian GNU/Linux 12 (Bookworm), 64-bit
    
---

  ## z) alkutoimenpiteet
  1. Virtualboxin ja virtuaalikoneen käynnistäminen
  2. Terminaalin käynnistys `Applications` -> `Terminal Emulator`

---

## a) Oma virtuaalipalvelin

Kaikkia tästä seuraavia tehtäviä tehdessäni käytin tietolähteenäni omia luentomuistiinpanojani, sekä Karvisen artikkelia First Steps on a New Virtual Private Server – an Example on DigitalOcean and Ubuntu 16.04 LTS. Muut mahdolliset lähteet ovat merkitty tekstiviitteinä erikseen.

Tässä tehtävässä vuokrasin oman virtuaalipalvelimen.palveluntarjoajalta. Aloitan tehtävän 2024.02.06 klo 14.30 +3 UCT ja saan sen valmiiksi noin 15.05 UCT +3

Hyödynsin tehtävässä GitHub educationin etua Digital Ocean hostauspalvelun käyttöön, koulutuspaketti tarjoaa $200 arvosta credittiä palveluun ensimmäisen vuoden ajalle.

  ![4.1.1DigitOcean_GitHub](https://github.com/syjaka/Linux-Palvelimet-2024/blob/main/images/4.1.1DigitOcean_GitHub.png)

1.  Aloitin klikkaamalla kuvassa olevaa linkkiä "Get access...", joka avasi uuden välilehden Digital Oceanin sivulle. Täällä valitsen ![4.1.2_SignUp](https://github.com/syjaka/Linux-Palvelimet-2024/blob/main/images/4.1.2_SignUp.png), joka ohjasi minut kirjautumaan palveluun github-tunniksillani.
2.  Seuraavaksi etenin palvelun käyttöönottoon vastaamalla esitettyihin kyselyihin. Tämän jälkeen minulta pyydettiin luottokorttitiedot henkilöllisyyteni vahvistamiseksi. 
Digital Ocean teki $1 katevarauksen luottokortin oikeellisuuden tarkistamiseksi, mutta tämä häviää veloituksista hetken kuluttua.
3.  Luottokorttitietojen vahvistuksen jälkeen aukesi aloitussivu, josta haluttu palvelu tuli valita. Tässä tapauksessa valitsin `Deploy a virtual machine`

    ![4.1.3_DeployVM](https://github.com/syjaka/Linux-Palvelimet-2024/blob/main/images/4.1.3_Deploy_VM.png)
  
5. Seuraavalla sivulla tarkistelin oman tilini tilaa ja huomasin että yhteys GitHub Educationin ja Digital oceanin välillä ei ollut kirjautunut. Tutkin asiaa lisää ja klikkasin uudelleen GitHubin linkkiä (sama joka tämän tehtävän ensimmäisessä kuvassa yllä).
6. Linkki ohjasi minut uudelle autentikointisivulle, josta autorisoin Digital Oceanin. Tämän jälkeen aukesi kuittaus, jossa käyttäjätunnukselleni ilmoitettiin lisätyksi $200 credit.

    ![4.1.4_AuthorizeDO](https://github.com/syjaka/Linux-Palvelimet-2024/blob/main/images/4.1.4_AuthorizeDO.png) ![4.1.5_CreditOK](https://github.com/syjaka/Linux-Palvelimet-2024/blob/main/images/4.1.5_CreditOK.png)

7. Tämän autentikoinnin jälkeen avautuva ikkuna oli hieman erilainen kuin tunnilla, mutta yläreunan Create- valikon kautta löytyi tunnilta tuttu Droplets maininta, joten valitsin sen.

  ![4.1.6_Create_Droplet](https://github.com/syjaka/Linux-Palvelimet-2024/blob/main/images/4.1.6_Create_Droplet.png)

7. Seuraavaksi avautui jo tunnilta tuttu sivu, jossa valitaan luotavalle virtuaaliserverille määritykset:
    - Alue ja datacenterin sijainti 
       ![4.1.6_alue](https://github.com/syjaka/Linux-Palvelimet-2024/blob/main/images/4.1.6_Alue.png)
    - Haluttu OS ja versio (Valitsin uusimman saatavilla olevan Debianin: 12 on versio ja x64 kuvaa moniko bittinen prosessori).
        ![4.1.7_OS](https://github.com/syjaka/Linux-Palvelimet-2024/blob/main/images/4.1.7_OS.png)
    -  Seuraavassa kohdassa valitsin serverin ominaisuuksia. Tein valinnat opettajan antaman suosituksen mukaan.
         ![4.1.8_Server_type](https://github.com/syjaka/Linux-Palvelimet-2024/blob/main/images/4.1.8_Server_type.png)
    -  Seuraavissa kohdissa tarjottiin lisätallennustilaa ja automaattisia varmuuskopioita joita en valinnut koska en niitä tarvitse.
    -  Tämän jälkeen oli oli vuorossa autentikointimetodin valinta. Vaihtoehtoja olivat SSH-avain (joka olisi turvallisin) ja salasana, jonka valitsin koska tämä on tuttu. Salasana kannattaa valita huolellisesti turvalliseksi, sillä on hyvin todennäköistä, että vuokrattuja pilviservereitä yritetään kaapata.
        ![4.1.9_salasana](https://github.com/syjaka/Linux-Palvelimet-2024/blob/main/images/4.1.9_salasana.png)
    -  Seuraavassa kohdassa valitsin kulutuksen seurannan ja mahdolliset hälytykset. Tämä oli veloitukseton ominaisuus joten otin sen mukaan.
    -  Viimeisessä kohdassa valitaan montako kappaletta määritelytjä servereitä haluan ja määritin tälle serverille jonkin neutraalin ja mahdollisimman persoonattoman nimen.
       ![4.1.10_Hostname](https://github.com/syjaka/Linux-Palvelimet-2024/blob/main/images/4.1.10_Hostname.png)
    -  Viimeiseksi valitsen create Droplet  jonka jälkeen sivu rullasi alle minuutin. Lopputuloksena minulla on vuokrattuna tammari-niminen virtuaalipalvelin.
       ![4.1.11_tammari_done](https://github.com/syjaka/Linux-Palvelimet-2024/blob/main/images/4.1.11_tammari_done.png)


---

  ## b) Virtuaalipalvelin käyttökuntoon

  Seuraavia tehtäviä olen tehnyt pätkissä, arvioim kokonaisuudessaan käytetyksi ajaksi noin 10 tuntia. Josta varsinaista aktiivista työaikaa serverin kanssa noin puolet ja loput erilaista selvitystyötä asian ympäriltä.

 Tässä osiossa tein alkutoimet omalle virtuaalipalvelimelleni. 

 ### Palomuuri käyttöön
  1. Aloitan tehtävän ottamalla SHH-yhteyden luotuun tammari-virtuaalipalvelimeen
     - Annan terminaalissa komennon `ssh root@104.248.205.0`. Ensin minulta tarkistettiin haluanhan varmasti ottaa yhteyden kyseiseen IP-osoitteeseen, jonka jälkeen minulta kysyttiin virtuaalipalvelimelleni annettua salasanaa. Salasanan antamisen jälkeen pääsin sisälle:
       ![4.2.1_sisään](https://github.com/syjaka/Linux-Palvelimet-2024/blob/main/images/4.2.1_sisa%CC%88a%CC%88n.png)
  2. Seuraavaksi asensin palomuurin, `sudo apt-get update` & `sudo apt-get install ufw`
  3. Tämän jälkeen tein aukot palomuuriin komennoilla `sudo ufw allow 22/tcp` ja `sudo ufw allow 80/tcp` jossa allow sallii, 22 & 80 on portti ja tcp käytettävä on protokolla. 
  4. `sudo ufw enable` käynnistää palomuurin. Lopputuloksena kuvan mukainen palaute
    ![4.2.2_palomuuri_Up](https://github.com/syjaka/Linux-Palvelimet-2024/blob/main/images/4.2.2_palomuuri_Up.png)

### Root-tunnuksen lukitseminen sekä oman käyttäjän lisäys
Tavallisesti virtuaalipalvelimelle kirjaudutaan käyttäjänä, eikä roottina. Tärkeimipiä syitä tähän on se, että root käyttäjänä on koko ajan sudo-oikeudet, jolloin voi huomaamattaan tehdä jotain perustavanlaatuisia muutoksia/vahingoittaa järjestelmää pysyvästi (Cyber Duck 2022).  Lisäksi käyttäjä on tärkeä pystyä identifioimaan, jotta mahdolliuset muutokset voidaan kohdentaa käyttäjään (Karvinen 2024).

  1. Loin käyttäjän komennolla ` $ sudo adduser syrja` ja keksin hyvän salasanan.
  2. Käyttäjätietoihin annoin nimeni, mutta muut kohdat ohitin `return`
  3. `sudo adduser syrja sudo` lisää luodun käyttäjän sudo-ryhmään eli tekee käyttäjästä sudo-userin.
  4. Testaan että pääsen kirjautumaan palvelimelle luotuna käyttäjänä ja että salasana toimii.
    ![4.3.1_syrjaToimii](https://github.com/syjaka/Linux-Palvelimet-2024/blob/main/images/4.3.1_syrjaToimii.png)
  5. Seuraavaksi lukitsen root-käyttäjän, estääkseni salasanakirjautumisen, muut tavat ovat yhä mahdollisia. Lukitsemiseen käytän komentoa `sudo usermod -- lock root. Testaan lukitusta yrittämällä kirjautua uudelleen root-käyttäjänä(kuten yllä kohdassa b) 1.), mutta Järjestelmä ei päästä sisään
  6. Viimeisessä vaiheessa poistin SSH root loginin käytöstä komennolla`sudoedit /etc/ssh/sshd_config`jolla avautui config-tiedosto. Muutin tiedostossa kohda `permitRootLogin`tilaan `no`, tallensin muutoksen ja uudelleenkäynnistin SSH-servicen.

### Ohjelmien päivitys
Seuraavaksi ryhdyin päivittämään paketteja komennoilla `sudo apt-get update` ja `sudo apt-get upgrade`. Lopputuloksena sain ao viestin:

![4.3.2HerjaVersiosta](https://github.com/syjaka/Linux-Palvelimet-2024/blob/main/images/4.3.2HerjaVersiosta.png)
Valitsin tarkistaa erot tiedostojen välillä:

![4.3.3Erot](https://github.com/syjaka/Linux-Palvelimet-2024/blob/main/images/4.3.3Erot.png)

Kuvassa reunustetut kohdat kertoivat että uudessa versiossa salasanakirjautuminen on estetty root-tunnuksella sekä ClientAliveInterval 120 rivi on poistettu. Root-kirjautumisen itse muutin, mutta en keksi syytä miksi ClientAliveInterval on poistettu. Koska muita muutoksia ei näy päätän pitää nykyisen (uuden) version, jossa root on lukittu.

---

## c) Asenna oma webbipalvelin

Aloitan asentamalla vuokratulle virtuaalikoneelle apache-web palvelimen mukaillen tehtävässä [h3_HelloWebServer](https://github.com/syjaka/Linux-Palvelimet-2024/blob/main/h3_HelloWebServer.md) toimia.

1. Apachen asennus seuraavin komennoin `sudo apt-get update`  ja `sudo apt-get -y install apache2`
2. Default sivun korvaaminen index.html tiedostolla `echo "Default"|sudo tee /var/www/html/index.html`
3. Tämän jälkeen testasin sivun julkisuuden/näkyvyyden selaimilla. Testi osoitti että sivu toimii.
  ![4.5.10_tammari_iphone.jpeg](https://github.com/syjaka/Linux-Palvelimet-2024/blob/main/images/4.5.10_tammari_iphone.jpeg)

 ---
 ## d) Oma domain käyttöön

Tässä tehtävässä tuli vuokrata oma domain-nimi ja asettaa se osoittamaan yllä luotuun virtuaalipalvelimeen.

### Ensimmäiseksi domain-nimen vuokraus:

1. Valitsin [Namecheap](https://www.namecheap.com/) palvelun verkkotunnukseni rekisteröintiin. Ensin oli valittava sopiva verkkotunnus. Tunnilla tuli puheeksi mahdollinen ääkkösten käyttö joten kokeilin ensin omaa sukunimeäni:![4.4.1_DomainSyrja](https://github.com/syjaka/Linux-Palvelimet-2024/blob/main/images/4.4.1_DomainSyrja.png)
Koska syrjä.com oli käytettävissä valitsin sen. Vaikka tunnus oli maksullinen ajattelen että tämä saattaa olla hyödyllinen tulevaisuudessa.
2. Verkkotunnuksen rekisteröinti namecheap palvelun kautta tapahtui lisäämällä haluttu domain-nimi ostoskoriin. Checkoutin yhteydessä tarjottiin erilaisia lisäpalveluita joista valitsin Domain privacyn.

[4.4.2 lisapalvelut](https://github.com/syjaka/Linux-Palvelimet-2024/blob/main/images/4.4.2_lisapalvelut.png)
3. Tilauksen vahvistamisen yhteydessä piti rekisteröityä palvelun käyttäjäksi.
4. Rekisteröitymisen jälkeen tuli vielä valita verkkotunnuksen IDN-kieli, tässä tapauksessa suomi. Englanti ei olisi edes vaihtoehto ä-kirjaimen sisältävässä domain-nimessä.
![4.4.3_IDN](https://github.com/syjaka/Linux-Palvelimet-2024/blob/main/images/4.4.3_IDN.png)
5. Rekisteröitymisen jälkeen lisäsin maksutiedot, ja suoritin tilauksen josta, hetken kuluttua sain vahvistuksen sähköpostiini. Sähköpostissa oli myös mandaatti, että WHOIS tiedot tulee vahvistaa 14 vrk kuluessa tai rekisteröinti raukeaa. Lopputuloksena sain vahvistuksen, että syrjä.com on nyt rekisteröity nimiini.
![4.4.4_Verify](https://github.com/syjaka/Linux-Palvelimet-2024/blob/main/images/4.4.4_Verify.png)

### Seuraavaksi määritykset, jotta domain-nimi osoittaa virtuaalipalvelimelleni:

1. Avaan Namecheap-palvelusta oman dashboardini jossa rekisteröity domain-nimi näkyy. Manage -napista siirryn nimen hallintasivulle.
![4.6.1_namecheap_Manage](https://github.com/syjaka/Linux-Palvelimet-2024/blob/main/images/4.6.1_namecheap_Manage.png)
2. Hallintasivulla siirryn advanced DNS-välilehdelle.
3. Host Records kohdassa luon kaksi uutta "osoitusta" `add new record`. @(joka ohjaa syrja.com ja www joka ohjaa www.syrja.com  TTL kohtaan löysin vinkin Lehdon blogitekstistä (Lehto 2022)
![4.6.2_DNS_advanced](https://github.com/syjaka/Linux-Palvelimet-2024/blob/main/images/4.6.2_DNS_advanced.png)
4. Tässä vaiheessa testaan, ja kaikki näyttää toimivan hyvin
![4.6.3_syrja.com_testisivu](https://github.com/syjaka/Linux-Palvelimet-2024/blob/main/images/4.6.3_syrja.com_testisivu.png)
   (namecheap.com 2021)

## Bonus

Lopuksi halusin ohjata syrjä.com'in osoittamaan omalle html5 sivulle apachen default-sivun sijaan.

1. Luon aluksi conf-tiedoston, joka ohjaa syrjä.com sivun kotihakemistooni luodulle public_html kansioon `sudoedit sivusyrja.com.conf`
2. Muokkaan syrjä.com sisältöä seuraavanlaiseksi:

![4.7.1_Syrja.conf](https://github.com/syjaka/Linux-Palvelimet-2024/blob/main/images/4.7.1_Syrja.conf.png)
3. Komennolla `sudo a2ensite syrjä.com`aktivoin conf tiedoston vastaamaan syrjä.com hakuun
4. komennolla `sudo a2dissite 000-default.conf`poistan defaultsivun aktivoinnin eli tämän jälkeen ainut aktivoitu sivu "syrjä.com" vastaa

![4.7.2_sites_enabled](https://github.com/syjaka/Linux-Palvelimet-2024/blob/main/images/4.7.2_sites_enabled.png)
5. Uudelleenkäynnistä apachen komennolla `sudo systemctl restart apache2`
6. Luon kotihakemistooni public_html kansion `mkdir /home/syrja/public_html`
7. luon kyseiseen kansioon tiedoston index.html komennolla `micro /home/syrja/public/index.html`
8. Tallennan index.html-tiedostoon yksinkertaisen html5-pätkän
9. Testaan selaimella syrjä.com ja saan onnistuneen lopputuloksen

![4.7.3_syrjä.com_vastaa](https://github.com/syjaka/Linux-Palvelimet-2024/blob/main/images/4.7.3_syrja%CC%88.com_vastaa.png)


---

### Lähteet:

Cyber Duck 2022. Understanding the difference between Sudo and Root in Linux. Luettavissa: https://medium.com/@cyberduck1/understanding-the-difference-between-sudo-and-root-in-linux-528c84e9b43d. Luettu 2024.02.06.

Karvinen T. 2017. First Steps on a New Virtual Private Server – an Example on DigitalOcean and Ubuntu 16.04 LTS. Luettavissa: https://terokarvinen.com/2017/first-steps-on-a-new-virtual-private-server-an-example-on-digitalocean/. Luettu 2024.02.06

Karvinen, T. 2024. Linux Palvelimet 2024 alkukevät. Luettavissa: https://terokarvinen.com/2024/linux-palvelimet-2024-alkukevat/. Luettu: 2024.02.06
  
Lehto S. 2022 Teoriasta käytäntöön pilvipalvelimen avulla (h4). Luettavissa: https://susannalehto.fi/2022/teoriasta-kaytantoon-pilvipalvelimen-avulla-h4/. Luettu 2024.02.07

Namecheap.com 2021. How can I set up an A (address) record for my domain? Luettavissa https://www.namecheap.com/support/knowledgebase/article.aspx/319/2237/how-can-i-set-up-an-a-address-record-for-my-domain/. Luettu 2024.02.07
