pflichtteilsergaenzung_beschenktenrang <- function(fehlbetrag = NULL, beschenkte = NULL,
    beschenktenhaftung_2329_anwendbar = NULL, einordnungsnachweis = NULL) {
  rest <- .geld(fehlbetrag)
  .vorhanden(beschenkte, "beschenkte")
  if (!is.list(beschenkte) || !is.null(names(beschenkte)) || length(beschenkte) < 1 || length(beschenkte) > 1000)
    .fehler("beschenkte", "Liste mit 1 bis 1000 unterschiedlich beschenkten Personen und eindeutigen Schenkungsr\u00e4ngen erforderlich.")
  namen <- character(); raenge <- numeric(); grenzen <- list()
  for (eintrag in beschenkte) {
    if (!is.list(eintrag) || !identical(sort(names(eintrag)), sort(c("beschenkter_id", "schenkungsrang", "haftungsgrenze"))))
      .fehler("beschenkte", "Genau beschenkter_id, schenkungsrang und haftungsgrenze erforderlich.")
    name <- .text(eintrag$beschenkter_id, "beschenkter_id")
    rang <- .ganzzahl(eintrag$schenkungsrang, "schenkungsrang", 1, 1000)
    grenze <- .geld(eintrag$haftungsgrenze)
    if (name %in% namen) .fehler("beschenkter_id", "Jede Person nur einmal; wiederholte Schenkungen an dieselbe Person au\u00dferhalb dieses Modells.")
    if (rang %in% raenge) .fehler("schenkungsrang", "Zeitliche Reihenfolge muss eindeutig sein; gleichrangige oder ungekl\u00e4rte Schenkungen au\u00dferhalb dieses Modells.")
    namen <- c(namen, name); raenge <- c(raenge, rang); grenzen <- c(grenzen, list(grenze))
  }
  .wahrheitswert(beschenktenhaftung_2329_anwendbar, "beschenktenhaftung_2329_anwendbar")
  .text(einordnungsnachweis, "einordnungsnachweis")
  eingaben <- list(fehlbetrag = fehlbetrag, beschenkte = beschenkte,
    beschenktenhaftung_2329_anwendbar = beschenktenhaftung_2329_anwendbar,
    einordnungsnachweis = einordnungsnachweis)
  ergebnis <- .geld_ergebnis(NULL, "BGB_PFLICHTTEILSERGAENZUNG_BESCHENKTENRANG", eingaben,
    list(list(operation = "Sp\u00e4ter Beschenkte vor fr\u00fcher Beschenkten bis zur jeweiligen rechtlich bestimmten Haftungsgrenze ber\u00fccksichtigen")))
  if (beschenktenhaftung_2329_anwendbar) {
    zugeordnet <- rep(list(.bruch(0)), length(namen))
    for (index in order(raenge, decreasing = TRUE)) {
      zugeordnet[[index]] <- if (.vergleichen(rest, grenzen[[index]]) < 0) rest else grenzen[[index]]
      rest <- .subtrahieren(rest, zugeordnet[[index]])
    }
    ergebnis$wert <- list(zugeordnete_haftung = lapply(seq_along(namen), function(i)
      list(beschenkter_id = namen[[i]], haftungsbetrag = .bruchteile(zugeordnet[[i]]))),
      nicht_gedeckter_fehlbetrag = .bruchteile(rest))
    ergebnis$status <- "BERECHNET"
  }
  ergebnis$hinweise <- c(ergebnis$hinweise, list("Fehlbetrag nur soweit Erbe rechtlich nicht zur Erg\u00e4nzung verpflichtet ist oder privilegierter Alleinerbenfall\u00a72329 Absatz1 vorliegt; blo\u00dfe Nichtzahlung oder Zahlungsunf\u00e4higkeit ersetzt diese Pr\u00fcfung nicht. Haftungsgrenzen je Schenkung nach Bereicherungsrecht und sonstigen Einwendungen bereits rechtlich bestimmen, nicht ungepr\u00fcft damaligen Geschenkewert verwenden. H\u00f6herer Schenkungsrang bedeutet sp\u00e4ter beschenkt; nicht Eingabereihenfolge, F\u00e4lligkeitsdatum oder Zeitpunkt einer Zahlungsaufforderung. Fr\u00fcher Beschenkter haftet nur soweit sp\u00e4ter Beschenkter nicht verpflichtet ist, nicht blo\u00df solange dieser nicht zahlt. Modell f\u00fcr unterschiedliche Personen mit je einer zeitlich eindeutig geordneten Schenkung; Gleichzeitigkeit, mehrere Schenkungen derselben Person und fehlende Ranginformationen gesondert l\u00f6sen. Geldwerte begrenzen eine Herausgabe zum Befriedigungszweck; keine automatische Umwandlung des Sachherausgabeanspruchs in gew\u00f6hnliche Geldschuld. Abwendung durch Zahlung\u00a72329 Absatz2 und tats\u00e4chliche Erf\u00fcllung separat; keine doppelte Befriedigung."))
  ergebnis
}
