% Automatisch aus Fachverträgen erzeugt; fachliche Freigabe bleibt separat.
\name{vermaechtnis_dreissigjahresgrenze}
\alias{vermaechtnis_dreissigjahresgrenze}
\title{vermaechtnis dreissigjahresgrenze}
\description{Feste lokale BGB-Fassung; rechtlichen Anwendungsbereich und Bewertungen ausdrücklich bestimmen.}
\usage{vermaechtnis_dreissigjahresgrenze(
  erbfall_am = NULL,
  aufschubgrund = NULL,
  massgebliches_ereignis_am = NULL,
  prueftag = NULL,
  bestimmtes_personenereignis_angeordnet = NULL,
  ereignisperson_lebt_beim_erbfall = NULL,
  ereignisperson_juristische_person = NULL,
  geschwistervermaechtnis_nach_2163 = NULL,
  einordnungsnachweis = NULL
)}
\arguments{
\item{erbfall_am}{ISO-Datum des Erbfalls als Ereignisbeginn der dreißigjährigen Frist.}
\item{aufschubgrund}{Genau bedingung (aufschiebend), anfangstermin, zeugung (beim Erbfall noch nicht gezeugter Bedachter) oder persoenlichkeitsbestimmung (erst nach Erbfall bestimmende Tatsache). Je Aufruf ein rechtlich einschlägiger Grund; bei mehreren alle gesondert prüfen.}
\item{massgebliches_ereignis_am}{Optionales ISO-Datum tatsächlichen Bedingungs-/Termineintritts, Zeugung oder Bestimmungsereignisses je Grund. Bis Prüftag eingetreten; NULL bedeutet noch nicht eingetreten, nicht unbekannt. Bei Zeugung ausdrücklich nicht Geburt eingeben. Ereignis am Endtag gilt noch vor Ablauf um Tagesende. Zeugung/Bestimmung muss zeitlich nach Erbfall liegen; am gleichen Kalendertag Reihenfolge belegen.}
\item{prueftag}{ISO-Datum mindestens Erbfalltag; Prüfung zum Tagesende.}
\item{bestimmtes_personenereignis_angeordnet}{Wahrheitswert: Vermächtnis ist für bestimmtes Ereignis in Person gerade des Beschwerten oder Bedachten angeordnet (§2163 Absatz1 Nummer1); keine beliebige dritte Person.}
\item{ereignisperson_lebt_beim_erbfall}{Wahrheitswert, ob diese Ereignisperson beim Erbfall lebt. Lebenszeit bei späterem Prüftag ist nicht maßgeblich.}
\item{ereignisperson_juristische_person}{Wahrheitswert, ob Beschwerter/Bedachter, in dessen Person maßgebliches Ereignis eintreten soll, juristische Person ist; dann§2163 Absatz2 Dreißigjahresgrenze. Ohne entsprechende Ereignisperson FALSE, nicht unbekannt.}
\item{geschwistervermaechtnis_nach_2163}{Wahrheitswert des qualifizierten Sonderfalls Nummer2: Erbe, Nacherbe oder Vermächtnisnehmer für Geburt eines eigenen Bruders/einer eigenen Schwester zugunsten dieses Geschwisters beschwert. Keine beliebige Geschwisterzuwendung.}
\item{einordnungsnachweis}{Nichtleere rechtliche Begründung des Aufschubgrunds, Ereignisses einschließlich Zeugung versus Geburt sowie Personen-/Geschwisterausnahmen und etwaiger gleichdatierter Ereignisreihenfolge.}
}
\details{Dreißigjahresfrist ab Erbfall berechnen. Ohne maßgebliches Ereignis spätestens am Endtag führt Ablauf zur Unwirksamkeit aus geprüftem Grund, außer qualifizierte Ausnahme§2163. Personenereignis benötigt beim Erbfall lebende Person; juristische Ereignisperson verbleibt in Dreißigjahresgrenze. Ein Aufschubgrund pro Aufruf; mehrere Gründe gesondert prüfen. Keine Gesamtwirksamkeitsprüfung, kein Anfall§§2177/2178 und keine Nacherbfolge§2109. Nach Ablauf eingetretenes Ereignis heilt Unwirksamkeit nicht. Zeugung, nicht Geburt, wahrt Frist bei§2162 Absatz2. ISO-Daten und berechnete Grenzen0001..9999; explizite Wahrheitswerte, zulässiger Aufschubgrund und nichtleerer Nachweis.}
\value{wert enthält dreissigjahresfristende, frist_am_prueftag_abgelaufen, massgebliches_ereignis_rechtzeitig, ausnahme_nach_2163 und unwirksam_wegen_geprueften_aufschubgrundes. FALSE ist keine Aussage über Gesamtwirksamkeit. Einheit: daten_und_wahrheitswerte.}
\references{BGB_PDF_SHA256_9b5a99536e7b00756e9fa5f20082bd9ad3951b37c381fc0f5d52aa5a556839eb; BGB_2162_T0001, BGB_2162_T0002, BGB_2163_T0001, BGB_2163_T0002, BGB_2163_T0003, BGB_2163_T0004}
\examples{
vermaechtnis_dreissigjahresgrenze(
  erbfall_am = "2000-02-29",
  aufschubgrund = "bedingung",
  massgebliches_ereignis_am = NULL,
  prueftag = "2030-02-28",
  bestimmtes_personenereignis_angeordnet = FALSE,
  ereignisperson_lebt_beim_erbfall = FALSE,
  ereignisperson_juristische_person = FALSE,
  geschwistervermaechtnis_nach_2163 = FALSE,
  einordnungsnachweis = paste0(
    "Synthetisch qualifizierter einzelner Aufschubgrund, tatsächl",
    "iches Ereignis und gesetzliche Ausnahmen."
  )
)
}
