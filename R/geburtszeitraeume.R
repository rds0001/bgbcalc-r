empfaengniszeit_gesetzlicher_zeitraum <- function(geburt_am=NULL) {
  geburt <- .datum(geburt_am,"geburt_am")
  anfang <- .tage_addieren(geburt,-300); ende <- .tage_addieren(geburt,-181)
  eingaben <- list(geburt_am=geburt_am)
  ergebnis <- .ergebnis(list(zeitraum_beginn=.iso(anfang),zeitraum_ende=.iso(ende),tage_einschliesslich=120),"daten","BGB_EMPFAENGNISZEIT_GESETZLICHER_ZEITRAUM",eingaben,list(list(operation="300 und181 Kalendertage vom Geburtsdatum abziehen; beide Grenztage einbeziehen, insgesamt120 Tage.")),eingaben)
  ergebnis$hinweise <- list("Nur gesetzlicher Ausgangszeitraum nach\u00a71600dIII1. Ein feststehender abweichender Empf\u00e4ngniszeitraum nachSatz2 verdr\u00e4ngt diesen Zeitraum und muss fachlich belegt gesondert verwendet werden. Keine medizinische Sch\u00e4tzung und keine Feststellung der Vaterschaft; Beischlaf, Zweifel und sonstige Ausschl\u00fcsse nicht gepr\u00fcft. Nicht mit300-Tage-Regel nach\u00a71593 gleichsetzen.")
  ergebnis
}
geburtsunterhalt_zeitgrenzen <- function(geburt_am=NULL) {
  geburt <- .datum(geburt_am,"geburt_am")
  vor_sechs <- .tage_addieren(geburt,-42)
  nach_acht <- .frist(geburt_am,8,"wochen","ereignis")
  vor_vier <- .monatsende(geburt,-4,FALSE)
  nach_drei <- .frist(geburt_am,3,"jahre","ereignis")
  eingaben <- list(geburt_am=geburt_am)
  ergebnis <- .ergebnis(list(regelzeitraum_beginn=.iso(vor_sechs),regelzeitraum_ende=.iso(nach_acht),erweiterung_fruehester_beginn=.iso(vor_vier),dreijahresgrundgrenze=.iso(nach_drei)),"daten","BGB_GEBURTSUNTERHALT_ZEITGRENZEN",eingaben,list(list(operation="Geburt minus sechs Wochen und plus acht Wochen; fr\u00fcheste Erweiterung minus vier Kalendermonate und Dreijahresgrundgrenze plus drei Jahre.")),eingaben)
  ergebnis$hinweise <- list("Nur gesetzliche Zeitgrenzen nach\u00a71615lI1/II3, kein automatischer Anspruch f\u00fcr den gesamten erweiterten Zeitraum. Schwangerschaft/Krankheit oder Betreuung, fehlende Erwerbserwartung und tats\u00e4chlicher Beginn/Umfang rechtlich qualifizieren. Billigkeitsverl\u00e4ngerungen nachAbsatz2 sind nicht auf drei Jahre begrenzt. Schwangerschafts-/Entbindungskosten k\u00f6nnen nachAbsatz1Satz2 auch au\u00dferhalb des Regelzeitraums entstehen. Absatz4-Verweis f\u00fcr betreuenden Vater gesondert qualifizieren. Keine Unterhaltsh\u00f6he, Tagesproration oder medizinische Berechnung. Ereignisbezogene Enddaten sind Ablaufdaten, keine Altersbeginnberechnung nach\u00a7187II2.")
  ergebnis
}
