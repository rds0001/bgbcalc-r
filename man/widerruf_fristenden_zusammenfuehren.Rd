% Automatisch aus Fachverträgen erzeugt; fachliche Freigabe bleibt separat.
\name{widerruf_fristenden_zusammenfuehren}
\alias{widerruf_fristenden_zusammenfuehren}
\title{widerruf fristenden zusammenfuehren}
\description{Feste lokale BGB-Fassung; rechtlichen Anwendungsbereich und Bewertungen ausdrücklich bestimmen.}
\usage{widerruf_fristenden_zusammenfuehren(
  regelfristende_am = NULL,
  hoechstfristende_am = NULL,
  einordnungsnachweis = NULL
)}
\arguments{
\item{regelfristende_am}{Rechtlich qualifiziertes RegelfristendeYYYY-MM-DD nach gegebenenfalls erforderlicher Kalenderkorrektur. NULL/None ausdrücklich, wenn noch kein berechenbares Regelfristende vorliegt.}
\item{hoechstfristende_am}{Anwendbares qualifiziertes HöchstfristendeYYYY-MM-DD nach gegebenenfalls erforderlicher Kalenderkorrektur; NULL/None ausdrücklich, wenn kein solches berechenbares Ende vorliegt.}
\item{einordnungsnachweis}{Nichtleerer Nachweis der Enddaten einschließlich nötiger Kalenderkorrekturen und Bedeutung eventuell fehlender Daten. BeideNULL bedeuten keine berechenbare zeitliche Endgrenze, keinen automatischen Bestand eines Widerrufsrechts.}
}
\details{Früheres von Regelfristende und anwendbarem Höchstfristende bestimmen; fehlende berechenbare Enden ausdrücklich ausweisen. Nur zeitliche Kombination rechtlich vorqualifizierter Enddaten355/356–356f. Vorher gegebenenfalls einschlägige Kalenderkorrekturen wie193 für das jeweilige Ende vornehmen; rohe Fristdaten nicht ungeprüft als endgültige Erklärungstermine verwenden. NULL/None bedeutet ausdrücklich kein vorliegendes berechenbares Ende dieses Typs, nicht stillschweigend erfüllte Anfangsvoraussetzungen oder eine pauschale unbegrenzte Widerrufsmöglichkeit. Sind beide EndenNULL, bleibt das ErgebnisdatumNULL. Bei noch nicht begonnener Regelfrist kann eine qualifizierte Höchstfrist dennoch maßgeblich sein. Frühzeitiges Erlöschen, Anwendungsbereich, Form und rechtzeitige Absendung gesondert. Strikte ISO-Daten0001..9999; ausdrückliche Ereignislisten und optionale qualifizierte Enddaten gemäß Parametervertrag.}
\value{wert: rechnerisch_bestimmbares_endeYYYY-MM-DD oderNULL, regelfristende_vorhanden und hoechstfristende_vorhanden als Wahrheitswerte. Einheit: datum_und_wahrheitswerte.}
\references{BGB_PDF_SHA256_9b5a99536e7b00756e9fa5f20082bd9ad3951b37c381fc0f5d52aa5a556839eb; BGB_355_T0001, BGB_355_T0002, BGB_355_T0003, BGB_355_T0004, BGB_355_T0005, BGB_355_T0006, BGB_355_T0007, BGB_355_T0008, BGB_355_T0009, BGB_355_T0010, BGB_355_T0011, BGB_356_T0001, BGB_356_T0002, BGB_356_T0003, BGB_356_T0004, BGB_356_T0005, BGB_356_T0006, BGB_356_T0007, BGB_356_T0008, BGB_356_T0009, BGB_356_T0010, BGB_356_T0011, BGB_356_T0012, BGB_356_T0013, BGB_356_T0014, BGB_356_T0015, BGB_356_T0016, BGB_356_T0017, BGB_356_T0018, BGB_356_T0019, BGB_356_T0020, BGB_356_T0021, BGB_356_T0022, BGB_356_T0023, BGB_356_T0024, BGB_356_T0025, BGB_356_T0026, BGB_356_T0027, BGB_356_T0028, BGB_356b_T0001, BGB_356b_T0002, BGB_356b_T0003, BGB_356b_T0004, BGB_356c_T0001, BGB_356c_T0002, BGB_356c_T0003, BGB_356c_T0004, BGB_356c_T0005, BGB_356c_T0006, BGB_356c_T0007, BGB_356c_T0008, BGB_356c_T0009, BGB_356d_T0001, BGB_356d_T0002, BGB_356d_T0003, BGB_356e_T0001, BGB_356e_T0002, BGB_356f_T0001, BGB_356f_T0002}
\examples{
widerruf_fristenden_zusammenfuehren(
  regelfristende_am = "2024-02-14",
  hoechstfristende_am = "2025-02-14",
  einordnungsnachweis = paste0(
    "Nur zeitliche Kombination rechtlich vorqualifizierter Enddat",
    "en355/356–356f. Vorher gegebenenfalls einschlägige Kalenderk",
    "orrekturen wie193 für das jeweilige Ende vornehmen; rohe Fri",
    "stdaten nicht ungeprüft als endgültige Erklärungstermine ver",
    "wenden. NULL/None bedeutet ausdrücklich kein vorliegendes be",
    "rechenbares Ende dieses Typs, nicht stillschweigend erfüllte",
    " Anfangsvoraussetzungen oder eine pauschale unbegrenzte Wide",
    "rrufsmöglichkeit. Sind beide EndenNULL, bleibt das Ergebnisd",
    "atumNULL. Bei noch nicht begonnener Regelfrist kann eine qua",
    "lifizierte Höchstfrist dennoch maßgeblich sein. Frühzeitiges",
    " Erlöschen, Anwendungsbereich, Form und rechtzeitige Absendu",
    "ng gesondert."
  )
)
}
