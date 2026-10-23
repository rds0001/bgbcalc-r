reise_veranstalterruecktritt_zeitgrenzen <- function(reisedauer_tage=NULL, reisebeginn_lokal_am=NULL, reisebeginn_utc=NULL, ruecktrittszugang_lokal_am=NULL, ruecktrittszugang_utc=NULL, vertraglicher_letzter_ruecktritt_utc=NULL, zeitnachweis=NULL) {
 dauer <- .geld(reisedauer_tage);.text(zeitnachweis,'zeitnachweis')
 if(.vergleichen(dauer,.bruch(0))<=0) .fehler('reisedauer_tage','Positive rechtlich ma\u00dfgebliche Reisedauer erforderlich.')
 .datum(reisebeginn_lokal_am,'reisebeginn_lokal_am');r <- .datum(ruecktrittszugang_lokal_am,'ruecktrittszugang_lokal_am');beginn <- .reise_utc_zeitpunkt(reisebeginn_utc,'reisebeginn_utc');zugang <- .reise_utc_zeitpunkt(ruecktrittszugang_utc,'ruecktrittszugang_utc');vertrag <- .reise_utc_zeitpunkt(vertraglicher_letzter_ruecktritt_utc,'vertraglicher_letzter_ruecktritt_utc')
 if(.vergleichen(dauer,.bruch(2))<0) {art <- '48_stunden';tage <- NULL;tag <- NULL;gesetz <- as.numeric(difftime(beginn,zugang,units='secs'))>=172800} else {
  art <- 'kalendertage';tage <- if(.vergleichen(dauer,.bruch(6))>0)20 else 7
  tag <- rueckwaertsfrist_kalendergrenze(reisebeginn_lokal_am,tage,'tage','ereignistag','nur_taggleiche_monate',zeitnachweis)$wert$letzter_voller_tag_vor_grenze
  gesetz <- r<=.datum(tag,'letzter_zugangstag') && zugang<beginn
 }
 v <- zugang<=vertrag
 wert <- list(gesetzlicher_vorlauf=art,kalendertage_vorlauf=tage,letzter_voller_zugangstag=tag,gesetzliche_zeitgrenze_eingehalten=gesetz,vertragliche_zeitgrenze_eingehalten=v,beide_zeitgrenzen_eingehalten=gesetz&&v)
 eingaben <- list(reisedauer_tage=reisedauer_tage, reisebeginn_lokal_am=reisebeginn_lokal_am, reisebeginn_utc=reisebeginn_utc, ruecktrittszugang_lokal_am=ruecktrittszugang_lokal_am, ruecktrittszugang_utc=ruecktrittszugang_utc, vertraglicher_letzter_ruecktritt_utc=vertraglicher_letzter_ruecktritt_utc, zeitnachweis=zeitnachweis)
 ergebnis <- .ergebnis(wert,"daten_und_wahrheitswerte","BGB_REISE_VERANSTALTERRUECKTRITT_ZEITGRENZEN",eingaben,list(list(operation="Reisedauerklasse bestimmen, gesetzliche20/7Kalendertage oder48Stunden pr\u00fcfen und mit vertraglicher R\u00fccktrittszeitgrenze verbinden.")),eingaben)
 ergebnis$hinweise <- list("651hIV1: mehrals6Tage\u219220Kalendertage Vorlauf; mindestens2bis6Tage\u21927Kalendertage; wenigerals2Tage\u219248echteStunden. F\u00fcr Tagesvorl\u00e4ufe ausdr\u00fccklich ereignistagbezogene R\u00fcckw\u00e4rtsanalogie: Grenze beginnt am zur\u00fcckliegenden Vergleichstag, Zugang sp\u00e4testens bis zum vorhergehenden vollen Tag; keine Umrechnung in480/168Stunden. KurzeReise sekundengenau mindestens48Stunden vor Reisebeginn. Gesetzliche und tats\u00e4chliche Vertragsgrenze m\u00fcssen beide eingehalten sein; vertragliche Frist darf gesetzlichen Mindestschutz nicht verk\u00fcrzen. Kein automatischer Teilnehmerzahl-/R\u00fccktrittsgrundtest und keine Geldfolge. Reisedauer ist qualifizierte Tagesgr\u00f6\u00dfe; Zeitspanne der Reise nicht ungepr\u00fcft in24Stunden-Tage umdeuten. Lokaldaten geh\u00f6ren zuUTC-Ereignissen, keine Zeitzone erraten. Keine193-Verl\u00e4ngerung dieses Mindestvorlaufs.651hIV2unverz\u00fcglich bleibt qualitative Anforderung, kein erfundener fixer Stundenwert.")
 ergebnis
}
