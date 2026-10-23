% Automatisch aus Fachverträgen erzeugt; fachliche Freigabe bleibt separat.
\name{makler_gleichwirkender_erlass_restbetrag}
\alias{makler_gleichwirkender_erlass_restbetrag}
\title{makler gleichwirkender erlass restbetrag}
\description{Feste lokale BGB-Fassung; rechtlichen Anwendungsbereich und Bewertungen ausdrücklich bestimmen.}
\usage{makler_gleichwirkender_erlass_restbetrag(
  bisheriger_gleicher_maklerlohn_je_partei = NULL,
  qualifizierter_erlassbetrag = NULL,
  einordnungsnachweis = NULL
)}
\arguments{
\item{bisheriger_gleicher_maklerlohn_je_partei}{Nichtnegativer exakter rechtlich qualifizierter EUR-Betrag als Dezimalzeichenfolge/Bruchobjekt; einheitliche Kostenbasis ohne Doppelzählung. Erlass höchstens bisheriger Maklerlohn je Partei.}
\item{qualifizierter_erlassbetrag}{Nichtnegativer exakter rechtlich qualifizierter EUR-Betrag als Dezimalzeichenfolge/Bruchobjekt; einheitliche Kostenbasis ohne Doppelzählung. Erlass höchstens bisheriger Maklerlohn je Partei.}
\item{einordnungsnachweis}{Nichtleerer Nachweis des §656b-Verbraucher-/Immobilienfalls und wirksamer qualifizierter Maklerlohn-/Erlassbasis.}
}
\details{Von bisherigem gleichen Maklerlohn je Partei den qualifizierten gleichwirkenden Erlassbetrag abziehen Nur §656c Absatz1 Satz3/4 bei zuvor wirksam gleich hohen Maklerlohnpflichten beider Parteien und Verbraucher-Käufer nach §656b; erlassene Geldsumme wirkt spiegelbildlich auf jeweils gleiche Pflicht. Erlassbetrag höchstens ursprünglicher je-Partei-Betrag. Bei verschiedenen/mehrfachen Erlassen deren rechtliche Wechselwirkung zuerst qualifizieren, nicht mehrfach denselben Erlass abziehen. Keine Heilung anfänglich ungleicher/unwirksamer Verpflichtungen; keine automatische Erstattung bereits gezahlter Provisionen. Entsprechende Anwendung nach §656d Absatz2 nur bei fachlich qualifizierter gleichartiger Berechnungsbasis. Geldbeträge als nichtnegative Dezimalzeichenfolge oder Bruchobjekt mit Zeichenfolgen zaehler/nenner. Exakte Ganzzahl-Zwischenwerte höchstens 2^53-1. Fehlende Pflichteingabe EINGABE_FEHLT, unzulässige Typen oder Bereiche EINGABE_UNGUELTIG.}
\value{wert ist die Höchstbelastung der anderen Partei oder verbleibender gleicher Maklerlohn je Partei in EUR als exakter Bruch. Einheit: EUR.}
\references{BGB_PDF_SHA256_9b5a99536e7b00756e9fa5f20082bd9ad3951b37c381fc0f5d52aa5a556839eb; BGB_656c_T0003}
\examples{
makler_gleichwirkender_erlass_restbetrag(
  bisheriger_gleicher_maklerlohn_je_partei = "3000",
  qualifizierter_erlassbetrag = "500",
  einordnungsnachweis = paste0(
    "Wirksam gleiche Ausgangsprovisionen und qualifizierter gleic",
    "hwirkender Erlass."
  )
)
}
