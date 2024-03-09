# Keskeneräinen

# h_7 Maalisuora

Tämän viikon kotitehtävässä tuli ensiksi kääntää "Hei maailma" haluamalleni kielelle ja sen jälkeen laittaa linuxiin uusi komento joka ajaa tuon tervehdyksen kaikkien käyttäjien toimesta. Tämän jälkeen tuli ratkaista arvioitava labraharjotus ja viimeiseksi valmistella uusi tyhjä virtuaalikone tietyin sallituin lisäyksin. (Karvinen 2024, a)

- a) [Käännä "Hei Maailma"](https://github.com/syjaka/Linux-Palvelimet-2024/blob/main/h7_maalisuora.md#a-k%C3%A4%C3%A4nn%C3%A4-hei-maailma)
- b( [ Laita Linuxiin uusi komento niin, että kaikki käyttäjät voivat ajaa sitä.](https://github.com/syjaka/Linux-Palvelimet-2024/blob/main/h7_maalisuora.md#b-seuraavaksi-tein-uuden-skriptin-ja-asetin-sen-kaikkien-saataville)
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

Tehtävän suoritus alkoi tiistaina 05.03 klo 17.05 ja valmista oli 18.25 UTC+3. Lähteenä on käytetty Tero Karvisen 05.03.2024 luentomuistiinpanoja, sekä tekstissä erikseen mainittuja lähteitä.
Päätin koikeilla tehtävää muutamalla tutulla ja yhdellä minulle vieraamalla kielellä.
  
  1. Python on yksinkertaisin ja tallennan tämä tiedostoon `pythonmoikkaa.py`
     
   > - `micro pythonmoikkaa.py` luo .py tiedoston
   > - `python3 pythonmoikkaa.py` kääntää kyseisen tiedoston
  2. Java oli myös ennestään tuttu. Loin lyhyen java-pätkän `mkdir java`-komennolla luomaani java-hakemiston tiedostoon `javamoikkaa.java`.

   > ![7.001_java](https://github.com/syjaka/Linux-Palvelimet-2024/blob/main/images/7.001_java.png)
   > Javan kääntämiseen tarvitaan OpenJDK-paketti 
   > `sudo apt-get update` ja `sudo apt install openjdk-21-jdk` asensivat paketin (tim 2024).
   > Tämä kuitenkin tarjosi herjan kuten alla joten päädyin kokeilemaan aiempaa versiota paketista (AskUbuntu 2023).
   > ![7.002_unable_jdk](https://github.com/syjaka/Linux-Palvelimet-2024/blob/main/images/7.002_unable_jdk.png)
   > `sudo apt install openjdk-17-jdk` toimi.

   >  Asennuksen jälkeen testasin lopputulosta. `java - version` ja `javac -version` paljastivat että asennuus oli onnistunut (tim 2024).
   > ![7.003_java_version](https://github.com/syjaka/Linux-Palvelimet-2024/blob/main/images/7.003_java_version.png)

   > Komennolla `java JavaMoikkaa` suoritin tiedoston ja lopputulos oli toivottu
   > ![7.004_java_javamoikkaa](https://github.com/syjaka/Linux-Palvelimet-2024/blob/main/images/7.004_java_javamoikkaa.png)

  3. C++ oli minulle vieras kieli. Sitä varten tuli asentaa GCC kääntäjä, jos olisin aloittanut tästä olisin huomannut että tämä olisi voinut hoitaa myös Javan käännöksen (linuxwiki 2021).
  > Ensin loin `mkdir cpp` ja `micro cppmoikkaa.cpp`
  > ![7.006_cpp_moikkaa_file](https://github.com/syjaka/Linux-Palvelimet-2024/blob/main/images/7.006_cpp_moikkaa_file.png) (w3schools)
  >
  > `sudo apt install build-essential` asentaa build-essential paketit jotka sisältävät myös GCC-kääntäjän
  >  `gcc --version` tulostaa juuri asennetun sisällön (geeksforgeeks 2021)
  > ![ 7.005_GCC_installed](https://github.com/syjaka/Linux-Palvelimet-2024/blob/main/images/7.005_GCC_installed.png)
  > `g++ cppmoikkaa.cpp` kääntää ja linkkaa cppmoikkaa.cpp-tiedoston luodakseen kohdetiedoston a.out nykyiseen hakemistoon
  > `./a.out` suorittaa kyseisen tiedoston joka siis kääntää ja suorittaa luodun C++ scriptin 
  > ![7.007_cpp_toimii](https://github.com/syjaka/Linux-Palvelimet-2024/blob/main/images/7.007_cpp_toimii.png)
  > Tämä osio vei selkeästi suurimman osan työskentelyajasta a-tehtävässä.

[takaisin ylös](https://github.com/syjaka/Linux-Palvelimet-2024/blob/main/h7_maalisuora.md#h_7-maalisuora)

---

## b) Seuraavaksi tein uuden skriptin ja asetin sen kaikkien saataville

Tehtävän suoritus alkoi 20.45 ja päättyi 21.14 UTC+3. Tehtävän suorituksessa on käytetty Tero Karvisen 05.03.2024 luentomuistiinpanojani.

  - Alkuun loin komennon
  > `mkdir pythonit` loin hakemiston python ohjelmille
  > `micro hellurei.py` loin hellurei nimisen python tiedoston. Tiedostoon tallensin python-pätkän.
  > 
  > ![7.101_hellurei_py](https://github.com/syjaka/Linux-Palvelimet-2024/blob/main/images/7.008_hellurei_py.png)

  - Sitten asetin luodun komennon kaikkien käyttöön kaikkialla.
  > Lisäsin hellurei.py-tiedostoon #!-polun joka määrittää että komento ajetaan Bashilla.
  > ![7.102_hash_bang_added](https://github.com/syjaka/Linux-Palvelimet-2024/blob/main/images/7.102_hash_bang_added.png)
  
  > Annoin kaikille käyttäjille tarvittavat oikeudet komennolla `chmod ugo+rx hellurei.py`
  > Kopioin tiedoston kaikkien saataville `sudo cp hellurei.py /usr/local/bin/`   
  > Lopputuloksena muutkin kättäjät saavat tiedoston ajettua.   
  > ![7.103_testaaja_testaa](https://github.com/syjaka/Linux-Palvelimet-2024/blob/main/images/7.103_testaaja_testaa.png)

[takaisin ylös](https://github.com/syjaka/Linux-Palvelimet-2024/blob/main/h7_maalisuora.md#h_7-maalisuora)
  
---

## c) Labratehtävän ratkaisua

Tehtävän suoritus oli minun kohdalla hyvin aikaavievää. Tein tehtävää useassa osassa yhteensä reilu 25h. Tarkempi ajankäyttö listattu varsinaisessa tehtäväraportissa. Merkittävin syy tähän lienee se, että valitsin tehtävän jossa oli paljon elementtejä kurssin sisällön ulkopuolelta. Tämä tietenkin johti siihen, että minun piti opetella ja ymmärtää asiat ennen onnistumista. Vaikka tehtävä jäi kesken, oli se hyvin opettavainen ja koin tekemisen hyödylliseksi.
- Valitsemani labraharjoitus oli [Kippo Oy:n tietohallintojohtajan nakkikimara](https://terokarvinen.com/2021/final-lab-for-linux-server-course-linux-palvelimet-ict4tn021-3016/?fromSearch=arvioitava).  Tehtävän suorituksesta syntyi aavistuksen pitkä raportti josta olen tähän alle koonnut tulokset, kuin niitä tehtävänannossa oli pyydetty.
#### Tehtävä on kokonaisuudessaan raportoitu Labraharjoitus vuodelta 2024 [tiedostoon](https://github.com/syjaka/Linux-Palvelimet-2024/blob/main/h7.1_2021_labra_Kippo_Oy.md).

### 1 .Turvallisesti etänä - SSH etäylläpidon avaus koneelle.
Aiot kuulemma siirtyä etätöihin Hawajille. Valmistaudu ylläpitämään konetta ssh:lla. (Testaa paikallisesti, että SSH toimii).
Suojaa kone tulimuurilla.
> Tehtävän suorituksen lopputuloksena asennettu SSH-palvelin joka sallii käyttäjän kirjautumisen koneelle etänä, vaikka Havajilta.
> ![ssh](https://github.com/syjaka/Linux-Palvelimet-2024/blob/main/images/7.1_2021_1_ssh_vastaa.png)

### 2. Asiantuntijat
Luo yrityksen työntekijöille Kippo-virtuaalikoneen käyttäjätunnukset.

> Tehtävän lopputuloksen oli alla listatut käyttäjät luotuna.Näistä Kadi on root ja Kadriye on sudo-ryhmään kuuluva käyttäjä:
> ![image](https://github.com/syjaka/Linux-Palvelimet-2024/assets/123550796/2249fb98-7690-4939-baee-027c1554b087)
>
> Käyttäjien nimet ja salasanat löytyvät listattuna tehtävän raportissa.

### 3. Mikä verkko mikä meininki
Tee uusi netsee komento joka näyttää ainakin reititystaulun ja oman IP-osoitteen. Voit lisätä halutessasi jonkin ekstratiedon.
  
  > Ao testi suoritettu tavallisena käyttäjänä - arnosj.
  > ![](https://github.com/syjaka/Linux-Palvelimet-2024/blob/main/images/7.1_2021_3_arnoldi_testaa.png)

### 4. kippo.example.com
Tee meille weppipalvelu osoitteeseen kippo.example.com. Voit simuloida nimipalvelun toimintaa hosts-tiedoston avulla.
- Tee sivu siten, että webmasterimme Ossi pääsee muokkaamaan sivuja. Tee Ossille valmiiksi validi HTML5-sivu pohjaksi. Siis siten, että osoitteesta kippo.example.com näkyy validi esimerkkisivu, josta selkeästi näkyy, että on tultu Kipppo-sivulle.
  
  > Sivuston sisältö on tallennettu ossiot-kotihakemistoon jolloin Ossilla on täysi valta sivuston ylläpitoon.
  > 
  > ![image](https://github.com/syjaka/Linux-Palvelimet-2024/assets/123550796/5ec6cfa6-41a4-4c85-8cb0-e5e9328a2dca)
  > ![](https://github.com/syjaka/Linux-Palvelimet-2024/blob/main/images/7.1_2021_7_tulikettu_kippo_vastaa.png)
  > ![](https://github.com/syjaka/Linux-Palvelimet-2024/blob/main/images/7.1_2021_7_tulikettu_kippo_vastaa_www.png)
  
### 5. sanko.example.com

Tee meille toinen weppipalvelu samalle koneelle osoitteeseen sanko.example.com samaan tapaan kuin edellinen. Tätä sivua pitäsi päästä muokkaamaan Sanko-tiimimme Einari ja Erkki, joskin tiimin jäsenet voivat tulevaisuudessa vaihtua. Tee myös Sanko-tiimille validi esimerkkisivu.
> Sanko ryhmä jäsenineen.
> 
> ![image](https://github.com/syjaka/Linux-Palvelimet-2024/assets/123550796/d5e4055e-3953-47fc-a698-9033a357014b)

> Sivuston sisältö einavan kotihakemistossa jossa myös oikeudet päivitetty komennolla `sudo chmod u=rwx,g=rx,o=rx /home/einava`:
> 
>![](https://github.com/syjaka/Linux-Palvelimet-2024/blob/main/images/7.1_2021_12_en_enaa_jaksa_en.png)
>![](https://github.com/syjaka/Linux-Palvelimet-2024/raw/main/images/7.1_2021_11_en_enaa_jaksa.png)

> Lopputulos selaimella:
> ![](https://github.com/syjaka/Linux-Palvelimet-2024/blob/main/images/7.1_2021_16_tulikettu_sanko_vastaa_www.png)

### 6. ampari.example.com
Ampari on uusi palvelumme, josta käyttäjä saa kiintoisia tietoja. Palvelua voi käyttää millä vain käyttöjärjestelmällä ja selaimella.
1. Tee meille tuotantotyyppinen asennus weppipalvelusta Flaskilla. - Suoritin tehtävää Djangolla.
2. Tee Python Flaskilla palvelu, josta löytyy seuraavat osoitteet:
  - http://ampari.example.com/ "Hei amparien maailma" (literaalisti tämä teksti) - Tämä jäi kesken sillä en saanut sanko.examplecom vastaamaan Djangolla.
> Loin Djangolle apin jonka sain vastaa localhostiin kohteesta tempalate/index.html.
> 
> ![](https://github.com/syjaka/Linux-Palvelimet-2024/blob/main/images/7.1_2021_19_localhost%20ampari%20vastaa.png)
- http://ampari.example.com/today Päivämäärä ja kellonaika - Tämä jäi tekemättä.

### 7. Kurlataan
Nörttimme kaipaavat teknistä tietoa weppipalveluista. Kerää raporttisi perään 'curl -i http://localhost' tiedot jokaisesta URLsta, jotka olet tehnyt vastauksena tämän tehtävän eri kohtiin.
> Kippo kurlaa:
> 
> ![](https://github.com/syjaka/Linux-Palvelimet-2024/blob/main/images/7.1_2021_25_sanko_kurlaa.png)
> Sanko kurlaa:
>
> ![](https://github.com/syjaka/Linux-Palvelimet-2024/blob/main/images/7.1_2021_25_kippo%20kurlaa.png)
> Ampari kurlaa:
> 
> ![](https://github.com/syjaka/Linux-Palvelimet-2024/blob/main/images/7.1_2021_25_ampari_kurlaa.png)

[takaisin ylös](https://github.com/syjaka/Linux-Palvelimet-2024/blob/main/h7_maalisuora.md#h_7-maalisuora)

---

## d) asenna itsellesi tyhjä virtuaalikone.

Tehtävän suoritus alkoi 23.05. ja päättyi 23.30 UCT+3. Seuraavana päivänä jatkoin klo 19.15-19.30 UCT+3.
1. Avaan virtualboxin ja luon sinne uuden virtuaalikoneen nimeltä labra. Alla koneelle antamani specsit.
   > ![](https://github.com/syjaka/Linux-Palvelimet-2024/blob/main/images/7.201.png)
   > ![](https://github.com/syjaka/Linux-Palvelimet-2024/blob/main/images/7.202.png)
   > ![](https://github.com/syjaka/Linux-Palvelimet-2024/blob/main/images/7.203.png)
   > ![](https://github.com/syjaka/Linux-Palvelimet-2024/blob/main/images/7.204.png)
2. Valitsen virtualboxista start ja valitsen avautuvasta ikkunasta linux live asennuksen.
3. Linuxin auettua testaan syötteet ja netin ja teen googlehaun v'sytt'', netti ja syötteet toimii.
4. Suljen selaimen ja klikkaan `install debian`ja avautuvaan herjaan valitsen `launch anyway`.
5. Tein alue- ja maavalinnat ja valitsen kovalevyn alustuskohdassa `tyhjennä levy`.
6. Annan oman nimeni "kadi" ja koneen nimen "labra".
7. Valitsen ´install`. Klo 23.30 asennus alkaa ja se raksutti parikymmentä minuuttia.
8. Asennuksen valmistuttua kone ilmoitti olevansa valmis uudelleenkäynnistykseen, jonka jälkeen pääsin kirjautumaan koneelle uusilla labra-tunnuksilla.
9. Kirjauduttuani avasin terminaalin ja asensin päivitykset ja palomuurin.
>        sudo apt-get update
>        udo apt-get dist-upgrade
>        sudo apt-get install ufw
>        sudo ufw enable
>        sudo systemctl restart ufw
>        sudo ufw status # tarkisti vielä tilan joka vastasi status active.
Tehtävä tuli valmiiksi 19.30.

# h8_Bonus
- h3 Hello web server vapaaehtoiset tehtävät
> 1. [GitHub education](https://github.com/syjaka/Linux-Palvelimet-2024/blob/main/h3_HelloWebServer.md#8-hanki-github-education-paketti)
> 2. [Nimipohjainen virtuaalipalvelin joka vastaa kahdesta eri osoitteesta](https://github.com/syjaka/Linux-Palvelimet-2024/blob/main/h3_HelloWebServer.md#9--10-nimipohjainen-virtuaalipalvelin--laita-sama-tietokone-vastaamaan-kahdella-eri-sivulla-kahdesta-eri-nimest%C3%A4)
- h 5 Koko juttu
> 1. [Asenna Vagrant](https://github.com/syjaka/Linux-Palvelimet-2024/blob/main/h5_Uudestaan.md#m-vagrant)
  
[takaisin ylös](https://github.com/syjaka/Linux-Palvelimet-2024/blob/main/h7_maalisuora.md#h_7-maalisuora)



Lähteet:

Ask Ubuntu 2023. Luettavissa: https://askubuntu.com/questions/1302427/unable-to-locate-package-openjdk-15-jdk. Luettu 05.03.2024

GeeksForGeeks, How to Install GCC Compiler on Linux? 2021. Luettavissa https://www.geeksforgeeks.org/how-to-install-gcc-compiler-on-linux/. Luettu 05.03.2021

Karvinen T, Linux Palvelimet alkukevät 2024. Luettavissa https://terokarvinen.com/2024/linux-palvelimet-2024-alkukevat/#h7-maalisuora. Luettu 05.03.2024

Jyväskylän ylipisto, JDK 2024. Luettavissa https://tim.jyu.fi/lecture/kurssit/tie/ohj2/tyokalut/JavaSDK#bjc3l73UZCrF. Luettu 05.03.2024

Linux.fi/wiki, GCC 2021. Luettavissa: https://www.linux.fi/wiki/GCC. Luettu 05.03.2024.

StackOverflow, How to compile C++ under Ubuntu Linux? Luettavissa: https://stackoverflow.com/questions/1696300/how-to-compile-c-under-ubuntu-linux. Luettu 05.03.2024

Törmä L. 2023, h13 Hello World. Luettavissa: Tero Karvinen, Linux Palvelimet alkukevät 2024. Luettavissa https://terokarvinen.com/2024/linux-palvelimet-2024-alkukevat/#h7-maalisuora. Luettu 05.03.2024. Luettu 05.02.2024

w3schools C++ Tutorial. Luettavissa https://www.w3schools.com/cpp/. Luettu 05.03.2024.

  
  
  
  
