\name{zugewinnausgleich_grundbetrag}
\alias{zugewinnausgleich_grundbetrag}
\title{zugewinnausgleich grundbetrag}
\description{Richtung aus größerem Zugewinn bestimmen; halber Überschuss = abs(Zugewinn A - Zugewinn B)/2. Haftungsgrenze = max(vorhandenes Nettovermögen des Verpflichteten + anerkannte Hinzurechnung nach § 1375 Abs. 2 Satz 1, 0). Grundbetrag = min(halber Überschuss, Haftungsgrenze). Bei Gleichheit Richtung kein_ueberschuss und alle Beträge null.}
\usage{
zugewinnausgleich_grundbetrag(zugewinn_ehegatte_a = NULL,
  zugewinn_ehegatte_b = NULL,
  nettovermoegen_ehegatte_a = NULL,
  nettovermoegen_ehegatte_b = NULL,
  hinzurechnung_ehegatte_a = NULL,
  hinzurechnung_ehegatte_b = NULL,
  bewertungsnachweis = NULL)
}
\arguments{
\item{zugewinn_ehegatte_a}{Nichtnegative Dezimalzeichenfolge des bereits berechneten Zugewinns von Ehegatte A in EUR. Als Alternative zu den hier beschriebenen Dezimaltexten sind exakte Bruchobjekte mit genau den Zeichenfolgenfeldern zaehler und nenner zulässig, auch für solche Dezimalfelder innerhalb einer Listenstruktur. Kanonische Ganzzahlzeichenfolgen ohne Pluszeichen oder führende Nullen verwenden; Nenner positiv. Fachliche Wertebereiche bleiben unverändert. Der gemeinsame Zahlenvertrag NUMERIK.md gilt.}
\item{zugewinn_ehegatte_b}{Nichtnegative Dezimalzeichenfolge des bereits berechneten Zugewinns von Ehegatte B in EUR. Als Alternative zu den hier beschriebenen Dezimaltexten sind exakte Bruchobjekte mit genau den Zeichenfolgenfeldern zaehler und nenner zulässig, auch für solche Dezimalfelder innerhalb einer Listenstruktur. Kanonische Ganzzahlzeichenfolgen ohne Pluszeichen oder führende Nullen verwenden; Nenner positiv. Fachliche Wertebereiche bleiben unverändert. Der gemeinsame Zahlenvertrag NUMERIK.md gilt.}
\item{nettovermoegen_ehegatte_a}{Signierte Dezimalzeichenfolge des tatsächlich vorhandenen Vermögens von A nach Schuldenabzug, ohne die separat angegebene Hinzurechnung. Als Alternative zu den hier beschriebenen Dezimaltexten sind exakte Bruchobjekte mit genau den Zeichenfolgenfeldern zaehler und nenner zulässig, auch für solche Dezimalfelder innerhalb einer Listenstruktur. Kanonische Ganzzahlzeichenfolgen ohne Pluszeichen oder führende Nullen verwenden; Nenner positiv. Fachliche Wertebereiche bleiben unverändert. Der gemeinsame Zahlenvertrag NUMERIK.md gilt.}
\item{nettovermoegen_ehegatte_b}{Signierte Dezimalzeichenfolge des tatsächlich vorhandenen Vermögens von B nach Schuldenabzug, ohne die separat angegebene Hinzurechnung. Als Alternative zu den hier beschriebenen Dezimaltexten sind exakte Bruchobjekte mit genau den Zeichenfolgenfeldern zaehler und nenner zulässig, auch für solche Dezimalfelder innerhalb einer Listenstruktur. Kanonische Ganzzahlzeichenfolgen ohne Pluszeichen oder führende Nullen verwenden; Nenner positiv. Fachliche Wertebereiche bleiben unverändert. Der gemeinsame Zahlenvertrag NUMERIK.md gilt.}
\item{hinzurechnung_ehegatte_a}{Nichtnegative Dezimalzeichenfolge der anerkannten Hinzurechnung nach § 1375 Abs. 2 Satz 1 für A, unter Berücksichtigung der Ausschlüsse aus Abs. 3. Als Alternative zu den hier beschriebenen Dezimaltexten sind exakte Bruchobjekte mit genau den Zeichenfolgenfeldern zaehler und nenner zulässig, auch für solche Dezimalfelder innerhalb einer Listenstruktur. Kanonische Ganzzahlzeichenfolgen ohne Pluszeichen oder führende Nullen verwenden; Nenner positiv. Fachliche Wertebereiche bleiben unverändert. Der gemeinsame Zahlenvertrag NUMERIK.md gilt.}
\item{hinzurechnung_ehegatte_b}{Nichtnegative Dezimalzeichenfolge der anerkannten Hinzurechnung nach § 1375 Abs. 2 Satz 1 für B, unter Berücksichtigung der Ausschlüsse aus Abs. 3. Als Alternative zu den hier beschriebenen Dezimaltexten sind exakte Bruchobjekte mit genau den Zeichenfolgenfeldern zaehler und nenner zulässig, auch für solche Dezimalfelder innerhalb einer Listenstruktur. Kanonische Ganzzahlzeichenfolgen ohne Pluszeichen oder führende Nullen verwenden; Nenner positiv. Fachliche Wertebereiche bleiben unverändert. Der gemeinsame Zahlenvertrag NUMERIK.md gilt.}
\item{bewertungsnachweis}{Nichtleere Beschreibung der Werte, Bereinigungen, Hinzurechnungen und maßgeblichen Bewertungsstichtage. Keine automatische Kaufkraft- oder Sonderbewertung.}
}
\details{Berechnungsstufe nach § 1378 Abs. 1/2 vor Anrechnung nach § 1380, Leistungsverweigerung § 1381, Stundung § 1382 oder besonderen Vereinbarungen. Kein abschließender durchsetzbarer Zahlbetrag. Richtige Stichtage nach §§ 1384/1387 und rechtlich anerkannte Hinzurechnungen vorgeben; Berechnungsstichtag nicht mit Entstehung/Fälligkeit gleichsetzen. Negative Nettovermögen erst nach Addition der Hinzurechnung auf null begrenzen. Hinzurechnungen nicht doppelt im vorhandenen Nettovermögen erfassen.}
\value{S3-Objekt bgb_ergebnis. wert enthält richtung (a_an_b, b_an_a oder kein_ueberschuss), halber_ueberschuss, haftungsgrenze und grundbetrag. Beträge sind exakte EUR-Brüche mit zaehler und nenner als Ganzzahlzeichenfolgen. Die Richtung beschreibt den Zugewinnüberschuss auch dann, wenn die Haftungsgrenze den Betrag auf null begrenzt. Keine automatische Rundung. Fehlende/ungültige Eingaben erzeugen bgb_berechnungsfehler.}
\examples{
zugewinnausgleich_grundbetrag("100", "300", "500", "-40", "0", "100",
  "Maßgebliche Stichtagswerte und anerkannte Hinzurechnungen")
}
