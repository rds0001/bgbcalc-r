% Automatisch aus Fachverträgen erzeugt; fachliche Freigabe bleibt separat.
\name{verbrauchsgueterkauf_nachbesserungsverlaengerung}
\alias{verbrauchsgueterkauf_nachbesserungsverlaengerung}
\title{verbrauchsgueterkauf nachbesserungsverlaengerung}
\description{Feste lokale BGB-Fassung; rechtlichen Anwendungsbereich und Bewertungen ausdrücklich bestimmen.}
\usage{verbrauchsgueterkauf_nachbesserungsverlaengerung(
  urspruenglicher_letzter_tag = NULL,
  nachbesserung_nach_439_geleistet = NULL,
  regel_475e_absatz_fuenf_anwendbar = NULL,
  einordnungsnachweis = NULL
)}
\arguments{
\item{urspruenglicher_letzter_tag}{ISO-Datum0001..9999 des Endes der unveränderten ursprünglichen Verjährungsgrundfrist. Keine bereits umAbsatz5 verlängerte Frist und keine bereits nachAbsätzen1–4 gebildete Mindestnachlaufgrenze eingeben. Derselbe feste Ursprung ist auch bei weiteren Nachbesserungen beizubehalten.}
\item{nachbesserung_nach_439_geleistet}{Wahrheitswert, ob die gesetzlich qualifizierte Nacherfüllung gemäß§439 durch Nachbesserung geleistet ist. Mindestens eine qualifizierte Nachbesserung genügt; zusätzliche Reparaturen ändern die einmalige Zwölfmonatsverlängerung nicht. Bloßer Antrag oder Ersatzlieferung sind nicht ohne Weiteres Nachbesserung.}
\item{regel_475e_absatz_fuenf_anwendbar}{Wahrheitswert der sachlichen und insbesondere zeitlichen Anwendbarkeit von§475e Absatz5 in der lokalen BGB-Fassung auf den konkreten Fall; nicht automatisch auf Altfälle übertragen. Bereits verjährte Ansprüche nicht ohne rechtliche Grundlage wiederbeleben. FALSE ergibt NICHT_ANWENDBAR.}
\item{einordnungsnachweis}{Nichtleere Begründung von ursprünglicher Frist, geleisteter Nachbesserung und sachlicher/zeitlicher Anwendbarkeit. Andere Fristveränderungen gesondert dokumentieren und in rechtlicher Reihenfolge kombinieren.}
}
\details{Bei geleisteter Nachbesserung ursprüngliche Grundfrist genau einmal um zwölf Monate verlängern; ohne Nachbesserung unveränderten Grundtermin ausweisen. Kein Neubeginn der gesamten Verjährung ab Reparatur und keine wiederholte Zwölfmonatsaddition. Eingabe muss immer ursprüngliche Frist bleiben; keine gesetzliche Übergangsregel aus dem bloßen Vorliegen der lokalen Norm ableiten. ISO-Daten und berechnete Fristgrenzen0001..9999, explizite Auswahl/Wahrheitswerte und nichtleerer Nachweis.}
\value{wert enthält verlaengerung_monate (0oder12) und rechnerischer_letzter_tag als ISO-Datum. Ohne Anwendbarkeit NICHT_ANWENDBAR/null. Andere Friständerungen sind noch nicht integriert. Einheit: fristdaten.}
\references{BGB_PDF_SHA256_9b5a99536e7b00756e9fa5f20082bd9ad3951b37c381fc0f5d52aa5a556839eb; BGB_475e_T0005}
\examples{
verbrauchsgueterkauf_nachbesserungsverlaengerung(
  urspruenglicher_letzter_tag = "2024-02-29",
  nachbesserung_nach_439_geleistet = FALSE,
  regel_475e_absatz_fuenf_anwendbar = TRUE,
  einordnungsnachweis = paste0(
    "Synthetisch qualifizierte Nachbesserung und zeitliche Anwend",
    "barkeit der lokalen Absatz5-Fassung; unveränderte ursprüngli",
    "che Frist."
  )
)
}
