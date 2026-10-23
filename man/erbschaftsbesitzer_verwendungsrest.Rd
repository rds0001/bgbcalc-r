% Automatisch aus Fachverträgen erzeugt; fachliche Freigabe bleibt separat.
\name{erbschaftsbesitzer_verwendungsrest}
\alias{erbschaftsbesitzer_verwendungsrest}
\title{erbschaftsbesitzer verwendungsrest}
\description{Feste lokale BGB-Fassung; rechtlichen Anwendungsbereich und Bewertungen ausdrücklich bestimmen.}
\usage{erbschaftsbesitzer_verwendungsrest(
  ersatzfaehige_verwendungen = NULL,
  bereits_durch_bereicherungsanrechnung_gedeckt = NULL,
  anspruch_nach_2022_qualifiziert = NULL,
  bewertungsnachweis = NULL
)}
\arguments{
\item{ersatzfaehige_verwendungen}{Nichtnegative exakte EUR-Summe rechtlich unter2022I/II fallender Verwendungen einschließlich qualifizierter Lasten-/Schuldentilgungsaufwendungen. Noch vor Abzug des bereits bereicherungsrechtlich gedeckten Teils.}
\item{bereits_durch_bereicherungsanrechnung_gedeckt}{Nichtnegativer exakter EUR-Teil gerade dieser Verwendungen, der durch Anrechnung auf2021-Bereicherung bereits gedeckt wird, höchstens ersatzfaehige_verwendungen.}
\item{anspruch_nach_2022_qualifiziert}{Expliziter Wahrheitswert des rechtlich einschlägigen Verwendungsersatzes. Verschärfte Haftung2023–2025 und abweichende/weitergehende Ersatzgrundlagen separat qualifiziert; FALSE ergibt NICHT_ANWENDBAR.}
\item{bewertungsnachweis}{Nichtleerer Nachweis zu qualifizierten Aufwendungen, bereits gedecktem Anteil und Rechtsgrund.}
}
\details{Ersatzfähige Verwendungen minus gerade durch Anrechnung auf2021-Bereicherung bereits gedeckter Aufwand. Keine eigenständige Bereicherungsbewertung, keine automatische Durchsetzbarkeit/Zurückbehaltung oder weitergehender Anspruch2022III. Bereits gedeckter Teil darf Aufwand nicht übersteigen. Geldbeträge als nichtnegative Dezimalzeichenfolge oder Bruchobjekt mit Zeichenfolgen zaehler/nenner. Exakte Ganzzahl-Zwischenwerte höchstens 2^53-1. Fehlende Pflichteingabe EINGABE_FEHLT, unzulässige Typen oder Bereiche EINGABE_UNGUELTIG.}
\value{wert ist exakter noch nicht durch Bereicherungsanrechnung gedeckter EUR-Verwendungsrest; negative Anwendbarkeit NULL. Einheit: EUR.}
\references{BGB_PDF_SHA256_9b5a99536e7b00756e9fa5f20082bd9ad3951b37c381fc0f5d52aa5a556839eb; BGB_2022_T0001, BGB_2022_T0003}
\examples{
erbschaftsbesitzer_verwendungsrest(
  ersatzfaehige_verwendungen = "100",
  bereits_durch_bereicherungsanrechnung_gedeckt = "30",
  anspruch_nach_2022_qualifiziert = TRUE,
  bewertungsnachweis = paste0(
    "Synthetisch2022-qualifizierter Aufwand und nach2021 bereits ",
    "gedeckter Teil."
  )
)
}
