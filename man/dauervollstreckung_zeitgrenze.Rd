% Automatisch aus Fachverträgen erzeugt; fachliche Freigabe bleibt separat.
\name{dauervollstreckung_zeitgrenze}
\alias{dauervollstreckung_zeitgrenze}
\title{dauervollstreckung zeitgrenze}
\description{Feste lokale BGB-Fassung; rechtlichen Anwendungsbereich und Bewertungen ausdrücklich bestimmen.}
\usage{dauervollstreckung_zeitgrenze(
  erbfall_am = NULL,
  prueftag = NULL,
  fortdaueranordnung = NULL,
  fortdauerereignis_am = NULL,
  ereignisperson_juristische_person = NULL,
  verwaltungsanordnung_nach_2209 = NULL,
  einordnungsnachweis = NULL
)}
\arguments{
\item{erbfall_am}{ISO-Datum des Erbfalls; Beginn der dreißigjährigen Ereignisfrist, nicht Amtsantritt oder späterer Verwaltungsbeginn.}
\item{prueftag}{ISO-Datum mindestens Erbfalltag; Prüfung zum Tagesende.}
\item{fortdaueranordnung}{Genau keine, tod_erbe, tod_testamentsvollstrecker, ereignis_erbe oder ereignis_testamentsvollstrecker. Ausdrücklich rechtlich qualifizierte testamentarische Anordnung nach§2210 Satz2, keine bloße Ereignisbeschreibung. Erfasste konkrete Person und etwaige Amtsnachfolge vorab rechtlich bestimmen.}
\item{fortdauerereignis_am}{Optionales ISO-Datum des tatsächlichen angeordneten Ereigniseintritts zwischen Erbfall und Prüftag. NULL bedeutet bis Prüftag nicht eingetreten, nicht unbekannt. Bei keine zwingend NULL. Zum Prüftagesende ist bereits eingetretenes Beendigungsereignis wirksam.}
\item{ereignisperson_juristische_person}{Expliziter Wahrheitswert: erfasster Erbe/Testamentsvollstrecker ist juristische Person, dann§2163 Absatz2 entsprechend höchstens dreißig Jahre. Ohne Ereignisperson FALSE vorgeben.}
\item{verwaltungsanordnung_nach_2209}{Expliziter Wahrheitswert zum Anwendungsbereich der Verwaltungsanordnung§2209. FALSE ergibt NICHT_ANWENDBAR; keine automatische Gleichsetzung aller Testamentsvollstreckungen mit Dauervollstreckung.}
\item{einordnungsnachweis}{Nichtleere Begründung der§2209-Anordnung, konkreten Fortdauerbestimmung/Person, etwaiger juristischer Person und tatsächlichen Ereigniszeit. Amtsnachfolgerkette wird nicht automatisch als wirksame Fortdauer behandelt.}
}
\details{Dreißig Jahre ab Erbfall berechnen. Wirksame Fortdaueranordnung für natürliche Ereignisperson ersetzt die starre Grenze durch Ereigniseintritt. Bei juristischer Ereignisperson spätestens Dreißigjahresende, gegebenenfalls früherer angeordneter Ereigniseintritt. Keine Gesamtwirksamkeit oder Amtsnachfolgeauslegung. Anders als§2163 Absatz1 enthält§2210 Satz2 kein ausdrückliches Erfordernis Leben beim Erbfall; nur Absatz2 wird entsprechend angewandt. Ereignisabhängiges unbekanntes künftiges Ende ist kein unbegrenztes Amt. Sonstige Beendigungsgründe außerhalb Modell. ISO-Daten und berechnete Grenzen0001..9999, explizite Wahrheitswerte, zulässige Fortdaueranordnung, nichtleerer Nachweis.}
\value{wert enthält dreissigjahresfristende, fortdauer_ueber_dreissig_jahre_zulaessig (abstrakte Ausnahme der wirksam qualifizierten Anordnung, auch bei tatsächlich früherem Ereignis), massgebliche_zeitgrenze_am (NULL bei noch nicht eingetretenem natürlichem Personenereignis) und verwaltung_nach_zeitregel_beendet. Einheit: daten_und_wahrheitswerte.}
\references{BGB_PDF_SHA256_9b5a99536e7b00756e9fa5f20082bd9ad3951b37c381fc0f5d52aa5a556839eb; BGB_2210_T0001, BGB_2210_T0002, BGB_2210_T0003, BGB_2163_T0004}
\examples{
dauervollstreckung_zeitgrenze(
  erbfall_am = "2000-02-29",
  prueftag = "2030-02-27",
  fortdaueranordnung = "keine",
  fortdauerereignis_am = NULL,
  ereignisperson_juristische_person = FALSE,
  verwaltungsanordnung_nach_2209 = TRUE,
  einordnungsnachweis = paste0(
    "Synthetisch qualifizierte Verwaltungsanordnung§2209; angeord",
    "nete Fortdauer und konkrete Ereignisperson geprüft."
  )
)
}
