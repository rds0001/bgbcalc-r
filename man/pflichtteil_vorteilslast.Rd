% Automatisch aus Fachverträgen erzeugt; fachliche Freigabe bleibt separat.
\name{pflichtteil_vorteilslast}
\alias{pflichtteil_vorteilslast}
\title{pflichtteil vorteilslast}
\description{Feste lokale BGB-Fassung; rechtlichen Anwendungsbereich und Bewertungen ausdrücklich bestimmen.}
\usage{pflichtteil_vorteilslast(
  fallart = NULL,
  pflichtteilslast = NULL,
  angenommenes_vermaechtnis = NULL,
  erlangter_vorteil = NULL,
  lastzuordnung_qualifiziert = NULL,
  bewertungsnachweis = NULL
)}
\arguments{
\item{fallart}{ersatzerwerb_2320 oder vermaechtnisausschlagung_2321, jeweils rechtlich qualifiziert.}
\item{pflichtteilslast}{Nichtnegative exakte EUR-Pflichtteilslast, bei angenommenem Vermächtnis Anrechnung2307 bereits berücksichtigt.}
\item{angenommenes_vermaechtnis}{Nichtnegativer EUR-Wert eines angenommenen Vermächtnisses2320; überschneidungsfrei zur Pflichtteilslast. Bei2321 null.}
\item{erlangter_vorteil}{Nichtnegativer rechtlich bewerteter EUR-Vorteil gerade aus Ersatzerwerb/Ausschlagung, nicht automatisch gesamter Erbteil.}
\item{lastzuordnung_qualifiziert}{Pflichtwahrheitswert der Sonderzuordnung2320/2321 einschließlich abweichender Verfügung2324; FALSE NICHT_ANWENDBAR.}
\item{bewertungsnachweis}{Nichtleerer Nachweis von Vorteil und überschneidungsfreien Lastkomponenten.}
}
\details{Pflichtteilslast plus angenommenes Vermächtnis addieren; zugeordnete Sonderlast=min(Gesamtlast,Vorteil); Rest getrennt. Keine Doppelanrechnung2307 und keine automatische Quote für mehrere Begünstigte oder übrige Erben. Geldbeträge als nichtnegative Dezimalzeichenfolge oder Bruchobjekt mit Zeichenfolgen zaehler/nenner. Exakte Ganzzahl-Zwischenwerte höchstens 2^53-1. Fehlende Pflichteingabe EINGABE_FEHLT, unzulässige Typen oder Bereiche EINGABE_UNGUELTIG.}
\value{wert enthält zugeordnete_sonderlast und nicht_durch_vorteil_zugeordnete_restlast als exakte EUR-Brüche. Einheit: EUR.}
\references{BGB_PDF_SHA256_9b5a99536e7b00756e9fa5f20082bd9ad3951b37c381fc0f5d52aa5a556839eb; BGB_2320_T0001, BGB_2320_T0002, BGB_2321_T0001}
\examples{
pflichtteil_vorteilslast(
  fallart = "ersatzerwerb_2320",
  pflichtteilslast = "60",
  angenommenes_vermaechtnis = "20",
  erlangter_vorteil = "50",
  lastzuordnung_qualifiziert = TRUE,
  bewertungsnachweis = "Synthetischer Vorteil und getrennte Lasten."
)
}
