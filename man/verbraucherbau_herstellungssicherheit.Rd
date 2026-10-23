\name{verbraucherbau_herstellungssicherheit}
\alias{verbraucherbau_herstellungssicherheit}
\title{verbraucherbau herstellungssicherheit}
\description{Grundsicherheit = 5 Prozent der ursprünglichen vereinbarten Gesamtvergütung. Überschreitet die kumulierte Mehrvergütung 10 Prozent der ursprünglichen Gesamtvergütung, zusätzliche Sicherheit = 5 Prozent der gesamten Mehrvergütung. Noch zu stellen = max(Grundsicherheit + zusätzliche Sicherheit - bereits gestellte Sicherheit, 0).}
\usage{
verbraucherbau_herstellungssicherheit(urspruengliche_gesamtverguetung = NULL,
  zusaetzliche_verguetung = NULL,
  bereits_gestellte_sicherheit = NULL,
  verbraucherbauvertrag = NULL)
}
\arguments{
\item{urspruengliche_gesamtverguetung}{Positive Dezimalzeichenfolge der ursprünglichen vereinbarten Gesamtvergütung in EUR. Als Alternative zu den hier beschriebenen Dezimaltexten sind exakte Bruchobjekte mit genau den Zeichenfolgenfeldern zaehler und nenner zulässig, auch für solche Dezimalfelder innerhalb einer Listenstruktur. Kanonische Ganzzahlzeichenfolgen ohne Pluszeichen oder führende Nullen verwenden; Nenner positiv. Fachliche Wertebereiche bleiben unverändert. Der gemeinsame Zahlenvertrag NUMERIK.md gilt.}
\item{zusaetzliche_verguetung}{Nichtnegative Dezimalzeichenfolge der kumulierten relevanten Mehrvergütung aus Änderungen oder Ergänzungen in EUR. Als Alternative zu den hier beschriebenen Dezimaltexten sind exakte Bruchobjekte mit genau den Zeichenfolgenfeldern zaehler und nenner zulässig, auch für solche Dezimalfelder innerhalb einer Listenstruktur. Kanonische Ganzzahlzeichenfolgen ohne Pluszeichen oder führende Nullen verwenden; Nenner positiv. Fachliche Wertebereiche bleiben unverändert. Der gemeinsame Zahlenvertrag NUMERIK.md gilt.}
\item{bereits_gestellte_sicherheit}{Nichtnegative Dezimalzeichenfolge der rechtlich geeigneten, noch verfügbaren bereits gestellten Herstellungssicherheit in EUR. Als Alternative zu den hier beschriebenen Dezimaltexten sind exakte Bruchobjekte mit genau den Zeichenfolgenfeldern zaehler und nenner zulässig, auch für solche Dezimalfelder innerhalb einer Listenstruktur. Kanonische Ganzzahlzeichenfolgen ohne Pluszeichen oder führende Nullen verwenden; Nenner positiv. Fachliche Wertebereiche bleiben unverändert. Der gemeinsame Zahlenvertrag NUMERIK.md gilt.}
\item{verbraucherbauvertrag}{Expliziter Wahrheitswert zur Einordnung als Verbraucherbauvertrag nach § 650i.}
}
\details{§ 650m Abs. 2 im Verbraucherbauvertrag nach § 650i. Grundsicherheit bei erster Abschlagszahlung, zusätzliche Sicherheit bei nächster Abschlagszahlung nach Schwellenüberschreitung. Berechnung bestimmt Betrag, nicht automatisch Fälligkeit. Gesetzlich relevante Änderungen/Ergänzungen als kumulierte positive Mehrvergütung eingeben; Minderungen oder wechselnde Vertragsbasen erfordern eigene Bewertung. Bereits gestellte Sicherheit muss rechtlich geeignet und noch verfügbar sein. Kein automatischer Freigabeanspruch bei Übersicherung. Einbehalt nur auf Verlangen des Unternehmers; konkrete Verteilung auf Abschlagszahlungen gesondert.}
\value{S3-Objekt bgb_ergebnis. wert enthält grundsicherheit, zusaetzliche_sicherheit, gesamtsicherheit und noch_zu_stellen, jeweils als exakten Bruch mit zaehler und nenner als Ganzzahlzeichenfolgen. Keine Rundung. Bei Nichtanwendbarkeit wert NULL und status NICHT_ANWENDBAR; fehlende/ungültige Eingaben erzeugen bgb_berechnungsfehler.}
\examples{
verbraucherbau_herstellungssicherheit("100000", "12000", "5000", TRUE)
}
