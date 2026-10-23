\name{gesetzliche_zinsen}
\alias{gesetzliche_zinsen}
\title{gesetzliche zinsen}
\description{Kapital * Jahreszinssatz/100 * angegebener Jahresanteil. Jahreszinssatz 4 Prozent, außer ausdrücklich abweichende wirksame Bestimmung als Eingabe. Während eines vollständig im Gläubigerverzug liegenden Zeitanteils kein Zinsanspruch aus dieser Regel (NICHT_ANWENDBAR).}
\usage{
gesetzliche_zinsen(kapital = NULL,
  zeitanteil_zaehler = NULL,
  zeitanteil_nenner = NULL,
  zeitanteil_nachweis = NULL,
  glaeubigerverzug = NULL,
  abweichender_zinssatz_prozent = NULL)
}
\arguments{
  \item{kapital}{Nichtnegative Dezimalzeichenfolge des zu verzinsenden Kapitals in EUR. Als Alternative zu den hier beschriebenen Dezimaltexten sind exakte Bruchobjekte mit genau den Zeichenfolgenfeldern zaehler und nenner zulässig, auch für solche Dezimalfelder innerhalb einer Listenstruktur. Kanonische Ganzzahlzeichenfolgen ohne Pluszeichen oder führende Nullen verwenden; Nenner positiv. Fachliche Wertebereiche bleiben unverändert. Der gemeinsame Zahlenvertrag NUMERIK.md gilt.}
  \item{zeitanteil_zaehler}{Nichtnegative ganze Zahl im ausdrücklich ermittelten Jahresanteil.}
  \item{zeitanteil_nenner}{Positive ganze Zahl als Nenner des Jahresanteils.}
  \item{zeitanteil_nachweis}{Nichtleere Beschreibung von Zeitraum und maßgeblicher Zeitkonvention. Keine automatische 30/360- oder 365-Tage-Annahme.}
  \item{glaeubigerverzug}{Expliziter Wahrheitswert: liegt der gesamte eingegebene Zeitraum im Gläubigerverzug?}
  \item{abweichender_zinssatz_prozent}{Optionaler wirksam abweichender Jahreszinssatz als Dezimalzeichenfolge in Prozent; sonst NULL für 4 Prozent. Als Alternative zu den hier beschriebenen Dezimaltexten sind exakte Bruchobjekte mit genau den Zeichenfolgenfeldern zaehler und nenner zulässig, auch für solche Dezimalfelder innerhalb einer Listenstruktur. Kanonische Ganzzahlzeichenfolgen ohne Pluszeichen oder führende Nullen verwenden; Nenner positiv. Fachliche Wertebereiche bleiben unverändert. Der gemeinsame Zahlenvertrag NUMERIK.md gilt.}
}
\details{Verzinsungspflicht aus Gesetz/Rechtsgeschäft muss bereits feststehen; Funktion begründet sie nicht. Keine universelle 30/360-/365-Tage-Annahme und kein Zinseszins; Zeitanteile mit geändertem Satz, Kapital oder Gläubigerverzug getrennt berechnen. Gemeinsamer Zahlenvertrag NUMERIK.md; fehlend EINGABE_FEHLT, falscher Typ/Bereich EINGABE_UNGUELTIG.}
\value{S3-Objekt \code{bgb_ergebnis}; wert enthält zaehler und nenner als Ganzzahlzeichenfolgen. Einheit: EUR. Nichtanwendbarkeit: status NICHT_ANWENDBAR und wert NULL. Fehlende oder ungültige Eingaben: bgb_berechnungsfehler mit Status EINGABE_FEHLT oder EINGABE_UNGUELTIG.}
\examples{
gesetzliche_zinsen(
  kapital = "1000",
  zeitanteil_zaehler = 1,
  zeitanteil_nenner = 2,
  zeitanteil_nachweis = "Ausdrücklich als halbes Zinsjahr bestimmter Testzeitraum",
  glaeubigerverzug = FALSE,
  abweichender_zinssatz_prozent = NULL
)
}
