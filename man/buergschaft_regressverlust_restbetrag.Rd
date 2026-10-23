% Automatisch aus Fachverträgen erzeugt; fachliche Freigabe bleibt separat.
\name{buergschaft_regressverlust_restbetrag}
\alias{buergschaft_regressverlust_restbetrag}
\title{buergschaft regressverlust restbetrag}
\description{Feste lokale BGB-Fassung; rechtlichen Anwendungsbereich und Bewertungen ausdrücklich bestimmen.}
\usage{buergschaft_regressverlust_restbetrag(
  buergschaftsverbindlichkeit = NULL,
  verlorener_erlangbarer_regress = NULL,
  einordnungsnachweis = NULL
)}
\arguments{
\item{buergschaftsverbindlichkeit}{Rechtlich bestimmter offener Bürgschaftsbetrag in EUR vor776-Freistellung.}
\item{verlorener_erlangbarer_regress}{Aus dem vom Gläubiger aufgegebenen Recht tatsächlich hypothetisch erlangbarer Ersatzbetrag nach774 in EUR; bereits rechtlich und wirtschaftlich bewertet.}
\item{einordnungsnachweis}{Nichtleerer Nachweis des776-Falls, Rechtsaufgabe durch den Gläubiger und erlangbarer Ersatz, ohne doppelte Erfassung derselben Regressmöglichkeit.}
}
\details{Offene Bürgschaftsverbindlichkeit um erlangbaren verlorenen Regress mindern, mindestens null. §776: Maßgeblich ist der erlangbare Ersatz aus dem aufgegebenen Recht, nicht automatisch dessen Nominalwert. Verwertbarkeit, Rang, Mitbürgenquote und weitere Bedingungen vorqualifizieren. Keine automatische Auslegung einer wirksamen Rechtsaufgabe oder kumulative Anrechnung gleicher Sicherheiten. Ergebnis ist verbleibende betragsmäßige Bürgschaftsbindung vor weiteren Einreden; überschießender Regresswert begründet hier keine Forderung des Bürgen. Nichtnegative Eingangswerte, exakter nichtnegativer EUR-Bruch im sicheren gemeinsamen Zahlenbereich.}
\value{wert ist der exakte EUR-Bruch. Einheit: EUR.}
\references{BGB_PDF_SHA256_9b5a99536e7b00756e9fa5f20082bd9ad3951b37c381fc0f5d52aa5a556839eb; BGB_776_T0001, BGB_776_T0002}
\examples{
buergschaft_regressverlust_restbetrag(
  buergschaftsverbindlichkeit = "100",
  verlorener_erlangbarer_regress = "40",
  einordnungsnachweis = paste0(
    "§776: Maßgeblich ist der erlangbare Ersatz aus dem aufgegebe",
    "nen Recht, nicht automatisch dessen Nominalwert. Verwertbark",
    "eit, Rang, Mitbürgenquote und weitere Bedingungen vorqualifi",
    "zieren. Keine automatische Auslegung einer wirksamen Rechtsa",
    "ufgabe oder kumulative Anrechnung gleicher Sicherheiten. Erg",
    "ebnis ist verbleibende betragsmäßige Bürgschaftsbindung vor ",
    "weiteren Einreden; überschießender Regresswert begründet hie",
    "r keine Forderung des Bürgen."
  )
)
}
