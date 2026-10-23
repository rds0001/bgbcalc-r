betreuung_vermoegenswert_ohne_immobilien <- function(vermoegenspositionen=NULL,verbindlichkeiten=NULL,bewertungsnachweis=NULL) {
  .vorhanden(vermoegenspositionen,"vermoegenspositionen")
  if (!is.list(vermoegenspositionen) || length(vermoegenspositionen)<1 || length(vermoegenspositionen)>10000 || !is.null(names(vermoegenspositionen))) .fehler("vermoegenspositionen","Liste mit 1 bis 10000 qualifizierten Verm\u00f6genspositionen erforderlich; kein Verm\u00f6gen als einzelne Nullposition.")
  ansatz <- .bruch(0);immobilien <- .bruch(0)
  for (position in vermoegenspositionen) {
    if (!is.list(position) || length(position)!=2 || !setequal(names(position),c("wert","immobilie"))) .fehler("vermoegenspositionen","Genau wert und immobilie je Position erforderlich.")
    wert <- .geld(position$wert);.wahrheitswert(position$immobilie,"immobilie")
    if (position$immobilie) immobilien <- .addieren(immobilien,wert) else ansatz <- .addieren(ansatz,wert)
  }
  .geld(verbindlichkeiten);.text(bewertungsnachweis,"bewertungsnachweis")
  eingaben <- list(vermoegenspositionen=vermoegenspositionen,verbindlichkeiten=verbindlichkeiten,bewertungsnachweis=bewertungsnachweis)
  ergebnis <- .ergebnis(list(anzusetzender_vermoegenswert=.bruchteile(ansatz),nicht_beruecksichtigter_immobilienwert=.bruchteile(immobilien)),"EUR","BGB_BETREUUNG_VERMOEGENSWERT_OHNE_IMMOBILIEN",eingaben,list(list(operation="Qualifizierte Verm\u00f6genspositionen nach Immobilienzuordnung trennen; ausschlie\u00dflich Nichtimmobilienwerte summieren, Verbindlichkeiten nicht abziehen.")),eingaben)
  ergebnis$hinweise <- list("\u00a71860I schreibt Berechnung ohne Immobilien und Verbindlichkeiten vor. Positionen und Werte zum ma\u00dfgeblichen Stichtag rechtlich qualifiziert, anteilige Berechtigungen bereits bewertet. Wert einer Nichtimmobilienposition nicht vorher um separat zu ber\u00fccksichtigende Verbindlichkeiten vermindern; sonst w\u00fcrde der gesetzlich ausgeschlossene Schuldenabzug verdeckt nachgeholt. Verbindlichkeiten werden als nichtnegative dokumentierte Eingabe validiert und bewusst nicht abgezogen. Immobilienzuordnung ist Nutzervorgabe, keine automatische Objektklassifikation. Kein Verm\u00f6gen als einzelne Nullposition angeben. Die6000EUR-Schwelle, Antrag, richterliches Ermessen, Gef\u00e4hrdung und sonstige Befreiungswege werden nicht als eigenst\u00e4ndige Befreiungsentscheidung berechnet.")
  ergebnis
}
