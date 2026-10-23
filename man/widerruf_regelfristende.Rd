% Automatisch aus Fachverträgen erzeugt; fachliche Freigabe bleibt separat.
\name{widerruf_regelfristende}
\alias{widerruf_regelfristende}
\title{widerruf regelfristende}
\description{Feste lokale BGB-Fassung; rechtlichen Anwendungsbereich und Bewertungen ausdrücklich bestimmen.}
\usage{widerruf_regelfristende(
  fristart = NULL,
  erforderliche_ereignistage = NULL,
  einordnungsnachweis = NULL
)}
\arguments{
\item{fristart}{Genau standard_vierzehn_tage nach355II oder darlehen_angabennachholung_monat nach356bII. Einmonatsfrist nicht auf andere Fälle verspäteter Unterrichtung übertragen.}
\item{erforderliche_ereignistage}{Unbenannte Liste1..10 tatsächlich eingetretener, rechtlich erforderlicher Anfangsereignisse alsYYYY-MM-DD. Alle einschlägigen Voraussetzungen vollständig erfassen; die Library bildet deren spätesten Tag. Bei noch fehlender Voraussetzung keine Fristberechnung mit erfundenem Datum; NULL in der Liste ist EINGABE_FEHLT.}
\item{einordnungsnachweis}{Nichtleerer Nachweis von gesetzlichem Fall und vollständiger Auswahl aller erforderlichen Anfangsvoraussetzungen, etwa Vertragsschluss, richtiger Warenempfang, Urkundenerhalt und ordnungsgemäßer Unterrichtung.}
}
\details{Spätesten Tag aller erforderlichen Anfangsvoraussetzungen wählen und14Tage oder einen Monat fortschreiben. §355II und356–356f:14Tage im qualifizierten Standardfall; ein Monat ausschließlich bei nachgeholten Angaben356bII. Liste muss sämtliche rechtlich erforderlichen eingetretenen Anfangsvoraussetzungen enthalten: je Norm insbesondere Vertrag/Vorvertrag, maßgeblicher Warenempfang, Vertragsurkunde, vollständige Informationen und Widerrufsbelehrung. Bei356II erste Ware bei regelmäßigen Lieferungen, letzte Ware/Teilsendung bei den anderen dort genannten Mehrlieferfällen rechtlich zutreffend auswählen.356cV gegebenenfalls maßgeblichen Teilzeit-Wohnrechtevertrag zugrunde legen. Solange eine erforderliche Voraussetzung fehlt, keine künstliche Ersatzdatierung eingeben. Kein automatischer Belehrungs-/Form-/Widerrufsrechtsentscheid; frühzeitiges Erlöschen356V/VI gesondert. Gesetzliche Höchstfristen und anwendbare193-Korrektur separat, rechtzeitige Absendung355I gesondert. Strikte ISO-Daten0001..9999; ausdrückliche Ereignislisten und optionale qualifizierte Enddaten gemäß Parametervertrag.}
\value{wert: massgeblicher_ereignistag und regelfristende_ohne_kalenderkorrektur alsYYYY-MM-DD. Einheit: daten.}
\references{BGB_PDF_SHA256_9b5a99536e7b00756e9fa5f20082bd9ad3951b37c381fc0f5d52aa5a556839eb; BGB_355_T0001, BGB_355_T0002, BGB_355_T0003, BGB_355_T0004, BGB_355_T0005, BGB_355_T0006, BGB_355_T0007, BGB_355_T0008, BGB_355_T0009, BGB_355_T0010, BGB_355_T0011, BGB_356_T0001, BGB_356_T0002, BGB_356_T0003, BGB_356_T0004, BGB_356_T0005, BGB_356_T0006, BGB_356_T0007, BGB_356_T0008, BGB_356_T0009, BGB_356_T0010, BGB_356_T0011, BGB_356_T0012, BGB_356_T0013, BGB_356_T0014, BGB_356_T0015, BGB_356_T0016, BGB_356_T0017, BGB_356_T0018, BGB_356_T0019, BGB_356_T0020, BGB_356_T0021, BGB_356_T0022, BGB_356_T0023, BGB_356_T0024, BGB_356_T0025, BGB_356_T0026, BGB_356_T0027, BGB_356_T0028, BGB_356b_T0001, BGB_356b_T0002, BGB_356b_T0003, BGB_356b_T0004, BGB_356c_T0001, BGB_356c_T0002, BGB_356c_T0003, BGB_356c_T0004, BGB_356c_T0005, BGB_356c_T0006, BGB_356c_T0007, BGB_356c_T0008, BGB_356c_T0009, BGB_356d_T0001, BGB_356d_T0002, BGB_356d_T0003, BGB_356e_T0001, BGB_356e_T0002, BGB_356f_T0001, BGB_356f_T0002}
\examples{
widerruf_regelfristende(
  fristart = "standard_vierzehn_tage",
  erforderliche_ereignistage = list(
    "2024-01-31"
  ),
  einordnungsnachweis = paste0(
    "§355II und356–356f:14Tage im qualifizierten Standardfall; ei",
    "n Monat ausschließlich bei nachgeholten Angaben356bII. Liste",
    " muss sämtliche rechtlich erforderlichen eingetretenen Anfan",
    "gsvoraussetzungen enthalten: je Norm insbesondere Vertrag/Vo",
    "rvertrag, maßgeblicher Warenempfang, Vertragsurkunde, vollst",
    "ändige Informationen und Widerrufsbelehrung. Bei356II erste ",
    "Ware bei regelmäßigen Lieferungen, letzte Ware/Teilsendung b",
    "ei den anderen dort genannten Mehrlieferfällen rechtlich zut",
    "reffend auswählen.356cV gegebenenfalls maßgeblichen Teilzeit",
    "-Wohnrechtevertrag zugrunde legen. Solange eine erforderlich",
    "e Voraussetzung fehlt, keine künstliche Ersatzdatierung eing",
    "eben. Kein automatischer Belehrungs-/Form-/Widerrufsrechtsen",
    "tscheid; frühzeitiges Erlöschen356V/VI gesondert. Gesetzlich",
    "e Höchstfristen und anwendbare193-Korrektur separat, rechtze",
    "itige Absendung355I gesondert."
  )
)
}
