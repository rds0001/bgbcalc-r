ueberziehung_durchschnittsvergleich <- function(kontosaldoabschnitte=NULL,bezugsbetrag=NULL,vergleichsregel=NULL,einordnungsnachweis=NULL) {
 basis <- .geld(bezugsbetrag); .auswahl(vergleichsregel,'vergleichsregel',c('kreditlinie_504a','geduldete_ueberziehung_505'))
 .text(einordnungsnachweis,'einordnungsnachweis'); .vorhanden(kontosaldoabschnitte,'kontosaldoabschnitte')
 if(!is.list(kontosaldoabschnitte) || !is.null(names(kontosaldoabschnitte)) || length(kontosaldoabschnitte)<1 || length(kontosaldoabschnitte)>10000) .fehler('kontosaldoabschnitte','Vollst\u00e4ndige Liste mit1bis10000 nicht \u00fcberlappenden Zeitabschnitten erforderlich.')
 tagessumme <- 0; betragstage <- .bruch(0); durchgehend <- TRUE
 for(abschnitt in kontosaldoabschnitte) {
  if(!is.list(abschnitt) || !identical(sort(names(abschnitt)),sort(c('kalendertage','ueberziehungsbetrag')))) .fehler('kontosaldoabschnitte','Genau kalendertage und ueberziehungsbetrag erforderlich.')
  tage <- .ganzzahl(abschnitt$kalendertage,'kalendertage',1,1000000); betrag <- .geld(abschnitt$ueberziehungsbetrag)
  tagessumme <- tagessumme+tage
  if(tagessumme>1000000) .fehler('kalendertage','Gesamtzeitraum h\u00f6chstens eine Million Kalendertage.')
  betragstage <- .addieren(betragstage,.multiplizieren(betrag,.bruch(tage)))
  durchgehend <- durchgehend && .vergleichen(betrag,.bruch(0))>0
 }
 durchschnitt <- .dividieren(betragstage,.bruch(tagessumme)); grenze <- .multiplizieren(basis,if(vergleichsregel=='kreditlinie_504a') .bruch(3,4) else .bruch(1,6))
 wert <- list(beobachtete_kalendertage=as.integer(tagessumme),durchschnittlicher_ueberziehungsbetrag=.bruchteile(durchschnitt),betragsgrenze=.bruchteile(grenze),betragsgrenze_strikt_ueberschritten=.vergleichen(durchschnitt,grenze)>0,alle_abschnitte_mit_positiver_ueberziehung=durchgehend)
 eingaben <- list(kontosaldoabschnitte=kontosaldoabschnitte,bezugsbetrag=bezugsbetrag,vergleichsregel=vergleichsregel,einordnungsnachweis=einordnungsnachweis)
 ergebnis <- .ergebnis(wert,'EUR_und_tage','BGB_UEBERZIEHUNG_DURCHSCHNITTSVERGLEICH',eingaben,list(list(operation='Summe(Betrag*Kalendertage)/Summe(Kalendertage); Vergleich strikt \u00fcber3/4 Kreditlinie oder1/6 des gesamten Geldeingangs der letzten drei Monate.')),eingaben)
 ergebnis$hinweise <- list("\u00a7504a Absatz1/\u00a7505 Absatz2: Abschnitte m\u00fcssen den rechtlich ma\u00dfgeblichen Beobachtungszeitraum l\u00fcckenlos und \u00fcberschneidungsfrei abdecken; jeder Betrag gilt an allen eingegebenen Kalendertagen des Abschnitts. Guthabenzeiten mit \u00dcberziehungsbetrag0 einbeziehen, nicht weglassen. Nullabschnitt widerlegt rechnerisch ununterbrochene positive Nutzung; fehlende Tage werden nicht automatisch entdeckt. bezugsbetrag ist bei504a der f\u00fcr den Zeitraum unver\u00e4ndert vereinbarte H\u00f6chstbetrag; bei505 der gesamte ma\u00dfgebliche Geldeingang der letzten drei Monate, dessen Monatsdurchschnitt ein Drittel betr\u00e4gt, davon H\u00e4lfte=ein Sechstel. Ge\u00e4nderte Kreditlinien und andere Bewertungs-/Zeitgewichtungskonventionen gesondert qualifizieren. Beobachtungsdauer allein erf\u00fcllt nicht die zus\u00e4tzlichen gesetzlichen Sechsmonats-/Mehr-als-Dreimonatsbedingungen; Kalendermonate mit Kalenderkern pr\u00fcfen, niemals pauschal180/90Tage. Ma\u00dfgeblichen Rechnungsabschluss rechtlich bestimmen. Ergebnis ist Betrags-/Kontinuit\u00e4tsrechnung, keine automatische Beratungspflicht.")
 ergebnis
}
