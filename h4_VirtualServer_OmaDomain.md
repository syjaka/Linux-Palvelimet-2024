# h4_Virtual Server & Oma nimipalvelin

# Keskeneräinen

Aloitin tämän tehtävän jo ennen varsinaista tehtävänantoa, sillä oma aikatauluni sallii parhaiten tämän tiistai-illan työskentelyn. Tehtävänanto tulee näkyville vasta huomenna, joten on hyvin mahdollista että tehtävänkulkn/tekemisjärjestyksessä on poikkeuksia suhteesa tehtävänantoon. Merkkaan nämä

- x)[ tiivistelmä](https://github.com/syjaka/Linux-Palvelimet-2024/blob/main/h4_VirtualServer_OmaDomain.md#x-tiivistelmä)
- a)[ Ensimmäinen teht](https://github.com/syjaka/Linux-Palvelimet-2024/blob/main/h4_VirtualServer_OmaDomain.md#a-)
- y)[ Työskentely-ympäristö](https://github.com/syjaka/Linux-Palvelimet-2024/blob/main/h4_VirtualServer_OmaDomain.md#y-työskentely-ympäristö)
- z)[ Alkutoimenpiteet](https://github.com/syjaka/Linux-Palvelimet-2024/blob/main/h4_VirtualServer_OmaDomain.md#z-alkutoimenpiteet)

---
  ## x) tiivistelmä

---
  ## a) 

 - [ takaisin ylös](https://github.com/syjaka/Linux-Palvelimet-2024/blob/main/h4_VirtualServer_OmaDomain.md#h4)
---

---

  ## y) Työskentely-ympäristö
  - Tehtävä toteutettiin MacBook Retina 12-inch, koneella jossa Ventura 13.6.1 käyttöjärjestelmä Suomen maa-asetuksilla ja suomen kielellä. Koneessa on 1,3GHz kaksiytiminen Intel Core i5 prosessori ja 8Gt 1867 MHz LPDDR3 muistia. Näytönohjain on Intel HD Graphics 615 jossa VRAM 1536 Mt.
---

  ## z) alkutoimenpiteet
  1. Virtualboxin ja virtuaalikoneen käynnistäminen
  2. Terminaalin käynnistys `Applications` -> `Terminal Emulator`

##) Tehtävä Aloitus - 2024.02.06 klo 14.30 UCT +3

Tämän tehtävän tarkoituksena on vuokrata ja konfiguroida oma palvelin pilveen ja hankkia oma domainnimi. Tämä domainnimi tulee osattaa ohjaamaan tehtävässä luotuun virtuaaliserveriin.

### Oman pilvipalvelimen vuoraus ja asennus

Tähän tehtävään hyödynnän GitHub educationin etua DigitalOcean hostauspalvelun käyttöön, sillä koulutuspaketti tarjoaa $200 arvosta credittiä palveluun ensimmäiseksi vuodeksi

  ![4.1.1DigitOcean_GitHub]()

- Aloitin klikkaamalla kuvassa olevaa linkkiä "Get access...", joka avasi uuden välilehden Digital Oceanin sivulle. Täällä valitsen ![4.1.2_SignUp]() joka ohjasi minut kirjautumaan palveluun github-tunniksillani.
- Seuraavaksi etenin palvelun käyttöönottoon vastaamalla esitettyihin kyselyihin. Tämän jälkeen minulta pyydettiin luottokorttitiedot henkilöllisyyteni vahvistamiseen. 
Digital Ocean teki $1 katevarauksen luottokortin oikeellisuuden tarkistamiseksi, mutta tämä häviää veloituksista hetken kuluttua.
- Luottokorttitietojen vahvistuksen jälkeen aukesi aloitussivu, josta haluttu palvelu tuli valita. Tässä tapauksessa valitsin 'Deploy a virtual machine'
- 
  ![4.1.3_DeployVM]()
  
- Tässä vaiheessa tarkistelin oman tilini tilaa ja huomasin että yhteys GitHub Educationin ja Digital oceanin välillä ei ollut kirjautunut. Tutkin asiaa lisää ja klikkasin uudelleen GitHubin linkkiä (sama joka ensimmäisessä kuvassa yllä).
- Tämä ohjasi minut uudelle autentikointisivulle, josta autorisoin Digital Oceanin. Tämän jälkeen aukesi kuittaus jossa käyttäjätunnukselleni ilmoitettiin lisätyksi $200 credit.

    ![4.1.4_AuthorizeDO]() ![4.1.5_CreditOK]()

- Tämän autentikoinnin jälkeen avautuva ikkuna oli hieman erilainen kuin tunnilla, mutta yläreunan Create- valikon kautta löytyi tunnilta tuttu Droplets maininta, joten valitsin sen.

  ![4.1.6_Create_Droplet]()

- Seuraavaksi avautui tunnilta tuttu sivu jossa valitaan luotavalle virtuaaliserverille määritykset:
    1. Alue ja datacenterin sijainti 
       ![4.1.6_alue]()
    2. Haluttu OS ja versio (Valitsin uusimman saatavilla olevan Debianin: 12 on versio ja x64 kuvaa moniko bittinen prosessori)
        ![4.1.7_OS]()
    3.  Seuraavassa kohdassa valitsin serverin ominaisuuksia. Tein valinnat opettajan antaman suosituksen mukaan.
         ![4.1.8_Server_type]()
    4.  Seuraavissa kohdissa tarjottiin lisätallennustilaa ja automaattisia varmuuskopioita joita en valinnut koska en niitä tarvitse
    5.  Seuraavassa kohdassa oli autentikointimetodin valinta. Vaihtoehtoja olivat SSH-avain (joka olisi turvallisin) ja salasana, jonka valitsin koska tämä on tuttu. Salasana kannattaa valita huolellisesti turvalliseksi, sillä on hyvin todennäköistä, että vuokrattuja pilviservereitä yritetään kaapata.
        ![4.1.9_salasana]()
    6.  Seuraavassa kohdassa valitsin kulutuksen seurannan ja mahdolliset hälytykset. Tämä oli veloitukseton ominaisuus joten otin sen mukaan.
    7.  Viimeisessä kohdassa valitaan montako kappaletta määritelytjä servereitä haluan ja määritin tälle serverille jonkin neutraalin ja mahdollisimman persoonattoman nimen.
       ![4.1.10_Hostname]()
    9.  Viimeiseksi valitsen create Droplet  jonka jälkeen sivu rullasi noin minuutin. Lopputuloksena minulla on vuokrattuna tammari-niminen virtuaalipalvelin
       ![4.1.11_tammari_done]()



  



