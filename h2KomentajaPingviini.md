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
    
    $ sudo apt-get -y install micro 
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

valmista oli muutamassa minuutissa, mutta kaiken lisätiedon hankinta ennen ja jälkeen kesti 



### Lähteet:
Tero Karvinen, Linux palvelimet alkukevät 2024 tehtävät. Luettavissa: https://terokarvinen.com/2024/linux-palvelimet-2024-alkukevat/#h2-komentaja-pingviini, luettu 24.01.2024
Tero Karvinen, Command line basics revisited. Luettavissa: https://terokarvinen.com/2020/command-line-basics-revisited/?fromSearch=command%20line%20basics%20revisited, luettu 24.01.2024
Github/EeroSav LinuxPalvelimet Tehtävä 2. Luettavissa: https://github.com/EeroSav/LinuxPalvelimet/blob/main/T2.md, luettu 24.01.2024
Debian packages. Luettavissa: https://packages.debian.org/stable/allpackages, luettu 24.01.2024
GitHub GitGuides. Luettavissa distributed version control software, luettu 24.01.2024

## ei tyhmiä kysymyksiä olekaan vai?
1. Ymmärsinkö oikein, että syslog on jos on raudalla ja journal koska virtuaali?
   kuva Q1
   ![](https://github.com/syjaka/Linux-Palvelimet-2024/blob/main/images/system_journal.png)
2. Näyttökuvien lisääminen työlästä (napata, nimetä, ladata, linkittää)vai laitanko vain liikaa, pystytkö näyttää miten sen teit
