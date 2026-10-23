% Automatisch aus Fachverträgen erzeugt; fachliche Freigabe bleibt separat.
\name{fruechte_lasten_betragszuordnung}
\alias{fruechte_lasten_betragszuordnung}
\title{fruechte lasten betragszuordnung}
\description{Feste lokale BGB-Fassung; rechtlichen Anwendungsbereich und Bewertungen ausdrücklich bestimmen.}
\usage{fruechte_lasten_betragszuordnung(
  zuordnungsart = NULL,
  gesamtbetrag = NULL,
  massgebliches_ereignis_im_zeitraum = NULL,
  zeitanteil_zaehler = NULL,
  zeitanteil_nenner = NULL,
  abweichende_bestimmung = NULL,
  zuordnungsnachweis = NULL
)}
\arguments{
\item{zuordnungsart}{Auswahl natuerliche_fruechte (Erzeugnisse/Bestandteile nach§99 Absatz1, auch als Rechtsfrüchte), sonstige_fruechte, regelmaessige_fruechte (einschließlich Gebrauchs-/Fruchtgenussvergütung, Zinsen, Gewinnanteile und sonstiger regelmäßig wiederkehrender Erträge), sonstige_lasten oder regelmaessige_lasten. Rechtliche Einordnung vorab.}
\item{gesamtbetrag}{Nichtnegativer in EUR bewerteter Gesamtbetrag der konkret abgegrenzten Früchte oder Lasten für den Bezugszeitraum. Bei Naturfrüchten monetärer Wert der betroffenen Stücke; keine Eigentumsübertragung durch die Berechnung. Bei wechselnden Ertragssätzen abschnittsweise zutreffende Bezugsbeträge verwenden.}
\item{massgebliches_ereignis_im_zeitraum}{Wahrheitswert: bei natürlichen Früchten Trennung während Berechtigung, bei sonstigen Früchten Fälligkeit während Berechtigung, bei sonstigen Lasten rechtlich zu entrichten während Lastentragungspflicht. Bei regelmäßigen Kategorien typgültig erforderlich, aber ohne Einfluss: deren Anteil folgt der Dauer, nicht dem einzelnen Fälligkeitstag.}
\item{zeitanteil_zaehler}{Nichtnegative ganze Zahl des rechtlich bestimmten Daueranteils, höchstens2^53-1 und höchstens Nenner. Bei regelmäßigen Kategorien Pflicht; sonst optional zusammen mit Nenner. Ein freiwillig angegebenes Paar wird ebenfalls validiert.}
\item{zeitanteil_nenner}{Positive ganze Bezugsdauer im gleichen Maßstab wie Zähler, höchstens2^53-1. Keine automatische365-Tage-Konvention oder Gleichverteilung wechselnder Erträge. Bei nicht regelmäßiger Kategorie können beide Anteilsfelder None/NULL sein.}
\item{abweichende_bestimmung}{Wahrheitswert einer rechtlich maßgeblichen abweichenden Bestimmung. TRUE ergibt NICHT_ANWENDBAR für den gesetzlichen Zuordnungsmaßstab; alternative Aufteilung gesondert.}
\item{zuordnungsnachweis}{Nichtleere Beschreibung der Frucht-/Lastenart, rechtlichen Berechtigungs-/Pflichtdauer, des maßgeblichen Ereignisses und gegebenenfalls konsistenten Daueranteils. Keine ungeprüfte Auswahl allein nach Zahlungstag.}
}
\details{Regelmäßige Früchte/Lasten: Gesamtbetrag×Daueranteil. Natürliche Früchte nach Trennung, andere nicht regelmäßige Früchte nach Fälligkeit, nicht regelmäßige Lasten nach Entrichtungspflicht: Betrag vollständig oder0 je Ereigniszuordnung. Abweichende Bestimmung führt aus Standardmodell. Berechtigungs-/Pflichtzeitraum und rechtlich maßgebliches Ereignis extern eingeordnet; kein automatischer Schluss aus tatsächlichem Zahlungsdatum. Zeitanteil0..1, keine pauschale Kalenderkonvention. Nur Geldwertzuordnung, keine abschließende Übertragung konkreter Sachen. Geldbeträge als nichtnegative Dezimalzeichenfolge oder Bruchobjekt mit Zeichenfolgen zaehler/nenner. Exakte Ganzzahl-Zwischenwerte höchstens 2^53-1. Fehlende Pflichteingabe EINGABE_FEHLT, unzulässige Typen oder Bereiche EINGABE_UNGUELTIG.}
\value{wert ist exakter EUR-Anteil; Ereignis außerhalb Zeitraum ergibt BERECHNET mit0/1, abweichende Bestimmung NICHT_ANWENDBAR mit null. Einheit: EUR.}
\references{BGB_PDF_SHA256_9b5a99536e7b00756e9fa5f20082bd9ad3951b37c381fc0f5d52aa5a556839eb; BGB_99_T0001, BGB_99_T0002, BGB_99_T0003, BGB_101_T0001, BGB_101_T0002, BGB_101_T0003, BGB_103_T0001}
\examples{
fruechte_lasten_betragszuordnung(
  zuordnungsart = "natuerliche_fruechte",
  gesamtbetrag = "1200",
  massgebliches_ereignis_im_zeitraum = FALSE,
  zeitanteil_zaehler = 0,
  zeitanteil_nenner = 3,
  abweichende_bestimmung = FALSE,
  zuordnungsnachweis = paste0(
    "Synthetische rechtlich bestimmte Zuordnung und gleichmäßig b",
    "epreiste Bezugsdauer."
  )
)
}
