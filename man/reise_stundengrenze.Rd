% Automatisch aus Fachverträgen erzeugt; fachliche Freigabe bleibt separat.
\name{reise_stundengrenze}
\alias{reise_stundengrenze}
\title{reise stundengrenze}
\description{Feste lokale BGB-Fassung; rechtlichen Anwendungsbereich und Bewertungen ausdrücklich bestimmen.}
\usage{reise_stundengrenze(
  regelfall = NULL,
  zeitraum_von_utc = NULL,
  zeitraum_bis_utc = NULL,
  zeitnachweis = NULL
)}
\arguments{
\item{regelfall}{tagesreise_dauer, onlinebuchung_verbund, veranstalter_ruecktritt_kurzreise oder beherbergungsausnahme_vorabinformation.}
\item{zeitraum_von_utc}{Sekundengenauer qualifizierter UTC-Anfang YYYY-MM-DDTHH:MM:SSZ: Reisebeginn, Erstbuchungsbestätigung, Rücktrittszugang oder Vorabinformation je Normfall.}
\item{zeitraum_bis_utc}{Sekundengenaues qualifiziertes UTC-Ende desselben Intervalls: Reiseende, weiterer Vertragsschluss oder Reisebeginn je Normfall; nicht vor Anfang.}
\item{zeitnachweis}{Nichtleerer Nachweis des Normfalls und maßgeblicher UTC-Zeitpunkte; ursprüngliche Zeitzonen/Offsets rechtlich korrekt normalisiert, keine stillschweigende Sekundenrundung.}
}
\details{Zwei normalisierte UTC-Zeitpunkte mit Standard-Datumsbibliotheken voneinander abziehen; Zeitspanne mit86400Sekunden strikt oder einschließlich beziehungsweise172800Sekunden mindestens vergleichen. tagesreise_dauer:651aV2/651cIII, vom Reisebeginn bis Reiseende strikt weniger als24Stunden; fehlende Übernachtung und gegebenenfalls500EUR-Grenze separat. onlinebuchung_verbund:651cI3, Bestätigung des ersten Vertragsschlusses bis Abschluss des weiteren Vertrags höchstens24Stunden; Datenübermittlung/weitere Voraussetzungen separat. veranstalter_ruecktritt_kurzreise:651hIV1c, maßgeblicher Rücktrittszugang bis Reisebeginn mindestens48Stunden, nur qualifizierte Reisedauer unter zwei Tagen; möglicherweise frühere Vertragsfrist zusätzlich. beherbergungsausnahme_vorabinformation:651kV, qualifizierte Information an Veranstalter bis Reisebeginn mindestens48Stunden; persönliche Voraussetzungen und weitere Ausnahmen separat. Nur nachweislich auf volle Sekunden normalisierte UTC-Zeitpunkte; keine lokale Zeitzone erraten, Subsekunden nicht abschneiden. POSIX-Zeitrechnung ohne Schaltsekundendarstellung, keine Kalender-Tagesfrist in Stunden umdeuten. UTC-Jahre0001..9999, Sekunden00..59, keine Subsekunden/Schaltsekundendarstellung oder implizite Zeitzone. Dauer nichtnegativ und ganzzahlig.}
\value{wert: zeitspanne_sekunden, grenzdauer_sekunden (ganze Zahlen), vergleich und grenze_erfuellt. Einheit: sekunden_und_wahrheitswert.}
\references{BGB_PDF_SHA256_9b5a99536e7b00756e9fa5f20082bd9ad3951b37c381fc0f5d52aa5a556839eb; BGB_651a_T0020, BGB_651a_T0021, BGB_651a_T0022, BGB_651a_T0023, BGB_651c_T0001, BGB_651c_T0002, BGB_651c_T0003, BGB_651c_T0004, BGB_651c_T0006, BGB_651h_T0012, BGB_651h_T0013, BGB_651h_T0014, BGB_651h_T0015, BGB_651h_T0016, BGB_651h_T0017, BGB_651h_T0018, BGB_651k_T0011, BGB_651k_T0012, BGB_651k_T0013, BGB_651k_T0014, BGB_651k_T0015, BGB_651k_T0016, BGB_651k_T0017}
\examples{
reise_stundengrenze(
  regelfall = "tagesreise_dauer",
  zeitraum_von_utc = "2024-03-30T12:00:00Z",
  zeitraum_bis_utc = "2024-03-31T11:59:59Z",
  zeitnachweis = paste0(
    "Sekundengenaue maßgebliche UTC-Ereignisse, lokale Zeitzonen ",
    "rechtlich qualifiziert, keine Rundung."
  )
)
}
