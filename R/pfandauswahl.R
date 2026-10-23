pfand_verwertungsbedarf <- function(gesicherter_befriedigungsbedarf=NULL,pfaender_in_auswahlreihenfolge=NULL,bewertungsnachweis=NULL) {
 bedarf <- .geld(gesicherter_befriedigungsbedarf)
 .vorhanden(pfaender_in_auswahlreihenfolge,'pfaender_in_auswahlreihenfolge')
 if(!is.list(pfaender_in_auswahlreihenfolge)||!is.null(names(pfaender_in_auswahlreihenfolge))||length(pfaender_in_auswahlreihenfolge)<1||length(pfaender_in_auswahlreihenfolge)>1000) .fehler('pfaender_in_auswahlreihenfolge','Liste mit1bis1000 einzeln verwertbaren Pf\u00e4ndern erforderlich.')
 namen <- character();werte <- list()
 for(pfand in pfaender_in_auswahlreihenfolge) {
  if(!is.list(pfand)||length(pfand)!=2||!setequal(names(pfand),c('pfand_id','verfuegbarer_nettoerloes'))) .fehler('pfaender_in_auswahlreihenfolge','Genau pfand_id und verfuegbarer_nettoerloes erforderlich.')
  name <- .text(pfand$pfand_id,'pfand_id')
  if(name %in% namen) .fehler('pfand_id','Pfand darf nicht mehrfach eingerechnet werden.')
  namen <- c(namen,name);werte[[length(werte)+1]] <- .geld(pfand$verfuegbarer_nettoerloes)
 }
 .text(bewertungsnachweis,'bewertungsnachweis')
 summe <- .bruch(0);ausgewaehlt <- list();uebrig <- list()
 for(i in seq_along(namen)) {
  if(.vergleichen(summe,bedarf)<0 && .vergleichen(werte[[i]],.bruch(0))>0) {
   ausgewaehlt[[length(ausgewaehlt)+1]] <- namen[[i]];summe <- .addieren(summe,werte[[i]])
  } else uebrig[[length(uebrig)+1]] <- namen[[i]]
 }
 gedeckt <- if(.vergleichen(summe,bedarf)<0) summe else bedarf
 rest <- if(.vergleichen(summe,bedarf)<0) .subtrahieren(bedarf,summe) else .bruch(0)
 ueber <- if(.vergleichen(summe,bedarf)>0) .subtrahieren(summe,bedarf) else .bruch(0)
 wert <- list(bedarfsbezogene_auswahl=ausgewaehlt,nicht_zur_deckung_benoetigt=uebrig,summe_nettoerloese=.bruchteile(summe),gedeckter_bedarf=.bruchteile(gedeckt),restbedarf=.bruchteile(rest),rechnerischer_ueberschuss=.bruchteile(ueber))
 eingaben <- list(gesicherter_befriedigungsbedarf=gesicherter_befriedigungsbedarf,pfaender_in_auswahlreihenfolge=pfaender_in_auswahlreihenfolge,bewertungsnachweis=bewertungsnachweis)
 ergebnis <- .ergebnis(wert,'EUR_und_Pfandzuordnung','BGB_PFAND_VERWERTUNGSBEDARF',eingaben,list(list(operation='In vorgegebener Reihenfolge positive verf\u00fcgbare Nettoerl\u00f6se bis Bedarfsdeckung summieren; danach keine weiteren Pf\u00e4nder einbeziehen.')),eingaben)
 ergebnis$hinweise <- list("Nur numerisches Bedarfsmodell nach1230 f\u00fcr einzeln verwertbare Pf\u00e4nder mit vorqualifizierter zul\u00e4ssiger Auswahlreihenfolge. Keine Optimierung oder eigene Bestimmung des Wahlrechts. Nettoerl\u00f6se sind belastbar bewertete, gerade f\u00fcr diese Forderung verf\u00fcgbare Betr\u00e4ge nach Kosten und vorrangigen Rechten; Bedarfsbetrag ohne erneute Aufnahme bereits abgezogener Kosten. Keine unsicheren Prognosen als tats\u00e4chlich erzielte Erl\u00f6se ausgeben. Bei ver\u00e4nderten Erl\u00f6sen/Bedingungen neu rechnen; Ergebnis erteilt keine Verkaufserlaubnis. Pf\u00e4nder mit null verf\u00fcgbarem Erl\u00f6s tragen zur Deckung nichts bei; dies entscheidet kein sonstiges Verwertungsrecht. Ein Pfand ist hier eine unteilbare Verkaufseinheit; weitere Teilbarkeit, gemeinsamer Mehrerl\u00f6s, negative Nettoerl\u00f6se, weitere Forderungen und abweichende Auswahlvereinbarungen vorab abgrenzen. \u00dcberschuss ist nur Rechendifferenz; seine Rechtszuordnung gesondert nach1247.")
 ergebnis
}
