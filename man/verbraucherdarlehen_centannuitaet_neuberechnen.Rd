% Automatisch aus Fachverträgen erzeugt; fachliche Freigabe bleibt separat.
\name{verbraucherdarlehen_centannuitaet_neuberechnen}
\alias{verbraucherdarlehen_centannuitaet_neuberechnen}
\title{verbraucherdarlehen centannuitaet neuberechnen}
\description{Feste lokale BGB-Fassung; gesetzlicher Anwendungsbereich und externe Bewertungen ausdrücklich vorqualifiziert.}
\usage{verbraucherdarlehen_centannuitaet_neuberechnen(
  anfangskapital = NULL,
  korrigierter_periodenzinssatz = NULL,
  anzahl_teilzahlungen = NULL,
  geschuldete_kosten_je_teilzahlung = NULL,
  rundungsmodus = NULL,
  plannachweis = NULL
)}
\arguments{
\item{anfangskapital}{Nichtnegativer centgenauer Anfangsbetrag.}
\item{korrigierter_periodenzinssatz}{Vorzeichenbehaftete Quote je gleich langer Zinsperiode; größer als-1. Aus korrigierter Jahresquote und belegter Zinskonvention bestimmen.}
\item{anzahl_teilzahlungen}{Anzahl1..1000; nachschüssige Zahlungen, keine zusätzlichen Auszahlungen.}
\item{geschuldete_kosten_je_teilzahlung}{Centgenaue, nicht kapitalisierte Zusatzkosten je Termin nach494IV; keine erneute Berechnung des Effektivzinses.}
\item{rundungsmodus}{Zwingend vertraglich qualifiziert: kaufmaennisch oder gerade; Periodenzinsen auf Cent.}
\item{plannachweis}{Belegt konstante Kapitaldienstrate mit letzter Ausgleichszahlung, Centzinsen je Periode und getrennte Zusatzkosten. Kein gesetzlicher Standard für alle Verträge.}
}
\details{Kleinste centgenaue nachschüssige Kapitaldienstrate durch monotone Suche bestimmen; Zinsen und Restschulden je Periode mit vorgegebener Rundung fortschreiben. Bedingter vertraglicher Annuitätenplan für494V, kein gesetzlich vorgeschriebenes Universalmodell. Bestehenden exakten Rundungskern verwenden. Durch monotone ganzzahlige Intervallsuche kleinste centgenaue Kapitaldienstrate bestimmen, die das Kapital bis zum letzten Termin tilgt. Jede Periode Zins=Anfangssaldo*Periodenquote aufCent runden; Zahlung=min(Regelrate,Saldo+Zins), danach Saldo fortschreiben. Letzte Zahlung kann kleiner sein; bei frühzeitiger Tilgung weitere Kapitaldienstraten0. Explizite gleichbleibende Zusatzkosten separat addieren. Keine Potenz riesiger Brüche, keine Näherungstoleranz, keine Kapitalisierung von Kosten oder Änderung der vorgegebenen Laufzeit. Negative korrigierte Zinsen sind mathematische Rechenwerte, keine automatische rechtliche Pflicht des Darlehensgebers. Nicht erfasst: vorschüssige Zahlung, variable Perioden oder abweichende Rundungs-/Gebührenstruktur; diese Vertragsmodelle nicht stillschweigend ersetzen. Gemeinsame exakte Zahlengrenzen nach NUMERIK.md. Fehlende Pflichteingaben EINGABE_FEHLT, unzulässige Typen/Bereiche EINGABE_UNGUELTIG.}
\value{Regelmäßiger Kapitaldienst, vollständiger gerundeter Plan mit gegebenenfalls kleinerer Schlussrate, Zins-/Zahlungssummen und Nullrest. Einheit: EUR.}
\references{BGB_PDF_SHA256_9b5a99536e7b00756e9fa5f20082bd9ad3951b37c381fc0f5d52aa5a556839eb; BGB_494_T0001, BGB_494_T0002, BGB_494_T0003, BGB_494_T0004, BGB_494_T0005, BGB_494_T0006, BGB_494_T0007, BGB_494_T0008, BGB_494_T0009, BGB_494_T0010, BGB_494_T0011}
\examples{
verbraucherdarlehen_centannuitaet_neuberechnen(
  anfangskapital = "100",
  korrigierter_periodenzinssatz = "0.1",
  anzahl_teilzahlungen = 2,
  geschuldete_kosten_je_teilzahlung = "0",
  rundungsmodus = "kaufmaennisch",
  plannachweis = paste0(
    "Bedingter vertraglicher Annuitätenplan für494V, kein gesetzl",
    "ich vorgeschriebenes Universalmodell. Bestehenden exakten Ru",
    "ndungskern verwenden. Durch monotone ganzzahlige Intervallsu",
    "che kleinste centgenaue Kapitaldienstrate bestimmen, die das",
    " Kapital bis zum letzten Termin tilgt. Jede Periode Zins=Anf",
    "angssaldo*Periodenquote aufCent runden; Zahlung=min(Regelrat",
    "e,Saldo+Zins), danach Saldo fortschreiben. Letzte Zahlung ka",
    "nn kleiner sein; bei frühzeitiger Tilgung weitere Kapitaldie",
    "nstraten0. Explizite gleichbleibende Zusatzkosten separat ad",
    "dieren. Keine Potenz riesiger Brüche, keine Näherungstoleran",
    "z, keine Kapitalisierung von Kosten oder Änderung der vorgeg",
    "ebenen Laufzeit. Negative korrigierte Zinsen sind mathematis",
    "che Rechenwerte, keine automatische rechtliche Pflicht des D",
    "arlehensgebers. Nicht erfasst: vorschüssige Zahlung, variabl",
    "e Perioden oder abweichende Rundungs-/Gebührenstruktur; dies",
    "e Vertragsmodelle nicht stillschweigend ersetzen."
  )
)
}
