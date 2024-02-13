# Kertaus on opintojen äiti


- a.1)[ Asenna Linux VirtualBoxiin]()
- a.2)[ Päivitykset, alkuasetukset ja lisäosat]()
- a.3)[ ]()
- b) [Pubkey. Automatisoi kirjautuminen julkisella SSH-avaimella]()
- c) [Digging host]()
- m) [Asenna Vagrant ja sillä uusi virtuaalikone]()
- y)[ Työskentely-ympäristö]()
- z)[ alkutoimenpiteet]()

- b) Pubkey. Automatisoi kirjautuminen julkisella SSH-avaimella.
c) Digging host. Tutki domain-nimesi nimesi tietoja 'host' ja 'dig' -komennoilla. Analysoi tulokset. Vertaa tuloksia nimen vuokraajan (namecheap.com, name.com...) weppiliittymässä näkyviin asetuksiin. (Jos sinulla ei ole omaa nimeä käytössä, voit tutkia jotain muuta nimeä).
m) Vapaaehtoinen: Asenna vagrant, asenna sillä uusi virtuaalikone.

---

  ## y) Työskentely-ympäristö
  - Tehtävä toteutettiin MacBook Retina 12-inch, koneella jossa Ventura 13.6.1 käyttöjärjestelmä Suomen maa-asetuksilla ja suomen kielellä. Koneessa on 1,3GHz kaksiytiminen Intel Core i5 prosessori ja 8Gt 1867 MHz LPDDR3 muistia. Näytönohjain on Intel HD Graphics 615 jossa VRAM 1536 Mt.
