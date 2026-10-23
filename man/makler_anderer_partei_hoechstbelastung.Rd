% Automatisch aus Fachverträgen erzeugt; fachliche Freigabe bleibt separat.
\name{makler_anderer_partei_hoechstbelastung}
\alias{makler_anderer_partei_hoechstbelastung}
\title{makler anderer partei hoechstbelastung}
\description{Feste lokale BGB-Fassung; rechtlichen Anwendungsbereich und Bewertungen ausdrücklich bestimmen.}
\usage{makler_anderer_partei_hoechstbelastung(
  qualifizierter_gesamtmaklerlohn = NULL,
  einordnungsnachweis = NULL
)}
\arguments{
\item{qualifizierter_gesamtmaklerlohn}{Nichtnegativer exakter rechtlich qualifizierter EUR-Betrag als Dezimalzeichenfolge/Bruchobjekt; einheitliche Kostenbasis ohne Doppelzählung. Erlass höchstens bisheriger Maklerlohn je Partei.}
\item{einordnungsnachweis}{Nichtleerer Nachweis des §656b-Verbraucher-/Immobilienfalls und wirksamer qualifizierter Maklerlohn-/Erlassbasis.}
}
\details{Gesamtmaklerlohn durch zwei teilen als maximale auf andere Vertragspartei abwälzbare Belastung Nur §656d bei einem Maklervertrag mit einer Partei eines Wohnungs-/Einfamilienhauskaufs und Verbrauchereigenschaft des Käufers nach §656b. Gesamtmaklerlohn ist die rechtlich wirksame einheitliche Kostenbasis beider Parteien nach qualifizierten Ermäßigungen/Erlassen; keine Zusammenzählung zusätzlicher identischer Forderungen. Ergebnis nur Belastungsobergrenze; überschreitende Vereinbarung wird nicht automatisch auf Hälfte reduziert. Fälligkeit verlangt Zahlung und Nachweis nach Satz2; kein automatischer Fälligkeitseintritt. Geldbeträge als nichtnegative Dezimalzeichenfolge oder Bruchobjekt mit Zeichenfolgen zaehler/nenner. Exakte Ganzzahl-Zwischenwerte höchstens 2^53-1. Fehlende Pflichteingabe EINGABE_FEHLT, unzulässige Typen oder Bereiche EINGABE_UNGUELTIG.}
\value{wert ist die Höchstbelastung der anderen Partei oder verbleibender gleicher Maklerlohn je Partei in EUR als exakter Bruch. Einheit: EUR.}
\references{BGB_PDF_SHA256_9b5a99536e7b00756e9fa5f20082bd9ad3951b37c381fc0f5d52aa5a556839eb; BGB_656d_T0001}
\examples{
makler_anderer_partei_hoechstbelastung(
  qualifizierter_gesamtmaklerlohn = "6000",
  einordnungsnachweis = "Qualifizierter656d-Fall mit Verbraucher-Käufer."
)
}
