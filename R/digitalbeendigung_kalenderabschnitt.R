digitalbeendigung_kalenderabschnitt <- function(abschnitt_von=NULL, abschnitt_bis=NULL, nicht_mehr_geschuldet_ab=NULL, mangelzeitraeume=NULL, vereinbarter_abschnittspreis=NULL, gezahlter_abschnittspreis=NULL, einordnungsnachweis=NULL) {
 von <- .datum(abschnitt_von,'abschnitt_von');bis <- .datum(abschnitt_bis,'abschnitt_bis');ab <- .datum(nicht_mehr_geschuldet_ab,'nicht_mehr_geschuldet_ab');.text(einordnungsnachweis,'einordnungsnachweis')
 if(bis<von) .fehler('abschnitt_bis','Abschnittsende liegt vor Beginn.')
 .vorhanden(mangelzeitraeume,'mangelzeitraeume')
 if(!is.list(mangelzeitraeume)||!is.null(names(mangelzeitraeume))||length(mangelzeitraeume)>10000) .fehler('mangelzeitraeume','Liste mit hoechstens10000Intervallen erforderlich.')
 intervalle <- list()
 for(z in mangelzeitraeume) {
  if(!is.list(z)||length(z)!=2||!setequal(names(z),c('von','bis'))) .fehler('mangelzeitraeume','Genau von und bis erforderlich.')
  a <- .datum(z$von,'von');e <- .datum(z$bis,'bis')
  if(e<a) .fehler('mangelzeitraeume','Intervallende liegt vor Beginn.')
  anfang <- max(as.numeric(a),as.numeric(von));ende <- min(as.numeric(e),as.numeric(bis),as.numeric(ab)-1)
  if(anfang<=ende) intervalle[[length(intervalle)+1]] <- list(a=anfang,e=ende)
 }
 if(length(intervalle)) intervalle <- intervalle[order(vapply(intervalle,function(x)x$a,0),vapply(intervalle,function(x)x$e,0))]
 vereinigt <- list()
 for(z in intervalle) {
  l <- length(vereinigt)
  if(l>0 && z$a<=vereinigt[[l]]$e+1) vereinigt[[l]]$e <- max(z$e,vereinigt[[l]]$e) else vereinigt[[l+1]] <- z
 }
 gesamt <- as.numeric(bis-von)+1;mangel <- sum(vapply(vereinigt,function(x)x$e-x$a+1,0));zukunft <- max(0,as.numeric(bis-max(ab,von))+1)
 wert <- digitalbeendigung_zeitanteilige_betraege(vereinbarter_abschnittspreis,gezahlter_abschnittspreis,as.character(gesamt),as.character(mangel),as.character(zukunft),einordnungsnachweis)$wert
 wert$kalendertage_gesamt <- gesamt;wert$kalendertage_mangelhaft <- mangel;wert$kalendertage_nicht_mehr_geschuldet <- zukunft
 wert <- wert[c('kalendertage_gesamt','kalendertage_mangelhaft','kalendertage_nicht_mehr_geschuldet','entfallender_zeitanteil','erloschener_preisanteil','erstattungsbetrag')]
 eingaben <- list(abschnitt_von=abschnitt_von, abschnitt_bis=abschnitt_bis, nicht_mehr_geschuldet_ab=nicht_mehr_geschuldet_ab, mangelzeitraeume=mangelzeitraeume, vereinbarter_abschnittspreis=vereinbarter_abschnittspreis, gezahlter_abschnittspreis=gezahlter_abschnittspreis, einordnungsnachweis=einordnungsnachweis)
 ergebnis <- .ergebnis(wert,"tage_quote_und_eur","BGB_DIGITALBEENDIGUNG_KALENDERABSCHNITT",eingaben,list(list(operation="Mangelintervalle begrenzen und vereinigen; disjunkte Mangel-/Zukunftstage z\u00e4hlen und vorhandene zeitanteilige Erstattungsrechnung anwenden.")),eingaben)
 ergebnis$hinweise <- list("\u00a7327oII/III: nur dauerhafte digitale Bereitstellung und rechtlich qualifizierte ganze Kalendertage bei gleicher Bewertung jedes Tages im Abschnitt. Mangelintervalle werden auf bereits geschuldete Tage im Abschnitt begrenzt und vereinigt. Zuk\u00fcnftig entfallende Tage separat z\u00e4hlen; keine Doppelz\u00e4hlung bei \u00dcberschneidungen. Vorhandene exakte Preis-/Erstattungsrechnung verwenden. Unterschiedlich bepreiste oder bezahlte Abschnitte einzeln abrechnen. Untert\u00e4gige Leistungen nicht runden; hierf\u00fcr vorhandene Rechnung mit rechtlich bestimmten Zeiteinheiten verwenden. Keine automatische Mangel- oder Beendigungsentscheidung und keine pauschale30-Tage-Monatsannahme. \u00dcberzahlungen \u00fcber Abschnittspreis separat; erloschener Preisanteil ist nicht zus\u00e4tzlich neben Erstattung zu zahlen.")
 ergebnis
}
