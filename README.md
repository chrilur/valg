Valgdatabasen
=============

Alle resultater i norske stortingsvalg siden 1945,
bare en R-kommando unna.

Tallene er hentet fra Statistikkbanken til SSB.

Funksjoner så langt
-------------------

### get.res
Henter antall stemmer til gitt parti i gitt år.

Eks: get.res("1977", "Gjøvik", "Høyre")

### get.oppsl
Samme som get.res, men legger til partiets oppslutning i prosent.

### get.alle.år
Henter alle resultater 1945-2013 for et gitt parti i gitt kommune.

Eks: get.alle.år("Bergen", "Arbeiderpartiet")

### styrke
Bruker get.oppsl og beregner differansen mellom partiets oppslutning nasjonalt og lokalt, dets "styrke" lokalt.

Eks: 
```styrke("1977", "Bømlo", "Kristelig")
      kommune                parti stemmer    % styrke
1: 1219 Bømlo Kristelig Folkeparti    2148 45.2   35.5```

KrF på Bømlo lå 35.5 prosentpoeng over landsgjennomsnittet i 1977.
