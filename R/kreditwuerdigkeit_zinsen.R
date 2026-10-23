kreditwuerdigkeit_zinsermaessigung <- function(kapital=NULL, vertraglicher_sollzins_prozent=NULL, qualifizierter_marktzins_prozent=NULL, zinsart=NULL, marktzins_stichtag_am=NULL, zeitanteil_zaehler=NULL, zeitanteil_nenner=NULL, zeitanteil_nachweis=NULL, einordnungsnachweis=NULL) {
 .auswahl(zinsart,'zinsart',c('gebunden','veraenderlich'))
 .datum(marktzins_stichtag_am,'marktzins_stichtag_am');.text(einordnungsnachweis,'einordnungsnachweis')
 vertrag <- .zahleneingabe(vertraglicher_sollzins_prozent)
 markt <- .zahleneingabe(qualifizierter_marktzins_prozent)
 satz <- if(.vergleichen(vertrag,markt)<=0) vertrag else markt
 zinseingaben <- list(kapital=kapital,zeitanteil_zaehler=zeitanteil_zaehler,zeitanteil_nenner=zeitanteil_nenner,zeitanteil_nachweis=zeitanteil_nachweis,glaeubigerverzug=FALSE)
 neu <- do.call(gesetzliche_zinsen,c(zinseingaben,list(abweichender_zinssatz_prozent=.bruchteile(satz))))$wert
 alt <- do.call(gesetzliche_zinsen,c(zinseingaben,list(abweichender_zinssatz_prozent=.bruchteile(vertrag))))$wert
 wert <- list(rechnerischer_sollzins_prozent=.bruchteile(satz),rechnerischer_zinsbetrag=neu,rechnerische_zinsdifferenz=.bruchteile(.subtrahieren(.zahleneingabe(alt),.zahleneingabe(neu))))
 eingaben <- list(kapital=kapital, vertraglicher_sollzins_prozent=vertraglicher_sollzins_prozent, qualifizierter_marktzins_prozent=qualifizierter_marktzins_prozent, zinsart=zinsart, marktzins_stichtag_am=marktzins_stichtag_am, zeitanteil_zaehler=zeitanteil_zaehler, zeitanteil_nenner=zeitanteil_nenner, zeitanteil_nachweis=zeitanteil_nachweis, einordnungsnachweis=einordnungsnachweis)
 ergebnis <- .ergebnis(wert,"EUR_und_prozent","BGB_KREDITWUERDIGKEIT_ZINSERMAESSIGUNG",eingaben,list(list(operation="Sollzins auf kleineren qualifizierten Marktzinssatz begrenzen; bestehenden Zinskern f\u00fcr neuen und vertraglichen Abschnitt verwenden und Differenz bilden.")),eingaben)
 ergebnis$hinweise <- list("\u00a7505dI1/2: bereits rechtlich feststehende Zinserm\u00e4\u00dfigung; numerisch kleinerer Vertrags-/Marktzinssatz, keine Zinserh\u00f6hung. Gebundener Sollzins: Markt f\u00fcr Hypothekenpfandbriefe/\u00f6ffentliche Pfandbriefe mit entsprechender Bindungslaufzeit; ver\u00e4nderlicher Sollzins: Euro-Dreimonats-Interbankenmarkt. Marktwerte, Vertragsschluss und vereinbarte Anpassungsstichtage vorqualifizieren. Jeder homogene Kapital-/Zinsabschnitt separat; keine Tilgungsplan- oder Zinseszinsannahme. Vorzeichenbehaftete Ergebnisse sind rechnerische Zinsbetr\u00e4ge, kein automatisch festgestellter Zahlungsanspruch bei Negativzinsen. Eine rechtlich anzuwendende Zinsuntergrenze ist vorab in der qualifizierten Zinsgrundlage zu ber\u00fccksichtigen und nachzuweisen; keine erfundene Nullgrenze. Ausnahmef\u00e4lle505dI5/III nicht mit dieser Funktion berechnen. Keine automatische Kreditw\u00fcrdigkeitspr\u00fcfung, Pflichtverletzungsentscheidung oder Marktdatenbeschaffung.")
 ergebnis
}
