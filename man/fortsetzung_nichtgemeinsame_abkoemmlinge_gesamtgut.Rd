% Automatisch aus Fachverträgen erzeugt; fachliche Freigabe bleibt separat.
\name{fortsetzung_nichtgemeinsame_abkoemmlinge_gesamtgut}
\alias{fortsetzung_nichtgemeinsame_abkoemmlinge_gesamtgut}
\title{fortsetzung nichtgemeinsame abkoemmlinge gesamtgut}
\description{Feste lokale BGB-Fassung; gesetzlicher Anwendungsbereich und externe Bewertungen ausdrücklich vorqualifiziert.}
\usage{fortsetzung_nichtgemeinsame_abkoemmlinge_gesamtgut(
  teilungsfaehiges_gesamtgut = NULL,
  erbquoten_nichtgemeinsamer_abkoemmlinge = NULL,
  einordnungsnachweis = NULL
)}
\arguments{
\item{teilungsfaehiges_gesamtgut}{Nichtnegativer Netto-Teilungswert des ursprünglichen Gesamtguts in EUR nach gesonderter Schuldenberichtigung, Rückbehalten und internen Ausgleichspositionen. Gesetzlicher hälftiger Teilungsfall nach §1476I.}
\item{erbquoten_nichtgemeinsamer_abkoemmlinge}{Liste0..1000 eindeutiger Objekte mit abkoemmling_id und erbquote. Rechtlich bestimmte Erbquoten am hypothetischen Nachlass ohne Fortsetzung; keine Quote am gesamten Gesamtgut. Summe höchstens1. Erbquoten können durch vorhandene Erbquotenfunktionen vorbereitet werden.}
\item{einordnungsnachweis}{Nichtleere Qualifikation von §1483II, gesetzlicher Halbteilung und vollständiger Liste der nichtgemeinschaftlichen Abkömmlinge; keine abweichende Teilungsregel.}
}
\details{Gesamtgut halbieren, nichtgemeinschaftliche Erbquoten auf Nachlasshälfte anwenden und Gesamtgutrest bestimmen. §1483II: ursprünglichen, bereits bereinigten Gesamtgutwert hälftig dem hypothetischen Nachlass zuordnen; Erbquoten der nichtgemeinschaftlichen Abkömmlinge auf diese Hälfte anwenden und aus dem Gesamtgut herausrechnen. Nur Gesamtgutkomponente ihrer Erbteile; Sondergut/Vorbehaltsgut und sonstige Nachlasspositionen gesondert. Keine automatische Güterstands-, Abstammungs-, Erbquoten- oder Bewertungsentscheidung. Keine erneute Schuldenberichtigung bereits bereinigter Werte, kein negativer Nachlass und keine pauschale Kappung tatsächlicher Außenhaftung. Abweichende ehevertragliche Teilungsverhältnisse nicht mit Halbteilung vermischen. Gemeinsame exakte Zahlengrenzen nach NUMERIK.md. Fehlende Pflichteingaben EINGABE_FEHLT, unzulässige Typen/Bereiche EINGABE_UNGUELTIG.}
\value{wert enthält hypothetischer_nachlassanteil_gesamtgut, herauszurechnende_anteile mit abkoemmling_id/betrag, herauszurechnender_gesamtbetrag und verbleibendes_gesamtgut. Geldwerte als exakte EUR-Brüche. Einheit: EUR.}
\references{BGB_PDF_SHA256_9b5a99536e7b00756e9fa5f20082bd9ad3951b37c381fc0f5d52aa5a556839eb; BGB_1483_T0004, BGB_1476_T0001}
\examples{
fortsetzung_nichtgemeinsame_abkoemmlinge_gesamtgut(
  teilungsfaehiges_gesamtgut = "1000",
  erbquoten_nichtgemeinsamer_abkoemmlinge = list(
    list(
    "abkoemmling_id" = "A",
    "erbquote" = list(
    "zaehler" = "3",
    "nenner" = "8"
  )
  )
  ),
  einordnungsnachweis = paste0(
    "§1483II: ursprünglichen, bereits bereinigten Gesamtgutwert h",
    "älftig dem hypothetischen Nachlass zuordnen; Erbquoten der n",
    "ichtgemeinschaftlichen Abkömmlinge auf diese Hälfte anwenden",
    " und aus dem Gesamtgut herausrechnen. Nur Gesamtgutkomponent",
    "e ihrer Erbteile; Sondergut/Vorbehaltsgut und sonstige Nachl",
    "asspositionen gesondert. Keine automatische Güterstands-, Ab",
    "stammungs-, Erbquoten- oder Bewertungsentscheidung. Keine er",
    "neute Schuldenberichtigung bereits bereinigter Werte, kein n",
    "egativer Nachlass und keine pauschale Kappung tatsächlicher ",
    "Außenhaftung. Abweichende ehevertragliche Teilungsverhältnis",
    "se nicht mit Halbteilung vermischen."
  )
)
}
