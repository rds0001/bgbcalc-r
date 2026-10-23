% Automatisch aus Fachverträgen erzeugt; fachliche Freigabe bleibt separat.
\name{entgangener_gewinn_nettobetrag}
\alias{entgangener_gewinn_nettobetrag}
\title{entgangener gewinn nettobetrag}
\description{Feste lokale BGB-Fassung; rechtlichen Anwendungsbereich und Bewertungen ausdrücklich bestimmen.}
\usage{entgangener_gewinn_nettobetrag(
  erwartbare_erloese = NULL,
  zugehoerige_aufwendungen = NULL,
  einordnungsnachweis = NULL
)}
\arguments{
\item{erwartbare_erloese}{Rechtlich begründete, ohne das Schadensereignis erwartbare Erlöse in EUR.}
\item{zugehoerige_aufwendungen}{Diesen Erlösen wirtschaftlich zugeordnete erwartbare Aufwendungen in EUR, ohne Doppelzählung.}
\item{einordnungsnachweis}{Nichtleerer Nachweis der qualifizierten kontrafaktischen Einnahmen-/Kostenbasis und des betrachteten Geschäfts/Zeitraums.}
}
\details{Erwartbare Erlöse um zugehörige Aufwendungen vermindern; positiver Nettogewinn mindestens null. §252: rein rechnerische Nettogewinnermittlung aus qualifizierter kontrafaktischer Basis. Wahrscheinlichkeit, Kausalität und Bewertungsansatz werden nicht ermittelt. Kein zusätzlicher Anspruch auf Erlös und Nettogewinn zugleich; weitere Vorteile, tatsächlich verbleibende Erträge, Mitverschulden und Schadensminderung getrennt berücksichtigen. Negative Marge begründet hier keinen entgangenen Gewinn; kein vollständiger Schadensersatzbetrag. Nichtnegative Eingangswerte, exakter nichtnegativer EUR-Bruch im sicheren gemeinsamen Zahlenbereich.}
\value{wert ist der exakte EUR-Bruch. Einheit: EUR.}
\references{BGB_PDF_SHA256_9b5a99536e7b00756e9fa5f20082bd9ad3951b37c381fc0f5d52aa5a556839eb; BGB_252_T0001, BGB_252_T0002}
\examples{
entgangener_gewinn_nettobetrag(
  erwartbare_erloese = "1000",
  zugehoerige_aufwendungen = "400",
  einordnungsnachweis = paste0(
    "§252: rein rechnerische Nettogewinnermittlung aus qualifizie",
    "rter kontrafaktischer Basis. Wahrscheinlichkeit, Kausalität ",
    "und Bewertungsansatz werden nicht ermittelt. Kein zusätzlich",
    "er Anspruch auf Erlös und Nettogewinn zugleich; weitere Vort",
    "eile, tatsächlich verbleibende Erträge, Mitverschulden und S",
    "chadensminderung getrennt berücksichtigen. Negative Marge be",
    "gründet hier keinen entgangenen Gewinn; kein vollständiger S",
    "chadensersatzbetrag."
  )
)
}
