pauschalreise_ruecktrittsentschaedigung <- function(reisepreis = NULL, ersparte_aufwendungen = NULL,
    anderweitiger_erwerb = NULL, entschaedigungspauschale_vereinbart = NULL,
    ausschluss_aussergewoehnliche_umstaende = NULL, bewertungsnachweis = NULL) {
  preis <- .geld(reisepreis)
  erspart <- .geld(ersparte_aufwendungen)
  erwerb <- .geld(anderweitiger_erwerb)
  .wahrheitswert(entschaedigungspauschale_vereinbart, "entschaedigungspauschale_vereinbart")
  .wahrheitswert(ausschluss_aussergewoehnliche_umstaende, "ausschluss_aussergewoehnliche_umstaende")
  .text(bewertungsnachweis, "bewertungsnachweis")
  eingaben <- list(reisepreis = reisepreis, ersparte_aufwendungen = ersparte_aufwendungen,
    anderweitiger_erwerb = anderweitiger_erwerb, entschaedigungspauschale_vereinbart = entschaedigungspauschale_vereinbart,
    ausschluss_aussergewoehnliche_umstaende = ausschluss_aussergewoehnliche_umstaende, bewertungsnachweis = bewertungsnachweis)
  wert <- NULL
  if (ausschluss_aussergewoehnliche_umstaende) {
    wert <- .bruch(0)
  } else if (!entschaedigungspauschale_vereinbart) {
    wert <- .subtrahieren(.subtrahieren(preis, erspart), erwerb)
    if (wert$zaehler < 0) wert <- .bruch(0)
  }
  ergebnis <- .geld_ergebnis(wert, "BGB_PAUSCHALREISE_RUECKTRITTSENTSCHAEDIGUNG", eingaben,
    list(list(operation = "Vorrangigen Entsch\u00e4digungsausschluss pr\u00fcfen; sonst ohne Pauschalvereinbarung Reisepreis um Ersparnis und anderweitigen Erwerb vermindern")))
  ergebnis$hinweise <- c(ergebnis$hinweise, list("R\u00fccktritt des Reisenden vor Reisebeginn vorausgesetzt. Pauschalvereinbarung ohne Ausschluss ergibt NICHT_ANWENDBAR; H\u00f6he und Angemessenheit einer Stornopauschale werden nicht erfunden. R\u00fcckerstattung und F\u00e4lligkeit gesondert."))
  ergebnis
}

pauschalreise_haftungsbegrenzung <- function(reisepreis = NULL, ersatzfaehiger_schaden = NULL,
    haftungsbeschraenkung_vereinbart = NULL, koerperschaden = NULL, schuldhaft_herbeigefuehrt = NULL,
    bewertungsnachweis = NULL) {
  preis <- .geld(reisepreis)
  schaden <- .geld(ersatzfaehiger_schaden)
  eingaben <- list(reisepreis = reisepreis, ersatzfaehiger_schaden = ersatzfaehiger_schaden,
    haftungsbeschraenkung_vereinbart = haftungsbeschraenkung_vereinbart, koerperschaden = koerperschaden,
    schuldhaft_herbeigefuehrt = schuldhaft_herbeigefuehrt, bewertungsnachweis = bewertungsnachweis)
  for (name in c("haftungsbeschraenkung_vereinbart", "koerperschaden", "schuldhaft_herbeigefuehrt"))
    .wahrheitswert(eingaben[[name]], name)
  .text(bewertungsnachweis, "bewertungsnachweis")
  wert <- schaden
  if (haftungsbeschraenkung_vereinbart && !koerperschaden && !schuldhaft_herbeigefuehrt) {
    grenze <- .multiplizieren(preis, .bruch(3))
    if (.vergleichen(schaden, grenze) > 0) wert <- grenze
  }
  ergebnis <- .geld_ergebnis(wert, "BGB_PAUSCHALREISE_HAFTUNGSBEGRENZUNG", eingaben,
    list(list(operation = "Vereinbarte Begrenzung auf dreifachen Reisepreis nur f\u00fcr nicht schuldhaft herbeigef\u00fchrte Sch\u00e4den ohne K\u00f6rpersch\u00e4den anwenden")))
  ergebnis$hinweise <- c(ergebnis$hinweise, list("Nur Begrenzung nach\u00a7651p Absatz1 auf bereits ersatzf\u00e4higen Schaden. Internationale Beschr\u00e4nkungen nach Absatz2 und Anrechnung nach Absatz3 sowie andere Haftungsvoraussetzungen getrennt; keine Aufteilung gemischter Schadenspositionen."))
  ergebnis
}

