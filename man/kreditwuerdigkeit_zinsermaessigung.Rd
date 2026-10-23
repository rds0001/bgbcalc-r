% Automatisch aus Fachverträgen erzeugt; fachliche Freigabe bleibt separat.
\name{kreditwuerdigkeit_zinsermaessigung}
\alias{kreditwuerdigkeit_zinsermaessigung}
\title{kreditwuerdigkeit zinsermaessigung}
\description{Feste lokale BGB-Fassung; gesetzlicher Anwendungsbereich und externe Bewertungen ausdrücklich vorqualifiziert.}
\usage{kreditwuerdigkeit_zinsermaessigung(
  kapital = NULL,
  vertraglicher_sollzins_prozent = NULL,
  qualifizierter_marktzins_prozent = NULL,
  zinsart = NULL,
  marktzins_stichtag_am = NULL,
  zeitanteil_zaehler = NULL,
  zeitanteil_nenner = NULL,
  zeitanteil_nachweis = NULL,
  einordnungsnachweis = NULL
)}
\arguments{
\item{kapital}{Nichtnegatives Kapital des einheitlichen Zinsabschnitts in Euro.}
\item{vertraglicher_sollzins_prozent}{Vereinbarter jährlicher Sollzins in Prozent als exakte Zahl.}
\item{qualifizierter_marktzins_prozent}{Passender rechtlich bestimmter Marktzinssatz am maßgeblichen Stichtag; keine automatische Marktdatenabfrage.}
\item{zinsart}{gebunden oder veraenderlich. Gebunden: laufzeitpassender Pfandbriefmarkt; veränderlich: Euro-Dreimonats-Interbankenmarkt nach505dI.}
\item{marktzins_stichtag_am}{Datum des Vertragsschlusses beziehungsweise der vereinbarten Anpassung YYYY-MM-DD, für diesen Abschnitt rechtlich maßgeblich.}
\item{zeitanteil_zaehler}{Ganzzahliger Zähler des qualifizierten Jahresanteils.}
\item{zeitanteil_nenner}{Positiver ganzzahliger Nenner des qualifizierten Jahresanteils.}
\item{zeitanteil_nachweis}{Nichtleerer Nachweis von Zinsabschnitt und Jahresanteil; keine automatische365-/360-Tage-Konvention.}
\item{einordnungsnachweis}{Nichtleerer Nachweis der anwendbaren Zinsermäßigung505dI einschließlich Nichtvorliegens der AusnahmenI5/III und Herkunft/Stichtags-/Laufzeitpassung des Marktzinssatzes.}
}
\details{Sollzins auf kleineren qualifizierten Marktzinssatz begrenzen; bestehenden Zinskern für neuen und vertraglichen Abschnitt verwenden und Differenz bilden. §505dI1/2: bereits rechtlich feststehende Zinsermäßigung; numerisch kleinerer Vertrags-/Marktzinssatz, keine Zinserhöhung. Gebundener Sollzins: Markt für Hypothekenpfandbriefe/öffentliche Pfandbriefe mit entsprechender Bindungslaufzeit; veränderlicher Sollzins: Euro-Dreimonats-Interbankenmarkt. Marktwerte, Vertragsschluss und vereinbarte Anpassungsstichtage vorqualifizieren. Jeder homogene Kapital-/Zinsabschnitt separat; keine Tilgungsplan- oder Zinseszinsannahme. Vorzeichenbehaftete Ergebnisse sind rechnerische Zinsbeträge, kein automatisch festgestellter Zahlungsanspruch bei Negativzinsen. Eine rechtlich anzuwendende Zinsuntergrenze ist vorab in der qualifizierten Zinsgrundlage zu berücksichtigen und nachzuweisen; keine erfundene Nullgrenze. Ausnahmefälle505dI5/III nicht mit dieser Funktion berechnen. Keine automatische Kreditwürdigkeitsprüfung, Pflichtverletzungsentscheidung oder Marktdatenbeschaffung. Gemeinsame exakte Zahlengrenzen nach NUMERIK.md. Fehlende Pflichteingaben EINGABE_FEHLT, unzulässige Typen/Bereiche EINGABE_UNGUELTIG.}
\value{wert mit rechnerischer_sollzins_prozent, rechnerischer_zinsbetrag und rechnerische_zinsdifferenz jeweils als exakter Bruch. Einheit: EUR_und_prozent.}
\references{BGB_PDF_SHA256_9b5a99536e7b00756e9fa5f20082bd9ad3951b37c381fc0f5d52aa5a556839eb; BGB_505d_T0001, BGB_505d_T0002, BGB_505d_T0003, BGB_505d_T0004, BGB_505d_T0005, BGB_505d_T0006, BGB_505d_T0007}
\examples{
kreditwuerdigkeit_zinsermaessigung(
  kapital = "10000",
  vertraglicher_sollzins_prozent = "6",
  qualifizierter_marktzins_prozent = "2",
  zinsart = "gebunden",
  marktzins_stichtag_am = "2024-01-01",
  zeitanteil_zaehler = 1,
  zeitanteil_nenner = 2,
  zeitanteil_nachweis = "Qualifizierter halber Jahresanteil.",
  einordnungsnachweis = paste0(
    "§505dI1/2: bereits rechtlich feststehende Zinsermäßigung; nu",
    "merisch kleinerer Vertrags-/Marktzinssatz, keine Zinserhöhun",
    "g. Gebundener Sollzins: Markt für Hypothekenpfandbriefe/öffe",
    "ntliche Pfandbriefe mit entsprechender Bindungslaufzeit; ver",
    "änderlicher Sollzins: Euro-Dreimonats-Interbankenmarkt. Mark",
    "twerte, Vertragsschluss und vereinbarte Anpassungsstichtage ",
    "vorqualifizieren. Jeder homogene Kapital-/Zinsabschnitt sepa",
    "rat; keine Tilgungsplan- oder Zinseszinsannahme. Vorzeichenb",
    "ehaftete Ergebnisse sind rechnerische Zinsbeträge, kein auto",
    "matisch festgestellter Zahlungsanspruch bei Negativzinsen. E",
    "ine rechtlich anzuwendende Zinsuntergrenze ist vorab in der ",
    "qualifizierten Zinsgrundlage zu berücksichtigen und nachzuwe",
    "isen; keine erfundene Nullgrenze. Ausnahmefälle505dI5/III ni",
    "cht mit dieser Funktion berechnen. Keine automatische Kredit",
    "würdigkeitsprüfung, Pflichtverletzungsentscheidung oder Mark",
    "tdatenbeschaffung."
  )
)
}
