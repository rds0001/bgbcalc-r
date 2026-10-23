\name{unterhaltsaltersstufe}
\alias{unterhaltsaltersstufe}
\title{unterhaltsaltersstufe}
\description{Bis zum Monat der Vollendung von sechs Jahren Stufe 1, ab dessen Beginn Stufe 2; ab Monatsbeginn der Vollendung von zwölf Jahren Stufe 3. Am Stichtag volljährige Personen NICHT_ANWENDBAR.}
\usage{
unterhaltsaltersstufe(geburtsdatum = NULL,
  stichtag = NULL)
}
\arguments{
\item{geburtsdatum}{ISO-Geburtsdatum; darf nicht nach dem Stichtag liegen.}
\item{stichtag}{ISO-Datum zur Ermittlung der am Stichtag maßgeblichen Minderjährigen-Altersstufe. Volljährigkeit wird taggenau geprüft.}
}
\details{Altersstufe des Minderjährigenunterhalts, keine automatische Anspruchsprüfung. Volljährigkeit taggenau, nicht auf Monatsbeginn vorziehen. Geburt am Schalttag wird über die gesetzliche Lebensaltersberechnung behandelt. Keine Feiertagsverschiebung.}
\value{S3-Objekt bgb_ergebnis. wert ist die ganze Altersstufe 1, 2 oder 3; einheit altersstufe. Bei Volljährigkeit wert null und status NICHT_ANWENDBAR. Fehlende/ungültige Eingaben erzeugen bgb_berechnungsfehler.}
\examples{
unterhaltsaltersstufe("2020-05-20", "2026-05-01")
}
