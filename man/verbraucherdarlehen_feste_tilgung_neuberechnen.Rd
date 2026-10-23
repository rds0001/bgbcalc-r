% Automatisch aus Fachverträgen erzeugt; fachliche Freigabe bleibt separat.
\name{verbraucherdarlehen_feste_tilgung_neuberechnen}
\alias{verbraucherdarlehen_feste_tilgung_neuberechnen}
\title{verbraucherdarlehen feste tilgung neuberechnen}
\description{Feste lokale BGB-Fassung; gesetzlicher Anwendungsbereich und externe Bewertungen ausdrücklich vorqualifiziert.}
\usage{verbraucherdarlehen_feste_tilgung_neuberechnen(
  anfangskapital = NULL,
  korrigierter_sollzinssatz = NULL,
  teilzahlungen = NULL,
  plannachweis = NULL
)}
\arguments{
\item{anfangskapital}{Nichtnegatives anfängliches Kapital; keine erneuten Auszahlungen im Plan.}
\item{korrigierter_sollzinssatz}{Vorzeichenbehaftete Jahresquote nach494II/III bzw unveränderter Satz bei bloßem Kostenwegfall;0.04=4Prozent.}
\item{teilzahlungen}{Chronologische Liste1..1000 mit zahlung_id, kapitaltilgung, jahresanteil, vereinbarte_kosten, nicht_geschuldete_kosten. Kapitaltilgung ist die vertraglich feststehende reine Tilgung, kein bereits neuberechneter Gesamtzahlungsbetrag. Kosten werden nicht kapitalisiert.}
\item{plannachweis}{Beleg, dass feste Kapitaltilgungen trotz494-Neuberechnung fortbestehen; Zeitkonvention, Zahltermine, rechtliche Zinskorrektur und Kostenwegfall qualifizieren.}
}
\details{Kapitalsalden aus festen Tilgungen fortschreiben; korrigierte Abschnittszinsen und verbleibende Kosten zur neuen Teilzahlung addieren. 494V mit vertraglich unveränderten festen Kapitaltilgungen: jeden Anfangssaldo aus Anfangskapital und vorherigen Tilgungen selbst fortschreiben; Zins=Anfangssaldo*korrigierte Jahresquote*Jahresanteil, geschuldete Kosten=vereinbart-nichtgeschuldet, neue Teilzahlung=Tilgung+Zins+geschuldete Kosten. Summe der Tilgungen muss das Anfangskapital vollständig decken; keine Übertilgung. Negative mathematische Zinsen/Teilzahlungen sichtbar, keine automatische Zahlungspflicht des Darlehensgebers. Keine eigenständige gesetzliche Annuitätenannahme: Verträge mit gleichbleibender Gesamtrate oder verändertem Tilgungsverlauf werden hier nicht in feste Kapitaltilgungen umgedeutet. Jahresanteile und Vertragsstruktur müssen belegt sein; keine Effektivzinsberechnung, keine automatische Rundung, keine Zins-/Kostenkapitalisierung. Rechtliche Folgen494II/III separat in vorhandenen Zinsfunktionen berechnen. Gemeinsame exakte Zahlengrenzen nach NUMERIK.md. Fehlende Pflichteingaben EINGABE_FEHLT, unzulässige Typen/Bereiche EINGABE_UNGUELTIG.}
\value{Vollständige Teilzahlungsliste mit Anfangs-/Restsaldo, Tilgung, Zins, geschuldeten Kosten und neuer Rate; Summen und Restkapital. Einheit: EUR.}
\references{BGB_PDF_SHA256_9b5a99536e7b00756e9fa5f20082bd9ad3951b37c381fc0f5d52aa5a556839eb; BGB_494_T0001, BGB_494_T0002, BGB_494_T0003, BGB_494_T0004, BGB_494_T0005, BGB_494_T0006, BGB_494_T0007, BGB_494_T0008, BGB_494_T0009, BGB_494_T0010, BGB_494_T0011}
\examples{
verbraucherdarlehen_feste_tilgung_neuberechnen(
  anfangskapital = "1000",
  korrigierter_sollzinssatz = "0.04",
  teilzahlungen = list(
    list(
    "zahlung_id" = "A",
    "kapitaltilgung" = "500",
    "jahresanteil" = "0.5",
    "vereinbarte_kosten" = "10",
    "nicht_geschuldete_kosten" = "10"
  ),
    list(
    "zahlung_id" = "B",
    "kapitaltilgung" = "500",
    "jahresanteil" = "0.5",
    "vereinbarte_kosten" = "10",
    "nicht_geschuldete_kosten" = "0"
  )
  ),
  plannachweis = paste0(
    "494V mit vertraglich unveränderten festen Kapitaltilgungen: ",
    "jeden Anfangssaldo aus Anfangskapital und vorherigen Tilgung",
    "en selbst fortschreiben; Zins=Anfangssaldo*korrigierte Jahre",
    "squote*Jahresanteil, geschuldete Kosten=vereinbart-nichtgesc",
    "huldet, neue Teilzahlung=Tilgung+Zins+geschuldete Kosten. Su",
    "mme der Tilgungen muss das Anfangskapital vollständig decken",
    "; keine Übertilgung. Negative mathematische Zinsen/Teilzahlu",
    "ngen sichtbar, keine automatische Zahlungspflicht des Darleh",
    "ensgebers. Keine eigenständige gesetzliche Annuitätenannahme",
    ": Verträge mit gleichbleibender Gesamtrate oder verändertem ",
    "Tilgungsverlauf werden hier nicht in feste Kapitaltilgungen ",
    "umgedeutet. Jahresanteile und Vertragsstruktur müssen belegt",
    " sein; keine Effektivzinsberechnung, keine automatische Rund",
    "ung, keine Zins-/Kostenkapitalisierung. Rechtliche Folgen494",
    "II/III separat in vorhandenen Zinsfunktionen berechnen."
  )
)
}
