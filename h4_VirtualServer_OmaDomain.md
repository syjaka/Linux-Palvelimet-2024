# h4_Virtual Server & Oma nimipalvelin

# Keskeneräinen

- x)[ tiivistelmä](https://github.com/syjaka/Linux-Palvelimet-2024/blob/main/h4_VirtualServer_OmaDomain.md#x-tiivistelmä)
- a)[Oma virtuaalipalvelin](https://github.com/syjaka/Linux-Palvelimet-2024/blob/main/h4_VirtualServer_OmaDomain.md#a-Oma-virtuaalipalvelin)
- b)[Virtuaalipalvelin käyttökuntoon](https://github.com/syjaka/Linux-Palvelimet-2024/blob/main/h4_VirtualServer_OmaDomain.md#b-Virtuaalipalvelin-käyttökuntoon)
- c)[Asenna oma webbipalvelin](https://github.com/syjaka/Linux-Palvelimet-2024/blob/main/h4_VirtualServer_OmaDomain.md#c-Asenna-oma-webbipalvelin)
- d)[Oma domain käyttöön](https://github.com/syjaka/Linux-Palvelimet-2024/blob/main/h4_VirtualServer_OmaDomain.md#d-Oma-domain-käyttöön)
- y)[ Työskentely-ympäristö](https://github.com/syjaka/Linux-Palvelimet-2024/blob/main/h4_VirtualServer_OmaDomain.md#y-työskentely-ympäristö)
- z)[ Alkutoimenpiteet](https://github.com/syjaka/Linux-Palvelimet-2024/blob/main/h4_VirtualServer_OmaDomain.md#z-alkutoimenpiteet)
- 

---
  ## x) tiivistelmä
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

  ![4.1.1DigitOcean_GitHub]()

1.  Aloitin klikkaamalla kuvassa olevaa linkkiä "Get access...", joka avasi uuden välilehden Digital Oceanin sivulle. Täällä valitsen ![4.1.2_SignUp]() joka ohjasi minut kirjautumaan palveluun github-tunniksillani
2.  Seuraavaksi etenin palvelun käyttöönottoon vastaamalla esitettyihin kyselyihin. Tämän jälkeen minulta pyydettiin luottokorttitiedot henkilöllisyyteni vahvistamiseen. 
Digital Ocean teki $1 katevarauksen luottokortin oikeellisuuden tarkistamiseksi, mutta tämä häviää veloituksista hetken kuluttua.
3.  Luottokorttitietojen vahvistuksen jälkeen aukesi aloitussivu, josta haluttu palvelu tuli valita. Tässä tapauksessa valitsin 'Deploy a virtual machine'

    ![4.1.3_DeployVM]()
  
4. Tässä vaiheessa tarkistelin oman tilini tilaa ja huomasin että yhteys GitHub Educationin ja Digital oceanin välillä ei ollut kirjautunut. Tutkin asiaa lisää ja klikkasin uudelleen GitHubin linkkiä (sama joka ensimmäisessä kuvassa yllä).
5. Tämä ohjasi minut uudelle autentikointisivulle, josta autorisoin Digital Oceanin. Tämän jälkeen aukesi kuittaus jossa käyttäjätunnukselleni ilmoitettiin lisätyksi $200 credit.

    ![4.1.4_AuthorizeDO]() ![4.1.5_CreditOK]()

6. Tämän autentikoinnin jälkeen avautuva ikkuna oli hieman erilainen kuin tunnilla, mutta yläreunan Create- valikon kautta löytyi tunnilta tuttu Droplets maininta, joten valitsin sen.

  ![4.1.6_Create_Droplet]()

7. Seuraavaksi avautui tunnilta tuttu sivu jossa valitaan luotavalle virtuaaliserverille määritykset:
    - Alue ja datacenterin sijainti 
       ![4.1.6_alue]()
    - Haluttu OS ja versio (Valitsin uusimman saatavilla olevan Debianin: 12 on versio ja x64 kuvaa moniko bittinen prosessori)
        ![4.1.7_OS]()
    -  Seuraavassa kohdassa valitsin serverin ominaisuuksia. Tein valinnat opettajan antaman suosituksen mukaan.
         ![4.1.8_Server_type]()
    -  Seuraavissa kohdissa tarjottiin lisätallennustilaa ja automaattisia varmuuskopioita joita en valinnut koska en niitä tarvitse
    -  Seuraavassa kohdassa oli autentikointimetodin valinta. Vaihtoehtoja olivat SSH-avain (joka olisi turvallisin) ja salasana, jonka valitsin koska tämä on tuttu. Salasana kannattaa valita huolellisesti turvalliseksi, sillä on hyvin todennäköistä, että vuokrattuja pilviservereitä yritetään kaapata.
        ![4.1.9_salasana]()
    -  Seuraavassa kohdassa valitsin kulutuksen seurannan ja mahdolliset hälytykset. Tämä oli veloitukseton ominaisuus joten otin sen mukaan.
    -  Viimeisessä kohdassa valitaan montako kappaletta määritelytjä servereitä haluan ja määritin tälle serverille jonkin neutraalin ja mahdollisimman persoonattoman nimen.
       ![4.1.10_Hostname]()
    -  Viimeiseksi valitsen create Droplet  jonka jälkeen sivu rullasi noin minuutin. Lopputuloksena minulla on vuokrattuna tammari-niminen virtuaalipalvelin
       ![4.1.11_tammari_done]()
 
---
  ## c) SSH-yhteys virtuaalipalvelimeen ja palomuurin asennus

  Tee alkutoimet omalla virtuaalipalvelimellasi: tulimuuri päälle, root-tunnus kiinni, ohjelmien päivitys. (Karvinen 2024)

  1. Aloitan tehtävän ottamalla SHH-yhteyden luotuun tammari-virtuaalipalvelimeen
     - Annan terminaalissa komennon 'ssh root@104.248.205.0' ensin minulta tarkistettiin haluanhan varmasti ottaa yhteyden kyseiseen IP-osoitteeseen, jonka jälkeen minulta kysyttiin virtuaalipalvelimelleni annettua salasanaa. Salasanan antamisen jälkeen pääsin sisälle:
       ![4.2.1_sisään]()
  2. Seuraavaksi asensin palomuurin, 'sudo apt-get update' & 'sudo apt-get install ufw'
  3. Seuraavaksi tein aukon palomuuriin komennolla 'sudo ufw allow 22/tcp' jossa allow sallii, 22 on portti ja tcp käytettävä on protokolla. 
  4. 'sudo ufw enable' käynnistää palomuurin. Lopputuloksena kuvan mukainen palaute
    ![4.2.2_palomuuriUp]()

## c) Käyttäjä virtuaalipalvelimelle

Tavallisesti virtuaalipalvelimelle kiorjaudutaan käyttäjänä, eikä roottina. Tärkeimipiä syitä tähän on se, että root käyttäjänä on kokoajan sudo-oikeudet, jolloin voi huomaamattaan tehdä jotain perustavanlaatuisia muutoksia/vahingoittaa järjestelmää pysyvästi (Cyber Duck 2022).  Lisäksi käyttäjä on tärkeä pystyä identifioimaan jotta mahdolliuset muutokset voidaan kohdentaa käyttäjään (Karvinen 2024).

  1. Loin käyttäjän komennolla ' $ sudo adduser syrja` ja keksin hyvän salasanan
  2. Käyttäjätietoihin annoin nimeni, mutta muut kohdat ohitin 'return'
  3. 'sudo adduser syrja sudo' lisää luodun käyttäjän sudo-ryhmään eli tekee käyttäjästä sudo-userin
  4. Testaan että pääsen kirjautumaan palvelimelle luotuna käyttäjänä ja että salasana toimii.
    ![4.3.1_syrjaToimii]()
  5. Seuraavaksi lukitsen root-käyttäjän, estääkseni salasanakirjautumisen, muut tavat ovat yhä mahdollisia. Lukitsemiseen käytän komentoa 'sudo usermod -- lock root. Testaan lukitusta yrittämällä kirjautua uudelleen root-käyttäjänä(kuten yllä kohdassa b) 1.), mutta Järjestelmä ei päästä sisään

Seuraavaksi ryhdyin päivittämään paketteja komennoilla 'sudo apt-get update' ja 'sudo apt-get upgrade'. Lopputuloksena sain ao viestin:

![4.3.2HerjaVersiosta]
Valitsin tarkistaa erot tiedostojen välillä:

![4.3.3Erot]()
Kuvassa reunustetut kohdat kertoivat että uudessa versiossa salasanakirjautuminen on estetty root-tunnuksella sekä ClientAliveInterval 120 rivi on poistettu. Root-kirjautumisen itse muutin, mutta en keksi syytä miksi ClientAliveInterval on poistettu. Koska muita muutoksia ei näy päätän pitää nykyisen (uuden) version, jossa root on lukittu.

## d) Apachen asennus ja nimipohjaisen virtuaalipalvelimen käyttöönotto

Aloitan asentamalla vuokratulle virtuaalikoneelle apache-web palvelimen seuraten tehtävässä [h3_HelloWebServer](https://github.com/syjaka/Linux-Palvelimet-2024/blob/main/h3_HelloWebServer.md) toimia.

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

 - [ takaisin ylös](https://github.com/syjaka/Linux-Palvelimet-2024/blob/main/h4_VirtualServer_OmaDomain.md#h4)


---

### Lähteet:

Cyber Duck 2022. Understanding the difference between Sudo and Root in Linux. Luettavissa: https://medium.com/@cyberduck1/understanding-the-difference-between-sudo-and-root-in-linux-528c84e9b43d. Luettu 2024.02.06.

Karvinen T. 2017. First Steps on a New Virtual Private Server – an Example on DigitalOcean and Ubuntu 16.04 LTS. Luettavissa: https://terokarvinen.com/2017/first-steps-on-a-new-virtual-private-server-an-example-on-digitalocean/. Luettu 2024.02.06

Karvinen, T. 2024. Linux Palvelimet 2024 alkukevät. Luettavissa: https://terokarvinen.com/2024/linux-palvelimet-2024-alkukevat/. Luettu: 2024.062.06
  



