% Automatisch aus Fachverträgen erzeugt; fachliche Freigabe bleibt separat.
\name{miete_werktagstermin}
\alias{miete_werktagstermin}
\title{miete werktagstermin}
\description{Feste lokale BGB-Fassung; rechtlichen Anwendungsbereich und Bewertungen ausdrücklich bestimmen.}
\usage{miete_werktagstermin(
  fristfall = NULL,
  bezugsdatum = NULL,
  werktagskalender = NULL,
  kalendernachweis = NULL
)}
\arguments{
\item{fristfall}{zahlung_556b oder grundstueck_quartal_579; gesetzliche Anwendbarkeit und vertragliche Abweichungen vorqualifizieren. Zusätzlich landpacht_abschnitt_587 für587I2.}
\item{bezugsdatum}{YYYY-MM-DD: bei zahlung_556b erster Tag des Zeitabschnitts, nach dem die Miete bemessen ist; bei grundstueck_quartal_579 letzter Tag des Kalenderquartals. Nicht beliebigen Zahlungstag oder Ende eines frei gewählten Dreimonatszeitraums eingeben. Bei587 letzter Tag des Bemessungsabschnitts.}
\item{werktagskalender}{Objekt mit genau erster_kalendertag, letzter_kalendertag und werktage. Im belegten Zeitraum vollständige, streng aufsteigende Liste1..10000 einschlägiger Werktage alsISO-Daten; örtliche Feiertage, Zahlungsart und gesetzesspezifische Samstagsbehandlung vorqualifizieren. Keine automatische Gleichsetzung mit Bankgeschäftstagen.}
\item{kalendernachweis}{Nichtleerer Nachweis des Fristfalls und vollständigen rechtlich maßgeblichen Werktagskalenders für Zahlungsart und Ort. Zahlungsauftrag, Leistungshandlung und Geldeingang nicht ungeprüft gleichsetzen.}
}
\details{Vorhandene Kalenderauswahl wiederverwenden:556b dritter einschlägiger Werktag ab Zeitabschnittsbeginn einschließlich;579 erster einschlägiger Werktag nach Kalenderquartalsende. 587: erster einschlaegiger Werktag nach dem rechtlich bestimmten Bemessungsabschnitt. §556bI und579II: Miete zu Beginn, spätestens am dritten Werktag des Bemessungszeitabschnitts; Ergebnis ist äußerer Zahlungstermin, nicht automatisch Verzugseintritt oder notwendiger Geldeingang. §579I3 nur Grundstücksmiete ohne kürzere Bemessungsabschnitte: erster Werktag nach Kalenderquartal. Räume folgen579II/556b. Andere bewegliche Sachen oder kürzere Grundstücksabschnitte nach579I1/2 nicht dieser Quartalsregel unterwerfen. Werk-/Bankgeschäftstagsbegriffe nicht gleichsetzen: intern wird nur dieselbe geordnete Kalendersuche wiederverwendet. Überweisungs-/Barzahlungsregeln und Feiertage ausdrücklich im Werktagskalender begründen; keine pauschale Montag-bis-Freitag- oder Samstagannahme. Unzureichend belegte Kalender werden zurückgewiesen. §587I2: bei Bemessung nach Zeitabschnitten erster rechtlich einschlaegiger Werktag nach deren Ablauf; bezugsdatum ist letzter Abschnittstag, kein zwingendes Kalenderquartal. Werktagskalender vollstaendig rechtlich belegen. Ohne Abschnittsbemessung gilt587I1: Ende der Pachtzeit; gegebenenfalls193 gesondert.587II verweist fuer Ersparnis und anderweitige Verwertung auf537; vorhandene Betragsrechnung verwenden. Kalenderdaten0001..9999 einschließlich Grenz- und Folgedaten; keine Rundung.}
\value{wert.rechnerischer_zahlungstermin alsYYYY-MM-DD nach dem angegebenen qualifizierten Werktagskalender. Einheit: datum.}
\references{BGB_PDF_SHA256_9b5a99536e7b00756e9fa5f20082bd9ad3951b37c381fc0f5d52aa5a556839eb; BGB_556b_T0001, BGB_579_T0001, BGB_579_T0002, BGB_579_T0003, BGB_579_T0004, BGB_587_T0001, BGB_587_T0002, BGB_587_T0003, BGB_587_T0004}
\examples{
miete_werktagstermin(
  fristfall = "zahlung_556b",
  bezugsdatum = "2024-03-01",
  werktagskalender = list(
    "erster_kalendertag" = "2024-03-01",
    "letzter_kalendertag" = "2024-03-05",
    "werktage" = list(
    "2024-03-01",
    "2024-03-04",
    "2024-03-05"
  )
  ),
  kalendernachweis = paste0(
    "§556bI und579II: Miete zu Beginn, spätestens am dritten Werk",
    "tag des Bemessungszeitabschnitts; Ergebnis ist äußerer Zahlu",
    "ngstermin, nicht automatisch Verzugseintritt oder notwendige",
    "r Geldeingang. §579I3 nur Grundstücksmiete ohne kürzere Beme",
    "ssungsabschnitte: erster Werktag nach Kalenderquartal. Räume",
    " folgen579II/556b. Andere bewegliche Sachen oder kürzere Gru",
    "ndstücksabschnitte nach579I1/2 nicht dieser Quartalsregel un",
    "terwerfen. Werk-/Bankgeschäftstagsbegriffe nicht gleichsetze",
    "n: intern wird nur dieselbe geordnete Kalendersuche wiederve",
    "rwendet. Überweisungs-/Barzahlungsregeln und Feiertage ausdr",
    "ücklich im Werktagskalender begründen; keine pauschale Monta",
    "g-bis-Freitag- oder Samstagannahme. Unzureichend belegte Kal",
    "ender werden zurückgewiesen."
  )
)
}
