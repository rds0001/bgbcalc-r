% Automatisch aus Fachverträgen erzeugt; fachliche Freigabe bleibt separat.
\name{verjaehrung_familienhemmung}
\alias{verjaehrung_familienhemmung}
\title{verjaehrung familienhemmung}
\description{Feste lokale BGB-Fassung; rechtlichen Anwendungsbereich und Bewertungen ausdrücklich bestimmen.}
\usage{verjaehrung_familienhemmung(
  beziehungsart = NULL,
  rechtsbeziehung_besteht = NULL,
  stichtag = NULL,
  geburtsdatum_kind = NULL,
  einordnungsnachweis = NULL
)}
\arguments{
\item{beziehungsart}{Auswahl ehegatten, lebenspartner, kind_eltern, kind_partner_elternteil, vormund_muendel, betreuer_betreuter, pfleger_pflegling oder kind_gegen_beistand. Letztere ausschließlich Anspruch des Kindes gegen den Beistand, nicht umgekehrte Richtung. Bei den anderen Arten Anspruch zwischen beiden bezeichneten Personen; keine beliebigen Angehörigen.}
\item{rechtsbeziehung_besteht}{Expliziter Wahrheitswert, ob die bezeichnete rechtliche Beziehung am Stichtag besteht. Bei Ehe/Lebenspartnerschaft rechtlicher Bestand, nicht bloß Zusammenwohnen. Bei Kind/Elternteilpartner rechtlich einschlägige Verbindung geprüft; Vormundschaft/Betreuung/Pflegschaft/Beistandschaft für maßgeblichen Zeitraum belegen.}
\item{stichtag}{ISO-Datum0001..9999 zur Prüfung des Hemmungstatbestands. Tatsachen müssen gerade zu diesem Tag zutreffen; kein abschließender Verjährungstag und keine automatische Feststellung des Fristbeginns.}
\item{geburtsdatum_kind}{ISO-Geburtsdatum für kind_eltern und kind_partner_elternteil erforderlich, sonst optional. Bei Angabe nicht nach Stichtag. Altersgrenze Vollendung21 wird nur für diese beiden Beziehungstypen angewandt. Geburtstag29.Februar führt in Nichtschaltjahren zur Vollendung am1.März; berechnete Grenze muss im Kalenderbereich liegen.}
\item{einordnungsnachweis}{Nichtleere Beschreibung von Anspruchsrichtung, rechtlicher Beziehung, deren Bestand am Stichtag und gegebenenfalls Geburtsdatum. Eintritt vor Ablauf der betreffenden Verjährung gesondert prüfen.}
}
\details{Rechtsbeziehung am Stichtag muss bestehen. Zusätzlich nur bei Kind/Eltern beziehungsweise Kind/Elternteilpartner: Stichtag vor Vollendung21. Beistandschaft nur Anspruchsrichtung Kind gegen Beistand. Keine Berechnung von Hemmungstagen;§208 bleibt unabhängig. Keine Hemmung allein wegen beliebiger Verwandtschaft oder bloß tatsächlichen Zusammenwohnens. Keine Wiederbelebung einer bereits verjährten Forderung. ISO-Daten0001..9999; explizite Wahrheitswerte; nichtleerer Nachweis. Fehlende Pflichtwerte EINGABE_FEHLT, unzulässige Typen/Bereiche EINGABE_UNGUELTIG.}
\value{wert enthält altersbegrenzung_anwendbar, altersvoraussetzung_erfuellt (ohne Altersgrenze TRUE) und hemmungstatbestand_am_stichtag als Wahrheitswerte. Einheit: wahrheitswerte.}
\references{BGB_PDF_SHA256_9b5a99536e7b00756e9fa5f20082bd9ad3951b37c381fc0f5d52aa5a556839eb; BGB_207_T0001, BGB_207_T0002, BGB_207_T0003, BGB_207_T0004, BGB_207_T0005, BGB_207_T0006, BGB_207_T0007, BGB_207_T0008, BGB_207_T0009, BGB_207_T0010, BGB_207_T0011}
\examples{
verjaehrung_familienhemmung(
  beziehungsart = "ehegatten",
  rechtsbeziehung_besteht = FALSE,
  stichtag = "2025-02-28",
  geburtsdatum_kind = "2004-02-29",
  einordnungsnachweis = paste0(
    "Synthetische rechtlich eingeordnete Personenbeziehung und An",
    "spruchsrichtung."
  )
)
}
