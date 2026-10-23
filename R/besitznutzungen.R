besitz_nutzungswerte_im_haftungszeitraum <- function(haftungsbeginn_utc=NULL, beginn_eingeschlossen=NULL, abrechnungsende_utc=NULL, nutzungen=NULL, einordnungsnachweis=NULL) {
 beginn <- .reise_utc_zeitpunkt(haftungsbeginn_utc,'haftungsbeginn_utc');ende <- .reise_utc_zeitpunkt(abrechnungsende_utc,'abrechnungsende_utc')
 .wahrheitswert(beginn_eingeschlossen,'beginn_eingeschlossen');.text(einordnungsnachweis,'einordnungsnachweis');.vorhanden(nutzungen,'nutzungen')
 if(ende<beginn) .fehler('abrechnungsende_utc','Ende darf nicht vor Beginn liegen.')
 if(!is.list(nutzungen) || !is.null(names(nutzungen)) || length(nutzungen)>1000) .fehler('nutzungen','Liste0..1000 erforderlich.')
 namen <- character();gewaehlt <- list();gezogen <- .geld('0');unterlassen <- .geld('0')
 for(p in nutzungen) {
  if(!is.list(p) || !identical(sort(names(p)),sort(c('nutzung_id','nutzungszeitpunkt_utc','nutzungsart','nutzungswert')))) .fehler('nutzungen','Genau Kennung, Zeitpunkt, Art und Wert erforderlich.')
  name <- .text(p$nutzung_id,'nutzung_id')
  if(name %in% namen) .fehler('nutzung_id','Doppelte Kennung unzul\u00e4ssig.')
  namen <- c(namen,name);zeit <- .reise_utc_zeitpunkt(p$nutzungszeitpunkt_utc,'nutzungszeitpunkt_utc');.auswahl(p$nutzungsart,'nutzungsart',c('gezogen','schuldhaft_nichtgezogen'));betrag <- .geld(p$nutzungswert)
  if((zeit>beginn || (beginn_eingeschlossen && zeit==beginn)) && zeit<=ende) {
   gewaehlt <- c(gewaehlt,list(name))
   if(p$nutzungsart=='gezogen') gezogen <- .addieren(gezogen,betrag) else unterlassen <- .addieren(unterlassen,betrag)
  }
 }
 wert <- list(gezogener_nutzungswert=.bruchteile(gezogen),schuldhaft_nichtgezogener_nutzungswert=.bruchteile(unterlassen),gesamter_nutzungswert=.bruchteile(.addieren(gezogen,unterlassen)),beruecksichtigte_nutzung_ids=gewaehlt)
 eingaben <- list(haftungsbeginn_utc=haftungsbeginn_utc, beginn_eingeschlossen=beginn_eingeschlossen, abrechnungsende_utc=abrechnungsende_utc, nutzungen=nutzungen, einordnungsnachweis=einordnungsnachweis)
 ergebnis <- .ergebnis(wert,"EUR","BGB_BESITZ_NUTZUNGSWERTE_IM_HAFTUNGSZEITRAUM",eingaben,list(list(operation="Qualifizierte Nutzungspositionen im ma\u00dfgeblichen Haftungszeitraum ausw\u00e4hlen und Werte nach gezogener und schuldhaft nicht gezogener Nutzung getrennt summieren.")),eingaben)
 ergebnis$hinweise <- list("\u00a7\u00a7987/990,gegebenenfalls991I: qualifizierte Nutzungspositionen nach Haftungszeitraum ausw\u00e4hlen, tats\u00e4chlich gezogene und schuldhaft nicht gezogene Werte getrennt summieren. Anwendungsfall, gegebenenfalls kumulative Verantwortlichkeit mittelbaren Besitzers991I, Bewertungsma\u00dfstab und zeitliche Zuordnung extern. Keine automatische B\u00f6sgl\u00e4ubigkeit, Rechtsh\u00e4ngigkeit oder Verschuldensentscheidung. Mehrt\u00e4gige Nutzungsabschnitte an Haftungsgrenzen vorher rechtlich zutreffend aufteilen; kein pauschales Abstellen auf Buchungs-/Zahlungstag. UTC-Sekunden nur bei ausreichend genauer Normalisierung, keine Subsekunden abschneiden. Werte in Euro begr\u00fcnden keinen automatischen Geldersatz statt Naturherausgabe.988/993-Bereicherung und weitergehende Verzugshaftung gesondert.")
 ergebnis
}
