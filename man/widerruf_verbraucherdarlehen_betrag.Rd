% Automatisch aus Fachverträgen erzeugt; fachliche Freigabe bleibt separat.
\name{widerruf_verbraucherdarlehen_betrag}
\alias{widerruf_verbraucherdarlehen_betrag}
\title{widerruf verbraucherdarlehen betrag}
\description{Feste lokale BGB-Fassung; rechtlichen Anwendungsbereich und Bewertungen ausdrücklich bestimmen.}
\usage{widerruf_verbraucherdarlehen_betrag(
  darlehensbetrag = NULL,
  sollzinssatz_prozent = NULL,
  zeitanteil_zaehler = NULL,
  zeitanteil_nenner = NULL,
  zeitanteil_nachweis = NULL,
  immobiliar_verbraucherdarlehen = NULL,
  niedrigerer_gebrauchsvorteil_nachgewiesen = NULL,
  gebrauchsvorteil_betrag = NULL,
  nicht_rueckforderbare_oeffentliche_aufwendungen = NULL,
  widerruf_anwendbar = NULL
)}
\arguments{
\item{darlehensbetrag}{Nichtnegativer tatsächlich ausgezahlter und im betrachteten Zeitraum unverändert genutzter Darlehensbetrag in EUR. Teilrückzahlungen oder weitere Auszahlungen durch getrennte zutreffende Abschnitte abbilden; kein bloßer Kreditrahmen.}
\item{sollzinssatz_prozent}{Nichtnegativer vereinbarter jährlicher Sollzinssatz in Prozent als Dezimalzeichenfolge oder Bruchobjekt, beispielsweise4 für4Prozent. Effektivzins nicht einsetzen. Modell umfasst nichtnegative Sätze; Änderungen abschnittsweise.}
\item{zeitanteil_zaehler}{Nichtnegative ganze Zahl des rechtlich/vertraglich bestimmten Jahresanteils zwischen Auszahlung und Rückzahlung, höchstens2^53-1. Anteil darf bei längerem Zeitraum größer1 sein.}
\item{zeitanteil_nenner}{Positive ganze Bezugsgröße desselben Jahresanteils, höchstens2^53-1. Keine automatisch vorgegebene365-Tage-Konvention.}
\item{zeitanteil_nachweis}{Nichtleere Beschreibung von Auszahlung/Rückzahlung, Kapitalbasis, Vertrags-Sollzins, maßgeblicher Zinskonvention und gegebenenfalls nachgewiesenem Gebrauchsvorteil. Vollständigen Bezug zu genau diesem Abschnitt belegen.}
\item{immobiliar_verbraucherdarlehen}{Wahrheitswert der rechtlichen Darlehensart. Nur beim Immobiliar-Verbraucherdarlehen eröffnet§357b Absatz3 Satz2/3 die hier modellierte niedrigere Gebrauchsvorteilsalternative.}
\item{niedrigerer_gebrauchsvorteil_nachgewiesen}{Wahrheitswert des rechtlich geeigneten Nachweises des Gebrauchsvorteils. Die numerische Niedrigkeit wird zusätzlich anhand des Betrags verglichen. Bei gewöhnlichem Verbraucherdarlehen kein Abzug allein wegen TRUE.}
\item{gebrauchsvorteil_betrag}{Nichtnegativer nachgewiesener Gebrauchsvorteil in EUR für denselben Kapital-/Zeitabschnitt, kein Jahreszinssatz. Pflicht bei Immobiliar-Verbraucherdarlehen mit Nachweis; sonst optional, bei Angabe validiert. Höherer Betrag erhöht den Sollzinsbetrag nicht.}
\item{nicht_rueckforderbare_oeffentliche_aufwendungen}{Nichtnegative tatsächlich vom Darlehensgeber gegenüber öffentlichen Stellen erbrachte und nicht zurückverlangbare Aufwendungen in EUR. Andere Gebühren, interne Kosten und erstattungsfähige Abgaben ausschließen; bei mehreren Zinsabschnitten insgesamt nur einmal erfassen.}
\item{widerruf_anwendbar}{Wahrheitswert eines wirksamen Widerrufs eines Verbraucherdarlehens im sachlich/zeitlich einschlägigen§357b Absatz3. FALSE ergibt NICHT_ANWENDBAR. Finanzierungshilfen und andere Sonderfälle gesondert.}
}
\details{Sollzinsbetrag=Kapital×Sollzinssatz/100×Jahresanteil. Bei Immobiliar-Verbraucherdarlehen und geeignetem Nachweis Minimum aus Sollzinsbetrag und Gebrauchsvorteil desselben Abschnitts. Nur qualifizierte öffentliche Aufwendungen hinzufügen. Nur Verbraucherdarlehen im bezeichneten Anwendungsbereich, nicht sämtliche Finanzierungshilfen. Nichtnegative Sollzinssätze und einheitlicher Kapital-/Zinsabschnitt. Kapitalrückzahlung separat; keine erfundene Zinstagekonvention. Öffentliche Aufwendungen nicht mehrfach bei Abschnittsrechnung erfassen. Geldbeträge als nichtnegative Dezimalzeichenfolge oder Bruchobjekt mit Zeichenfolgen zaehler/nenner. Exakte Ganzzahl-Zwischenwerte höchstens 2^53-1. Fehlende Pflichteingabe EINGABE_FEHLT, unzulässige Typen oder Bereiche EINGABE_UNGUELTIG.}
\value{wert enthält vertraglicher_sollzinsbetrag, geschuldeter_nutzungsbetrag, oeffentliche_aufwendungen und gesamtbetrag als exakte EUR-Brüche; gesamtbetrag ohne Kapitalrückzahlung. Ohne Anwendungsfall null und NICHT_ANWENDBAR. Einheit: EUR.}
\references{BGB_PDF_SHA256_9b5a99536e7b00756e9fa5f20082bd9ad3951b37c381fc0f5d52aa5a556839eb; BGB_357b_T0011, BGB_357b_T0012, BGB_357b_T0013, BGB_357b_T0015}
\examples{
widerruf_verbraucherdarlehen_betrag(
  darlehensbetrag = "10000",
  sollzinssatz_prozent = "6",
  zeitanteil_zaehler = 1,
  zeitanteil_nenner = 2,
  zeitanteil_nachweis = paste0(
    "Synthetischer einheitlicher Kapital-/Zinsabschnitt über ein ",
    "halbes Zinsjahr."
  ),
  immobiliar_verbraucherdarlehen = FALSE,
  niedrigerer_gebrauchsvorteil_nachgewiesen = FALSE,
  gebrauchsvorteil_betrag = "0",
  nicht_rueckforderbare_oeffentliche_aufwendungen = "20",
  widerruf_anwendbar = TRUE
)
}
