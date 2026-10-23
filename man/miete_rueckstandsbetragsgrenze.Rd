% Automatisch aus Fachverträgen erzeugt; fachliche Freigabe bleibt separat.
\name{miete_rueckstandsbetragsgrenze}
\alias{miete_rueckstandsbetragsgrenze}
\title{miete rueckstandsbetragsgrenze}
\description{Feste lokale BGB-Fassung; rechtlichen Anwendungsbereich und Bewertungen ausdrücklich bestimmen.}
\usage{miete_rueckstandsbetragsgrenze(
  regelfall = NULL,
  massgebliche_monatsmiete = NULL,
  qualifizierter_rueckstand = NULL,
  einordnungsnachweis = NULL
)}
\arguments{
\item{regelfall}{Genau einer von wohnraum_zwei_aufeinanderfolgende_termine, miete_mehr_als_zwei_termine, wohnraum_sicherheitsleistung.}
\item{massgebliche_monatsmiete}{Positive rechtlich maßgebliche Monatsmiete als exakter EUR-Dezimaltext/Bruch. Bei Sicherheitsleistung ohne ausgewiesene Betriebskosten; bei Mietrückständen eigenständig qualifizierte gesetzliche Bezugsgröße. Keine pauschale Durchschnittsbildung bei Mietänderungen.}
\item{qualifizierter_rueckstand}{Nichtnegativer exakter EUR-Verzugsrückstand des ausgewählten Normfalls, nach rechtlich zutreffender Zuordnung aller Zahlungen und Einwendungen. Keine beliebige Summe verschiedener Nebenforderungen.}
\item{einordnungsnachweis}{Nichtleerer Nachweis von Normfall, Bezugsmonatsmiete, fälligem Verzugsbestand und erforderlichem Terminzusammenhang.}
}
\details{Qualifizierten Verzugsrückstand mit einer beziehungsweise zwei Monatsmieten vergleichen; strikte und einschließlich geltende Grenzen unterscheiden. Nur betragsmäßige Teilgrenze, kein Kündigungsentscheid. Maßgebliche Monatsmiete und Rückstandsbestand zum Prüfzeitpunkt rechtlich bestimmen, insbesondere Mietminderung, Betriebskostenabgrenzung, Zahlungszuordnung und Mietänderungen. Verzug, Frist-/Terminzusammenhang, Anwendungsbereich und Wirksamkeit der Kündigung gesondert; vorherige Befriedigung, Aufrechnung und Schonfristheilung werden nicht aus dem Zahlenvergleich abgeleitet. Für die Kautionsgrenze Betriebskosten ausschließen; diese Nettobasis nicht pauschal auf Mietrückstände übertragen. §543II1Nr3a iVm569III1: Rückstand für genau zwei unmittelbar aufeinanderfolgende Termine bei Wohnraum, der nicht nur zum vorübergehenden Gebrauch vermietet ist; strikt mehr als eine maßgebliche Monatsmiete. Terminzusammenhang und Verzug vorqualifiziert. Für andere Mietarten keine erfundene feste Erheblichkeitsschwelle. §543II1Nr3b: qualifizierter Verzugsrückstand aus einem Zeitraum über mehr als zwei Termine; mindestens zwei Monatsmieten. Der mehr als zwei Termine umfassende Zeitraum ist eine zusätzlich vorqualifizierte Voraussetzung, keine bloße Anzahl unbezahlter Raten. §569IIa: qualifizierter Verzugsrückstand mit der Sicherheitsleistung551; mindestens zwei Monatsmieten OHNE als Pauschale oder Vorauszahlung ausgewiesene Betriebskosten. Nur fällige, geschuldete Sicherheitsleistung erfassen; Ratenrecht551II beachten, keine gesamte noch nicht fällige Kaution. Positive Bezugsmonatsmiete und nichtnegativer Rückstand nach NUMERIK.md; keine Rundung.}
\value{wert: betragsgrenze und vorzeichenbehafteter rueckstand_abzueglich_grenze als EUR-Brüche; vergleichsoperator und betragsvoraussetzung_erfuellt. Gleichheit genügt bei strikter Grenze nicht. Einheit: EUR_und_wahrheitswert.}
\references{BGB_PDF_SHA256_9b5a99536e7b00756e9fa5f20082bd9ad3951b37c381fc0f5d52aa5a556839eb; BGB_543_T0001, BGB_543_T0002, BGB_543_T0003, BGB_543_T0004, BGB_543_T0005, BGB_543_T0006, BGB_543_T0007, BGB_543_T0008, BGB_543_T0009, BGB_543_T0010, BGB_543_T0011, BGB_543_T0012, BGB_543_T0013, BGB_543_T0014, BGB_543_T0015, BGB_543_T0016, BGB_543_T0017, BGB_569_T0001, BGB_569_T0002, BGB_569_T0003, BGB_569_T0004, BGB_569_T0005, BGB_569_T0006, BGB_569_T0007, BGB_569_T0008, BGB_569_T0009, BGB_569_T0010, BGB_569_T0011, BGB_569_T0012, BGB_569_T0013, BGB_569_T0014, BGB_569_T0015, BGB_569_T0016}
\examples{
miete_rueckstandsbetragsgrenze(
  regelfall = "wohnraum_zwei_aufeinanderfolgende_termine",
  massgebliche_monatsmiete = list(
    "zaehler" = "500",
    "nenner" = "1"
  ),
  qualifizierter_rueckstand = list(
    "zaehler" = "49999",
    "nenner" = "100"
  ),
  einordnungsnachweis = paste0(
    "Normfall, Bezugsmonatsmiete und zeitlich zugeordneter Verzug",
    "sbestand qualifiziert."
  )
)
}
