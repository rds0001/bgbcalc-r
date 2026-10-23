% Automatisch aus Fachverträgen erzeugt; fachliche Freigabe bleibt separat.
\name{fortsetzung_beguenstigtenbezogene_lasten}
\alias{fortsetzung_beguenstigtenbezogene_lasten}
\title{fortsetzung beguenstigtenbezogene lasten}
\description{Feste lokale BGB-Fassung; gesetzlicher Anwendungsbereich und externe Bewertungen ausdrücklich vorqualifiziert.}
\usage{fortsetzung_beguenstigtenbezogene_lasten(
  abkoemmlinge = NULL,
  lasten = NULL,
  einordnungsnachweis = NULL
)}
\arguments{
\item{abkoemmlinge}{Liste1..1000 eindeutiger abkoemmling_id und grundanteilswert vor den hier erfassten Lasten. Keine bereits abgezogene Last nochmals eingeben.}
\item{lasten}{Liste0..1000 mit last_id, betrag und beguenstigte; je Last1..1000 Objekte abkoemmling_id und positives lastgewicht. Nur tatsaechlich beguenstigte Personen aufnehmen.}
\item{einordnungsnachweis}{1503III beziehungsweise1511III2, tatsaechlich gezahlte Abfindung/Ausschlussbetrag, beguenstigte Personen und rechtlich zutreffende relative Lastgewichte belegen.}
}
\details{Jede qualifizierte Last nach relativen Beguenstigtengewichten verteilen, personenbezogen addieren und vom ungekürzten Ausgangsanteilswert abziehen. §1503III/§1511III2: Abfindungs-/Ausschlusslast nur bei den durch Verzicht/Ausschliessung beguenstigten Abkoemmlingen verteilen. Relative Lastgewichte sind rechtlich bestimmte Vorteils-/Belastungsverhaeltnisse, nicht automatisch Erbquoten oder gleiche Kopfanteile. Jede Last wird exakt einmal verteilt; nicht beguenstigte Personen behalten ihren Ausgangswert. Grundanteilswerte muessen vor diesen Lasten und unter zutreffender Gesamtgutsbilanz1501/1498 bestimmt sein. Negative Salden sind ausschliesslich rechnerische Bilanzgroessen, kein ausgegebener Nachschuss-, Rueckzahlungs- oder persoenlicher Ersatzanspruch;1498/1476II2 beachten. Keine eigenstaendige Ermittlung von Berechtigung, Lastgewichten, Abfindungswirksamkeit oder faelliger Barauszahlung. Gemeinsame exakte Zahlengrenzen nach NUMERIK.md. Fehlende Pflichteingaben EINGABE_FEHLT, unzulässige Typen/Bereiche EINGABE_UNGUELTIG.}
\value{Abkoemmlingssalden mit Ausgangswert, Lastensumme und vorzeichenbehaftetem rechnerischem Saldo sowie entsprechende Gesamtsummen. Keine persoenlichen Nachschusspflichten. Einheit: EUR.}
\references{BGB_PDF_SHA256_9b5a99536e7b00756e9fa5f20082bd9ad3951b37c381fc0f5d52aa5a556839eb; BGB_1503_T0003, BGB_1511_T0004, BGB_1511_T0005, BGB_1498_T0001, BGB_1498_T0002}
\examples{
fortsetzung_beguenstigtenbezogene_lasten(
  abkoemmlinge = list(
    list(
    "abkoemmling_id" = "A",
    "grundanteilswert" = "200"
  ),
    list(
    "abkoemmling_id" = "B",
    "grundanteilswert" = "200"
  ),
    list(
    "abkoemmling_id" = "C",
    "grundanteilswert" = "200"
  )
  ),
  lasten = list(
    list(
    "last_id" = "L1",
    "betrag" = "120",
    "beguenstigte" = list(
    list(
    "abkoemmling_id" = "A",
    "lastgewicht" = "1"
  )
  )
  )
  ),
  einordnungsnachweis = paste0(
    "§1503III/§1511III2: Abfindungs-/Ausschlusslast nur bei den d",
    "urch Verzicht/Ausschliessung beguenstigten Abkoemmlingen ver",
    "teilen. Relative Lastgewichte sind rechtlich bestimmte Vorte",
    "ils-/Belastungsverhaeltnisse, nicht automatisch Erbquoten od",
    "er gleiche Kopfanteile. Jede Last wird exakt einmal verteilt",
    "; nicht beguenstigte Personen behalten ihren Ausgangswert. G",
    "rundanteilswerte muessen vor diesen Lasten und unter zutreff",
    "ender Gesamtgutsbilanz1501/1498 bestimmt sein. Negative Sald",
    "en sind ausschliesslich rechnerische Bilanzgroessen, kein au",
    "sgegebener Nachschuss-, Rueckzahlungs- oder persoenlicher Er",
    "satzanspruch;1498/1476II2 beachten. Keine eigenstaendige Erm",
    "ittlung von Berechtigung, Lastgewichten, Abfindungswirksamke",
    "it oder faelliger Barauszahlung."
  )
)
}
