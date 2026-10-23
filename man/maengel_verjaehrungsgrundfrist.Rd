% Automatisch aus Fachverträgen erzeugt; fachliche Freigabe bleibt separat.
\name{maengel_verjaehrungsgrundfrist}
\alias{maengel_verjaehrungsgrundfrist}
\title{maengel verjaehrungsgrundfrist}
\description{Feste lokale BGB-Fassung; rechtlichen Anwendungsbereich und Bewertungen ausdrücklich bestimmen.}
\usage{maengel_verjaehrungsgrundfrist(
  regelbereich = NULL,
  fristgruppe = NULL,
  fristbeginnereignis_am = NULL,
  arglistig_verschwiegen = NULL,
  regelmaessiger_weg_letzter_tag = NULL,
  abweichende_sonderregel = NULL,
  einordnungsnachweis = NULL
)}
\arguments{
\item{regelbereich}{Auswahl kauf (§438, Ansprüche§437 Nummer1/3) oder werk (§634a, Ansprüche§634 Nummer1/2/4). Rücktritt und Minderung nicht als automatisch verjährende Ansprüche in diese Funktion einsetzen.}
\item{fristgruppe}{Auswahl dingliches_drittrecht (nur Kauf: Herausgabe begründendes dingliches Drittrecht oder sonstiges im Grundbuch eingetragenes Recht nach§438 Absatz1 Nummer1), bauwerk (Kauf einschließlich üblicherweise eingebauter, Bauwerksmangel verursachender Sache nachNummer2; Werk einschließlich Bauwerksplanung/-überwachung), sonstige_sache (Kauf übrige Fälle; Werk Herstellung/Wartung/Veränderung einer Sache oder zugehörige Planung/Überwachung, vorbehaltlich Bauwerksgruppe), sonstiges_werk (nur Werk: regelmäßiger Weg§634a Absatz1 Nummer3). Rechtliche Zuordnung und Vorrang prüfen; nicht jedes Baumaterial ungeprüft in Bauwerksgruppe einordnen.}
\item{fristbeginnereignis_am}{ISO-Datum0001..9999 des gesetzlich richtigen Ereignisses: Kauf bei Grundstück Übergabe, sonst Ablieferung; Werk bei Zwei-/Fünfjahresweg Abnahme. Erforderlich für feste Frist sowie Bauwerksmindestfrist bei Arglist. Bei rein regelmäßigem Weg optional NULL/None; freiwillig eingegebene Daten werden validiert.}
\item{arglistig_verschwiegen}{Wahrheitswert des arglistigen Verschweigens gerade dieses Mangels durch Verkäufer/Unternehmer. Kein bloßes Kennenmüssen. Bei dinglichem Dreißigjahresweg des Kaufs führt Arglist nicht in den regelmäßigen Weg.}
\item{regelmaessiger_weg_letzter_tag}{ISO-Datum0001..9999 des vorab korrekt bestimmten rechnerischen letzten Tags nach dem regelmäßigen Verjährungsweg, einschließlich einschlägiger Entstehung/Kenntnis und Höchstgrenzen. Erforderlich für sonstiges_werk und Arglist außer dinglichem Dreißigjahresweg; sonst optional NULL/None. Nur Grundfrist ohne noch zu kombinierende Hemmungen/Neubeginne/Nachläufe, konsistent mit der verglichenen festen Grundfrist.}
\item{abweichende_sonderregel}{Wahrheitswert, ob eine andere einschlägige Sonderregel/zulässige Vertragsregel die hier berechnete Grundfrist verdrängt. TRUE ergibt NICHT_ANWENDBAR. Nachträgliche Hemmungen/§475e-Nachläufe sind separat zu kombinieren, nicht blind die Grundfrist ersetzen.}
\item{einordnungsnachweis}{Nichtleere Begründung von Anspruchsart, Zuordnung zur gesetzlichen Fristgruppe, Beginnereignis, Arglist und gegebenenfalls regelmäßiger Grundfrist mit ihren Anknüpfungstatsachen.}
}
\details{Fristweg nach Regelbereich/Gruppe wählen:30/5/2Jahre oder regelmäßiger Weg. Arglist führt außer§438 Absatz1 Nummer1 zum regelmäßigen Weg; beim Bauwerk Maximum aus diesem Weg und Fünfjahresgrundfrist. Nur Grundfristverknüpfung, keine abschließende Verjährung. Regelmäßiger Weg wird separat berechnet und belegt eingegeben; dessen unveränderte Rückgabe im einschlägigen Auswahlzweig ist keine neue Berechnung dieses Wegs. §218/Rücktritt/Minderung sowie besondere Verbraucher-/Digitalregeln gesondert. ISO-Daten und berechnete Fristgrenzen0001..9999, explizite Auswahl/Wahrheitswerte und nichtleerer Nachweis. Optionale Datumsparameter nach beschriebenem Fristweg.}
\value{wert enthält verjaehrungsweg als deutsche Kennung und rechnerischer_letzter_tag als ISO-Datum. Bei verdrängender Sonderregel NICHT_ANWENDBAR/null. Einheit: fristdaten.}
\references{BGB_PDF_SHA256_9b5a99536e7b00756e9fa5f20082bd9ad3951b37c381fc0f5d52aa5a556839eb; BGB_438_T0001, BGB_438_T0002, BGB_438_T0003, BGB_438_T0004, BGB_438_T0005, BGB_438_T0006, BGB_438_T0007, BGB_438_T0008, BGB_438_T0009, BGB_438_T0010, BGB_438_T0011, BGB_634a_T0001, BGB_634a_T0002, BGB_634a_T0003, BGB_634a_T0004, BGB_634a_T0005, BGB_634a_T0006, BGB_634a_T0007}
\examples{
maengel_verjaehrungsgrundfrist(
  regelbereich = "kauf",
  fristgruppe = "dingliches_drittrecht",
  fristbeginnereignis_am = "2024-02-29",
  arglistig_verschwiegen = FALSE,
  regelmaessiger_weg_letzter_tag = "2027-12-31",
  abweichende_sonderregel = FALSE,
  einordnungsnachweis = paste0(
    "Synthetisch richtig eingeordneter Anspruch und Fristbeginn o",
    "hne andere Fristveränderungen."
  )
)
}
