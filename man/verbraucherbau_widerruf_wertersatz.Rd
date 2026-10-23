% Automatisch aus Fachverträgen erzeugt; fachliche Freigabe bleibt separat.
\name{verbraucherbau_widerruf_wertersatz}
\alias{verbraucherbau_widerruf_wertersatz}
\title{verbraucherbau widerruf wertersatz}
\description{Feste lokale BGB-Fassung; rechtlichen Anwendungsbereich und Bewertungen ausdrücklich bestimmen.}
\usage{verbraucherbau_widerruf_wertersatz(
  gesamtverguetung = NULL,
  leistungsanteil_zaehler = NULL,
  leistungsanteil_nenner = NULL,
  verguetung_unverhaeltnismaessig_hoch = NULL,
  marktwert_erbrachte_leistung = NULL,
  einordnungsnachweis = NULL
)}
\arguments{
\item{gesamtverguetung}{Nichtnegative exakte vereinbarte EUR-Vergütung für den gesamten betrachteten Leistungsumfang.}
\item{leistungsanteil_zaehler}{Nichtnegative ganze Zahl des rechtlich bewerteten bis zum Widerruf erbrachten Leistungsanteils, höchstens Nenner und2^53-1.}
\item{leistungsanteil_nenner}{Positive ganze Bezugsgröße der Gesamtleistung im selben Bewertungsmaßstab, höchstens2^53-1; Anteil0..1.}
\item{verguetung_unverhaeltnismaessig_hoch}{Expliziter Wahrheitswert der rechtlich festgestellten Unverhältnismäßigkeit der vereinbarten Vergütung; keine automatische Prozentbewertung.}
\item{marktwert_erbrachte_leistung}{Nur bei unverhältnismäßig hoher Vergütung erforderlicher nichtnegativer exakter EUR-Marktwert bereits erbrachter Leistung. Sonst zwingendNULL/None. Nicht Marktwert der gesamten erst geplanten Leistung.}
\item{einordnungsnachweis}{Nichtleerer Nachweis des Verbraucherbauwiderrufs, naturgemäß ausgeschlossener Rückgewähr und der Leistungs-/Marktwertbewertung.}
}
\details{Vertraglichen Vergütungsanteil bestimmen oder auf den Marktwert der bereits erbrachten Leistung umstellen. §357e: qualifizierter wirksamer Widerruf eines Verbraucherbauvertrags und nach ihrer Natur ausgeschlossene Rückgewähr der bis zum Widerruf erbrachten Leistung. Leistungsanteil nach Wert/Umfang, keine automatische Zeitquote. Bei unverhältnismäßig hoher vereinbarter Vergütung bezeichnet marktwert_erbrachte_leistung bereits den Marktwert der erbrachten Leistung; diesen nicht nochmals mit dem Leistungsanteil multiplizieren. Unverhältnismäßigkeit und Bewertung extern bestimmen; keine erfundene feste Prozentschwelle. Keine ungeprüfte Übernahme der zusätzlichen Voraussetzungen357aII. Vorauszahlungen, sonstige Rückgewähr und Aufrechnung gesondert, keine automatische Saldierung. Geldbeträge als nichtnegative Dezimalzeichenfolge oder Bruchobjekt mit Zeichenfolgen zaehler/nenner. Exakte Ganzzahl-Zwischenwerte höchstens 2^53-1. Fehlende Pflichteingabe EINGABE_FEHLT, unzulässige Typen oder Bereiche EINGABE_UNGUELTIG.}
\value{wert: exakter EUR-Wertersatzbruch; Vertragspreisanteil oder Marktwert der bereits erbrachten Leistung, keine zusätzliche Quotenkürzung des Marktwerts. Einheit: EUR.}
\references{BGB_PDF_SHA256_9b5a99536e7b00756e9fa5f20082bd9ad3951b37c381fc0f5d52aa5a556839eb; BGB_357e_T0001, BGB_357e_T0002, BGB_357e_T0003}
\examples{
verbraucherbau_widerruf_wertersatz(
  gesamtverguetung = "1000",
  leistungsanteil_zaehler = 1,
  leistungsanteil_nenner = 4,
  verguetung_unverhaeltnismaessig_hoch = FALSE,
  marktwert_erbrachte_leistung = NULL,
  einordnungsnachweis = paste0(
    "§357e: qualifizierter wirksamer Widerruf eines Verbraucherba",
    "uvertrags und nach ihrer Natur ausgeschlossene Rückgewähr de",
    "r bis zum Widerruf erbrachten Leistung. Leistungsanteil nach",
    " Wert/Umfang, keine automatische Zeitquote. Bei unverhältnis",
    "mäßig hoher vereinbarter Vergütung bezeichnet marktwert_erbr",
    "achte_leistung bereits den Marktwert der erbrachten Leistung",
    "; diesen nicht nochmals mit dem Leistungsanteil multiplizier",
    "en. Unverhältnismäßigkeit und Bewertung extern bestimmen; ke",
    "ine erfundene feste Prozentschwelle. Keine ungeprüfte Überna",
    "hme der zusätzlichen Voraussetzungen357aII. Vorauszahlungen,",
    " sonstige Rückgewähr und Aufrechnung gesondert, keine automa",
    "tische Saldierung."
  )
)
}
