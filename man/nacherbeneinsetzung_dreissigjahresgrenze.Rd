% Automatisch aus Fachverträgen erzeugt; fachliche Freigabe bleibt separat.
\name{nacherbeneinsetzung_dreissigjahresgrenze}
\alias{nacherbeneinsetzung_dreissigjahresgrenze}
\title{nacherbeneinsetzung dreissigjahresgrenze}
\description{Feste lokale BGB-Fassung; rechtlichen Anwendungsbereich und Bewertungen ausdrücklich bestimmen.}
\usage{nacherbeneinsetzung_dreissigjahresgrenze(
  erbfall_am = NULL,
  prueftag = NULL,
  nacherbfall_am = NULL,
  fortgeltungsgrund = NULL,
  ereignistraeger_bei_erbfall_vorhanden = NULL,
  ereignistraeger_juristische_person = NULL,
  einordnungsnachweis = NULL
)}
\arguments{
\item{erbfall_am}{ISO-Datum des Erbfalls, Beginn der Ereignisfrist.}
\item{prueftag}{ISO-Prüfdatum frühestens Erbfall; Ergebnis nach vollständigem Ablauf dieses Tages. Ablaufdatum selbst genügt erst mit seinem Tagesende.}
\item{nacherbfall_am}{Optionales ISO-Datum des rechtlich maßgeblichen Nacherbfallereignisses, zwischen Erbfall und Prüftag. NULL bedeutet noch nicht eingetreten, nicht unbekannt. Ein späteres Ereignis ist kein Heilungstatbestand einer bereits abgelaufenen Einsetzung; Zeitpunkt aus Verfügung/gegebenenfalls§2106 vorab bestimmen.}
\item{fortgeltungsgrund}{keiner, personenereignis oder geschwistergeburt. personenereignis nur bei angeordnetem bestimmten Ereignis in der Person des Vor-/Nacherben. geschwistergeburt nur wenn gerade Bruder/Schwester dem Vor- oder Nacherben für den Fall der Geburt dieses Geschwisters als Nacherbe bestimmt ist. Keine bloße Verwandtschaft oder beliebige Geburt.}
\item{ereignistraeger_bei_erbfall_vorhanden}{Expliziter Wahrheitswert: bei personenereignis lebte die betreffende natürliche Person im Erbfall beziehungsweise bestand die juristische Person schon. Bestand einer juristischen Person begründet keine Ausnahme. Bei geschwistergeburt keine zusätzliche Lebendvoraussetzung; bei keiner ohne Bedeutung, FALSE eingeben.}
\item{ereignistraeger_juristische_person}{Expliziter Wahrheitswert zur betreffenden Ereignisperson, nicht zu beliebigen Beteiligten. TRUE schließt Fortgeltung aus personenereignis gemäß Absatz2 aus; mit geschwistergeburt unvereinbar.}
\item{einordnungsnachweis}{Nichtleere Begründung der wirksamen ursprünglichen Anordnung, des qualifizierten Nacherbfallereignisses, Fortgeltungsgrundes und Ereignisträgerstatus.}
}
\details{Dreißigjahresfrist ab Erbfall; Ablauf am Tagesende. Unwirksamkeit aus dieser Grenze nur ohne rechtzeitiges Nacherbfallereignis und ohne Fortgeltungsausnahme. Personenereignis setzt bei Erbfall lebende natürliche Ereignisperson voraus; Geschwistergeburt eigenständige qualifizierte Ausnahme. Nur Unwirksamkeit wegen§2109, keine abschließende Testamentswirksamkeit oder Erwerbsfeststellung. Juristischer Ereignisträger bleibt bei dreißig Jahren. Keine automatische Auslegung§2106/2101, Kalenderkorrektur oder Heilung durch verspätetes Ereignis. ISO-Daten und berechnete Grenzen0001..9999, feste Auswahlwerte, explizite Wahrheitswerte und nichtleerer Nachweis.}
\value{wert enthält dreissigjahresfristende, nacherbfall_bis_fristablauf, fortgeltungsausnahme und unwirksam_wegen_dreissigjahresgrenze als Daten/Wahrheitswerte. Einheit: daten_und_wahrheitswerte.}
\references{BGB_PDF_SHA256_9b5a99536e7b00756e9fa5f20082bd9ad3951b37c381fc0f5d52aa5a556839eb; BGB_2109_T0001, BGB_2109_T0002, BGB_2109_T0003, BGB_2109_T0004, BGB_2109_T0005}
\examples{
nacherbeneinsetzung_dreissigjahresgrenze(
  erbfall_am = "2000-01-31",
  prueftag = "2030-01-30",
  nacherbfall_am = NULL,
  fortgeltungsgrund = "keiner",
  ereignistraeger_bei_erbfall_vorhanden = FALSE,
  ereignistraeger_juristische_person = FALSE,
  einordnungsnachweis = paste0(
    "Synthetisch rechtlich qualifizierte Nacherbeinsetzung und Er",
    "eignislage."
  )
)
}
