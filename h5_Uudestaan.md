# Keskeneräinen

# Kertaus on opintojen äiti
Viidennessä tehtävässä kerrataan kaikkea aiemmin opittua asentamalla kokonaan uusi virtuaalikone, sille apache2 web-palvelin sekä uusi etusivu. Tämän jälkeen vituaalikoneelle kirjautuminen automatisoidaan julkisella SSH-avaimella.
Toisena osana oli tutkia Namecheapin kautta vuokrattua domainia `dig`ja `host`komennoilla, sekä analysoida tulokset vertaamalla niitä Namecheapin weppiliittymän asetuksiin.
Viimeinen bonustehtävä oli asentaa Vagrant ja sillä uusi virtuaalikone.


- a.1)[ Asenna Linux VirtualBoxiin]()
- a.2)[ Päivitykset, alkuasetukset ja lisäosat]()
- a.3)[ Webbipalvelin ja oma sivu]()
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

---

  ## a.1) Asenna Linux Virtualboxiin 
  
  Tehtävän aloitus klo 16.30 UTC +3

  Tässä tehtävässä on käytetty lähteinä omia muistiinpanojani h1-h5, jotka löytyvät [Linux-Palvelimet_2024](https://github.com/syjaka/Linux-Palvelimet-2024/tree/main) repositoristani. Tehtävän edetessä en ole käyttänyt kuvakaappauksia niiltä osin kuin asiat etenivät ongelmitta, sillä kuvakaappaukset ovat vastaavat kuin aiemmin tehdyssä tehtävässä. Erottamisen mahdollistamiseksi nimesin kuitenkin uudelleenasennetun koneen - UusiDeb edellisen ollessa -KadinDeb. 

  1. Aloitin lataamalla Debianin Iso-tiedoston [Debianin sivulta], [debian-live-12.1.0-amd64-xfce.iso](https://cdimage.debian.org/debian-cd/current-live/amd64/iso-hybrid/debian-live-12.5.0-amd64-xfce.iso). Versio oli päivittynyt 12.1 versiosta 12.5.
  2. Virtualboxissa valitsen `new` ja täytän uudelle koneelle annettavat tiedot
    - Nimi -> UusiDeb
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
      
[takaisin ylös](https://github.com/syjaka/Linux-Palvelimet-2024/edit/main/h5_Uudestaan.md#kertaus-on-opintojen-%C3%A4iti)

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
    - Bash completion joka ehdottaa mahdollisia komentoja tabilla `sudo apt install bash-completion`
      
  
     Tämä tehtävä oli valmis klo 18.35 UTC +3 eli tehtävään käytetty aika oli noin 35 min.
   
[takaisin ylös](https://github.com/syjaka/Linux-Palvelimet-2024/edit/main/h5_Uudestaan.md#kertaus-on-opintojen-%C3%A4iti)

---

## a.3) Webbipalvelin ja oma sivu

Tehtävän aloitus klo 18.50 UTC +3

1. Aloitin apachen asennuksella `sudo apt-get -y install apache2`
2. Jonka jälkeen defaultsivun korvaaminen "Default" tekstillä `echo "Default"|sudo tee /var/www/html/index.html`
3. Testi että Apache toimii `curl localhost`joka antaa vastaukseski tekstin default (äsken syöttämämme sisältö defaultsivulle). Tarkistin vielä selaimella ja toimi.
  ![5.1_apache_toimii](https://github.com/syjaka/Linux-Palvelimet-2024/blob/main/images/5.1_apache_toimii.png)
4. Luodaan conf tiedosto joka ohjaa syrjä.com haut `sudoedit /etc/apache2/sites-available/syrjä.examplecom.conf`
  ![5.2_esim.conf](https://github.com/syjaka/Linux-Palvelimet-2024/blob/main/images/5.2_esim.conf.png)
5. Aktivoin luodun conffin `sudo a2ensite esim.example.com`ja deaktivoin oletusconffin `sudo a2dissite 000-default.conf`jonka jälkeen muutokset astui voimaan uudelleenkäynnistyksellä `sudo systemctl restart apache2`
6. Verkkosivulle tarvitaan sisältö jonka loin tavallisena, eli en pääkäyttäjän oikeuksin. Ensin kansio `mkdir -p /home/kadi/publicsites/esim.example.com` ja sitten tiedosto `micro index.html` jonne tallennan sisällön joka näytetään esim.example.com sivulla.
7. Seuraavaksi testasin ja index.html tiedostoon luotu sisältö vastasi.
  ![5.3_esim_index](https://github.com/syjaka/Linux-Palvelimet-2024/blob/main/images/5.3_esim_index.png)
8. Loin vielä samalla tavoin sivut kissa.example.com ja koira.example.com  sekä niille vastaavat enabloidut conf-sivut, jotka määritin vastaamaan vastaavin nimin. `sudoedit /etc/hosts`
  ![5.4_hosts_example](https://github.com/syjaka/Linux-Palvelimet-2024/blob/main/images/5.4_hosts_example.png)
9. Lopputuloksena kaikki sivut vastaavat niinkuin pitää
 ![5.5_hostit_vastaa](https://github.com/syjaka/Linux-Palvelimet-2024/blob/main/images/5.5_hostit_vastaa.png)

[takaisin ylös](https://github.com/syjaka/Linux-Palvelimet-2024/edit/main/h5_Uudestaan.md#kertaus-on-opintojen-%C3%A4iti)

---

## b) Pubkey. Automatisoi kirjautuminen julkisella SSH-avaimella

Aloitin tehtävän tarkistamalla koneeni SSH-palvelimen nykyisen tilan:
![5.5_SSH_active]()
SSH-palvelu näytti olevan aktiivinen ja päällä joten siirryin suoraan SSH-avainparin luontiin
1. Testasin SSH-yhteyden toimivuutta koneeni Localhost-palveluun ![5.6_localhost_connect]()
2. Poistuin palvelimelta `exit`-komennolla virtuaalikoneelleni, jolla Generoin SSH-avainparin `ssh-keygen`. Minulta kysyttiin kohdetiedostoa ja jatkoin oletuksella. Samoin pyydettiin mahdollista tiedoston salausavainta, jonka jätin tyhjäksi returnilla. ![5.6_ssh_keygen]()
3. Komennolla `ssh-copy-id  kadi@localhost`kopioin julkisen avaimen localhost palvelimelle ![5.7_copy-id]()
4. Koneeni kehotusta noudattaen testasin SSH-yhteyden toimivuutta ![5.8_SSH_automaatio_toimii]()
5. Vielä lopuksi poistin salasanakirjautumisen käytöstä `sudoedit /etc/ssh/sshd_config`
   - Koska tämä komento avasi tiedoston nano-editorissa ja näytti pelkkää tyhjää, navigoin suoraan kyseiseen kansioon `cd /etc/ssh/sshd`ja siellä avasin tiedoston muokattavaksi microlla `sudo micro sshd_config`.
   - `ctrl`+ `f`  ja haulla passworda löytyi oikea kohta. Täällä vaihdoin salasanaautentikointi-kohtaan No ![5.9_salasana_no]()




 




   
