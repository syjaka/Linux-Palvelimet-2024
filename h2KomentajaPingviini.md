# h2 Komentaja pingviini

### Tero Karvisen Linux palvelimet kurssin toisena [h2 tehtävänä](https://terokarvinen.com/2024/linux-palvelimet-2024-alkukevat/#h2-komentaja-pingviini) oli:
  1. [Tiivistää Karvisen [Command line basics revisited](https://terokarvinen.com/2020/command-line-basics-revisited/?fromSearch=command%20line%20basics%20revisited) artikkeli](https://github.com/syjaka/Linux-Palvelimet-2024/edit/main/h2KomentajaPingviini.md#1-Command-line-basics-revisited-muutamalla-sanalla)
  2. Asenna micro editori
  3. Listata testaamani koneen rauta
  4. Asentaa kolme uutta komentoriviohjelmaa
  5. Esitellä kansiot jotka on listattu kohdan 1. artikkelissa
  6. Esitellä 3 kuvaavaa esimerkkiä grip-komennosta
  7. Antaa esimerkki putkista
  8. Esitellä ja analysoida kaksi erilaista lokitapahtumaa.

## 1. Command line basics revisited muutamalla sanalla

- pwd (print working directory) näyttää nykyisen hakemiston 
- ls listaa nykyisen hakemiston tiedot
- cd vaihtaa hakemistoa, esim.
    a) cd xx - siirtyy nykyisen hakemiston xx hakemistoon
    b) cd xx/yy siirtyy nykyisen/xx hakemiston yy hakemistoon
    c) cd siirtyy käyttäjän kotihakemistoon
    d) cd .. siirty aina yhden hakemiston ylös
