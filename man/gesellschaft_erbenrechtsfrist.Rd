% Automatisch aus Fachverträgen erzeugt; fachliche Freigabe bleibt separat.
\name{gesellschaft_erbenrechtsfrist}
\alias{gesellschaft_erbenrechtsfrist}
\title{gesellschaft erbenrechtsfrist}
\description{Feste lokale BGB-Fassung; gesetzlicher Anwendungsbereich und externe Bewertungen ausdrücklich vorqualifiziert.}
\usage{gesellschaft_erbenrechtsfrist(
  erbschaftskenntnis_am = NULL,
  ablaufhemmung_mindestende_am = NULL,
  ausschlagungsrecht_bei_dreimonatsablauf_noch_offen = NULL,
  ausschlagungsfristende_am = NULL,
  einordnungsnachweis = NULL
)}
\arguments{
\item{erbschaftskenntnis_am}{Kenntnis des Erbschaftsanfalls YYYY-MM-DD; nicht automatisch Todestag.}
\item{ablaufhemmung_mindestende_am}{Rechtlich vollständig bestimmtes210-Mindestende YYYY-MM-DD; null ausschließlich wenn keine wirksame210-Verlängerung besteht. Ungeklärten Schutz nicht als null behandeln.}
\item{ausschlagungsrecht_bei_dreimonatsablauf_noch_offen}{Expliziter Wahrheitswert für das bei Ablauf der gesetzlichen Dreimonatsgrundfrist noch bestehende Ausschlagungsrecht.}
\item{ausschlagungsfristende_am}{Nur bei noch offenem Ausschlagungsrecht dessen vollständig bestimmtes Ende YYYY-MM-DD; sonst null.}
\item{einordnungsnachweis}{Nichtleerer Nachweis des724III-Falls, Kenntnis,210-Behandlung und Ausschlagungsrechts einschließlich Hemmung und Verlustgründen.}
}
\details{Dreimonatsgrundfrist mit wirksamer210-Ablaufhemmung und noch offener Ausschlagungsfrist als spätestes Ende verknüpfen. §724III: Drei Monate ab Kenntnis des Erbschaftsanfalls, entsprechend210 bestimmtes Mindestende und gegebenenfalls späteres Ausschlagungsfristende als Maximum. Ob das Ausschlagungsrecht bei Ablauf der Dreimonatsgrundfrist noch besteht, separat rechtlich vorqualifizieren, nicht allein aus einem theoretischen Datum folgern.210-Mindestende mit vorhandener Ablaufhemmungsfunktion berechnen: die maßgebliche Frist beträgt drei Monate, daher210-Nachlauf grundsätzlich entsprechend kürzer als sechs Monate. Offene/ungeklärte Schutzereignisse nicht durch fiktives Enddatum oder null ersetzen. Keine automatische Annahme/Ausschlagung, Kommanditistenstellung, Kündigungswirksamkeit oder Haftungsbeschränkung nachAbsatz4. Keine pauschale Feiertagsverschiebung; gegebenenfalls weitere rechtliche Kalenderkorrektur separat. Gemeinsame exakte Zahlengrenzen nach NUMERIK.md. Fehlende Pflichteingaben EINGABE_FEHLT, unzulässige Typen/Bereiche EINGABE_UNGUELTIG.}
\value{wert.dreimonatsgrundfristende und wert.rechnerisches_ausuebungsfristende alsYYYY-MM-DD. Einheit: daten.}
\references{BGB_PDF_SHA256_9b5a99536e7b00756e9fa5f20082bd9ad3951b37c381fc0f5d52aa5a556839eb; BGB_724_T0003, BGB_724_T0004, BGB_724_T0005, BGB_210_T0001, BGB_210_T0002, BGB_210_T0003}
\examples{
gesellschaft_erbenrechtsfrist(
  erbschaftskenntnis_am = "2024-01-31",
  ablaufhemmung_mindestende_am = NULL,
  ausschlagungsrecht_bei_dreimonatsablauf_noch_offen = FALSE,
  ausschlagungsfristende_am = NULL,
  einordnungsnachweis = paste0(
    "§724III: Drei Monate ab Kenntnis des Erbschaftsanfalls, ents",
    "prechend210 bestimmtes Mindestende und gegebenenfalls später",
    "es Ausschlagungsfristende als Maximum. Ob das Ausschlagungsr",
    "echt bei Ablauf der Dreimonatsgrundfrist noch besteht, separ",
    "at rechtlich vorqualifizieren, nicht allein aus einem theore",
    "tischen Datum folgern.210-Mindestende mit vorhandener Ablauf",
    "hemmungsfunktion berechnen: die maßgebliche Frist beträgt dr",
    "ei Monate, daher210-Nachlauf grundsätzlich entsprechend kürz",
    "er als sechs Monate. Offene/ungeklärte Schutzereignisse nich",
    "t durch fiktives Enddatum oder null ersetzen. Keine automati",
    "sche Annahme/Ausschlagung, Kommanditistenstellung, Kündigung",
    "swirksamkeit oder Haftungsbeschränkung nachAbsatz4. Keine pa",
    "uschale Feiertagsverschiebung; gegebenenfalls weitere rechtl",
    "iche Kalenderkorrektur separat."
  )
)
}
