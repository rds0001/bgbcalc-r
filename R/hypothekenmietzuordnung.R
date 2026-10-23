hypothek_mietverfuegung_zeitzuordnung <- function(beschlagnahme_am=NULL, mietabschnitte=NULL, einordnungsnachweis=NULL) {
 .text(einordnungsnachweis,'einordnungsnachweis')
 grenze <- hypothek_beschlagnahme_monatsgrenze(beschlagnahme_am,einordnungsnachweis)$wert$letzter_erfasster_monat_endet_am;tag <- .datum(grenze,'monatsgrenze')
 .vorhanden(mietabschnitte,'mietabschnitte')
 if(!is.list(mietabschnitte) || !is.null(names(mietabschnitte)) || length(mietabschnitte)>1000) .fehler('mietabschnitte','Liste0..1000 erforderlich.')
 namen <- character();intervalle <- list();innen <- .geld('0');aussen <- .geld('0');ids <- list()
 for(p in mietabschnitte) {
  if(!is.list(p) || !identical(sort(names(p)),sort(c('abschnitt_id','erster_miettag','letzter_miettag','verfuegungsbetrag')))) .fehler('mietabschnitte','Genau Kennung, Mietzeitgrenzen und Verf\u00fcgungsbetrag erforderlich.')
  name <- .text(p$abschnitt_id,'abschnitt_id')
  if(name %in% namen) .fehler('abschnitt_id','Doppelte Kennung unzul\u00e4ssig.')
  namen <- c(namen,name);a <- .datum(p$erster_miettag,'erster_miettag');b <- .datum(p$letzter_miettag,'letzter_miettag');betrag <- .geld(p$verfuegungsbetrag)
  if(b<a) .fehler('mietabschnitte','Ende vor Beginn.')
  if(a<=tag && tag<b) .fehler('mietabschnitte','Grenz\u00fcberschreitenden Abschnitt zuvor sachgerecht teilen.')
  intervalle <- c(intervalle,list(list(a=a,b=b)))
  if(b<=tag) {innen <- .addieren(innen,betrag);ids <- c(ids,list(name))} else aussen <- .addieren(aussen,betrag)
 }
 vorher <- NULL
 if(length(intervalle)) for(z in intervalle[order(vapply(intervalle,function(x) as.numeric(x$a),numeric(1)))]) {
  if(!is.null(vorher) && z$a<=vorher) .fehler('mietabschnitte','Keine \u00fcberlappenden Abschnitte derselben Forderungsgrundlage.')
  vorher <- z$b
 }
 wert <- list(letzter_erfasster_miettag=grenze,betrag_im_zeitlichen_fenster=.bruchteile(innen),betrag_ausserhalb_des_zeitlichen_fensters=.bruchteile(aussen),abschnitt_ids_im_zeitlichen_fenster=ids)
 eingaben <- list(beschlagnahme_am=beschlagnahme_am, mietabschnitte=mietabschnitte, einordnungsnachweis=einordnungsnachweis)
 ergebnis <- .ergebnis(wert,"EUR","BGB_HYPOTHEK_MIETVERFUEGUNG_ZEITZUORDNUNG",eingaben,list(list(operation="Vor Beschlagnahme verf\u00fcgte Miet-/Pachtabschnittsbetr\u00e4ge nach gesetzlicher Monatsgrenze zeitlich ausw\u00e4hlen und getrennt summieren.")),eingaben)
 ergebnis$hinweise <- list("\u00a71124II: vor Beschlagnahme erfolgte Verf\u00fcgungen nach ihrem Miet-/Pachtzeitraum der Monatsgrenze zuordnen. Beschlagnahme bis einschlie\u00dflich15.: Ende laufender Monat; nach15.: Ende Folgemonat. Betr\u00e4ge vollst\u00e4ndig innerhalb/au\u00dferhalb getrennt summieren. Keine pauschale gleichm\u00e4\u00dfige Tagesaufteilung f\u00fcr einen grenz\u00fcberschreitenden Gesamtbetrag. Nur eine Forderungs-/Vertragsgrundlage je Aufruf; mehrere Vertr\u00e4ge getrennt behandeln. Zeitliche Zuordnung setzt \u00fcbrige1124-Voraussetzungen voraus und entscheidet keine sonstigen Wirksamkeitsfragen.1123-Jahresbefreiung sowie1126-Dreimonatsregel nicht durch diesen Monatsvergleich ersetzen.")
 ergebnis
}
