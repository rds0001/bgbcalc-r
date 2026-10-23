% Automatisch aus Fachverträgen erzeugt; fachliche Freigabe bleibt separat.
\name{erbteile_gleichzeitige_anwachsung}
\alias{erbteile_gleichzeitige_anwachsung}
\title{erbteile gleichzeitige anwachsung}
\description{Feste lokale BGB-Fassung; rechtlichen Anwendungsbereich und Bewertungen ausdrücklich bestimmen.}
\usage{erbteile_gleichzeitige_anwachsung(
  eingesetzte_erben = NULL,
  weggefallene_erben_ids = NULL,
  gesetzliche_erbfolge_ausgeschlossen = NULL,
  anwachsung_testamentarisch_ausgeschlossen = NULL,
  vorrangiges_ersatzerbrecht = NULL,
  gemeinsamer_wegfall_qualifiziert = NULL,
  einordnungsnachweis = NULL
)}
\arguments{
\item{eingesetzte_erben}{Vollständige Liste2..1000 Originalerben mit erbe_id,positiver erbquote,gemeinschaft_id(NULL oder einfache gemeinsameGruppe). Quoten bei vollständigem gesetzlichenAusschluss zusammen1,sonst striktunter1.}
\item{weggefallene_erben_ids}{Liste1..1000 eindeutiger IDs aus Originalerben; gemeinsamer rechtlich qualifizierter Wegfallzeitpunkt.}
\item{gesetzliche_erbfolge_ausgeschlossen}{Pflichtwahrheitswert der vollständigen testamentarischen Verdrängung gesetzlicherErbfolge.}
\item{anwachsung_testamentarisch_ausgeschlossen}{Pflichtwahrheitswert eines einheitlichen Ausschlusses aller untersuchtenAnwachsungen.}
\item{vorrangiges_ersatzerbrecht}{Pflichtwahrheitswert eines einheitlichen Ersatzerbvorrangs für sämtliche Wegfälle.}
\item{gemeinsamer_wegfall_qualifiziert}{Pflichtwahrheitswert gemeinsamer Wegfälle vor jedem Anwachsungsschritt; FALSE NICHT_ANWENDBAR.}
\item{einordnungsnachweis}{Nichtleerer Nachweis gemeinsamer Wegfallkonstellation/Originalquoten/einfacherGruppen; keine gestaffelteKaskade.}
}
\details{Alle weggefallenenIDs zuerst aus Empfängerkreis entfernen; jeden Originalteil gruppenvorrangig beziehungsweise bei vollständigemgesetzlichenAusschluss allgemein nach verbleibendenOriginalquoten verteilen. Sonderteile je Ursprung bewahren. Keine zeitlich gestaffelte Anwachsung,verschachtelteGruppen,individuellenTeilsperren oder2098Ersatzerbeneinsetzungen. NichtangewachseneQuoten keinemErben automatischzuordnen. Geldbeträge als nichtnegative Dezimalzeichenfolge oder Bruchobjekt mit Zeichenfolgen zaehler/nenner. Exakte Ganzzahl-Zwischenwerte höchstens 2^53-1. Fehlende Pflichteingabe EINGABE_FEHLT, unzulässige Typen oder Bereiche EINGABE_UNGUELTIG.}
\value{Sonderteile nach Ursprung mit Einzelverteilungen,je verbleibendemErben Original/Zusatz/Gesamtquote sowie nichtangewachseneWegfallquote. Einheit: erbquoten.}
\references{BGB_PDF_SHA256_9b5a99536e7b00756e9fa5f20082bd9ad3951b37c381fc0f5d52aa5a556839eb; BGB_2094_T0001, BGB_2094_T0002, BGB_2094_T0003, BGB_2094_T0004, BGB_2095_T0001, BGB_2099_T0001}
\examples{
erbteile_gleichzeitige_anwachsung(
  eingesetzte_erben = list(
    list(
    "erbe_id" = "A",
    "erbquote" = "0.25",
    "gemeinschaft_id" = "G"
  ),
    list(
    "erbe_id" = "B",
    "erbquote" = "0.25",
    "gemeinschaft_id" = "G"
  ),
    list(
    "erbe_id" = "C",
    "erbquote" = "0.25",
    "gemeinschaft_id" = NULL
  ),
    list(
    "erbe_id" = "D",
    "erbquote" = "0.25",
    "gemeinschaft_id" = NULL
  )
  ),
  weggefallene_erben_ids = list(
    "A",
    "C"
  ),
  gesetzliche_erbfolge_ausgeschlossen = TRUE,
  anwachsung_testamentarisch_ausgeschlossen = FALSE,
  vorrangiges_ersatzerbrecht = FALSE,
  gemeinsamer_wegfall_qualifiziert = TRUE,
  einordnungsnachweis = paste0(
    "Synthetische gleichzeitig qualifizierte WegfälleA,C; A/Bgeme",
    "inschaftlich, C/DohneGruppe."
  )
)
}
