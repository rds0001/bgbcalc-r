gesellschaft_gewinn_verlust_betraege <- function(gesellschaftsergebnis=NULL, gesellschafter=NULL, quotenbasis=NULL, einordnungsnachweis=NULL) {
 gesamt <- .zahleneingabe(gesellschaftsergebnis)
 quoten <- gesellschaft_gewinn_verlust_stimmquoten(gesellschafter,quotenbasis,einordnungsnachweis)$wert
 wert <- lapply(quoten,function(person) list(gesellschafter_id=person$gesellschafter_id,quote=person$quote,ergebnisanteil=.bruchteile(.multiplizieren(gesamt,.zahleneingabe(person$quote)))))
 eingaben <- list(gesellschaftsergebnis=gesellschaftsergebnis, gesellschafter=gesellschafter, quotenbasis=quotenbasis, einordnungsnachweis=einordnungsnachweis)
 ergebnis <- .ergebnis(wert,"EUR","BGB_GESELLSCHAFT_GEWINN_VERLUST_BETRAEGE",eingaben,list(list(operation="Vorhandenen709-Quotenkern anwenden; vorzeichenbehaftetes festgestelltes Gesellschaftsergebnis mit jeder Quote exakt multiplizieren.")),eingaben)
 ergebnis$hinweise <- list("\u00a7\u00a7709III/718: festgestelltes Gesellschaftsergebnis mit rechtlich ausgew\u00e4hlter Gewinn-/Verlustquote verteilen. Beteiligungsverh\u00e4ltnisse haben Vorrang vor vereinbarten Beitragswerten, sonst gleiche Anteile. Individuelle abweichende Gewinn-/Verlustvereinbarungen und wechselnder Gesellschafterbestand gesondert. Rechnerische Ergebnisanteile sind nicht automatisch f\u00e4llige Aussch\u00fcttungen oder sofortige Nachschusspflichten; keine Vermischung mit Liquidation oder Ausscheiden. Im Zweifel Rechnungsabschluss und Gewinnverteilung zum Kalenderjahresende718; abweichende Vereinbarung vorqualifizieren. Keine Rundung, kein Restcentverfahren.")
 ergebnis
}
