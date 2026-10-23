rechtsverfolgung_sondergrundfrist <- function(fristfall=NULL, ereignis_am=NULL, einordnungsnachweis=NULL) {
 faelle <- list(eilverfahren_zustellung_204=1,behoerdliche_vorentscheidung_204=3,gerichtsstandsbestimmung_204=3,verbandsunterlassung_zustellung_204a=1)
 .auswahl(fristfall,'fristfall',names(faelle))
 .text(einordnungsnachweis,'einordnungsnachweis')
 wert <- list(rechnerisches_fristende=.iso(.frist(ereignis_am,faelle[[fristfall]],'monate','ereignis')))
 eingaben <- list(fristfall=fristfall, ereignis_am=ereignis_am, einordnungsnachweis=einordnungsnachweis)
 ergebnis <- .ergebnis(wert,"datum","BGB_RECHTSVERFOLGUNG_SONDERGRUNDFRIST",eingaben,list(list(operation="Gesetzlich ausgew\u00e4hlte Ein- oder Dreimonats-Ereignisgrundfrist mit vorhandenem Kalenderkern berechnen.")),eingaben)
 ergebnis$hinweise <- list("\u00a7204I9: ma\u00dfgebliche Verk\u00fcndung oder Zustellung an Gl\u00e4ubiger, danach Monatsfrist zur Zustellung an Schuldner.204I12: Erledigung des beh\u00f6rdlichen Gesuchs, danach drei Monate f\u00fcr Klage/zul\u00e4ssigen Folgeantrag;204I13 entsprechend nach Erledigung des Gerichtsstandsbestimmungsgesuchs.204aI2: ma\u00dfgebliche Verk\u00fcndung oder Zustellung der einstweiligen Verf\u00fcgung an Antragsteller, danach Monat zur Zustellung an Antragsgegner. Fristausl\u00f6ser rechtlich vorqualifizieren, nicht Antragseinreichung oder Kenntnis frei einsetzen. Nur Grundfristen: entsprechende206/210/211-Korrekturen nach204III f\u00fcr die dort genannten204-F\u00e4lle zus\u00e4tzlich, keine ungepr\u00fcfte \u00dcbertragung dieses Verweises auf204aI2.193 bei feststehender Anwendung gesondert. Keine automatische Hemmungs-/R\u00fcckwirkungsentscheidung, keine Berechnung aus dem KapMuG au\u00dferhalb desBGB.")
 ergebnis
}
verbandsklage_hemmungsnachlauf <- function(verfahrensende_am=NULL, teilnahmefall=NULL, teilnahmeende_am=NULL, einordnungsnachweis=NULL) {
 .wahrheitswert(teilnahmefall,'teilnahmefall');.text(einordnungsnachweis,'einordnungsnachweis')
 ereignisse <- c()
 if(!is.null(verfahrensende_am)) ereignisse <- c(ereignisse,as.numeric(.datum(verfahrensende_am,'verfahrensende_am')))
 if(!is.null(teilnahmeende_am)) {
  if(!teilnahmefall) .fehler('teilnahmeende_am','Teilnahmeende nur im qualifizierten Teilnahmefall eingeben.')
  ereignisse <- c(ereignisse,as.numeric(.datum(teilnahmeende_am,'teilnahmeende_am')))
 }
 if(!length(ereignisse)) .vorhanden(NULL,'beendendes_ereignis')
 wert <- list(rechnerisches_nachlaufende=.iso(.frist(.iso(as.Date(min(ereignisse),origin='1970-01-01')),6,'monate','ereignis')))
 eingaben <- list(verfahrensende_am=verfahrensende_am, teilnahmefall=teilnahmefall, teilnahmeende_am=teilnahmeende_am, einordnungsnachweis=einordnungsnachweis)
 ergebnis <- .ergebnis(wert,"datum","BGB_VERBANDSKLAGE_HEMMUNGSNACHLAUF",eingaben,list(list(operation="Fr\u00fchestes einschl\u00e4giges Verfahrens-/Teilnahmeende bestimmen und sechsmonatigen Hemmungsnachlauf berechnen.")),eingaben)
 ergebnis$hinweise <- list("\u00a7204aIII: sechsmonatiger Nachlauf ab rechtskr\u00e4ftiger Entscheidung/anderweitigem Verfahrensende entsprechend204II1; im qualifizierten Teilnahmefall auch ab Ende der Teilnahme, insbesondere R\u00fccknahme der Registeranmeldung. Wenn beide einschl\u00e4gigen Ereignisse feststehen, ma\u00dfgeblich ist das fr\u00fchere Nachlaufende. Kein Stillstand durch Nichtbetreiben als zus\u00e4tzlicher204a-Ausl\u00f6ser: der Verweis nennt nur204II1. Teilnahmefall ausschlie\u00dflich204aI1Nr3/4 oderII2, gegebenenfalls gleichgestellte UnternehmerIV; keine beliebige Nichtteilnahme bei Unterlassungsklage. Ohne bekanntes Endereignis kein fiktives Ende des laufenden Schutzes. Keine automatische Addition des Ergebnisses zur Verj\u00e4hrungsfrist: normierte tats\u00e4chliche Hemmungstage und209 gesondert berechnen.")
 ergebnis
}
