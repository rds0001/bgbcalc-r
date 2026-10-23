% Automatisch aus Fachverträgen erzeugt; fachliche Freigabe bleibt separat.
\name{tagesreise_reisepreisgrenze}
\alias{tagesreise_reisepreisgrenze}
\title{tagesreise reisepreisgrenze}
\description{Feste lokale BGB-Fassung; rechtlichen Anwendungsbereich und Bewertungen ausdrücklich bestimmen.}
\usage{tagesreise_reisepreisgrenze(
  reisepreis = NULL,
  einordnungsnachweis = NULL
)}
\arguments{
\item{reisepreis}{Nichtnegativer qualifizierter Gesamtpreis der betrachteten Reise in EUR.}
\item{einordnungsnachweis}{Nichtleerer Nachweis zu maßgeblicher Vergleichsbasis und rechtlicher Einordnung; keine Gesamtentscheidung allein aus Zahlen.}
}
\details{Reisepreis einschließlich Gleichheit mit500EUR vergleichen und Überschreitungsbetrag berechnen. Nur Preisgrenze651aV2, nicht gesamte Tagesreiseausnahme. Reisedauer strikt unter24Stunden und keine Übernachtung zusätzlich qualifizieren. Im besonderen651cIII-Fall ist die Tagesreiseausnahme unabhängig vom Preis anzuwenden; dort keinen500EUR-Filter erfinden. Nichtnegative exakte Eingaben; bei Wertanteil positiver Gesamtwert. Keine automatische Rundung.}
\value{wert enthält preisgrenze_euro, preisgrenze_eingehalten, ueberschreitungsbetrag. Beträge als exakte Brüche, Anzahlen als Ganzzahlen, Vergleiche als Wahrheitswerte. Einheit: zahlen_und_wahrheitswerte.}
\references{BGB_PDF_SHA256_9b5a99536e7b00756e9fa5f20082bd9ad3951b37c381fc0f5d52aa5a556839eb; BGB_651a_T0001, BGB_651a_T0002, BGB_651a_T0003, BGB_651a_T0004, BGB_651a_T0005, BGB_651a_T0006, BGB_651a_T0007, BGB_651a_T0008, BGB_651a_T0009, BGB_651a_T0010, BGB_651a_T0011, BGB_651a_T0012, BGB_651a_T0013, BGB_651a_T0014, BGB_651a_T0015, BGB_651a_T0016, BGB_651a_T0017, BGB_651a_T0018, BGB_651a_T0019, BGB_651a_T0020, BGB_651a_T0021, BGB_651a_T0022, BGB_651a_T0023, BGB_651c_T0006}
\examples{
tagesreise_reisepreisgrenze(
  reisepreis = "0",
  einordnungsnachweis = paste0(
    "Nur Preisgrenze651aV2, nicht gesamte Tagesreiseausnahme. Rei",
    "sedauer strikt unter24Stunden und keine Übernachtung zusätzl",
    "ich qualifizieren. Im besonderen651cIII-Fall ist die Tagesre",
    "iseausnahme unabhängig vom Preis anzuwenden; dort keinen500E",
    "UR-Filter erfinden."
  )
)
}
