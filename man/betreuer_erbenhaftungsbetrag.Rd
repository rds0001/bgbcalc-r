% Automatisch aus Fachverträgen erzeugt; fachliche Freigabe bleibt separat.
\name{betreuer_erbenhaftungsbetrag}
\alias{betreuer_erbenhaftungsbetrag}
\title{betreuer erbenhaftungsbetrag}
\description{Feste lokale BGB-Fassung; rechtlichen Anwendungsbereich und Bewertungen ausdrücklich bestimmen.}
\usage{betreuer_erbenhaftungsbetrag(
  verbleibender_uebergegangener_anspruch = NULL,
  nachlasswert_im_erbfall = NULL,
  bereits_ausgeschoepfter_haftungsrahmen = NULL,
  haftungsnachweis = NULL
)}
\arguments{
\item{verbleibender_uebergegangener_anspruch}{Nichtnegativer exakter EUR-Betrag des auf die Staatskasse übergegangenen, noch bestehenden Anspruchs nach Berücksichtigung rechtlich einschlägiger Ausschlüsse und Erlöschensgründe, insbesondere entsprechend102III/IVSGBXII. Bei vollständigem Ausschluss ausdrücklich null Euro, nicht unbekannt.}
\item{nachlasswert_im_erbfall}{Nichtnegativer rechtlich bestimmter EUR-Wert des beim Erbfall vorhandenen Nachlasses für1881Satz2, kein späterer Kontostand oder ungeprüfter Bruttovermögenswert.}
\item{bereits_ausgeschoepfter_haftungsrahmen}{Nichtnegativer EUR-Betrag, um den dieselbe Nachlasswert-Haftungsgrenze rechtlich bereits ausgeschöpft ist. Anrechnung vorqualifizieren; nicht jede beliebige Erbenzahlung oder Nachlassverbindlichkeit einsetzen. Bereits im verbleibenden Anspruch berücksichtigte Zahlung nicht erneut vom Anspruch abziehen.}
\item{haftungsnachweis}{Nichtleerer Nachweis der Erbenhaftung1881Satz2, des Nachlasswerts zum Erbfall, der verbleibenden Anspruchshöhe und etwaiger bereits wirksamer Ausschöpfung derselben Wertgrenze; externe102III/IV-Ausnahmen ausdrücklich vorqualifizieren.}
}
\details{Verbleibenden Nachlasswert-Haftungsrahmen als nichtnegativen Rest nach rechtlich qualifizierter Ausschöpfung berechnen; verbleibenden Staatskassenanspruch auf diesen Rahmen begrenzen. §1881Satz2: nur BGB-Nachlasswertdeckel bei bereits rechtlich bestimmten Eingaben, keine vollständige Sozialhilfe-Erbenhaftungsberechnung. Entsprechend102III/IVSGBXII geltende Ausnahmen und Erlöschen sind vorab in den verbleibenden Anspruch einzubeziehen; externe Freibeträge nicht erfinden.1880II wird nach1881Satz2 auf Erben nicht angewandt. Die Wertgrenze desselben Nachlasses bei mehreren Ansprüchen nicht mehrfach ungekürzt ausschöpfen; anrechenbare Vorbefriedigungen rechtlich belegen. Keine automatische Erbquotenaufteilung, gesamtschuldnerische Innenverteilung oder Sachbewertung. Betrag außerhalb des Rahmens ist rechnerisch ungedeckt, kein automatisches Erlöschen gegenüber anderen Verpflichteten. Überhöhte frühere Zahlung erzeugt hier keine Rückerstattung. Geldbeträge als nichtnegative Dezimalzeichenfolge oder Bruchobjekt mit Zeichenfolgen zaehler/nenner. Exakte Ganzzahl-Zwischenwerte höchstens 2^53-1. Fehlende Pflichteingabe EINGABE_FEHLT, unzulässige Typen oder Bereiche EINGABE_UNGUELTIG.}
\value{wert enthält verbleibender_haftungsrahmen, rechnerischer_haftungsbetrag und durch_rahmen_nicht_gedeckter_anspruch als exakte EUR-Brüche. Einheit: EUR.}
\references{BGB_PDF_SHA256_9b5a99536e7b00756e9fa5f20082bd9ad3951b37c381fc0f5d52aa5a556839eb; BGB_1881_T0001, BGB_1881_T0002}
\examples{
betreuer_erbenhaftungsbetrag(
  verbleibender_uebergegangener_anspruch = "100",
  nachlasswert_im_erbfall = "80",
  bereits_ausgeschoepfter_haftungsrahmen = "0",
  haftungsnachweis = paste0(
    "§1881Satz2: nur BGB-Nachlasswertdeckel bei bereits rechtlich",
    " bestimmten Eingaben, keine vollständige Sozialhilfe-Erbenha",
    "ftungsberechnung. Entsprechend102III/IVSGBXII geltende Ausna",
    "hmen und Erlöschen sind vorab in den verbleibenden Anspruch ",
    "einzubeziehen; externe Freibeträge nicht erfinden.1880II wir",
    "d nach1881Satz2 auf Erben nicht angewandt. Die Wertgrenze de",
    "sselben Nachlasses bei mehreren Ansprüchen nicht mehrfach un",
    "gekürzt ausschöpfen; anrechenbare Vorbefriedigungen rechtlic",
    "h belegen. Keine automatische Erbquotenaufteilung, gesamtsch",
    "uldnerische Innenverteilung oder Sachbewertung. Betrag außer",
    "halb des Rahmens ist rechnerisch ungedeckt, kein automatisch",
    "es Erlöschen gegenüber anderen Verpflichteten. Überhöhte frü",
    "here Zahlung erzeugt hier keine Rückerstattung."
  )
)
}
