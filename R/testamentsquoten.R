testament_erbquoten <- function(erbeinsetzungen = NULL, alleinige_erben_gewollt = NULL,
    auslegungsregeln_anwendbar = NULL, einordnungsnachweis = NULL) {
  .vorhanden(erbeinsetzungen, "erbeinsetzungen")
  if (!is.list(erbeinsetzungen) || !is.null(names(erbeinsetzungen)) ||
      length(erbeinsetzungen) < 1 || length(erbeinsetzungen) > 1000)
    .fehler("erbeinsetzungen", "Liste mit 1 bis 1000 rechtlich bestimmten Erbeinsetzungen erforderlich.")
  namen <- character()
  quoten <- list()
  summe <- .bruch(0)
  for (eintrag in erbeinsetzungen) {
    if (!is.list(eintrag) || !identical(sort(names(eintrag)), sort(c("erbe_id", "bestimmter_erbteil"))))
      .fehler("erbeinsetzungen", "Genau erbe_id und bestimmter_erbteil erforderlich.")
    name <- .text(eintrag$erbe_id, "erbe_id")
    if (name %in% namen) .fehler("erbe_id", "Erben nicht doppelt auff\u00fchren; rechtlich zusammengefasste Einsetzung vorgeben.")
    quote <- NULL
    if (!is.null(eintrag$bestimmter_erbteil)) {
      quote <- .zahleneingabe(eintrag$bestimmter_erbteil)
      if (.vergleichen(quote, .bruch(0)) <= 0 || .vergleichen(quote, .bruch(1)) > 0)
        .fehler("bestimmter_erbteil", "Bestimmter Anteil muss positiv und h\u00f6chstens eins sein.")
      summe <- .addieren(summe, quote)
    }
    namen <- c(namen, name)
    quoten <- c(quoten, list(quote))
  }
  unbekannt <- sum(vapply(quoten, is.null, logical(1)))
  if (length(quoten) == 1 && unbekannt > 0)
    .fehler("erbeinsetzungen", "Ein einzelner Erbe ohne Bruchteilsbestimmung liegt au\u00dferhalb dieses Mehrerben-/Bruchteilsmodells.")
  .wahrheitswert(alleinige_erben_gewollt, "alleinige_erben_gewollt")
  .wahrheitswert(auslegungsregeln_anwendbar, "auslegungsregeln_anwendbar")
  .text(einordnungsnachweis, "einordnungsnachweis")
  eingaben <- list(erbeinsetzungen = erbeinsetzungen, alleinige_erben_gewollt = alleinige_erben_gewollt,
    auslegungsregeln_anwendbar = auslegungsregeln_anwendbar, einordnungsnachweis = einordnungsnachweis)
  wert <- NULL
  if (auslegungsregeln_anwendbar) {
    rest <- .bruch(0)
    if (unbekannt == 0) {
      if (.vergleichen(summe, .bruch(1)) > 0 || (.vergleichen(summe, .bruch(1)) < 0 && alleinige_erben_gewollt)) {
        quoten <- lapply(quoten, function(q) .dividieren(q, summe))
      } else {
        rest <- .subtrahieren(.bruch(1), summe)
      }
    } else if (.vergleichen(summe, .bruch(1)) < 0) {
      unbestimmter_anteil <- .dividieren(.subtrahieren(.bruch(1), summe), .bruch(unbekannt))
      quoten <- lapply(quoten, function(q) if (is.null(q)) unbestimmter_anteil else q)
    } else {
      bestimmte <- Filter(Negate(is.null), quoten)
      kleinster <- Reduce(function(a, b) if (.vergleichen(a, b) < 0) a else b, bestimmte)
      gesamtgewicht <- .addieren(summe, .multiplizieren(kleinster, .bruch(unbekannt)))
      quoten <- lapply(quoten, function(q) .dividieren(if (is.null(q)) kleinster else q, gesamtgewicht))
    }
    wert <- list(erbquoten = lapply(seq_along(namen), function(i)
      list(erbe_id = namen[[i]], erbquote = .bruchteile(quoten[[i]]))), rest_gesetzliche_erbfolge = .bruchteile(rest))
  }
  ergebnis <- .ergebnis(wert, "erbquoten", "BGB_TESTAMENT_ERBQUOTEN", eingaben,
    list(list(operation = "Bestimmte Quoten verh\u00e4ltnism\u00e4\u00dfig anpassen oder gesetzlichen Rest belassen; unbestimmte Quoten aus freiem Rest beziehungsweise kleinstem bestimmten Ausgangsanteil bilden")), eingaben)
  ergebnis$status <- if (!is.null(wert)) "BERECHNET" else "NICHT_ANWENDBAR"
  ergebnis$annahmen <- list("Wirksame Erbeinsetzungen und anwendbare gesetzliche Auslegungsregeln rechtlich bestimmt; feste lokale BGB-Fassung.")
  ergebnis$hinweise <- list("NULL bei bestimmter_erbteil bedeutet vom Erblasser nicht bestimmt, nicht unbekannte Aktenlage. Abweichender Wille, Sonderauslegung\u00a7\u00a72066\u20132069, Erbeinsetzung versus Verm\u00e4chtnis\u00a72087, Wegfall/Ersatzerben und Wirksamkeit vorab pr\u00fcfen. Alleinige-Erben-Wille beeinflusst Unterbelegung ausschlie\u00dflich bestimmter Quoten; bei nicht bestimmten Quoten gelten\u00a7\u00a72091/2092. Bei ersch\u00f6pfter oder \u00fcberbelegter Masse erhalten unbestimmt Bedachte das Gewicht des kleinsten bestimmten Ausgangsanteils; anschlie\u00dfend alle Gewichte gemeinsam normieren. Keine nachtr\u00e4gliche Halbierung bereits normierter Quoten. Gemeinschaftlicher Erbteil\u00a72093 und Anwachsung\u00a72094 nicht automatisch aufgel\u00f6st; hier flache Personenliste ohne solche Gruppen. Gesetzlicher Rest wird ausgewiesen, aber nicht auf gesetzliche Erben verteilt. Eine einzelne Einsetzung ohne Bruchteilsbestimmung au\u00dferhalb dieses Modells.")
  ergebnis
}
