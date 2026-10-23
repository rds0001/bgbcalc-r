% Automatisch aus Fachverträgen erzeugt; fachliche Freigabe bleibt separat.
\name{schatzfund_eigentumsquoten}
\alias{schatzfund_eigentumsquoten}
\title{schatzfund eigentumsquoten}
\description{Feste lokale BGB-Fassung; rechtlichen Anwendungsbereich und Bewertungen ausdrücklich bestimmen.}
\usage{schatzfund_eigentumsquoten(
  entdecker_id = NULL,
  eigentuemer_verbergende_sache_id = NULL,
  qualifizierter_schatz = NULL,
  entdeckt_und_infolge_entdeckung_besitzgenommen = NULL,
  abweichendes_landesrecht = NULL,
  einordnungsnachweis = NULL
)}
\arguments{
\item{entdecker_id}{Nichtleere Zeichenfolge des einen rechtlich bestimmten Entdeckers. Mehrere Entdecker oder dienst-/auftragsbezogene Zuordnungsfragen gesondert lösen; keine beliebige erste meldende Person einsetzen.}
\item{eigentuemer_verbergende_sache_id}{Nichtleere Zeichenfolge des einen Alleineigentümers der Sache, in der Schatz verborgen war. Nicht bloßer Besitzer oder Grundstücksnachbar. Bei Identität mit Entdecker werden beide Hälften zu1 vereinigt; Miteigentum der verbergenden Sache außerhalb dieses Modells.}
\item{qualifizierter_schatz}{Wahrheitswert, dass Sache so lange verborgen lag, dass ihr Eigentümer nicht mehr zu ermitteln ist. Unbekannter Eigentümer eines gewöhnlichen Funds allein genügt nicht.}
\item{entdeckt_und_infolge_entdeckung_besitzgenommen}{Wahrheitswert, dass Entdeckung und infolgedessen Besitzergreifung eingetreten sind. Bloße Vermutung eines Schatzes oder Meldung ohne Besitzergreifung nicht gleichsetzen.}
\item{abweichendes_landesrecht}{Wahrheitswert, dass am konkreten Fundort abweichende landesrechtliche Erwerbsregel, insbesondere Schatzregal, einschlägig ist. Dann NICHT_ANWENDBAR; FALSE nur nach rechtlicher Orts-/Sachprüfung, keine automatische Annahme für archäologische Funde.}
\item{einordnungsnachweis}{Nichtleere Begründung von Schatzcharakter, Entdeckung/Besitzergreifung, Personen-/Eigentümerzuordnung und Prüfung abweichenden Rechts am Fundort.}
}
\details{Im anwendbaren BGB-Schatzfundfall je Hälfte Entdecker und Eigentümer verbergender Sache; identische Person erhält beide Hälften zusammen. Nur ein Entdecker/ein Alleineigentümer. Landesrechtliche Schatzregale oder besondere Zuordnung können ausschließen; keine automatische Prüfung externer Rechtsquellen. Quoten begründen keinen Finderlohn oder Geldanspruch. Nichtleere Personenkennungen, explizite Wahrheitswerte und Nachweis; bei Schwärmen2..1000 Eigentümer, positive ganze Schwarmzahlen und Gesamtsumme höchstens2^53-1.}
\value{wert ist Liste mit eigentuemer_id/eigentumsquote; unterschiedliche Personen je1/2, identische Person einmal1. Ohne Tatbestand oder bei abweichendem Landesrecht NICHT_ANWENDBAR/null. Einheit: eigentumsquoten.}
\references{BGB_PDF_SHA256_9b5a99536e7b00756e9fa5f20082bd9ad3951b37c381fc0f5d52aa5a556839eb; BGB_984_T0001}
\examples{
schatzfund_eigentumsquoten(
  entdecker_id = "A",
  eigentuemer_verbergende_sache_id = "A",
  qualifizierter_schatz = TRUE,
  entdeckt_und_infolge_entdeckung_besitzgenommen = TRUE,
  abweichendes_landesrecht = FALSE,
  einordnungsnachweis = paste0(
    "Synthetisch geprüfter BGB-Schatzfund ohne abweichendes Lande",
    "srecht, ein Entdecker und ein Alleineigentümer."
  )
)
}
