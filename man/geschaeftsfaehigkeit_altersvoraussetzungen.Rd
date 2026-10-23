\name{geschaeftsfaehigkeit_altersvoraussetzungen}
\alias{geschaeftsfaehigkeit_altersvoraussetzungen}
\title{geschaeftsfaehigkeit altersvoraussetzungen}
\description{Vollendete Lebensjahre am Stichtag bestimmen und die Altersbereiche unter7, ab7bis unter18 und ab18 unterscheiden. Am29.Februar Geborene erreichen in Nichtschaltjahren die nächste Altersstufe am1.März.}
\usage{
geschaeftsfaehigkeit_altersvoraussetzungen(geburtsdatum = NULL,
  stichtag = NULL)
}
\arguments{
  \item{geburtsdatum}{Tatsächliches Geburtsdatum als ISO-Zeichenfolge YYYY-MM-DD. Der Tag wird bei der Altersberechnung nach §187 Abs.2 mitgerechnet; die Geburtsuhrzeit ist für diese Altersstufen nicht maßgeblich. Keine Aussage zum tatsächlichen Beginn der Rechtsfähigkeit vor der Geburt.}
  \item{stichtag}{ISO-Datum des Tages, für den die Altersstufe benötigt wird; darf nicht vor der Geburt liegen. Der nächste Geburtstag wird nicht jenseits des unterstützten Kalenders vorausberechnet.}
}
\details{Nur Altersvoraussetzungen nach §§104 Nr.1 und106 in Verbindung mit §2. Keine abschließende Einordnung der Geschäftsfähigkeit; insbesondere §104 Nr.2 und §105 Abs.2 sowie die Regeln der §§107bis113 bleiben gesondert. Volljährigkeit bedeutet hier keine Zusicherung uneingeschränkter Geschäftsfähigkeit. Keine Entscheidung über ein konkretes Rechtsgeschäft.}
\value{wert enthält vollendete_lebensjahre und die drei Wahrheitswerte unter_sieben, minderjaehrig_ab_sieben und volljaehrig. Genau eine Alterskategorie trifft zu. Status BERECHNET bedeutet durchgeführte Teilprüfung. Fehler als bgb_berechnungsfehler mit EINGABE_FEHLT oder EINGABE_UNGUELTIG.}
\examples{
geschaeftsfaehigkeit_altersvoraussetzungen("2019-05-20", "2026-05-20")
}
