# Rationale Zahlen aus exakt darstellbaren Ganzzahlen; keine Float-Geldbeträge.
.zahlengrenze <- 9007199254740991

.begrenzt <- function(wert) {
  if (!is.finite(wert) || abs(wert) > .zahlengrenze) {
    .fehler("zahl", "Exakter gemeinsamer Zahlenbereich \u00fcberschritten.")
  }
  wert
}

.ggt <- function(links, rechts) {
  links <- abs(links)
  rechts <- abs(rechts)
  while (rechts != 0) {
    rest <- links %% rechts
    links <- rechts
    rechts <- rest
  }
  links
}

.bruch <- function(zaehler, nenner = 1) {
  zaehler <- .ganzzahl(zaehler, "zaehler", -.zahlengrenze, .zahlengrenze)
  nenner <- .ganzzahl(nenner, "nenner", -.zahlengrenze, .zahlengrenze)
  if (nenner == 0) .fehler("nenner", "Nenner darf nicht null sein.")
  if (nenner < 0) {
    zaehler <- -zaehler
    nenner <- -nenner
  }
  if (zaehler == 0) zaehler <- 0
  teiler <- .ggt(zaehler, nenner)
  structure(list(zaehler = zaehler / teiler, nenner = nenner / teiler),
            class = "bgb_bruch")
}

.pruefe_bruch <- function(wert) {
  if (!inherits(wert, "bgb_bruch")) .fehler("zahl", "Interne rationale Zahl erforderlich.")
  .ganzzahl(wert$zaehler, "zaehler", -.zahlengrenze, .zahlengrenze)
  .ganzzahl(wert$nenner, "nenner", 1, .zahlengrenze)
  invisible(wert)
}

.zahleneingabe <- function(wert) {
  if (!is.list(wert)) return(.dezimalzahl(wert))
  if (!identical(sort(names(wert)), sort(c("zaehler", "nenner")))) {
    .fehler("zahl", "Bruchobjekt ben\u00f6tigt genau zaehler und nenner.")
  }
  ganzzahlen <- numeric()
  for (parameter in c("zaehler", "nenner")) {
    text <- .text(wert[[parameter]], parameter)
    muster <- if (parameter == "zaehler") "^(0|-?[1-9][0-9]*)$" else "^[1-9][0-9]*$"
    if (nchar(sub("^-", "", text)) > 16 || !grepl(muster, text)) {
      .fehler(parameter, "Kanonische Ganzzahlzeichenfolge erforderlich; Nenner positiv.")
    }
    ganzzahlen <- c(ganzzahlen, .begrenzt(as.numeric(text)))
  }
  .bruch(ganzzahlen[[1]], ganzzahlen[[2]])
}

.dezimalzahl <- function(wert) {
  .text(wert, "dezimalzahl")
  if (!grepl("^[+-]?[0-9]+(\\.[0-9]+)?$", wert)) {
    .fehler("dezimalzahl", "Dezimalzeichenfolge ohne Exponent oder Trenner erforderlich.")
  }
  negativ <- startsWith(wert, "-")
  teile <- strsplit(sub("^[+-]", "", wert), ".", fixed = TRUE)[[1]]
  nachkomma <- if (length(teile) == 2L) sub("0+$", "", teile[[2]]) else ""
  if (nchar(nachkomma) > 15L) .fehler("dezimalzahl", "H\u00f6chstens 15 erhebliche Nachkommastellen erlaubt.")
  zaehler <- 0
  for (ziffer in strsplit(paste0(teile[[1]], nachkomma), "", fixed = TRUE)[[1]]) {
    zaehler <- .begrenzt(zaehler * 10 + as.numeric(ziffer))
  }
  .bruch(if (negativ) -zaehler else zaehler, 10^nchar(nachkomma))
}

.addieren <- function(links, rechts) {
  .pruefe_bruch(links)
  .pruefe_bruch(rechts)
  teiler <- .ggt(links$nenner, rechts$nenner)
  linksfaktor <- rechts$nenner / teiler
  rechtsfaktor <- links$nenner / teiler
  zaehler <- .begrenzt(.begrenzt(links$zaehler * linksfaktor) +
                       .begrenzt(rechts$zaehler * rechtsfaktor))
  nenner <- .begrenzt(links$nenner * linksfaktor)
  .bruch(zaehler, nenner)
}

