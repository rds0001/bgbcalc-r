ersatzerben_quoten <- function(weggefallener_erbteil = NULL, ersatzerben = NULL,
    gegenseitige_ersatzerbeneinsetzung = NULL, auslegungsregel_anwendbar = NULL,
    einordnungsnachweis = NULL) {
  .vorhanden(weggefallener_erbteil, "weggefallener_erbteil")
  weggefallen <- .zahleneingabe(weggefallener_erbteil)
  if (.vergleichen(weggefallen, .bruch(0)) <= 0 || .vergleichen(weggefallen, .bruch(1)) > 0)
    .fehler("weggefallener_erbteil", "Weggefallener Anteil muss positiv und h\u00f6chstens eins sein.")
  .vorhanden(ersatzerben, "ersatzerben")
  if (!is.list(ersatzerben) || !is.null(names(ersatzerben)) || length(ersatzerben) < 1 || length(ersatzerben) > 1000)
    .fehler("ersatzerben", "Liste mit 1 bis 1000 rechtlich berufenen Ersatzerben erforderlich.")
  namen <- character(); quoten <- list(); gruppe <- logical(); summe <- .bruch(0)
  for (eintrag in ersatzerben) {
    if (!is.list(eintrag) || !identical(sort(names(eintrag)), sort(c("erbe_id", "urspruenglicher_erbteil", "gleicher_gemeinschaftlicher_erbteil"))))
      .fehler("ersatzerben", "Genau erbe_id, urspruenglicher_erbteil und gleicher_gemeinschaftlicher_erbteil erforderlich.")
    name <- .text(eintrag$erbe_id, "erbe_id")
    if (name %in% namen) .fehler("erbe_id", "Ersatzerben nicht doppelt auff\u00fchren.")
    .vorhanden(eintrag$urspruenglicher_erbteil, "urspruenglicher_erbteil")
    quote <- .zahleneingabe(eintrag$urspruenglicher_erbteil)
    if (.vergleichen(quote, .bruch(0)) <= 0 || .vergleichen(quote, .bruch(1)) > 0)
      .fehler("urspruenglicher_erbteil", "Urspr\u00fcnglicher Erbteil muss positiv und h\u00f6chstens eins sein.")
    .wahrheitswert(eintrag$gleicher_gemeinschaftlicher_erbteil, "gleicher_gemeinschaftlicher_erbteil")
    namen <- c(namen, name); quoten <- c(quoten, list(quote)); gruppe <- c(gruppe, eintrag$gleicher_gemeinschaftlicher_erbteil)
    summe <- .addieren(summe, quote)
  }
  if (.vergleichen(.addieren(summe, weggefallen), .bruch(1)) > 0)
    .fehler("ersatzerben", "Urspr\u00fcngliche pers\u00f6nliche Erbteile und weggefallener Anteil d\u00fcrfen zusammen eins nicht \u00fcberschreiten.")
  .wahrheitswert(gegenseitige_ersatzerbeneinsetzung, "gegenseitige_ersatzerbeneinsetzung")
  .wahrheitswert(auslegungsregel_anwendbar, "auslegungsregel_anwendbar")
  .text(einordnungsnachweis, "einordnungsnachweis")
  eingaben <- list(weggefallener_erbteil = weggefallener_erbteil, ersatzerben = ersatzerben,
    gegenseitige_ersatzerbeneinsetzung = gegenseitige_ersatzerbeneinsetzung,
    auslegungsregel_anwendbar = auslegungsregel_anwendbar, einordnungsnachweis = einordnungsnachweis)
  wert <- NULL
  if (auslegungsregel_anwendbar) {
    vorrang <- gegenseitige_ersatzerbeneinsetzung && any(gruppe)
    ausgewaehlt <- !vorrang | gruppe
    verteilungssumme <- .bruch(0)
    for (i in seq_along(quoten)) if (ausgewaehlt[[i]]) verteilungssumme <- .addieren(verteilungssumme, quoten[[i]])
    anteile <- lapply(seq_along(namen), function(i) {
      relativ <- if (ausgewaehlt[[i]]) .dividieren(quoten[[i]], verteilungssumme) else .bruch(0)
      list(erbe_id = namen[[i]], anteil_am_weggefallenen_erbteil = .bruchteile(relativ),
        zusaetzlicher_erbteil = .bruchteile(.multiplizieren(weggefallen, relativ)))
    })
    wert <- list(gruppenvorrang_angewandt = vorrang, ersatzerbquoten = anteile,
      verbleibender_anteil_fuer_anwachsung = .bruchteile(.bruch(0)))
  }
  ergebnis <- .ergebnis(wert, "erbquoten", "BGB_ERSATZERBEN_QUOTEN", eingaben,
    list(list(operation = "Bei gegenseitiger Einsetzung vorrangige Mitberechtigte desselben gemeinschaftlichen Erbteils ausw\u00e4hlen; urspr\u00fcngliche Erbteile der ausgew\u00e4hlten Personen normieren und weggefallenen Anteil proportional verteilen")), eingaben)
  ergebnis$status <- if (!is.null(wert)) "BERECHNET" else "NICHT_ANWENDBAR"
  ergebnis$annahmen <- list("Ein einzelner weggefallener pers\u00f6nlicher Erbteil; Kreis tats\u00e4chlich berufener Ersatzerben und urspr\u00fcngliche pers\u00f6nliche Quoten sind rechtlich bestimmt; keine abweichende testamentarische Anordnung.")
  ergebnis$hinweise <- list("\u00a72098 Absatz1 ist Zweifelsregel bei gegenseitiger Einsetzung oder Einsetzung der \u00fcbrigen Erben f\u00fcr einen Erben. Anwendbarkeit und Berufung einschlie\u00dflich\u00a7\u00a72096/2097 ausdr\u00fccklich vorqualifizieren; keine automatische Testamentsauslegung. Gruppenvorrang Absatz2 nur bei gegenseitiger Einsetzung und tats\u00e4chlich berufenen Mitberechtigten desselben gemeinschaftlichen Erbteils. Pers\u00f6nliche Quote am Gesamtnachlass verwenden, nicht gesamte Gruppenquote mehrfach eingeben. Nicht ausgew\u00e4hlte Ersatzerben erhalten aus diesem Wegfall null; ihre urspr\u00fcnglichen Erbteile bleiben unber\u00fchrt. Einsetzungsvoraussetzungen, \u00dcberleben, Ausschlagung und weitere Wegf\u00e4lle vorab pr\u00fcfen. Kein kaskadierender Mehrfachwegfall. Ersatzerbrecht geht\u00a72099 zufolge Anwachsung vor: der hier vollst\u00e4ndig verteilte Anteil verbleibt nicht zus\u00e4tzlich zur Anwachsung. Gesamtquoten nach weiteren Wegf\u00e4llen oder andere Erwerbsgr\u00fcnde werden nicht berechnet.")
  ergebnis
}
