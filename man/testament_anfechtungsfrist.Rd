% Automatisch aus Fachverträgen erzeugt; fachliche Freigabe bleibt separat.
\name{testament_anfechtungsfrist}
\alias{testament_anfechtungsfrist}
\title{testament anfechtungsfrist}
\description{Feste lokale BGB-Fassung; rechtlichen Anwendungsbereich und Bewertungen ausdrücklich bestimmen.}
\usage{testament_anfechtungsfrist(
  erbfall_am = NULL,
  massgebliche_kenntnis_am = NULL,
  massgebliches_jahresfristende = NULL,
  massgeblicher_anfechtungstag = NULL,
  anfechtungsregel_2082_anwendbar = NULL,
  einordnungsnachweis = NULL
)}
\arguments{
\item{erbfall_am}{ISO-Datum des Erbfalls als Beginn der unabhängigen absoluten Dreißigjahresfrist.}
\item{massgebliche_kenntnis_am}{ISO-Datum der rechtlich fristauslösenden Kenntnis des Anfechtungsberechtigten vom Anfechtungsgrund, frühestens Erbfall. Vorheriges tatsächliches Wissen nicht ungeprüft als vorgezogenen Fristbeginn einsetzen; Rechtsentstehung und konkrete Berechtigung gesondert qualifizieren.}
\item{massgebliches_jahresfristende}{ISO-Datum des fachlich geprüften Jahresfristendes einschließlich gegebenenfalls§§206/210/211 und zulässiger Kalenderkorrekturen; mindestens rechnerisches Jahresende. Ohne Korrektur genau rechnerisches Ende eingeben. Keine pauschale Hemmung oder Verlängerung der absoluten Grenze.}
\item{massgeblicher_anfechtungstag}{ISO-Datum des rechtlich maßgeblichen Erklärungstags, frühestens maßgeblicher Kenntnisbeginn. Form, Zugang und zutreffenden Empfänger insbesondere§2081 prüfen; Versanddatum nicht pauschal einsetzen.}
\item{anfechtungsregel_2082_anwendbar}{Expliziter Wahrheitswert für Anwendbarkeit der Testamentsanfechtungsfrist§2082 im konkreten Fall; FALSE ergibt NICHT_ANWENDBAR. Keine automatische Berechtigung oder Anfechtbarkeit.}
\item{einordnungsnachweis}{Nichtleere Begründung von Kenntnisbeginn, Berechtigung, maßgeblichem Anfechtungstag, Anwendungsbereich und Jahresfristkorrekturen.}
}
\details{Ein Jahr ab rechtlich maßgeblicher Kenntnis als Ereignisfrist; fachlich korrigiertes Jahresende höchstens bis30 Jahre ab Erbfall. Rechtzeitigkeit am früheren Endtag einschließlich. §§206/210/211 und zulässige Kalenderkorrekturen müssen im qualifizierten Jahresende berücksichtigt sein; keine automatische Verlängerung der absoluten Dreißigjahresgrenze. Anfechtungsgrund/Berechtigung/Erklärung/Form separat. Keine Übertragung auf§2283 oder§1954. ISO-Daten und berechnete Grenzen0001..9999, expliziter Wahrheitswert und nichtleerer Nachweis.}
\value{wert enthält rechnerisches_jahresfristende, dreissigjahresgrenze, massgebliche_kalendergrenze und anfechtung_fristgerecht; keine abschließende Wirksamkeitsentscheidung. Einheit: daten_und_wahrheitswerte.}
\references{BGB_PDF_SHA256_9b5a99536e7b00756e9fa5f20082bd9ad3951b37c381fc0f5d52aa5a556839eb; BGB_2082_T0001, BGB_2082_T0002, BGB_2082_T0003, BGB_2082_T0004}
\examples{
testament_anfechtungsfrist(
  erbfall_am = "2028-02-29",
  massgebliche_kenntnis_am = "2028-02-29",
  massgebliches_jahresfristende = "2029-02-28",
  massgeblicher_anfechtungstag = "2029-02-28",
  anfechtungsregel_2082_anwendbar = TRUE,
  einordnungsnachweis = paste0(
    "Synthetisch qualifizierte Kenntnis und ordnungsgemäßer Erklä",
    "rungstag; keine Jahresfristkorrektur."
  )
)
}
