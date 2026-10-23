% Automatisch aus Fachverträgen erzeugt; fachliche Freigabe bleibt separat.
\name{dienst_langzeitkuendigungsrahmen}
\alias{dienst_langzeitkuendigungsrahmen}
\title{dienst langzeitkuendigungsrahmen}
\description{Feste lokale BGB-Fassung; rechtlichen Anwendungsbereich und Bewertungen ausdrücklich bestimmen.}
\usage{dienst_langzeitkuendigungsrahmen(
  dienstbeginn_am = NULL,
  beginnart = NULL,
  lebenszeitvereinbarung = NULL,
  vereinbartes_dienstende_am = NULL,
  kuendigungszugang_am = NULL,
  kuendigung_durch_dienstverpflichteten = NULL,
  regel_624_anwendbar = NULL,
  einordnungsnachweis = NULL
)}
\arguments{
\item{dienstbeginn_am}{ISO-Datum0001..9999 des rechtlich maßgeblichen Beginns des Dienstverhältnisses für Bindungs- und Fünfjahresprüfung. Nicht ungeprüft Datum der Unterschrift oder späteren Vertragsänderung verwenden.}
\item{beginnart}{Auswahl tagesbeginn bei mitzuzählendem ersten Diensttag ab Tagesbeginn oder ereignis bei rechtlich einschlägigem Ereignisbeginn. Rechtliche Einordnung§187 vorgeben.}
\item{lebenszeitvereinbarung}{Wahrheitswert einer Vereinbarung für die Lebenszeit einer Person. Maßgebliche Person/Bindung rechtlich bestimmen; gewöhnlicher unbefristeter Vertrag ist nicht automatisch Lebenszeitvereinbarung.}
\item{vereinbartes_dienstende_am}{ISO-Datum0001..9999 des vereinbarten letzten Diensttags einschließlich; ohne Lebenszeitvereinbarung erforderlich, mindestens Dienstbeginn. Bei Lebenszeitvereinbarung optional NULL/None; freiwilliges Datum wird validiert, ersetzt aber nicht die Lebenszeitprüfung.}
\item{kuendigungszugang_am}{ISO-Datum0001..9999 des rechtlich maßgeblichen Zugangs der Kündigung, mindestens Dienstbeginn. Noch vor Ablauf der fünf Jahre erklärte Kündigung wird nicht automatisch in spätere Erklärung umgedeutet.}
\item{kuendigung_durch_dienstverpflichteten}{Wahrheitswert, ob der Dienstverpflichtete kündigt. Das besondere Recht§624 steht nicht automatisch dem Dienstberechtigten zu.}
\item{regel_624_anwendbar}{Wahrheitswert der sachlichen/zeitlichen Anwendbarkeit des§624 im konkreten Dienstverhältnis, einschließlich konkurrierender Regeln. Dauer und Kündigungszeitpunkt werden zusätzlich berechnet. FALSE ergibt NICHT_ANWENDBAR.}
\item{einordnungsnachweis}{Nichtleere Begründung von Dienstbeginn, Beginnart, vereinbarter Dauer/Lebenszeit, noch bestehendem Dienstverhältnis, kündigender Person und Zugang. Frühere andere Beendigung gesondert prüfen.}
}
\details{Fünfjahreszeitraum und ersten Folgetag bestimmen. Lebenszeitvereinbarung oder vereinbartes Ende strikt nach Fünfjahresgrenze; Zugang frühestens am Folgetag während laufender Bindung durch Dienstverpflichteten. Dann sechsmonatiges rechnerisches Kündigungsfristende. Genau fünf Jahre genügen nicht; früher Zugang wird nicht verschoben. Kein Aufschub eines früheren vertraglichen Endes auf das rechnerische Kündigungsfristende. Lebenszeitende/andere Beendigung sowie Erklärungsvoraussetzungen separat; keine automatische§193-Verlängerung. ISO-Daten und berechnete Grenzen0001..9999, explizite Auswahl/Wahrheitswerte und nichtleerer Nachweis. Optionales Vertragsende nur bei Lebenszeitvereinbarung.}
\value{wert enthält fuenfjahreszeitraum_ende, fruehester_kuendigungstag als ISO-Daten, lange_bindung_erfuellt und kuendigung_nach_624_zeitlich_moeglich als Wahrheitswerte. rechnerisches_kuendigungsfristende ist ISO-Datum nur bei erfüllten geprüften Voraussetzungen, sonst null. Ohne Anwendbarkeit NICHT_ANWENDBAR/null. Einheit: daten_und_wahrheitswerte.}
\references{BGB_PDF_SHA256_9b5a99536e7b00756e9fa5f20082bd9ad3951b37c381fc0f5d52aa5a556839eb; BGB_624_T0001, BGB_624_T0002}
\examples{
dienst_langzeitkuendigungsrahmen(
  dienstbeginn_am = "2010-01-01",
  beginnart = "tagesbeginn",
  lebenszeitvereinbarung = FALSE,
  vereinbartes_dienstende_am = "2014-12-31",
  kuendigungszugang_am = "2014-12-31",
  kuendigung_durch_dienstverpflichteten = FALSE,
  regel_624_anwendbar = TRUE,
  einordnungsnachweis = paste0(
    "Synthetische langfristige Bindung und tatsächlicher Kündigun",
    "gszugang durch rechtlich bestimmte Person."
  )
)
}
