\name{verbraucherbau_sicherungsgrenze}
\alias{verbraucherbau_sicherungsgrenze}
\title{Verbraucherbau: verbraucherbau sicherungsgrenze}
\description{Betragsgrenze = Minimum aus nächster Abschlagszahlung und 20 Prozent der vereinbarten Vergütung. Überschreitung nur bei strikt größerer vereinbarter Sicherheit.}
\usage{
verbraucherbau_sicherungsgrenze(vereinbarte_verguetung = NULL,
  naechste_abschlagszahlung = NULL,
  vereinbarte_sicherheit = NULL,
  verbraucherbauvertrag = NULL,
  abschlaege_verlangt = NULL,
  abschlaege_vereinbart = NULL)
}
\arguments{
\item{vereinbarte_verguetung}{Nichtnegative EUR-Dezimalzeichenfolge der für § 650m Abs. 4 maßgeblichen vereinbarten Vergütung. Als Alternative zu den hier beschriebenen Dezimaltexten sind exakte Bruchobjekte mit genau den Zeichenfolgenfeldern zaehler und nenner zulässig, auch für solche Dezimalfelder innerhalb einer Listenstruktur. Kanonische Ganzzahlzeichenfolgen ohne Pluszeichen oder führende Nullen verwenden; Nenner positiv. Fachliche Wertebereiche bleiben unverändert. Der gemeinsame Zahlenvertrag NUMERIK.md gilt.}
\item{naechste_abschlagszahlung}{Nichtnegative EUR-Dezimalzeichenfolge der nächsten maßgeblichen Abschlagszahlung. Als Alternative zu den hier beschriebenen Dezimaltexten sind exakte Bruchobjekte mit genau den Zeichenfolgenfeldern zaehler und nenner zulässig, auch für solche Dezimalfelder innerhalb einer Listenstruktur. Kanonische Ganzzahlzeichenfolgen ohne Pluszeichen oder führende Nullen verwenden; Nenner positiv. Fachliche Wertebereiche bleiben unverändert. Der gemeinsame Zahlenvertrag NUMERIK.md gilt.}
\item{vereinbarte_sicherheit}{Nichtnegative EUR-Dezimalzeichenfolge der Sicherheit, zu der die Vereinbarung den Verbraucher verpflichtet. Als Alternative zu den hier beschriebenen Dezimaltexten sind exakte Bruchobjekte mit genau den Zeichenfolgenfeldern zaehler und nenner zulässig, auch für solche Dezimalfelder innerhalb einer Listenstruktur. Kanonische Ganzzahlzeichenfolgen ohne Pluszeichen oder führende Nullen verwenden; Nenner positiv. Fachliche Wertebereiche bleiben unverändert. Der gemeinsame Zahlenvertrag NUMERIK.md gilt.}
\item{verbraucherbauvertrag}{Expliziter Wahrheitswert zur rechtlichen Einordnung nach § 650i, gegebenenfalls in Verbindung mit § 650u.}
\item{abschlaege_verlangt}{Expliziter Wahrheitswert: Der Unternehmer verlangt Abschlagszahlungen nach § 632a.}
\item{abschlaege_vereinbart}{Expliziter Wahrheitswert: Die Parteien haben Abschlagszahlungen vereinbart; dies genügt auch ohne bereits erhobene Forderung.}
}
\details{Sicherheit des Verbrauchers für die Vergütung, nicht die vom Unternehmer geschuldete Herstellungssicherheit nach Absatz 2. Anwendbar bei verlangten Abschlägen nach § 632a oder vereinbarten Abschlägen. § 650u Abs. 2 schließt nur Absatz 1, nicht Absatz 4 aus. Die Überschreitung kennzeichnet den betragsmäßigen Unwirksamkeitstatbestand; die Funktion reduziert eine unwirksame Vereinbarung nicht automatisch auf den Grenzbetrag. Weitere Wirksamkeitsgründe werden nicht geprüft.}
\value{S3-Objekt bgb_ergebnis. wert enthält betragsgrenze als exakten EUR-Bruch und betragsgrenze_ueberschritten als Wahrheitswert. Ergebnisobjekt mit Regel- und Quellenfassung, Eingaben, Nutzervorgaben und Rechenschritten; NICHT_ANWENDBAR mit wert null außerhalb des Tatbestands. Fehlende oder ungültige Eingaben erzeugen bgb_berechnungsfehler.}
\examples{
verbraucherbau_sicherungsgrenze("100000", "15000", "16000", TRUE, TRUE, FALSE)
}
