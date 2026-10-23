modernisierung_haerteeinwand_beginnvergleich <- function(mitteilungseingang_utc=NULL, massnahmenbeginn_utc=NULL, einordnungsnachweis=NULL) {
 m <- .reise_utc_zeitpunkt(mitteilungseingang_utc,'mitteilungseingang_utc');b <- .reise_utc_zeitpunkt(massnahmenbeginn_utc,'massnahmenbeginn_utc');.text(einordnungsnachweis,'einordnungsnachweis')
 wert <- list(spaetestens_bis_massnahmenbeginn_mitgeteilt=m<=b)
 eingaben <- list(mitteilungseingang_utc=mitteilungseingang_utc, massnahmenbeginn_utc=massnahmenbeginn_utc, einordnungsnachweis=einordnungsnachweis)
 ergebnis <- .ergebnis(wert,"wahrheitswert","BGB_MODERNISIERUNG_HAERTEEINWAND_BEGINNVERGLEICH",eingaben,list(list(operation="Mitteilungszugang mit tatsaechlichem Massnahmenbeginn einschliesslich Grenzzeitpunkt vergleichen.")),eingaben)
 ergebnis$hinweise <- list("\u00a7555dIV2/V2: wirtschaftliche Haerte spaetestens bis zum Beginn der Modernisierung mitteilen. Zeitvergleich einschliesslich des Beginnzeitpunkts; keine pauschale Frist bis Tagesende, wenn Arbeiten schon morgens beginnen. Ausschliesslich diese zusaetzliche aeusserste Zeitgrenze. Der regulaere Monatsendtermin555dIII wird durch miete_erklaerungs_monatsendtermin berechnet; ordnungsgemaesse Ankuendigung, Hinweis-/Formausnahmen und unverschuldete unverzuegliche Nachholung sind rechtliche Voraussetzungen ohne feste zusaetzliche BGB-Tageszahl. Keine fixe Frist fuer unverzueglich erfinden und keine Uebertragung der wirtschaftlichen Ausschlussgrenze auf jeden Duldungshaertegrund. UTC-Zeitpunkte vorab normalisieren; keine lokalen Zeitzonen raten.")
 ergebnis
}
