## KELLONAIKA

#!/usr/bin/bash`

from datetime import datetime

nyt = datetime.now()

kellonaika = nyt.strftime("%H:%M:%S")

print(f"Kello on nyt: {kellonaika}")

## HELLUREI FUNKTIOLLA

def hellurei():
  nimi = input ("Kerrohan kuka olet")
  print(f"\nHellurei {nimi}\n")

hellurei()
