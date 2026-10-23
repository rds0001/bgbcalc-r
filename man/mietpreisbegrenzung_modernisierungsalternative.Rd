% Automatisch aus Fachverträgen erzeugt; fachliche Freigabe bleibt separat.
\name{mietpreisbegrenzung_modernisierungsalternative}
\alias{mietpreisbegrenzung_modernisierungsalternative}
\title{mietpreisbegrenzung modernisierungsalternative}
\description{Feste lokale BGB-Fassung; gesetzlicher Anwendungsbereich und externe Bewertungen ausdrücklich vorqualifiziert.}
\usage{mietpreisbegrenzung_modernisierungsalternative(
  grund_oder_vormietgrenze = NULL,
  grundbetrag_ohne_modernisierung = NULL,
  modernisierung_monatlich = NULL,
  modernisierungsprivileg_nutzbar = NULL,
  einordnungsnachweis = NULL
)}
\arguments{
\item{grund_oder_vormietgrenze}{Bereits berechnete nutzbare Monatsgrenze des Grund-/Vormietwegs; etwa Ergebnis mietpreisbegrenzung_vormietgrenze.}
\item{grundbetrag_ohne_modernisierung}{556d-Grundbetrag auf Basis der Vergleichsmiete OHNE betrachtete Modernisierung, grundsätzlich110Prozent dieser qualifizierten Vergleichsmiete.}
\item{modernisierung_monatlich}{Mit559I–IIIa/559aI–IV berechneter hypothetischer monatlicher Erhöhungsbetrag; nicht bloße Kosten oder ungeprüfter Zwischenbetrag. Vorhandene Kosten-/Förder-/Kappungskerne verwenden.}
\item{modernisierungsprivileg_nutzbar}{Expliziter Wahrheitswert: Maßnahmen im maßgeblichen Dreijahresfenster, gesetzlicher Anwendungsfall und Auskunftslage erlauben diesen Weg.}
\item{einordnungsnachweis}{Rechtliche Nutzbarkeit, Vergleichsmiete ohne Modernisierung, zugehörige Maßnahmen und vorgeschaltete hypothetische Erhöhungsrechnung nachweisen.}
}
\details{Eigenständigen Modernisierungsweg berechnen und bei rechtlicher Nutzbarkeit mit bisheriger Monatsgrenze vergleichen. 556eII-Alternativweg: Grundbetrag auf unmodernisierter Vergleichsmiete plus hypothetischer559/559a-Erhöhung; anschließend höherer nutzbarer Betrag gegenüber eigenständigem Grund-/Vormietweg. Niemals Modernisierungszuschlag zusätzlich auf die Vormiete aufschlagen. Bei nicht nutzbarem Privileg bleibt nur bisheriger Weg; hypothetischer Alternativbetrag wird dann nicht ausgegeben. Keine doppelte Einbeziehung der Modernisierung in Vergleichsmiete und Zuschlag. Zeitliche Dreijahreszuordnung, Maßnahmenqualifikation und556g-Auskunft sind rechtliche Eingaben. Die rechtliche Förderabzugs-/Kappungsreihenfolge bleibt bei einschlägiger Konkurrenz ausdrücklich vorzugeben; kein neuer Standard dafür. Gemeinsame exakte Zahlengrenzen nach NUMERIK.md. Fehlende Pflichteingaben EINGABE_FEHLT, unzulässige Typen/Bereiche EINGABE_UNGUELTIG.}
\value{Optionaler Modernisierungsalternativbetrag und höhere nutzbare Monatsgrenze, exakte EUR-Brüche. Einheit: EUR.}
\references{BGB_PDF_SHA256_9b5a99536e7b00756e9fa5f20082bd9ad3951b37c381fc0f5d52aa5a556839eb; BGB_556e_T0001, BGB_556e_T0002, BGB_556e_T0003, BGB_556e_T0004}
\examples{
mietpreisbegrenzung_modernisierungsalternative(
  grund_oder_vormietgrenze = "950",
  grundbetrag_ohne_modernisierung = "880",
  modernisierung_monatlich = "100",
  modernisierungsprivileg_nutzbar = TRUE,
  einordnungsnachweis = paste0(
    "556eII-Alternativweg: Grundbetrag auf unmodernisierter Vergl",
    "eichsmiete plus hypothetischer559/559a-Erhöhung; anschließen",
    "d höherer nutzbarer Betrag gegenüber eigenständigem Grund-/V",
    "ormietweg. Niemals Modernisierungszuschlag zusätzlich auf di",
    "e Vormiete aufschlagen. Bei nicht nutzbarem Privileg bleibt ",
    "nur bisheriger Weg; hypothetischer Alternativbetrag wird dan",
    "n nicht ausgegeben. Keine doppelte Einbeziehung der Modernis",
    "ierung in Vergleichsmiete und Zuschlag. Zeitliche Dreijahres",
    "zuordnung, Maßnahmenqualifikation und556g-Auskunft sind rech",
    "tliche Eingaben. Die rechtliche Förderabzugs-/Kappungsreihen",
    "folge bleibt bei einschlägiger Konkurrenz ausdrücklich vorzu",
    "geben; kein neuer Standard dafür."
  )
)
}
