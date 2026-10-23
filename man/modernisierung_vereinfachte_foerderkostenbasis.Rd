% Automatisch aus Fachverträgen erzeugt; fachliche Freigabe bleibt separat.
\name{modernisierung_vereinfachte_foerderkostenbasis}
\alias{modernisierung_vereinfachte_foerderkostenbasis}
\title{modernisierung vereinfachte foerderkostenbasis}
\description{Feste lokale BGB-Fassung; gesetzlicher Anwendungsbereich und externe Bewertungen ausdrücklich vorqualifiziert.}
\usage{modernisierung_vereinfachte_foerderkostenbasis(
  geltend_gemachte_kosten = NULL,
  frueher_geltend_gemachte_kosten = NULL,
  abzuziehende_kapitalzuschuesse = NULL,
  pauschalenmethode = NULL,
  methodennachweis = NULL
)}
\arguments{
\item{geltend_gemachte_kosten}{Für559cI1qualifizierter geltend gemachter Kostenbetrag vor30\%-Pauschale und hier gesondertem Kapitalzuschussabzug.}
\item{frueher_geltend_gemachte_kosten}{559cII-relevante frühere Kosten im Fünfjahreszeitraum.}
\item{abzuziehende_kapitalzuschuesse}{Einmalige559aI-Kostenbeiträge, höchstens geltend gemachte Kosten; laufende Förderung und Darlehensnennbetrag nicht hier einsetzen.}
\item{pauschalenmethode}{Zwingende rechtliche Reihenfolge: pauschale_vor_kapitalabzug oder kapitalabzug_vor_pauschale.}
\item{methodennachweis}{559c-Anwendbarkeit, Kostengrenzenbasis und rechtlich begründete Reihenfolge von30\%-Pauschale und Kapitalbeitrag belegen.}
}
\details{559c-Kostengrenze prüfen, Kapitalbeitrag und30\%-Pauschale in ausdrücklich gewählter Reihenfolge abziehen; beide bedingten Rechenwege ausweisen. Bedingte559c/559aI-Kostenrechnung mit zwingend begründeter Reihenfolge, ohne universelle rechtliche Festlegung. Kostengrenze10000abzüglich relevanter früherer Kosten vor dieser Rechnung mit vorhandenem Kern prüfen. Pauschale_vor_kapitalabzug: max(0,0.7K-Z). Kapitalabzug_vor_pauschale:0.7(K-Z). Beide Ergebnisse ausweisen, ausgewählte Kostenbasis für8\%-Umlage verwenden. Nicht den Darlehensnennbetrag als Kapitalzuschuss abziehen.559cI3schließt559aII1bis3(Zinsermäßigung)aus, nicht559aII4(laufende Zuschüsse/Darlehen); letztere nach jährlicher8\%-Umlage und rechtlich bestimmter Kappungsreihenfolge mit vorhandenem Förderkappungskern berücksichtigen. Keine tatsächlichen Erhaltungskosten neben30\%-Pauschale. Förderzuordnung zu Wohnungen und Erklärungs-/Härtevoraussetzungen separat; keine Förderung automatisch erfinden. Gemeinsame exakte Zahlengrenzen nach NUMERIK.md. Fehlende Pflichteingaben EINGABE_FEHLT, unzulässige Typen/Bereiche EINGABE_UNGUELTIG.}
\value{Beide Kostenbasen und ausdrücklich ausgewählte Basis mit Methodennamen. Einheit: EUR.}
\references{BGB_PDF_SHA256_9b5a99536e7b00756e9fa5f20082bd9ad3951b37c381fc0f5d52aa5a556839eb; BGB_559_T0001, BGB_559_T0002, BGB_559_T0003, BGB_559_T0004, BGB_559_T0005, BGB_559_T0006, BGB_559_T0007, BGB_559_T0008, BGB_559_T0009, BGB_559_T0010, BGB_559_T0011, BGB_559_T0012, BGB_559_T0013, BGB_559_T0014, BGB_559_T0015, BGB_559a_T0001, BGB_559a_T0002, BGB_559a_T0003, BGB_559a_T0004, BGB_559a_T0005, BGB_559a_T0006, BGB_559a_T0007, BGB_559a_T0008, BGB_559a_T0009, BGB_559c_T0001, BGB_559c_T0002, BGB_559c_T0003, BGB_559c_T0004, BGB_559c_T0005, BGB_559c_T0006, BGB_559c_T0007, BGB_559c_T0008, BGB_559c_T0009, BGB_559c_T0010, BGB_559c_T0011, BGB_559c_T0012, BGB_559c_T0013}
\examples{
modernisierung_vereinfachte_foerderkostenbasis(
  geltend_gemachte_kosten = "10000",
  frueher_geltend_gemachte_kosten = "0",
  abzuziehende_kapitalzuschuesse = "2000",
  pauschalenmethode = "pauschale_vor_kapitalabzug",
  methodennachweis = paste0(
    "Bedingte559c/559aI-Kostenrechnung mit zwingend begründeter R",
    "eihenfolge, ohne universelle rechtliche Festlegung. Kostengr",
    "enze10000abzüglich relevanter früherer Kosten vor dieser Rec",
    "hnung mit vorhandenem Kern prüfen. Pauschale_vor_kapitalabzu",
    "g: max(0,0.7K-Z). Kapitalabzug_vor_pauschale:0.7(K-Z). Beide",
    " Ergebnisse ausweisen, ausgewählte Kostenbasis für8\%-Umlage ",
    "verwenden. Nicht den Darlehensnennbetrag als Kapitalzuschuss",
    " abziehen.559cI3schließt559aII1bis3(Zinsermäßigung)aus, nich",
    "t559aII4(laufende Zuschüsse/Darlehen); letztere nach jährlic",
    "her8\%-Umlage und rechtlich bestimmter Kappungsreihenfolge mi",
    "t vorhandenem Förderkappungskern berücksichtigen. Keine tats",
    "ächlichen Erhaltungskosten neben30\%-Pauschale. Förderzuordnu",
    "ng zu Wohnungen und Erklärungs-/Härtevoraussetzungen separat",
    "; keine Förderung automatisch erfinden."
  )
)
}
