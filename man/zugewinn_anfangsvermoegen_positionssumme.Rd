% Automatisch aus Fachverträgen erzeugt; fachliche Freigabe bleibt separat.
\name{zugewinn_anfangsvermoegen_positionssumme}
\alias{zugewinn_anfangsvermoegen_positionssumme}
\title{zugewinn anfangsvermoegen positionssumme}
\description{Feste lokale BGB-Fassung; rechtlichen Anwendungsbereich und Bewertungen ausdrücklich bestimmen.}
\usage{zugewinn_anfangsvermoegen_positionssumme(
  anfangsaktivvermoegen = NULL,
  anfangsverbindlichkeiten = NULL,
  privilegierte_erwerbe = NULL,
  bewertungsnachweis = NULL
)}
\arguments{
\item{anfangsaktivvermoegen}{Nichtnegativer rechtlich bewerteter Aktivwert des Anfangsvermögens in EUR, keine Verbindlichkeiten vorab abgezogen.}
\item{anfangsverbindlichkeiten}{Nichtnegative zugehörige Anfangsverbindlichkeiten in EUR, auch über Aktivhöhe abzuziehen.}
\item{privilegierte_erwerbe}{Liste1..10000 qualifizierter Erwerbe nach§1374II, je genau erwerbswert und zugehoerige_verbindlichkeiten als nichtnegative EUR. Keine Einkünfte, keine Doppelzuordnung. Keine Erwerbe durch eine Nullposition0/0 ausdrücken.}
\item{bewertungsnachweis}{Nichtleerer Nachweis der Privilegierung, maßgeblicher Werte/Verbindlichkeiten und konsistenter gegebenenfalls erforderlicher Kaufkraftanpassung; keine automatische Indexierung.}
}
\details{Anfangsnetto=Aktiva-Schulden; jeder Nettoerwerb=Erwerbswert-zugehörige Schulden; Anfangsvermögenssumme=Anfangsnetto+Summe Nettoerwerbe. Keine Nullkappung. §1374III verlangt ausdrücklich Schuldenabzug auch über die Vermögenshöhe hinaus; ursprünglicher Nettowert, einzelne Nettoerwerbe und Gesamtsumme können negativ sein. Nur rechtlich privilegierte Erwerbe nachAbsatz2 eingeben: von Todes wegen/vorweggenommenes Erbrecht/Schenkung/Ausstattung, nach Güterstandseintritt und nicht den Umständen nach Einkünfte. Anfangsschulden und Erwerbsverbindlichkeiten nicht doppelt zuordnen. Werte und zugehörige Verbindlichkeiten nach rechtlich maßgeblichen Bewertungszeitpunkten und konsistenter gegebenenfalls bereits erforderlicher Kaufkraftanpassung vorqualifizieren; keine automatische Indexierung oder Bewertung nach§1376. Keine Erwerbe durch eine Nullposition mit Erwerbswert0 und Verbindlichkeiten0 ausdrücken. Keine automatische Privilegierungs-/Einkünfteentscheidung, keine§1380-Anrechnung und kein abschließender Zugewinnausgleich. Geldbeträge als nichtnegative Dezimalzeichenfolge oder Bruchobjekt mit Zeichenfolgen zaehler/nenner. Exakte Ganzzahl-Zwischenwerte höchstens 2^53-1. Fehlende Pflichteingabe EINGABE_FEHLT, unzulässige Typen oder Bereiche EINGABE_UNGUELTIG.}
\value{wert enthält urspruengliches_nettoanfangsvermoegen, nettoerwerbe in Eingabereihenfolge, hinzuzurechnende_nettoerwerbssumme und anfangsvermoegenssumme als auch negative EUR-Brüche. Einheit: EUR.}
\references{BGB_PDF_SHA256_9b5a99536e7b00756e9fa5f20082bd9ad3951b37c381fc0f5d52aa5a556839eb; BGB_1374_T0001, BGB_1374_T0002, BGB_1374_T0003}
\examples{
zugewinn_anfangsvermoegen_positionssumme(
  anfangsaktivvermoegen = "100",
  anfangsverbindlichkeiten = "20",
  privilegierte_erwerbe = list(
    list(
    "erwerbswert" = "50",
    "zugehoerige_verbindlichkeiten" = "10"
  ),
    list(
    "erwerbswert" = "30",
    "zugehoerige_verbindlichkeiten" = "5"
  )
  ),
  bewertungsnachweis = paste0(
    "Qualifizierte privilegierte Erwerbe, Werte/Schulden ohne Dop",
    "pelzählung und auf rechtlich konsistenter Bewertungsbasis."
  )
)
}
