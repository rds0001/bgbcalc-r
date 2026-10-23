% Automatisch aus Fachverträgen erzeugt; fachliche Freigabe bleibt separat.
\name{mietvorauszahlung_zeitanteilige_rueckerstattung}
\alias{mietvorauszahlung_zeitanteilige_rueckerstattung}
\title{mietvorauszahlung zeitanteilige rueckerstattung}
\description{Feste lokale BGB-Fassung; rechtlichen Anwendungsbereich und Bewertungen ausdrücklich bestimmen.}
\usage{mietvorauszahlung_zeitanteilige_rueckerstattung(
  vorausgezahlte_abschnittsmiete = NULL,
  nach_beendigung_liegender_zeitanteil = NULL,
  einordnungsnachweis = NULL
)}
\arguments{
\item{vorausgezahlte_abschnittsmiete}{Nichtnegativer exakter Dezimalwert/Bruch; Mietbetrag in EUR, Gesamtminderungsquote und Zeitanteile zwischen0und1. Homogen bepreister disjunkter Abrechnungsabschnitt.}
\item{nach_beendigung_liegender_zeitanteil}{Nichtnegativer exakter Dezimalwert/Bruch; Mietbetrag in EUR, Gesamtminderungsquote und Zeitanteile zwischen0und1. Homogen bepreister disjunkter Abrechnungsabschnitt.}
\item{einordnungsnachweis}{Nichtleerer Nachweis des qualifizierten536-/547-Falls und der extern bestimmten Quote/Zeit-/Zahlungszuordnung. Keine gesetzlich ausgeschlossenen Mangelanteile oder unbekannten Bereicherungsfolgen einrechnen.}
}
\details{Vorausgezahlte Miete eines homogen bepreisten Abschnitts mit dem nach Vertragsende liegenden Zeitanteil multiplizieren Nur §547 Absatz1 Satz1 bei qualifiziert vom Vermieter zu vertretender Beendigung und einem gleichmäßig bepreisten Vorauszahlungsabschnitt. Zahlung muss gerade diesen Abschnitt betreffen; Zeitanteil0..1 rechtlich bestimmen. Unterschiedliche Preise/Zahlungszuordnungen abschnittsweise rechnen. Bei nicht zu vertretender Beendigung Bereicherungsrecht nach Satz2 gesondert, kein automatischer identischer Rückbetrag. Gesetzliche Zinsen ab jeweiligem Empfang mit vorhandenem Zinskern separat berechnen; keine automatische pauschale Verzinsung vor Eingang. Geldbeträge als nichtnegative Dezimalzeichenfolge oder Bruchobjekt mit Zeichenfolgen zaehler/nenner. Exakte Ganzzahl-Zwischenwerte höchstens 2^53-1. Fehlende Pflichteingabe EINGABE_FEHLT, unzulässige Typen oder Bereiche EINGABE_UNGUELTIG.}
\value{wert ist der exakte Minderungs- oder Vorauszahlungsrückbetrag in EUR als Bruch. Einheit: EUR.}
\references{BGB_PDF_SHA256_9b5a99536e7b00756e9fa5f20082bd9ad3951b37c381fc0f5d52aa5a556839eb; BGB_547_T0001}
\examples{
mietvorauszahlung_zeitanteilige_rueckerstattung(
  vorausgezahlte_abschnittsmiete = "900",
  nach_beendigung_liegender_zeitanteil = "0.5",
  einordnungsnachweis = paste0(
    "Vom Vermieter zu vertretende Beendigung und eindeutiger homo",
    "gener Vorauszahlungsabschnitt."
  )
)
}
