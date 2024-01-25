# h2 Komentaja pingviini

## Keskeneräinen 

Tero Karvisen Linux palvelimet kurssin toisena [h2 tehtävänä](https://terokarvinen.com/2024/linux-palvelimet-2024-alkukevat/#h2-komentaja-pingviini) oli:
  x)  Tiivistää Karvisen [Command line basics revisited](https://terokarvinen.com/2020/command-line-basics-revisited/?fromSearch=command%20line%20basics%20revisited) artikkeli
  a) Asenna micro editori
  b) Listata testaamani koneen rauta
  c) Asentaa kolme uutta komentoriviohjelmaa
  d) Esitellä kansiot jotka on listattu kohdan 1. artikkelissa
  e) Esitellä 3 kuvaavaa esimerkkiä grip-komennosta
  f) Antaa esimerkki putkista
  g) Esitellä ja analysoida kaksi erilaista lokitapahtumaa.

## x) Command line basics revisited muutamalla sanalla

- pwd (print working directory) näyttää nykyisen hakemiston 
- ls listaa nykyisen hakemiston tiedot
- cd vaihtaa hakemistoa, esim.
    a) cd xx - siirtyy nykyisen hakemiston xx hakemistoon
    b) cd xx/yy siirtyy nykyisen/xx hakemiston yy hakemistoon
    c) cd siirtyy käyttäjän kotihakemistoon
    d) cd .. siirty aina yhden hakemiston ylös
