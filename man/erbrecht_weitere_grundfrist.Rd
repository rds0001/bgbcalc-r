% Automatisch aus Fachverträgen erzeugt; fachliche Freigabe bleibt separat.
\name{erbrecht_weitere_grundfrist}
\alias{erbrecht_weitere_grundfrist}
\title{erbrecht weitere grundfrist}
\description{Feste lokale BGB-Fassung; rechtlichen Anwendungsbereich und Bewertungen ausdrücklich bestimmen.}
\usage{erbrecht_weitere_grundfrist(
  fristart = NULL,
  fristbeginnereignis_am = NULL,
  einordnungsnachweis = NULL
)}
\arguments{
\item{fristart}{erbrechtsnachweis_1965 (3Monate), nachlassverwaltung_1981 (2Jahre), erbteilvorkauf_2034 (2Monate), glaeubigeranmeldung_2061 (6Monate). Nur der rechtlich einschlägige gesetzliche Fristentyp.}
\item{fristbeginnereignis_am}{ISO-Datum des qualifizierten Anfangsereignisses:1965 Ablauf öffentliche Anmeldungsfrist oder ohne öffentliche Aufforderung gerichtliche Nachweisaufforderung;1981 Annahme;2034 Empfang ausreichender Vertragsmitteilung469;2061 letzte erforderliche Veröffentlichung. Keine pauschale Ersatzwahl Erbfall/Kaufvertrag.}
\item{einordnungsnachweis}{Nichtleerer Nachweis zu Fristart, gesetzlichem Anwendungsfall und maßgeblichem Anfangsereignis.}
}
\details{Gesetzliche3-/2-/6Monats- oder2Jahresfrist auswählen und als Ereignisfrist berechnen. Nur Grundfrist, kein Wirksamkeits-/Zulässigkeitsentscheid und keine automatische Hemmung/Feiertagskorrektur.2061-Haftungsquote getrennt. ISO-Daten und berechnete Grenzen0001..9999, feste Auswahlwerte, nichtleerer Nachweis.}
\value{wert enthält grundfristende, anzahl und einheit der gesetzlichen Frist. Einheit: datum_und_fristlaenge.}
\references{BGB_PDF_SHA256_9b5a99536e7b00756e9fa5f20082bd9ad3951b37c381fc0f5d52aa5a556839eb; BGB_1965_T0003, BGB_1965_T0004, BGB_1981_T0003, BGB_2034_T0002, BGB_469_T0003, BGB_469_T0004, BGB_2061_T0001, BGB_2061_T0004}
\examples{
erbrecht_weitere_grundfrist(
  fristart = "erbrechtsnachweis_1965",
  fristbeginnereignis_am = "2030-01-31",
  einordnungsnachweis = "Synthetisch qualifizierter gesetzlicher Fristbeginn."
)
}
