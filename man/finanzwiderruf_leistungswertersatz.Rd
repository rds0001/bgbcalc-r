% Automatisch aus Fachverträgen erzeugt; fachliche Freigabe bleibt separat.
\name{finanzwiderruf_leistungswertersatz}
\alias{finanzwiderruf_leistungswertersatz}
\title{finanzwiderruf leistungswertersatz}
\description{Feste lokale BGB-Fassung; rechtlichen Anwendungsbereich und Bewertungen ausdrücklich bestimmen.}
\usage{finanzwiderruf_leistungswertersatz(
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
\item{einordnungsnachweis}{Nichtleerer Nachweis des einschlägigen Finanzdienstleistungs-/Finanzierungshilfe-Widerrufsfalls, der gesetzlich erforderlichen Unterrichtung/Zustimmung, des rechtlich geschuldeten Wertersatzes und der Leistungs-/Marktwertbewertung.}
}
\details{Vertraglichen Vergütungsanteil bestimmen oder auf den Marktwert der bereits erbrachten Leistung umstellen. §357bII undIII4: Wertersatz für bis zum Widerruf erbrachte Finanzdienstleistung beziehungsweise qualifizierte Finanzierungshilfe. Je nach Anwendungsfall erforderliche vorherige Unterrichtung, ausdrückliche Zustimmung zum vorzeitigen Beginn und Sonderverweise auf357a/506IV rechtlich vorqualifizieren. Bei digitalen Inhalten die besonderen Voraussetzungen357bII3 beachten. Keine ungeprüfte Übertragung auf gewöhnliche Darlehensnutzungszinsen357bIII; diese separat berechnen. Vereinbarte Vergütung entsprechend rechtlich bewertetem Leistungsanteil, keine automatische Zeitquote. Bei unverhältnismäßig hohem Gesamtpreis ist der eingegebene Marktwert bereits derjenige der erbrachten Leistung und wird nicht nochmals mit der Quote multipliziert. Keine feste Prozentgrenze für Unverhältnismäßigkeit erfinden; Rückzahlungen und weitere Aufwendungen getrennt, keine automatische Aufrechnung. Geldbeträge als nichtnegative Dezimalzeichenfolge oder Bruchobjekt mit Zeichenfolgen zaehler/nenner. Exakte Ganzzahl-Zwischenwerte höchstens 2^53-1. Fehlende Pflichteingabe EINGABE_FEHLT, unzulässige Typen oder Bereiche EINGABE_UNGUELTIG.}
\value{wert: exakter EUR-Wertersatzbruch; Vertragspreisanteil oder Marktwert der bereits erbrachten Leistung, keine zusätzliche Quotenkürzung des Marktwerts. Einheit: EUR.}
\references{BGB_PDF_SHA256_9b5a99536e7b00756e9fa5f20082bd9ad3951b37c381fc0f5d52aa5a556839eb; BGB_357b_T0002, BGB_357b_T0003, BGB_357b_T0004, BGB_357b_T0005, BGB_357b_T0006, BGB_357b_T0007, BGB_357b_T0008, BGB_357b_T0009, BGB_357b_T0010, BGB_357b_T0011, BGB_357b_T0012, BGB_357b_T0013, BGB_357b_T0014, BGB_357b_T0015}
\examples{
finanzwiderruf_leistungswertersatz(
  gesamtverguetung = "1000",
  leistungsanteil_zaehler = 1,
  leistungsanteil_nenner = 4,
  verguetung_unverhaeltnismaessig_hoch = FALSE,
  marktwert_erbrachte_leistung = NULL,
  einordnungsnachweis = paste0(
    "§357bII undIII4: Wertersatz für bis zum Widerruf erbrachte F",
    "inanzdienstleistung beziehungsweise qualifizierte Finanzieru",
    "ngshilfe. Je nach Anwendungsfall erforderliche vorherige Unt",
    "errichtung, ausdrückliche Zustimmung zum vorzeitigen Beginn ",
    "und Sonderverweise auf357a/506IV rechtlich vorqualifizieren.",
    " Bei digitalen Inhalten die besonderen Voraussetzungen357bII",
    "3 beachten. Keine ungeprüfte Übertragung auf gewöhnliche Dar",
    "lehensnutzungszinsen357bIII; diese separat berechnen. Verein",
    "barte Vergütung entsprechend rechtlich bewertetem Leistungsa",
    "nteil, keine automatische Zeitquote. Bei unverhältnismäßig h",
    "ohem Gesamtpreis ist der eingegebene Marktwert bereits derje",
    "nige der erbrachten Leistung und wird nicht nochmals mit der",
    " Quote multipliziert. Keine feste Prozentgrenze für Unverhäl",
    "tnismäßigkeit erfinden; Rückzahlungen und weitere Aufwendung",
    "en getrennt, keine automatische Aufrechnung."
  )
)
}
