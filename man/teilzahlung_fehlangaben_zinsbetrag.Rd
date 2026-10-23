% Automatisch aus Fachverträgen erzeugt; fachliche Freigabe bleibt separat.
\name{teilzahlung_fehlangaben_zinsbetrag}
\alias{teilzahlung_fehlangaben_zinsbetrag}
\title{teilzahlung fehlangaben zinsbetrag}
\description{Feste lokale BGB-Fassung; gesetzlicher Anwendungsbereich und externe Bewertungen ausdrücklich vorqualifiziert.}
\usage{teilzahlung_fehlangaben_zinsbetrag(
  massgeblicher_barzahlungspreis = NULL,
  vertraglicher_zinssatz_prozent = NULL,
  zeitanteil_zaehler = NULL,
  zeitanteil_nenner = NULL,
  zeitanteil_nachweis = NULL,
  einordnungsnachweis = NULL
)}
\arguments{
\item{massgeblicher_barzahlungspreis}{Barzahlungspreis, bei fehlender Angabe rechtlich massgeblicher Marktpreis507II4; nicht Gesamtbetrag einschliesslich Finanzierungskosten.}
\item{vertraglicher_zinssatz_prozent}{Rechtlich massgeblicher nichtnegativer vertraglicher Jahreszins in Prozent;0.5bedeutet0.5Prozent.}
\item{zeitanteil_zaehler}{Zaehler des rechtlich qualifizierten Jahresanteils.}
\item{zeitanteil_nenner}{Positiver Nenner des rechtlich qualifizierten Jahresanteils.}
\item{zeitanteil_nachweis}{Belegte vertragliche Zeitkonvention und unveraenderte Zinsbasis im Abschnitt.}
\item{einordnungsnachweis}{507II3fehlende Gesamtbetrags-/Effektivzinsangabe und Heilung durch Uebergabe/Leistung qualifizieren; keine doppelte Erfassung bereits gezahlter/weggefallener Zinsen.}
}
\details{Vertraglichen Jahreszinssatz auf vier Prozent begrenzen und vorhandenen exakten Zinskern auf qualifizierten Barzahlungs-/Marktpreis anwenden. §507II3: Barzahlungspreis hoechstens mit gesetzlichem246-Jahreszinssatz4Prozent verzinsen. Niedrigerer rechtlich geschuldeter Vertragszins bleibt niedriger, keine Erhoehung auf4Prozent. Bei fehlendem Barzahlungspreis den rechtlich bewerteten Marktpreis nachII4 als gleiche Basis eingeben. Bestehender exakter Zinskern mit min(Vertragszins,4) wird verwendet. Abschnitt mit unveraenderter Basis und belegtem Jahresanteil; Raten-/Tilgungsplaene nach Vertrag abschnittsweise, kein erfundenes Annuitaetenmodell. Nicht die Gesamtbetragskorrektur bei zu niedrig angegebenem Effektivzins507II5 und nicht494II.507III-Kostenermaessigung verwendet246als qualifizierte Zinsbasis in vorhandenen501-Rechenwegen; Vorfaelligkeitsentschaedigung dort ausgeschlossen. Gemeinsame exakte Zahlengrenzen nach NUMERIK.md. Fehlende Pflichteingaben EINGABE_FEHLT, unzulässige Typen/Bereiche EINGABE_UNGUELTIG.}
\value{massgeblicher_zinssatz_prozent und exakter zinsbetrag des qualifizierten Abschnitts. Einheit: EUR_und_prozent.}
\references{BGB_PDF_SHA256_9b5a99536e7b00756e9fa5f20082bd9ad3951b37c381fc0f5d52aa5a556839eb; BGB_507_T0003, BGB_507_T0004, BGB_507_T0005, BGB_507_T0006, BGB_507_T0007, BGB_246_T0001}
\examples{
teilzahlung_fehlangaben_zinsbetrag(
  massgeblicher_barzahlungspreis = "1000",
  vertraglicher_zinssatz_prozent = "6",
  zeitanteil_zaehler = 1,
  zeitanteil_nenner = 2,
  zeitanteil_nachweis = paste0(
    "§507II3: Barzahlungspreis hoechstens mit gesetzlichem246-Jah",
    "reszinssatz4Prozent verzinsen. Niedrigerer rechtlich geschul",
    "deter Vertragszins bleibt niedriger, keine Erhoehung auf4Pro",
    "zent. Bei fehlendem Barzahlungspreis den rechtlich bewertete",
    "n Marktpreis nachII4 als gleiche Basis eingeben. Bestehender",
    " exakter Zinskern mit min(Vertragszins,4) wird verwendet. Ab",
    "schnitt mit unveraenderter Basis und belegtem Jahresanteil; ",
    "Raten-/Tilgungsplaene nach Vertrag abschnittsweise, kein erf",
    "undenes Annuitaetenmodell. Nicht die Gesamtbetragskorrektur ",
    "bei zu niedrig angegebenem Effektivzins507II5 und nicht494II",
    ".507III-Kostenermaessigung verwendet246als qualifizierte Zin",
    "sbasis in vorhandenen501-Rechenwegen; Vorfaelligkeitsentscha",
    "edigung dort ausgeschlossen."
  ),
  einordnungsnachweis = paste0(
    "§507II3: Barzahlungspreis hoechstens mit gesetzlichem246-Jah",
    "reszinssatz4Prozent verzinsen. Niedrigerer rechtlich geschul",
    "deter Vertragszins bleibt niedriger, keine Erhoehung auf4Pro",
    "zent. Bei fehlendem Barzahlungspreis den rechtlich bewertete",
    "n Marktpreis nachII4 als gleiche Basis eingeben. Bestehender",
    " exakter Zinskern mit min(Vertragszins,4) wird verwendet. Ab",
    "schnitt mit unveraenderter Basis und belegtem Jahresanteil; ",
    "Raten-/Tilgungsplaene nach Vertrag abschnittsweise, kein erf",
    "undenes Annuitaetenmodell. Nicht die Gesamtbetragskorrektur ",
    "bei zu niedrig angegebenem Effektivzins507II5 und nicht494II",
    ".507III-Kostenermaessigung verwendet246als qualifizierte Zin",
    "sbasis in vorhandenen501-Rechenwegen; Vorfaelligkeitsentscha",
    "edigung dort ausgeschlossen."
  )
)
}
