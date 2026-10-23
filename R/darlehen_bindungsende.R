darlehen_kuendigung_zum_sollzinsbindungsende <- function(kuendigungszugang_am=NULL, sollzinsbindung_endet_am=NULL, periodische_anpassung_bis_ein_jahr=NULL, einordnungsnachweis=NULL) {
 bindung <- .datum(sollzinsbindung_endet_am,'sollzinsbindung_endet_am');.wahrheitswert(periodische_anpassung_bis_ein_jahr,'periodische_anpassung_bis_ein_jahr');.text(einordnungsnachweis,'einordnungsnachweis')
 monat <- .frist(kuendigungszugang_am,1,'monate','ereignis')
 genug <- monat<=bindung
 ende <- if(periodische_anpassung_bis_ein_jahr) {if(genug) bindung else NULL} else max(monat,bindung)
 wert <- list(einmonatige_kuendigungsfrist_letzter_tag=.iso(monat),monatsfrist_zum_bindungsende_eingehalten=genug,rechnerischer_beendigungstag=if(is.null(ende)) NULL else .iso(ende))
 eingaben <- list(kuendigungszugang_am=kuendigungszugang_am, sollzinsbindung_endet_am=sollzinsbindung_endet_am, periodische_anpassung_bis_ein_jahr=periodische_anpassung_bis_ein_jahr, einordnungsnachweis=einordnungsnachweis)
 ergebnis <- .ergebnis(wert,"daten_und_wahrheitswert","BGB_DARLEHEN_KUENDIGUNG_ZUM_SOLLZINSBINDUNGSENDE",eingaben,list(list(operation="Einmonatige K\u00fcndigungsfrist mit Sollzinsbindungsende und gesetzlicher Periodenbeschr\u00e4nkung verbinden.")),eingaben)
 ergebnis$hinweise <- list("\u00a7489I1: Einmonatsfrist ab Zugang mit Sollzinsbindungsende verbinden. Ohne Periodenbeschr\u00e4nkung ist der sp\u00e4tere dieser beiden Tage der rechnerisch fr\u00fcheste Beendigungstag. Bei qualifizierter Anpassung in Zeitr\u00e4umen bis zu einem Jahr ist ausschlie\u00dflich der vorgegebene Bindungsendtag erfasst; ist daf\u00fcr die Monatsfrist nicht eingehalten, kein fristgerechter Termin in dieser Periode (null). Keine n\u00e4chste Periode oder neue Zinsvereinbarung erfinden. K\u00fcndigungsrecht und formelle Wirksamkeit sind vorqualifiziert; keine Feiertagsverschiebung der K\u00fcndigungsfrist.")
 ergebnis
}
