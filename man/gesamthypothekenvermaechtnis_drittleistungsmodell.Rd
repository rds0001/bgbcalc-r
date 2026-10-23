% Automatisch aus Fachverträgen erzeugt; fachliche Freigabe bleibt separat.
\name{gesamthypothekenvermaechtnis_drittleistungsmodell}
\alias{gesamthypothekenvermaechtnis_drittleistungsmodell}
\title{gesamthypothekenvermaechtnis drittleistungsmodell}
\description{Feste lokale BGB-Fassung; gesetzlicher Anwendungsbereich und externe Bewertungen ausdrücklich vorqualifiziert.}
\usage{gesamthypothekenvermaechtnis_drittleistungsmodell(
  gesicherter_schuldbetrag = NULL,
  interne_berichtigungspflicht = NULL,
  vom_dritten_erlangbarer_betrag = NULL,
  grundstuecke = NULL,
  vermachtes_grundstueck_id = NULL,
  quotierungsbasis = NULL,
  drittleistungsreihenfolge = NULL,
  methodennachweis = NULL
)}
\arguments{
\item{gesicherter_schuldbetrag}{Gesamte betrachtete gesicherte Schuld, nicht Grundstückswert.}
\item{interne_berichtigungspflicht}{Rechtlich bestimmter Betrag der Schuld, für den der Erblasser intern einzustehen hatte; höchstens gesicherte Schuld. Keine pauschale Gleichteilung bei ungleichen Innenpflichten.}
\item{vom_dritten_erlangbarer_betrag}{Nach2166IIgegenüber Erblasser verpflichteter Dritter: erlangbare Berichtigung des betrachteten internen Schuldteils, höchstens interne Pflicht.}
\item{grundstuecke}{Vollständige mithaftende Nachlassgruppe mit grundstueck_id, grundstueckswert, vorrangige_belastungen; fremde Grundstücke nicht quotenbildend.}
\item{vermachtes_grundstueck_id}{Kennung des vermachten Grundstücks in der Nachlassgruppe.}
\item{quotierungsbasis}{Zwingend rechtlich bestimmen: gesicherte_schuld oder interne_berichtigungspflicht.}
\item{drittleistungsreihenfolge}{Zwingend rechtlich bestimmen: vor_wertquote oder nur_innenrestgrenze.}
\item{methodennachweis}{2166/2167-Zweifelsregel, keine Höchstbetragshypothek, rechtliche Innenpflicht/Basis und Drittleistungsreihenfolge ausdrücklich belegen; keine automatische Entscheidung.}
}
\details{Gewählte Schuld-/Innenpflichtbasis und Drittleistungsreihenfolge mit vorhandener Grundstückswertquote verbinden; Betrag auf Innenrest und Nettodeckung begrenzen. Bedingte2166II/2167-Rechnung: bestehender Grundstücksquotenkern liefert Nettodeckung und Wertquote. Innenrest=interneBerichtigungspflicht-erlangbareDrittberichtigung. Ausdrücklich gewählte Quotierungsbasis ist Gesamtschuld oder internePflicht. Bei vor_wertquote Drittbetrag von dieser Basis vor Quotierung abziehen; bei nur_innenrestgrenze bleibt die Quote ungekürzt und Drittberichtigung wirkt nur durch den Innenrestdeckel. Betrag=min(quotierterBasis,Innenrest,Nettodeckung). Vier arithmetische Kombinationen sind keine vier als rechtlich zulässig bestätigten Alternativen: keine Standardwahl, zwingende fallbezogene rechtliche Begründung. Modellwahl und ihre allgemeine rechtliche Geltung bleiben getrennt von getesteter Arithmetik.2168IIrechtliche Verweisung nur im qualifizierten Nachlassgruppenfall; Fremdgrundstückswerte nicht aufnehmen.2168Iohne2166II-Verweisung ist kein Anwendungsfall.2168aSchiffshypotheken nur bei qualifizierter entsprechender Anwendung. Gemeinsame exakte Zahlengrenzen nach NUMERIK.md. Fehlende Pflichteingaben EINGABE_FEHLT, unzulässige Typen/Bereiche EINGABE_UNGUELTIG.}
\value{Wertquote, Nettodeckung, verbleibende Innenpflicht, Quotierungsbasis, quotierter Betrag und bedingter Befriedigungsbetrag. Einheit: EUR_und_Quote.}
\references{BGB_PDF_SHA256_9b5a99536e7b00756e9fa5f20082bd9ad3951b37c381fc0f5d52aa5a556839eb; BGB_2166_T0001, BGB_2166_T0002, BGB_2166_T0003, BGB_2166_T0004, BGB_2167_T0001, BGB_2167_T0002, BGB_2168_T0001, BGB_2168_T0002, BGB_2168_T0003, BGB_2168a_T0001}
\examples{
gesamthypothekenvermaechtnis_drittleistungsmodell(
  gesicherter_schuldbetrag = "100",
  interne_berichtigungspflicht = "100",
  vom_dritten_erlangbarer_betrag = "40",
  grundstuecke = list(
    list(
    "grundstueck_id" = "A",
    "grundstueckswert" = "100",
    "vorrangige_belastungen" = "0"
  ),
    list(
    "grundstueck_id" = "B",
    "grundstueckswert" = "100",
    "vorrangige_belastungen" = "0"
  )
  ),
  vermachtes_grundstueck_id = "A",
  quotierungsbasis = "gesicherte_schuld",
  drittleistungsreihenfolge = "vor_wertquote",
  methodennachweis = paste0(
    "Bedingte2166II/2167-Rechnung: bestehender Grundstücksquotenk",
    "ern liefert Nettodeckung und Wertquote. Innenrest=interneBer",
    "ichtigungspflicht-erlangbareDrittberichtigung. Ausdrücklich ",
    "gewählte Quotierungsbasis ist Gesamtschuld oder internePflic",
    "ht. Bei vor_wertquote Drittbetrag von dieser Basis vor Quoti",
    "erung abziehen; bei nur_innenrestgrenze bleibt die Quote ung",
    "ekürzt und Drittberichtigung wirkt nur durch den Innenrestde",
    "ckel. Betrag=min(quotierterBasis,Innenrest,Nettodeckung). Vi",
    "er arithmetische Kombinationen sind keine vier als rechtlich",
    " zulässig bestätigten Alternativen: keine Standardwahl, zwin",
    "gende fallbezogene rechtliche Begründung. Modellwahl und ihr",
    "e allgemeine rechtliche Geltung bleiben getrennt von geteste",
    "ter Arithmetik.2168IIrechtliche Verweisung nur im qualifizie",
    "rten Nachlassgruppenfall; Fremdgrundstückswerte nicht aufneh",
    "men.2168Iohne2166II-Verweisung ist kein Anwendungsfall.2168a",
    "Schiffshypotheken nur bei qualifizierter entsprechender Anwe",
    "ndung."
  )
)
}
