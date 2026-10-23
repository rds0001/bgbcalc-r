% Automatisch aus Fachverträgen erzeugt; fachliche Freigabe bleibt separat.
\name{verwandtschaftsgrad_geburtsschritte}
\alias{verwandtschaftsgrad_geburtsschritte}
\title{verwandtschaftsgrad geburtsschritte}
\description{Feste lokale BGB-Fassung; rechtlichen Anwendungsbereich und Bewertungen ausdrücklich bestimmen.}
\usage{verwandtschaftsgrad_geburtsschritte(
  geburtsschritte_person = NULL,
  geburtsschritte_andere = NULL,
  abstammungsnachweis = NULL
)}
\arguments{
\item{geburtsschritte_person}{Ganzzahl0..1000 der rechtlich qualifizierten Geburtsschritte der ersten Person zum nächsten gemeinsamen Stamm; bei direktem Vorfahren dessen Weg0.}
\item{geburtsschritte_andere}{Entsprechende Ganzzahl0..1000 der anderen Person. Beide Werte dürfen nicht zugleich0 sein.}
\item{abstammungsnachweis}{Nichtleerer Nachweis der rechtlichen Abstammungswege und Auswahl des nächsten gemeinsamen Stamms; bei Schwägerschaft vermittelnde Verwandtschaft verwenden.}
}
\details{Grad=Geburtsschritte erste Person+Geburtsschritte zweite Person. §1589I3 zählt die vermittelnden Geburten. Gerade Linie: eine Person ist Vorfahr der anderen, deren eigener Weg zum gemeinsamen Stamm daher0. Seitenlinie: Wege beider Personen zum nächsten gemeinsamen Vorfahren, etwa Geschwister1+1=2 oder Cousins2+2=4. Keine automatische Stammbauermittlung oder rechtliche Abstammungs-/Adoptionsprüfung. Entfernteren gemeinsamen Vorfahren nicht wählen, wenn ein näherer existiert. Nach§1590I2 wird derselbe qualifizierte Grad für die vermittelnde Verwandtschaft übernommen; Ehe selbst fügt keinen Geburtsschritt hinzu. Die Funktion stellt keine Verwandtschaft oder Schwägerschaft fest. Geburtsschritte als echte Ganzzahlen0..1000, keine booleschen Werte, beide nicht zugleich0. Ergebnis1..2000. Fehlend EINGABE_FEHLT, unzulässige Typen/Bereiche EINGABE_UNGUELTIG.}
\value{wert ist positive Ganzzahl1..2000 als Verwandtschaftsgrad. Einheit: grad.}
\references{BGB_PDF_SHA256_9b5a99536e7b00756e9fa5f20082bd9ad3951b37c381fc0f5d52aa5a556839eb; BGB_1589_T0003, BGB_1590_T0002}
\examples{
verwandtschaftsgrad_geburtsschritte(
  geburtsschritte_person = 0,
  geburtsschritte_andere = 1,
  abstammungsnachweis = paste0(
    "Qualifizierte Abstammungswege zum nächsten gemeinsamen Stamm",
    "."
  )
)
}
