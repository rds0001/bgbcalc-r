% Automatisch aus Fachverträgen erzeugt; fachliche Freigabe bleibt separat.
\name{mietspiegel_spanneneinordnung}
\alias{mietspiegel_spanneneinordnung}
\title{mietspiegel spanneneinordnung}
\description{Feste lokale BGB-Fassung; rechtlichen Anwendungsbereich und Bewertungen ausdrücklich bestimmen.}
\usage{mietspiegel_spanneneinordnung(
  spannengrenze_unten = NULL,
  spannengrenze_oben = NULL,
  verlangte_miete = NULL,
  einordnungsnachweis = NULL
)}
\arguments{
\item{spannengrenze_unten}{Nichtnegativer exakter Dezimaltext/Bruch; Kosten/Miete in identischer Einheit und Periode, Jahresnutzungsgrad ausdrücklich in Prozentpunkten.}
\item{spannengrenze_oben}{Nichtnegativer exakter Dezimaltext/Bruch; Kosten/Miete in identischer Einheit und Periode, Jahresnutzungsgrad ausdrücklich in Prozentpunkten.}
\item{verlangte_miete}{Nichtnegativer exakter Dezimaltext/Bruch; Kosten/Miete in identischer Einheit und Periode, Jahresnutzungsgrad ausdrücklich in Prozentpunkten.}
\item{einordnungsnachweis}{Nichtleerer Nachweis zu maßgeblicher Vergleichsbasis und rechtlicher Einordnung; keine Gesamtentscheidung allein aus Zahlen.}
}
\details{Verlangte Miete einschließlich der Grenzen mit qualifizierter Mietspiegelspanne vergleichen. Nur numerischer Spannenvergleich nach558aIV1; gleiche Miet-/Flächeneinheit und gleicher Zeitraum für alle drei Werte. Keine automatische Auswahl der Vergleichsmerkmale, kein Beweis endgültiger ortsüblicher Vergleichsmiete und keine Prüfung der vollständigen Mieterhöhungsberechtigung nach558. Unter- und Obergrenze zählen mit; keine automatische Erhöhung einer unter der Spanne verlangten Miete. Nichtnegative Eingaben; Kostendifferenz kann negativ sein. Keine automatische Rundung.}
\value{wert enthält innerhalb_der_spanne, unterhalb_unterschreitungsbetrag, oberhalb_ueberschreitungsbetrag. Beträge als exakte Brüche, Anzahlen als Ganzzahlen, Vergleiche als Wahrheitswerte. Einheit: zahlen_und_wahrheitswerte.}
\references{BGB_PDF_SHA256_9b5a99536e7b00756e9fa5f20082bd9ad3951b37c381fc0f5d52aa5a556839eb; BGB_558a_T0001, BGB_558a_T0002, BGB_558a_T0003, BGB_558a_T0004, BGB_558a_T0005, BGB_558a_T0006, BGB_558a_T0007, BGB_558a_T0008, BGB_558a_T0009, BGB_558a_T0010}
\examples{
mietspiegel_spanneneinordnung(
  spannengrenze_unten = "5",
  spannengrenze_oben = "10",
  verlangte_miete = "5",
  einordnungsnachweis = paste0(
    "Nur numerischer Spannenvergleich nach558aIV1; gleiche Miet-/",
    "Flächeneinheit und gleicher Zeitraum für alle drei Werte. Ke",
    "ine automatische Auswahl der Vergleichsmerkmale, kein Beweis",
    " endgültiger ortsüblicher Vergleichsmiete und keine Prüfung ",
    "der vollständigen Mieterhöhungsberechtigung nach558. Unter- ",
    "und Obergrenze zählen mit; keine automatische Erhöhung einer",
    " unter der Spanne verlangten Miete."
  )
)
}
