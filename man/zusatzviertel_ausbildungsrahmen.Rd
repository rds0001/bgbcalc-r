% Automatisch aus Fachverträgen erzeugt; fachliche Freigabe bleibt separat.
\name{zusatzviertel_ausbildungsrahmen}
\alias{zusatzviertel_ausbildungsrahmen}
\title{zusatzviertel ausbildungsrahmen}
\description{Feste lokale BGB-Fassung; rechtlichen Anwendungsbereich und Bewertungen ausdrücklich bestimmen.}
\usage{zusatzviertel_ausbildungsrahmen(
  viertelbemessungsgrundlage = NULL,
  qualifizierter_ausbildungsgesamtbedarf = NULL,
  bewertungsnachweis = NULL
)}
\arguments{
\item{viertelbemessungsgrundlage}{Nichtnegative rechtlich bewertete Grundlage des tatsächlich nach§1371I zusätzlich gewährten Erbschaftsviertels in EUR. Keine ungeprüfte Bruttonachlasssumme.}
\item{qualifizierter_ausbildungsgesamtbedarf}{Nichtnegativer rechtlich qualifizierter bedürftigkeitsabhängiger angemessener Gesamtausbildungsbedarf des vollständig abgegrenzten berechtigten Abkömmlingskreises in EUR.}
\item{bewertungsnachweis}{Nichtleerer Nachweis von tatsächlich gewährtem Zusatzviertel, Bewertungsbasis und qualifiziertem Gesamtbedarf; keine mehrfache Ausschöpfung für bereits gedeckte Bedarfe.}
}
\details{Zusatzviertel=qualifizierte Bemessungsgrundlage/4; aggregierter Ausbildungsrahmen=min(Zusatzviertel,qualifizierter Gesamtausbildungsbedarf); ungedeckten Bedarf und unbenötigten Viertelrest ausweisen. §1371IV setzt tatsächlich nachAbsatz1 zusätzlich gewährtes Viertel und bedürftige erbberechtigte Abkömmlinge voraus, die nicht aus der aufgelösten Ehe stammen. Bemessungsgrundlage und angemessener bedürftigkeitsabhängiger Gesamtausbildungsbedarf rechtlich qualifiziert, keine pauschalen Bruttonachlass- oder Ausbildungskostenannahmen. Aggregierte Rahmenrechnung für vollständig abgegrenzten Kreis/Bedarfsumfang; keine Einzelverteilung, Rangregel oder Priorität nach zeitlicher Geltendmachung erfunden. Vergangene Leistungen/Verbrauch des Viertels, Wertänderungen, abweichende Nachlassbindungen und Wiederverwendung desselben Viertels für neue Bedarfsrunden gesondert rechtlich abgrenzen; dieser Rahmen darf nicht wiederholt ohne Anrechnung ausgeschöpft werden. Keine autonome Prüfung von Erbberechtigung, Abstammung, Bedürftigkeit oder Angemessenheit. Geldbeträge als nichtnegative Dezimalzeichenfolge oder Bruchobjekt mit Zeichenfolgen zaehler/nenner. Exakte Ganzzahl-Zwischenwerte höchstens 2^53-1. Fehlende Pflichteingabe EINGABE_FEHLT, unzulässige Typen oder Bereiche EINGABE_UNGUELTIG.}
\value{wert enthält zusaetzliches_viertel, ausbildungsrahmen, nicht_aus_viertel_gedeckter_bedarf und nicht_fuer_diesen_gesamtbedarf_benoetigtes_viertel als EUR-Brüche. Einheit: EUR.}
\references{BGB_PDF_SHA256_9b5a99536e7b00756e9fa5f20082bd9ad3951b37c381fc0f5d52aa5a556839eb; BGB_1371_T0001, BGB_1371_T0004}
\examples{
zusatzviertel_ausbildungsrahmen(
  viertelbemessungsgrundlage = "1000",
  qualifizierter_ausbildungsgesamtbedarf = "300",
  bewertungsnachweis = paste0(
    "Tatsächlich gewährtes Zusatzviertel, vollständig qualifizier",
    "ter Ausbildungsbedarf berechtigter Abkömmlinge."
  )
)
}
