geldschulden_nach_betragsbestimmung_tilgen <- function(zahlung=NULL, betragsbestimmungen=NULL, einordnungsnachweis=NULL) {
 gesamtzahlung <- .geld(zahlung);.text(einordnungsnachweis,'einordnungsnachweis');.vorhanden(betragsbestimmungen,'betragsbestimmungen')
 if(!is.list(betragsbestimmungen) || !is.null(names(betragsbestimmungen)) || length(betragsbestimmungen)<1 || length(betragsbestimmungen)>1000) .fehler('betragsbestimmungen','Liste1..1000 erforderlich.')
 namen <- character();bestimmt_summe <- .geld('0');angerechnet_summe <- .geld('0');zuordnungen <- list()
 for(p in betragsbestimmungen) {
  if(!is.list(p) || length(p)!=3 || !setequal(names(p),c('schuld_id','offener_betrag','bestimmter_zahlungsbetrag'))) .fehler('betragsbestimmungen','Genau Kennung,offenerBetrag,bestimmterZahlungsbetrag erforderlich.')
  name <- .text(p$schuld_id,'schuld_id');offen <- .geld(p$offener_betrag);bestimmt <- .geld(p$bestimmter_zahlungsbetrag)
  if(name %in% namen) .fehler('schuld_id','Eindeutige Schulden erforderlich.')
  namen <- c(namen,name);bestimmt_summe <- .addieren(bestimmt_summe,bestimmt)
  if(.vergleichen(bestimmt_summe,gesamtzahlung)>0) .fehler('betragsbestimmungen','Bestimmte Betr\u00e4ge \u00fcberschreiten verf\u00fcgbare Zahlung.')
  angerechnet <- if(.vergleichen(offen,bestimmt)<0) offen else bestimmt;angerechnet_summe <- .addieren(angerechnet_summe,angerechnet)
  zuordnungen[[length(zuordnungen)+1]] <- list(schuld_id=name,angerechneter_betrag=.bruchteile(angerechnet),restforderung=.bruchteile(.subtrahieren(offen,angerechnet)))
 }
 wert <- list(zuordnungen=zuordnungen,nicht_zugeordnet=.bruchteile(.subtrahieren(gesamtzahlung,angerechnet_summe)))
 eingaben <- list(zahlung=zahlung, betragsbestimmungen=betragsbestimmungen, einordnungsnachweis=einordnungsnachweis)
 ergebnis <- .ergebnis(wert,"EUR","BGB_GELDSCHULDEN_NACH_BETRAGSBESTIMMUNG_TILGEN",eingaben,list(list(operation="Ausdr\u00fcckliche Betragszuordnung je Geldschuld begrenzt anrechnen und verbleibende Betr\u00e4ge berechnen.")),eingaben)
 ergebnis$hinweise <- list("\u00a7366I: rechtlich vorgegebene Betragsbestimmung je Schuld bis zur H\u00f6he des offenen Betrags ausf\u00fchren; verbleibende Forderungen und nicht zugeordneten Teil der Gesamtzahlung ausweisen. Keine zus\u00e4tzliche Verwendung von \u00dcberh\u00e4ngen f\u00fcr andere Schulden entgegen der qualifizierten Bestimmung. Summe der erkl\u00e4rten Betragsbestimmungen gr\u00f6\u00dfer als Zahlung ist widerspr\u00fcchliche Eingabe, keine erfundene anteilige K\u00fcrzung. Gesetzliche Ersatzreihenfolge366II nur bei fehlender Bestimmung in eigener Funktion;367Bestandteile einer Schuld separat. Nicht zugeordnete Zahlung ist keine automatische R\u00fcckforderung. Abweichende Vereinbarungen nur als zuvor rechtlich festgelegte Betragszuordnung, keine freie Vertragsauslegung.")
 ergebnis
}
