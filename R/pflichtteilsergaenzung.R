pflichtteil_schenkungswert <- function(vergleichbarer_schenkungswert = NULL,
    wert_beim_erbfall = NULL, verbrauchbare_sache = NULL,
    pflicht_oder_anstandsschenkung = NULL, bewertungsnachweis = NULL) {
  schenkung <- .geld(vergleichbarer_schenkungswert)
  erbfall <- .geld(wert_beim_erbfall)
  .wahrheitswert(verbrauchbare_sache, "verbrauchbare_sache")
  .wahrheitswert(pflicht_oder_anstandsschenkung, "pflicht_oder_anstandsschenkung")
  .text(bewertungsnachweis, "bewertungsnachweis")
  eingaben <- list(vergleichbarer_schenkungswert = vergleichbarer_schenkungswert,
    wert_beim_erbfall = wert_beim_erbfall, verbrauchbare_sache = verbrauchbare_sache,
    pflicht_oder_anstandsschenkung = pflicht_oder_anstandsschenkung, bewertungsnachweis = bewertungsnachweis)
  wert <- NULL
  if (!pflicht_oder_anstandsschenkung) {
    wert <- if (verbrauchbare_sache || .vergleichen(schenkung, erbfall) <= 0) schenkung else erbfall
  }
  ergebnis <- .geld_ergebnis(wert, "BGB_PFLICHTTEIL_SCHENKUNGSWERT", eingaben,
    list(list(operation = "Pflicht-/Anstandsschenkung ausnehmen; bei verbrauchbarer Sache Schenkungswert, sonst geringeren Vergleichswert w\u00e4hlen")))
  ergebnis$hinweise <- c(ergebnis$hinweise, list("Bewertungsstichtage, erforderliche Kaufkraft-/Wertbereinigung und Belastungen vorab rechtlich bestimmen; ungepr\u00fcfte Nominalwerte sind nicht automatisch vergleichbar. Nur Bewertungswahl vor zeitlicher Abschmelzung\u00a72325 Absatz3, Pflichtteilsquote und weiteren Anrechnungen; kein fertiger Erg\u00e4nzungsanspruch. Verbrauchbarkeit rechtlich nach\u00a792 bestimmen."))
  ergebnis
}
pflichtteilsergaenzung_mehrhinterlassung <- function(ergaenzungsbetrag_vor_mehrhinterlassung = NULL,
    hinterlassener_wert = NULL, ordentlicher_pflichtteilswert = NULL, bewertungsnachweis = NULL) {
  ergaenzung <- .geld(ergaenzungsbetrag_vor_mehrhinterlassung)
  hinterlassen <- .geld(hinterlassener_wert)
  pflichtteil <- .geld(ordentlicher_pflichtteilswert)
  .text(bewertungsnachweis, "bewertungsnachweis")
  mehr <- if (.vergleichen(hinterlassen, pflichtteil) > 0) .subtrahieren(hinterlassen, pflichtteil) else .bruch(0)
  verbleibt <- if (.vergleichen(ergaenzung, mehr) > 0) .subtrahieren(ergaenzung, mehr) else .bruch(0)
  eingaben <- list(ergaenzungsbetrag_vor_mehrhinterlassung = ergaenzungsbetrag_vor_mehrhinterlassung,
    hinterlassener_wert = hinterlassener_wert, ordentlicher_pflichtteilswert = ordentlicher_pflichtteilswert,
    bewertungsnachweis = bewertungsnachweis)
  ergebnis <- .geld_ergebnis(verbleibt, "BGB_PFLICHTTEILSERGAENZUNG_MEHRHINTERLASSUNG", eingaben,
    list(list(operation = "Mehrhinterlassung \u00fcber ordentlichen Pflichtteil ermitteln und Erg\u00e4nzungsbetrag h\u00f6chstens bis null vermindern")))
  ergebnis$wert <- list(mehrhinterlassung = .bruchteile(mehr),
    angerechneter_betrag = .bruchteile(if (.vergleichen(ergaenzung, mehr) < 0) ergaenzung else mehr),
    verbleibende_ergaenzung = .bruchteile(verbleibt))
  ergebnis$hinweise <- c(ergebnis$hinweise, list("Hinterlassener Wert und ordentlicher Pflichtteilswert rechtlich vergleichbar bewerten. H\u00e4lfte des gesetzlichen Erbteils als ordentlicher Pflichtteil; nicht H\u00e4lfte einer beliebig gew\u00e4hlten Erbquote. Nur\u00a72326, keine zus\u00e4tzliche Anrechnung bereits abgezogener Betr\u00e4ge. Eigengeschenke\u00a72327, Erbenschutz\u00a72328 und Beschenktenhaftung\u00a72329 gesondert."))
  ergebnis
}
