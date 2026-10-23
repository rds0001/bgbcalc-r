% Automatisch aus Fachverträgen erzeugt; fachliche Freigabe bleibt separat.
\name{miete_gegenforderung_zeitvergleich}
\alias{miete_gegenforderung_zeitvergleich}
\title{miete gegenforderung zeitvergleich}
\description{Feste lokale BGB-Fassung; rechtlichen Anwendungsbereich und Bewertungen ausdrücklich bestimmen.}
\usage{miete_gegenforderung_zeitvergleich(
  kenntnis_eigentumsuebergang_utc = NULL,
  gegenforderung_erworben_utc = NULL,
  gegenforderung_faellig_utc = NULL,
  miete_faellig_utc = NULL,
  einordnungsnachweis = NULL
)}
\arguments{
\item{kenntnis_eigentumsuebergang_utc}{Nachweislich normalisierter Zeitpunkt der Kenntnis des Mieters vom Eigentumsübergang alsYYYY-MM-DDTHH:MM:SSZ.}
\item{gegenforderung_erworben_utc}{Rechtlicher Erwerbszeitpunkt der Gegenforderung in derselben UTC-Darstellung; nicht bloß Rechnungsdatum.}
\item{gegenforderung_faellig_utc}{Rechtlich bestimmter Fälligkeitszeitpunkt der Gegenforderung in derselben UTC-Darstellung.}
\item{miete_faellig_utc}{Rechtlich bestimmter Fälligkeitszeitpunkt der konkret zur Aufrechnung betrachteten Mietforderung in derselben UTC-Darstellung.}
\item{einordnungsnachweis}{Nichtleerer Nachweis der Zuordnung der Forderungen und exakt normalisierten Ereignis-/Fälligkeitszeitpunkte; bloßes Kalenderdatum darf nicht bei ungeklärter Reihenfolge künstlich zu Mitternacht ergänzt werden.}
}
\details{Erwerb nach Kenntnis oder Gegenforderungsfälligkeit sowohl nach Kenntnis als auch nach Mietfälligkeit durch strikte Zeitvergleiche bestimmen. §566dSatz2: ausschließlich numerische Chronologie der zeitlichen Ausschlusstatbestände. Gleichzeitigkeit erfüllt das jeweilige nach/später nicht. Erwerb der Gegenforderung nach Kenntnis genügt unabhängig vom Fälligkeitsvergleich; bei früherem/gleichzeitigem Erwerb ist die zweite Alternative nur bei Fälligkeit nach BEIDEN Bezugspunkten erfüllt. Keine automatische Aufrechnungsberechtigung:566dSatz1,566c, übrige Aufrechnungsvoraussetzungen und Beträge gesondert. Sekundengenaue tatsächliche UTC-Zeitpunkte erforderlich; keine Zeitzonenannahme, keine künstliche Mitternacht bei lediglich bekannten Tagen, keine Subsekunden abschneiden. Standard-Datumsbibliotheken über vorhandenen UTC-Parser wiederverwendet. Strikte UTC-Zeitpunkte auf vollen Sekunden im Kalenderbereich0001..9999; keine Subsekunden/Schaltsekunden.}
\value{wert: erwerb_nach_kenntnis, faelligkeit_nach_kenntnis_und_miete und deren ODER als zeitlicher_ausschluss; Wahrheitswerte ausschließlich aus Zeitvergleichen. Einheit: wahrheitswerte.}
\references{BGB_PDF_SHA256_9b5a99536e7b00756e9fa5f20082bd9ad3951b37c381fc0f5d52aa5a556839eb; BGB_566d_T0001, BGB_566d_T0002}
\examples{
miete_gegenforderung_zeitvergleich(
  kenntnis_eigentumsuebergang_utc = "2024-01-01T12:00:00Z",
  gegenforderung_erworben_utc = "2024-01-01T11:00:00Z",
  gegenforderung_faellig_utc = "2024-01-01T11:00:00Z",
  miete_faellig_utc = "2024-01-01T11:00:00Z",
  einordnungsnachweis = paste0(
    "§566dSatz2: ausschließlich numerische Chronologie der zeitli",
    "chen Ausschlusstatbestände. Gleichzeitigkeit erfüllt das jew",
    "eilige nach/später nicht. Erwerb der Gegenforderung nach Ken",
    "ntnis genügt unabhängig vom Fälligkeitsvergleich; bei früher",
    "em/gleichzeitigem Erwerb ist die zweite Alternative nur bei ",
    "Fälligkeit nach BEIDEN Bezugspunkten erfüllt. Keine automati",
    "sche Aufrechnungsberechtigung:566dSatz1,566c, übrige Aufrech",
    "nungsvoraussetzungen und Beträge gesondert. Sekundengenaue t",
    "atsächliche UTC-Zeitpunkte erforderlich; keine Zeitzonenanna",
    "hme, keine künstliche Mitternacht bei lediglich bekannten Ta",
    "gen, keine Subsekunden abschneiden. Standard-Datumsbibliothe",
    "ken über vorhandenen UTC-Parser wiederverwendet."
  )
)
}
