% Automatisch aus Fachverträgen erzeugt; fachliche Freigabe bleibt separat.
\name{pauschalreise_zusatzkosten_informationsgrenze}
\alias{pauschalreise_zusatzkosten_informationsgrenze}
\title{pauschalreise zusatzkosten informationsgrenze}
\description{Feste lokale BGB-Fassung; rechtlichen Anwendungsbereich und Bewertungen ausdrücklich bestimmen.}
\usage{pauschalreise_zusatzkosten_informationsgrenze(
  kostenpositionen = NULL,
  einordnungsnachweis = NULL
)}
\arguments{
\item{kostenpositionen}{Unbenannte Liste1..1000 Objekte mit genau kosten_id (nichtleer, eindeutig), betrag (nichtnegativer EUR-Dezimaltext/Bruch), rechtzeitig_ordnungsgemaess_informiert (expliziter Wahrheitswert). Rechtzeitig vor Vertragserklärung des Reisenden; bei keinen Zusatzkosten einzelne Nullposition.}
\item{einordnungsnachweis}{Nichtleerer Nachweis der qualifizierten Zusatzkosten und der rechtzeitigen inhaltlich ordnungsgemäßen Information; übrige Anspruchsvoraussetzungen vorqualifiziert.}
}
\details{Zusatzkosten nach rechtzeitiger ordnungsgemäßer Information auswählen und getrennt summieren. §651dII: zusätzliche Gebühren, Entgelte und sonstige Kosten; rechtzeitig bedeutet vor Abgabe der Vertragserklärung des Reisenden, nicht bloß vor Bestätigung des Veranstalters. Inhaltlich ordnungsgemäße Information nach dem verwiesenen EGBGB rechtlich vorqualifizieren; die Library prüft kein Informationsformular. Einbeziehung ist nur diese numerische Teilgrenze, kein Nachweis sämtlicher Anspruchsvoraussetzungen oder Vertragswirksamkeit. Positionen müssen im Übrigen der maßgeblichen Reise zugeordnet und überschneidungsfrei sein; bereits gezahlte Beträge separat. Keine Zusatzkosten ausdrücklich als einzelne Nullposition, keine fehlende Liste. Nichtnegative exakte EUR-Dezimaltexte/Brüche nach NUMERIK.md. Kostenlisten ohne doppelte Positionen, keine Rundung.}
\value{wert: nach_informationsgrenze_einbezogene_kosten und wegen_information_ausgeschlossene_kosten als exakte EUR-Brüche. Einheit: EUR.}
\references{BGB_PDF_SHA256_9b5a99536e7b00756e9fa5f20082bd9ad3951b37c381fc0f5d52aa5a556839eb; BGB_651d_T0003}
\examples{
pauschalreise_zusatzkosten_informationsgrenze(
  kostenpositionen = list(
    list(
    "kosten_id" = "A",
    "betrag" = "100",
    "rechtzeitig_ordnungsgemaess_informiert" = TRUE
  ),
    list(
    "kosten_id" = "B",
    "betrag" = "50",
    "rechtzeitig_ordnungsgemaess_informiert" = FALSE
  )
  ),
  einordnungsnachweis = paste0(
    "Qualifizierte überschneidungsfreie Kosten des gesetzlichen N",
    "ormfalls; Information beziehungsweise notwendige Beherbergun",
    "g/Zeitraum festgestellt."
  )
)
}
