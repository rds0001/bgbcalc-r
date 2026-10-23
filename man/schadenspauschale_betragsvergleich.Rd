% Automatisch aus Fachverträgen erzeugt; fachliche Freigabe bleibt separat.
\name{schadenspauschale_betragsvergleich}
\alias{schadenspauschale_betragsvergleich}
\title{schadenspauschale betragsvergleich}
\description{Feste lokale BGB-Fassung; gesetzlicher Anwendungsbereich und externe Bewertungen ausdrücklich vorqualifiziert.}
\usage{schadenspauschale_betragsvergleich(
  pauschalbetrag = NULL,
  gewoehnlich_zu_erwartender_betrag = NULL,
  einordnungsnachweis = NULL
)}
\arguments{
\item{pauschalbetrag}{Vereinbarter pauschalierter Schadensersatz oder Wertminderungsersatz in Euro.}
\item{gewoehnlich_zu_erwartender_betrag}{Rechtlich qualifizierter, in den geregelten Fällen gewöhnlich zu erwartender Schaden oder gewöhnlich eintretende Wertminderung in Euro.}
\item{einordnungsnachweis}{Nichtleerer Nachweis des Anwendungsbereichs und der sachlich vergleichbaren Bezugsbeträge nach309Nr5a.}
}
\details{Schadens- oder Wertminderungspauschale mit qualifiziertem gewöhnlichen Erwartungsbetrag vergleichen und positiven Überschreitungsbetrag berechnen. §309Nr5a: strenger Betragsvergleich der Pauschale mit dem qualifizierten gewöhnlich zu erwartenden Schaden oder der Wertminderung. Vergleichsmaßstab ist nicht automatisch der konkret entstandene Einzelschaden. Keine automatische Wirksamkeitsentscheidung, insbesondere keine Prüfung von309Nr5b. Der positive Überschreitungsbetrag ist keine automatische Rückforderung oder geltungserhaltende Herabsetzung auf einen zulässigen Vertragsbetrag. Gemeinsame exakte Zahlengrenzen nach NUMERIK.md. Fehlende Pflichteingaben EINGABE_FEHLT, unzulässige Typen/Bereiche EINGABE_UNGUELTIG.}
\value{wert.pauschale_uebersteigt_vergleichsbetrag als Wahrheitswert; wert.ueberschreitungsbetrag als exakter nichtnegativer Eurobruch. Einheit: EUR_und_wahrheitswert.}
\references{BGB_PDF_SHA256_9b5a99536e7b00756e9fa5f20082bd9ad3951b37c381fc0f5d52aa5a556839eb; BGB_309_T0008, BGB_309_T0009}
\examples{
schadenspauschale_betragsvergleich(
  pauschalbetrag = "120",
  gewoehnlich_zu_erwartender_betrag = "100",
  einordnungsnachweis = paste0(
    "§309Nr5a: strenger Betragsvergleich der Pauschale mit dem qu",
    "alifizierten gewöhnlich zu erwartenden Schaden oder der Wert",
    "minderung. Vergleichsmaßstab ist nicht automatisch der konkr",
    "et entstandene Einzelschaden. Keine automatische Wirksamkeit",
    "sentscheidung, insbesondere keine Prüfung von309Nr5b. Der po",
    "sitive Überschreitungsbetrag ist keine automatische Rückford",
    "erung oder geltungserhaltende Herabsetzung auf einen zulässi",
    "gen Vertragsbetrag."
  )
)
}
