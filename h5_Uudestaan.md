# Kertaus on opintojen äiti


- a)[ Asenna Linux VirtualBoxiin]()
- b)[ Päivitykset, alkuasetukset ja lisäosat]()
- c)[ ]()
- y)[ toinen tehtävä]()
- z)[ kolmas tehtävä]()

---

  ## y) Työskentely-ympäristö
  - Tehtävä toteutettiin MacBook Retina 12-inch, koneella jossa Ventura 13.6.1 käyttöjärjestelmä Suomen maa-asetuksilla ja suomen kielellä. Koneessa on 1,3GHz kaksiytiminen Intel Core i5 prosessori ja 8Gt 1867 MHz LPDDR3 muistia. Näytönohjain on Intel HD Graphics 615 jossa VRAM 1536 Mt.
---

  ## z) alkutoimenpiteet
  1. Virtualboxin ja virtuaalikoneen käynnistäminen
  2. Terminaalin käynnistys `Applications` -> `Terminal Emulator`

  ## a) Asenna Linux Virtualboxiin 
  
  Tehtävän aloitus klo 16.30 UTC +3

  Tässä tehtävässä on käytetty lähteinä omia muistiinpanojani h1-h5, jotka löytyvät [Linux-Palvelimet_2024](https://github.com/syjaka/Linux-Palvelimet-2024/tree/main) repositoristani

  1. Aloitin lataamalla Debianin Iso-tiedoston [Debianin sivulta], ([debian-live-12.1.0-amd64-xfce.iso](https://cdimage.debian.org/debian-cd/current-live/amd64/iso-hybrid/debian-live-12.5.0-amd64-xfce.iso). Versio oli päivittynyt 12.1 versiosta 12.5.
  2. Virtualboxissa valitsen `new` ja täytän uudelle koneelle annettavat tiedot
     - Nimi
    - Valitsin juuri lataamani isokuvan lähdetiedostoksi
    - Valitsin skip unattended installation ja versioksi Debian (65-biy)
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

## b) Päivitykset, alkuasetukset ja lisäosat. 

Tehtävän aloitus klo 18.00 UTC +3

1. Terminaalin avaus `àpplications` `teminal emulator`
2. Päivitysten haku ja asennus `sudo apt-get update`ja `sudo apt-get -y dist-upgrade` tässä vaiheessa kone raksutti muutaman minuutin 
3. Palomuurin asennus ja käyttöönotto `sudo apt-get -y install ufw`ja `sudo ufw enable` Tämä vaatii myös koko järjestelmän uudelleenkäynnistyksen, joten tein sen. `log out`ja `restart`
4. Seuraavaksi käyttöä helpottavat guest additions
 -  Avasin vituaalikoneen menuvalikon `devices`välilehti josta valitsin ìnser guest additions CD image...`
 -  seuraavaksi `applications`+ `File MAnager`josta valitsin Devices kohdassa valitsin VBox_Gas_7.0...
 -  Tämän jälkeen terminaalissa valitsin hakemistoksi CDROM `cd /media/*/VBox*` ja listasin siellä olevat `ls`
 -  `sudo bash VBoxLinuxAdditions.run`-komento ajaa GuestAdditions asennuskriptin joka saadaan käynnistymään antamalla sudo-oikeuksien salasana. Leikepöytä tuli käyttöön valikosta `Devices`, `Shared clipboard`ja Bidirectional. Uudelleenkäynnistys latasi uudet ominaisuudet käyttöön.

5. Microeditorin asennus sujui komennolla `sudo apt-get -y install micro`
6. Ja muutama muu mahdollisesti hyödyllinen
    - Tre joka listaa hakemiston puunäkymään `sudo apt-get -y install tre-command`
    - 
7.   
