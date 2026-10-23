% Automatisch aus Fachverträgen erzeugt; fachliche Freigabe bleibt separat.
\name{mietpreisbremse_rueckzahlungsbetraege}
\alias{mietpreisbremse_rueckzahlungsbetraege}
\title{mietpreisbremse rueckzahlungsbetraege}
\description{Feste lokale BGB-Fassung; gesetzlicher Anwendungsbereich und externe Bewertungen ausdrücklich vorqualifiziert.}
\usage{mietpreisbremse_rueckzahlungsbetraege(
  ruegezugang_utc = NULL,
  rueckforderung_auf_spaetere_faelligkeit_beschraenkt = NULL,
  mietabschnitte = NULL,
  bereits_erstatteter_betrag = NULL,
  einordnungsnachweis = NULL
)}
\arguments{
\item{ruegezugang_utc}{Rechtlich wirksamer Rügezugang als ausreichend genauer UTC-SekundenzeitpunktYYYY-MM-DDTHH:MM:SSZ.}
\item{rueckforderung_auf_spaetere_faelligkeit_beschraenkt}{Wahrheitswert des qualifizierten556gII3-Falls: Rüge mehr als30Monate nach Mietbeginn oder Mietverhältnis bei Zugang bereits beendet. Diese zeitlichen Rechtsvoraussetzungen hier bereits geprüft.}
\item{mietabschnitte}{Liste0..1000 mit genau abschnitt_id, faelligkeit_utc, tatsaechlich_gezahlte_miete und zulaessige_miete(EUR). Jeder sachlich getrennte Mietabschnitt einmal, alle Teilzahlungen desselben Abschnitts zuvor zusammenfassen; zutreffende556d–g-Mietgrenze.}
\item{bereits_erstatteter_betrag}{Auf die hier berechnete Rückforderung bereits geleistete Erstattung in Euro;0bei keiner Erstattung, nicht zu anderen Abschnitten gehörige Zahlungen.}
\item{einordnungsnachweis}{Nichtleerer Nachweis wirksamer Rüge/Form/Auskunftsbezug, örtlicher/zeitlicher556d–g-Anwendung, Beschränkung nach556gII und richtiger Abschnittsbeträge/Fälligkeit.}
}
\details{Mietüberzahlungen nach qualifizierter Rüge-Fälligkeitsbeschränkung auswählen, abschnittsweise positive Differenzen summieren und geleistete Erstattung abziehen. §556gI/II: je qualifiziertem Mietabschnitt positive Differenz aus tatsächlich gezahlter und zulässiger Miete. Im Beschränkungsfall nur nach Rügezugang fällig gewordene Miete auswählen; Zahlungsdatum ersetzt Fälligkeit nicht. Bei identischem qualifiziertem Zeitpunkt liegt keine spätere Fälligkeit vor. Ausgewählte Überzahlungen addieren und zugehörige Erstattung bis auf null abziehen. Keine Verrechnung einer Unterzahlung in einem anderen Abschnitt, keine automatische Zins-/Verjährungsrechnung.30Monatsgrenze und Beendigung bei Rüge sind hier vorqualifiziert, nicht als automatisch gelöste Fristableitung ausgeben. Kein Aufsummieren mehrerer Vollmietgrenzen für Teilzahlungen desselben Abschnitts. UTC-Sekunden nur bei ausreichend genauer Normalisierung. Gemeinsame exakte Zahlengrenzen nach NUMERIK.md. Fehlende Pflichteingaben EINGABE_FEHLT, unzulässige Typen/Bereiche EINGABE_UNGUELTIG.}
\value{wert.beruecksichtigte_abschnitt_ids in Eingabereihenfolge; ueberzahlung_vor_erstattung und verbleibender_rueckzahlungsbetrag als exakte Eurobrüche. Einheit: EUR.}
\references{BGB_PDF_SHA256_9b5a99536e7b00756e9fa5f20082bd9ad3951b37c381fc0f5d52aa5a556839eb; BGB_556g_T0001, BGB_556g_T0002, BGB_556g_T0003, BGB_556g_T0004, BGB_556g_T0013, BGB_556g_T0014, BGB_556g_T0015}
\examples{
mietpreisbremse_rueckzahlungsbetraege(
  ruegezugang_utc = "2024-02-01T00:00:00Z",
  rueckforderung_auf_spaetere_faelligkeit_beschraenkt = TRUE,
  mietabschnitte = list(
    list(
    "abschnitt_id" = "Januar",
    "faelligkeit_utc" = "2024-01-01T00:00:00Z",
    "tatsaechlich_gezahlte_miete" = "1100",
    "zulaessige_miete" = "1000"
  ),
    list(
    "abschnitt_id" = "Februar",
    "faelligkeit_utc" = "2024-02-01T00:00:00Z",
    "tatsaechlich_gezahlte_miete" = "1050",
    "zulaessige_miete" = "1000"
  ),
    list(
    "abschnitt_id" = "Maerz",
    "faelligkeit_utc" = "2024-03-01T00:00:00Z",
    "tatsaechlich_gezahlte_miete" = "1200",
    "zulaessige_miete" = "1000"
  )
  ),
  bereits_erstatteter_betrag = "0",
  einordnungsnachweis = paste0(
    "§556gI/II: je qualifiziertem Mietabschnitt positive Differen",
    "z aus tatsächlich gezahlter und zulässiger Miete. Im Beschrä",
    "nkungsfall nur nach Rügezugang fällig gewordene Miete auswäh",
    "len; Zahlungsdatum ersetzt Fälligkeit nicht. Bei identischem",
    " qualifiziertem Zeitpunkt liegt keine spätere Fälligkeit vor",
    ". Ausgewählte Überzahlungen addieren und zugehörige Erstattu",
    "ng bis auf null abziehen. Keine Verrechnung einer Unterzahlu",
    "ng in einem anderen Abschnitt, keine automatische Zins-/Verj",
    "ährungsrechnung.30Monatsgrenze und Beendigung bei Rüge sind ",
    "hier vorqualifiziert, nicht als automatisch gelöste Fristabl",
    "eitung ausgeben. Kein Aufsummieren mehrerer Vollmietgrenzen ",
    "für Teilzahlungen desselben Abschnitts. UTC-Sekunden nur bei",
    " ausreichend genauer Normalisierung."
  )
)
}
