staffelmiete_mindestabstaende <- function(staffeln = NULL, vereinbarungsnachweis = NULL) {
  .vorhanden(staffeln, "staffeln")
  if (!is.list(staffeln) || !is.null(names(staffeln)) || length(staffeln) < 2 || length(staffeln) > 1000)
    .fehler("staffeln", "Liste von zwei bis tausend Staffelbeginnen erforderlich.")
  .text(vereinbarungsnachweis, "vereinbarungsnachweis")
  daten <- lapply(staffeln, function(beginn) .datum(beginn, "staffeln"))
  for (stelle in seq.int(2, length(staffeln))) {
    if (daten[[stelle]] <= daten[[stelle - 1]])
      .fehler("staffeln", "Staffelbeginne m\u00fcssen streng aufsteigend sein.")
  }
  pruefungen <- list()
  for (stelle in seq.int(2, length(staffeln))) {
    fruehestens <- .tage_addieren(.frist(staffeln[[stelle - 1]], 1, "jahre", "tagesbeginn"), 1)
    pruefungen[[stelle - 1]] <- list(staffelnummer = stelle, fruehester_beginn = .iso(fruehestens),
      jahresabstand_eingehalten = daten[[stelle]] >= fruehestens)
  }
  wert <- list(alle_jahresabstaende_eingehalten = all(vapply(pruefungen,
      function(p) p$jahresabstand_eingehalten, logical(1))), staffelpruefungen = pruefungen)
  eingaben <- list(staffeln = staffeln, vereinbarungsnachweis = vereinbarungsnachweis)
  ergebnis <- .ergebnis(wert, "kalenderpruefungen", "BGB_STAFFELMIETE_MINDESTABSTAENDE",
    eingaben, list(list(operation = "F\u00fcr jeden Staffelwechsel fr\u00fchesten Beginn nach einem vollen Jahr unver\u00e4nderter Miete bestimmen")), eingaben)
  ergebnis$annahmen <- list("Staffelbeginne gelten jeweils ab Tagesbeginn; vollst\u00e4ndige zeitlich geordnete Folge rechtlich als Staffelmietvereinbarung eingeordnet.")
  ergebnis$hinweise <- list("Nur Mindestabst\u00e4nde nach \u00a7557a Absatz2 Satz1; keine Pr\u00fcfung von Schriftform, Geldbetragsangaben, K\u00fcndigungsausschluss, zul\u00e4ssigen Mieth\u00f6hen oder Rechtsfolgen fehlerhafter Staffeln.",
    "Beginn einer Mietstaffel wird nicht wegen Sonnabend, Sonntag oder Feiertag verschoben; Zahlungstermine sind gesondert.")
  ergebnis
}
