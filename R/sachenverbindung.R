sachenverbindung_eigentumsquoten <- function(eigentuemer_werte = NULL,
    entstehungsart = NULL, wesentliche_bestandteile = NULL, untrennbar_vermischt = NULL,
    trennungskosten_unverhaeltnismaessig = NULL, hauptsachen_eigentuemer = NULL,
    bewertungsnachweis = NULL) {
  .vorhanden(eigentuemer_werte, "eigentuemer_werte")
  if (!is.list(eigentuemer_werte) || !is.null(names(eigentuemer_werte)) ||
      length(eigentuemer_werte) < 2 || length(eigentuemer_werte) > 1000) {
    .fehler("eigentuemer_werte", "Liste mit 2 bis 1000 unterschiedlichen Eigent\u00fcmern erforderlich.")
  }
  .auswahl(entstehungsart, "entstehungsart", c("verbindung", "vermischung_vermengung"))
  for (name in c("wesentliche_bestandteile", "untrennbar_vermischt", "trennungskosten_unverhaeltnismaessig")) {
    .wahrheitswert(get(name), name)
  }
  namen <- character()
  werte <- list()
  summe <- .bruch(0)
  for (eintrag in eigentuemer_werte) {
    if (!is.list(eintrag) || !identical(sort(names(eintrag)), sort(c("eigentuemer_id", "sachenwert")))) {
      .fehler("eigentuemer_werte", "Genau eigentuemer_id und sachenwert erforderlich.")
    }
    name <- .text(eintrag$eigentuemer_id, "eigentuemer_id")
    if (name %in% namen) .fehler("eigentuemer_id", "Eigent\u00fcmer nicht doppelt auff\u00fchren; Werte zuvor zusammenfassen.")
    wert <- .geld(eintrag$sachenwert)
    namen <- c(namen, name)
    werte[[length(werte) + 1L]] <- wert
    summe <- .addieren(summe, wert)
  }
  if (!is.null(hauptsachen_eigentuemer)) {
    .text(hauptsachen_eigentuemer, "hauptsachen_eigentuemer")
    if (!hauptsachen_eigentuemer %in% namen) .fehler("hauptsachen_eigentuemer", "Eigent\u00fcmer der Hauptsache muss in der Liste enthalten sein.")
  } else if (summe$zaehler == 0) {
    .fehler("eigentuemer_werte", "Ohne Hauptsache ist ein positiver Gesamtwert f\u00fcr das Wertverh\u00e4ltnis erforderlich.")
  }
  .text(bewertungsnachweis, "bewertungsnachweis")
  anwendbar <- if (entstehungsart == "verbindung") wesentliche_bestandteile else
    untrennbar_vermischt || trennungskosten_unverhaeltnismaessig
  quoten <- NULL
  if (anwendbar) {
    quoten <- lapply(seq_along(namen), function(i) list(eigentuemer_id = namen[[i]],
      eigentumsquote = .bruchteile(if (!is.null(hauptsachen_eigentuemer)) .bruch(as.numeric(namen[[i]] == hauptsachen_eigentuemer)) else .dividieren(werte[[i]], summe))))
  }
  eingaben <- list(eigentuemer_werte = eigentuemer_werte, entstehungsart = entstehungsart,
    wesentliche_bestandteile = wesentliche_bestandteile, untrennbar_vermischt = untrennbar_vermischt,
    trennungskosten_unverhaeltnismaessig = trennungskosten_unverhaeltnismaessig,
    hauptsachen_eigentuemer = hauptsachen_eigentuemer, bewertungsnachweis = bewertungsnachweis)
  ergebnis <- .ergebnis(quoten, "eigentumsquoten", "BGB_SACHENVERBINDUNG_EIGENTUMSQUOTEN", eingaben,
    list(list(operation = "Verbindung/Vermischungstatbestand pr\u00fcfen; Hauptsacheneigent\u00fcmer erh\u00e4lt eins, sonst Werte im Entstehungszeitpunkt proportional verteilen")), eingaben)
  ergebnis$status <- if (anwendbar) "BERECHNET" else "NICHT_ANWENDBAR"
  ergebnis$annahmen <- list("Bewegliche Sachen verschiedener Eigent\u00fcmer, vergleichbare Werte im Zeitpunkt der Verbindung/Vermischung und Hauptsacheneigenschaft rechtlich bestimmt.")
  ergebnis$hinweise <- list("Keine automatische Hauptsachenwahl allein nach h\u00f6chstem Wert; Rechtsbegriff als ausdr\u00fcckliche Eingabe. Vorbestehendes Miteigentum der Hauptsache nicht durch einen einzelnen Eigent\u00fcmer ersetzen; solches Modell gesondert. Grundst\u00fccksverbindung\u00a7946, Verarbeitung\u00a7950 sowie Ausgleichsanspr\u00fcche\u00a7951 separat. NICHT_ANWENDBAR enth\u00e4lt keine Entscheidung \u00fcber fortbestehendes Eigentum.")
  ergebnis
}
