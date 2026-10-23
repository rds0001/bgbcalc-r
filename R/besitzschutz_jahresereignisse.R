besitzschutz_jahresereignisse <- function(stoerung_lokal_am=NULL, stoerung_utc=NULL, ereignisse=NULL, monatsendregel=NULL, einordnungsnachweis=NULL) {
 s <- .datum(stoerung_lokal_am,'stoerung_lokal_am');u <- .reise_utc_zeitpunkt(stoerung_utc,'stoerung_utc');.text(einordnungsnachweis,'einordnungsnachweis');.vorhanden(ereignisse,'ereignisse')
 if(!is.list(ereignisse)||!is.null(names(ereignisse))||length(ereignisse)>1000) .fehler('ereignisse','Liste mit h\u00f6chstens1000Ereignissen erforderlich.')
 g <- rueckwaertsfrist_kalendergrenze(stoerung_lokal_am,1,'jahre','ereignistag',monatsendregel,einordnungsnachweis)$wert$grenztag_beginn;von <- .datum(g,'fensterbeginn');ids <- character();auswahl <- list()
 for(e in ereignisse) {
  if(!is.list(e)||is.null(names(e))||length(e)!=3||!setequal(names(e),c('ereignis_id','lokal_am','zeitpunkt_utc'))) .fehler('ereignisse','Genau Kennung,lokal_am,zeitpunkt_utc erforderlich.')
  k <- .text(e$ereignis_id,'ereignis_id');tag <- .datum(e$lokal_am,'lokal_am');zeit <- .reise_utc_zeitpunkt(e$zeitpunkt_utc,'zeitpunkt_utc')
  if(k %in% ids) .fehler('ereignis_id','Kennung doppelt.')
  ids <- c(ids,k)
  if(von<=tag && tag<=s && zeit<u) auswahl[[length(auswahl)+1]] <- k
 }
 wert <- list(jahresfenster_erster_tag=g,beruecksichtigte_ereignis_ids=auswahl,ereignisanzahl=length(auswahl),mindestens_ein_ereignis=length(auswahl)>0)
 eingaben <- list(stoerung_lokal_am=stoerung_lokal_am, stoerung_utc=stoerung_utc, ereignisse=ereignisse, monatsendregel=monatsendregel, einordnungsnachweis=einordnungsnachweis)
 ergebnis <- .ergebnis(wert,"datum_anzahl_und_wahrheitswert","BGB_BESITZSCHUTZ_JAHRESEREIGNISSE",eingaben,list(list(operation="Jahresr\u00fcckblick berechnen, rechtlich qualifizierte Ereignisse nach lokalem Grenztag und tats\u00e4chlicher UTC-Reihenfolge ausw\u00e4hlen und z\u00e4hlen.")),eingaben)
 ergebnis$hinweise <- list("861II/862II: zeitliches Merkmal der konkreten Besitzerlangung im letzten Jahr vor Entziehung/St\u00f6rung; rechtliche Fehlerhaftigkeit und Gegen\u00fcberbeziehung separat.1029: mindestens eine qualifizierte Dienstbarkeitsaus\u00fcbung im Jahresfenster, keine Mindesth\u00e4ufigkeit \u00fcber einmal hinaus. Gemeinsamer R\u00fcckw\u00e4rtskern bestimmt Grenztagesbeginn mit ausdr\u00fccklich vorgegebener Monatsendmethode. Ereignisse am Grenztag z\u00e4hlen, Ereignisse am St\u00f6rungstag nur soweit ihrUTC-Zeitpunkt tats\u00e4chlich vor der St\u00f6rung liegt. Sp\u00e4tere/gleichzeitige Ereignisse z\u00e4hlen nicht. F\u00fcr861/862die konkret betrachtete Besitzerlangung eingeben; nicht jede beliebige Aus\u00fcbung als Neuerwerb behandeln. Vollst\u00e4ndige und konsistente Zeitpunkte rechtlich vorqualifiziert, keine stille UTC-zu-Lokaldatum-Umrechnung. Ausgabe nur Zeitmerkmale, keine Besitzschutzentscheidung.864-Erl\u00f6schen/Anspruchswahrung getrennt.")
 ergebnis
}
