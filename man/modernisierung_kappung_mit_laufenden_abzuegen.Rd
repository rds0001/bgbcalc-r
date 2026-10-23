% Automatisch aus Fachverträgen erzeugt; fachliche Freigabe bleibt separat.
\name{modernisierung_kappung_mit_laufenden_abzuegen}
\alias{modernisierung_kappung_mit_laufenden_abzuegen}
\title{modernisierung kappung mit laufenden abzuegen}
\description{Feste lokale BGB-Fassung; gesetzlicher Anwendungsbereich und externe Bewertungen ausdrücklich vorqualifiziert.}
\usage{modernisierung_kappung_mit_laufenden_abzuegen(
  jahresbetrag_vor_laufenden_abzuegen = NULL,
  jaehrliche_zinsermaessigung = NULL,
  jaehrliche_laufende_zuschuesse_und_darlehen = NULL,
  monatliche_restkappung = NULL,
  abzugsreihenfolge = NULL,
  methodennachweis = NULL
)}
\arguments{
\item{jahresbetrag_vor_laufenden_abzuegen}{Nichtnegativer Jahreserhöhungsbetrag vor jährlicher Zins-/Aufwendungsförderung und vor Kappung. Im regulären559Fall aus modernisierung_regulaerer_zwischenbetrag: Feld jahresbetrag_vor_laufenden_abzuegen; keine bereits gekappte/nach Förderabzug berechnete Summe einsetzen.}
\item{jaehrliche_zinsermaessigung}{Rechtlich anzurechnender Jahreszinsvorteil in EUR, aus modernisierung_zinsermaessigung berechenbar. Nicht zulässige Zinsanrechnung etwa bei559c darf hier nicht positiv eingesetzt werden.}
\item{jaehrliche_laufende_zuschuesse_und_darlehen}{Rechtlich anzurechnende jährliche Aufwendungszuschüsse/-darlehen in EUR; keine einmaligen Kostenbeiträge nochmals anrechnen.}
\item{monatliche_restkappung}{Nichtnegative einschlägige monatliche Restkappung in EUR, berechenbar mit modernisierung_kappungsgrenze. Bereits bestehende Erhöhungen und gegebenenfalls Heizungsgrenze dort berücksichtigen.}
\item{abzugsreihenfolge}{abzug_vor_kappung oder abzug_nach_kappung; ausschließlich die für den konkreten Fall extern rechtlich begründete Rechenreihenfolge. Kein Standardwert und kein Wahlrecht zur Ergebnisoptimierung.}
\item{methodennachweis}{Nichtleere rechtliche Begründung der vorgegebenen Reihenfolge und der zugehörigen Kosten-/Förder-/Kappungszuordnung. Die Library bestätigt diese Rechtsauslegung nicht.}
}
\details{Beide arithmetischen Reihenfolgen jährlicher Förderabzüge und monatlicher Kappung berechnen; Ergebnis nur gemäß ausdrücklich rechtlich vorgegebener Methode auswählen. Bedingte Zahlenrechnung für das Zusammenwirken von§559IIIa und§559aII. Die allgemeine rechtliche Reihenfolge laufender Förderabzüge gegenüber der Kappung ist in der Quellenarbeit nicht abschließend geklärt; diese Funktion entscheidet sie ausdrücklich nicht. Beide vollständigen Rechenwege werden ausgewiesen, der ausgewählte nur gemäß zwingender begründeter Nutzervorgabe. Vor Kappung: min(max(Jahresbetrag-Abzüge,0)/12,Restkappung). Nach Kappung: max(min(Jahresbetrag/12,Restkappung)-Abzüge/12,0). Null begrenzt nur den hier berechneten positiven Erhöhungsbetrag; keine automatische Senkung bisheriger Miete, Förderungsauszahlung oder Rückforderung. Kostenbasis, zulässige Förderpositionen, Einzelwohnungszuordnung, Härte und Wirksamkeit separat. Keine erneute Anrechnung einmaliger Kostenbeiträge oder früherer Mieterhöhungen. Gemeinsame exakte Zahlengrenzen nach NUMERIK.md. Fehlende Pflichteingaben EINGABE_FEHLT, unzulässige Typen/Bereiche EINGABE_UNGUELTIG.}
\value{wert enthält beide Monatsmodellwerte, die Summe jährlicher laufender Abzüge, den ausgewählten Monats-/Jahresbetrag und rechenweg. Auswahl begründet keine Bestätigung der rechtlichen Anwendbarkeit. Einheit: EUR.}
\references{BGB_PDF_SHA256_9b5a99536e7b00756e9fa5f20082bd9ad3951b37c381fc0f5d52aa5a556839eb; BGB_559_T0006, BGB_559_T0007, BGB_559_T0008, BGB_559a_T0002, BGB_559a_T0003, BGB_559a_T0004, BGB_559a_T0005}
\examples{
modernisierung_kappung_mit_laufenden_abzuegen(
  jahresbetrag_vor_laufenden_abzuegen = "560",
  jaehrliche_zinsermaessigung = "120",
  jaehrliche_laufende_zuschuesse_und_darlehen = "0",
  monatliche_restkappung = "30",
  abzugsreihenfolge = "abzug_vor_kappung",
  methodennachweis = paste0(
    "Synthetischer Test der ausdrücklich gewählten Rechenreihenfo",
    "lge; keine allgemeine Freigabe einer Rechtsauslegung."
  )
)
}
