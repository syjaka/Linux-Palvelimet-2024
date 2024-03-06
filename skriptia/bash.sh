#PERUSSETTIÄ
#LUO micro tiedosto bashmoikkaa

#määritä shellin suoritus Bashilla
#!/usr/bin/bash

echo "Hauska tavata $1!" #poimii komennon perään annetun syötteen esim bash bashmoikkaa kadi
echo "Tervetuloa $USER!"

PAIVA=$(date +"%Y-%m-%d")
AIKA=$(date +"%H:%M")

echo "Tänään on $PAIVA ja kello on $AIKA +3UCT."


#LUO MONTA KÄYTTÄJÄÄ

#luo ensin tekstitiedosto jossa kaikki halutut käyttäjät listattuna.

micro /tmp/userlist

# Luo .sh tiedosto skriptille

micro /usr/sbin/createuser.sh

#määritä shellin suoritus Bashilla
#!/bin/bash

#kerro käyttäjänimien listan sijainti
userfile=/tmp/userlist 

#hae käyttäjänimet yksi kerrallaan
username=$(cat /tmp/userlist | tr 'A-Z'  'a-z')

#Määritä oletussalasana
password=1980$username@obscuuura

#looppaa luodaksesi listan käyttäjät
for user in $username
do
       #'$user' on luupissa muuttuva muuttuja
       # käyttäjänimi txt.tiedoston perusteella
       useradd $user
       echo $password | passwd --stdin $user
done

#echo kertoo montako käyttäjää luotiin
#tail kertoo lopulliset detskut prosessista
echo "$(wc -l /tmp/userlist) users have been created" 
tail -n$(wc -l /tmp userlist) /etc/passwd

#lähde: https://www.geeksforgeeks.org/bash-scripting-introduction-to-bash-and-bash-scripting/

#ALKUTERVEHDYS

#!/bin/bash

# Määritä tervehdys päivän ajasta riippuen
HOUR=$(date +"%H")
if [ "$HOUR" -ge 6 -a "$HOUR" -lt 12 ]; then
  GREETING="Huomenta"
elif [ "$HOUR" -ge 12 -a "$HOUR" -lt 18 ]; then
  GREETING="Päivää"
elif [ "$HOUR" -ge 18 -a "$HOUR" -lt 22 ]; then
  GREETING="Iltaa"
else
  GREETING="Yöaikaa"
fi

# Hae päivämäärä ja kellonaika
DATE=$(date +"%A, %d.%m.%Y")
TIME=$(date +"%H:%M")

# Hae käyttäjän pääkäyttäjäryhmä
GROUP=$(id -gn)

# Tervehdys
echo "Hyvää $GREETING $USER!"
echo "tänään on $DATE ja kello on $TIME."
echo "Olet käyttäjäryhmään '$GROUP' kuuluva käyttäjä."

#Lähde chatGPT

#UPDATE

#!/bin/bash

# below command will Update package lists
sudo apt update

# below command will Upgrade the packages that can be upgraded
sudo apt upgrade -y

# below command will Remove unnecessary packages and dependencies for good memory management
sudo apt autoremove -y

# below command will Clean package cache
sudo apt clean -y

# below command will Display system update status on terminal to know if the update and upgrade is successfull
echo "System updates and upgrades completed successfully."


#lähde: https://www.geeksforgeeks.org/shell-script-to-automate-system-updates-and-upgrades-in-linux/?ref=header_search
