% Automatisch aus Fachverträgen erzeugt; fachliche Freigabe bleibt separat.
\name{verbrauchsgueterkauf_verjaehrungsnachlauf}
\alias{verbrauchsgueterkauf_verjaehrungsnachlauf}
\title{verbrauchsgueterkauf verjaehrungsnachlauf}
\description{Feste lokale BGB-Fassung; rechtlichen Anwendungsbereich und Bewertungen ausdrücklich bestimmen.}
\usage{verbrauchsgueterkauf_verjaehrungsnachlauf(
  nachlaufgrund = NULL,
  anknuepfung_am = NULL,
  bisheriger_letzter_tag = NULL,
  tatbestand_erfuellt = NULL,
  einordnungsnachweis = NULL
)}
\arguments{
\item{nachlaufgrund}{Auswahl ende_digitaler_bereitstellung (Absatz1,12Monate), ende_aktualisierungspflicht (Absatz2,12Monate), erstmaliges_zeigen_des_mangels (Absatz3,4Monate) oder rueckgabe_nach_nacherfuellung_garantie (Absatz4,2Monate). Diese Gründe haben verschiedene Anknüpfungsereignisse.}
\item{anknuepfung_am}{ISO-Datum0001..9999: je nach Auswahl Ende des rechtlichen Bereitstellungszeitraums, Ende des Zeitraums der Aktualisierungspflicht, erstmaliges Zeigen gerade dieses Mangels oder Übergabe der nachgebesserten/ersetzten Ware zurück an den Verbraucher. Nicht ursprüngliche Übergabe zur Reparatur mit Rückgabe verwechseln. Noch nicht feststehendes Schutzende nicht durch fiktives Datum ersetzen.}
\item{bisheriger_letzter_tag}{ISO-Datum0001..9999 des rechtlich maßgeblichen bisherigen letzten unverjährten Tags vor Anwendung dieses Nachlaufs. Einschlägige Frist und bereits wirksame andere Verlängerungen korrekt einordnen. Bei erstmaligem Zeigen wird zusätzlich geprüft, dass dieses spätestens an diesem Tag liegt. Keine zirkuläre Bestimmung der Voraussetzung mit dem hier neu berechneten Nachlauf.}
\item{tatbestand_erfuellt}{Wahrheitswert des vollständigen rechtlichen Tatbestands für den konkreten Verbrauchsgütermangel: Absatz1 dauerhafte digitale Bereitstellung§475c, Absatz2 Verletzung der Aktualisierungspflicht§475b, Absatz3 erstmaliges Zeigen, Absatz4 qualifizierte vorherige Übergabe zur Nacherfüllung/Garantie an Unternehmer oder von ihm veranlassten Dritten und Rückgabe. Kein Wiederaufleben bereits verjährter Ansprüche unterstellen. FALSE ergibt NICHT_ANWENDBAR.}
\item{einordnungsnachweis}{Nichtleere Begründung von Anspruch, Tatbestand, zugehörigem Anknüpfungsereignis und bisheriger Frist. Bei mehreren einschlägigen Nachläufen konkurrierende Grenzen rechtlich konsistent bestimmen.}
}
\details{Nachlauf von12/12/4/2Monaten ab gesetzlichem Ereignis berechnen und späteres Ende aus Nachlauf und bisheriger Frist wählen. Absatz3 zusätzlich erstes Zeigen innerhalb bisheriger Frist verlangen. Kein pauschales Addieren zum bisherigen Fristende; keine automatische Wiederbelebung verjährter Ansprüche. Noch laufende unbestimmte Bereitstellung/Aktualisierungspflicht ohne feststehendes Ende kann mit dieser Datumsfunktion nicht abschließend berechnet werden. Hemmungen/Neubeginne/weitere Nachläufe/§193 gesondert. ISO-Daten und berechnete Fristgrenzen0001..9999, explizite Auswahl/Wahrheitswerte und nichtleerer Nachweis.}
\value{wert enthält nachlauf_monate als ganze Zahl, mindestablauf und rechnerischer_letzter_tag als ISO-Daten. Ohne qualifizierten Tatbestand, auch bei verspätetem Erstzeigen, NICHT_ANWENDBAR/null. Einheit: fristdaten.}
\references{BGB_PDF_SHA256_9b5a99536e7b00756e9fa5f20082bd9ad3951b37c381fc0f5d52aa5a556839eb; BGB_475e_T0001, BGB_475e_T0002, BGB_475e_T0003, BGB_475e_T0004}
\examples{
verbrauchsgueterkauf_verjaehrungsnachlauf(
  nachlaufgrund = "ende_digitaler_bereitstellung",
  anknuepfung_am = "2024-10-31",
  bisheriger_letzter_tag = "2024-10-30",
  tatbestand_erfuellt = TRUE,
  einordnungsnachweis = paste0(
    "Synthetisch rechtlich qualifizierter konkreter Mangel und ma",
    "ßgebliches Ereignis ohne weitere offene Fristkorrekturen."
  )
)
}
