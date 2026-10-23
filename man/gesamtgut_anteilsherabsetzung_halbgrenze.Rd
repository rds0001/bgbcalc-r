% Automatisch aus Fachverträgen erzeugt; fachliche Freigabe bleibt separat.
\name{gesamtgut_anteilsherabsetzung_halbgrenze}
\alias{gesamtgut_anteilsherabsetzung_halbgrenze}
\title{gesamtgut anteilsherabsetzung halbgrenze}
\description{Feste lokale BGB-Fassung; gesetzlicher Anwendungsbereich und externe Bewertungen ausdrücklich vorqualifiziert.}
\usage{gesamtgut_anteilsherabsetzung_halbgrenze(
  ungekuerzter_anteilswert = NULL,
  angeordneter_anteilswert = NULL,
  einordnungsnachweis = NULL
)}
\arguments{
\item{ungekuerzter_anteilswert}{Rechtlich gebührender ungekürzter Anteil am Gesamtgut bei Beendigung der fortgesetzten Gütergemeinschaft, in Euro unter zutreffendem Bewertungsmaßstab.}
\item{angeordneter_anteilswert}{Aus der qualifizierten letztwilligen Herabsetzung resultierender Anteil, unter demselben Maßstab in Euro; höchstens ungekürzter Anteil.}
\item{einordnungsnachweis}{Nichtleerer Nachweis des1512-Falls, anteilsberechtigtem Abkömmling und gleichen Bewertungsgrundlagen. Keine automatische Testamentsauslegung.}
}
\details{Hälfte des ungekürzten Gesamtgutsanteils berechnen, angeordnete Herabsetzung und Unterschreitung dieser Grenze ausweisen. §1512: ungekürzten gebührenden Anteil halbieren und angeordneten Wert mit dieser Untergrenze vergleichen. Angeordnete Minderung und positive Grenzunterschreitung getrennt ausweisen. Keine automatische Anhebung einer unwirksamen Anordnung, keine Vermögensbewertung oder Verteilung des freiwerdenden Anteils auf andere Beteiligte. Pflichtteil, Ausschluss1511, Erb-/Gesamtgutsquote und Wirksamkeit der Verfügung gesondert. Gemeinsame exakte Zahlengrenzen nach NUMERIK.md. Fehlende Pflichteingaben EINGABE_FEHLT, unzulässige Typen/Bereiche EINGABE_UNGUELTIG.}
\value{wert.halbe_anteilsuntergrenze, angeordneter_minderungsbetrag und unterschreitungsbetrag als exakte Eurobrüche; halbgrenze_eingehalten als Wahrheitswert. Einheit: EUR_und_wahrheitswert.}
\references{BGB_PDF_SHA256_9b5a99536e7b00756e9fa5f20082bd9ad3951b37c381fc0f5d52aa5a556839eb; BGB_1512_T0001}
\examples{
gesamtgut_anteilsherabsetzung_halbgrenze(
  ungekuerzter_anteilswert = "100",
  angeordneter_anteilswert = "60",
  einordnungsnachweis = paste0(
    "§1512: ungekürzten gebührenden Anteil halbieren und angeordn",
    "eten Wert mit dieser Untergrenze vergleichen. Angeordnete Mi",
    "nderung und positive Grenzunterschreitung getrennt ausweisen",
    ". Keine automatische Anhebung einer unwirksamen Anordnung, k",
    "eine Vermögensbewertung oder Verteilung des freiwerdenden An",
    "teils auf andere Beteiligte. Pflichtteil, Ausschluss1511, Er",
    "b-/Gesamtgutsquote und Wirksamkeit der Verfügung gesondert."
  )
)
}
