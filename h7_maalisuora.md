# Keskeneräinen

# Maalisuora

Tämän viikon kotitehtävässä tuli ensiksi kääntää "Hei maailma" haluamalleni kielelle ja sen jälkeen laittaa linuxiin uusi komento joka ajaa tuon tervehdyksen kaikkien käyttäjien toimesta. Tämän jälkeen tuli ratkaista arvioitava labraharjotus ja viimeiseksi valmistella uusi tyhjä virtuaalikone tietyin sallituin lisäyksin. (Karvinen 2024, a)

- a) [Käännä "Hei Maailma"](https://github.com/syjaka/Linux-Palvelimet-2024/blob/main/h7_maalisuora.md#a-k%C3%A4%C3%A4nn%C3%A4-hei-maailma)
- b( [ Laita Linuxiin uusi komento niin, että kaikki käyttäjät voivat ajaa sitä.](https://github.com/syjaka/Linux-Palvelimet-2024/edit/main/h7_maalisuora.md#b-seuraavaksi-tein-pienen-uuden-skriptin-ja-asetin-sen-kaikkien-saataville)
- c) [Ratkaise labratehtävä](https://github.com/syjaka/Linux-Palvelimet-2024/blob/main/h7_maalisuora.md#c-labrateht%C3%A4v%C3%A4n-ratkaisua)
- d) [Asenna tyhjä virtuaalikone]()
- y)[ Työskentely-ympäristö](https://github.com/syjaka/Linux-Palvelimet-2024/new/main#y)
- z)[Alkutoimenpiteet](https://github.com/syjaka/Linux-Palvelimet-2024/blob/main/h7_maalisuora.md#z)

---

## y)

  - Tehtävä toteutettiin MacBook Retina 12-inch, koneella jossa host OS on Ventura 13.6.1 käyttöjärjestelmä Suomen maa-asetuksilla ja suomen kielellä. Koneessa on 1,3GHz kaksiytiminen Intel Core i5 prosessori ja 8Gt 1867 MHz LPDDR3 muistia. Näytönohjain on Intel HD Graphics 615 jossa VRAM 1536 Mt.
  - Guest OS on Debian GNU/Linux 12 (bookworm) joka pyörii Virtual Boxin 7.0 versiossa. Debianilla on tallennustilaa 60MB ja muistia 4096MB.

---

## z)

 1. Virtualboxin käynnistys
 2. Debian virtuaalikoneen käynnistys

---

## a) Käännä hei maailma

Tehtävän suoritus 17.05 - ja valmista oli 18.25 UTC+3. Lähteenä on käytetty Tero Karvisen 05.03.2024 luentomuistiinpanoja, sekä tekstissä erikseen mainittuja lähteitä.
Päätin koikeilla tehtävää muutamalla tutulla ja yhdellä minulle vieraamalla kielellä
  
  1. Python on yksinkertaisin ja tallennan tämä tiedostoon `pythonmoikkaa.py`
     
   > - `micro pythonmoikkaa.py` luo .py tiedoston
   > - `python3 pythonmoikkaa.py` kääntää kyseisen tiedoston
  2. Tallensin lyhyen java-pätkän `mkdir java`-komennolla luomaani java-hakemiston tiedostoon `javamoikkaa.java` (tim 2024)

   > ![7.001_java](https://github.com/syjaka/Linux-Palvelimet-2024/blob/main/images/7.001_java.png)
   > Javan kääntämiseen tarvitaan OpenJDK-paketti 
   > `sudo apt-get update` ja `sudo apt install openjdk-21-jdk` asensivat paketin (tim 2024).
   > Tämä kuitenkin tarjosi herjan kuten alla joten päädyin kokeilemaan aiempaa versiota paketista (AskUbuntu 2023).
   > ![7.002_unable_jdk](https://github.com/syjaka/Linux-Palvelimet-2024/blob/main/images/7.002_unable_jdk.png)
   > `sudo apt install openjdk-17-jdk` toimi.

   >  Asennuksen jälkeen testasin lopputulosta. `java - version` ja `javac -version` paljastivat että asennuus oli onnistunut (tim 2024)
   > ![7.003_java_version](https://github.com/syjaka/Linux-Palvelimet-2024/blob/main/images/7.003_java_version.png)

   > Komennolla `java JavaMoikkaa` suoritin tiedoston ja lopputulos oli toivottu
   > ![7.004_java_javamoikkaa](https://github.com/syjaka/Linux-Palvelimet-2024/blob/main/images/7.004_java_javamoikkaa.png)

  3. C++:aa varten tuli asentaa GCC kääntäjä, jos olisin aloittanut tästä olisin huomannut että tämä olisi voinut hoitaa myös Javan käännöksen (linuxwiki 2021)
  > Ensin loin `mkdir cpp` ja `micro cppmoikkaa.cpp`
  > ![7.006_cpp_moikkaa_file](https://github.com/syjaka/Linux-Palvelimet-2024/blob/main/images/7.006_cpp_moikkaa_file.png)
  
  > `sudo apt install build-essential` asentaa build-essential paketit jotka sisältävät myös GCC-kääntäjän
  >  `gcc --version` tulostaa juuri asennetun sisällön (geeksforgeeks 2021)
  > ![ 7.005_GCC_installed](https://github.com/syjaka/Linux-Palvelimet-2024/blob/main/images/7.005_GCC_installed.png)
  > `g++ cppmoikkaa.cpp` kääntää ja linkkaa cppmoikkaa.cpp-tiedoston luodakseen kohdetiedoston a.out nykyiseen hakemistoon
  > `./a.out` suorittaa kyseisen tiedoston joka siis kääntää ja suorittaa luodun C++ scriptin 
  > ![7.007_cpp_toimii](https://github.com/syjaka/Linux-Palvelimet-2024/blob/main/images/7.007_cpp_toimii.png)
  > Tämä osio vei selkeästi suurimman osan työskentelyajasta 

[takaisin ylös](https://github.com/syjaka/Linux-Palvelimet-2024/blob/main/h7_maalisuora.md#maalisuora)

---

## b) Seuraavaksi tein pienen uuden skriptin ja asetin sen kaikkien saataville

Tehtävän suoritus alkoi 20.45 ja päättyi 21.14 UTC+3. Tehtävän suorituksessa on käytetty Tero Karvisen 05.03.2024 luentomuistiinpanojani.

  - Alkuun loin komennon
  > `mkdir pythonit` loin hakemiston python ohjelmille
  > `micro hellurei.py` loin hellurei nimisen python tiedoston
  > tallensin tiedostoon python-pätkän
  > ![7.101_hellurei_py](https://github.com/syjaka/Linux-Palvelimet-2024/blob/main/images/7.008_hellurei_py.png)
  - Sitten asetin luodun komennon kaikkien käyttöön kaikkialla
  > Lisäsin hellurei.py-tiedostoon #!-polun joka määrittää että komento ajetaan Bashilla.
  > ![7.102_hash_bang_added](https://github.com/syjaka/Linux-Palvelimet-2024/blob/main/images/7.102_hash_bang_added.png)
  > Annoin kaikille käyttäjille tarvittavat oikeudet komennolla `chmod ugo+rx hellurei.py`
  > Kopioin tiedoston kaikkien saataville `sudo cp hellurei.py /usr/local/bin/`
  > Lopputuloksena muutkin käyytäjät saavat tiedoston ajettua
  > ![7.103_testaaja_testaa](https://github.com/syjaka/Linux-Palvelimet-2024/blob/main/images/7.103_testaaja_testaa.png)

[takaisin ylös](https://github.com/syjaka/Linux-Palvelimet-2024/blob/main/h7_maalisuora.md#maalisuora)
  
---

## c) Labratehtävän ratkaisua

- Aloitin tutustumalla vaihtoehtoihin Karvisen [sivulla](https://terokarvinen.com/search/?q=arvioitava)
- Valitsin tehtäväksi [Kippo Oy:n tietohallintojohtajan nakkikimaran](https://terokarvinen.com/2021/final-lab-for-linux-server-course-linux-palvelimet-ict4tn021-3016/?fromSearch=arvioitava).
- Teen varsinaisen tehtäväraportin toiseen tiedostoon [Kippo OY]() ja kirjaan tähän vain tehtävässä vaaditut seikat




Lähteet:

Ask Ubuntu 2023. Luettavissa: https://askubuntu.com/questions/1302427/unable-to-locate-package-openjdk-15-jdk. Luettu 05.03.2024

GeeksForGeeks, How to Install GCC Compiler on Linux? 2021. Luettavissa https://www.geeksforgeeks.org/how-to-install-gcc-compiler-on-linux/. Luettu 05.03.2021

Karvinen T, Linux Palvelimet alkukevät 2024. Luettavissa https://terokarvinen.com/2024/linux-palvelimet-2024-alkukevat/#h7-maalisuora. Luettu 05.03.2024

Jyväskylän ylipisto, JDK 2024. Luettavissa https://tim.jyu.fi/lecture/kurssit/tie/ohj2/tyokalut/JavaSDK#bjc3l73UZCrF. Luettu 05.03.2024

Linux.fi/wiki, GCC 2021. Luettavissa: https://www.linux.fi/wiki/GCC. Luettu 05.03.2024.

StackOverflow, How to compile C++ under Ubuntu Linux? Luettavissa: https://stackoverflow.com/questions/1696300/how-to-compile-c-under-ubuntu-linux. Luettu 05.03.2024

Tärmä L. 2023, h13 Hello World. Luettavissa: Tero Karvinen, Linux Palvelimet alkukevät 2024. Luettavissa https://terokarvinen.com/2024/linux-palvelimet-2024-alkukevat/#h7-maalisuora. Luettu 05.03.2024. Luettu 05.02.2024

  
  
  
  