- mkdir uusi kansio
- rmdir poista tyhjä kansio tai rm -r tyhjennä kansio jossa tavaraa tai rm xx poista xx-niminen kansio
- tabulaattori täydentää ja jos on monta vaihtoehtoa; kaksi kertaa painettuna antaa vaihtoehdot mitä voisi täydentää.
- man ls näyttää ls komennon ohjeet
- sudo komennon edessä, antaa sudo-oikeudet niitä vaativille komennoille tai hakemistoille, esim softan asennus/poisto, käyttäjien hallinta...
  
   ![kuva_sudo](https://github.com/syjaka/Linux-Palvelimet-2024/blob/main/images/kuva_sudo.png)
  
- sudo apt-get update päivittää ja näyttää saatavilla olevat softwarepaketit

## 2. Asenna micro-editori - ke klo 20.45

(EDIT 25.01.2024 Työskentely-ympäristö lisätty)
Tehtävä toteutettiin MacBook Retina 12-inch, koneella jossa Ventura 13.6.1 käyttöjärjestelmä Suomen maa-asetuksilla ja suomen kielellä. Koneessa on 1,3GHz kaksiytiminen Intel Core i5 prosessori ja 8Gt 1867 MHz LPDDR3 muistia. Näytönohjain on Intel HD Graphics 615 jossa VRAM 1536 Mt.

Aloitin ao. komennolla joka haki päivitti ja näytti saatavilla olevat paketit.
    
    $ sudo apt-get update
 Seuraavaksi asennus komennolla:
    
    $ sudo apt-get -y install micro fzf pythonpy git exuberant-ctags
Koska olin jo eilen harjoitellessa asentanut micron sain seuraavan vastauksen:

   - micro is already the newest version (2.0.11-2+b1)
     
Microa asentaessa olin kopioinut kokonaisuudessaan opettajan esimerkin komennon, tuli samalla asennettua muutakin. Eli asennus jatkui asennus seuraavanlaisesti:

(EDIT 30.01-2024; lähde lisätty Asennuksessa käytetty komento ja pluginit Tero Karvisen ohjeesta [Command Palette, Cheatsheet, Run and Make - New Micro Editor Plugins](https://terokarvinen.com/2022/command-palette-cheatsheet-run-and-make-micro/)

  ![kuva micro asennus](https://github.com/syjaka/Linux-Palvelimet-2024/blob/main/images/kuva_micro_asennus.png)

Alla luetellut lisäpaketit tuli asennetuksi samalla:
  - [fzf](https://packages.debian.org/stable/fzf) (0.38.0-1+b1), general-purpose command-line fuzzy finder 
  - [pythonpy](https://packages.debian.org/stable/pythonpy) (0.4.11b-3.1) - 'python -c', with tab completion and shorthand (debian packages website)
  - [git](https://github.com/git-guides/install-git) (2.39.2) - distributed version control software (github, git guides)
  - [exuberant-ctags](https://packages.debian.org/stable/exuberant-ctags) (1:5.9~svn20110310-18) build tag file indexes of source code definitions (debian packages website)


    Jatkoin vielä opettajan ohjeessa suosittelemilla plugineilla:

   ![kuva_pluginit](https://github.com/syjaka/Linux-Palvelimet-2024/blob/main/images/kuva_pluginit.png)

Seuraavaksi testit että Micron laajennukset toimii:
    
    $ micro kadi.py 
  Yllä oleva komento  ja F1 - ei tuonut cheatsheettiä näkyviin. Koikeilin myös googlata olisiko jokin muu näppäin macillä osuva, tuloksetta.

    
  Run toimi odotetusti:
    ![kuva_hello_kadi](https://github.com/syjaka/Linux-Palvelimet-2024/blob/main/images/kuva_hello_kadi.png)
   

  Palettero toimi ja vaikuttaa hyödylliseltä (EDIT 30.01.2024, laaajennus saadaan esiin micro-editorissa ctrl + optio + space näppäinyhdistelmällä.)
    ![kuva_palettero](https://github.com/syjaka/Linux-Palvelimet-2024/blob/main/images/kuva_palettero.png)
      
Asennukset olivat valmiina muutamassa minuutissa, mutta kaiken lisätiedon hankinta ja kokeilut ennen ja jälkeen kestivät 22.00 saakka.

## 2. Listaa rauta - ke klo 22.10 

  ![kuva_lshw-not](https://github.com/syjaka/Linux-Palvelimet-2024/blob/main/images/kuva_lshv-not.png)

  (EDIT 30.01.2024 - Selvennys yo kuvalle: Koska slhw ei ollut asennettu, ensin sen asennus)

Ensimmäiseksi lshw asennus komennolla

    $ sudo apt-get install lshw
Komennolla (sudo lshw = ls hardware -short = tulostaa yhteenvedon joka noudattaa tietokoneen välylärakennetta (bus) -sanitize = poistaa kaiken arkaluontoisen kuten sarjanumerot tms (geeksforgeeks, linux.com)

    $ sudo lshw - short - sanitize
  
  ![kuva_lshw](https://github.com/syjaka/Linux-Palvelimet-2024/blob/main/images/kuva_lshw.png)

 1. H/W path sarake kuvaa laiteistopolkua eli kyseisen laitteiston fyysistä sijaintia ja hierarkiaa
      - 0/ - 6/ kuvaa raudan pääkomponentteja, 0/ kuvaa emolevyä
      - /0/0 - 0/100/ kuvaa esitetyn pääkomponentin esitettyä alikomponenttia 
      - 0/100/1 - 0/100/6 viittaa 0/100/ sillan alaisiin komponentteihin
      - seuraavat numerot viittaavat aina hierarkkisesti uuteen alikomponenttiin 
    
2. Device sarake näyttää laitteita, esim USB, kovalevyt...
  
3. Class sarake kuvaa laitteiden luokat esim tallennuslaitteet, syöttölaitteet, väylät.
  
4. Decription kuvaa kyseistä laitetta. (linux.com, Geeksforgeeks)

Alle listaukseen olen lisännyt lisää analyysiä kustakin laitteesta niiltä osin kuin on ollut mahdollista päätellä.
  - system      VirtualBox kertoo että kyseessä on vVirtuaBox virtuaalikone
  - 0/          VirtualBox  -- /0 kuvaa raudan emolevyä eli ensimmäistä pääkomponenttia. tässä tapauksessa virtualBox

Seuraavat ovat omalta koneeltani allokoituja fyysysä komponentteja:
  - 0/0/      memory 128KiB BIOS -- . Kyseessä BIOS-muisti kooltaan 128 KiB
  - 0/1/      memory 4GiB System memory - kuvaa virtuaalikoneelle allokoitua RAM-muistia
  - 0/2/      processorIntel(R) Core(TM) i5-7Y54 CPU @ 1.20GHz - kuvaa allokoitua prosessorikapasiteettia

Ja nämä taas virtuaalikoneen osia
  - 0/100/    bridge 440FX - 82441FX PMC [Natoma] - piirisarjan silta joka mahdollistaa komponenttien välisen kommunikaation
  - /0/100/1  bridge 82371SB PIIX3 ISA [Natoma/Triton II] - sama kuin yllä
    
Näiden syöttölaitteiden todellista entiteettiä en osannut päätellä:
  - /0/100/1/0 input PnP device PNP0303 - input kertoo että kyseessä syöttölaite esim. näppäimistö
  - /0/100/1/1 input PnP device PNP0f03 - sama kuin yllä
    
Seuraavien taas oletan liittyvän virtualboxin emuloimaan CD-ROM asemaan jolla ladattu ISO-tiedosto on voitu lukea
  - /0/100/1.1 scsi2 storage 82371AB/EB/MB PIIX4 IDE
  - /0/100/1.1/0.0.0    /dev/cdrom  disk 
  - /0/100/1.1/0.0.0/0  /dev/cdrom  disk
    
Ja seuraavat taas virtuaalikoneen "rautaa"
  -/0/100/2 /dev/fb0 display SVGA II Adapter - Näytönohjain
  - /0/100/3 enp0s3 network 82540EM Gigabit Ethernet Controller - verkkokortti
  - /0/100/4 input9 input VirtualBox mouse integration - virtuaalikoneen hiiren integraatio
  - /0/100/5 card0 multimedia  82801AA AC'97 Audio Controller - äänikortti
  - /0/100/6 bus KeyLargo/Intrepid USB 
  - /0/100/6/1 usb2 bus OHCI PCI host controller
  - /0/100/6/1/1 input6 input VirtualBox USB Tablet
  - /0/100/7 bridge 82371AB/EB/MB PIIX4 ACPI
  - /0/100/bbus 82801FB/FBM/FR/FW/FRW (ICH6 Family) USB2 EHCI Controller
  - /0/100/b/1 usb1  bus EHCI Host Controller
  - /0/100/d scsi0 storage 82801HM/HEM (ICH8M/ICH8M-E) SATA Controller [AHCI mode]
  - /0/100/d/0.0.0 /dev/sda disk 64GB VBOX HARDDISK - Virtuaalinen kiintolevy
  - /0/100/d/0.0.0/1 /dev/sda1 volume 51GiB EXT4 volume
  - /0/100/d/0.0.0/2 /dev/sda2  volume 8402MiB Linux swap volume
    
Ja viimeisten lähdekonetta en onnistunut arvioimaan.
  - /1  input0 input AT Translated Set 2 keyboard
  - /2                  input2      input Power Button
  - /3                  input3      input Video Bus
  - /4                  input4      input Sleep Button
  - /5                  input5      input ImExPS/2 Generic Explorer Mouse
  - /6                  input8      input PC Speaker

 

## 3. Apt. asenna kolme uutta komentoriviohjelmaa ke klo 23.00

Tämän tuli jo tehtyä kohdassa 2, mutta seuraavaksi paremman dokumentoinnin kanssa.

Aluksi googlailin hyviä/mielenkiintoisia vaihtoehtoja ja päädyin seuraaviin:

1. [tre](https://github.com/dduan/tre) joka listaa hakemiston suoraan puunäkymään
2. [khal](https://github.com/pimutils/khal) eli cli kalenteri
3. [Lolcat](https://github.com/busyloop/lolcat) eli väriä ruutuun (Dev 2023)

Asentaessa käytin seuraavia komentoja:

    sudo apt-get -y install tre-command khal
    sudo snap install lolcat
   
Lolcatia asentaessa tuli herja että snap komento on unknown joten kokeilin apt install lolcat, jolla asennus onnistui. Näin ollen senkin olisi voinut asentaa samanaikaisesti muiden ohjelmien kanssa.

(EDIT 30.01.2024 Lolcatin omassa asennusvihjeessä mainittiin snap-komennolla asentaminen, joten testasin asennusta ensin sillä).

   ![kuva_tre_khal_lolcat](https://github.com/syjaka/Linux-Palvelimet-2024/blob/main/images/kuva_tre_khal_lolcat.png)

Valmista keskiviikon osalta tuli to noin klo 01.50, eli keskiviikon työajaksi tuli pyöreästi 5h. Itsen toimenpiteet olivat suoraviivaisia, mutta tutkiminen, lisätietojen hakeminen ja aiheen ympäriltä opiskelu vei valtaosan ajasta.
    
## 4. FHS. Esittele kansiot, jotka on listattu "Command line basics revisited" kappaleessa "imprtant directories" to klo 11.01

  1. / : Juurihakemisto/pääkäyttäjän kotihakemisto. Tiedostostohierarkian ylin kansio joka sisältää kaikki tiedot

   ![d.1_kuva_juuri](https://github.com/syjaka/Linux-Palvelimet-2024/blob/main/images/d.1_kuva_juuri.png)
   
  2.  /home/ - Juurihakemistossa sijaitsevat kotihakemistot, sisältää kaikki käyttäjät. Käyttäjä voi viitata omaan kotihakemistoonsa ~
     merkillä ja muiden kotihakemistoon ~käyttäjä viittauksella.

  ![d.2_kuva_home](https://github.com/syjaka/Linux-Palvelimet-2024/blob/main/images/d.2_kuva_home.png)
  
  3. /home/kadi/ - /home hakemistossa sijaitseva käyttäjän oma kotihakemisto jossa kaikki käyttäjäkohtaiset määritykset ja data
     
  ![d.3_kuva_user_home](https://github.com/syjaka/Linux-Palvelimet-2024/blob/main/images/d.3_kuva_user_home.png)
  
  4. /etc/ - Juurihakemistossa sijaitseva /etc sisältää järjestelmän ja eri taustaprosessien asetukset.
      
  ![d.4_kuva_etc](https://github.com/syjaka/Linux-Palvelimet-2024/blob/main/images/d.4_kuva_etc.png)
  
  5. /media/ - Juurihakemistossa sijaitseva /media sisältää kaiken irroitettavan median, mm. usb-tikku, cdrom...
  
  ![d.5_kuva_media](https://github.com/syjaka/Linux-Palvelimet-2024/blob/main/images/d.5_kuva_media.png)
  
  6. /var/log/ - /var hakemistossa on järjestelmän ja sovellusten muuttuvien tietojen tallenteet. /var/log/ sisältää järjestelmän     
  lokitiedostot (linux.fi)

  ![d.6_kuva_varlog](https://github.com/syjaka/Linux-Palvelimet-2024/blob/main/images/d.6_kuva_varlog.png)

## 5. The friendly M. kuvaavie esimerkkejä grep-komennon käytöstä - to klo 12.00
grep- komennto on erinomainen etsintä/analysointityökalu. Tehtävää varten loin kotihakemistooni kansiot A-C, joihin lisäsin tiedoston komentajaPingviini.md.

(EDIT 30.01.2024. Kansioiden ja tiedostojen luonnin tein kotihakemistossani seuraavilla komennoilla:

    $ mkdir kansioA    # Loin kotihakemistoon  kansioA:n johon siirryin komennolla $ cd kansioA
    $ micro komentajaIngviini.md # Loin kansioA:han tiedoston komentajaPingviini.md, johon kopioin ja liitin yo tekstin. Poistuin: ctrl+q ja tallensin muutokset: Y
    $ cd # siirryin takaisin kotihakemistoom
    $ cp -r kansioA kansioB # kopioin kansioA sisältöineen samalla luotavaan kansioB:hen, samoin tein kansioC:n
    
    

komentajaPingviini.md-tiedosto sisälsi kaiken yllä kirjoityetun tekstin.

  1. Ensimmäinen haku oli

    grep -r "lähteet"

  joka ei tuottanut mitään tulosta. Kun lisäsin -i joka jättää kirjainkkoon huomiotta, sain tulokseksi juuri kuten piti. Lisäksi haussa ei ole hakemistopolkua, sillä tein haun siinä halkemistossa jonka halusin hakuun sisällyttää.
  
  ![e.1_lahteet](https://github.com/syjaka/Linux-Palvelimet-2024/blob/main/images/e.1_lahteet.png)

  2. Toinen haku oli "error" lokitiedostoihin.

    grep -r "error" //var/log

  Tämä antoi paljon "permission denied" -tuloksia joten lisäsin sudo-komennon, jolloin pääsy oli laajempi

  ![e.2_error](https://github.com/syjaka/Linux-Palvelimet-2024/blob/main/images/e.2_error.png)
     
  3. Viimeisen haun tein putkitettuna | less komennon kanssa, samalla tuli suoritettua f) tehtävä
     
    less /home/kadi/kansioC/komentajaPingviini.md | grep -i "luettavissa"
  ![e.2.f_luettavissa_putki](https://github.com/syjaka/Linux-Palvelimet-2024/blob/main/images/e.2.f_luettavissa_putki.png)

## g) Tukki, aiheuta lokiin kaksi eri tapahtumaa, analysoi loki - to klo 13.30

   1. Loin epäonnistuneen tapahtumalokin anatamalla väärän sudo-salasanan komennolle klo 13.35

    sudo journalctl

  Seuraavaksi annoin oikean salasanan jolloin komento toi koko lokitiedoston esiin. Käänsin komennon tulostamaan uusimman ensin
    
    sudo journalctl -r

  Tuloksena poimin lokista seuraavan rivin joka kuvaa epäonnistunuttta kirjautumisyritystä:

  ![g-2_journalctl_error](https://github.com/syjaka/Linux-Palvelimet-2024/blob/main/images/g-2_journalctl_error.png)

  1. Komennon aikaleima
  2. **pam_unix(sudo:auth): authentication failure;** - kertoo että autentikointi epäonnistui
  3. **logname= uid=1000 euid=0** kertoo käyttäjän idksi 1000 nikä viittaa ensimmäiseen käyttäjään; kadi 
  4. **euid=0** viittaa effective user id:hen ja luulen että arvo olisi 1000 jos kirjautuminen olisi autentikoitu
  5. **TTY=/dev/pts/1** viittaa terminaaliin jossa komento tehtiin ja pts virtuaaliterminaaliin
  6. ja loput viittaavat käyttäjätietoihin (Hess 2019)

  Seuraavaksi onnistunut tapahtuma, eli oikealla salasanalla sudo-komennon toteuttaminen:

  ![g.2_success](https://github.com/syjaka/Linux-Palvelimet-2024/blob/main/images/g.2_success.png)

  1. Komennon aikaleima
  2. **TTY=pts/5** ks yllä
  3. **PWD** viittaa hakemistoon jossa komento suoritettiin
  4. **USER=root** kertoo komennon suorittaneen käyttäjän käyttöoikeustasosta
  5. **COMMAND...** kertoo taas suorityetun komennon

Valmista tuli klo 15.00, eli torstaina aikaa kului noin 4 tuntia. Kokonaisuudessaan 9 tuntia.

### Lähteet:

Debian packages. Luettavissa: https://packages.debian.org/stable/allpackages, luettu: 24.01.2024

Dev, CLI tools you won't be able to live without, 2023. Luettavissa: https://dev.to/lissy93/cli-tools-you-cant-live-without-57f6, luettu: 24.01.2024

Geeks for Geeks lshw, 2019. Luettavissa: https://www.geeksforgeeks.org/lshw-command-in-linux-with-examples/, luettu: 24.01.2024

Ken Hess, Linux sysadmin basics 2019. Luettavissa: https://www.redhat.com/sysadmin/user-account-gid-uid, luettu: 25.01.2024 

linux.com lshw 2017. Luettavissa: https://www.linux.com/training-tutorials/deep-hardware-discovery-lshw-and-lsusb-linux/, luettu: 24.01.2024

linux.fi, hakemistorakenne, 2021. Luettavissa: https://www.linux.fi/wiki/Hakemistorakenne, luettu: 25.01.2024

Tero Karvinen, Command Palette, Cheatsheet, Run and Make - New Micro Editor Plugins, 2022. Luettavissa: https://terokarvinen.com/2022/command-palette-cheatsheet-run-and-make-micro/, luettu 25.01.2024 (EDIT 30.01.2024; lähde lisätty)

Tero Karvinen, Linux palvelimet alkukevät 2024 tehtävät. Luettavissa: https://terokarvinen.com/2024/linux-palvelimet-2024-alkukevat/#h2-komentaja-pingviini, luettu 24.01.2024

Tero Karvinen, Command line basics revisited. Luettavissa: https://terokarvinen.com/2020/command-line-basics-revisited/?fromSearch=command%20line%20basics%20revisited, luettu: 24.01.2024

(EDIT 30.01.2024: Lähteiden muotoja korjattu)


