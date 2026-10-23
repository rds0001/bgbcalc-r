\name{mindestunterhalt_aus_existenzminimum}
\alias{mindestunterhalt_aus_existenzminimum}
\title{mindestunterhalt aus existenzminimum}
\description{Jahresbetrag durch 12 teilen, mit 87/100/117 Prozent je Altersstufe multiplizieren und auf volle EUR aufrunden.}
\usage{
mindestunterhalt_aus_existenzminimum(jaehrliches_existenzminimum = NULL,
  altersstufe = NULL,
  quellenangabe = NULL)
}
\arguments{
\item{jaehrliches_existenzminimum}{Positive Dezimalzeichenfolge des maßgeblichen jährlichen sächlichen Existenzminimums in EUR; externe fachliche Eingabe, kein Grundfreibetrag. Als Alternative zu den hier beschriebenen Dezimaltexten sind exakte Bruchobjekte mit genau den Zeichenfolgenfeldern zaehler und nenner zulässig, auch für solche Dezimalfelder innerhalb einer Listenstruktur. Kanonische Ganzzahlzeichenfolgen ohne Pluszeichen oder führende Nullen verwenden; Nenner positiv. Fachliche Wertebereiche bleiben unverändert. Der gemeinsame Zahlenvertrag NUMERIK.md gilt.}
\item{altersstufe}{Ganze Zahl 1, 2 oder 3; Zuordnung nach § 1612a Abs. 1 und 3.}
\item{quellenangabe}{Nichtleerer Herkunfts- und Gültigkeitsnachweis der Jahresgrundlage.}
}
\details{Rechenrelation aus § 1612a Abs. 1/2; liefert keine amtliche Festsetzung nach Abs. 4. Für konkrete dynamische Titel gilt der einschlägige Mindestunterhalt der Rechtsverordnung, als externe Eingabe mit Fassung/Zeitraum. Jahresbetrag weder Grundfreibetrag noch beliebige Einkommensgröße.}
\value{S3-Objekt bgb_ergebnis. wert enthält den auf volle EUR aufgerundeten Betrag als Bruch mit zaehler und nenner als Ganzzahlzeichenfolgen; nenner ist 1. Fehlende/ungültige Eingaben erzeugen bgb_berechnungsfehler.}
\examples{
mindestunterhalt_aus_existenzminimum("6000", 1, "Synthetische Jahresgrundlage")
}
