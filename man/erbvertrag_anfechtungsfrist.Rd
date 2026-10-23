% Automatisch aus Fachverträgen erzeugt; fachliche Freigabe bleibt separat.
\name{erbvertrag_anfechtungsfrist}
\alias{erbvertrag_anfechtungsfrist}
\title{erbvertrag anfechtungsfrist}
\description{Feste lokale BGB-Fassung; rechtlichen Anwendungsbereich und Bewertungen ausdrücklich bestimmen.}
\usage{erbvertrag_anfechtungsfrist(
  erbvertrag_geschlossen_am = NULL,
  anfechtungsgrund = NULL,
  kenntnis_oder_zwangslageende_am = NULL,
  massgebliches_jahresfristende = NULL,
  massgeblicher_anfechtungstag = NULL,
  sonderfall_2283_absatz_3 = NULL,
  sechsmonatsnachlauf_beginn_am = NULL,
  anfechtung_durch_erblasser_anwendbar = NULL,
  einordnungsnachweis = NULL
)}
\arguments{
\item{erbvertrag_geschlossen_am}{ISO-Datum des Erbvertragsschlusses; zeitliche Plausibilitätsgrenze, keine30-Jahresfrist.}
\item{anfechtungsgrund}{drohung oder sonstiger_grund. Auswahl bestimmt rechtlichen Fristauslöser; konkrete Anfechtbarkeit separat prüfen.}
\item{kenntnis_oder_zwangslageende_am}{Rechtlich maßgebliches ISO-Datum: bei Drohung Ende der Zwangslage, sonst Kenntnis des Erblassers vom Grund. Nicht vor Vertragsschluss.}
\item{massgebliches_jahresfristende}{ISO-Datum des qualifiziert korrigierten Jahresfristendes unter Berücksichtigung einschlägiger§§206/210 und zulässiger Kalenderkorrekturen; mindestens Rohjahresende. Auch weitergehende einschlägige Korrekturen des im Sonderfall berechneten Nachlaufs hierin gesondert qualifizieren; keine automatische§211-Anwendung.}
\item{massgeblicher_anfechtungstag}{ISO-Datum des rechtlich maßgeblichen Erklärungstags, nicht vor Fristauslöser. Notarielle Form, Empfänger und Zugang gesondert bestimmen.}
\item{sonderfall_2283_absatz_3}{Explizit qualifizierter Wahrheitswert: Vertreter nach§2282 Absatz2 hat nicht rechtzeitig angefochten, Geschäftsunfähigkeit ist weggefallen und persönliches Anfechtungsrecht wie ohne Vertreter besteht. TRUE aktiviert Sechsmonatsuntergrenze entsprechend§210; keine bloße Vermutung aus Betreuung.}
\item{sechsmonatsnachlauf_beginn_am}{ISO-Datum des rechtlich maßgeblichen Beginns der Sechsmonatsuntergrenze nach§§2283 Absatz3/210, erforderlich im Sonderfall. Qualifizierter Wegfall der Geschäftsunfähigkeit und persönliche Handlungsmöglichkeit, nicht bloßer Betreuerwechsel. Zwischen Vertragsschluss und Anfechtungstag. Sonst optional und ohne Berechnungswirkung, aber validiert.}
\item{anfechtung_durch_erblasser_anwendbar}{Expliziter Wahrheitswert der Anwendbarkeit§2283 auf Anfechtung durch Erblasser; FALSE NICHT_ANWENDBAR. Dritte§2285 nicht automatisch einbeziehen.}
\item{einordnungsnachweis}{Nichtleere Begründung von Fristauslöser, Jahreskorrekturen, Erklärungstag, Sonderfall und gegebenenfalls Sechsmonatsbeginn.}
}
\details{Ein Jahr ab Ende der Zwangslage bei Drohung, sonst Kenntnis des Erblassers. Qualifiziertes Jahresende prüfen. Bei qualifiziertem Absatz3-Sonderfall Sechsmonatsende ab entsprechend§210 maßgeblichem Beginn berechnen und späteres Ende aus Jahresende/Nachlauf wählen. Keine automatische30-Jahresgrenze oder§211. Anwendbarkeit und Sonderfall qualifiziert; sonstige Anfechtbarkeit/Form/Berechtigung/Bestätigung außerhalb. Korrekturen nicht pauschal aus beliebigem Hindernis. ISO-Daten und Grenzen0001..9999, geschlossene Grundauswahl, explizite Wahrheitswerte und nichtleerer Nachweis.}
\value{wert enthält fristausloeser, rechnerisches_jahresfristende, sechsmonatsnachlauf_ende (sonst null), massgebliche_kalendergrenze und anfechtung_fristgerecht; keine Wirksamkeitsentscheidung. Einheit: daten_und_wahrheitswerte.}
\references{BGB_PDF_SHA256_9b5a99536e7b00756e9fa5f20082bd9ad3951b37c381fc0f5d52aa5a556839eb; BGB_2283_T0001, BGB_2283_T0002, BGB_2283_T0003, BGB_2283_T0004}
\examples{
erbvertrag_anfechtungsfrist(
  erbvertrag_geschlossen_am = "1990-01-01",
  anfechtungsgrund = "sonstiger_grund",
  kenntnis_oder_zwangslageende_am = "2028-02-29",
  massgebliches_jahresfristende = "2029-02-28",
  massgeblicher_anfechtungstag = "2029-02-28",
  sonderfall_2283_absatz_3 = FALSE,
  sechsmonatsnachlauf_beginn_am = NULL,
  anfechtung_durch_erblasser_anwendbar = TRUE,
  einordnungsnachweis = paste0(
    "Synthetisch qualifizierter Erblasserfall; Kenntnis nach mehr",
    " als30 Jahren, ohne fingierte Höchstfrist."
  )
)
}
