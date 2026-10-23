% Automatisch aus Fachverträgen erzeugt; fachliche Freigabe bleibt separat.
\name{dienst_ausserordentliche_kuendigungsfrist}
\alias{dienst_ausserordentliche_kuendigungsfrist}
\title{dienst ausserordentliche kuendigungsfrist}
\description{Feste lokale BGB-Fassung; rechtlichen Anwendungsbereich und Bewertungen ausdrücklich bestimmen.}
\usage{dienst_ausserordentliche_kuendigungsfrist(
  kenntnis_massgeblicher_tatsachen_am = NULL,
  massgebliches_zweiwochenfristende = NULL,
  zugang_kuendigung = NULL,
  wichtiger_grund_nach_interessenabwaegung = NULL,
  kuendigungsregel_626_anwendbar = NULL,
  einordnungsnachweis = NULL
)}
\arguments{
\item{kenntnis_massgeblicher_tatsachen_am}{ISO-Datum0001..9999 der rechtlich maßgeblichen Kenntnis des Kündigungsberechtigten von den Kündigungstatsachen. Nicht automatisch erster Verdacht; Aufklärung, Zurechnung und Dauersachverhalte vorher prüfen.}
\item{massgebliches_zweiwochenfristende}{ISO-Datum des letzten Kündigungstags nach gesetzlicher Zweiwochengrundfrist und rechtlich zulässigen Korrekturen. Mindestens Grundfrist; spätere Grenze belegen, nicht frei festlegen.}
\item{zugang_kuendigung}{ISO-Datum des rechtlich maßgeblichen Zugangs, nicht bloßer Versand; frühestens maßgebliche Kenntnis für diesen Tatsachenfall.}
\item{wichtiger_grund_nach_interessenabwaegung}{Expliziter Wahrheitswert: Einzelfallumstände und Abwägung beider Interessen ergeben Unzumutbarkeit der Fortsetzung bis ordentlichem Fristablauf oder vereinbarter Beendigung. Keine automatisierte Bewertung oder erfundene Punkteskala.}
\item{kuendigungsregel_626_anwendbar}{Wahrheitswert des geprüften Anwendungsbereichs§626 für den Dienstvertrag, die Partei und diesen Kündigungsgrund. FALSE ergibt NICHT_ANWENDBAR.}
\item{einordnungsnachweis}{Nichtleere Begründung von Kenntnis, maßgeblichem Zugang, Fristkorrekturen und qualifizierter Interessenabwägung.}
}
\details{Zweiwochengrundfrist ab Kenntnis berechnen. Zugang spätestens am maßgeblichen Ende wahrt Frist; zusammen mit qualifiziertem wichtigem Grund sind die beiden geprüften Anforderungen erfüllt. Keine Gesamtwirksamkeitsprüfung. Form/Anhörung/Schutzregeln gesondert; Mitteilung des Grunds auf Verlangen unverzüglich schriftlich nach Absatz2 Satz3 nicht automatisch erledigt. Keine erfundene fixe Ermittlungsfrist oder Wiederholung desselben Friststarts. ISO-Daten und berechnete Grenzen0001..9999, explizite Wahrheitswerte und nichtleerer Nachweis.}
\value{wert enthält rechnerisches_zweiwochenfristende als ISO-Datum und zweiwochenfrist_eingehalten sowie grund_und_frist_626_erfuellt als Wahrheitswerte. Außerhalb Anwendungsbereich NICHT_ANWENDBAR/null. Einheit: datum_und_wahrheitswerte.}
\references{BGB_PDF_SHA256_9b5a99536e7b00756e9fa5f20082bd9ad3951b37c381fc0f5d52aa5a556839eb; BGB_626_T0001, BGB_626_T0002, BGB_626_T0003, BGB_626_T0004}
\examples{
dienst_ausserordentliche_kuendigungsfrist(
  kenntnis_massgeblicher_tatsachen_am = "2030-01-01",
  massgebliches_zweiwochenfristende = "2030-01-15",
  zugang_kuendigung = "2030-01-01",
  wichtiger_grund_nach_interessenabwaegung = FALSE,
  kuendigungsregel_626_anwendbar = TRUE,
  einordnungsnachweis = paste0(
    "Synthetisch qualifizierte Tatsachenkenntnis, wichtiger Grund",
    " und rechtlicher Zugang ohne Korrektur der Grundfrist."
  )
)
}
