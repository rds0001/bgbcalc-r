% Automatisch aus Fachverträgen erzeugt; fachliche Freigabe bleibt separat.
\name{vererbte_ausschlagungsfrist}
\alias{vererbte_ausschlagungsfrist}
\title{vererbte ausschlagungsfrist}
\description{Feste lokale BGB-Fassung; rechtlichen Anwendungsbereich und Bewertungen ausdrücklich bestimmen.}
\usage{vererbte_ausschlagungsfrist(
  tod_des_erben_am = NULL,
  bisheriges_ausschlagungsfristende = NULL,
  ausschlagungsfristende_erbeserbschaft = NULL,
  ausschlagungsrecht_vererblich_vorhanden = NULL,
  einordnungsnachweis = NULL
)}
\arguments{
\item{tod_des_erben_am}{ISO-Datum0001..9999 des Todes des Erben, dem die erste Erbschaft bereits angefallen war; nicht Tod des ursprünglichen Erblassers.}
\item{bisheriges_ausschlagungsfristende}{ISO-Datum des bisher rechtlich maßgeblichen Endes für Ausschlagung der zuerst angefallenen Erbschaft einschließlich zulässiger Korrekturen.}
\item{ausschlagungsfristende_erbeserbschaft}{ISO-Datum des rechtlich maßgeblichen Endes der Ausschlagungsfrist für die Erbschaft des nun verstorbenen Erben, individuell für den betreffenden Erbeserben. Frühestens Tod des Erben. Kenntnis, Bekanntgabe und Korrekturen gesondert bestimmen.}
\item{ausschlagungsrecht_vererblich_vorhanden}{Wahrheitswert: das Ausschlagungsrecht war bei Tod vorhanden und vererblich, insbesondere nicht durch bereits wirksame Annahme/Ausschlagung ausgeschlossen. Zeitablauf wird zusätzlich anhand der Daten geprüft.}
\item{einordnungsnachweis}{Nichtleere Begründung beider Erbfälle, der individuellen Fristenden und des bei Tod vorhandenen Ausschlagungsrechts.}
}
\details{Bei vorhandenem vererblichem Ausschlagungsrecht und Tod spätestens am letzten Tag der bisherigen Frist: Maximum aus bisherigem Fristende und Fristende der Erbschaft des Erben. Keine Addition, kein pauschaler Neubeginn ab Tod. Für mehrere Erbeserben individuell prüfen; Teilrechte§1952 Absatz3 nicht vollständig modelliert. Kenntnis-/Auslandsregeln und Hemmung der jeweiligen Frist separat. ISO-Daten0001..9999, expliziter Wahrheitswert und nichtleerer Nachweis.}
\value{wert ist ISO-Datum des Mindestendes nach§1952 Absatz2. Ohne Anwendungsbereich oder bei Tod nach bisherigem Fristende NICHT_ANWENDBAR/null. Einheit: datum.}
\references{BGB_PDF_SHA256_9b5a99536e7b00756e9fa5f20082bd9ad3951b37c381fc0f5d52aa5a556839eb; BGB_1952_T0001, BGB_1952_T0002, BGB_1952_T0003}
\examples{
vererbte_ausschlagungsfrist(
  tod_des_erben_am = "2030-02-01",
  bisheriges_ausschlagungsfristende = "2030-02-28",
  ausschlagungsfristende_erbeserbschaft = "2030-03-01",
  ausschlagungsrecht_vererblich_vorhanden = TRUE,
  einordnungsnachweis = paste0(
    "Synthetische zwei Erbfälle mit individuell qualifizierten Fr",
    "istenden."
  )
)
}
