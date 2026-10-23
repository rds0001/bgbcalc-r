% Automatisch aus Fachverträgen erzeugt; fachliche Freigabe bleibt separat.
\name{nachlass_spaetglaeubiger}
\alias{nachlass_spaetglaeubiger}
\title{nachlass spaetglaeubiger}
\description{Feste lokale BGB-Fassung; rechtlichen Anwendungsbereich und Bewertungen ausdrücklich bestimmen.}
\usage{nachlass_spaetglaeubiger(
  erbfall_am = NULL,
  geltendmachung_am = NULL,
  todeserklaerung_oder_todeszeitfeststellung = NULL,
  rechtskraft_am = NULL,
  erbenkenntnis_am = NULL,
  qualifizierte_anmeldung_im_aufgebot = NULL,
  glaeubiger_nach_1971_ausgenommen = NULL,
  einordnungsnachweis = NULL
)}
\arguments{
\item{erbfall_am}{ISO-Datum des rechtlich bestimmten Erbfalls.}
\item{geltendmachung_am}{ISO-Datum der maßgeblichen Geltendmachung der Nachlassforderung gegenüber dem Erben, frühestens Erbfall; für bereits früher geltend gemachte Forderungen das rechtlich maßgebliche frühere Datum verwenden.}
\item{todeserklaerung_oder_todeszeitfeststellung}{Expliziter Wahrheitswert: qualifizierte Todeserklärung oder Todeszeitfeststellung nach Verschollenheitsgesetz; TRUE erfordert rechtskraft_am.}
\item{rechtskraft_am}{Optionales ISO-Datum der Rechtskraft dieses Beschlusses, erforderlich bei entsprechender Todeserklärung/Feststellung, sonst NULL. Frist beginnt nicht vor diesem Tag; noch nicht rechtskräftige Fälle außerhalb dieses Modells.}
\item{erbenkenntnis_am}{Optionales ISO-Datum, an dem dem Erben die Forderung rechtlich relevant bekannt wurde, spätestens Geltendmachung. NULL bedeutet bis dahin keine Kenntnis, nicht unbekannte Aktenlage. Kenntnis spätestens am letzten Fristtag genügt.}
\item{qualifizierte_anmeldung_im_aufgebot}{Expliziter Wahrheitswert einer die Ausnahme des§1974 Absatz1 tragenden Anmeldung im Aufgebotsverfahren, einschließlich rechtlich geprüfter zeitlicher Anforderungen; nicht bloß beliebiger Schriftsatz.}
\item{glaeubiger_nach_1971_ausgenommen}{Expliziter Wahrheitswert: Forderung im konkret betrachteten Umfang gemäß§1971 vom Aufgebot nicht betroffen. Nur soweit Befriedigung aus dem geschützten Gegenstand betroffen, keine pauschale Befreiung einer ungesicherten Restforderung.}
\item{einordnungsnachweis}{Nichtleerer Nachweis zu Erbfall, Rechtskraft, maßgeblicher Geltendmachung, Kenntnis, Aufgebotsanmeldung und gegenstandsbezogenem Schutz.}
}
\details{Fünf Jahre ab Erbfall, frühestens Rechtskraft der qualifizierten Todeserklärung/Feststellung. Nur spätere Geltendmachung ohne rechtzeitige Erbenkenntnis und ohne qualifizierte Aufgebotsanmeldung führt zur Gleichstellung. §1971 führt im geschützten Umfang zu NICHT_ANWENDBAR. Kein Erlöschen/Verjähren, keine Einredeausübung, keine Rangfolgen aus Absatz2 und keine Vermögensverteilung nach§1973. Keine automatische Hemmung oder Wochenendverschiebung. ISO-Daten und berechnete Grenzen0001..9999, explizite Wahrheitswerte und nichtleerer Nachweis.}
\value{wert enthält fristbeginnereignis_am, fuenfjahresfristende, geltendmachung_nach_fuenf_jahren, forderung_rechtzeitig_bekannt und ausgeschlossenem_glaeubiger_gleichgestellt; §1971 ergibt NULL. Einheit: daten_und_wahrheitswerte.}
\references{BGB_PDF_SHA256_9b5a99536e7b00756e9fa5f20082bd9ad3951b37c381fc0f5d52aa5a556839eb; BGB_1974_T0001, BGB_1974_T0002, BGB_1974_T0004, BGB_1971_T0001, BGB_1971_T0002}
\examples{
nachlass_spaetglaeubiger(
  erbfall_am = "2030-01-31",
  geltendmachung_am = "2035-01-31",
  todeserklaerung_oder_todeszeitfeststellung = FALSE,
  rechtskraft_am = NULL,
  erbenkenntnis_am = NULL,
  qualifizierte_anmeldung_im_aufgebot = FALSE,
  glaeubiger_nach_1971_ausgenommen = FALSE,
  einordnungsnachweis = paste0(
    "Synthetisch rechtlich eingeordnete Forderung und Erbfall; ke",
    "ine früher maßgebliche Geltendmachung."
  )
)
}
