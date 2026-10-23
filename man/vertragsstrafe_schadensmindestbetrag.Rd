% Automatisch aus Fachverträgen erzeugt; fachliche Freigabe bleibt separat.
\name{vertragsstrafe_schadensmindestbetrag}
\alias{vertragsstrafe_schadensmindestbetrag}
\title{vertragsstrafe schadensmindestbetrag}
\description{Feste lokale BGB-Fassung; rechtlichen Anwendungsbereich und Bewertungen ausdrücklich bestimmen.}
\usage{vertragsstrafe_schadensmindestbetrag(
  strafbetrag = NULL,
  ersatzfaehiger_schaden = NULL,
  strafart = NULL,
  strafe_verwirkt = NULL,
  erfuellung_angenommen = NULL,
  vorbehalt_bei_annahme = NULL,
  schadensersatzanspruch_besteht = NULL,
  bewertungsnachweis = NULL
)}
\arguments{
\item{strafbetrag}{Nichtnegative wirksame Vertragsstrafe in EUR als Dezimalzeichenfolge oder exakter Bruch. Bereits rechtswirksam herabgesetzten Betrag verwenden, falls einschlägig; keine automatische Angemessenheitsformel nach§343.}
\item{ersatzfaehiger_schaden}{Nichtnegativer rechtlich festgestellter Schaden in EUR aus derselben Nichterfüllung oder nicht gehörigen Erfüllung, auf die sich die Strafe bezieht. Andere Schäden/Ansprüche separat; keinen bereits mit Strafe addierten Betrag eingeben.}
\item{strafart}{Auswahl nichterfuellung (§340) oder nicht_gehoerige_erfuellung (§341, einschließlich Verspätung). Rechtswirksamen Vertragsinhalt vorab einordnen.}
\item{strafe_verwirkt}{Wahrheitswert einer rechtlich verwirkten wirksamen Vertragsstrafe; Auslöser extern rechtlich qualifizieren. Weitere Einwendungen vorab klären.}
\item{erfuellung_angenommen}{Wahrheitswert, ob der Gläubiger die Erfüllung angenommen hat. Bei Strafe für nicht gehörige Erfüllung führt dies zur gesetzlichen Vorbehaltsprüfung.}
\item{vorbehalt_bei_annahme}{Wahrheitswert eines wirksamen Vorbehalts des Rechts auf Strafe gerade bei Annahme der Erfüllung. Späterer Vorbehalt genügt nicht automatisch. Nur bei§341 und erfolgter Annahme maßgeblich.}
\item{schadensersatzanspruch_besteht}{Wahrheitswert eines bestehenden Schadensersatzanspruchs für denselben gesicherten Verstoß. Strafe allein setzt keinen zusätzlichen Schadensersatzanspruch voraus. Ohne Strafe kann ein unabhängig bestehender Schadensersatzanspruch fortbestehen.}
\item{bewertungsnachweis}{Nichtleere Beschreibung von wirksamem Strafbetrag, Schadensgrundlage/-höhe, Verwirkung, Strafart und gegebenenfalls Erfüllungsannahme samt Vorbehalt. Keine weiteren Ausschlüsse/Erfüllungseinwände im modellierten Fall.}
}
\details{Verlangbare Strafe als Mindestbetrag: bei nicht gehöriger Erfüllung und Annahme nur mit Vorbehalt. Gesamt=max(verlangbare Strafe, bestehender ersatzfähiger Schaden). Weiterer Schaden=Gesamt minus Strafmindestbetrag. Nur Geldansprüche aus demselben gesicherten Verstoß. Keine Addition voller Strafe und voller Schadenhöhe. Keine Entscheidung über Erfüllungsausschluss durch Erklärung§340 Absatz1 oder gerichtliche Herabsetzung§343. Schadenanspruch kann trotz verlorenen Strafanspruchs bestehen. Geldbeträge als nichtnegative Dezimalzeichenfolge oder Bruchobjekt mit Zeichenfolgen zaehler/nenner. Exakte Ganzzahl-Zwischenwerte höchstens 2^53-1. Fehlende Pflichteingabe EINGABE_FEHLT, unzulässige Typen oder Bereiche EINGABE_UNGUELTIG.}
\value{wert enthält strafe_nach_diesen_voraussetzungen_verlangbar als Wahrheitswert sowie strafmindestbetrag, weiterer_schadensbetrag, gesamtbetrag als exakte EUR-Brüche. Fehlende Verwirkung/Vorbehalt ergibt Strafmindestbetrag0, aber nicht automatisch Schaden0. Einheit: EUR.}
\references{BGB_PDF_SHA256_9b5a99536e7b00756e9fa5f20082bd9ad3951b37c381fc0f5d52aa5a556839eb; BGB_340_T0001, BGB_340_T0002, BGB_340_T0003, BGB_340_T0004, BGB_341_T0001, BGB_341_T0002, BGB_341_T0003}
\examples{
vertragsstrafe_schadensmindestbetrag(
  strafbetrag = "500",
  ersatzfaehiger_schaden = "0",
  strafart = "nichterfuellung",
  strafe_verwirkt = FALSE,
  erfuellung_angenommen = FALSE,
  vorbehalt_bei_annahme = FALSE,
  schadensersatzanspruch_besteht = FALSE,
  bewertungsnachweis = paste0(
    "Synthetischer wirksamer Strafbetrag und kausaler Schaden des",
    "selben Verstoßes."
  )
)
}
