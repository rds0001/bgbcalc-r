% Automatisch aus Fachverträgen erzeugt; fachliche Freigabe bleibt separat.
\name{heizungsmodernisierung_mit_jahresfoerderung}
\alias{heizungsmodernisierung_mit_jahresfoerderung}
\title{heizungsmodernisierung mit jahresfoerderung}
\description{Feste lokale BGB-Fassung; gesetzlicher Anwendungsbereich und externe Bewertungen ausdrücklich vorqualifiziert.}
\usage{heizungsmodernisierung_mit_jahresfoerderung(
  kosten_wohnung = NULL,
  von_erhaltungspauschale_ausgenommene_kosten = NULL,
  kapitalzuschuesse = NULL,
  jaehrliche_zinsermaessigung = NULL,
  jaehrliche_laufende_foerderung = NULL,
  monatliche_restkappung = NULL,
  abzugsreihenfolge = NULL,
  methodennachweis = NULL
)}
\arguments{
\item{kosten_wohnung}{Der Wohnung rechtlich zugeordnete Kosten vor Erhaltungspauschale/Förderabzug.}
\item{von_erhaltungspauschale_ausgenommene_kosten}{Qualifizierter Ausnahmeanteil nach lokaler559eII2-Fassung; sonst0.}
\item{kapitalzuschuesse}{Einmalige kostenmindernde559aI-Mittel;0bei ausschließlich qualifizierter laufender/Zinsförderung.}
\item{jaehrliche_zinsermaessigung}{Mit vorhandenem559aII/III-Kern errechneter Jahreszinsvorteil; keine Darlehenshauptsumme.}
\item{jaehrliche_laufende_foerderung}{Rechtlich einschlägiger559aII4-Jahresbetrag, ohne doppelte Erfassung eines Kapitalzuschusses.}
\item{monatliche_restkappung}{Mit559eIII/559IIIa-Kern berechnete Restkappung für diese Wohnung.}
\item{abzugsreihenfolge}{Zwingend qualifiziert: abzug_vor_kappung oder abzug_nach_kappung.}
\item{methodennachweis}{559e-Fördertatbestand sowie Anwendung der559aII-Jahresabzugsmethode auf den konkreten559e-Fall ausdrücklich rechtlich begründen; Kappungsreihenfolge ebenfalls zwingend vorgeben.}
}
\details{559e-Kostenbasis und10\%-Jahresumlage mit ausdrücklich qualifizierter559aII-Jahresförderung/Kappungsreihenfolge verbinden. Bedingte Heizungsrechnung nach559e:15\%des nicht nach lokaler559eII2ausgenommenen Kostenanteils als Erhaltungspauschale, dann einmaliger Kapitalbeitrag, positive Kostenbasis*10\%jährlich. Qualifizierte559aII-Zins-/laufende Jahresförderung mit bestehendem Förderkappungskern berücksichtigen. Die rechtliche Übertragung dieser Jahresabzugsmethode auf den konkreten559e-Förderfall wird ausdrücklich vorausgesetzt, nicht als allgemein geklärt behauptet. Der Nennbetrag eines rückzahlbaren Darlehens wird nicht ohne Rechtsgrund als verlorener Kapitalzuschuss behandelt. Mindestens eine tatsächliche berücksichtigungsfähige Förderung erforderlich; ohne Förderung ist559-Verfahren gesondert. Kein doppelter Abzug tatsächlicher Erhaltungskosten zusätzlich zur Pauschale; keine automatische Härte-/Förderfähigkeitsentscheidung. Gemeinsame exakte Zahlengrenzen nach NUMERIK.md. Fehlende Pflichteingaben EINGABE_FEHLT, unzulässige Typen/Bereiche EINGABE_UNGUELTIG.}
\value{Erhaltungspauschale, Kostenbasis, Jahresumlage vor laufender Förderung und beide Förderkappungswege. Einheit: EUR.}
\references{BGB_PDF_SHA256_9b5a99536e7b00756e9fa5f20082bd9ad3951b37c381fc0f5d52aa5a556839eb; BGB_559_T0001, BGB_559_T0002, BGB_559_T0003, BGB_559_T0004, BGB_559_T0005, BGB_559_T0006, BGB_559_T0007, BGB_559_T0008, BGB_559_T0009, BGB_559_T0010, BGB_559_T0011, BGB_559_T0012, BGB_559_T0013, BGB_559_T0014, BGB_559_T0015, BGB_559a_T0001, BGB_559a_T0002, BGB_559a_T0003, BGB_559a_T0004, BGB_559a_T0005, BGB_559a_T0006, BGB_559a_T0007, BGB_559a_T0008, BGB_559a_T0009, BGB_559e_T0001, BGB_559e_T0002, BGB_559e_T0003, BGB_559e_T0004, BGB_559e_T0005, BGB_559e_T0006, BGB_559e_T0007, BGB_559e_T0008}
\examples{
heizungsmodernisierung_mit_jahresfoerderung(
  kosten_wohnung = "10000",
  von_erhaltungspauschale_ausgenommene_kosten = "0",
  kapitalzuschuesse = "2000",
  jaehrliche_zinsermaessigung = "100",
  jaehrliche_laufende_foerderung = "20",
  monatliche_restkappung = "25",
  abzugsreihenfolge = "abzug_vor_kappung",
  methodennachweis = paste0(
    "Bedingte Heizungsrechnung nach559e:15\%des nicht nach lokaler",
    "559eII2ausgenommenen Kostenanteils als Erhaltungspauschale, ",
    "dann einmaliger Kapitalbeitrag, positive Kostenbasis*10\%jähr",
    "lich. Qualifizierte559aII-Zins-/laufende Jahresförderung mit",
    " bestehendem Förderkappungskern berücksichtigen. Die rechtli",
    "che Übertragung dieser Jahresabzugsmethode auf den konkreten",
    "559e-Förderfall wird ausdrücklich vorausgesetzt, nicht als a",
    "llgemein geklärt behauptet. Der Nennbetrag eines rückzahlbar",
    "en Darlehens wird nicht ohne Rechtsgrund als verlorener Kapi",
    "talzuschuss behandelt. Mindestens eine tatsächliche berücksi",
    "chtigungsfähige Förderung erforderlich; ohne Förderung ist55",
    "9-Verfahren gesondert. Kein doppelter Abzug tatsächlicher Er",
    "haltungskosten zusätzlich zur Pauschale; keine automatische ",
    "Härte-/Förderfähigkeitsentscheidung."
  )
)
}
