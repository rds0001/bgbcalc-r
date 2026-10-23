% Automatisch aus Fachverträgen erzeugt; fachliche Freigabe bleibt separat.
\name{schuldrecht_geldpositionssumme}
\alias{schuldrecht_geldpositionssumme}
\title{schuldrecht geldpositionssumme}
\description{Feste lokale BGB-Fassung; rechtlichen Anwendungsbereich und Bewertungen ausdrücklich bestimmen.}
\usage{schuldrecht_geldpositionssumme(
  regelfall = NULL,
  geldpositionen = NULL,
  einordnungsnachweis = NULL
)}
\arguments{
\item{regelfall}{Einer der ausdrücklich qualifizierten Normfälle: ratenlieferung_nettobetragsersatz, ruecktritt_geldrueckgewaehr_einer_partei, bereicherung_geldkomponenten, auftrag_geldherausgabe, mietmangel_schaden_und_selbstbeseitigung.}
\item{geldpositionen}{Unbenannte Liste1..10000 rechtlich zugeordneter nichtnegativer exakter EUR-Positionen ohne Überschneidungen. Keine Positionen ausdrücklich als einzelne Nullposition; leere Liste ist keine stillschweigende Null. Bei Rückgewähr nur dieselbe verpflichtete Partei, bei510 vollständiger relevanter Ratenplan.}
\item{einordnungsnachweis}{Nichtleerer Nachweis von Normfall, Zuordnung aller Positionen, maßgeblichem Zahlungs-/Rückgewährumfang und Vermeidung von Doppelzählungen.}
}
\details{Qualifizierte überschneidungsfreie Geldpositionen desselben gesetzlichen Berechnungsumfangs exakt summieren. Nur numerischer Summenbaustein für den ausdrücklich gewählten Normfall. Bei510 werden alle bis zum frühestmöglichen Kündigungszeitpunkt zu entrichtenden Raten erfasst, nicht nur offene. Bei346 je verpflichteter Partei getrennt; bei818 vor gesonderter Entreicherungs-/Haftungsprüfung. Keine automatische Aufrechnung, Sachbewertung oder Anspruchsentscheidung. §510III: Summe aller vom Verbraucher bis zum rechtlich frühestmöglichen Kündigungszeitpunkt zu entrichtenden Teilzahlungen. Stichtag und Zahlungsplan extern qualifizieren; keine Kürzung auf aktuell offene Raten, bereits gezahlte zum Umfang gehörende Raten bleiben enthalten. Keine Zahlungen erst nach dem maßgeblichen Vertragsende einbeziehen. Ergebnis ersetzt nur die Bezugsgröße Nettodarlehensbetrag für491II2Nr1, entscheidet nicht weitere Ausnahmen oder Widerrufsrechte. §346: ausschließlich rechtlich geschuldete Geldrückgewähr, Nutzungsherausgabe in Geld und Wertersatz einer bestimmten rückgewährpflichtigen Vertragspartei. Sachrückgabe nicht als zusätzliche Geldforderung bewerten; Wertersatz tritt an die Stelle der betreffenden Sachrückgabe. Kein doppeltes Erfassen von ursprünglichem Geldbetrag, Ersatzwert und denselben Nutzungen. Wertersatzausnahmen346III und Bewertungsmaßstab346II vorqualifiziert. Je Partei separat aufrufen; keine automatische Saldierung, Aufrechnung oder Durchbrechung von348. §818I/II: rechtlich zugeordnete Geldherausgabe, gezogene Nutzungen in Geld, erfasste Surrogate und an die Stelle nicht möglicher Herausgabe tretender Wertersatz. Originalgegenstand und an seine Stelle tretenden Wertersatz/Surrogat nicht doppelt einrechnen; physische Sachherausgabe bleibt gesondert. Dies ist die Summe VOR gesonderter Entreicherungsbegrenzung818III, verschärfter Haftung818IV/819/820 und Zahlungsanrechnung. Keine pauschale Addition beliebiger Ersatzansprüche oder Rechtsgrundprüfung. §667: ausschließlich Geldbeträge, die rechtlich aus dem zur Auftragsausführung Erhaltenen oder aus der Geschäftsbesorgung Erlangten herauszugeben sind. Nur unterschiedliche, noch nicht in anderen Positionen enthaltene Beträge; Sachherausgabe nicht in Geld umdeuten und denselben Vermögenswert nicht als Eingang und Surrogat doppelt zählen. Aufwendungsersatz670 und Vorschüsse669 gesondert, keine automatische Saldierung oder Aufrechnung. Eigennutzungszinsen668 separat. §536aI/II: Summe rechtlich ersatzfähiger Geldschäden und erforderlicher Selbstbeseitigungsaufwendungen aus demselben abgegrenzten Mangelkomplex. Anspruchsvoraussetzungen und jeweilige Schadensbemessung249ff vorqualifizieren. Jeder wirtschaftliche Nachteil nur einmal, auch bei mehreren Anspruchsgrundlagen; als Selbstbeseitigung enthaltene Reparatur nicht nochmals als Schaden addieren. Mietminderung536 und bereits geleisteter Ersatz separat, keine automatische Kumulation desselben Ausfalls. Geldbeträge als nichtnegative Dezimalzeichenfolge oder Bruchobjekt mit Zeichenfolgen zaehler/nenner. Exakte Ganzzahl-Zwischenwerte höchstens 2^53-1. Fehlende Pflichteingabe EINGABE_FEHLT, unzulässige Typen oder Bereiche EINGABE_UNGUELTIG.}
\value{wert: exakter EUR-Summenbruch des qualifizierten Umfangs; keine automatische Verrechnung gegenseitiger Ansprüche oder Entreicherung. Einheit: EUR.}
\references{BGB_PDF_SHA256_9b5a99536e7b00756e9fa5f20082bd9ad3951b37c381fc0f5d52aa5a556839eb; BGB_346_T0001, BGB_346_T0002, BGB_346_T0003, BGB_346_T0004, BGB_346_T0005, BGB_346_T0006, BGB_346_T0007, BGB_346_T0008, BGB_346_T0009, BGB_346_T0010, BGB_346_T0011, BGB_346_T0012, BGB_510_T0001, BGB_510_T0002, BGB_510_T0003, BGB_510_T0004, BGB_510_T0005, BGB_510_T0006, BGB_510_T0007, BGB_510_T0008, BGB_510_T0009, BGB_536a_T0001, BGB_536a_T0002, BGB_536a_T0003, BGB_536a_T0004, BGB_667_T0001, BGB_818_T0001, BGB_818_T0002, BGB_818_T0003, BGB_818_T0004}
\examples{
schuldrecht_geldpositionssumme(
  regelfall = "ratenlieferung_nettobetragsersatz",
  geldpositionen = list(
    "100",
    "25.5"
  ),
  einordnungsnachweis = paste0(
    "Rechtlich zugeordnete überschneidungsfreie Geldpositionen de",
    "s gewählten Normfalls."
  )
)
}
