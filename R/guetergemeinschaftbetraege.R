guetergemeinschaft_einbringungsrueckerstattung <- function(verfuegbares_gesamtgut=NULL, einbringungswert_ehegatte=NULL, einbringungswert_anderer=NULL, bewertungsnachweis=NULL) {
  gut <- .geld(verfuegbares_gesamtgut); erster <- .geld(einbringungswert_ehegatte); zweiter <- .geld(einbringungswert_anderer)
  .text(bewertungsnachweis, "bewertungsnachweis")
  summe <- .addieren(erster,zweiter)
  verteilung <- if (.vergleichen(gut,summe) <= 0) gut else summe
  erster_erstattung <- if (.vergleichen(summe,.bruch(0)) == 0) .bruch(0) else .multiplizieren(verteilung,.dividieren(erster,summe))
  zweiter_erstattung <- .subtrahieren(verteilung,erster_erstattung)
  eingaben <- list(verfuegbares_gesamtgut=verfuegbares_gesamtgut,einbringungswert_ehegatte=einbringungswert_ehegatte,einbringungswert_anderer=einbringungswert_anderer,bewertungsnachweis=bewertungsnachweis)
  wert <- lapply(list(rueckerstattung_ehegatte=erster_erstattung,rueckerstattung_anderer=zweiter_erstattung,fehlbetrag_ehegatte=.subtrahieren(erster,erster_erstattung),fehlbetrag_anderer=.subtrahieren(zweiter,zweiter_erstattung),verbleibendes_gesamtgut=.subtrahieren(gut,verteilung)),.bruchteile)
  ergebnis <- .ergebnis(wert,"EUR","BGB_GUETERGEMEINSCHAFT_EINBRINGUNGSRUECKERSTATTUNG",eingaben,list(list(operation="Verf\u00fcgbares Gesamtgut h\u00f6chstens bis Summe der Einbringungswerte proportional zur\u00fcckerstatten; Fehlbetr\u00e4ge und verbleibendes Gesamtgut gesondert ausweisen.")),eingaben)
  ergebnis$hinweise <- list("Scheidung vor Abschluss der Auseinandersetzung und erforderliches Verlangen nach\u00a71478I sind vorausgesetzt. Einbringungswerte nachAbsatz2 qualifiziert und nachAbsatz3 zum Zeitpunkt der jeweiligen Einbringung bewertet. Verf\u00fcgbares Gesamtgut bereits nach vorrangiger Verbindlichkeitenberichtigung und erforderlichen R\u00fcckbehalten bestimmt. Ersatzforderungen/Anrechnung nach\u00a71476II und anschlie\u00dfende \u00dcberschussverteilung sind gesonderte Berechnungen. Keine Bewertung von Gegenst\u00e4nden oder automatische G\u00fcterstandspr\u00fcfung. Bei beiden Einbringungswerten null keine R\u00fcckerstattung und keine Division durch null.")
  ergebnis
}
guetergemeinschaft_freistellungsbetrag <- function(verbindlichkeit=NULL,inanspruchnahme=NULL,verwaltungsfall=NULL,aus_gesamtgut_erlangt=NULL,zuordnungsnachweis=NULL) {
  schuld <- .geld(verbindlichkeit); anspruch <- .geld(inanspruchnahme); erlangt <- .geld(aus_gesamtgut_erlangt)
  .text(verwaltungsfall,"verwaltungsfall"); .text(zuordnungsnachweis,"zuordnungsnachweis")
  if (!(verwaltungsfall %in% c("alleinverwaltung_anderer","gemeinschaftlich","alleinlast_anderer"))) .fehler("verwaltungsfall","alleinverwaltung_anderer, gemeinschaftlich oder alleinlast_anderer erforderlich.")
  if (.vergleichen(anspruch,schuld) > 0) .fehler("inanspruchnahme","Inanspruchnahme darf die erfasste Verbindlichkeit nicht \u00fcbersteigen.")
  grenze <- .dividieren(schuld,.bruch(2))
  if (verwaltungsfall == "alleinverwaltung_anderer" && .vergleichen(erlangt,grenze) < 0) grenze <- erlangt
  if (verwaltungsfall == "alleinlast_anderer") grenze <- .bruch(0)
  rest <- .subtrahieren(anspruch,grenze)
  if (.vergleichen(rest,.bruch(0)) < 0) rest <- .bruch(0)
  eingaben <- list(verbindlichkeit=verbindlichkeit,inanspruchnahme=inanspruchnahme,verwaltungsfall=verwaltungsfall,aus_gesamtgut_erlangt=aus_gesamtgut_erlangt,zuordnungsnachweis=zuordnungsnachweis)
  wert <- list(interne_belastungsgrenze=.bruchteile(grenze),freistellungsbetrag=.bruchteile(rest))
  ergebnis <- .ergebnis(wert,"EUR","BGB_GUETERGEMEINSCHAFT_FREISTELLUNGSBETRAG",eingaben,list(list(operation="Interne Grenze ist H\u00e4lfte der Verbindlichkeit, bei Alleinverwaltung des anderen zus\u00e4tzlich h\u00f6chstens Erlangtes, bei Alleinlast des anderen null; dar\u00fcber liegende Inanspruchnahme freistellen.")),eingaben)
  ergebnis$hinweise <- list("Ein einzelner noch unberichtigter, vor Berichtigung geteiltem Gesamtgut zugeordneter Schuldposten. Betr\u00e4ge einschlie\u00dflich rechtlich zugeordneter Nebenforderungen konsistent abgrenzen. alleinverwaltung_anderer bezeichnet den Schutz des nicht allein verwaltenden Ehegatten nachAbsatz1; gemeinschaftlich Absatz2. alleinlast_anderer bezeichnet ausschlie\u00dflich interne Alleinlast des anderen Ehegatten nachAbsatz3 und geht Verwaltungssituation vor. Qualifizierte Zuordnung ist keine freie Wahl. Erlangtes wird nur inAbsatz1 als zus\u00e4tzliche Grenze verwendet; inAbs\u00e4tzen2/3 nicht automatisch anrechnen. Keine \u00c4nderung der Au\u00dfenhaftung gegen\u00fcber Gl\u00e4ubigern und keine Mehrschuld-/Gesamthaftungsverrechnung.")
  ergebnis
}
