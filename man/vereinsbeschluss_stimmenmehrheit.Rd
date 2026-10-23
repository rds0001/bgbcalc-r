% Automatisch aus Fachverträgen erzeugt; fachliche Freigabe bleibt separat.
\name{vereinsbeschluss_stimmenmehrheit}
\alias{vereinsbeschluss_stimmenmehrheit}
\title{vereinsbeschluss stimmenmehrheit}
\description{Feste lokale BGB-Fassung; rechtlichen Anwendungsbereich und Bewertungen ausdrücklich bestimmen.}
\usage{vereinsbeschluss_stimmenmehrheit(
  beschlussart = NULL,
  massgebliche_abgegebene_stimmen = NULL,
  ja_stimmen = NULL,
  abweichende_satzungsregel = NULL,
  stimmen_nachweis = NULL
)}
\arguments{
\item{beschlussart}{Auswahl ordentlich (§32 Absatz1 Satz3), satzungsaenderung (§33 Absatz1 Satz1) oder aufloesung (§41 Satz2). Zweckänderung nicht als gewöhnliche Satzungsänderung einordnen.}
\item{massgebliche_abgegebene_stimmen}{Nichtnegative ganze Zahl bis2^53-1 der rechtlich zählenden gültigen abgegebenen Stimmen. Stimmrechtsausschlüsse§34 sowie Behandlung ungültiger Stimmen und Enthaltungen bereits zutreffend bestimmen. Keine automatische Zählung aller anwesenden Personen als abgegebene Stimme.}
\item{ja_stimmen}{Ganze Zahl0..massgebliche_abgegebene_stimmen der rechtlich zählenden Zustimmungen zum konkreten Beschluss. Mehrfachstimmen nur im rechtlich zulässigen Bezugsmaßstab erfassen.}
\item{abweichende_satzungsregel}{Wahrheitswert einer wirksamen maßgeblichen abweichenden Satzungsregel. TRUE ergibt NICHT_ANWENDBAR. §40 erlaubt insbesondere keine Abbedingung des Stimmrechtsausschlusses§34.}
\item{stimmen_nachweis}{Nichtleere Beschreibung von Beschlussart, gültiger Bezugsmenge, ausgeschlossenen/ungültigen Stimmen, Enthaltungen und Satzungslage. Sonstige Wirksamkeitsanforderungen gesondert prüfen.}
}
\details{Ordentlicher Beschluss: mehr als die Hälfte, mindestens floor(n/2)+1 Ja-Stimmen. Satzungsänderung/Auflösung: mindestens ceil(3n/4). Ohne abgegebene Stimmen kein positiver Beschluss; mindestens1Ja-Stimme notwendig. Satzungsabweichung separat. Keine Prüfung von Einberufung, Bezeichnung des Gegenstands, Beschlussfähigkeit, behördlicher Genehmigung oder Stimmrechtsausschluss aus Personenmerkmalen. Zweckänderung und Umlaufbeschluss sind gesondert. Rechnerisch erreichte Mehrheit bestätigt keine umfassende Wirksamkeit. Geldbeträge als nichtnegative Dezimalzeichenfolge oder Bruchobjekt mit Zeichenfolgen zaehler/nenner. Exakte Ganzzahl-Zwischenwerte höchstens 2^53-1. Fehlende Pflichteingabe EINGABE_FEHLT, unzulässige Typen oder Bereiche EINGABE_UNGUELTIG.}
\value{wert enthält mindestens_ja_stimmen und stimmenmehrheit_erreicht; ohne Stimmen Mindestwert1 bei FALSE. Bei Satzungsabweichung NICHT_ANWENDBAR mit null. Einheit: stimmen_und_wahrheitswerte.}
\references{BGB_PDF_SHA256_9b5a99536e7b00756e9fa5f20082bd9ad3951b37c381fc0f5d52aa5a556839eb; BGB_32_T0003, BGB_33_T0001, BGB_34_T0001, BGB_40_T0001, BGB_40_T0002, BGB_41_T0002}
\examples{
vereinsbeschluss_stimmenmehrheit(
  beschlussart = "ordentlich",
  massgebliche_abgegebene_stimmen = 0,
  ja_stimmen = 0,
  abweichende_satzungsregel = FALSE,
  stimmen_nachweis = paste0(
    "Synthetisch rechtlich bestimmte gültige Stimmen ohne abweich",
    "ende Satzung."
  )
)
}
