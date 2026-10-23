\name{zugewinn_betrag}
\alias{zugewinn_betrag}
\title{zugewinn betrag}
\description{Zugewinn = max(Endvermögen - Anfangsvermögen, 0). Negative Anfangs- und Endvermögen sind zulässig; Schuldenabbau kann Zugewinn erzeugen.}
\usage{
zugewinn_betrag(anfangsvermoegen = NULL,
  endvermoegen = NULL,
  bewertungsnachweis = NULL)
}
\arguments{
\item{anfangsvermoegen}{Signierte Dezimalzeichenfolge des rechtlich bewerteten und erforderlichenfalls bereinigten Anfangsvermögens in EUR, einschließlich maßgeblicher Hinzurechnungen. Negative Werte sind zulässig. Als Alternative zu den hier beschriebenen Dezimaltexten sind exakte Bruchobjekte mit genau den Zeichenfolgenfeldern zaehler und nenner zulässig, auch für solche Dezimalfelder innerhalb einer Listenstruktur. Kanonische Ganzzahlzeichenfolgen ohne Pluszeichen oder führende Nullen verwenden; Nenner positiv. Fachliche Wertebereiche bleiben unverändert. Der gemeinsame Zahlenvertrag NUMERIK.md gilt.}
\item{endvermoegen}{Signierte Dezimalzeichenfolge des rechtlich bewerteten Endvermögens in EUR, einschließlich maßgeblicher Hinzurechnungen. Negative Werte sind zulässig. Als Alternative zu den hier beschriebenen Dezimaltexten sind exakte Bruchobjekte mit genau den Zeichenfolgenfeldern zaehler und nenner zulässig, auch für solche Dezimalfelder innerhalb einer Listenstruktur. Kanonische Ganzzahlzeichenfolgen ohne Pluszeichen oder führende Nullen verwenden; Nenner positiv. Fachliche Wertebereiche bleiben unverändert. Der gemeinsame Zahlenvertrag NUMERIK.md gilt.}
\item{bewertungsnachweis}{Nichtleere Beschreibung der Werte, Bereinigungen, Hinzurechnungen und maßgeblichen Bewertungsstichtage. Keine automatische Kaufkraft- oder Sonderbewertung.}
}
\details{Rechnerischer Kern nach § 1373; keine automatische Vermögensbewertung, Kaufkraftbereinigung, Bestimmung privilegierter Erwerbe oder illoyaler Vermögensminderungen. Eingaben müssen für den maßgeblichen Fall rechtlich zutreffend und vergleichbar bewertet sein. § 1376 Abs. 4 einschließlich verfassungsgerichtlicher Maßgaben bleibt eigener ungeklärter Bewertungszweig, nicht durch diese Funktion freigegeben.}
\value{S3-Objekt bgb_ergebnis. wert enthält den exakten Zugewinn als Bruch mit zaehler und nenner als Ganzzahlzeichenfolgen. Keine automatische Rundung. Fehlende/ungültige Eingaben erzeugen bgb_berechnungsfehler.}
\examples{
zugewinn_betrag("-300", "-100", "Bewertete Vergleichswerte")
}
