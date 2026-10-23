% Automatisch aus Fachverträgen erzeugt; fachliche Freigabe bleibt separat.
\name{waermelieferung_kosten_und_nutzungsgradgrenzen}
\alias{waermelieferung_kosten_und_nutzungsgradgrenzen}
\title{waermelieferung kosten und nutzungsgradgrenzen}
\description{Feste lokale BGB-Fassung; rechtlichen Anwendungsbereich und Bewertungen ausdrücklich bestimmen.}
\usage{waermelieferung_kosten_und_nutzungsgradgrenzen(
  bisherige_betriebskosten = NULL,
  neue_waermelieferkosten = NULL,
  jahresnutzungsgrad_prozent = NULL,
  einordnungsnachweis = NULL
)}
\arguments{
\item{bisherige_betriebskosten}{Nichtnegativer exakter Dezimaltext/Bruch; Kosten/Miete in identischer Einheit und Periode, Jahresnutzungsgrad ausdrücklich in Prozentpunkten.}
\item{neue_waermelieferkosten}{Nichtnegativer exakter Dezimaltext/Bruch; Kosten/Miete in identischer Einheit und Periode, Jahresnutzungsgrad ausdrücklich in Prozentpunkten.}
\item{jahresnutzungsgrad_prozent}{Nichtnegativer exakter Dezimaltext/Bruch; Kosten/Miete in identischer Einheit und Periode, Jahresnutzungsgrad ausdrücklich in Prozentpunkten.}
\item{einordnungsnachweis}{Nichtleerer Nachweis zu maßgeblicher Vergleichsbasis und rechtlicher Einordnung; keine Gesamtentscheidung allein aus Zahlen.}
}
\details{Neue und bisherige Wärmekosten vergleichen; Jahresnutzungsgrad mit80Prozent vergleichen. Nur numerische Teilbedingungen nach556cI. Kosten für denselben rechtlich maßgeblichen Vergleichszeitraum und Versorgungsumfang vorqualifizieren; keine eigenständige Berechnung nach externer Wärmelieferverordnung. Nutzungsgrad in Prozentpunkten,80 bedeutet80Prozent; keine automatische Bewertung der Anlage oder verbesserter Betriebsführung. Grenzwerte einschließlich Gleichheit. Ergebnis entscheidet nicht sämtliche Voraussetzungen der Kostenumlage; Ankündigung556cII separat. Nichtnegative Eingaben; Kostendifferenz kann negativ sein. Keine automatische Rundung.}
\value{wert enthält kostendifferenz, kostenneutralitaetsgrenze_eingehalten, nutzungsgradgrenze_erreicht. Beträge als exakte Brüche, Anzahlen als Ganzzahlen, Vergleiche als Wahrheitswerte. Einheit: zahlen_und_wahrheitswerte.}
\references{BGB_PDF_SHA256_9b5a99536e7b00756e9fa5f20082bd9ad3951b37c381fc0f5d52aa5a556839eb; BGB_556c_T0001, BGB_556c_T0002, BGB_556c_T0003, BGB_556c_T0004, BGB_556c_T0005, BGB_556c_T0006, BGB_556c_T0007, BGB_556c_T0008}
\examples{
waermelieferung_kosten_und_nutzungsgradgrenzen(
  bisherige_betriebskosten = "100",
  neue_waermelieferkosten = "100",
  jahresnutzungsgrad_prozent = "80",
  einordnungsnachweis = paste0(
    "Nur numerische Teilbedingungen nach556cI. Kosten für denselb",
    "en rechtlich maßgeblichen Vergleichszeitraum und Versorgungs",
    "umfang vorqualifizieren; keine eigenständige Berechnung nach",
    " externer Wärmelieferverordnung. Nutzungsgrad in Prozentpunk",
    "ten,80 bedeutet80Prozent; keine automatische Bewertung der A",
    "nlage oder verbesserter Betriebsführung. Grenzwerte einschli",
    "eßlich Gleichheit. Ergebnis entscheidet nicht sämtliche Vora",
    "ussetzungen der Kostenumlage; Ankündigung556cII separat."
  )
)
}
