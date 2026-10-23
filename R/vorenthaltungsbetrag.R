vorenthaltung_abschnittsentschaedigung <- function(regelfall=NULL, abschnittsentgelt=NULL, zeitanteil_zaehler=NULL, zeitanteil_nenner=NULL, einordnungsnachweis=NULL) {
 .auswahl(regelfall,"regelfall",c("miete_vertrag","miete_ortsueblich","landpacht_vertrag"))
 anteilig <- .teilbetrag(abschnittsentgelt,zeitanteil_zaehler,zeitanteil_nenner)
 .text(einordnungsnachweis,"einordnungsnachweis")
 eingaben <- list(regelfall=regelfall, abschnittsentgelt=abschnittsentgelt, zeitanteil_zaehler=zeitanteil_zaehler, zeitanteil_nenner=zeitanteil_nenner, einordnungsnachweis=einordnungsnachweis)
 ergebnis <- .geld_ergebnis(anteilig,"BGB_VORENTHALTUNG_ABSCHNITTSENTSCHAEDIGUNG",eingaben,list(list(operation="Gew\u00e4hltes Miet- oder Landpachtentgelt des Abrechnungsabschnitts mit dem qualifizierten Vorenthaltungszeitanteil multiplizieren.")))
 ergebnis$hinweise <- c(ergebnis$hinweise,list("\u00a7546aI: vereinbarte Miete ODER qualifizierte orts\u00fcbliche Miete vergleichbarer Sachen; Alternativen nicht addieren. \u00a7597: vereinbarte Landpacht f\u00fcr die Vorenthaltungsdauer, keine ungepr\u00fcfte \u00dcbertragung der Berechnungsweise584b. Nur ein homogener Abschnitt und dessen zutreffend bestimmter Zeitanteil; f\u00fcr mehrere Abschnitte disjunkte Ergebnisse addieren. Weitere ersatzf\u00e4hige Sch\u00e4den546aII/597Satz2 ohne Doppelz\u00e4hlung gesondert, ebenso geleistete Zahlungen. Keine automatische Entsch\u00e4digung blo\u00df wegen eines behaupteten R\u00fcckgabeverzugs; rechtliche Vorenthaltung und sonstige Voraussetzungen vorqualifiziert."))
 ergebnis
}
