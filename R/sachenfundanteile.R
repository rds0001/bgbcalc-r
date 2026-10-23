.fundanteile_ergebnis <- function(wert, kennung, eingaben, operation, hinweis) {
  ergebnis <- .ergebnis(wert, "eigentumsquoten", kennung, eingaben,
    list(list(operation = operation)), eingaben)
  ergebnis$status <- if (!is.null(wert)) "BERECHNET" else "NICHT_ANWENDBAR"
  ergebnis$annahmen <- list("Gesetzlicher Eigentumstatbestand und beteiligte Personen rechtlich bestimmt; feste lokale BGB-Fassung.")
  ergebnis$hinweise <- list(hinweis)
  ergebnis
}
bienenschwarm_eigentumsquoten <- function(eigentuemer_schwaerme = NULL,
    ausgezogene_schwaerme_vereinigt = NULL, gesamtschwarm_eingefangen = NULL,
    einzug_in_fremde_besetzte_wohnung = NULL, einordnungsnachweis = NULL) {
  .vorhanden(eigentuemer_schwaerme, "eigentuemer_schwaerme")
  if (!is.list(eigentuemer_schwaerme) || !is.null(names(eigentuemer_schwaerme)) ||
      length(eigentuemer_schwaerme) < 2 || length(eigentuemer_schwaerme) > 1000)
    .fehler("eigentuemer_schwaerme", "Liste mit 2 bis 1000 unterschiedlichen berechtigten Eigent\u00fcmern erforderlich.")
  namen <- character()
  zahlen <- numeric()
  summe <- 0
  for (eintrag in eigentuemer_schwaerme) {
    if (!is.list(eintrag) || !identical(sort(names(eintrag)), sort(c("eigentuemer_id", "verfolgte_schwaerme"))))
      .fehler("eigentuemer_schwaerme", "Genau eigentuemer_id und verfolgte_schwaerme erforderlich.")
    name <- .text(eintrag$eigentuemer_id, "eigentuemer_id")
    if (name %in% namen) .fehler("eigentuemer_id", "Eigent\u00fcmer nicht doppelt auff\u00fchren; Schw\u00e4rme je Eigent\u00fcmer zusammenfassen.")
    anzahl <- .ganzzahl(eintrag$verfolgte_schwaerme, "verfolgte_schwaerme", 1, .zahlengrenze)
    summe <- .ganzzahl(summe + anzahl, "gesamtzahl_schwaerme", 1, .zahlengrenze)
    namen <- c(namen, name)
    zahlen <- c(zahlen, anzahl)
  }
  eingaben <- list(eigentuemer_schwaerme = eigentuemer_schwaerme,
    ausgezogene_schwaerme_vereinigt = ausgezogene_schwaerme_vereinigt,
    gesamtschwarm_eingefangen = gesamtschwarm_eingefangen,
    einzug_in_fremde_besetzte_wohnung = einzug_in_fremde_besetzte_wohnung,
    einordnungsnachweis = einordnungsnachweis)
  for (name in names(eingaben)[2:4]) .wahrheitswert(eingaben[[name]], name)
  .text(einordnungsnachweis, "einordnungsnachweis")
  gilt <- ausgezogene_schwaerme_vereinigt && gesamtschwarm_eingefangen && !einzug_in_fremde_besetzte_wohnung
  wert <- if (gilt) lapply(seq_along(namen), function(i)
    list(eigentuemer_id = namen[[i]], eigentumsquote = .bruchteile(.bruch(zahlen[[i]], summe)))) else NULL
  .fundanteile_ergebnis(wert, "BGB_BIENENSCHWARM_EIGENTUMSQUOTEN", eingaben,
    "Verfolgte Schw\u00e4rme je berechtigtem Eigent\u00fcmer durch Gesamtzahl der verfolgten Schw\u00e4rme teilen",
    "Nur vereinigte ausgezogene Schw\u00e4rme mehrerer berechtigter Eigent\u00fcmer und eingefangener Gesamtschwarm. Eigentumserhaltende Verfolgung\u00a7961 vorab pr\u00fcfen; aufgegebene oder nicht unverz\u00fcglich verfolgte Schw\u00e4rme nicht als weiterhin berechtigte Beitr\u00e4ge z\u00e4hlen. Fall\u00a7964 in fremder besetzter Bienenwohnung ist anderes Erwerbsmodell. Keine Gewichtung nach Bienenzahl, Gewicht, Geldwert oder Arbeitsaufwand. Einzelberechtigter, vorbestehendes Miteigentum eines Schwarms und andere Sonderlagen au\u00dferhalb dieses Mehrpersonenmodells.")
}
schatzfund_eigentumsquoten <- function(entdecker_id = NULL, eigentuemer_verbergende_sache_id = NULL,
    qualifizierter_schatz = NULL, entdeckt_und_infolge_entdeckung_besitzgenommen = NULL,
    abweichendes_landesrecht = NULL, einordnungsnachweis = NULL) {
  entdecker <- .text(entdecker_id, "entdecker_id")
  eigentuemer <- .text(eigentuemer_verbergende_sache_id, "eigentuemer_verbergende_sache_id")
  eingaben <- list(entdecker_id = entdecker_id, eigentuemer_verbergende_sache_id = eigentuemer_verbergende_sache_id,
    qualifizierter_schatz = qualifizierter_schatz,
    entdeckt_und_infolge_entdeckung_besitzgenommen = entdeckt_und_infolge_entdeckung_besitzgenommen,
    abweichendes_landesrecht = abweichendes_landesrecht, einordnungsnachweis = einordnungsnachweis)
  for (name in names(eingaben)[3:5]) .wahrheitswert(eingaben[[name]], name)
  .text(einordnungsnachweis, "einordnungsnachweis")
  gilt <- qualifizierter_schatz && entdeckt_und_infolge_entdeckung_besitzgenommen && !abweichendes_landesrecht
  wert <- NULL
  if (gilt) {
    if (entdecker == eigentuemer) {
      wert <- list(list(eigentuemer_id = entdecker, eigentumsquote = .bruchteile(.bruch(1))))
    } else {
      wert <- lapply(c(entdecker, eigentuemer), function(name)
        list(eigentuemer_id = name, eigentumsquote = .bruchteile(.bruch(1, 2))))
    }
  }
  .fundanteile_ergebnis(wert, "BGB_SCHATZFUND_EIGENTUMSQUOTEN", eingaben,
    "Im einschl\u00e4gigen BGB-Schatzfundfall je H\u00e4lfte an Entdecker und Eigent\u00fcmer der verbergenden Sache; bei Personenidentit\u00e4t vereinigen",
    "Nur ein rechtlich bestimmter Entdecker und ein Alleineigent\u00fcmer der verbergenden Sache. Mehrere Entdecker/Miteigent\u00fcmer oder besondere Zuordnungsfragen gesondert. Schatz muss so lange verborgen sein, dass Eigent\u00fcmer nicht mehr ermittelbar; blo\u00df unbekannter Eigent\u00fcmer eines gew\u00f6hnlichen Funds gen\u00fcgt nicht. Landesrechtliche Schatzregale und sonstige abweichende Erwerbsregeln vorab pr\u00fcfen; keine automatische Rechtsrecherche oder pauschale Aussage zu arch\u00e4ologischen Funden. Eigentumsquote ist kein Finderlohn und kein automatischer Zahlungsanspruch.")
}
