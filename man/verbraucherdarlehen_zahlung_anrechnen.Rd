\name{verbraucherdarlehen_zahlung_anrechnen}
\alias{verbraucherdarlehen_zahlung_anrechnen}
\title{verbraucherdarlehen zahlung anrechnen}
\description{Zuerst Rechtsverfolgungskosten, dann übriger geschuldeter Betrag nach § 497 Abs. 1, zuletzt gesonderte Zinsen nach Abs. 2. Teilzahlungen werden rechnerisch vollständig in dieser Reihenfolge eingesetzt.}
\usage{
verbraucherdarlehen_zahlung_anrechnen(zahlung = NULL,
  rechtsverfolgungskosten = NULL,
  uebriger_geschuldeter_betrag = NULL,
  verzugszinsen = NULL,
  immobiliar_verbraucherdarlehen = NULL,
  titel_hauptforderung_zinsen = NULL,
  schuldnerverzug = NULL)
}
\arguments{
\item{zahlung}{Nichtnegative Dezimalzeichenfolge der geleisteten Zahlung in EUR. Als Alternative zu den hier beschriebenen Dezimaltexten sind exakte Bruchobjekte mit genau den Zeichenfolgenfeldern zaehler und nenner zulässig, auch für solche Dezimalfelder innerhalb einer Listenstruktur. Kanonische Ganzzahlzeichenfolgen ohne Pluszeichen oder führende Nullen verwenden; Nenner positiv. Fachliche Wertebereiche bleiben unverändert. Der gemeinsame Zahlenvertrag NUMERIK.md gilt.}
\item{rechtsverfolgungskosten}{Nichtnegative Dezimalzeichenfolge der geschuldeten Rechtsverfolgungskosten in EUR. Als Alternative zu den hier beschriebenen Dezimaltexten sind exakte Bruchobjekte mit genau den Zeichenfolgenfeldern zaehler und nenner zulässig, auch für solche Dezimalfelder innerhalb einer Listenstruktur. Kanonische Ganzzahlzeichenfolgen ohne Pluszeichen oder führende Nullen verwenden; Nenner positiv. Fachliche Wertebereiche bleiben unverändert. Der gemeinsame Zahlenvertrag NUMERIK.md gilt.}
\item{uebriger_geschuldeter_betrag}{Nichtnegative Dezimalzeichenfolge des übrigen fälligen geschuldeten Betrags nach § 497 Abs. 1. Einschließlich einschlägiger Vertragsleistungen; gesonderte Verzugszinsen nicht doppelt erfassen. Als Alternative zu den hier beschriebenen Dezimaltexten sind exakte Bruchobjekte mit genau den Zeichenfolgenfeldern zaehler und nenner zulässig, auch für solche Dezimalfelder innerhalb einer Listenstruktur. Kanonische Ganzzahlzeichenfolgen ohne Pluszeichen oder führende Nullen verwenden; Nenner positiv. Fachliche Wertebereiche bleiben unverändert. Der gemeinsame Zahlenvertrag NUMERIK.md gilt.}
\item{verzugszinsen}{Nichtnegative Dezimalzeichenfolge der gesondert erfassten Zinsen nach § 497 Abs. 2. Als Alternative zu den hier beschriebenen Dezimaltexten sind exakte Bruchobjekte mit genau den Zeichenfolgenfeldern zaehler und nenner zulässig, auch für solche Dezimalfelder innerhalb einer Listenstruktur. Kanonische Ganzzahlzeichenfolgen ohne Pluszeichen oder führende Nullen verwenden; Nenner positiv. Fachliche Wertebereiche bleiben unverändert. Der gemeinsame Zahlenvertrag NUMERIK.md gilt.}
\item{immobiliar_verbraucherdarlehen}{Expliziter Wahrheitswert zur rechtlichen Einordnung als Immobiliar-Verbraucherdarlehen.}
\item{titel_hauptforderung_zinsen}{Expliziter Wahrheitswert, ob die Zahlung auf einen Vollstreckungstitel erfolgt, dessen Hauptforderung auf Zinsen lautet.}
\item{schuldnerverzug}{Expliziter Wahrheitswert zum Schuldnerverzug im Anwendungsbereich des § 497.}
}
\details{Verbraucherdarlehensrechtliche Zuordnung einschließlich § 513 vorausgesetzt. Übriger geschuldeter Betrag umfasst insbesondere die geschuldeten Vertragsleistungen, nicht nur ursprüngliches Kapital; keine Doppelzählung der gesonderten Verzugszinsen. Bei Immobiliar-Verbraucherdarlehen, Titel mit Zinsen als Hauptforderung oder fehlendem Verzug NICHT_ANWENDBAR. Teilzahlungen dürfen im Anwendungsbereich nicht zurückgewiesen werden. Verjährung und Schadensersatz wegen Zinsverzugs sind gesonderte Regeln.}
\value{S3-Objekt bgb_ergebnis. wert: zuordnungen als geordnete Liste mit position, betrag, restforderung; nicht_zugeordnet als Überschuss. Alle Beträge exakte EUR-Brüche. Keine implizite Erstattung des Überschusses. Bei Nichtanwendbarkeit wert NULL und status NICHT_ANWENDBAR; fehlende/ungültige Eingaben erzeugen bgb_berechnungsfehler.}
\examples{
verbraucherdarlehen_zahlung_anrechnen("50", "20", "100", "30",
  FALSE, FALSE, TRUE)
}
