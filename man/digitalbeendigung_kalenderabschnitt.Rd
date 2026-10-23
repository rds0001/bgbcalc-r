% Automatisch aus Fachverträgen erzeugt; fachliche Freigabe bleibt separat.
\name{digitalbeendigung_kalenderabschnitt}
\alias{digitalbeendigung_kalenderabschnitt}
\title{digitalbeendigung kalenderabschnitt}
\description{Feste lokale BGB-Fassung; gesetzlicher Anwendungsbereich und externe Bewertungen ausdrücklich vorqualifiziert.}
\usage{digitalbeendigung_kalenderabschnitt(
  abschnitt_von = NULL,
  abschnitt_bis = NULL,
  nicht_mehr_geschuldet_ab = NULL,
  mangelzeitraeume = NULL,
  vereinbarter_abschnittspreis = NULL,
  gezahlter_abschnittspreis = NULL,
  einordnungsnachweis = NULL
)}
\arguments{
\item{abschnitt_von}{Erster eingeschlossener Tag des einheitlich bepreisten Abschnitts.}
\item{abschnitt_bis}{Letzter eingeschlossener Tag.}
\item{nicht_mehr_geschuldet_ab}{Erster rechtlich nicht mehr geschuldeter ganzer Kalendertag; darf vor oder nach dem Abschnitt liegen.}
\item{mangelzeitraeume}{Liste0..10000 Objekte mit von und bis, beide Tage eingeschlossen; Überschneidungen werden vereinigt.}
\item{vereinbarter_abschnittspreis}{Nichtnegativer exakter EUR-Preis dieses Abschnitts.}
\item{gezahlter_abschnittspreis}{Nichtnegative Zahlung höchstens Abschnittspreis, proportional über den Abschnitt zugeordnet.}
\item{einordnungsnachweis}{Rechtliche Beendigung, ganztägige Abgrenzung, Mangelhaftigkeit, einheitliche Tagesbewertung und Zahlungszuordnung belegen.}
}
\details{Mangelintervalle begrenzen und vereinigen; disjunkte Mangel-/Zukunftstage zählen und vorhandene zeitanteilige Erstattungsrechnung anwenden. §327oII/III: nur dauerhafte digitale Bereitstellung und rechtlich qualifizierte ganze Kalendertage bei gleicher Bewertung jedes Tages im Abschnitt. Mangelintervalle werden auf bereits geschuldete Tage im Abschnitt begrenzt und vereinigt. Zukünftig entfallende Tage separat zählen; keine Doppelzählung bei Überschneidungen. Vorhandene exakte Preis-/Erstattungsrechnung verwenden. Unterschiedlich bepreiste oder bezahlte Abschnitte einzeln abrechnen. Untertägige Leistungen nicht runden; hierfür vorhandene Rechnung mit rechtlich bestimmten Zeiteinheiten verwenden. Keine automatische Mangel- oder Beendigungsentscheidung und keine pauschale30-Tage-Monatsannahme. Überzahlungen über Abschnittspreis separat; erloschener Preisanteil ist nicht zusätzlich neben Erstattung zu zahlen. Gemeinsame exakte Zahlengrenzen nach NUMERIK.md. Fehlende Pflichteingaben EINGABE_FEHLT, unzulässige Typen/Bereiche EINGABE_UNGUELTIG.}
\value{Gesamt-, Mangel- und Zukunftstage sowie exakter entfallender Zeitanteil, erloschener Preisanteil und Erstattungsbetrag. Einheit: tage_quote_und_eur.}
\references{BGB_PDF_SHA256_9b5a99536e7b00756e9fa5f20082bd9ad3951b37c381fc0f5d52aa5a556839eb; BGB_327o_T0001, BGB_327o_T0002, BGB_327o_T0003, BGB_327o_T0004, BGB_327o_T0005, BGB_327o_T0006, BGB_327o_T0007, BGB_327o_T0008, BGB_327o_T0009, BGB_327o_T0010}
\examples{
digitalbeendigung_kalenderabschnitt(
  abschnitt_von = "2024-02-01",
  abschnitt_bis = "2024-02-29",
  nicht_mehr_geschuldet_ab = "2024-02-21",
  mangelzeitraeume = list(
    list(
    "von" = "2024-02-03",
    "bis" = "2024-02-05"
  ),
    list(
    "von" = "2024-02-05",
    "bis" = "2024-02-07"
  )
  ),
  vereinbarter_abschnittspreis = "290",
  gezahlter_abschnittspreis = "145",
  einordnungsnachweis = paste0(
    "§327oII/III: nur dauerhafte digitale Bereitstellung und rech",
    "tlich qualifizierte ganze Kalendertage bei gleicher Bewertun",
    "g jedes Tages im Abschnitt. Mangelintervalle werden auf bere",
    "its geschuldete Tage im Abschnitt begrenzt und vereinigt. Zu",
    "künftig entfallende Tage separat zählen; keine Doppelzählung",
    " bei Überschneidungen. Vorhandene exakte Preis-/Erstattungsr",
    "echnung verwenden. Unterschiedlich bepreiste oder bezahlte A",
    "bschnitte einzeln abrechnen. Untertägige Leistungen nicht ru",
    "nden; hierfür vorhandene Rechnung mit rechtlich bestimmten Z",
    "eiteinheiten verwenden. Keine automatische Mangel- oder Been",
    "digungsentscheidung und keine pauschale30-Tage-Monatsannahme",
    ". Überzahlungen über Abschnittspreis separat; erloschener Pr",
    "eisanteil ist nicht zusätzlich neben Erstattung zu zahlen."
  )
)
}
