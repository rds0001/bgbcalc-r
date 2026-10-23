pflichtteilsergaenzung_eigenpflichtteilsschutz <- function(verfuegbarer_nachlassanteil = NULL,
    eigener_pflichtteil = NULL, eigene_pflichtteilsergaenzung = NULL, fremde_ergaenzungsforderung = NULL,
    erbe_selbst_pflichtteilsberechtigt = NULL, bewertungsnachweis = NULL) {
  verfuegbar <- .geld(verfuegbarer_nachlassanteil)
  pflichtteil <- .geld(eigener_pflichtteil)
  ergaenzung <- .geld(eigene_pflichtteilsergaenzung)
  forderung <- .geld(fremde_ergaenzungsforderung)
  .wahrheitswert(erbe_selbst_pflichtteilsberechtigt, "erbe_selbst_pflichtteilsberechtigt")
  .text(bewertungsnachweis, "bewertungsnachweis")
  eingaben <- list(verfuegbarer_nachlassanteil = verfuegbarer_nachlassanteil,
    eigener_pflichtteil = eigener_pflichtteil, eigene_pflichtteilsergaenzung = eigene_pflichtteilsergaenzung,
    fremde_ergaenzungsforderung = fremde_ergaenzungsforderung,
    erbe_selbst_pflichtteilsberechtigt = erbe_selbst_pflichtteilsberechtigt, bewertungsnachweis = bewertungsnachweis)
  ergebnis <- .geld_ergebnis(NULL, "BGB_PFLICHTTEILSERGAENZUNG_EIGENPFLICHTTEILSSCHUTZ", eingaben,
    list(list(operation = "Eigenen Pflichtteil samt eigener Erg\u00e4nzung sch\u00fctzen; fremde Erg\u00e4nzungsforderung nur bis dar\u00fcber hinaus verf\u00fcgbarem Nachlassanteil belassen")))
  if (erbe_selbst_pflichtteilsberechtigt) {
    schutz <- .addieren(pflichtteil, ergaenzung)
    deckung <- .subtrahieren(verfuegbar, schutz)
    if (.vergleichen(deckung, .bruch(0)) < 0) deckung <- .bruch(0)
    verbleibend <- if (.vergleichen(forderung, deckung) < 0) forderung else deckung
    ergebnis$wert <- list(eigener_schutzbetrag = .bruchteile(schutz),
      nicht_nach_2328_verweigerbarer_betrag = .bruchteile(verbleibend),
      verweigerungsbetrag = .bruchteile(.subtrahieren(forderung, verbleibend)))
    ergebnis$status <- "BERECHNET"
  }
  ergebnis$hinweise <- c(ergebnis$hinweise, list("Nur betragsm\u00e4\u00dfiger Schutz nach\u00a72328 und keine automatische Aus\u00fcbung der Einrede. Eigener Pflichtteil und eigene Erg\u00e4nzung m\u00fcssen rechtlich berechnet und anrechnungsbereinigt sein; eigene Erg\u00e4nzung nicht als voller Geschenkewert eingeben. Verf\u00fcgbaren Nachlassanteil konsistent vor der betrachteten fremden Erg\u00e4nzung, aber nach sonstigen rechtlich vorrangigen Belastungen bestimmen. Keine automatische Ermittlung von Nachlassverbindlichkeiten, Schenkungsanrechnung oder R\u00fcckgriff. Mehrere fremde Forderungen nicht jeweils gegen denselben ungek\u00fcrzten verf\u00fcgbaren Betrag rechnen; Gesamtbetrag vorgeben, dessen Verteilung gesondert pr\u00fcfen. Nicht nach\u00a72328 verweigerbar bedeutet nicht automatisch tats\u00e4chlich geschuldet oder durchsetzbar. Erg\u00e4nzungshaftung Beschenkter\u00a72329 getrennt; keine Addition zu bereits voll erf\u00fcllter Forderung."))
  ergebnis
}
