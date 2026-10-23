% Automatisch aus Fachverträgen erzeugt; fachliche Freigabe bleibt separat.
\name{betreuung_vermoegenswert_ohne_immobilien}
\alias{betreuung_vermoegenswert_ohne_immobilien}
\title{betreuung vermoegenswert ohne immobilien}
\description{Feste lokale BGB-Fassung; rechtlichen Anwendungsbereich und Bewertungen ausdrücklich bestimmen.}
\usage{betreuung_vermoegenswert_ohne_immobilien(
  vermoegenspositionen = NULL,
  verbindlichkeiten = NULL,
  bewertungsnachweis = NULL
)}
\arguments{
\item{vermoegenspositionen}{Liste1..10000 qualifizierter Vermögenspositionen, je genau wert (nichtnegative exakte EUR-Zahl) und immobilie (echter Wahrheitswert). Anteilige Berechtigung bewertet, keine verborgene Verbindlichkeitsverrechnung im Wert; kein Vermögen als einzelne Nullposition.}
\item{verbindlichkeiten}{Nichtnegative dokumentierte Verbindlichkeiten in EUR. Werden validiert, aber nach§1860I gerade nicht abgezogen.}
\item{bewertungsnachweis}{Nichtleerer Nachweis von Stichtag, vollständiger Positionszuordnung, Immobilienqualifikation und Werten ohne unzulässige Vorab-Schuldenverrechnung.}
}
\details{Nichtimmobilienwerte summieren, Immobilienwerte separat ausweisen; Verbindlichkeiten nicht abziehen. §1860I schreibt Berechnung ohne Immobilien und Verbindlichkeiten vor. Positionen und Werte zum maßgeblichen Stichtag rechtlich qualifiziert, anteilige Berechtigungen bereits bewertet. Wert einer Nichtimmobilienposition nicht vorher um separat zu berücksichtigende Verbindlichkeiten vermindern; sonst würde der gesetzlich ausgeschlossene Schuldenabzug verdeckt nachgeholt. Verbindlichkeiten werden als nichtnegative dokumentierte Eingabe validiert und bewusst nicht abgezogen. Immobilienzuordnung ist Nutzervorgabe, keine automatische Objektklassifikation. Kein Vermögen als einzelne Nullposition angeben. Die6000EUR-Schwelle, Antrag, richterliches Ermessen, Gefährdung und sonstige Befreiungswege werden nicht als eigenständige Befreiungsentscheidung berechnet. Geldbeträge als nichtnegative Dezimalzeichenfolge oder Bruchobjekt mit Zeichenfolgen zaehler/nenner. Exakte Ganzzahl-Zwischenwerte höchstens 2^53-1. Fehlende Pflichteingabe EINGABE_FEHLT, unzulässige Typen oder Bereiche EINGABE_UNGUELTIG.}
\value{wert enthält anzusetzender_vermoegenswert und nicht_beruecksichtigter_immobilienwert als exakte EUR-Brüche. Kein Befreiungsstatus. Einheit: EUR.}
\references{BGB_PDF_SHA256_9b5a99536e7b00756e9fa5f20082bd9ad3951b37c381fc0f5d52aa5a556839eb; BGB_1860_T0001}
\examples{
betreuung_vermoegenswert_ohne_immobilien(
  vermoegenspositionen = list(
    list(
    "wert" = "4000",
    "immobilie" = FALSE
  ),
    list(
    "wert" = "2000",
    "immobilie" = FALSE
  ),
    list(
    "wert" = "1000000",
    "immobilie" = TRUE
  )
  ),
  verbindlichkeiten = "10000",
  bewertungsnachweis = paste0(
    "Vollständige qualifizierte Positionen zum maßgeblichen Stich",
    "tag, keine Verbindlichkeiten vorab abgezogen."
  )
)
}
