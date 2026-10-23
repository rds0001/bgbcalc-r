% Automatisch aus Fachverträgen erzeugt; fachliche Freigabe bleibt separat.
\name{fortsetzung_interne_schuldanteile}
\alias{fortsetzung_interne_schuldanteile}
\title{fortsetzung interne schuldanteile}
\description{Feste lokale BGB-Fassung; gesetzlicher Anwendungsbereich und externe Bewertungen ausdrücklich vorqualifiziert.}
\usage{fortsetzung_interne_schuldanteile(
  gesamtgutschuld = NULL,
  abkoemmlinge = NULL,
  haftungsnachweis = NULL
)}
\arguments{
\item{gesamtgutschuld}{Qualifizierte unter1504fallende Gesamtgutschuld.}
\item{abkoemmlinge}{Nichtleere Liste mit abkoemmling_id und positivem anteil_gesamtgut; vollstaendige haftende Gruppe, Anteilssumme hoechstens eins.}
\item{haftungsnachweis}{Haftung1480, Anteilswerte und gegenstaendliche Beschraenkung1504/1990/1991 rechtlich bestimmen.}
}
\details{Gesamtgutschuld intern nach relativen qualifizierten Gesamtgutsanteilen verteilen; gegenstaendliche Haftungsgrenze nicht in Gelddeckel umdeuten. §1504 interne Verteilung der qualifizierten Gesamtgutschuld nach relativer Groesse der Gesamtgutsanteile der anteilsberechtigten Abkoemmlinge. Vorhandenen exakten Beguenstigten-Gewichtskern rein rechnerisch wiederverwenden; keine Anwendung1503III auf Glaeubigerschulden behaupten. Die Verpflichtung beschraenkt sich auf zugeteilte Gegenstaende: kein pauschaler Gelddeckel in Hoehe ihres Schaetzwerts und keine allgemeine persoenliche Nachschusspflicht. Ergebnis ist interne Schuldzuordnung vor gegenstaendlicher Vollstreckungs-/Haftungspruefung, kein bezifferter individuell durchsetzbarer Zahlungsanspruch. Keine automatische Ausfallumlage. Gemeinsame exakte Zahlengrenzen nach NUMERIK.md. Fehlende Pflichteingaben EINGABE_FEHLT, unzulässige Typen/Bereiche EINGABE_UNGUELTIG.}
\value{Liste abkoemmling_id und interner_schuldanteil, keine Aussage ueber persoenlich durchsetzbaren Geldbetrag. Einheit: EUR.}
\references{BGB_PDF_SHA256_9b5a99536e7b00756e9fa5f20082bd9ad3951b37c381fc0f5d52aa5a556839eb; BGB_1480_T0001, BGB_1480_T0002, BGB_1504_T0001, BGB_1504_T0002, BGB_1990_T0001, BGB_1990_T0002, BGB_1990_T0003, BGB_1991_T0001, BGB_1991_T0002, BGB_1991_T0003, BGB_1991_T0004}
\examples{
fortsetzung_interne_schuldanteile(
  gesamtgutschuld = "120",
  abkoemmlinge = list(
    list(
    "abkoemmling_id" = "A",
    "anteil_gesamtgut" = list(
    "zaehler" = "1",
    "nenner" = "8"
  )
  ),
    list(
    "abkoemmling_id" = "B",
    "anteil_gesamtgut" = list(
    "zaehler" = "3",
    "nenner" = "8"
  )
  )
  ),
  haftungsnachweis = paste0(
    "§1504 interne Verteilung der qualifizierten Gesamtgutschuld ",
    "nach relativer Groesse der Gesamtgutsanteile der anteilsbere",
    "chtigten Abkoemmlinge. Vorhandenen exakten Beguenstigten-Gew",
    "ichtskern rein rechnerisch wiederverwenden; keine Anwendung1",
    "503III auf Glaeubigerschulden behaupten. Die Verpflichtung b",
    "eschraenkt sich auf zugeteilte Gegenstaende: kein pauschaler",
    " Gelddeckel in Hoehe ihres Schaetzwerts und keine allgemeine",
    " persoenliche Nachschusspflicht. Ergebnis ist interne Schuld",
    "zuordnung vor gegenstaendlicher Vollstreckungs-/Haftungsprue",
    "fung, kein bezifferter individuell durchsetzbarer Zahlungsan",
    "spruch. Keine automatische Ausfallumlage."
  )
)
}
