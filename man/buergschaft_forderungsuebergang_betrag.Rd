% Automatisch aus Fachverträgen erzeugt; fachliche Freigabe bleibt separat.
\name{buergschaft_forderungsuebergang_betrag}
\alias{buergschaft_forderungsuebergang_betrag}
\title{buergschaft forderungsuebergang betrag}
\description{Feste lokale BGB-Fassung; rechtlichen Anwendungsbereich und Bewertungen ausdrücklich bestimmen.}
\usage{buergschaft_forderungsuebergang_betrag(
  offene_hauptforderung = NULL,
  befriedigung_durch_buergen = NULL,
  einordnungsnachweis = NULL
)}
\arguments{
\item{offene_hauptforderung}{Noch bestehende, von der Bürgschaft erfasste Gläubigerforderung gegen den Hauptschuldner in EUR unmittelbar vor der betrachteten Befriedigung. Bei entsprechender Anwendung1143I: Eigentümer ist nicht persönlicher Schuldner, konkrete gesicherte Forderung und darauf bewirkte Eigentümerbefriedigung qualifizieren; keine zusätzliche Bürgschaft erforderlich.}
\item{befriedigung_durch_buergen}{Durch die konkrete Bürgenleistung auf diese Hauptforderung tatsächlich bewirkter Befriedigungsbetrag in EUR; keine bloße Zahlung ohne Tilgungszuordnung. Bei entsprechender Anwendung1143I: Eigentümer ist nicht persönlicher Schuldner, konkrete gesicherte Forderung und darauf bewirkte Eigentümerbefriedigung qualifizieren; keine zusätzliche Bürgschaft erforderlich.}
\item{einordnungsnachweis}{Nachweis der wirksamen Bürgschaft, zugeordneten Hauptforderung und tatsächlich eingetretenen Befriedigung nach774I. Bei entsprechender Anwendung1143I: Eigentümer ist nicht persönlicher Schuldner, konkrete gesicherte Forderung und darauf bewirkte Eigentümerbefriedigung qualifizieren; keine zusätzliche Bürgschaft erforderlich.}
}
\details{Numerischer Forderungsübergang: Minimum aus noch bestehender erfasster Hauptforderung und darauf bewirkter Befriedigung durch den Bürgen. §774I: ausschließlich Höhe des gesetzlichen Übergangs der konkret erfassten Hauptforderung. Entsprechend§1143I bei Befriedigung durch den Grundstückseigentümer, der nicht persönlicher Schuldner ist; befriedigung_durch_buergen bezeichnet in dieser Normanwendung dessen qualifizierten Befriedigungsbetrag. Der Funktionsname bezeichnet den wiederverwendeten774-Kern, keine zusätzlich vorausgesetzte Bürgschaft. Gesamthypothekenfolgen1143II/1173 und Sicherheitenverteilung werden hier nicht berechnet. Keine Vermehrung der Forderung bei Überzahlung und keine Berechnung eines daraus möglichen Rückforderungsanspruchs. Durchsetzung darf dem verbleibenden Gläubiger nicht schaden; Hauptschuldnereinwendungen bleiben bestehen. Innenausgleich unter Mitbürgen nach774II/426, Sicherheiten, Zinsen und Kosten separat zuordnen; keine doppelte Erfassung bereits übergegangener Forderungen. Nichtnegative Eingangswerte, exakter nichtnegativer EUR-Bruch im sicheren gemeinsamen Zahlenbereich.}
\value{wert ist der exakte EUR-Bruch. Einheit: EUR.}
\references{BGB_PDF_SHA256_9b5a99536e7b00756e9fa5f20082bd9ad3951b37c381fc0f5d52aa5a556839eb; BGB_1143_T0001, BGB_1143_T0002, BGB_774_T0001, BGB_774_T0002, BGB_774_T0003}
\examples{
buergschaft_forderungsuebergang_betrag(
  offene_hauptforderung = "100",
  befriedigung_durch_buergen = "80",
  einordnungsnachweis = paste0(
    "§774I: ausschließlich Höhe des gesetzlichen Übergangs der ko",
    "nkret erfassten Hauptforderung. Keine Vermehrung der Forderu",
    "ng bei Überzahlung und keine Berechnung eines daraus möglich",
    "en Rückforderungsanspruchs. Durchsetzung darf dem verbleiben",
    "den Gläubiger nicht schaden; Hauptschuldnereinwendungen blei",
    "ben bestehen. Innenausgleich unter Mitbürgen nach774II/426, ",
    "Sicherheiten, Zinsen und Kosten separat zuordnen; keine dopp",
    "elte Erfassung bereits übergegangener Forderungen."
  )
)
}
