adoption_ersetzungswartefrist <- function(geburt_am=NULL,belehrung_oder_erste_handlung_am=NULL,fristbeginnnachweis=NULL) {
  geburt <- .datum(geburt_am,"geburt_am"); beginn <- .datum(belehrung_oder_erste_handlung_am,"belehrung_oder_erste_handlung_am")
  .text(fristbeginnnachweis,"fristbeginnnachweis")
  warteende <- .frist(belehrung_oder_erste_handlung_am,3,"monate","ereignis")
  mindestende <- .frist(geburt_am,5,"monate","ereignis")
  eingaben <- list(geburt_am=geburt_am,belehrung_oder_erste_handlung_am=belehrung_oder_erste_handlung_am,fristbeginnnachweis=fristbeginnnachweis)
  wert <- list(dreimonatsfristende=.iso(warteende),fuenfmonatsmindestende=.iso(mindestende),wartefristende=.iso(max(warteende,mindestende)))
  ergebnis <- .ergebnis(wert,"daten","BGB_ADOPTION_ERSETZUNGSWARTEFRIST",eingaben,list(list(operation="Maximum der Dreimonatsfrist ab qualifiziertem Beginn und der F\u00fcnfmonatsgrenze ab Geburt bilden.")),eingaben)
  ergebnis$hinweise <- list("\u00a71748II betrifft Gleichg\u00fcltigkeit ohne zugleich anhaltende gr\u00f6bliche Pflichtverletzung. Beginn ist wirksame Belehrung oder im gesetzlich qualifizierten Ausnahmefall erste Handlung des Jugendamts zur Belehrung/Beratung oder Aufenthaltsermittlung. Beratung, Nachforschungen und Ausnahmevoraussetzungen vorqualifiziert. Ergebnisse sind Ablaufdaten; Ersetzung fr\u00fchestens nach Ablauf, keine automatische Ersetzungsbefugnis. Keine\u00a7193-Verl\u00e4ngerung der blo\u00dfen Wartezeit. Andere Ersetzungsgr\u00fcnde nachAbs\u00e4tzen1/3/4 nicht auf diese Wartezeit reduzieren.")
  ergebnis
}
adoption_aufhebungsgrundfrist <- function(annahme_am=NULL,relativer_fristbeginn_am=NULL,fristbeginnnachweis=NULL) {
  .datum(annahme_am,"annahme_am"); .datum(relativer_fristbeginn_am,"relativer_fristbeginn_am")
  .text(fristbeginnnachweis,"fristbeginnnachweis")
  relativ <- .frist(relativer_fristbeginn_am,1,"jahre","ereignis")
  absolut <- .frist(annahme_am,3,"jahre","ereignis")
  eingaben <- list(annahme_am=annahme_am,relativer_fristbeginn_am=relativer_fristbeginn_am,fristbeginnnachweis=fristbeginnnachweis)
  wert <- list(jahresgrundfristende=.iso(relativ),dreijahresgrundgrenze=.iso(absolut),antragsgrundfristende=.iso(min(relativ,absolut)))
  ergebnis <- .ergebnis(wert,"daten","BGB_ADOPTION_AUFHEBUNGSGRUNDFRIST",eingaben,list(list(operation="Minimum der Jahresgrundfrist ab qualifiziertem relativen Beginn und Dreijahresgrundgrenze ab Annahme bilden.")),eingaben)
  ergebnis$hinweise <- list("Nur ungest\u00f6rte Grundfristen nach\u00a71762II. Relativen Beginn nach Buchstaben a bis e einschlie\u00dflich etwaiger Vertreterkenntnis oder Ablaufs der\u00a71747II1-Frist rechtlich vorqualifizieren; nicht allgemein Kenntnis der Annahme einsetzen. \u00a7\u00a7206/210 und eine einschl\u00e4gige\u00a7193-Korrektur sind hier nicht berechnet, insbesondere keine Behauptung absolut unkorrigierbarer Dreijahresfrist. Liegt relativer Beginn erst nach Dreijahresgrenze, bleibt das errechnete Grundende fr\u00fcher; daraus folgt kein automatisches Erl\u00f6schensurteil. Antragsberechtigung, Vertretung, Beurkundung und Aufhebungsgrund gesondert.")
  ergebnis
}
