\name{verzug_nebenkosten}
\alias{verzug_nebenkosten}
\title{verzug nebenkosten}
\description{Bei Entgeltforderung, Schuldner kein Verbraucher und Verzug: Pauschale 40 EUR plus max(ersatzfähiger Rechtsverfolgungsschaden-40,0). Anrechnung=min(40,Rechtsverfolgungsschaden) gesondert ausweisen. Sonst NICHT_ANWENDBAR für diesen Pauschalenverbund; keine Aussage zum separat bestehenden Kostenerstattungsanspruch.}
\usage{
verzug_nebenkosten(rechtsverfolgungsschaden = NULL,
  entgeltforderung = NULL,
  schuldner_verbraucher = NULL,
  schuldnerverzug = NULL)
}
\arguments{
  \item{rechtsverfolgungsschaden}{Nichtnegative Dezimalzeichenfolge des ersatzfähigen Rechtsverfolgungsschadens in EUR; bereits rechtlich bewertet. Als Alternative zu den hier beschriebenen Dezimaltexten sind exakte Bruchobjekte mit genau den Zeichenfolgenfeldern zaehler und nenner zulässig, auch für solche Dezimalfelder innerhalb einer Listenstruktur. Kanonische Ganzzahlzeichenfolgen ohne Pluszeichen oder führende Nullen verwenden; Nenner positiv. Fachliche Wertebereiche bleiben unverändert. Der gemeinsame Zahlenvertrag NUMERIK.md gilt.}
  \item{entgeltforderung}{Expliziter Wahrheitswert zur rechtlich eingeordneten Entgeltforderung.}
  \item{schuldner_verbraucher}{Expliziter Wahrheitswert zur Verbrauchereigenschaft des Schuldners.}
  \item{schuldnerverzug}{Expliziter Wahrheitswert zum festgestellten Schuldnerverzug.}
}
\details{Nur eine konkret ausgewählte Entgeltforderung einschließlich Abschlags-/Ratenforderung. Keine automatische Vervielfachung mit Mahnungen oder Schuldnerzahl. Wirksame Vereinbarungs- und Übergangsfragen nach § 288 Abs. 6/EGBGB vorab prüfen; sonstiger Schaden wird nicht auf Pauschale angerechnet. Gemeinsamer Zahlenvertrag NUMERIK.md; fehlend EINGABE_FEHLT, falscher Typ/Bereich EINGABE_UNGUELTIG.}
\value{S3-Objekt \code{bgb_ergebnis}; wert enthält zaehler und nenner als Ganzzahlzeichenfolgen. Einheit: EUR. Nichtanwendbarkeit: status NICHT_ANWENDBAR und wert NULL. Fehlende oder ungültige Eingaben: bgb_berechnungsfehler mit Status EINGABE_FEHLT oder EINGABE_UNGUELTIG.}
\examples{
verzug_nebenkosten(
  rechtsverfolgungsschaden = "0",
  entgeltforderung = TRUE,
  schuldner_verbraucher = FALSE,
  schuldnerverzug = TRUE
)
}