---

  ## z) alkutoimenpiteet
  1. Virtualboxin käynnistäminen ja asennetun Debianin poistaminen

  ## a.1) Asenna Linux Virtualboxiin 
  
  Tehtävän aloitus klo 16.30 UTC +3

  Tässä tehtävässä on käytetty lähteinä omia muistiinpanojani h1-h5, jotka löytyvät [Linux-Palvelimet_2024](https://github.com/syjaka/Linux-Palvelimet-2024/tree/main) repositoristani

  1. Aloitin lataamalla Debianin Iso-tiedoston [Debianin sivulta], ([debian-live-12.1.0-amd64-xfce.iso](https://cdimage.debian.org/debian-cd/current-live/amd64/iso-hybrid/debian-live-12.5.0-amd64-xfce.iso). Versio oli päivittynyt 12.1 versiosta 12.5.
  2. Virtualboxissa valitsen `new` ja täytän uudelle koneelle annettavat tiedot
     - Nimi
    - Valitsin juuri lataamani isokuvan lähdetiedostoksi
    - Valitsin skip unattended installation ja versioksi Debian (65-bit)
    - Muistia annoin 2000 MB ja prosessoreita 2
    - Tallennustilaa 60 GB
    - Muut valinnat jätin oletuksiksi ja seuraavaksi valitsin Finish
  3. Uusi juuri luotu kone tuli näkyviin Virtualboxin vasempaan reunaan. Tarkistin että virtuaalikoneen storageosioon oli jo valittu Iso-tiedosto, joten jatkoin koneen käynnistyksellä `Start`-napista
  4. Ruutuun avautui valintaikkina josta valitsein "Livesystem AMD 64" Tämän jälkeen kone käynnisteli aikansa
  5. Testasin järjestelmää navigoimalla koneen selaimella syrjä.com sivulle - Tämä ei onnistunut, sillä näppis on vielä oletusasetuksissa - ä puuttuu. Navigoin terokarvinen.com ja kaikki toimi kuten piti eli oikea sivu avautui.
  6. Klo 17.04 aloitin debianin asennukset valitsemalla työpöydältä ìnstall debian`. Ensimmäinen herja ohitettiin aiheettomana.
  7. Tämän jälkeen vuorossa alkumääritykset jotka tein kuten omassa raportissa [h1_OmaLinux](https://github.com/syjaka/Linux-Palvelimet-2024/blob/main/h1_OmaLinux.md#loin-uuden-virtuaalikoneen-linuxin-debian-k%C3%A4ytt%C3%B6j%C3%A4rjestelm%C3%A4ll%C3%A4) on avattu. Käytin identtistä koneen nimeä, ja kirjautumistietoja, jotta minun ei tarvitse opetella niitä uudelleen.
  8. Debian asentui noin 18 minuuttia jonka jälkeen avautui ikkuna jossa edotettiin uudelleenkäynnistystä asetuksien tallentamiseen. Eli valitsin restart now ja painoin `done`täppää.
  11. Järjestelmä käynnistyi uudelleen ja selaimella avattu ja oikein latautunut sivu syrjä.com vahvisti syötteiden ja netin pelaavan.

      Tämä tehtävä oli valmis noin klo 17.20 UTC + 3 Eli tehtävään meni 50 min.

---

## a.2) Päivitykset, alkuasetukset ja lisäosat. 

Tehtävän aloitus klo 18.00 UTC +3

1. Terminaalin avaus `àpplications` `teminal emulator`
2. Päivitysten haku ja asennus `sudo apt-get update`ja `sudo apt-get -y dist-upgrade` tässä vaiheessa kone raksutti muutaman minuutin 
3. Palomuurin asennus ja käyttöönotto `sudo apt-get -y install ufw`ja `sudo ufw enable` Tämä vaatii myös koko järjestelmän uudelleenkäynnistyksen, joten tein sen. `log out`ja `restart`
4. Seuraavaksi käyttöä helpottavat guest additions
 -  Avasin vituaalikoneen menuvalikon `devices`välilehti josta valitsin ìnser guest additions CD image...`
 -  seuraavaksi `applications`+ `File MAnager`josta valitsin Devices kohdassa valitsin VBox_Gas_7.0...
 -  Tämän jälkeen terminaalissa valitsin hakemistoksi CDROM `cd /media/*/VBox*` ja listasin siellä olevat `ls`
 -  `sudo bash VBoxLinuxAdditions.run`-komento ajaa GuestAdditions asennuskriptin joka saadaan käynnistymään antamalla sudo-oikeuksien salasana. Leikepöytä tuli käyttöön valikosta `Devices`, `Shared clipboard`ja Bidirectional. Uudelleenkäynnistys latasi uudet ominaisuudet käyttöön.
 -  `sudo apt install bash-completion`asensi komennon täydennysapurin

5. Microeditorin asennus sujui komennolla `sudo apt-get -y install micro`
6. Ja muutama muu mahdollisesti hyödyllinen
    - Tre joka listaa hakemiston puunäkymään `sudo apt-get -y install tre-command`
  
     Tämä tehtävä oli valmis klo 18.35 UTC +3 eli tehtävään käytetty aika oli noin 35 min.

---

## a.3) Webbipalvelin ja oma sivu

Tehtävän aloitus klo 18.50 UTC +3

1. Aloitin apachen asennuksella `sudo apt-get -y install apache2`
2. Jonka jälkeen defaultsivun korvaaminen "Default" tekstillä `echo "Default"|sudo tee /var/www/html/index.html`
3. Testi että Apache toimii `curl localhost`joka antaa vastaukseski tekstin default (äsken syöttämämme sisältö defaultsivulle). Tarkistin vielä selaimella ja toimi.
  ![5.1_apache_toimii]()
4. Luodaan conf tiedosto joka ohjaa syrjä.com haut `sudoedit /etc/apache2/sites-available/syrjä.examplecom.conf`
  ![5.2_esim.conf]()
5. Aktivoin luodun conffin `sudo a2ensite esim.example.com`ja deaktivoin oletusconffin `sudo a2dissite 000-default.conf`jonka jälkeen muutokset astui voimaan uudelleenkäynnistyksellä `sudo systemctl restart apache2`
6. Verkkosivulle tarvitaan sisältö jonka loin tavallisena, eli en pääkäyttäjän oikeuksin. Ensin kansio `mkdir -p /home/kadi/publicsites/esim.example.com` ja sitten tiedosto `micro index.html` jonne tallennan sisällön joka näytetään esim.example.com sivulla.
7. Seuraavaksi testasin ja index.html tiedostoon luotu sisältö vastasi.
  ![5.3_esim_index]()
8. Loin vielä samalla tavoin sivut kissa.example.com ja koira.example.com  sekä niille vastaavat enabloidut conf-sivut, jotka määritin vastaamaan vastaavin nimin. `sudoedit /etc/hosts`
  ![5.4_hosts_example]()
9. Lopputuloksena kaikki sivut vastaavat niinkuin pitää
 ![5.5_hostit_vastaa]()

 




   