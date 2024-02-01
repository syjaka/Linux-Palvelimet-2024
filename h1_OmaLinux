# Linux Palvelimet

Ensimmäisen viikon aiheet olivat kurssin koko sisällön esittely, Gitiin tutustuminen pintapuolisesti sekä oman sivun julkaiseminen GitHubissa sekä Linuxin asentaminen.

## Tehtävä h1:

1. Tiivistelmä Tero Karvisen [raportinkirjoitusohjeista](https://terokarvinen.com/2006/raportin-kirjoittaminen-4/)

2. Tiivistelmä artikkelista [FSF Free Software definition]( https://www.gnu.org/philosophy/free-sw.html)

3. Linuxin asennus omalle koneelle. Tehtävän suorittamista tukee päivän luento, jossa tämä esimerkkinä tehtiin sekä opettajan nettisivujen [ohjeistus] (https://terokarvinen.com/2021/install-debian-on-virtualbox/) 

## 1. Raportointiohjeen tiivistelmä

Raportin kirjoittaminen

Hyvä raportointitapa tehostaa työskentelyä ja oppimista jäsentämällä ja selkeyttämällä koko työskentelyprosessia. Hyvään raportointiin kuuluu muutamia peruselementtejä:

1. Toistettavuus, Hyvän raportin perusteella koko työnkulku pitäisi olla toistettavissa samassa ympäristössä.
2. Täsmällisyys, Hyvässä raportissa on selkeästi kirjattu kaikki annetut komennot ja niiden seuraukset. 
3. Helppolukuisuus, Hyvää raporttia on helppo lukea sen järjestelmällisen rakenteen ja hyvän kielen ansiosta.
4. Hyvässä raportissa on lähteet listattu perusteellisesti.

Pahimpia mokia raporttia kirjoittaessa ovat asioiden keksiminen sekä plagiointi. Tärkeää on tehdä annetut tehtävät ja dokumentoida tämä helppolukuisesti ja selkeästi.


## 2. Tiivistelmä artikkelista Free software definition eli Vapaan Ohjelmiston määritelmä

Artikkelissa puhutaan Kaikkien vapaasti hyödynnettävissä olevasta ”Free Softwaresta” suom. ”Vapaa Ohjelmisto”. Artikkelin luoja haluaa erottaa ”Vapaa Ohjelmisto”-käsitteen avoimen lähdekoodin käsitteestä, sillä näillä kahdella on hyvin erilainen filosofia taustalla.

1.	”Vapaa Ohjelmisto”-käsitteen mukaiset ohjelmistot ovat kaikkien vapaasti ajettavissa, parhaaksi katsomallaan tavalla.
2.	Kaikilla on vapaus tutkia, miten ohjelmisto toimii, ja muokata sen toimintaa haluamallansa tavalla.
3.	Kaikilla sen käyttäjillä on myös vapaus jaella ohjelmistoa muille, heitä auttaakseen.
4.	Viimeisenä kaikilla on vapaus jaella muokkaamiaan versioita ohjelmistosta. Kaikissa muodoissaan ja versioissaan ” Vapaa Ohjelmisto” tulee olla aina jaettavissa ja hyödynnettävissä kokonaisuudessaan vastikkeetta.
Mikäli nämä edellä mainitut ominaisuudet täyttyvät, voidaan puhua ” Vapaasta Ohjelmistosta”.

Jotta ” Vapaa Ohjelmisto” olisi hyödynnettävissä määritelmänsä mukaan, ohjelmiston jakelijat, eivät saa rajoittaa millään toimenpiteillä käyttäjän vapautta käyttää ohjelmaa. Jotta ohjelmisto olisi edelleen kehitettävissä tulee myös sen lähdekoodin olla täysin avoin, ilman rajoitteita. Tämä koskee, niin alkuperäistä kuin käyttäjän muokkaamiakin julkaistuja versioita.

Toisinaan valtioiden vientirajoitukset saattavat rajoittaa ohjelmistokopioiden kansainvälistä jakoa. Tälle ohjelmoijat eivät voi mitään, mutta itse ohjelmistoihin tällaisten rajoitusten sisällyttäminen ei tue Vapaan Ohjelmiston periaatteita.

## 3. Linuxin asennus

### Virtual Box

Tehtävänannossa Linuxin asennuksen voisi tehdä joko raudalle, live tikulta tai kuten opettaja tunnilla esitti, VirtualBox-alustalle. 

(edit 23.01.2024) Tehtävä toteutettiin MacBook Retina 12-inch, koneella jossa Ventura 13.6.1 käyttöjärjestelmä Suomen maa-asetuksilla ja suomen kielellä. 
Koneessa on 1,3GHz kaksiytiminen Intel Core i5 prosessori ja 8Gt 1867 MHz LPDDR3 muistia. 
Näytönohjain on Intel HD Graphics 615 jossa VRAM 1536 Mt.


Valitsin Virtual Boxin joten aloitetin lataamalla [virtualboxin sivuilta]( https://www.virtualbox.org/wiki/Downloads) oikean version Virtualboxista joka minun tapauksessa on macOS / Intel hosts:

<img width="315" alt="image" src="https://github.com/syjaka/linux-perus-h1/assets/123550796/50642a04-0157-40b9-b047-b7167235501a">

Asennuksen valmistuttua, klikkasin VirtualBox levytiedostoa ja seurasin asennuksen ohjeita ohjelman asennukseen.

### Loin uuden virtuaalikoneen Linuxin Debian käyttöjärjestelmällä.

Virtualboxin asennuksen jälkeen Debianin lataus tehtiin tehtävänannon linkistä (alla korostettuna). 

![image](https://github.com/syjaka/linux-perus-h1/assets/123550796/a4de6a6f-4a97-49b5-9a4f-1a1ac15a2af1)

Käynnistin Virtualboxin ja lisäsin sinne Linux virtuaalikoneen new painikkeesta:

![image](https://github.com/syjaka/linux-perus-h1/assets/123550796/797ee343-808c-49df-8f46-8821c813600f)

1.	Nimeämisvälilehdellä valitsin luotavan koneen nimen, kohdekansion, ladattu Debian-isotiedoston, sekä 64-bittisen version. Jotta versiota pääsi muokkaamaan 32-bittisestä 64-bittiseen, tuli täppä valita kohtaan ”Skip Unattended Installation”
2.	Muistia määritin seuraavanlaisesti: '

![image](https://github.com/syjaka/linux-perus-h1/assets/123550796/be8a56b4-7f4f-4e08-a7bd-c967028daf52)

4.	Tallenustilaa määritellessä valitsin kuten alla:
   
![image](https://github.com/syjaka/linux-perus-h1/assets/123550796/bdfc09ea-7e73-41d5-be7d-d802a332af23)

4.	Tämän jälkeen valitsin Finish, jolloin luotu virtuaalikone on näkyvissä VirtualBoxin vasemmassa laidassa.
	
![image](https://github.com/syjaka/linux-perus-h1/assets/123550796/f45ee92e-5f06-49ec-88ab-ffcaa9055838)

5. Koska Debian Iso-tiedosto oli jo valittu VM-storageosioon, en lisännyt sitä kuten ohjeessa neuvotaan.
6. Seuraavaksi Boottasin koneen käyntiin VirtualBoxin Start-napista, lopputuloksena hyvin erilainen näkymä kuin ohjeessa (tunnilla näytti onneksi hyvin samalta), valitsin neuvotun Live system (amd64).

![image](https://github.com/syjaka/linux-perus-h1/assets/123550796/8343d717-348e-48c1-9f72-c63c9d6740f1)

7.	Käynnistuksen jälkeen avautui Linuxin työpöytä. Ennen Debianin asennusta testasin, että homma toimii. Avasin Applications menusta nettiselaimen ja navigoin opettajan sivulle. Onnistunut tulos varmisti että näyttö, netti näppis ja hiiri toimivat.
   
![image](https://github.com/syjaka/linux-perus-h1/assets/123550796/d8e2d7f6-8c9d-4eed-a479-34fe909b4983)

8.	Seuraavaksi aloitin Debian-asennuksen, ja ensimmäinen herja oli opettajan sanojen mukaan aiheeton, eli tästä eteenpäin hyväksymällä.

![image](https://github.com/syjaka/linux-perus-h1/assets/123550796/40cd607f-1ee7-41e0-999a-58b8f7282d61)

9.	Sitten alkumääritysten valinta (edit 23.01.2024 Käyttäjätietoja lisätty)
- Kieli: American English
- Lokaatio: Suomi
- Näppin: Suomi ja mac
- Osiointi: Erase disk ja ei täppää Encrypt system
  Käyttäjätiedot
- Oma nimi Kadriye Syrja
- Käyttäjänimi kadi
- Koneen nimi kadinDeb 
- Salasana ------
- Automaattinen login, No
- Yhteenvetoikkunassa valitsin asenna (ei ollut aluksi näytillä mutta ruudun laajentamisen jälkeen tuli sekin)
  
10. Asennuksen jälkeen minulle avautui suoraan kirjautumisikkuna.

![image](https://github.com/syjaka/linux-perus-h1/assets/123550796/63f816e1-2ac7-46ef-9541-c1c0bb20348a)

11.	Mutta, en päässyt kirjautumaan määrittelemilläni tunnuksilla. Ilmeisesti tuplatypo salasanaa kirjoittaessa, miten ikinä se onkaan mahdollista? Koska salasanaa ei voi palauttaa, aloitin uudelleen koko Linuxin asennuksen.
12.	Deletoin ekaksi jo luodun virtuaalikoneen Oraclen [ohjeen](https://docs.oracle.com/en/virtualization/virtualbox/6.0/user/intro-removing.html) mukaisesti, klikkasin hiiren oikeaa ja valitsin remove
13.	Uudelleenasennus olikin nopeaa yo ohjeita noudattaen, kunnes Debiania asennettaessa tuli herja riittämättömästä levykoosta.
    
![image](https://github.com/syjaka/linux-perus-h1/assets/123550796/5d9cd920-9ac5-4fb8-b787-65c57a4be32f)

14.	Ensimmäinen virheenetsintä paljasti että ISO-tiedosto oli hakematta asennustiedostoksi. Edellisellä kerralla se oli valmiiksi, joten en osannut sitä erikseen hakea…

![image](https://github.com/syjaka/linux-perus-h1/assets/123550796/fb6b06ad-559d-4e69-a62d-d02a31beb3ec)
![image](https://github.com/syjaka/linux-perus-h1/assets/123550796/ea6a31b9-95b4-4169-a006-debfb151e37f)

15. Uutta yritystä ja sain uudelleen saman herjan riittämättömästä koosta.

![image](https://github.com/syjaka/linux-perus-h1/assets/123550796/4cf7f9fd-54f4-4de6-b680-22efb18aaea2)

16. Aluksi tarkistin muutamat ilmiselvät, kirjoitusoikeus, osoitettu kovalevytila. Selkeästi ongelma ei ole koneen levytilassa jota on vapaana noin 200GB, ja täydet hallintaoikeudetkin minulla on. 
17.	Asensin virtualboxista lähtien kaiken uudelleen..
18.	Nyt homma toimi, eräs syy ongelmaan voisi omasta mielestäni olla VirtualBoxille allokoitu tila jota jo asennettu mutta poistettu virtuaalikone jotenkin varasi. Itse en asetuksia asennuksen yhteydessä määritellyt joten en tätä tarkistanut, vielä. (edit 23.01.2024: Luennolla aukesi että syy oli itse määrittelemäni levytilan koko joka virheellisesti oli epätoimivassa versiossa 60MB eikä 60 GB)
19.	Uudelleenasennuksen jälkeen aukesi taas kirjautumisikkuna, joka edelleen herjasi herjaa väärää salasanaa. Hetken huokailtuani ja toisen googlailtuani päädyin kokeilemaan user/live yhdestelmää, kun järjestelmä tarjosi sitä user-käyttäjää oletuksena, lopputuloksena pääsin sisään. Koitin ennen uudelleenkäynnistystä vaihtaa käyttäjää, mutta yhä herjasi väärää salasanaa. Joten uudelleenkäynnistin jotta asennus tuli viimeistellyksi. Samalla oivalsin  että, tällä reboottauksella myös asentajassa ottamani määritykset tallentuivat ja viimein pääsin asettamillani salasanoilla sisään (opettajahan reboottaa ohjeessa kun automaattisesti ei auennut kirjautumisikkunaa)...
20.	Tämä ratkaisi asian ja sisällä ollaan. Tokihan tämä olisi jo ensimmäisellä asennuskerralla pienen pohdiskelun kautta voinut aueta. Mutta en osannut aavistellakaan ja nyt olen ainakin harjoiteltu VirtualBoxin ja Debianin asennusta.
21.	Vielä testasin että kaikki toimi kuten pitää, eli selain auki ja navigoin tietylle sivulle:

![image](https://github.com/syjaka/linux-perus-h1/assets/123550796/e8c90594-f382-4adf-9e15-7de8f6b0d8e0)

### Ekat Debian kokeilut
Avasin ensin terminaalin:

![image](https://github.com/syjaka/linux-perus-h1/assets/123550796/e026d88c-24d5-4e47-9cce-69bb22f6b49d)

Aluksi selvitin mitä upgradeja on asennettavissa komennolla:

    $ sudo apt-get update
Ja sitten asensin ne(tässä meni tovi):

    $ sudo apt-get -y dist-upgrade
Seuraavaksi asensin ja otin käyttöön palomuurin:

    $ sudo apt-get -y install ufw
    $ sudo ufw enable
Viimeisin käsky antoi palautteen että palomuuri aktivoituu käynnistyksen myötä, joten uudelleenkäynnistin vasemman yläpalkin Applications valikosta Log Out ja Restart

![image](https://github.com/syjaka/linux-perus-h1/assets/123550796/0f721729-b34f-4372-b063-a876f058edc0)

### VirtualBoxin Guest Additions 

Nämä helpottavat virtiaalikoneen käyttöä parantaen resoluutiota ja tuoden copy-paste toiminnon, joten asensin ne seuraavaksi.
Virtuaalikoneen Devices menuvalikon alta valitsin ” Insert Guest Additions CD image…”
Sitten ”Applications” ja ”File Managerin” kautta valitsin Vbox_GAs.. CDROM.
Seuraavaksi Terminal Emulatorissa vaihdoin hakemistoksi CDROM

    $ cd /media/*/VBox*
ja listasin siellä olevat tiedostot
   
    $ ls
Seuraavaksi ajoin asennuskriptin sudo-oikeuksin, ao komennon jälkeen järjestelmä kysyi vielä käyytäjän salasanaa jotta sudo-oikeudet saadaan käyttöön, joten annoin sen.

    $ sudo bash VBoxLinuxAdditions.run
Tämän jälkeen tarvittiin taas reboottia, jotta sain juuri ajetut lisäosat käyttöön.
Nyt näytön resoluutio on korkeampi ja työskentely isommalla näytöllä onnistuu helpommin.
Leikepöydän sain vielä käyttöön valikosta ”Devices” ”Shared Clipboard” ja ”Bidirectional” niin toimii molempiin suuntiin.

### Ajankäyttö

Aloitin tehtävän teon heti luennon loputtua ja sain Asennuksen osalta valmista noin klo 20.00 Eli noin kuusi tuntia aloituksesta valmiiksi oli kesto, aktiivista työaikaa siitä oli noin 4h ja perhe-elämää sitten loput. Itse asentaminen ja määrityksien tekeminenhän oli onneksi melko suoraviivaista, mutta noiden muutamien ongelmien ratkaisuun saikin tuhlattua helposti aikaa.

### Lähteet(edit 23.01.2024)

What is Free Software. Luettavissa: https://www.gnu.org/philosophy/free-sw.html Luettu 15.01.2024.

Raportin kirjoitusohjeet. Luettavissa: https://terokarvinen.com/2006/raportin-kirjoittaminen-4/ Luettu 15.01.2024.

Linuxin asennusohjeet. Luettavissa: https://terokarvinen.com/2021/install-debian-on-virtualbox/#first-login Luettu 15.01.2024.

Asennetun VM poisto VirtualBoxista. Luettavissa: https://docs.oracle.com/en/virtualization/virtualbox/6.0/user/intro-removing.html Luettu 15.01.2024.

Debian User-tunnarin salasana https. Luettavissa://forums.debian.net/viewtopic.php?t=102937 Luettu 15.01.2024.
