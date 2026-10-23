% Automatisch aus Fachverträgen erzeugt; fachliche Freigabe bleibt separat.
\name{zugewinn_endvermoegen_positionssumme}
\alias{zugewinn_endvermoegen_positionssumme}
\title{zugewinn endvermoegen positionssumme}
\description{Feste lokale BGB-Fassung; rechtlichen Anwendungsbereich und Bewertungen ausdrücklich bestimmen.}
\usage{zugewinn_endvermoegen_positionssumme(
  endaktivvermoegen = NULL,
  endverbindlichkeiten = NULL,
  bezugsstichtag_am = NULL,
  vermoegensminderungen = NULL,
  bewertungsnachweis = NULL
)}
\arguments{
\item{endaktivvermoegen}{Nichtnegative rechtlich bewertete Endaktiva in EUR ohne vorab abgezogene Verbindlichkeiten.}
\item{endverbindlichkeiten}{Nichtnegative zugehörige Endverbindlichkeiten in EUR, auch über Aktiva hinaus abzuziehen.}
\item{bezugsstichtag_am}{Rechtlich maßgeblicher ISO-Bezugsstichtag für§1375III-Zehnjahresgrenze, einschließlich einschlägiger§1384/1387-Zuordnung vorqualifiziert.}
\item{vermoegensminderungen}{Liste1..10000 rechtlich qualifizierter tatsächlicher Minderungen nach Güterstandseintritt, je genau minderung_id(eindeutig), betrag(nichtnegative EUR), eingetreten_am(ISO<=Stichtag), minderungsart(unentgeltliche_zuwendung/verschwendung/benachteiligung), einverstaendnis_anderer(echter Wahrheitswert). Keine Minderungen als Nullposition zum Stichtag vorgeben.}
\item{bewertungsnachweis}{Nichtleerer Nachweis der Tatbestandsqualifikation, tatsächlicher Minderungsbeträge, Werte/Stichtage und gegebenenfalls Kaufkraftanpassung. Keine frei gewählte Einverständniswirkung fürNummer3.}
}
\details{Nettoendvermögen=Aktiva-Schulden. Minderungen mindestens10Kalenderjahre vor Bezugsstichtag ausschließen. Bei Zuwendung/Verschwendung auch bei Einverständnis ausschließen. Übrige qualifizierte Minderungsbeträge zum Nettoendvermögen addieren. §1375IbisIII. Tatsächlichen Vermögensminderungsbetrag nach Eintritt des Güterstands und dessen Wert rechtlich qualifizieren, nicht ungeprüft Ausgaben-/Schenkungsbruttobetrag. Einwilligungs-/Einverständnisausschluss nachAbsatz3 gilt ausdrücklich für unentgeltliche Zuwendung und Verschwendung; eine als Nummer3 qualifizierte Benachteiligung wird nicht allein wegen dieses Eingabeflags ausgeschlossen. Qualifikation nachNummer3 muss einschließlich relevanter Umstände bereits belastbar sein. Mindestens zehn Jahre schließt Gleichheit ein; vorhandener Kalenderkern, keine3650-Tage-Pauschale. Bezugsstichtag für die konkrete§1375III-Berechnung rechtlich bestimmen, einschließlich einschlägiger Stichtagsregeln§1384/1387; keine freie Wahl. Minderungen/Schulden nicht mehrfach erfassen, überschneidende Tatbestände einmal. Endschulden dürfen Endaktiva übersteigen. Keine automatische Beweislastentscheidung, Bewertungs-/Kaufkraftanpassung oder Prüfung einer Benachteiligungsabsicht. Keine Minderungen durch eine Nullposition zum Bezugsstichtag ausdrücken. §1380-Sonderanrechnung und eingreifende Haftungsgrenzen nicht gelöst. Geldbeträge als nichtnegative Dezimalzeichenfolge oder Bruchobjekt mit Zeichenfolgen zaehler/nenner. Exakte Ganzzahl-Zwischenwerte höchstens 2^53-1. Fehlende Pflichteingabe EINGABE_FEHLT, unzulässige Typen oder Bereiche EINGABE_UNGUELTIG.}
\value{wert enthält nettoendvermoegen (auch negativ), hinzurechnungspositionen mit ID/Betrag, hinzurechnungssumme und endvermoegenssumme (auch negativ). Einheit: EUR.}
\references{BGB_PDF_SHA256_9b5a99536e7b00756e9fa5f20082bd9ad3951b37c381fc0f5d52aa5a556839eb; BGB_1375_T0001, BGB_1375_T0002, BGB_1375_T0003, BGB_1375_T0004, BGB_1375_T0005, BGB_1375_T0006, BGB_1375_T0008}
\examples{
zugewinn_endvermoegen_positionssumme(
  endaktivvermoegen = "100",
  endverbindlichkeiten = "20",
  bezugsstichtag_am = "2030-01-01",
  vermoegensminderungen = list(
    list(
    "minderung_id" = "A",
    "betrag" = "30",
    "eingetreten_am" = "2029-01-01",
    "minderungsart" = "unentgeltliche_zuwendung",
    "einverstaendnis_anderer" = FALSE
  ),
    list(
    "minderung_id" = "B",
    "betrag" = "20",
    "eingetreten_am" = "2028-01-01",
    "minderungsart" = "verschwendung",
    "einverstaendnis_anderer" = FALSE
  )
  ),
  bewertungsnachweis = paste0(
    "Tatsächliche Minderungen nach Güterstandseintritt, Tatbestan",
    "d und Bewertungs-/Bezugsstichtag rechtlich qualifiziert."
  )
)
}
