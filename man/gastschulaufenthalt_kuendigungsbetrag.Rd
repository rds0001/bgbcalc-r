% Automatisch aus Fachverträgen erzeugt; fachliche Freigabe bleibt separat.
\name{gastschulaufenthalt_kuendigungsbetrag}
\alias{gastschulaufenthalt_kuendigungsbetrag}
\title{gastschulaufenthalt kuendigungsbetrag}
\description{Feste lokale BGB-Fassung; rechtlichen Anwendungsbereich und Bewertungen ausdrücklich bestimmen.}
\usage{gastschulaufenthalt_kuendigungsbetrag(
  vereinbarter_reisepreis = NULL,
  ersparte_aufwendungen = NULL,
  notwendige_mehrkosten = NULL,
  einordnungsnachweis = NULL
)}
\arguments{
\item{vereinbarter_reisepreis}{Nichtnegativer exakter vereinbarter EUR-Preis.}
\item{ersparte_aufwendungen}{Nichtnegative ersparte EUR-Aufwendungen, höchstens der vereinbarte Preis.}
\item{notwendige_mehrkosten}{Nichtnegative rechtlich zugeordnete notwendige Mehrkosten der Kündigungsmaßnahmen in EUR.}
\item{einordnungsnachweis}{Nichtleerer Nachweis des §651uIV-Falls; Kündigung nach §651l ausdrücklich ausgeschlossen.}
}
\details{Vereinbarten Reisepreis um ersparte Aufwendungen mindern und notwendige Mehrkosten hinzufügen. Nur §651uIV außerhalb einer Kündigung nach §651l. Ersparnis und notwendige Mehrkosten rechtlich bewerten, ohne doppelte Kostenpositionen. Ergebnis ist der Anspruch vor bereits geleisteten Zahlungen, kein automatischer Zahlungssaldo. Bei Ersparnis über dem Preis ist dieser abgegrenzte Fall nicht modelliert; keine erfundene negative Preisforderung. Nichtnegative Eingangswerte, exakter nichtnegativer EUR-Bruch im sicheren gemeinsamen Zahlenbereich.}
\value{wert ist der exakte EUR-Bruch. Einheit: EUR.}
\references{BGB_PDF_SHA256_9b5a99536e7b00756e9fa5f20082bd9ad3951b37c381fc0f5d52aa5a556839eb; BGB_651u_T0009, BGB_651u_T0010, BGB_651u_T0011, BGB_651u_T0012, BGB_651u_T0013}
\examples{
gastschulaufenthalt_kuendigungsbetrag(
  vereinbarter_reisepreis = "1000",
  ersparte_aufwendungen = "400",
  notwendige_mehrkosten = "150",
  einordnungsnachweis = paste0(
    "Nur §651uIV außerhalb einer Kündigung nach §651l. Ersparnis ",
    "und notwendige Mehrkosten rechtlich bewerten, ohne doppelte ",
    "Kostenpositionen. Ergebnis ist der Anspruch vor bereits gele",
    "isteten Zahlungen, kein automatischer Zahlungssaldo. Bei Ers",
    "parnis über dem Preis ist dieser abgegrenzte Fall nicht mode",
    "lliert; keine erfundene negative Preisforderung."
  )
)
}
