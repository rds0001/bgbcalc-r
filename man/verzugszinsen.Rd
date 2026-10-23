\name{verzugszinsen}
\alias{verzugszinsen}
\title{verzugszinsen}
\description{Grundsatz Basiszins+5 Prozentpunkte; bei Entgeltforderung ohne Verbraucherbeteiligung +9. Verbraucherdarlehen nach § 497 Abs. 1 +5, Immobiliar-Verbraucherdarlehen +2,5. Höherer Zinssatz aus anderem Rechtsgrund nur im allgemeinen Zweig über max auswählen. Zinsbetrag=Kapital*Jahreszinssatz/100*Jahresanteil. Keine Verzugszinsen auf Zinsschulden; kein Zinsanspruch für vollständig gläubigerverzugsbehafteten Zeitanteil.}
\usage{
verzugszinsen(kapital = NULL,
  basiszinssatz_prozent = NULL,
  zeitanteil_zaehler = NULL,
  zeitanteil_nenner = NULL,
  zeitanteil_nachweis = NULL,
  entgeltforderung = NULL,
  verbraucher_beteiligt = NULL,
  zinsschuld = NULL,
  glaeubigerverzug = NULL,
  verzugsart = NULL,
  hoeherer_zinssatz_prozent = NULL,
  basiszinsnachweis = NULL)
}
\arguments{
  \item{kapital}{Nichtnegative Dezimalzeichenfolge des zu verzinsenden Kapitals in EUR. Als Alternative zu den hier beschriebenen Dezimaltexten sind exakte Bruchobjekte mit genau den Zeichenfolgenfeldern zaehler und nenner zulässig, auch für solche Dezimalfelder innerhalb einer Listenstruktur. Kanonische Ganzzahlzeichenfolgen ohne Pluszeichen oder führende Nullen verwenden; Nenner positiv. Fachliche Wertebereiche bleiben unverändert. Der gemeinsame Zahlenvertrag NUMERIK.md gilt.}
  \item{basiszinssatz_prozent}{Für den gesamten Teilzeitraum geltender Basiszinssatz als Dezimalzeichenfolge in Prozent. Als Alternative zu den hier beschriebenen Dezimaltexten sind exakte Bruchobjekte mit genau den Zeichenfolgenfeldern zaehler und nenner zulässig, auch für solche Dezimalfelder innerhalb einer Listenstruktur. Kanonische Ganzzahlzeichenfolgen ohne Pluszeichen oder führende Nullen verwenden; Nenner positiv. Fachliche Wertebereiche bleiben unverändert. Der gemeinsame Zahlenvertrag NUMERIK.md gilt.}
  \item{zeitanteil_zaehler}{Nichtnegative ganze Zahl im ausdrücklich ermittelten Jahresanteil.}
  \item{zeitanteil_nenner}{Positive ganze Zahl als Nenner des Jahresanteils.}
  \item{zeitanteil_nachweis}{Nichtleere Beschreibung von Zeitraum und maßgeblicher Zeitkonvention. Keine automatische 30/360- oder 365-Tage-Annahme.}
  \item{entgeltforderung}{Expliziter Wahrheitswert zur rechtlich eingeordneten Entgeltforderung.}
  \item{verbraucher_beteiligt}{Expliziter Wahrheitswert, ob an dem Rechtsgeschäft ein Verbraucher beteiligt ist.}
  \item{zinsschuld}{Expliziter Wahrheitswert, ob das eingegebene Kapital selbst eine Zinsschuld ist.}
  \item{glaeubigerverzug}{Expliziter Wahrheitswert: liegt der gesamte eingegebene Zeitraum im Gläubigerverzug?}
  \item{verzugsart}{allgemein, verbraucherdarlehen oder immobiliar_verbraucherdarlehen; die rechtliche Zuordnung ist eine Nutzervorgabe.}
  \item{hoeherer_zinssatz_prozent}{Optionaler höherer Jahreszinssatz aus anderem Rechtsgrund in Prozent, nur bei verzugsart allgemein. Sonst NULL. Als Alternative zu den hier beschriebenen Dezimaltexten sind exakte Bruchobjekte mit genau den Zeichenfolgenfeldern zaehler und nenner zulässig, auch für solche Dezimalfelder innerhalb einer Listenstruktur. Kanonische Ganzzahlzeichenfolgen ohne Pluszeichen oder führende Nullen verwenden; Nenner positiv. Fachliche Wertebereiche bleiben unverändert. Der gemeinsame Zahlenvertrag NUMERIK.md gilt.}
  \item{basiszinsnachweis}{Nichtleere Herkunfts- und Gültigkeitsangabe des Basiszinssatzes.}
}
\details{Verzug und Anwendungszeitraum bereits festgestellt. Keine automatische Basiszinsreihe; Teilperioden bei Satz-/Kapitaländerung trennen. Nachgewiesener höherer/niedrigerer Schaden nach § 497 Abs. 1 sowie Schaden wegen Zinsverzugs nach Abs. 2 sind eigene Ansprüche, hier nicht berechnet. § 513-Verweisfälle möglich, deshalb Verbraucherdarlehenszweig nicht allein aus Verbraucherrolle ableiten. § 288 Abs. 6 und Übergangsrecht vorab prüfen. Gemeinsamer Zahlenvertrag NUMERIK.md; fehlend EINGABE_FEHLT, falscher Typ/Bereich EINGABE_UNGUELTIG.}
\value{S3-Objekt \code{bgb_ergebnis}; wert enthält zaehler und nenner als Ganzzahlzeichenfolgen. Einheit: EUR. Nichtanwendbarkeit: status NICHT_ANWENDBAR und wert NULL. Fehlende oder ungültige Eingaben: bgb_berechnungsfehler mit Status EINGABE_FEHLT oder EINGABE_UNGUELTIG.}
\examples{
verzugszinsen(
  kapital = "1000",
  basiszinssatz_prozent = "2",
  zeitanteil_zaehler = 1,
  zeitanteil_nenner = 2,
  zeitanteil_nachweis = "Explizites halbes Zinsjahr ohne Satzwechsel",
  entgeltforderung = TRUE,
  verbraucher_beteiligt = FALSE,
  zinsschuld = FALSE,
  glaeubigerverzug = FALSE,
  verzugsart = "allgemein",
  hoeherer_zinssatz_prozent = NULL,
  basiszinsnachweis = "Synthetisch konstant 2 Prozent, kein amtlicher Satz"
)
}
