erbteilung_leistungsausgleich <- function(nachlasswert_der_ausgleichungsgemeinschaft = NULL,
    miterben = NULL, leistungsausgleich_2057a_anwendbar = NULL, weitere_ausgleichungsposten_vorhanden = NULL,
    bewertungsnachweis = NULL) {
  nachlass <- .geld(nachlasswert_der_ausgleichungsgemeinschaft)
  .vorhanden(miterben, "miterben")
  if (!is.list(miterben) || !is.null(names(miterben)) || length(miterben) < 2 || length(miterben) > 1000)
    .fehler("miterben", "Liste mit 2 bis 1000 rechtlich bestimmten Miterben der Ausgleichungsgemeinschaft erforderlich.")
  namen <- character(); quoten <- list(); ausgleiche <- list()
  quotensumme <- .bruch(0); ausgleichssumme <- .bruch(0)
  for (eintrag in miterben) {
    if (!is.list(eintrag) || !identical(sort(names(eintrag)), sort(c("miterbe_id", "relative_erbquote", "leistungs_ausgleichsbetrag"))))
      .fehler("miterben", "Genau miterbe_id, relative_erbquote und leistungs_ausgleichsbetrag erforderlich.")
    name <- .text(eintrag$miterbe_id, "miterbe_id")
    if (name %in% namen) .fehler("miterbe_id", "Miterben d\u00fcrfen nicht doppelt vorkommen.")
    quote <- .zahleneingabe(eintrag$relative_erbquote)
    if (.vergleichen(quote, .bruch(0)) <= 0 || .vergleichen(quote, .bruch(1)) > 0)
      .fehler("relative_erbquote", "Positive Erbquote h\u00f6chstens eins erforderlich.")
    ausgleich <- .geld(eintrag$leistungs_ausgleichsbetrag)
    quotensumme <- .addieren(quotensumme, quote)
    ausgleichssumme <- .addieren(ausgleichssumme, ausgleich)
    namen <- c(namen, name); quoten <- c(quoten, list(quote)); ausgleiche <- c(ausgleiche, list(ausgleich))
  }
  if (.vergleichen(quotensumme, .bruch(1)) != 0)
    .fehler("miterben", "Relative Erbquoten innerhalb der Ausgleichungsgemeinschaft m\u00fcssen zusammen eins ergeben.")
  if (.vergleichen(ausgleichssumme, nachlass) > 0)
    .fehler("miterben", "Ausgleichsbetr\u00e4ge oberhalb des zugeordneten Nachlasswerts liegen au\u00dferhalb dieses Verteilungsmodells; rechtliche Bewertung zuerst kl\u00e4ren.")
  .wahrheitswert(leistungsausgleich_2057a_anwendbar, "leistungsausgleich_2057a_anwendbar")
  .wahrheitswert(weitere_ausgleichungsposten_vorhanden, "weitere_ausgleichungsposten_vorhanden")
  .text(bewertungsnachweis, "bewertungsnachweis")
  eingaben <- list(nachlasswert_der_ausgleichungsgemeinschaft = nachlasswert_der_ausgleichungsgemeinschaft,
    miterben = miterben, leistungsausgleich_2057a_anwendbar = leistungsausgleich_2057a_anwendbar,
    weitere_ausgleichungsposten_vorhanden = weitere_ausgleichungsposten_vorhanden, bewertungsnachweis = bewertungsnachweis)
  ergebnis <- .geld_ergebnis(NULL, "BGB_ERBTEILUNG_LEISTUNGSAUSGLEICH", eingaben,
    list(list(operation = "Summe rechtlich bestimmter Leistungsausgleichsbetr\u00e4ge vom zugeh\u00f6rigen Nachlass abziehen; Rest nach Erbquoten und individuelle Ausgleiche zus\u00e4tzlich zuteilen")))
  if (leistungsausgleich_2057a_anwendbar && !weitere_ausgleichungsposten_vorhanden) {
    rest <- .subtrahieren(nachlass, ausgleichssumme)
    ergebnis$wert <- list(verteilungsrest = .bruchteile(rest), zuteilungen = lapply(seq_along(namen), function(i)
      list(miterbe_id = namen[[i]], erbteil_nach_leistungsausgleich = .bruchteile(.addieren(.multiplizieren(rest, quoten[[i]]), ausgleiche[[i]])))))
    ergebnis$status <- "BERECHNET"
  }
  ergebnis$hinweise <- c(ergebnis$hinweise, list("Nur rechnerische Verteilung nach\u00a72057a Absatz4 im isolierten Leistungsausgleichsfall. Nachlasswert umfasst ausschlie\u00dflich den Anteil, der den ausgleichenden Miterben zusteht; andere Erben nicht mitbelasten. Relative Erbquoten beziehen sich auf diese Gemeinschaft, nicht ungepr\u00fcft Gesamtnachlass. Anspruchsberechtigte Abk\u00f6mmlinge und gesetzliche Erbfolge beziehungsweise\u00a72052 rechtlich bestimmen. Ausgleichsbetr\u00e4ge m\u00fcssen nach Absatz3 unter Ber\u00fccksichtigung von Dauer, Umfang und Nachlasswert billig bemessen sein; keine automatische Pflegeverg\u00fctung oder erfundener Stundensatz. Angemessenes gew\u00e4hrtes/vereinbartes Entgelt und anderweitige Anspr\u00fcche schlie\u00dfen nach Absatz2 entsprechend aus; Eingabebetr\u00e4ge m\u00fcssen dies bereits ber\u00fccksichtigen. Weitere auszugleichende Zuwendungen oder sonstige Ausgleichungsposten erfordern ein kombiniertes Modell und ergeben hier NICHT_ANWENDBAR. Ausgleichssumme \u00fcber zugeh\u00f6rigem Nachlass wird nicht durch erfundene K\u00fcrzung geheilt. Ergebnis ist wertm\u00e4\u00dfige Teilung, keine \u00dcbertragung bestimmter Nachlassgegenst\u00e4nde."))
  ergebnis
}
