% Automatisch aus Fachverträgen erzeugt; fachliche Freigabe bleibt separat.
\name{grundstuecksaufgebot_voraussetzungen}
\alias{grundstuecksaufgebot_voraussetzungen}
\title{grundstuecksaufgebot voraussetzungen}
\description{Feste lokale BGB-Fassung; rechtlichen Anwendungsbereich und Bewertungen ausdrücklich bestimmen.}
\usage{grundstuecksaufgebot_voraussetzungen(
  eigenbesitzbeginn_am = NULL,
  prueftag = NULL,
  einfacher_eigenbesitzzeitraum = NULL,
  eigentuemer_im_grundbuch_eingetragen = NULL,
  eigentuemer_gestorben_oder_verschollen = NULL,
  letzte_zustimmungsbeduerftige_eintragung_am = NULL,
  einordnungsnachweis = NULL
)}
\arguments{
\item{eigenbesitzbeginn_am}{ISO-Datum des Erwerbs des Eigenbesitzes eines anderen als des Eigentümers; Ereignisfrist. Keine bloße Nutzung ohne Eigenbesitz.}
\item{prueftag}{ISO-Datum ab Eigenbesitzbeginn; Berechnung zum Ablauf dieses Tages. Dreißigjahresfrist ist erst am Tagesende vollständig abgelaufen.}
\item{einfacher_eigenbesitzzeitraum}{Expliziter Wahrheitswert: Eigenbesitz dauert bis Prüftag fort, ist ungehemmt und ununterbrochen und es werden keine Vorgängerzeiten angerechnet. FALSE ergibt NICHT_ANWENDBAR; sämtliche abweichenden Zeitkonstellationen gemäß Verweis auf Ersitzung gesondert behandeln.}
\item{eigentuemer_im_grundbuch_eingetragen}{Expliziter Wahrheitswert, ob der Eigentümer eingetragen ist und damit die zusätzlichen Voraussetzungen nach Absatz1 Satz3 greifen.}
\item{eigentuemer_gestorben_oder_verschollen}{Expliziter rechtlich qualifizierter Wahrheitswert der Alternative Tod oder Verschollenheit, nicht bloß unerreichbar. Bei nicht eingetragenem Eigentümer ohne Einfluss auf Ergebnis.}
\item{letzte_zustimmungsbeduerftige_eintragung_am}{Optionales ISO-Datum der letzten Grundbucheintragung, die der Zustimmung dieses Eigentümers bedurfte, spätestens Prüftag. NULL bedeutet nach vollständig geprüfter relevanter Grundbuchhistorie niemals eine solche Eintragung, nicht unbekannt oder ungeprüft. Bei nicht eingetragenem Eigentümer für Zusatzvoraussetzung unerheblich; ein eingegebenes Datum wird dennoch validiert.}
\item{einordnungsnachweis}{Nichtleere Begründung von Eigenbesitz und Zeitverlauf, Eigentümerstatus sowie vollständiger Grundbuchhistorie und Zustimmungsbedürftigkeit. Keine gerichtliche Entscheidung durch Eigenerklärung ersetzen.}
}
\details{Eigenbesitzbeginn plus30 Jahre als Ereignisfrist. Bei eingetragenem Eigentümer zusätzlich Tod oder Verschollenheit und, falls eine zustimmungsbedürftige Eintragung erfolgte, deren Datum plus30 Jahre. Prüfung zum Tagesende; beide Zeitbedingungen kumulativ. Nur einfacher fortdauernder ungehemmter/ununterbrochener Eigenbesitz ohne Vorgängeranrechnung. Andere Zeitverläufe NICHT_ANWENDBAR. Keine vollständige gerichtliche Zulässigkeitsprüfung. Absatz2 verlangt Beschluss und eigene Grundbucheintragung; Schutz Dritter nach Absatz3 nicht durch diesen Tatbestand berechnet. ISO-Daten und berechnete Grenzen0001..9999, explizite Wahrheitswerte und nichtleerer Nachweis.}
\value{wert enthält eigenbesitz_dreissigjahresende, grundbuchruhe_dreissigjahresende (null falls keine einschlägige Eintragung oder kein eingetragener Eigentümer), eigenbesitzzeit_erfuellt, zusatzvoraussetzungen_eingetragener_eigentuemer_erfuellt, zeit_und_statusvoraussetzungen_erfuellt. Keine Aussage über bereits erlangtes Eigentum. Einheit: daten_und_wahrheitswerte.}
\references{BGB_PDF_SHA256_9b5a99536e7b00756e9fa5f20082bd9ad3951b37c381fc0f5d52aa5a556839eb; BGB_927_T0001, BGB_927_T0002, BGB_927_T0003, BGB_927_T0004, BGB_927_T0005}
\examples{
grundstuecksaufgebot_voraussetzungen(
  eigenbesitzbeginn_am = "2000-02-29",
  prueftag = "2030-02-28",
  einfacher_eigenbesitzzeitraum = TRUE,
  eigentuemer_im_grundbuch_eingetragen = TRUE,
  eigentuemer_gestorben_oder_verschollen = TRUE,
  letzte_zustimmungsbeduerftige_eintragung_am = "1999-03-01",
  einordnungsnachweis = paste0(
    "Synthetisch qualifizierter fortdauernder Eigenbesitz und vol",
    "lständige relevante Grundbuchhistorie."
  )
)
}
