% Automatisch aus Fachverträgen erzeugt; fachliche Freigabe bleibt separat.
\name{zinskalendertage_nach_ausschluss}
\alias{zinskalendertage_nach_ausschluss}
\title{zinskalendertage nach ausschluss}
\description{Feste lokale BGB-Fassung; rechtlichen Anwendungsbereich und Bewertungen ausdrücklich bestimmen.}
\usage{zinskalendertage_nach_ausschluss(
  erster_betrachteter_tag = NULL,
  letzter_betrachteter_tag = NULL,
  ausschlusszeitraeume = NULL,
  einordnungsnachweis = NULL
)}
\arguments{
\item{erster_betrachteter_tag}{Erster rechtlich zu betrachtender ZinstagYYYY-MM-DD einschließlich; bereits zutreffend normalisiert.}
\item{letzter_betrachteter_tag}{Letzter betrachteter ZinstagYYYY-MM-DD einschließlich, nicht vor erstem Tag.}
\item{ausschlusszeitraeume}{Unbenannte Liste0..10000 Objekte mit genau erster_zinsfreier_tag, letzter_zinsfreier_tag (inklusiveYYYY-MM-DD), ausschlussgrund (nutzungen_ohne_verguetung_256, glaeubigerverzug_301 oder hinterlegung_379) und hinterlegung_zurueckgenommen. Letzteres nur bei379 expliziter Wahrheitswert, sonstNULL/None. Leere Liste bedeutet keine Zinsausschlüsse. Überschneidungen werden vereinigt, zurückgenommene Hinterlegung nicht berücksichtigt.}
\item{einordnungsnachweis}{Nichtleerer Nachweis der konkreten Schuld, rechtlich normalisierten Kalendertagsgrenzen, jeweiligen Zinsausschlüsse und gegebenenfalls Rücknahme. Tageszahl erst nach qualifizierter Zinstageskonvention in Jahresanteil umrechnen.}
}
\details{Zinsfreie Kalenderintervalle begrenzen und vereinigen; deren Tage nur einmal vom betrachteten Zeitraum abziehen. §256Satz2: nur Zeiträume, in denen dem Aufwendungsersatzberechtigten Nutzungen/Früchte des herauszugebenden Gegenstands ohne Vergütung verbleiben.301: qualifizierter Gläubigerverzug hinsichtlich der verzinslichen Geldschuld.379II/III: wirksame Hinterlegung; bei Rücknahme gilt diese als nicht erfolgt, deshalb wird ihr gesamtes eingegebenes Intervall nicht als zinsfrei abgezogen. Andere wirksame Ausschlussgründe desselben Tages bleiben bestehen. Tagesgrenzen einschließlich und rechtlich auf ganze Kalendertage normalisiert; untertägige Bruchteile nicht pauschal runden. Zeiträume werden auf den betrachteten Zinsabschnitt begrenzt, Überschneidungen/gleiche Tage nur einmal gezählt. Keine Verlängerung des Abschnitts wie bei Verjährungshemmung. Ergebnis ist tatsächliche Kalendertageszahl, noch kein universeller Jahresbruch oder Zinsbetrag; rechtlich geltende Zinstageskonvention, wechselnde Kapital-/Zinssatzwerte und Jahresgrenzen gesondert behandeln und vorhandene Zinsfunktionen verwenden. Erster/letzter Zinstag und rechtliche Ausschlussgründe müssen vorqualifiziert sein. ISO-Kalendertage0001..9999; ganze abgeschlossene Zeiträume; kein Verschieben des betrachteten Endtags.}
\value{wert: kalendertage_gesamt, zinsfreie_kalendertage, verzinsliche_kalendertage und sortierte vereinigte_ausschlusszeitraeume mit eingeschlossenen Tagesgrenzen. Tatsächliche Tage, noch kein universeller Jahresanteil. Einheit: kalendertage_und_intervalle.}
\references{BGB_PDF_SHA256_9b5a99536e7b00756e9fa5f20082bd9ad3951b37c381fc0f5d52aa5a556839eb; BGB_256_T0001, BGB_256_T0002, BGB_301_T0001, BGB_379_T0001, BGB_379_T0002, BGB_379_T0003}
\examples{
zinskalendertage_nach_ausschluss(
  erster_betrachteter_tag = "2024-01-01",
  letzter_betrachteter_tag = "2024-01-10",
  ausschlusszeitraeume = list(
    
  ),
  einordnungsnachweis = paste0(
    "§256Satz2: nur Zeiträume, in denen dem Aufwendungsersatzbere",
    "chtigten Nutzungen/Früchte des herauszugebenden Gegenstands ",
    "ohne Vergütung verbleiben.301: qualifizierter Gläubigerverzu",
    "g hinsichtlich der verzinslichen Geldschuld.379II/III: wirks",
    "ame Hinterlegung; bei Rücknahme gilt diese als nicht erfolgt",
    ", deshalb wird ihr gesamtes eingegebenes Intervall nicht als",
    " zinsfrei abgezogen. Andere wirksame Ausschlussgründe dessel",
    "ben Tages bleiben bestehen. Tagesgrenzen einschließlich und ",
    "rechtlich auf ganze Kalendertage normalisiert; untertägige B",
    "ruchteile nicht pauschal runden. Zeiträume werden auf den be",
    "trachteten Zinsabschnitt begrenzt, Überschneidungen/gleiche ",
    "Tage nur einmal gezählt. Keine Verlängerung des Abschnitts w",
    "ie bei Verjährungshemmung. Ergebnis ist tatsächliche Kalende",
    "rtageszahl, noch kein universeller Jahresbruch oder Zinsbetr",
    "ag; rechtlich geltende Zinstageskonvention, wechselnde Kapit",
    "al-/Zinssatzwerte und Jahresgrenzen gesondert behandeln und ",
    "vorhandene Zinsfunktionen verwenden. Erster/letzter Zinstag ",
    "und rechtliche Ausschlussgründe müssen vorqualifiziert sein."
  )
)
}
