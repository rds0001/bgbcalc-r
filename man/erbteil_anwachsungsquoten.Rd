% Automatisch aus Fachverträgen erzeugt; fachliche Freigabe bleibt separat.
\name{erbteil_anwachsungsquoten}
\alias{erbteil_anwachsungsquoten}
\title{erbteil anwachsungsquoten}
\description{Feste lokale BGB-Fassung; rechtlichen Anwendungsbereich und Bewertungen ausdrücklich bestimmen.}
\usage{erbteil_anwachsungsquoten(
  eingesetzte_erben = NULL,
  weggefallener_erbe_id = NULL,
  gesetzliche_erbfolge_ausgeschlossen = NULL,
  anwachsung_testamentarisch_ausgeschlossen = NULL,
  vorrangiges_ersatzerbrecht = NULL,
  einordnungsnachweis = NULL
)}
\arguments{
\item{eingesetzte_erben}{Liste aus 2..1000 Objekten mit genau erbe_id (eindeutiger nichtleerer Text), erbquote (positive exakte Dezimalzeichenfolge/Bruchquote der ganzen Erbschaft) und gemeinschaft_id (nichtleerer Gruppenname oder NULL). Vollständige Originaleinsetzung einschließlich genau eines weggefallenen Erben. Identische Gruppenkennung bedeutet gemeinschaftlicher Erbteil nach§2093, keine familiäre Gruppe. Nicht verschachtelt. Quotensumme genau eins bei Ausschluss gesetzlicher Erbfolge, sonst strikt kleiner eins.}
\item{weggefallener_erbe_id}{Nichtleere Kennung des einzigen rechtlich weggefallenen Erben in der Originalliste. Keine Mehrfachwegfälle oder bereits angewachsenen Sonderteile.}
\item{gesetzliche_erbfolge_ausgeschlossen}{Expliziter Wahrheitswert: ursprüngliche Einsetzung schließt gesetzliche Erbfolge vollständig aus. FALSE bedeutet echter verbleibender gesetzlicher Erbteil; dann Anwachsung nur innerhalb gemeinschaftlichen Erbteils.}
\item{anwachsung_testamentarisch_ausgeschlossen}{Expliziter Wahrheitswert eines testamentarischen Ausschlusses nach§2094 Absatz3 für die gesamte untersuchte Anwachsung. Individuelle Teil-Ausschlüsse außerhalb des Modells.}
\item{vorrangiges_ersatzerbrecht}{Expliziter Wahrheitswert eines wirksamen vorrangigen Ersatzerbrechts nach§2099. TRUE verhindert diese Anwachsung, weist aber keinen Ersatzanteil zu.}
\item{einordnungsnachweis}{Nichtleerer Nachweis zu wirksamer Einsetzung, Originalquoten, rechtlichem Wegfall, gemeinschaftlichen Erbteilen und Ausschluss-/Ersatzerbenlage.}
}
\details{Empfänger zuerst verbliebene Mitglieder des gemeinschaftlichen Erbteils des Weggefallenen; sonst bei vollständigem Ausschluss gesetzlicher Erbfolge alle verbliebenen eingesetzten Erben. Testamentarischer Ausschluss oder vorrangiges Ersatzerbrecht sperren. Wegfallquote proportional zu Originalquoten der Empfänger verteilen. Ein Wegfall, einfache Gruppen, vollständige Originalquoten. Keine wiederholten Wegfälle, verschachtelten Gruppen, Teil-Ausschlüsse oder automatische gesetzliche/Ersatznachfolge. §2095 gesonderte Behandlung für Vermächtnisse, Auflagen und Ausgleichung bleibt erhalten. Geldbeträge als nichtnegative Dezimalzeichenfolge oder Bruchobjekt mit Zeichenfolgen zaehler/nenner. Exakte Ganzzahl-Zwischenwerte höchstens 2^53-1. Fehlende Pflichteingabe EINGABE_FEHLT, unzulässige Typen oder Bereiche EINGABE_UNGUELTIG.}
\value{wert enthält anwachsung_erfolgt, erbteile je verbleibendem Erben mit urspruenglicher_erbteil/angewachsener_erbteil/gesamter_erbteil und nicht_angewachsener_wegfallender_erbteil. Keine Anwachsung ergibt exakte Nullanteile, keine NICHT_ANWENDBAR-Meldung. Einheit: erbquoten.}
\references{BGB_PDF_SHA256_9b5a99536e7b00756e9fa5f20082bd9ad3951b37c381fc0f5d52aa5a556839eb; BGB_2094_T0001, BGB_2094_T0002, BGB_2094_T0003, BGB_2094_T0004, BGB_2095_T0001, BGB_2099_T0001}
\examples{
erbteil_anwachsungsquoten(
  eingesetzte_erben = list(
    list(
    "erbe_id" = "A",
    "erbquote" = list(
    "zaehler" = "1",
    "nenner" = "2"
  ),
    "gemeinschaft_id" = NULL
  ),
    list(
    "erbe_id" = "B",
    "erbquote" = list(
    "zaehler" = "1",
    "nenner" = "3"
  ),
    "gemeinschaft_id" = NULL
  ),
    list(
    "erbe_id" = "C",
    "erbquote" = list(
    "zaehler" = "1",
    "nenner" = "6"
  ),
    "gemeinschaft_id" = NULL
  )
  ),
  weggefallener_erbe_id = "A",
  gesetzliche_erbfolge_ausgeschlossen = TRUE,
  anwachsung_testamentarisch_ausgeschlossen = FALSE,
  vorrangiges_ersatzerbrecht = FALSE,
  einordnungsnachweis = paste0(
    "Synthetisch qualifizierte Originaleinsetzung und einzelner W",
    "egfall."
  )
)
}
