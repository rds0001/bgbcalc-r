% Automatisch aus Fachverträgen erzeugt; fachliche Freigabe bleibt separat.
\name{inventarfrist_erbentod_mindestende}
\alias{inventarfrist_erbentod_mindestende}
\title{inventarfrist erbentod mindestende}
\description{Feste lokale BGB-Fassung; rechtlichen Anwendungsbereich und Bewertungen ausdrücklich bestimmen.}
\usage{inventarfrist_erbentod_mindestende(
  bisheriges_fristende = NULL,
  erbe_gestorben_am = NULL,
  ausschlagungsfristende_erbeserbe = NULL,
  einordnungsnachweis = NULL
)}
\arguments{
\item{bisheriges_fristende}{ISO-Enddatum der Inventarfrist oder Zweiwochenantragsfrist1996II, rechtlich inklusive bereits einschlägiger Korrekturen. Nicht die absolute Jahresgrenze.}
\item{erbe_gestorben_am}{ISO-Todestag des Erben. Ereignis am bisherigen Endtag liegt vor Tagesablauf; Tod danach erzeugt keine Wiederbelebung.}
\item{ausschlagungsfristende_erbeserbe}{ISO-Enddatum der für die Erbschaft des verstorbenen Erben maßgeblichen Ausschlagungsfrist des betrachteten Erbeserben, frühestens Tod. Bei mehreren Personen gesondert qualifizieren.}
\item{einordnungsnachweis}{Nichtleerer Nachweis der Fristart, bisherigen Korrekturen, Erbentods und maßgeblichen Ausschlagungsfrist.}
}
\details{Bei Tod bis zum letzten Tag der laufenden Frist: Maximum aus bestehendem und einschlägigem Ausschlagungsende, sonst unverändertes bestehendes Ende. Nicht absolute1996II-Jahresgrenze verlängern; keine Addition, keine Wiederbelebung abgelaufener Frist oder ungeprüfte gemeinsame Frist mehrerer Erbeserben. ISO-Daten und berechnete Grenzen0001..9999, feste Auswahlwerte, nichtleerer Nachweis.}
\value{wert enthält massgebliches_fristende. Einheit: datum.}
\references{BGB_PDF_SHA256_9b5a99536e7b00756e9fa5f20082bd9ad3951b37c381fc0f5d52aa5a556839eb; BGB_1998_T0001}
\examples{
inventarfrist_erbentod_mindestende(
  bisheriges_fristende = "2030-06-30",
  erbe_gestorben_am = "2030-06-01",
  ausschlagungsfristende_erbeserbe = "2030-07-13",
  einordnungsnachweis = "Synthetische einschlägige Inventar-/Ausschlagungsfrist."
)
}
