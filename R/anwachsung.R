erbteil_anwachsungsquoten <- function(eingesetzte_erben = NULL, weggefallener_erbe_id = NULL,
    gesetzliche_erbfolge_ausgeschlossen = NULL, anwachsung_testamentarisch_ausgeschlossen = NULL,
    vorrangiges_ersatzerbrecht = NULL, einordnungsnachweis = NULL) {
  .vorhanden(eingesetzte_erben, "eingesetzte_erben")
  if (!is.list(eingesetzte_erben) || !is.null(names(eingesetzte_erben)) || length(eingesetzte_erben) < 2 || length(eingesetzte_erben) > 1000)
    .fehler("eingesetzte_erben", "Liste mit 2 bis 1000 eingesetzten Erben erforderlich.")
  namen <- character(); quoten <- list(); gruppen <- list()
  summe <- .bruch(0)
  for (i in seq_along(eingesetzte_erben)) {
    erbe <- eingesetzte_erben[[i]]
    if (!is.list(erbe) || !identical(sort(names(erbe)), sort(c("erbe_id", "erbquote", "gemeinschaft_id"))))
      .fehler("eingesetzte_erben", "Genau erbe_id, erbquote und gemeinschaft_id erforderlich.")
    name <- .text(erbe$erbe_id, "erbe_id")
    if (name %in% namen) .fehler("erbe_id", "Erben d\u00fcrfen nicht doppelt vorkommen.")
    quote <- .zahleneingabe(erbe$erbquote)
    if (.vergleichen(quote, .bruch(0)) <= 0 || .vergleichen(quote, .bruch(1)) > 0)
      .fehler("erbquote", "Positive Originalquote h\u00f6chstens eins erforderlich.")
    gruppe <- erbe$gemeinschaft_id
    if (!is.null(gruppe)) .text(gruppe, "gemeinschaft_id")
    namen <- c(namen, name); quoten[[i]] <- quote; gruppen[i] <- list(gruppe)
    summe <- .addieren(summe, quote)
  }
  weg <- .text(weggefallener_erbe_id, "weggefallener_erbe_id")
  if (!(weg %in% namen)) .fehler("weggefallener_erbe_id", "Weggefallener Erbe muss genau einmal in der Originalliste stehen.")
  .wahrheitswert(gesetzliche_erbfolge_ausgeschlossen, "gesetzliche_erbfolge_ausgeschlossen")
  .wahrheitswert(anwachsung_testamentarisch_ausgeschlossen, "anwachsung_testamentarisch_ausgeschlossen")
  .wahrheitswert(vorrangiges_ersatzerbrecht, "vorrangiges_ersatzerbrecht")
  .text(einordnungsnachweis, "einordnungsnachweis")
  vergleich <- .vergleichen(summe, .bruch(1))
  if (vergleich > 0 || (gesetzliche_erbfolge_ausgeschlossen && vergleich != 0) || (!gesetzliche_erbfolge_ausgeschlossen && vergleich >= 0))
    .fehler("eingesetzte_erben", "Bei vollst\u00e4ndigem Ausschluss gesetzlicher Erbfolge Quotensumme eins, bei verbleibendem gesetzlichen Erbteil strikt unter eins erforderlich.")
  index <- match(weg, namen)
  uebrige <- setdiff(seq_along(namen), index)
  empfaenger <- uebrige[vapply(uebrige, function(i) !is.null(gruppen[[index]]) && identical(gruppen[[i]], gruppen[[index]]), logical(1))]
  if (length(empfaenger) == 0 && gesetzliche_erbfolge_ausgeschlossen) empfaenger <- uebrige
  if (anwachsung_testamentarisch_ausgeschlossen || vorrangiges_ersatzerbrecht) empfaenger <- integer()
  verteilungssumme <- .bruch(0)
  for (i in empfaenger) verteilungssumme <- .addieren(verteilungssumme, quoten[[i]])
  anteile <- lapply(uebrige, function(i) {
    zusatz <- if (i %in% empfaenger) .multiplizieren(quoten[[index]], .dividieren(quoten[[i]], verteilungssumme)) else .bruch(0)
    list(erbe_id = namen[[i]], urspruenglicher_erbteil = .bruchteile(quoten[[i]]),
      angewachsener_erbteil = .bruchteile(zusatz), gesamter_erbteil = .bruchteile(.addieren(quoten[[i]], zusatz)))
  })
  wert <- list(anwachsung_erfolgt = length(empfaenger) > 0, erbteile = anteile,
    nicht_angewachsener_wegfallender_erbteil = .bruchteile(if (length(empfaenger) > 0) .bruch(0) else quoten[[index]]))
  eingaben <- list(eingesetzte_erben = eingesetzte_erben, weggefallener_erbe_id = weggefallener_erbe_id,
    gesetzliche_erbfolge_ausgeschlossen = gesetzliche_erbfolge_ausgeschlossen,
    anwachsung_testamentarisch_ausgeschlossen = anwachsung_testamentarisch_ausgeschlossen,
    vorrangiges_ersatzerbrecht = vorrangiges_ersatzerbrecht, einordnungsnachweis = einordnungsnachweis)
  ergebnis <- .ergebnis(wert, "erbquoten", "BGB_ERBTEIL_ANWACHSUNGSQUOTEN", eingaben,
    list(list(operation = "Empf\u00e4ngerkreis mit Gruppenvorrang und Ausschl\u00fcssen bestimmen; weggefallene Quote proportional zu Originalquoten verteilen")), eingaben)
  ergebnis$annahmen <- list("Ein einzelner rechtlich qualifizierter Wegfall; vollst\u00e4ndig bestimmte Originalquoten und einfache, nicht verschachtelte gemeinschaftliche Erbteile; feste lokale BGB-Fassung.")
  ergebnis$hinweise <- list("Alle eingesetzten Erben einschlie\u00dflich weggefallenem Erben mit Originalquoten angeben. gemeinschaft_id bezeichnet gemeinsame Einsetzung auf denselben Erbteil, keine famili\u00e4re N\u00e4he; NULL bedeutet keine Gruppe. Vorrang innerhalb der Gruppe des Weggefallenen; ohne verbleibendes Gruppenmitglied nur bei Ausschluss gesetzlicher Erbfolge allgemeine Anwachsung. Ausschluss nach\u00a72094 Absatz3 bezieht sich hier auf die gesamte untersuchte Anwachsung; vorrangiges Ersatzerbrecht\u00a72099 sperrt sie. Nicht angewachsene Quote wird weder einem gesetzlichen Erben noch einem Ersatzerben automatisch zugeteilt. Mehrere Wegf\u00e4lle, verschachtelte Gruppen, individuelle Teil-Ausschl\u00fcsse und bereits angewachsene Sondererbteile au\u00dferhalb dieses Einzelschrittmodells. Angewachsener Teil bleibt f\u00fcr Verm\u00e4chtnisse, Auflagen und Ausgleichung nach\u00a72095 gesondert ausgewiesen; Gesamtquote beseitigt diese Trennung nicht.")
  ergebnis
}
