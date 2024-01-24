# h2 Komentaja pingviini

## Keskeneräinen 

Tero Karvisen Linux palvelimet kurssin toisena [h2 tehtävänä] (https://terokarvinen.com/2024/linux-palvelimet-2024-alkukevat/#h2-komentaja-pingviini) oli:
  1. Tiivistää Karvisen [Command line basics revisited] (https://terokarvinen.com/2020/command-line-basics-revisited/?fromSearch=command%20line%20basics%20revisited) artikkeli
  2. Asenna micro editori
  3. Listata testaamani koneen rauta
  4. Asentaa kolme uutta komentoriviohjelmaa
  5. Esitellä kansiot jotka on listattu kohdan 1. artikkelissa
  6. Esitellä 3 kuvaavaa esimerkkiä grip-komennosta
  7. Antaa esimerkki putkista
  8. Esitellä ja analysoida kaksi erilaista lokitapahtumaa.

## 1 Command line basics revisited muutamalla sanalla

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
  
    kuva sudo
  
- sudo apt-get update päivittää ja näyttää saatavilla olevat softwarepaketit
- Materiaalisssa mainittu muutamien ohjelmien asennus joista tmux ja python3-py vaikutti kiinnostavalta myöhempää käyttöä varten.
    [python3-py](https://packages.debian.org/stable/python3-py) (1.11.0-1) - Advanced Python development support library (Python 3)
    [tmux](https://packages.debian.org/stable/tmux) (3.3a-3)terminal multiplexer

## 2. Asenna micro-editori
Tehtävän aloitus klo 20.45
Aloitin komennolla
    
    $ sudo apt-get update
joka haki päivitti ja näytti saatavilla olevat paketit. Seuraavaksi komennolla:
    
    $ sudo apt-get -y install micro fzf pythonpy git exuberant-ctags
Koska olin jo eilen harjoitellessa asentanut micron sain seuraavan vastauksen:
    micro is already the newest version (2.0.11-2+b1)
mutta koska kn opettajan komento jossa samalla asennettiin muutakin jatkui asennus seuraavanlaisesti:

  kuva micro asennus

eli ao lisäpaketit tuli asennettua
[fzf](https://packages.debian.org/stable/fzf) (0.38.0-1+b1), general-purpose command-line fuzzy finder
[pythonpy](https://packages.debian.org/stable/pythonpy) (0.4.11b-3.1) - 'python -c', with tab completion and shorthand (debian packages website)
[git](https://github.com/git-guides/install-git) (2.39.2) - distributed version control software (github, git guides)
[exuberant-ctags](https://packages.debian.org/stable/exuberant-ctags) (1:5.9~svn20110310-18) build tag file indexes of source code definitions
Jatkoin vielä opettajan suosittelemilla plugineilla:

   kuva pluginit

Seuraavaksi kokeilut:
    
    $ micro kadi.py 
  ja F1 - ei tuonut cheatsheettiä näkyviin. Koikeilin myös googlata olisiko jokin muu näppäin macillä osuva, tuloksetta
  Run toimi odotetusti:
    kuva_hello_kadi

  Palettero toimi ja vaikuttaa hyödylliseltä
    kuva_palettero
      
valmista oli muutamassa minuutissa, mutta kaiken lisätiedon hankinta ja kokeilut ennen ja jälkeen kesti 22.00 saakka.

## 3. Listaa rauta - aloitus 22.10

kuva_lshw-not
Ensimmäiseksi lshw asennus komennolla

    $ sudo apt-get install lshw
Komennolla (sudo lshw = ls hardware -short = tulostaa yhteenvedon joka noudattaa tietokoneen välylärakennetta (bus) -sanitize = poistaa kaiken arkaluontoisen kuten sarjanumerot tms (geeksforgeeks, linux.com)

    $ sudo lshw - short - sanitize
  
tulee listaus:

kuva_lshw

H/W path sarake kuvaa laiteistopolkua eli kyseisen laitteiston fyysistä sijaintia 

Device sarake näyttää laitteita, esim USB, kovalevyt...

Class sarake kuvaa laitteiden luokat esim tallennuslaitteet, syöttölaitteet, väylät.

decription kuvaa kyseistä laitetta.

Alle listaukseen olen lisännyt lisää analyysiä kustakin laitteesta.
VirtualBox  -- /0 kuvaa raudan emolevyä eli ensimmäistä pääkomponenttia. tässä tapauksessa virtualBox 
/0/0                            memory      128KiB BIOS -- /0/0 kuvaa ekan pääkomponentin ekaa alikomponenttia. Kyseessä BIOS-muisti kooltaan                                                128 KiB
/0/1                            memory      4GiB System memory kuvaa virtuaalikoneelle allokoitua RAMia
/0/2                            processor   Intel(R) Core(TM) i5-7Y54 CPU @ 1.20GHz - Tämä on virtuaalikoneelleni suotu prosessorimäärä ja koko
/0/100                          bridge      440FX - 82441FX PMC [Natoma] - piirisarjan silta joka mahdollistaa komponenttien välisen                                                         kommunikaation
/0/100/1                        bridge      82371SB PIIX3 ISA [Natoma/Triton II]
/0/100/1/0                      input       PnP device PNP0303
/0/100/1/1                      input       PnP device PNP0f03
/0/100/1.1          scsi2       storage     82371AB/EB/MB PIIX4 IDE
/0/100/1.1/0.0.0    /dev/cdrom  disk        CD-ROM
/0/100/1.1/0.0.0/0  /dev/cdrom  disk        
/0/100/2            /dev/fb0    display     SVGA II Adapter
/0/100/3            enp0s3      network     82540EM Gigabit Ethernet Controller
/0/100/4            input9      input       VirtualBox mouse integration
/0/100/5            card0       multimedia  82801AA AC'97 Audio Controller
/0/100/6                        bus         KeyLargo/Intrepid USB
/0/100/6/1          usb2        bus         OHCI PCI host controller
/0/100/6/1/1        input6      input       VirtualBox USB Tablet
/0/100/7                        bridge      82371AB/EB/MB PIIX4 ACPI
/0/100/b                        bus         82801FB/FBM/FR/FW/FRW (ICH6 Family) USB2 EHCI Controller
/0/100/b/1          usb1        bus         EHCI Host Controller
/0/100/d            scsi0       storage     82801HM/HEM (ICH8M/ICH8M-E) SATA Controller [AHCI mode]
/0/100/d/0.0.0      /dev/sda    disk        64GB VBOX HARDDISK
/0/100/d/0.0.0/1    /dev/sda1   volume      51GiB EXT4 volume
/0/100/d/0.0.0/2    /dev/sda2   volume      8402MiB Linux swap volume
/1                  input0      input       AT Translated Set 2 keyboard
/2                  input2      input       Power Button
/3                  input3      input       Video Bus
/4                  input4      input       Sleep Button
/5                  input5      input       ImExPS/2 Generic Explorer Mouse
/6                  input8      input       PC Speaker






### Lähteet:
Tero Karvinen, Linux palvelimet alkukevät 2024 tehtävät. Luettavissa: https://terokarvinen.com/2024/linux-palvelimet-2024-alkukevat/#h2-komentaja-pingviini, luettu 24.01.2024
Tero Karvinen, Command line basics revisited. Luettavissa: https://terokarvinen.com/2020/command-line-basics-revisited/?fromSearch=command%20line%20basics%20revisited, luettu 24.01.2024
Github/EeroSav LinuxPalvelimet Tehtävä 2. Luettavissa: https://github.com/EeroSav/LinuxPalvelimet/blob/main/T2.md, luettu 24.01.2024
Debian packages. Luettavissa: https://packages.debian.org/stable/allpackages, luettu 24.01.2024
GitHub GitGuides. Luettavissa distributed version control software, luettu 24.01.2024
Geeks for Geeks lshw, luettavissa https://www.geeksforgeeks.org/lshw-command-in-linux-with-examples/. Luettu 24.01.2024
linux.com lshw, luettavissa https://www.geeksforgeeks.org/lshw-command-in-linux-with-examples/. Luettu 24.01.2024

## ei tyhmiä kysymyksiä olekaan vai?
1. Ymmärsinkö oikein, että syslog on jos on raudalla ja journal koska virtuaali?
   kuva Q1
   ![](https://github.com/syjaka/Linux-Palvelimet-2024/blob/main/images/system_journal.png)
2. Näyttökuvien lisääminen työlästä (napata, nimetä, ladata, linkittää)vai laitanko vain liikaa, pystytkö näyttää miten sen teit?
3. Micro cheatsheet ???
