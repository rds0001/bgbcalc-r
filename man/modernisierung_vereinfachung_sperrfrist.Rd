% Automatisch aus Fachverträgen erzeugt; fachliche Freigabe bleibt separat.
\name{modernisierung_vereinfachung_sperrfrist}
\alias{modernisierung_vereinfachung_sperrfrist}
\title{modernisierung vereinfachung sperrfrist}
\description{Feste lokale BGB-Fassung; rechtlichen Anwendungsbereich und Bewertungen ausdrücklich bestimmen.}
\usage{modernisierung_vereinfachung_sperrfrist(
  zugang_vereinfachte_erhoehung_am = NULL,
  neue_geltendmachung_am = NULL,
  gesetzliche_modernisierungspflicht = NULL,
  pflicht_damals_bekannt_oder_kennen_muessen = NULL,
  modernisierung_auf_weg_beschluss = NULL,
  weg_beschluss_am = NULL,
  vereinfachte_erhoehung_geltend_gemacht = NULL,
  einordnungsnachweis = NULL
)}
\arguments{
\item{zugang_vereinfachte_erhoehung_am}{ISO-Datum des rechtlich maßgeblichen Zugangs der Mieterhöhungserklärung im vereinfachten Verfahren beim Mieter. Nicht Modernisierungsbeginn, Ankündigung oder Beginn der erhöhten Zahlung. Fünfjährige Ereignisfrist muss im Datumsbereich0001..9999 enden.}
\item{neue_geltendmachung_am}{ISO-Datum der beabsichtigten/erfolgten neuen Geltendmachung nach§559 oder§559e, nicht deren Zahlungsbeginn. Nicht vor Ausgangszugang. Ende der Fünfjahressperre wird bis Tagesschluss berücksichtigt.}
\item{gesetzliche_modernisierungspflicht}{Wahrheitswert: Vermieter muss die konkret abgegrenzte neue Modernisierungsmaßnahme während des betreffenden Zeitraums aufgrund gesetzlicher Verpflichtung durchführen. Nicht bloßer Wunsch oder bereits anderweitig pauschal bewerteter Ausnahmefall.}
\item{pflicht_damals_bekannt_oder_kennen_muessen}{Wahrheitswert: Vermieter kannte die Verpflichtung bei Geltendmachung der früheren vereinfachten Erhöhung oder musste sie kennen. TRUE verhindert die Pflichtausnahme. Nicht Kenntniszeitpunkt erst der neuen Erhöhung.}
\item{modernisierung_auf_weg_beschluss}{Wahrheitswert: konkrete Maßnahme wird aufgrund des bezeichneten Beschlusses von Wohnungseigentümern durchgeführt. TRUE verlangt Datum dieses Beschlusses; bloße Zugehörigkeit zu WEG genügt nicht.}
\item{weg_beschluss_am}{ISO-Datum der tatsächlichen Beschlussfassung, bei maßnahmebezogenem WEG-Beschluss Pflicht, sonst optional. Nicht nach neuer Geltendmachung. Mindestabstand zwei voll abgelaufene Ereignisjahre ab ursprünglichem Zugang; Grenze mit vorhandenem Kalenderkern.}
\item{vereinfachte_erhoehung_geltend_gemacht}{Wahrheitswert einer rechtlich maßgeblichen früheren Geltendmachung im vereinfachten Verfahren. FALSE führt aus diesem Sperrfristmodell, kein Beleg eines sonst wirksamen neuen Erhöhungsanspruchs.}
\item{einordnungsnachweis}{Nichtleere Beschreibung von früherem vereinfachten Verfahren/Zugang, neuer§559/§559e-Maßnahme und gesetzlicher Verpflichtung samt damaliger Kenntnis beziehungsweise maßnahmebezogenem WEG-Beschluss. Gemischte Maßnahmen nach Ausnahmeumfang getrennt prüfen.}
}
\details{Fünfjährige Ereignisfrist ab Zugang bestimmen. Innerhalb Sperre keine neue§559/§559e-Erhöhung, außer maßnahmebezogene damals unbekannte/nicht kennen zu müssende gesetzliche Verpflichtung oder maßgeblicher WEG-Beschluss frühestens nach zwei voll abgelaufenen Ereignisjahren. Nur§559c Absatz4; keine umfassende Erhöhungsberechtigung. Pflichtausnahme nur soweit gesetzlich erzwungene konkrete Maßnahmen während Sperrzeit; WEG-Ausnahme nur bei Durchführung aufgrund dieses Beschlusses. Keine automatische Werktagsverschiebung, neue Sperren separat. ISO-Daten0001..9999, explizite Wahrheitswerte und nichtleerer Nachweis. Ergebnisse müssen im Datumsbereich liegen.}
\value{wert enthält sperrfrist_letzter_tag, weg_beschluss_fruehestens als ISO-Daten und pflichtausnahme, wegausnahme, neue_erhoehung_nach_559_559e_gesperrt als Wahrheitswerte. Ohne frühere maßgebliche vereinfachte Erhöhung NICHT_ANWENDBAR/null. Einheit: fristdaten_und_wahrheitswerte.}
\references{BGB_PDF_SHA256_9b5a99536e7b00756e9fa5f20082bd9ad3951b37c381fc0f5d52aa5a556839eb; BGB_559c_T0007, BGB_559c_T0008, BGB_559c_T0009, BGB_559c_T0010, BGB_187_T0001, BGB_187_T0002, BGB_188_T0001, BGB_188_T0002, BGB_188_T0003}
\examples{
modernisierung_vereinfachung_sperrfrist(
  zugang_vereinfachte_erhoehung_am = "2020-06-15",
  neue_geltendmachung_am = "2024-06-15",
  gesetzliche_modernisierungspflicht = FALSE,
  pflicht_damals_bekannt_oder_kennen_muessen = FALSE,
  modernisierung_auf_weg_beschluss = FALSE,
  weg_beschluss_am = "2022-06-15",
  vereinfachte_erhoehung_geltend_gemacht = TRUE,
  einordnungsnachweis = paste0(
    "Synthetische frühere vereinfachte Erhöhung und konkret abgeg",
    "renzte neue Maßnahme."
  )
)
}
