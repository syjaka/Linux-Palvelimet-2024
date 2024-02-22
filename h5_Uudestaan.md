# Keskeneräinen

# Kertaus on opintojen äiti
Viidennessä tehtävässä kerrattiin kaikkea aiemmin opittua asentamalla kokonaan uusi virtuaalikone, sille apache2 web-palvelin sekä uusi etusivu. Tämän jälkeen vituaalikoneelle kirjautuminen automatisoitiinn julkisella SSH-avaimella.
Toisena osana oli tutkia Namecheapin kautta vuokrattua domainia `dig`ja `host`komennoilla, sekä analysoida tulokset vertaamalla niitä Namecheapin weppiliittymän asetuksiin.
Viimeinen bonustehtävä oli asentaa Vagrant ja sillä uusi virtuaalikone.


- a.1)[ Asenna Linux VirtualBoxiin](https://github.com/syjaka/Linux-Palvelimet-2024/blob/main/h5_Uudestaan.md#a1-asenna-linux-virtualboxiin)
- a.2)[ Päivitykset, alkuasetukset ja lisäosat](https://github.com/syjaka/Linux-Palvelimet-2024/blob/main/h5_Uudestaan.md#a2-p%C3%A4ivitykset-alkuasetukset-ja-lis%C3%A4osat)
- a.3)[ Webbipalvelin ja oma sivu](https://github.com/syjaka/Linux-Palvelimet-2024/blob/main/h5_Uudestaan.md#a3-webbipalvelin-ja-oma-sivu)
- b) [Pubkey. Automatisoi kirjautuminen julkisella SSH-avaimella](https://github.com/syjaka/Linux-Palvelimet-2024/blob/main/h5_Uudestaan.md#b-pubkey-automatisoi-kirjautuminen-julkisella-ssh-avaimella)
- c) [Digging host](https://github.com/syjaka/Linux-Palvelimet-2024/blob/main/h5_Uudestaan.md#c-digging-host)
- m) [Asenna Vagrant ja sillä uusi virtuaalikone](https://github.com/syjaka/Linux-Palvelimet-2024/blob/main/h5_Uudestaan.md#m-vagrant)
- y)[ Työskentely-ympäristö](https://github.com/syjaka/Linux-Palvelimet-2024/blob/main/h5_Uudestaan.md#y-ty%C3%B6skentely-ymp%C3%A4rist%C3%B6)
- z)[ alkutoimenpiteet](https://github.com/syjaka/Linux-Palvelimet-2024/blob/main/h5_Uudestaan.md#z-alkutoimenpiteet)

---

  ## y) Työskentely-ympäristö
  - Tehtävä toteutettiin MacBook Retina 12-inch, koneella jossa Ventura 13.6.1 käyttöjärjestelmä Suomen maa-asetuksilla ja suomen kielellä. Koneessa on 1,3GHz kaksiytiminen Intel Core i5 prosessori ja 8Gt 1867 MHz LPDDR3 muistia. Näytönohjain on Intel HD Graphics 615 jossa VRAM 1536 Mt.
    
---

  ## z) alkutoimenpiteet
  1. Virtualboxin käynnistäminen ja asennetun Debianin poistaminen

---

  ## a.1) Asenna Linux Virtualboxiin 
  
  a) tehtävän aloitus 13.02.2024 klo 16.30 UTC+2 ja valmista oli noin klo 19.20 UTC+2, jolloin kokonaistyöaika oli 2h 50min. Tässä a) tehtävässä käytin lähteinä omia muistiinpanojani h1-h5, jotka löytyvät [Linux-Palvelimet_2024](https://github.com/syjaka/Linux-Palvelimet-2024/tree/main) repositoristani. Tehtävän edetessä en ole käyttänyt kuvakaappauksia niiltä osin kuin asiat etenivät ongelmitta, sillä kuvakaappaukset ovat vastaavat kuin aiemmin tehdyssä tehtävässä. Erottamisen mahdollistamiseksi nimesin kuitenkin uudelleenasennetun koneen - UusiDeb edellisen ollessa -KadinDeb. 

  1. Aloitin lataamalla Debianin Iso-tiedoston Debianin sivulta, [debian-live-12.5.0-amd64-xfce.iso](https://cdimage.debian.org/debian-cd/current-live/amd64/iso-hybrid/debian-live-12.5.0-amd64-xfce.iso). Versio oli päivittynyt aiemmin asennetusta versiosta 12.1 versioon 12.5.
  2. Virtualboxissa valitsen `new` ja täytän uudelle koneelle annettavat tiedot.
    - Nimi -> UusiDeb
    - Valitsin juuri lataamani isokuvan lähdetiedostoksi.
    - Valitsin skip unattended installation ja versioksi Debian (65-bit).
    - Muistia annoin 2000 MB ja prosessoreita 2.
    - Tallennustilaa 60 GB.
    - Muut valinnat jätin oletuksiksi ja seuraavaksi valitsin Finish.
  3. Uusi juuri luotu kone tuli näkyviin Virtualboxin vasempaan reunaan. Tarkistin että virtuaalikoneen storageosioon oli jo valittu Iso-tiedosto, joten jatkoin koneen käynnistyksellä `Start`-napista.
  4. Ruutuun avautui valintaikkina josta valitsein "Livesystem AMD 64" Tämän jälkeen kone käynnisteli aikansa.
  5. Testasin järjestelmää navigoimalla koneen selaimella syrjä.com sivulle - Tämä ei onnistunut, sillä näppis on vielä oletusasetuksissa - ä puuttuu. Navigoin terokarvinen.com ja kaikki toimi kuten piti, eli oikea sivu avautui.
  6. Klo 17.04 aloitin debianin asennukset valitsemalla työpöydältä ìnstall debian`. Ensimmäinen herja ohitettiin aiheettomana.
  7. Tämän jälkeen vuorossa alkumääritykset, jotka tein kuten omassa raportissa [h1_OmaLinux](https://github.com/syjaka/Linux-Palvelimet-2024/blob/main/h1_OmaLinux.md#loin-uuden-virtuaalikoneen-linuxin-debian-k%C3%A4ytt%C3%B6j%C3%A4rjestelm%C3%A4ll%C3%A4) on avattu. 
  8. Debian asennuksen jälkeen avautui ikkuna, jossa ehdotettiin uudelleenkäynnistystä asetuksien tallentamiseen. Valitsin restart now ja painoin `done`täppää.
  11. Järjestelmä käynnistyi uudelleen ja selaimella avattu ja oikein latautunut sivu syrjä.com vahvisti syötteiden ja netin pelaavan.

      Tämä osa tehtävästä oli valmis noin klo 17.20 UTC+2 Eli tehtävään meni 50 min.
      
[takaisin ylös](https://github.com/syjaka/Linux-Palvelimet-2024/edit/main/h5_Uudestaan.md#kertaus-on-opintojen-%C3%A4iti)

---

## a.2) Päivitykset, alkuasetukset ja lisäosat. 

Tehtävän aloitus klo 18.00 UTC+2

1. Terminaalin avaus `applications` -> `teminal emulator`.
2. Päivitysten haku ja asennus `sudo apt-get update`ja `sudo apt-get -y dist-upgrade` tässä vaiheessa kone raksutti muutaman minuutin.
3. Palomuurin asennus ja käyttöönotto `sudo apt-get -y install ufw` ja `sudo ufw enable` Tämä vaatii myös uudelleenkäynnistyksen, joten tein sen. `log out`ja `restart`
4. Seuraavaksi käyttöä helpottavat guest additions:
 -  Avasin vituaalikoneen menuvalikon `devices` välilehden, josta valitsin ìnser guest additions CD image...`
 -  seuraavaksi `applications` -> `File MAnager`josta valitsin Devices kohdassa VBox_Gas_7.0...
 -  Tämän jälkeen terminaalissa valitsin hakemistoksi CDROM `cd /media/*/VBox*` ja listasin siellä olevat `ls`-komennolla.
 -  `sudo bash VBoxLinuxAdditions.run`-komento ajaa GuestAdditions asennuskriptin, joka saadaan käynnistymään antamalla sudo-oikeuksien salasana. Leikepöytä tuli käyttöön valikosta `Devices` -> `Shared clipboard`ja Bidirectional. Uudelleenkäynnistys latasi uudet ominaisuudet käyttöön.
5. Microeditorin asennus sujui komennolla `sudo apt-get -y install micro`.
6. Ja muutama muu mahdollisesti hyödyllinen:
 - Tre joka listaa hakemiston puunäkymään `sudo apt-get -y install tre-command`.
 - Bash completion joka ehdottaa mahdollisia komentoja tabilla `sudo apt install bash-completion`.
      
     Tämä osuus tehtävästä oli valmis klo 18.35 UTC+2 eli tehtävään käytetty aika oli noin 35 min.
   
[takaisin ylös](https://github.com/syjaka/Linux-Palvelimet-2024/edit/main/h5_Uudestaan.md#kertaus-on-opintojen-%C3%A4iti)

---

## a.3) Webbipalvelin ja oma sivu

Tehtävän aloitus klo 18.50 UTC+2

1. Aloitin apachen asennuksella `sudo apt-get -y install apache2`.
2. Jonka jälkeen defaultsivun korvaaminen "Default" tekstillä `echo "Default"|sudo tee /var/www/html/index.html`.
3. Testi että Apache toimii `curl localhost` joka antoi vastaukseksi tekstin - default (äsken syöttämämme sisältö defaultsivulle). Tarkistin vielä selaimella ja toimi.
  ![5.1_apache_toimii](https://github.com/syjaka/Linux-Palvelimet-2024/blob/main/images/5.1_apache_toimii.png)
4. Loin conf tiedoston joka ohjaa esim.example haut `sudoedit /etc/apache2/sites-available/esim.example.com.conf`.
  ![5.2_esim.conf](https://github.com/syjaka/Linux-Palvelimet-2024/blob/main/images/5.2_esim.conf.png)
5. Aktivoin luodun conffin `sudo a2ensite esim.example.com` ja deaktivoin oletusconffin `sudo a2dissite 000-default.conf`, jonka jälkeen muutokset astuivat voimaan uudelleenkäynnistyksellä `sudo systemctl restart apache2`.
6. Verkkosivulle tarvitaan sisältö, jonka loin tavallisena käyttäjänä, eli en pääkäyttäjän oikeuksin. Ensin kansio `mkdir -p /home/kadi/publicsites/esim.example.com` ja sitten tiedosto `micro index.html`, jonne tallennsin sisällön joka näytetään esim.example.com sivulla.
7. Seuraavaksi testasin ja index.html tiedostoon luotu sisältö vastasi.
  ![5.3_esim_index](https://github.com/syjaka/Linux-Palvelimet-2024/blob/main/images/5.3_esim_index.png)
8. Loin vielä samalla tavoin sivut kissa.example.com ja koira.example.com, sekä niille vastaavat enabloidut conf-sivut, jotka määritin vastaamaan vastaavin nimin. `sudoedit /etc/hosts`.
  ![5.4_hosts_example](https://github.com/syjaka/Linux-Palvelimet-2024/blob/main/images/5.4_hosts_example.png)
9. Lopputuloksena kaikki sivut vastasivat odotetusti.
 ![5.5_hostit_vastaa](https://github.com/syjaka/Linux-Palvelimet-2024/blob/main/images/5.5_hostit_vastaa.png)

[takaisin ylös](https://github.com/syjaka/Linux-Palvelimet-2024/edit/main/h5_Uudestaan.md#kertaus-on-opintojen-%C3%A4iti)

---

## b) Pubkey. Automatisoi kirjautuminen julkisella SSH-avaimella 

Aloitin tehtävän 2024.02.22 klo 14.00 UTC+2 ja valmista tuli 16.48 UTC+2, joten työaikaa kului 2h48min.
Tässä tehtävässä käytin lähteinä omia muistiinpanojani h1-h5, jotka löytyvät [Linux-Palvelimet_2024](https://github.com/syjaka/Linux-Palvelimet-2024/tree/main) repositoristani. Näiden lisäksi hyödynsin luentomuistiinpanojani Tero Karvisen 13.02.2024 luennolta.
Aloitin tehtävän tarkistamalla koneeni SSH-palvelimen nykyisen tilan, joka paljasti että palvelu on aktiivinen:

![5.5_SSH_active](https://github.com/syjaka/Linux-Palvelimet-2024/blob/main/images/5.5_SSH_active.png)

Komennolla `history`selvitin, että olin edellistä tehtävää/kokeiluja tehdessäni asentanut kyseisin palvelun. Tämä onnistui komennolla `sudo apt install ssh`.

1. Testasin SSH-yhteyden toimivuutta koneeni Localhost-palveluun.
![5.6_localhost_connect](https://github.com/syjaka/Linux-Palvelimet-2024/blob/main/images/5.5_SSH_active.png)
2. Poistuin palvelimelta `exit`-komennolla takaisin virtuaalikoneelleni, jolla Generoin SSH-avainparin `ssh-keygen`. Minulta kysyttiin kohdetiedostoa ja jatkoin oletuksella. Samoin pyydettiin mahdollista tiedoston salausavainta, jonka jätin tyhjäksi returnilla.
![5.6_ssh_keygen](https://github.com/syjaka/Linux-Palvelimet-2024/blob/main/images/5.6_ssh_keygen.png)
3. Komennolla `ssh-copy-id  kadi@localhost` kopioin julkisen avaimen localhost palvelimelle.
![5.7_copy-id](https://github.com/syjaka/Linux-Palvelimet-2024/blob/main/images/5.7_copy-id.png)
4. Koneeni kehotusta noudattaen testasin SSH-yhteyden toimivuutta.
![5.8_SSH_automaatio_toimii](https://github.com/syjaka/Linux-Palvelimet-2024/blob/main/images/5.8_SSH_automaatio_toimii.png)
5. Vielä lopuksi poistin salasanakirjautumisen käytöstä `sudoedit /etc/ssh/sshd_config`.
   - Koska tämä komento avasi tiedoston nano-editorissa ja näytti pelkkää tyhjää, navigoin suoraan kyseiseen kansioon `cd /etc/ssh/sshd`, ja siellä avasin tiedoston muokattavaksi microlla `sudo micro sshd_config`.
   - `ctrl`+ `f`  ja haulla passworda, löytyi oikea kohta. Täällä vaihdoin salasana-autentikointi-kohtaan `no`.
![5.9_salasana_no](https://github.com/syjaka/Linux-Palvelimet-2024/blob/main/images/5.9_salasana_no.png)

Uudelleenkäynnistys viimeisteli asennukset `sudo systemctl restart ssh`.

Nyt pitäisi olla valmista joten testasin sulkemalla ssh-yhteyden `exit` ja kokeilemalla sen avaamista uudelleen `ssh kadi@localhost`.

![5.10_exit_in](https://github.com/syjaka/Linux-Palvelimet-2024/blob/main/images/5.10_exit_in.png)

[takaisin ylös](https://github.com/syjaka/Linux-Palvelimet-2024/edit/main/h5_Uudestaan.md#kertaus-on-opintojen-%C3%A4iti)

---

 ## c) Digging host
 
Tässä tehtävässä minun tuli tutkia vuokraamani domain-nimen tietoja `host`ja `dig`komennoilla, sekä analysoida tulokset. Lisäksi tuloksia tuli vertailla domain-nimeni vuokraajan - minun tapauksessa Namecheap - weppiliittymässä näkyviin asetuksiin. Tehtävän aloitus 22.02.2024 klo 18.05 UTC+2 ja valmista oli 22.02.2024 klo 19.20 UTC+2, joten aikaa kului 1h15min. Käytetyt lähteet ovat merkittynä tekstiviitteisiin, sekä lähdeluetteloon. 

1. Tehtävän aloitus `host` ja `dig`komentojen asennuksella `sudo apt-get -y install bind9-dnsutils bind9-host` (Karvinen, 2024)
2. Tämän jälkeen suoritin komennot `host syrjä.com` ja `dig syrjä.com`sekä avasin Namecheapin sivulta asetussivun.
![5.11_host_dig_namecheap](https://github.com/syjaka/Linux-Palvelimet-2024/blob/main/images/5.11_host_dig_namecheap.png)
3. Näistä voimme päätellä seuraavia seikkoja:
   
 `host` ensimmäinen rivi kertoo IP-osoitteen josta syrjä.com vastaa. Samainen IP-osoite, jonka määrittelin Namecheapin palvelussa ohjautumaan Digital Oceanilta vuokraamaani virtuaalikoneeseen.
   - Seuraavien rivien kohdalla, en löytänyt yksiselitteistä vastausta. Kuitenkin tekstistä voin päätellä, että nämä liittyvät sähköpostin uudelleenohjaukseen. Lisäksi Namecheapin asetussivulla Mail settings kohdassa mainitaan sähköpostin uudelleenohjauksesta:
  ![5.12_mail_forvarders](https://github.com/syjaka/Linux-Palvelimet-2024/blob/main/images/5.12_mail_forvarders.png)
 `dig`ensimmäinen rivi kertoo komennon nykyisen version, sekä lähettämäni kyselyn nimen "syrjä.com". (Shrestha 2023)
   - **got answer** osio avaa saadun vastauksen sisältöä. **opcode** listaa dig-komennon toiminnan, mikä tässä tapauksessa oli kysely "QUERY. **status** kertoi NOERROR, eli vastaus tuli esteettä. (Levine. 2016)
   - **QUESTION SECTION** syrjä.com kertoo kyselymme kohdistuneen syrjä.com doimainiin. **IN** ilmaisee kyselyn olleen **internet lookup** ja **A** kertoo haun tyypin. Haun tyyppi on oletuksena a-tietue, mikäli tyyppiä ei komennon yhteydessä erikseen pyydetä (Pramatarov 2023).
   - **ANSWER SECTION** osassa näemme ensin palvelimen nimen, joka vastasi, eli syrjä.com, ja sen IP-osoite eli 104.248.205.0.  300 esittää TTL (time to live) aikaa sekunneissa. Namecheapin asetussivulla tämä oli vastaavasti minuuteissa 5.
   - **Query time** ilmaisee kyselyn vastausajan, 56 millisekuntia.
   - **Server** kertoo vastanneen DNS-palvelimen IP-osoitteen 193.229.0.40 (joka tässä tapauksessa on Elisan nimipalvelin) (Elisa 2024) ja portti 53.
   - **WHEN** näyttää `dig`komennon ajohetken.
   - **MSG SIZE rcvd** näyttää vastaksen koon. (Törmä, 2023)

[takaisin ylös](https://github.com/syjaka/Linux-Palvelimet-2024/edit/main/h5_Uudestaan.md#kertaus-on-opintojen-%C3%A4iti)

---

## m) Vagrant

Viimeinen tehtävä oli asentaa omalle koneelle Vagrant ja sille uusi virtuaalikone. Asennuspaketti löytyi opettajan linkkaamasta sivustosta, jolta etsin mac [version](https://developer.hashicorp.com/vagrant/install). Aloitin tehtävän 22.02.2024 klo 21.00 UTC+2 ja valmista oli 22.58 UTC+2, joten työaikaa kului noin 2h. Lähteenä tässä tehtävässä käytin opettajan tehtävänannon yhteydessä antamaa ohjeistusta, https://terokarvinen.com/2024/linux-palvelimet-2024-alkukevat/#h5-koko-juttu.
![5.13_install_vagrant](https://github.com/syjaka/Linux-Palvelimet-2024/blob/main/images/5.13_install_vagrant.png)
1. Latasin oikean version koneelleni.

![5.14_vagrant_mac](https://github.com/syjaka/Linux-Palvelimet-2024/blob/main/images/5.14_vagrant_mac.png)
2. Asensin vagrantin asentajalla.
3. Asennuksen jälkeen tarkistin päätteeltä, että asennus oli ok komennolla `vagrant`, joka toi listan vagrantin komentoja esiin. 
![5.13_vagrant_ok](https://github.com/syjaka/Linux-Palvelimet-2024/blob/main/images/5.13_vagrant_ok.png)
4. Komennot `vagrant init debian/bookworm64` ja `vagrant up` asensivat virtuaalikoneen.
![5.15_init_bookworm](https://github.com/syjaka/Linux-Palvelimet-2024/blob/main/images/5.15_init_bookworm.png) ![5.16_vagrant_up](https://github.com/syjaka/Linux-Palvelimet-2024/blob/main/images/5.16_vagrant_up.png)
5. Käynnistin SSH yhteyden `vagrant ssh`.
![5.17_vagrant_ssh](https://github.com/syjaka/Linux-Palvelimet-2024/blob/main/images/5.17_vagrant_ssh.png)
6. Vagrantin asentama VM kaikkine tiedostoineen tuhotaan koneelta komennolla 'vagrant destroy', jota ennen tuli poistua ssh-yhteydestä `exit`

![5.18_vagrant_destroy](https://github.com/syjaka/Linux-Palvelimet-2024/blob/main/images/5.18_vagrant_destroy.png)

[takaisin ylös](https://github.com/syjaka/Linux-Palvelimet-2024/edit/main/h5_Uudestaan.md#kertaus-on-opintojen-%C3%A4iti)

---

Lähteet:

Elisa Tiedonsiirtoportit ja laitteiden porttiohjaukset. Luettavissa: https://elisa.fi/asiakaspalvelu/nettiliittymat/tiedonsiirtoportit-porttiohjaukset/. Luettu 22.02.2024.

Karvinen T. Linux-Palvelimet Alkukevät 2024. Luettavissa: https://terokarvinen.com/2024/linux-palvelimet-2024-alkukevat/#h5-koko-juttu. Luettu 13.02.2024

Levine K. 2016 Decoding DIG Output. Luettavissa: https://ns1.com/blog/decoding-dig-output. Luettu 22.02.2024

Pramatarov M. 2023. 10 Most used DIG commands. Luettavissa https://www.cloudns.net/blog/10-most-used-dig-commands/. Luettu 22.01.2024

Shrestha N. 10 Linux Dig Commands to Query DNS. Luettavissa: https://www.tecmint.com/dig-command-examples/. Luettu 22.02.2023

Syrjä K. Linux-Palvelimet-2024. Luettavissa: https://github.com/syjaka/Linux-Palvelimet-2024/tree/main. Luettu 13.02.2024

Törmä L. Linux-Palvelimet-kurssi. Luettavissa: https://github.com/lauritorma/Linux-palvelimet-kurssi/blob/main/h8-Say%20My%20Name.md#b-domainnimen-tiedot. Luettu 22.02.2024