.subtrahieren <- function(links, rechts) {
  .pruefe_bruch(rechts)
  .addieren(links, .bruch(-rechts$zaehler, rechts$nenner))
}

.multiplizieren <- function(links, rechts) {
  .pruefe_bruch(links)
  .pruefe_bruch(rechts)
  teiler_links <- .ggt(links$zaehler, rechts$nenner)
  teiler_rechts <- .ggt(rechts$zaehler, links$nenner)
  .bruch(
    .begrenzt((links$zaehler / teiler_links) * (rechts$zaehler / teiler_rechts)),
    .begrenzt((links$nenner / teiler_rechts) * (rechts$nenner / teiler_links))
  )
}

.dividieren <- function(links, rechts) {
  .pruefe_bruch(rechts)
  if (rechts$zaehler == 0) .fehler("divisor", "Division durch null.")
  .multiplizieren(links, .bruch(rechts$nenner, rechts$zaehler))
}

.vergleichen <- function(links, rechts) {
  .pruefe_bruch(links)
  .pruefe_bruch(rechts)
  vorzeichen_links <- sign(links$zaehler)
  vorzeichen_rechts <- sign(rechts$zaehler)
  if (vorzeichen_links != vorzeichen_rechts) return(sign(vorzeichen_links - vorzeichen_rechts))
  if (vorzeichen_links == 0) return(0)
  zaehler_links <- abs(links$zaehler)
  zaehler_rechts <- abs(rechts$zaehler)
  nenner_links <- links$nenner
  nenner_rechts <- rechts$nenner
  richtung <- vorzeichen_links
  repeat {
    ganz_links <- zaehler_links %/% nenner_links
    ganz_rechts <- zaehler_rechts %/% nenner_rechts
    if (ganz_links != ganz_rechts) return(richtung * sign(ganz_links - ganz_rechts))
    rest_links <- zaehler_links %% nenner_links
    rest_rechts <- zaehler_rechts %% nenner_rechts
    if (rest_links == 0 || rest_rechts == 0) {
      return(richtung * sign(as.numeric(rest_links != 0) - as.numeric(rest_rechts != 0)))
    }
    zaehler_links <- nenner_links
    zaehler_rechts <- nenner_rechts
    nenner_links <- rest_links
    nenner_rechts <- rest_rechts
    richtung <- -richtung
  }
}

.bruchtext <- function(wert) {
  .pruefe_bruch(wert)
  paste0(sprintf("%.0f", wert$zaehler), "/", sprintf("%.0f", wert$nenner))
}

.runden <- function(wert, stellen, modus) {
  .pruefe_bruch(wert)
  stellen <- .ganzzahl(stellen, "stellen", 0, 15)
  .auswahl(modus, "modus", c("gegen_null", "ab", "auf", "kaufmaennisch", "gerade"))
  skaliert <- .multiplizieren(wert, .bruch(10^stellen))
  ganz <- abs(skaliert$zaehler) %/% skaliert$nenner
  rest <- abs(skaliert$zaehler) %% skaliert$nenner
  negativ <- skaliert$zaehler < 0
  erhoehen <- (modus == "ab" && negativ && rest > 0) ||
    (modus == "auf" && !negativ && rest > 0) ||
    (modus == "kaufmaennisch" && rest >= skaliert$nenner - rest) ||
    (modus == "gerade" && (rest > skaliert$nenner - rest ||
      (rest == skaliert$nenner - rest && ganz %% 2 == 1)))
  ganz <- .begrenzt(ganz + as.numeric(erhoehen))
  ziffern <- sprintf("%.0f", ganz)
  if (nchar(ziffern) < stellen + 1) {
    ziffern <- paste0(strrep("0", stellen + 1 - nchar(ziffern)), ziffern)
  }
  if (stellen > 0) {
    trennstelle <- nchar(ziffern) - stellen
    ziffern <- paste0(substr(ziffern, 1, trennstelle), ".",
                      substr(ziffern, trennstelle + 1, nchar(ziffern)))
  }
  paste0(if (negativ && ganz != 0) "-" else "", ziffern)
}
