% Automatisch aus Fachverträgen erzeugt; fachliche Freigabe bleibt separat.
\name{adoption_aufhebungsgrundfrist}
\alias{adoption_aufhebungsgrundfrist}
\title{adoption aufhebungsgrundfrist}
\description{Feste lokale BGB-Fassung; rechtlichen Anwendungsbereich und Bewertungen ausdrücklich bestimmen.}
\usage{adoption_aufhebungsgrundfrist(
  annahme_am = NULL,
  relativer_fristbeginn_am = NULL,
  fristbeginnnachweis = NULL
)}
\arguments{
\item{annahme_am}{Rechtlich qualifiziertes ISO-Datum der Annahme als Ereignis für Dreijahresgrenze.}
\item{relativer_fristbeginn_am}{Rechtlich qualifiziertes ISO-Ereignisdatum des relativen Jahresbeginns nach§1762II a bis e; keine pauschale Gleichsetzung mit Annahmedatum oder Kenntnisdatum.}
\item{fristbeginnnachweis}{Nichtleerer Nachweis zu maßgeblichem relativen Beginn einschließlich Vertreterbezug/etwaigem vorausgehendem Fristablauf. Nur ungestörte Grundfristen.}
}
\details{Minimum aus relativem Beginn+1Jahr und Annahme+3Jahre; beide ungestörten Einzelgrenzen ausweisen. Nur ungestörte Grundfristen nach§1762II. Relativen Beginn nach Buchstaben a bis e einschließlich etwaiger Vertreterkenntnis oder Ablaufs der§1747II1-Frist rechtlich vorqualifizieren; nicht allgemein Kenntnis der Annahme einsetzen. §§206/210 und eine einschlägige§193-Korrektur sind hier nicht berechnet, insbesondere keine Behauptung absolut unkorrigierbarer Dreijahresfrist. Liegt relativer Beginn erst nach Dreijahresgrenze, bleibt das errechnete Grundende früher; daraus folgt kein automatisches Erlöschensurteil. Antragsberechtigung, Vertretung, Beurkundung und Aufhebungsgrund gesondert. Geldbeträge als nichtnegative Dezimalzeichenfolge oder Bruchobjekt mit Zeichenfolgen zaehler/nenner. Exakte Ganzzahl-Zwischenwerte höchstens 2^53-1. Fehlende Pflichteingabe EINGABE_FEHLT, unzulässige Typen oder Bereiche EINGABE_UNGUELTIG.}
\value{wert enthält jahresgrundfristende, dreijahresgrundgrenze und antragsgrundfristende als ISO-Daten. Einheit: daten.}
\references{BGB_PDF_SHA256_9b5a99536e7b00756e9fa5f20082bd9ad3951b37c381fc0f5d52aa5a556839eb; BGB_1762_T0005, BGB_1762_T0007, BGB_1762_T0008, BGB_1762_T0009, BGB_1762_T0010, BGB_1762_T0011, BGB_1762_T0012}
\examples{
adoption_aufhebungsgrundfrist(
  annahme_am = "2030-01-15",
  relativer_fristbeginn_am = "2030-03-01",
  fristbeginnnachweis = paste0(
    "Rechtlich qualifizierter Beginn nach einschlägigem Buchstabe",
    "n, kein Hemmungsfall."
  )
)
}
