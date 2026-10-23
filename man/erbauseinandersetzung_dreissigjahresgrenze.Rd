% Automatisch aus Fachverträgen erzeugt; fachliche Freigabe bleibt separat.
\name{erbauseinandersetzung_dreissigjahresgrenze}
\alias{erbauseinandersetzung_dreissigjahresgrenze}
\title{erbauseinandersetzung dreissigjahresgrenze}
\description{Feste lokale BGB-Fassung; rechtlichen Anwendungsbereich und Bewertungen ausdrücklich bestimmen.}
\usage{erbauseinandersetzung_dreissigjahresgrenze(
  erbfall_am = NULL,
  prueftag = NULL,
  fortgeltungsanordnung = NULL,
  angeordnetes_ereignis_am = NULL,
  miterbe_juristische_person = NULL,
  anordnung_rechtlich_qualifiziert = NULL,
  einordnungsnachweis = NULL
)}
\arguments{
\item{erbfall_am}{ISO-Datum des Erbfalls, Ereignisbeginn der Dreißigjahresfrist.}
\item{prueftag}{ISO-Prüfdatum frühestens Erbfall. Ergebnis gilt nach vollständigem Ablauf des Prüftags.}
\item{fortgeltungsanordnung}{keine, miterbenereignis, nacherbfolge oder vermaechtnisanfall. Jeweils ausdrücklich letztwillig bestimmter Endpunkt der Beschränkung nach§2044 Absatz2, nicht bloß irgendein Ereignis. keine bedeutet in diesem Modell ansonsten unbefristete Beschränkung. Kürzere anderweitige Befristungen getrennt behandeln.}
\item{angeordnetes_ereignis_am}{Optionales ISO-Datum des eingetretenen angeordneten Ereignisses, zwischen Erbfall und Prüftag. NULL bedeutet bis Prüftag nicht eingetreten, nicht unbekannt. Bei fortgeltungsanordnung=keine muss NULL verwendet werden.}
\item{miterbe_juristische_person}{Expliziter Wahrheitswert zur betroffenen Miterbenperson. Sperrt Verlängerung nur bei miterbenereignis, nicht automatisch bei Nacherbfolge/Vermächtnisanfall. Bei keiner ohne Bedeutung.}
\item{anordnung_rechtlich_qualifiziert}{Expliziter Wahrheitswert: wirksame letztwillige Beschränkung und gewählte Anordnung rechtlich eingeordnet; zugrunde liegende Nacherbfolge/Vermächtnis wirksam. Andere Gründe vorzeitiger Beendigung oder Durchbrechung gesondert geprüft. FALSE ergibt NICHT_ANWENDBAR.}
\item{einordnungsnachweis}{Nichtleerer Nachweis zu letztwilliger Beschränkung, angeordnetem Endpunkt, Miterbenperson und Ereignis; Verweise§749II/III,750,751,1010I und ggf. Wirksamkeit Nacherbfolge§2109 gesondert dokumentieren.}
}
\details{Dreißig Jahre ab Erbfall. Ohne wirksame Fortgeltungsalternative endet zeitliche Wirkung mit Ablauf; juristische Ereignismiterben erhalten keine Verlängerung. Angeordnetes Ereignis beendet die Verfügung unabhängig von Dreißigjahresgrenze ab seinem Eintritt. Nur zeitliches Modell des§2044 Absatz2, kein voller Auseinandersetzungsanspruch oder Kündigungsfristberechnung. Keine anderweitig kürzere Befristung. Durchbrechung/Beendigung aus§749II/III,750,751,1010I separat. Kein ausdrücklicher§2109-Verweis im lokalen§2044; keine ungeprüfte Übertragung dessen Ausnahmen. ISO-Daten und berechnete Grenzen0001..9999, feste Auswahlwerte, explizite Wahrheitswerte und nichtleerer Nachweis.}
\value{wert enthält dreissigjahresfristende, besondere_fortgeltung_zulaessig, angeordnetes_ereignis_eingetreten und zeitliche_wirkung_beendet; fehlende rechtliche Qualifikation NICHT_ANWENDBAR. Einheit: daten_und_wahrheitswerte.}
\references{BGB_PDF_SHA256_9b5a99536e7b00756e9fa5f20082bd9ad3951b37c381fc0f5d52aa5a556839eb; BGB_2044_T0001, BGB_2044_T0002, BGB_2044_T0003, BGB_2044_T0004, BGB_2044_T0005}
\examples{
erbauseinandersetzung_dreissigjahresgrenze(
  erbfall_am = "2000-01-31",
  prueftag = "2030-01-30",
  fortgeltungsanordnung = "keine",
  angeordnetes_ereignis_am = NULL,
  miterbe_juristische_person = FALSE,
  anordnung_rechtlich_qualifiziert = TRUE,
  einordnungsnachweis = paste0(
    "Synthetisch wirksame unbefristete Beschränkung; gesonderte D",
    "urchbrechungs-/Beendigungsgründe geprüft."
  )
)
}
