miete_formmangel_beendigungsgrenze <- function(ueberlassung_am=NULL, ordentlicher_beendigungstag=NULL, einordnungsnachweis=NULL) {
 u <- .datum(ueberlassung_am,'ueberlassung_am');o <- .datum(ordentlicher_beendigungstag,'ordentlicher_beendigungstag');.text(einordnungsnachweis,'einordnungsnachweis')
 if(o!=.frist(paste0(substr(ordentlicher_beendigungstag,1,7),'-01'),1,'monate','tagesbeginn')) .fehler('ordentlicher_beendigungstag','Regulaerer Monatsendtermin erforderlich.')
 j <- .frist(ueberlassung_am,1,'jahre','ereignis');basis <- max(j,o);ende <- .frist(paste0(substr(format(basis,'%Y-%m-%d'),1,7),'-01'),1,'monate','tagesbeginn')
 wert <- list(jahresmindestgrenze=format(j,'%Y-%m-%d'),fruehester_monatsendtermin=format(ende,'%Y-%m-%d'))
 eingaben <- list(ueberlassung_am=ueberlassung_am, ordentlicher_beendigungstag=ordentlicher_beendigungstag, einordnungsnachweis=einordnungsnachweis)
 ergebnis <- .ergebnis(wert,"daten","BGB_MIETE_FORMMANGEL_BEENDIGUNGSGRENZE",eingaben,list(list(operation="Jahresmindestbindung550mit regulaerem Monatsendtermin verbinden und erforderlichenfalls bis zum naechsten zulaessigen Monatsende verschieben.")),eingaben)
 ergebnis$hinweise <- list("\u00a7550Satz2: regulaeren ordentlichen Monatsendtermin mit dem Ablauf eines Jahres nach tatsaechlicher Ueberlassung vergleichen. Liegt der regulaere Termin davor, ersten Monatsendtermin bestimmen, der die Jahresgrenze erreicht. Nicht bloss das Maximum mit einem mitten im Monat liegenden Jahrestag als angeblich zulaessigen Kuendigungstermin ausgeben. Ueberlassungsereignis nach187I, keine pauschale365Tage-Dauer. Die ordentliche Frist wird vom bestehenden Wohnraummietkern berechnet; diese Funktion fuegt nur550-Mindestbindung hinzu. Kein automatischer Formmangelentscheid, keine Kuendigungssperre fuer ausserordentliche wichtige Gruende und keine Behandlung abweichender wirksamer Terminvereinbarungen. Bei rechtlich anderem Beginn187II gesondert qualifizieren.")
 ergebnis
}
