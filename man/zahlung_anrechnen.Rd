\name{zahlung_anrechnen}
\alias{zahlung_anrechnen}
\title{zahlung anrechnen}
\description{Zahlung nacheinander auf Kosten, Zinsen und Hauptforderung bis zur jeweiligen Höhe anrechnen; Überschuss gesondert ausweisen. Bei angenommener abweichender Bestimmung eingegebene Reihenfolge verwenden.}
\usage{
zahlung_anrechnen(zahlung = NULL,
  kosten = NULL,
  zinsen = NULL,
  hauptforderung = NULL,
  abweichende_reihenfolge = NULL,
  annahme_abgelehnt = NULL)
}
\arguments{
\item{zahlung}{Nichtnegative Dezimalzeichenfolge der geleisteten Zahlung in EUR. Als Alternative zu den hier beschriebenen Dezimaltexten sind exakte Bruchobjekte mit genau den Zeichenfolgenfeldern zaehler und nenner zulässig, auch für solche Dezimalfelder innerhalb einer Listenstruktur. Kanonische Ganzzahlzeichenfolgen ohne Pluszeichen oder führende Nullen verwenden; Nenner positiv. Fachliche Wertebereiche bleiben unverändert. Der gemeinsame Zahlenvertrag NUMERIK.md gilt.}
\item{kosten}{Nichtnegative Dezimalzeichenfolge der geschuldeten Kosten in EUR. Als Alternative zu den hier beschriebenen Dezimaltexten sind exakte Bruchobjekte mit genau den Zeichenfolgenfeldern zaehler und nenner zulässig, auch für solche Dezimalfelder innerhalb einer Listenstruktur. Kanonische Ganzzahlzeichenfolgen ohne Pluszeichen oder führende Nullen verwenden; Nenner positiv. Fachliche Wertebereiche bleiben unverändert. Der gemeinsame Zahlenvertrag NUMERIK.md gilt.}
\item{zinsen}{Nichtnegative Dezimalzeichenfolge der geschuldeten Zinsen in EUR. Als Alternative zu den hier beschriebenen Dezimaltexten sind exakte Bruchobjekte mit genau den Zeichenfolgenfeldern zaehler und nenner zulässig, auch für solche Dezimalfelder innerhalb einer Listenstruktur. Kanonische Ganzzahlzeichenfolgen ohne Pluszeichen oder führende Nullen verwenden; Nenner positiv. Fachliche Wertebereiche bleiben unverändert. Der gemeinsame Zahlenvertrag NUMERIK.md gilt.}
\item{hauptforderung}{Nichtnegative Dezimalzeichenfolge der Hauptforderung in EUR. Als Alternative zu den hier beschriebenen Dezimaltexten sind exakte Bruchobjekte mit genau den Zeichenfolgenfeldern zaehler und nenner zulässig, auch für solche Dezimalfelder innerhalb einer Listenstruktur. Kanonische Ganzzahlzeichenfolgen ohne Pluszeichen oder führende Nullen verwenden; Nenner positiv. Fachliche Wertebereiche bleiben unverändert. Der gemeinsame Zahlenvertrag NUMERIK.md gilt.}
\item{abweichende_reihenfolge}{Optional eine geordnete Liste der Positionen kosten, zinsen, hauptforderung, jede genau einmal. In R auch Zeichenvektor. NULL bedeutet gesetzliche Reihenfolge. Die Bestimmung muss bei Leistung getroffen worden sein. In R sind nur unbenannte Listen beziehungsweise unbenannte Zeichenvektoren zulässig; benannte Objekte sind keine geordneten Folgen.}
\item{annahme_abgelehnt}{Expliziter Wahrheitswert, ob der Gläubiger die abweichend bestimmte Leistung abgelehnt hat. TRUE setzt tatsächliche Abweichung voraus.}
}
\details{Einzelne Schuld bereits ausgewählt, § 366 gesondert. Abweichende Bestimmung bildet hier eine Reihenfolge, keine beliebige Betragsbestimmung. Ablehnung einer tatsächlich abweichenden Bestimmung führt zu NICHT_ANWENDBAR. Ablehnung ohne Abweichung ist für diesen Eingabevertrag ungültig. Keine Aussage zu anderen Ablehnungsgründen oder Spezialregeln.}
\value{S3-Objekt bgb_ergebnis. wert: zuordnungen als geordnete Liste mit position, betrag, restforderung; nicht_zugeordnet als Überschuss. Alle Beträge exakte EUR-Brüche. Keine implizite Erstattung des Überschusses. Bei Nichtanwendbarkeit wert NULL und status NICHT_ANWENDBAR; fehlende/ungültige Eingaben erzeugen bgb_berechnungsfehler.}
\examples{
zahlung_anrechnen("50", "20", "30", "100", NULL, FALSE)
}

\section{Nutzungsanrechnung nach §1214}{Für den qualifizierten Anwendungsfall ist zahlung der Reinertrag; Gewinnungskosten nicht nochmals als Forderungskosten abziehen. Eine wirksam vereinbarte andere Reihenfolge kann vorgegeben werden. annahme_abgelehnt muss FALSE bleiben; kein Übertragen des Ablehnungsmechanismus nach §367II auf die automatische Nutzungsanrechnung. Quellenanker: BGB_1214_T0002, BGB_1214_T0003.}

\section{Numerische Tilgungsreste nach §§362,378,421,422,428}{Numerische Normanwendung362/378/421/422/428: bereits qualifizierte wirksame Geldbefriedigung einer konkret ausgewählten Schuld; bei378 nur Geldhinterlegung mit ausgeschlossener Rücknahme. Bei Gesamtschuld/Gesamtgläubigern den gemeinsamen Außenrest einmal fortschreiben, nicht für jede Person eine neue Vollforderung anlegen. Beispielbelege ohne Kosten/Zinsen; annahme_abgelehnt stetsFALSE, keine Übertragung eines Zahlungsablehnungsrechts auf andere Erlöschensakte. Andere Befriedigungsarten und Innenausgleich separat; Aufrechnung389 mit aufrechnung_betragswirkung behandeln. Siehe fachkonzept/tilgungsreste_normanwendung.json.}

\section{Numerischer Forderungsübergang nach §268III}{§268III: numerischer Teilbeleg einer bereits qualifizierten Ablösung einer einzelnen Geldhauptforderung ohne Kosten/Zinsen. Der bei zahlung_anrechnen der hauptforderung zugeordnete Betrag wird hier als übergegangener Forderungsbetrag gelesen, NICHT als Erlöschen der Schuld gegenüber dem Schuldner. restforderung bezeichnet den beim bisherigen Gläubiger verbleibenden Betrag; beide Forderungsteile bestehen zusammen in ursprünglicher Höhe. Nicht zugeordneter Überschuss ist kein zusätzlicher Forderungsübergang und kein automatisch begründeter Erstattungsanspruch. Ablösungsberechtigung, wirksame Befriedigung gemäß268I/II und Schutz des bisherigen Gläubigers268III2 separat qualifiziert. annahme_abgelehnt=FALSE ist nur der verwendete numerische Rechenmodus, keine Aussage über ein Ablehnungsrecht. Keine automatische Verteilung mehrerer Sicherheiten oder Gläubiger.}
