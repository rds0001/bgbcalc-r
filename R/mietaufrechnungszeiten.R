miete_gegenforderung_zeitvergleich <- function(kenntnis_eigentumsuebergang_utc=NULL, gegenforderung_erworben_utc=NULL, gegenforderung_faellig_utc=NULL, miete_faellig_utc=NULL, einordnungsnachweis=NULL) {
 kenntnis_eigentumsuebergang <- .reise_utc_zeitpunkt(kenntnis_eigentumsuebergang_utc,"kenntnis_eigentumsuebergang_utc")
 gegenforderung_erworben <- .reise_utc_zeitpunkt(gegenforderung_erworben_utc,"gegenforderung_erworben_utc")
 gegenforderung_faellig <- .reise_utc_zeitpunkt(gegenforderung_faellig_utc,"gegenforderung_faellig_utc")
 miete_faellig <- .reise_utc_zeitpunkt(miete_faellig_utc,"miete_faellig_utc")
 .text(einordnungsnachweis,'einordnungsnachweis')
 erwerbspaeter <- gegenforderung_erworben>kenntnis_eigentumsuebergang
 faelligspaeter <- gegenforderung_faellig>kenntnis_eigentumsuebergang && gegenforderung_faellig>miete_faellig
 wert <- list(erwerb_nach_kenntnis=erwerbspaeter,faelligkeit_nach_kenntnis_und_miete=faelligspaeter,zeitlicher_ausschluss=erwerbspaeter||faelligspaeter)
 eingaben <- list(kenntnis_eigentumsuebergang_utc=kenntnis_eigentumsuebergang_utc, gegenforderung_erworben_utc=gegenforderung_erworben_utc, gegenforderung_faellig_utc=gegenforderung_faellig_utc, miete_faellig_utc=miete_faellig_utc, einordnungsnachweis=einordnungsnachweis)
 ergebnis <- .ergebnis(wert,"wahrheitswerte","BGB_MIETE_GEGENFORDERUNG_ZEITVERGLEICH",eingaben,list(list(operation="Erwerb nach Kenntnis oder Gegenforderungsf\u00e4lligkeit sowohl nach Kenntnis als auch nach Mietf\u00e4lligkeit durch strikte Zeitvergleiche bestimmen.")),eingaben)
 ergebnis$hinweise <- list("\u00a7566dSatz2: ausschlie\u00dflich numerische Chronologie der zeitlichen Ausschlusstatbest\u00e4nde. Gleichzeitigkeit erf\u00fcllt das jeweilige nach/sp\u00e4ter nicht. Erwerb der Gegenforderung nach Kenntnis gen\u00fcgt unabh\u00e4ngig vom F\u00e4lligkeitsvergleich; bei fr\u00fcherem/gleichzeitigem Erwerb ist die zweite Alternative nur bei F\u00e4lligkeit nach BEIDEN Bezugspunkten erf\u00fcllt. Keine automatische Aufrechnungsberechtigung:566dSatz1,566c, \u00fcbrige Aufrechnungsvoraussetzungen und Betr\u00e4ge gesondert. Sekundengenaue tats\u00e4chliche UTC-Zeitpunkte erforderlich; keine Zeitzonenannahme, keine k\u00fcnstliche Mitternacht bei lediglich bekannten Tagen, keine Subsekunden abschneiden. Standard-Datumsbibliotheken \u00fcber vorhandenen UTC-Parser wiederverwendet.")
 ergebnis
}
