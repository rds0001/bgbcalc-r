bereicherung_haftungszeitpunkte <- function(empfang_utc=NULL, kenntnis_rechtsgrundmangel_utc=NULL, rechtshaengigkeit_utc=NULL, haftung_ab_empfang_qualifiziert=NULL, sonderfall_820_qualifiziert=NULL, kenntnis_erfolgsverfehlung_utc=NULL, einordnungsnachweis=NULL) {
 e <- .reise_utc_zeitpunkt(empfang_utc,'empfang_utc');ab <- .wahrheitswert(haftung_ab_empfang_qualifiziert,'haftung_ab_empfang_qualifiziert');s <- .wahrheitswert(sonderfall_820_qualifiziert,'sonderfall_820_qualifiziert');.text(einordnungsnachweis,'einordnungsnachweis')
 if(s&&!ab) .fehler('haftung_ab_empfang_qualifiziert','820I setzt Empfangshaftung voraus.')
 if(!s&&!is.null(kenntnis_erfolgsverfehlung_utc)) .fehler('kenntnis_erfolgsverfehlung_utc','Nur im820-Sonderfall verwenden.')
 zeiten <- if(ab) list(list(zeit=e,text=empfang_utc)) else list()
 for(name in c('kenntnis_rechtsgrundmangel_utc','rechtshaengigkeit_utc')) {
  z <- get(name)
  if(!is.null(z)) {t <- .reise_utc_zeitpunkt(z,name);zeiten[[length(zeiten)+1]] <- list(zeit=if(t<e)e else t,text=if(t<e)empfang_utc else z)}
 }
 zins <- NULL
 if(s&&!is.null(kenntnis_erfolgsverfehlung_utc)) {t <- .reise_utc_zeitpunkt(kenntnis_erfolgsverfehlung_utc,'kenntnis_erfolgsverfehlung_utc');zins <- if(t<e)empfang_utc else kenntnis_erfolgsverfehlung_utc}
 haft <- if(length(zeiten)) zeiten[[which.min(vapply(zeiten,function(z)as.numeric(z$zeit),numeric(1)))]]$text else NULL
 wert <- list(beginn_verschaerfter_haftung_utc=haft,zins_und_nutzungskenntnis_820_utc=zins)
 eingaben <- list(empfang_utc=empfang_utc, kenntnis_rechtsgrundmangel_utc=kenntnis_rechtsgrundmangel_utc, rechtshaengigkeit_utc=rechtshaengigkeit_utc, haftung_ab_empfang_qualifiziert=haftung_ab_empfang_qualifiziert, sonderfall_820_qualifiziert=sonderfall_820_qualifiziert, kenntnis_erfolgsverfehlung_utc=kenntnis_erfolgsverfehlung_utc, einordnungsnachweis=einordnungsnachweis)
 ergebnis <- .ergebnis(wert,"utc_zeitpunkte","BGB_BEREICHERUNG_HAFTUNGSZEITPUNKTE",eingaben,list(list(operation="Fr\u00fchestes qualifiziertes Haftungsereignis ab Empfang bestimmen; getrennten820II-Kenntniszeitpunkt ausweisen.")),eingaben)
 ergebnis$hinweise <- list("818IV/819: fr\u00fchesten einschl\u00e4gigen Haftungszeitpunkt aus Rechtsh\u00e4ngigkeit,819I-Kenntnis und qualifiziertem Empfangstatbestand berechnen; keine Haftung vor Empfang.820I setzt Haftung ab Empfang voraus;820II-Zins-/Nutzungsgrenze bleibt davon getrennt beim tats\u00e4chlichen Kenntniszeitpunkt. Fehlende Kenntnis erzeugt keinen fiktiven Zinsstart. Keine automatische Gleichsetzung mit dem Folgetag eines291-Prozesszinsbeginns; Umrechnung auf rechtlich qualifizierte Zinstage mit vorhandener Kalender-/Zinsrechnung gesondert. Keine pauschale Streichung jeder Entreicherung nach einem Datum: allgemeine Haftungsregeln, Zurechnung und820II-Nutzungsentreicherung unterscheiden.821-Verj\u00e4hrungseinrede hat keine weitere Betragsformel.822-Herausgabe des Dritten nur im rechtlich festgestellten Umfang des durch unentgeltliche Weitergabe verursachten Haftungsausschlusses, keine doppelte Forderung f\u00fcr denselben Verm\u00f6genswert.")
 ergebnis
}
