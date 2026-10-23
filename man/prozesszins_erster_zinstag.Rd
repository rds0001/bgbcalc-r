% Automatisch aus Fachverträgen erzeugt; fachliche Freigabe bleibt separat.
\name{prozesszins_erster_zinstag}
\alias{prozesszins_erster_zinstag}
\title{prozesszins erster zinstag}
\description{Feste lokale BGB-Fassung; rechtlichen Anwendungsbereich und Bewertungen ausdrücklich bestimmen.}
\usage{prozesszins_erster_zinstag(
  rechtshaengigkeit_am = NULL,
  faelligkeits_zinsbeginn_am = NULL,
  einordnungsnachweis = NULL
)}
\arguments{
\item{rechtshaengigkeit_am}{Rechtlich maßgeblicher Tag der Rechtshängigkeit der konkreten GeldforderungYYYY-MM-DD, nicht bloßer Eingang der Klageschrift. Maßgebliche Zustellung oder sonstigen Rechtshängigkeitsakt vorqualifizieren.}
\item{faelligkeits_zinsbeginn_am}{Bereits rechtlich bestimmter erster möglicher Zinstag aufgrund der FälligkeitYYYY-MM-DD. Dies ist ausdrücklich der normalisierte erste Zinstag, nicht ungeprüft ein beliebiger Rechnungs-/Fälligkeitstag; einschlägige Tagesanfangs-/Ereignisregeln vorqualifizieren.}
\item{einordnungsnachweis}{Nichtleerer Nachweis der konkreten Geldforderung, ihres Rechtshängigkeitsereignisses und des zutreffend normalisierten fälligkeitsbezogenen ersten Zinstags. Zinsbasis, Satz und Zinseszinsverbot gesondert.}
}
\details{Folgetag der Rechtshängigkeit mit dem qualifizierten fälligkeitsbezogenen ersten Zinstag vergleichen und den späteren Tag wählen. §291: kein Schuldnerverzug für Prozesszinsen erforderlich. Rechtshängigkeitsbezogener Beginn am Folgetag entsprechend187I, primär belegt durchBAG6AZR237/15Rn43. Spätere Fälligkeit begrenzt den Beginn zusätzlich; deren erster Zinstag muss bereits rechtlich bestimmt sein, keine pauschale ungeprüfte Behandlung jedes Fälligkeitstags als Ereignis oder Tagesbeginn. Verschiedene Forderungs-/Ratenanteile mit verschiedenen Fälligkeiten getrennt rechnen. Für Betrag vorhandenen Verzugszins-Satzkern entsprechend291/288 verwenden, ohne tatsächlichen Verzug zu unterstellen; Zinsforderungen gemäß289Satz1 nicht einfach mitverzinsen. Andere früher beginnende Zinsansprüche bleiben separat. Kalenderdaten0001..9999 einschließlich Grenz- und Folgedaten; keine Rundung.}
\value{wert: rechtshaengigkeits_zinsbeginn und erster_prozesszinstag alsYYYY-MM-DD; keine automatische Zinsbetragsentscheidung. Einheit: daten.}
\references{BGB_PDF_SHA256_9b5a99536e7b00756e9fa5f20082bd9ad3951b37c381fc0f5d52aa5a556839eb; BGB_187_T0001, BGB_187_T0002, BGB_187_T0003, BGB_291_T0001, BGB_291_T0002}
\examples{
prozesszins_erster_zinstag(
  rechtshaengigkeit_am = "2024-01-10",
  faelligkeits_zinsbeginn_am = "2024-01-01",
  einordnungsnachweis = paste0(
    "§291: kein Schuldnerverzug für Prozesszinsen erforderlich. R",
    "echtshängigkeitsbezogener Beginn am Folgetag entsprechend187",
    "I, primär belegt durchBAG6AZR237/15Rn43. Spätere Fälligkeit ",
    "begrenzt den Beginn zusätzlich; deren erster Zinstag muss be",
    "reits rechtlich bestimmt sein, keine pauschale ungeprüfte Be",
    "handlung jedes Fälligkeitstags als Ereignis oder Tagesbeginn",
    ". Verschiedene Forderungs-/Ratenanteile mit verschiedenen Fä",
    "lligkeiten getrennt rechnen. Für Betrag vorhandenen Verzugsz",
    "ins-Satzkern entsprechend291/288 verwenden, ohne tatsächlich",
    "en Verzug zu unterstellen; Zinsforderungen gemäß289Satz1 nic",
    "ht einfach mitverzinsen. Andere früher beginnende Zinsansprü",
    "che bleiben separat."
  )
)
}
