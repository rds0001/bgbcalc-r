erbschaftskauf_zahlungsausgleich <- function(abrechnungsposten=NULL,gesetzliche_lastenverteilung_qualifiziert=NULL,abrechnungsnachweis=NULL) {
 .vorhanden(abrechnungsposten,'abrechnungsposten')
 if(!is.list(abrechnungsposten)||!is.null(names(abrechnungsposten))||length(abrechnungsposten)>1000) .fehler('abrechnungsposten','Liste mit h\u00f6chstens1000 \u00fcberschneidungsfreien Abrechnungsposten erforderlich.')
 namen <- character();kaeufer_soll <- .bruch(0);verkaeufer_soll <- .bruch(0)
 for(p in abrechnungsposten) {
  if(!is.list(p)||!identical(sort(names(p)),sort(c('posten_id','postenart','zeitbezug','betrag','tatsaechliche_partei')))) .fehler('abrechnungsposten','Genau posten_id, postenart, zeitbezug, betrag, tatsaechliche_partei erforderlich.')
  name <- .text(p$posten_id,'posten_id');if(name %in% namen) .fehler('posten_id','Abrechnungsposten nicht doppelt erfassen.');namen <- c(namen,name)
  .auswahl(p$postenart,'postenart',c('nutzungen','gewoehnliche_lasten','schuldzinsen','erbschaftsabgaben','ausserordentliche_stammwertlasten','nachlassschuldtilgung'))
  .auswahl(p$zeitbezug,'zeitbezug',c('vor_kauf','ab_kauf'));.auswahl(p$tatsaechliche_partei,'tatsaechliche_partei',c('kaeufer','verkaeufer'));betrag <- .geld(p$betrag)
  besondere_last <- p$postenart %in% c('erbschaftsabgaben','ausserordentliche_stammwertlasten','nachlassschuldtilgung')
  zustaendig <- if(besondere_last || p$zeitbezug=='ab_kauf') 'kaeufer' else 'verkaeufer';tatsaechlich <- p$tatsaechliche_partei
  if(tatsaechlich!=zustaendig) {
   schuldner <- if(p$postenart=='nutzungen') tatsaechlich else zustaendig
   if(schuldner=='kaeufer') kaeufer_soll <- .addieren(kaeufer_soll,betrag) else verkaeufer_soll <- .addieren(verkaeufer_soll,betrag)
  }
 }
 .wahrheitswert(gesetzliche_lastenverteilung_qualifiziert,'gesetzliche_lastenverteilung_qualifiziert');.text(abrechnungsnachweis,'abrechnungsnachweis')
 eingaben <- list(abrechnungsposten=abrechnungsposten,gesetzliche_lastenverteilung_qualifiziert=gesetzliche_lastenverteilung_qualifiziert,abrechnungsnachweis=abrechnungsnachweis)
 wert <- NULL
 if(gesetzliche_lastenverteilung_qualifiziert) wert <- list(rechnerischer_ausgleich_kaeufer_an_verkaeufer=.bruchteile(kaeufer_soll),rechnerischer_ausgleich_verkaeufer_an_kaeufer=.bruchteile(verkaeufer_soll),saldo_zugunsten_verkaeufer=.bruchteile(.subtrahieren(kaeufer_soll,verkaeufer_soll)))
 ergebnis <- .ergebnis(wert,'EUR','BGB_ERBSCHAFTSKAUF_ZAHLUNGSAUSGLEICH',eingaben,list(list(operation='Nutzungen/gew\u00f6hnliche Lasten/Zinsen vor Kauf Verk\u00e4ufer, ab Kauf K\u00e4ufer; besondere K\u00e4uferlasten zeitunabh\u00e4ngig; tats\u00e4chliche Empf\u00e4nger/Zahler abgleichen und Gegenbetr\u00e4ge saldieren')),eingaben)
 ergebnis$status <- if(!is.null(wert)) 'BERECHNET' else 'NICHT_ANWENDBAR'
 ergebnis$annahmen <- list("Wirksamer Erbschaftskauf mit gesetzlicher Lastenverteilung; vollst\u00e4ndig vorqualifizierte zeitlich abgegrenzte, tats\u00e4chlich vereinnahmte/bezahlte Geldposten.")
 ergebnis$hinweise <- list("Bei Nutzungen ist tats\u00e4chliche Partei der Empf\u00e4nger, bei Lasten/Tilgungen der Zahler. Zeitbezug bezeichnet rechtlich zugeordnete Nutzungs-/Lastenperiode, nicht ungepr\u00fcft Zahlungstag. Regelm\u00e4\u00dfige Posten \u00fcber Kaufstichtag vorher mit fruechte_lasten_betragszuordnung zeitanteilig aufteilen; Zinsen mit vorhandenem Zinskern bestimmen. K\u00e4ufer tr\u00e4gt auch vor Kauf Erbschaftsabgaben und au\u00dferordentliche auf Stammwert gelegte Lasten2379; Tilgungen2378 nur bei rechtlich bestehender K\u00e4uferpflicht, nicht Verk\u00e4uferhaftung f\u00fcr Nichtbestehen2376. Vorverkaufstilgungen des Verk\u00e4ufers sind damit K\u00e4ufererstattung2378II. Eigene unberechtigte Zahlungen/gesonderte Ersatzregime nicht hineinmischen. Kaufpreis,2375-Wertminderung,2381-Verwendungen und Aufrechnungs-/F\u00e4lligkeitsvoraussetzungen separat. Signierter Saldo ist rechnerische Abrechnung, keine automatische Aufrechnung oder Anspruchsentstehung allein aufgrund Zahlung.")
 ergebnis
}