- mkdir uusi kansio
- rmdir poista tyhjä kansio tai rm -r tyhjennä kansio jossa tavaraa tai rm xx poista xx-niminen kansio
- tabulaattori täydentää ja jos on monta vaihtoehtoa kaksi kertaa antaa vaihtoehdot mitä voisi täydentää.
- man ls näyttää ls komennon ohjeet
- sudo komennon edessä antaa sudo-oikeudet niitä vaativille komennoille tai hakemistoille, esim softan asennus/poisto, käyttäjien hallinta...
  
   ![kuva_sudo](https://github.com/syjaka/Linux-Palvelimet-2024/blob/main/images/kuva_sudo.png)
  
- sudo apt-get update päivittää ja näyttää saatavilla olevat softwarepaketit
- Materiaalisssa mainittu muutamien ohjelmien asennus joista tmux ja python3-py vaikutti kiinnostavalta myöhempää käyttöä varten.
    [python3-py](https://packages.debian.org/stable/python3-py) (1.11.0-1) - Advanced Python development support library (Python 3)
    [tmux](https://packages.debian.org/stable/tmux) (3.3a-3)terminal multiplexer

## a). Asenna micro-editori - ke klo 20.45


Aloitin ao. komennolla joka haki päivitti ja näytti saatavilla olevat paketit.
    
    $ sudo apt-get update
 Seuraavaksi asennus komennolla:
    
    $ sudo apt-get -y install micro fzf pythonpy git exuberant-ctags
Koska olin jo eilen harjoitellessa asentanut micron sain seuraavan vastauksen:
   - micro is already the newest version (2.0.11-2+b1)
mutta koska kopioin kokonaisuudessaan opettajan esimerkin komennon, tuli samalla asennettua muutakin. Eli asennus jatkui asennus seuraavanlaisesti:

  ![kuva micro asennus](https://github.com/syjaka/Linux-Palvelimet-2024/blob/main/images/kuva_micro_asennus.png)

Ao. lisäpaketit tuli asennettua
  - [fzf](https://packages.debian.org/stable/fzf) (0.38.0-1+b1), general-purpose command-line fuzzy finder
  - [pythonpy](https://packages.debian.org/stable/pythonpy) (0.4.11b-3.1) - 'python -c', with tab completion and shorthand (debian packages website)
  - [git](https://github.com/git-guides/install-git) (2.39.2) - distributed version control software (github, git guides)
  - [exuberant-ctags](https://packages.debian.org/stable/exuberant-ctags) (1:5.9~svn20110310-18) build tag file indexes of source code definitions
  - Jatkoin vielä opettajan suosittelemilla plugineilla:

   ![kuva_pluginit](https://github.com/syjaka/Linux-Palvelimet-2024/blob/main/images/kuva_pluginit.png)

Seuraavaksi kokeilut että asennukset toimii:
    
    $ micro kadi.py 
Yo. komento  ja F1 - ei tuonut cheatsheettiä näkyviin. Koikeilin myös googlata olisiko jokin muu näppäin macillä osuva, tuloksetta
 
  Run toimi odotetusti:
    ![kuva_hello_kadi](https://github.com/syjaka/Linux-Palvelimet-2024/blob/main/images/kuva_hello_kadi.png)

  Palettero toimi ja vaikuttaa hyödylliseltä
    ![kuva_palettero](https://github.com/syjaka/Linux-Palvelimet-2024/blob/main/images/kuva_palettero.png)
      
valmista oli muutamassa minuutissa, mutta kaiken lisätiedon hankinta ja kokeilut ennen ja jälkeen kesti 22.00 saakka.

## b). Listaa rauta - ke klo 22.10 

  ![kuva_lshw-not](https://github.com/syjaka/Linux-Palvelimet-2024/blob/main/images/kuva_lshv-not.png)
Ensimmäiseksi lshw asennus komennolla

    $ sudo apt-get install lshw
Komennolla (sudo lshw = ls hardware -short = tulostaa yhteenvedon joka noudattaa tietokoneen välylärakennetta (bus) -sanitize = poistaa kaiken arkaluontoisen kuten sarjanumerot tms (geeksforgeeks, linux.com)

    $ sudo lshw - short - sanitize
  
tulee listaus:

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
  - 0/        VirtualBox  -- /0 kuvaa raudan emolevyä eli ensimmäistä pääkomponenttia. tässä tapauksessa virtualBox

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
Ja viiemisten lähdekonetta en onnistunut arvioimaan.
  - /1  input0 input AT Translated Set 2 keyboard
  - /2                  input2      input Power Button
  - /3                  input3      input Video Bus
  - /4                  input4      input Sleep Button
  - /5                  input5      input ImExPS/2 Generic Explorer Mouse
  - /6                  input8      input PC Speaker

 

## c) Apt. asenna kolme uutta komentoriviohjelmaa ke klo 23.00

Tämän taisin jo "vahingossa tehdä kohdassa 2, mutta koska kertaus on opintojen äiti niin harjoitellaan lisää.

Aluksi googlailin hyviä/mielenkiintoisia vaihtoehtoja ja päädyin seuraaviin:

1. [tre](https://github.com/dduan/tre) joka listaa hakemiston suoraan puunäkymään
2. [khal](https://github.com/pimutils/khal) eli cli kalenteri
3. [Lolcat](https://github.com/busyloop/lolcat) eli väriä ruutuun (Dev)

Ensimmäiset kaksi asensin komennoilla:

    sudo apt-get -y install tre-command khal
    sudo snap install lolcat
   
   
Lolcatia asentaessa tuli herja että snap komento on unknown joten kokeilin apt install lolcat, jolla asennus onnistui. Näin ollen senkin olisi voinut asentaa samanaikaisesti muiden ohjelmien kanssa

   ![kuva_tre_khal_lolcat](https://github.com/syjaka/Linux-Palvelimet-2024/blob/main/images/kuva_tre_khal_lolcat.png)

Valmista keskiviikon osalta tuli to noin klo 01.50, eli keskiviikon työajaksi tuli pyöreästi 5h. Itsen toimenpiteet olivat suoraviivaisia, mutta tutkiminen, lisätietojen hakeminen ja aiheen ympäriltä opiskelu vei valtaosan ajasta.
    
## d) FHS. Esittele kansiot, jotka on listattu "Command line basics revisited" kappaleessa "imprtant directories". Näytä kuvaava esimerkki kunkin tärkeän kansion sisältämästä tiedostosta tai kansiosta. Jos kyseessä on tiedosto, näytä siitä kuvaava esimerkkirivi. Työskentele komentokehotteessa ja näytä komennot, joilla etsit esimerkit. to klo 11.01

  1. / : Juurihakemisto/pääkäyttäjän kotihakemisto. Tiedostostohierarkian ylin kansio joka sisältää kaikki tiedot

   ![d.1_kuva_juuri]()
  2.  /home/ - Juurihakemistossa sijaitsevat kotihakemistot, sisältää kaikki käyttäjät. Käyttäjä voi viitata omaan kotihakemistoonsa ~
     merkillä ja muiden kotihakemistoon ~käyttäjä viittauksella.

  ![d.2_kuva_home]()
  3. /home/kadi/ - /home hakemistossa sijaitseva käyttäjän oma kotihakemisto jossa kaikki käyttäjäkohtaiset määritykset ja data
     
  ![d.3_kuva_user_home]()
  4. /etc/ - Juurihakemistossa sijaitseva /etc sisältää järjestelmän ja eri taustaprosessien asetukset.
      
  ![d.4_kuva_etc]()
  5. /media/ - Juurihakemistossa sijaitseva /media sisältää kaiken irroitettavan median, mm. usb-tikku cdrom...
  
  ![d.5_kuva_media]()
  6. /var/log/ - /var hakemistossa on järjestelmän ja sovellusten muuttuvien tietojen tallenteet. /var/log/ sisältää järjestelmän     
  lokitiedostot (linux.fi)

  ![d.6_kuva_varlog]()

## e) The friendly M. kuvaavie esimerkkejä grep-komennon käytöstä - to klo 12.00
grep- komennto on erinomainen etsintä/analysointityökalu. Tehtävää varten loin kotihakemistooni kansiotA-C joihin kopioin tiedostoon komentajaPingviini kaiken nyt kirjoittamani tekstin tekstin.
  1. Ensimmäinen haku oli

    grep -r "lähteet"

  joka ei tuottanut mitään tulosta. Kun lisäsin -i joka ignooraa kirjainkoon, sain tulokseksi juuri kuten piti. Lisäksi haussa ei ole hakemistopolkua, sillä tein haun siinä halkemistossa jinka halusin hakuun sisällyttää.
  
  ![e.1_lahteet]()

  2. Toinen haku oli "error" lokitiedostoihin.

    grep -r "error" //var/log

  Tämä antoi paljon "permission denied" -tuloksia joten lisäsin sudo-komennon, jolloin pääsy oli laajemmin eri tiedostoihin

  ![e.2_error]()
     
  3. Viimeisen haun tein putkitettuna | less komennon kanssa, samalla tuli suoritettua f) tehtävä
     
    less /home/kadi/kansioC/komentajaPingviini.md | grep -i "luettavissa"
  ![e.2.f_luettavissa_putki]()

## g) Tukki, aiheuta lokiin kaksi eri tapahtumaa, analysoi loki - to klo 13.30

   1. Loin epäonnistuneen tapahtumalokin anatamalla väärän sudo-salasanan komennolle klo 13.35

    sudo journalctl

  Seuraavaksi annoin oikean salasanan jolloin komento toi koko lokitiedoston esiin. Käänsin komennon tulostamaan uusimman ensin
    
    sudo journalctl -r

  Tuloksena poimin lokista seuraavan rivin:

  ![g-2_journalctl_error]()

  1. Heti ensimmäiseksi on komennon aikaleima
  2. **pam_unix(sudo:auth): authentication failure;** - kertoo että autentikointi epäonnistui
  3. **logname= uid=1000 euid=0** kertoo käyttäjän idksi 1000 nikä viittaa ensimmäiseen käyttäjään; kadi (Hass)
  4. **euid=0** viittaa effective user id:hen ja luulen että arvo olisi 1000 jos kirjautuminen olisi autentikoitu
  5. **TTY=/dev/pts/1** viittaa terminaaliin jossa komento tehtiin ja pts virtuaaliterminaaliin
  6. ja loput viittaavat käyttäjätietoihin

  Seuraavaksi onnistunut tapahtuma, eli oikealla salasanalla sudo-komennon toteuttaminen

  ![g.2_success]()

  1. Heti ensimmäiseksi on komennon aikaleima
  2. **TTY=pts/5** ks yllä
  3. **PWD** hakemistoon jossa komento suoritettiin
  4. **USER=root** kertoo komennon suorittaneen käyttäjän käyttöoikeustasosta
  5. **COMMAND...** kertoo taas suorityetun komennon



### Lähteet:
Tero Karvinen, Linux palvelimet alkukevät 2024 tehtävät. Luettavissa: https://terokarvinen.com/2024/linux-palvelimet-2024-alkukevat/#h2-komentaja-pingviini, luettu 24.01.2024

Tero Karvinen, Command line basics revisited. Luettavissa: https://terokarvinen.com/2020/command-line-basics-revisited/?fromSearch=command%20line%20basics%20revisited, luettu: 24.01.2024

Github/EeroSav LinuxPalvelimet Tehtävä 2. Luettavissa: https://github.com/EeroSav/LinuxPalvelimet/blob/main/T2.md, luettu: 24.01.2024

Debian packages. Luettavissa: https://packages.debian.org/stable/allpackages, luettu: 24.01.2024

Dev, CLI tools you won't be able to live without. Luettavissa: https://dev.to/lissy93/cli-tools-you-cant-live-without-57f6, luettu: 24.01.2024

GitHub GitGuides. Luettavissa distributed version control software, luettu: 24.01.2024

Geeks for Geeks lshw, luettavissa https://www.geeksforgeeks.org/lshw-command-in-linux-with-examples/, luettu: 24.01.2024

linux.com lshw, luettavissa https://www.geeksforgeeks.org/lshw-command-in-linux-with-examples/, luettu: 24.01.2024

linux.fi hakemistorakenne, luettavissa: https://www.linux.fi/wiki/Hakemistorakenne, luettu: 25.01.2024

Ken Hess, Linux sysadmin basics 2019. Luettavissa https://www.redhat.com/sysadmin/user-account-gid-uid, luettu: 25.01.2024 



## ei tyhmiä kysymyksiä olekaan vai?
1. Ymmärsinkö oikein, että syslog on jos on raudalla ja journal koska virtuaali?
![](https://github.com/syjaka/Linux-Palvelimet-2024/blob/main/images/Q1.png)
2. Näyttökuvien lisääminen työlästä (napata, nimetä, ladata, linkittää)vai laitanko vain liikaa, pystytkö näyttää miten sen teit?
3. Micro cheatsheet ???
