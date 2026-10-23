zugewinn_anfangsvermoegen_positionssumme <- function(anfangsaktivvermoegen=NULL,anfangsverbindlichkeiten=NULL,privilegierte_erwerbe=NULL,bewertungsnachweis=NULL) {
  aktiv <- .geld(anfangsaktivvermoegen);schulden <- .geld(anfangsverbindlichkeiten)
  .vorhanden(privilegierte_erwerbe,"privilegierte_erwerbe")
  if (!is.list(privilegierte_erwerbe) || length(privilegierte_erwerbe)<1 || length(privilegierte_erwerbe)>10000 || !is.null(names(privilegierte_erwerbe))) .fehler("privilegierte_erwerbe","Liste mit 1 bis 10000 qualifizierten Erwerbspositionen erforderlich; keine Erwerbe ausdr\u00fccklich als eine Nullposition.")
  summe <- .bruch(0);nettoerwerbe <- list()
  for (position in privilegierte_erwerbe) {
    if (!is.list(position) || length(position)!=2 || !setequal(names(position),c("erwerbswert","zugehoerige_verbindlichkeiten"))) .fehler("privilegierte_erwerbe","Genau erwerbswert und zugehoerige_verbindlichkeiten je Position erforderlich.")
    wert <- .geld(position$erwerbswert);lasten <- .geld(position$zugehoerige_verbindlichkeiten)
    netto <- .subtrahieren(wert,lasten);nettoerwerbe[[length(nettoerwerbe)+1]] <- .bruchteile(netto);summe <- .addieren(summe,netto)
  }
  .text(bewertungsnachweis,"bewertungsnachweis")
  anfang <- .subtrahieren(aktiv,schulden)
  eingaben <- list(anfangsaktivvermoegen=anfangsaktivvermoegen,anfangsverbindlichkeiten=anfangsverbindlichkeiten,privilegierte_erwerbe=privilegierte_erwerbe,bewertungsnachweis=bewertungsnachweis)
  wert <- list(urspruengliches_nettoanfangsvermoegen=.bruchteile(anfang),nettoerwerbe=nettoerwerbe,hinzuzurechnende_nettoerwerbssumme=.bruchteile(summe),anfangsvermoegenssumme=.bruchteile(.addieren(anfang,summe)))
  ergebnis <- .ergebnis(wert,"EUR","BGB_ZUGEWINN_ANFANGSVERMOEGEN_POSITIONSSUMME",eingaben,list(list(operation="Anf\u00e4ngliche Verbindlichkeiten vom Anfangsaktivverm\u00f6gen und zugeh\u00f6rige Erwerbsverbindlichkeiten von jedem privilegierten Erwerb abziehen; alle Nettowerte ohne Nullkappung addieren.")),eingaben)
  ergebnis$hinweise <- list("\u00a71374III verlangt ausdr\u00fccklich Schuldenabzug auch \u00fcber die Verm\u00f6gensh\u00f6he hinaus; urspr\u00fcnglicher Nettowert, einzelne Nettoerwerbe und Gesamtsumme k\u00f6nnen negativ sein. Nur rechtlich privilegierte Erwerbe nachAbsatz2 eingeben: von Todes wegen/vorweggenommenes Erbrecht/Schenkung/Ausstattung, nach G\u00fcterstandseintritt und nicht den Umst\u00e4nden nach Eink\u00fcnfte. Anfangsschulden und Erwerbsverbindlichkeiten nicht doppelt zuordnen. Werte und zugeh\u00f6rige Verbindlichkeiten nach rechtlich ma\u00dfgeblichen Bewertungszeitpunkten und konsistenter gegebenenfalls bereits erforderlicher Kaufkraftanpassung vorqualifizieren; keine automatische Indexierung oder Bewertung nach\u00a71376. Keine Erwerbe durch eine Nullposition mit Erwerbswert0 und Verbindlichkeiten0 ausdr\u00fccken. Keine automatische Privilegierungs-/Eink\u00fcnfteentscheidung, keine\u00a71380-Anrechnung und kein abschlie\u00dfender Zugewinnausgleich.")
  ergebnis
}
zugewinn_endvermoegen_positionssumme <- function(endaktivvermoegen=NULL,endverbindlichkeiten=NULL,bezugsstichtag_am=NULL,vermoegensminderungen=NULL,bewertungsnachweis=NULL) {
  aktiv <- .geld(endaktivvermoegen);schulden <- .geld(endverbindlichkeiten);stichtag <- .datum(bezugsstichtag_am,"bezugsstichtag_am")
  .vorhanden(vermoegensminderungen,"vermoegensminderungen")
  if (!is.list(vermoegensminderungen) || length(vermoegensminderungen)<1 || length(vermoegensminderungen)>10000 || !is.null(names(vermoegensminderungen))) .fehler("vermoegensminderungen","Liste mit 1 bis 10000 qualifizierten Minderungspositionen erforderlich; keine Minderung ausdr\u00fccklich als eine Nullposition.")
  summe <- .bruch(0);positionen <- list();namen <- character()
  for (position in vermoegensminderungen) {
    felder <- c("minderung_id","betrag","eingetreten_am","minderungsart","einverstaendnis_anderer")
    if (!is.list(position) || length(position)!=5 || !setequal(names(position),felder)) .fehler("vermoegensminderungen","Genau minderung_id, betrag, eingetreten_am, minderungsart und einverstaendnis_anderer erforderlich.")
    name <- .text(position$minderung_id,"minderung_id")
    if (name %in% namen) .fehler("minderung_id","Denselben Minderungsbetrag nicht mehrfach auff\u00fchren.")
    namen <- c(namen,name)
    betrag <- .geld(position$betrag);datum <- .datum(position$eingetreten_am,"eingetreten_am");art <- .text(position$minderungsart,"minderungsart")
    .wahrheitswert(position$einverstaendnis_anderer,"einverstaendnis_anderer")
    if (!(art %in% c("unentgeltliche_zuwendung","verschwendung","benachteiligung"))) .fehler("minderungsart","Qualifizierte unentgeltliche_zuwendung, verschwendung oder benachteiligung erforderlich.")
    if (datum > stichtag) .fehler("eingetreten_am","Verm\u00f6gensminderung darf nicht nach dem ma\u00dfgeblichen Bezugsstichtag liegen.")
    alt <- FALSE
    if (as.integer(substr(.iso(stichtag),1,4))-as.integer(substr(.iso(datum),1,4))>=10) alt <- .frist(position$eingetreten_am,10,"jahre","ereignis") <= stichtag
    einverstanden <- position$einverstaendnis_anderer && art %in% c("unentgeltliche_zuwendung","verschwendung")
    beruecksichtigt <- if (alt || einverstanden) .bruch(0) else betrag
    summe <- .addieren(summe,beruecksichtigt)
    positionen[[length(positionen)+1]] <- list(minderung_id=name,hinzurechnungsbetrag=.bruchteile(beruecksichtigt))
  }
  .text(bewertungsnachweis,"bewertungsnachweis")
  netto <- .subtrahieren(aktiv,schulden)
  eingaben <- list(endaktivvermoegen=endaktivvermoegen,endverbindlichkeiten=endverbindlichkeiten,bezugsstichtag_am=bezugsstichtag_am,vermoegensminderungen=vermoegensminderungen,bewertungsnachweis=bewertungsnachweis)
  wert <- list(nettoendvermoegen=.bruchteile(netto),hinzurechnungspositionen=positionen,hinzurechnungssumme=.bruchteile(summe),endvermoegenssumme=.bruchteile(.addieren(netto,summe)))
  ergebnis <- .ergebnis(wert,"EUR","BGB_ZUGEWINN_ENDVERMOEGEN_POSITIONSSUMME",eingaben,list(list(operation="Nettoendverm\u00f6gen auch unter null bilden; Minderungen mindestens zehn Jahre vor Bezugsstichtag sowie einverstandene Zuwendung/Verschwendung ausschlie\u00dfen, \u00fcbrige qualifizierte Betr\u00e4ge addieren.")),eingaben)
  ergebnis$hinweise <- list("\u00a71375IbisIII. Tats\u00e4chlichen Verm\u00f6gensminderungsbetrag nach Eintritt des G\u00fcterstands und dessen Wert rechtlich qualifizieren, nicht ungepr\u00fcft Ausgaben-/Schenkungsbruttobetrag. Einwilligungs-/Einverst\u00e4ndnisausschluss nachAbsatz3 gilt ausdr\u00fccklich f\u00fcr unentgeltliche Zuwendung und Verschwendung; eine als Nummer3 qualifizierte Benachteiligung wird nicht allein wegen dieses Eingabeflags ausgeschlossen. Qualifikation nachNummer3 muss einschlie\u00dflich relevanter Umst\u00e4nde bereits belastbar sein. Mindestens zehn Jahre schlie\u00dft Gleichheit ein; vorhandener Kalenderkern, keine3650-Tage-Pauschale. Bezugsstichtag f\u00fcr die konkrete\u00a71375III-Berechnung rechtlich bestimmen, einschlie\u00dflich einschl\u00e4giger Stichtagsregeln\u00a71384/1387; keine freie Wahl. Minderungen/Schulden nicht mehrfach erfassen, \u00fcberschneidende Tatbest\u00e4nde einmal. Endschulden d\u00fcrfen Endaktiva \u00fcbersteigen. Keine automatische Beweislastentscheidung, Bewertungs-/Kaufkraftanpassung oder Pr\u00fcfung einer Benachteiligungsabsicht. Keine Minderungen durch eine Nullposition zum Bezugsstichtag ausdr\u00fccken. \u00a71380-Sonderanrechnung und eingreifende Haftungsgrenzen nicht gel\u00f6st.")
  ergebnis
}
