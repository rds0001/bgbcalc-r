% Automatisch aus Fachverträgen erzeugt; fachliche Freigabe bleibt separat.
\name{betreuung_numerische_wertgrenze}
\alias{betreuung_numerische_wertgrenze}
\title{betreuung numerische wertgrenze}
\description{Feste lokale BGB-Fassung; gesetzlicher Anwendungsbereich und externe Bewertungen ausdrücklich vorqualifiziert.}
\usage{betreuung_numerische_wertgrenze(
  grenzfall = NULL,
  massgeblicher_gesamtwert = NULL,
  einordnungsnachweis = NULL
)}
\arguments{
\item{grenzfall}{zahlungsanspruch_1849 (3000EUR),vergleichsgegenstand_1854 (6000EUR) oder vermoegenswert_1860 (6000EUR).}
\item{massgeblicher_gesamtwert}{Rechtlich maßgeblicher nichtnegativer Euro-Gesamtwert.1849:aus dem Recht folgender ganzer Zahlungsanspruch,nicht nur Teilverfügung;1854:in Geld schätzbarer Streit-/Ungewissheitsgegenstand;1860:Vermögenswert ohne Immobilien und ohne Schuldenabzug.}
\item{einordnungsnachweis}{Nichtleerer Nachweis der zutreffenden Wertbasis und Fallzuordnung. Bei1860 kann betreuung_vermoegenswert_ohne_immobilien vorgeschaltet werden.}
}
\details{Qualifizierten betreuungsrechtlichen Gesamtwert mit gesetzlicher3000-/6000-Euro-Grenze einschließlich Gleichheit vergleichen. Nur numerische Höchstwertvergleiche1849II1a,1854Nr6 und1860I: nicht mehr als/nicht übersteigt schließt Gleichheit ein. Keine automatische Genehmigungsfreiheit oder gerichtliche Befreiung.1849III-Ausnahmen insbesondere gesperrte Geldanlage/Wertpapiereinlösung gesondert;1854 gerichtlicher Vergleichsvorschlag eigener Ausnahmeweg;1860 Antrag, Ermessen und Gefährdungsprüfung gesondert. Für1849 nicht bloß aktuell abgehobenen Teilbetrag verwenden; für1860 keine Verbindlichkeiten vom Nichtimmobilienvermögen abziehen. Gemeinsame exakte Zahlengrenzen nach NUMERIK.md. Fehlende Pflichteingaben EINGABE_FEHLT, unzulässige Typen/Bereiche EINGABE_UNGUELTIG.}
\value{wert.wertgrenze und ueberschreitungsbetrag als exakte Eurobrüche; wertgrenze_eingehalten als Wahrheitswert. Einheit: EUR_und_wahrheitswert.}
\references{BGB_PDF_SHA256_9b5a99536e7b00756e9fa5f20082bd9ad3951b37c381fc0f5d52aa5a556839eb; BGB_1849_T0006, BGB_1849_T0007, BGB_1849_T0008, BGB_1849_T0009, BGB_1849_T0010, BGB_1849_T0011, BGB_1849_T0012, BGB_1849_T0013, BGB_1849_T0014, BGB_1849_T0015, BGB_1849_T0016, BGB_1849_T0017, BGB_1849_T0018, BGB_1849_T0019, BGB_1854_T0007, BGB_1860_T0001}
\examples{
betreuung_numerische_wertgrenze(
  grenzfall = "zahlungsanspruch_1849",
  massgeblicher_gesamtwert = "3000",
  einordnungsnachweis = paste0(
    "Nur numerische Höchstwertvergleiche1849II1a,1854Nr6 und1860I",
    ": nicht mehr als/nicht übersteigt schließt Gleichheit ein. K",
    "eine automatische Genehmigungsfreiheit oder gerichtliche Bef",
    "reiung.1849III-Ausnahmen insbesondere gesperrte Geldanlage/W",
    "ertpapiereinlösung gesondert;1854 gerichtlicher Vergleichsvo",
    "rschlag eigener Ausnahmeweg;1860 Antrag, Ermessen und Gefähr",
    "dungsprüfung gesondert. Für1849 nicht bloß aktuell abgehoben",
    "en Teilbetrag verwenden; für1860 keine Verbindlichkeiten vom",
    " Nichtimmobilienvermögen abziehen."
  )
)
}
