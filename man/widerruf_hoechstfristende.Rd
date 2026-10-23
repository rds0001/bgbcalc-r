% Automatisch aus Fachverträgen erzeugt; fachliche Freigabe bleibt separat.
\name{widerruf_hoechstfristende}
\alias{widerruf_hoechstfristende}
\title{widerruf hoechstfristende}
\description{Feste lokale BGB-Fassung; rechtlichen Anwendungsbereich und Bewertungen ausdrücklich bestimmen.}
\usage{widerruf_hoechstfristende(
  fristfall = NULL,
  bezugsereignistage = NULL,
  einordnungsnachweis = NULL
)}
\arguments{
\item{fristfall}{Genau fernabsatz_aussergeschaeftlich_356, immobiliardarlehen_356b, teilzeitwohnrecht_informationen_356c, teilzeitwohnrecht_belehrung_356c, ratenlieferung_356d, verbraucherbau_356e oder unentgeltliches_darlehen_356f. Nur rechtlich anwendbare Höchstfrist wählen. Zusätzlich unentgeltliches_darlehen_ohne_unterrichtung_356f ausschließlich bei tatsächlich vollständig fehlender Unterrichtung.}
\item{bezugsereignistage}{Unbenannte Liste von genau einem oder zweiYYYY-MM-DD gemäß Fall:356 ein maßgeblicher Grundtag356II/355II2;356b zwei Tage Vertragsschluss und Urkundenzeitpunkt356bI;356c zwei Tage Vertrags-/Vorvertragsabschluss und Urkundenerhalt;356d/e ein Tag Vertragsschluss;356f zwei Tage Vertragsschluss und Unterrichtung. Beide Ereignisse müssen feststehen; gleiche Tage wiederholen, nicht fiktiv ergänzen. Ausnahme: unentgeltliches_darlehen_ohne_unterrichtung_356f genau ein tatsächlicher Vertragsschlusstag, keine fiktive Unterrichtung.}
\item{einordnungsnachweis}{Nichtleerer Nachweis gesetzlicher Höchstfrist, Informations-/Belehrungsfall und Bezugsereignisse. Bei356-Finanzdienstleistung ohne erforderliche Widerrufsbelehrung keine12Monats-Höchstfrist einsetzen; bei356c-Mangel beider Informationsarten Belehrungsfall12Monate wählen.}
}
\details{Gesetzlichen Höchstfristbezug als spätesten Bezugstag wählen, drei oder zwölf Monate und danach14Tage addieren. Feste lokale Fassung:356IV zwölfMonate+14Tage ab356II/355II2, nicht ab verspäteter Belehrung; bei Finanzdienstleistungen Ausnahme fehlender Belehrung356IV2 beachten, dann diesen Höchstfristfall nicht anwenden.356bII nur Immobiliardarlehen: späterer Vertragsschluss/Urkundenzeitpunkt356bI; keine pauschale Höchstfrist für Allgemeindarlehen.356c: späterer Vertrags-/Vorvertragsabschluss und Urkundenerhalt; dreiMonate+14Tage bei Informations-/Formblattmangel, zwölfMonate+14Tage bei Belehrungsmangel, letzterer auch bei beidem maßgeblich. Bei Urkunde bereits zum Abschluss denselben Tag zweimal angeben.356d/e: ein Bezugstag Vertragsschluss.356f: Bei tatsächlich erteilter Unterrichtung späteren Vertragsschluss/Unterrichtung verwenden, beide Tage müssen feststehen. Bei vollständig ausgebliebener Unterrichtung ausdrücklich unentgeltliches_darlehen_ohne_unterrichtung_356f wählen: nur tatsächlicher Vertragsschlusstag, zwölfMonate+14Tage. Dies ist keine fiktive Unterrichtung und startet keine14Tage-Regelfrist. Belegt durchBT-Drs18/7584S.141zur inhaltsgleichen früheren356d-Regelung. Vollständig fehlende Unterrichtung von unbekannter Informationslage unterscheiden. Ein bereits erloschenes Recht wird durch spätere Information nicht automatisch wiederbelebt; den Zwei-Ereignisfall nicht ungeprüft dafür verwenden. Regelwiderrufsfrist, frühzeitiges Erlöschen und gegebenenfalls193-Korrektur separat; Monatsanteil nicht eigenständig vor Addition der14Tage verschieben. Strikte ISO-Daten0001..9999; ausdrückliche Ereignislisten und optionale qualifizierte Enddaten gemäß Parametervertrag.}
\value{wert: massgeblicher_bezugstagYYYY-MM-DD, hoechstfrist_monate3oder12 und hoechstfristende_ohne_kalenderkorrekturYYYY-MM-DD. Einheit: daten_und_zahlen.}
\references{BGB_PDF_SHA256_9b5a99536e7b00756e9fa5f20082bd9ad3951b37c381fc0f5d52aa5a556839eb; BGB_355_T0001, BGB_355_T0002, BGB_355_T0003, BGB_355_T0004, BGB_355_T0005, BGB_355_T0006, BGB_355_T0007, BGB_355_T0008, BGB_355_T0009, BGB_355_T0010, BGB_355_T0011, BGB_356_T0001, BGB_356_T0002, BGB_356_T0003, BGB_356_T0004, BGB_356_T0005, BGB_356_T0006, BGB_356_T0007, BGB_356_T0008, BGB_356_T0009, BGB_356_T0010, BGB_356_T0011, BGB_356_T0012, BGB_356_T0013, BGB_356_T0014, BGB_356_T0015, BGB_356_T0016, BGB_356_T0017, BGB_356_T0018, BGB_356_T0019, BGB_356_T0020, BGB_356_T0021, BGB_356_T0022, BGB_356_T0023, BGB_356_T0024, BGB_356_T0025, BGB_356_T0026, BGB_356_T0027, BGB_356_T0028, BGB_356b_T0001, BGB_356b_T0002, BGB_356b_T0003, BGB_356b_T0004, BGB_356c_T0001, BGB_356c_T0002, BGB_356c_T0003, BGB_356c_T0004, BGB_356c_T0005, BGB_356c_T0006, BGB_356c_T0007, BGB_356c_T0008, BGB_356c_T0009, BGB_356d_T0001, BGB_356d_T0002, BGB_356d_T0003, BGB_356e_T0001, BGB_356e_T0002, BGB_356f_T0001, BGB_356f_T0002}
\examples{
widerruf_hoechstfristende(
  fristfall = "fernabsatz_aussergeschaeftlich_356",
  bezugsereignistage = list(
    "2024-01-31"
  ),
  einordnungsnachweis = paste0(
    "Feste lokale Fassung:356IV zwölfMonate+14Tage ab356II/355II2",
    ", nicht ab verspäteter Belehrung; bei Finanzdienstleistungen",
    " Ausnahme fehlender Belehrung356IV2 beachten, dann diesen Hö",
    "chstfristfall nicht anwenden.356bII nur Immobiliardarlehen: ",
    "späterer Vertragsschluss/Urkundenzeitpunkt356bI; keine pausc",
    "hale Höchstfrist für Allgemeindarlehen.356c: späterer Vertra",
    "gs-/Vorvertragsabschluss und Urkundenerhalt; dreiMonate+14Ta",
    "ge bei Informations-/Formblattmangel, zwölfMonate+14Tage bei",
    " Belehrungsmangel, letzterer auch bei beidem maßgeblich. Bei",
    " Urkunde bereits zum Abschluss denselben Tag zweimal angeben",
    ".356d/e: ein Bezugstag Vertragsschluss.356f: nach vorliegend",
    "em Wortlaut späterer Vertragsschluss/Unterrichtung; beide ta",
    "tsächlich feststehenden Tage erforderlich, fehlende Unterric",
    "htung nicht mit Vertragsschluss ersetzen. Keine automatisier",
    "te Bestimmung eines Höchstendes bei noch unbekanntem spätere",
    "m Bezugsereignis. Regelwiderrufsfrist, frühzeitiges Erlösche",
    "n und gegebenenfalls193-Korrektur separat; Monatsanteil nich",
    "t eigenständig vor Addition der14Tage verschieben."
  )
)
}
