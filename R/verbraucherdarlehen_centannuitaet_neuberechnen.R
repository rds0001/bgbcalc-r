verbraucherdarlehen_centannuitaet_neuberechnen <- function(anfangskapital=NULL, korrigierter_periodenzinssatz=NULL, anzahl_teilzahlungen=NULL, geschuldete_kosten_je_teilzahlung=NULL, rundungsmodus=NULL, plannachweis=NULL) {
 kapital <- .geld(anfangskapital);satz <- .zahleneingabe(korrigierter_periodenzinssatz);anzahl <- .ganzzahl(anzahl_teilzahlungen,'anzahl_teilzahlungen',1,1000);kosten <- .geld(geschuldete_kosten_je_teilzahlung);.auswahl(rundungsmodus,'rundungsmodus',c('kaufmaennisch','gerade'));.text(plannachweis,'plannachweis')
 if(.vergleichen(satz,.bruch(-1))<=0) .fehler('korrigierter_periodenzinssatz','Periodenquote muss gr\u00f6\u00dfer als-1sein.')
 for(x in list(kapital,kosten)) if(.vergleichen(.zahleneingabe(.runden(x,2,'gerade')),x)!=0) .fehler('betrag','Centgenaue Betr\u00e4ge erforderlich.')
 zins <- function(rest) .zahleneingabe(.runden(.multiplizieren(rest,satz),2,rundungsmodus))
 rest_nach <- function(rate) {
  rest <- kapital
  for(i in seq_len(anzahl)) {
   vorher <- rest;rest <- .subtrahieren(.addieren(rest,zins(rest)),rate)
   if(.vergleichen(rest,.bruch(0))<=0) return(.bruch(0))
   if(.vergleichen(rest,vorher)>=0) return(rest)
  }
  rest
 }
 unter <- 0;ober <- as.numeric(.runden(.multiplizieren(.addieren(kapital,zins(kapital)),.bruch(100)),0,'gerade'))
 while(unter<ober) {
  mitte <- unter+floor((ober-unter)/2)
  if(.vergleichen(rest_nach(.bruch(mitte,100)),.bruch(0))==0) ober <- mitte else unter <- mitte+1
 }
 rate <- .bruch(unter,100);rest <- kapital;zeilen <- list();zinsgesamt <- .bruch(0);gesamt <- .bruch(0)
 for(i in seq_len(anzahl)) {
  anfang <- rest;z <- zins(rest);faellig <- .addieren(rest,z);zahlung <- if(.vergleichen(rate,faellig)<0)rate else faellig;rest <- .subtrahieren(faellig,zahlung);teilzahlung <- .addieren(zahlung,kosten);zinsgesamt <- .addieren(zinsgesamt,z);gesamt <- .addieren(gesamt,teilzahlung)
  zeilen[[i]] <- list(zahlungsnummer=i,anfangssaldo=.bruchteile(anfang),zinsbetrag=.bruchteile(z),kapitaldienst=.bruchteile(zahlung),geschuldete_kosten=.bruchteile(kosten),neue_teilzahlung=.bruchteile(teilzahlung),restkapital=.bruchteile(rest))
 }
 wert <- list(regelmaessiger_kapitaldienst=.bruchteile(rate),teilzahlungen=zeilen,zinsgesamtbetrag=.bruchteile(zinsgesamt),neuer_gesamtbetrag=.bruchteile(gesamt),restkapital=.bruchteile(rest))
 eingaben <- list(anfangskapital=anfangskapital, korrigierter_periodenzinssatz=korrigierter_periodenzinssatz, anzahl_teilzahlungen=anzahl_teilzahlungen, geschuldete_kosten_je_teilzahlung=geschuldete_kosten_je_teilzahlung, rundungsmodus=rundungsmodus, plannachweis=plannachweis)
 ergebnis <- .ergebnis(wert,"EUR","BGB_VERBRAUCHERDARLEHEN_CENTANNUITAET_NEUBERECHNEN",eingaben,list(list(operation="Kleinste centgenaue nachsch\u00fcssige Kapitaldienstrate durch monotone Suche bestimmen; Zinsen und Restschulden je Periode mit vorgegebener Rundung fortschreiben.")),eingaben)
 ergebnis$hinweise <- list("Bedingter vertraglicher Annuit\u00e4tenplan f\u00fcr494V, kein gesetzlich vorgeschriebenes Universalmodell. Bestehenden exakten Rundungskern verwenden. Durch monotone ganzzahlige Intervallsuche kleinste centgenaue Kapitaldienstrate bestimmen, die das Kapital bis zum letzten Termin tilgt. Jede Periode Zins=Anfangssaldo*Periodenquote aufCent runden; Zahlung=min(Regelrate,Saldo+Zins), danach Saldo fortschreiben. Letzte Zahlung kann kleiner sein; bei fr\u00fchzeitiger Tilgung weitere Kapitaldienstraten0. Explizite gleichbleibende Zusatzkosten separat addieren. Keine Potenz riesiger Br\u00fcche, keine N\u00e4herungstoleranz, keine Kapitalisierung von Kosten oder \u00c4nderung der vorgegebenen Laufzeit. Negative korrigierte Zinsen sind mathematische Rechenwerte, keine automatische rechtliche Pflicht des Darlehensgebers. Nicht erfasst: vorsch\u00fcssige Zahlung, variable Perioden oder abweichende Rundungs-/Geb\u00fchrenstruktur; diese Vertragsmodelle nicht stillschweigend ersetzen.")
 ergebnis
}
