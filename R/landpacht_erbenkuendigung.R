landpacht_erbenkuendigung_quartalstermin <- function(kuendigungszugang_am=NULL, einordnungsnachweis=NULL) {
 .text(einordnungsnachweis,'einordnungsnachweis')
 grund <- .frist(kuendigungszugang_am,6,'monate','ereignis')
 monat <- as.integer(format(grund,'%m'));jahr <- as.integer(format(grund,'%Y'))
 quartalsbeginn <- 3*((monat-1)%/%3)+1
 ende <- .frist(sprintf('%04d-%02d-01',jahr,quartalsbeginn),3,'monate','tagesbeginn')
 wert <- list(sechsmonatige_kuendigungsfrist_letzter_tag=.iso(grund),rechnerischer_pachtendtermin=.iso(ende))
 eingaben <- list(kuendigungszugang_am=kuendigungszugang_am, einordnungsnachweis=einordnungsnachweis)
 ergebnis <- .ergebnis(wert,"daten","BGB_LANDPACHT_ERBENKUENDIGUNG_QUARTALSTERMIN",eingaben,list(list(operation="Sechsmonatige K\u00fcndigungsfrist auf n\u00e4chstes zul\u00e4ssiges Kalenderquartalsende ausrichten.")),eingaben)
 ergebnis$hinweise <- list("\u00a7594dI: sechs Kalendermonate ab tats\u00e4chlichem K\u00fcndigungszugang berechnen, anschlie\u00dfend erstes Kalenderquartalsende ausw\u00e4hlen, das nicht vor dieser Fristgrenze liegt. Einmonatige Aus\u00fcbungsfrist ab Kenntnis ist eigenst\u00e4ndig; sechs Monate beginnen nicht schon mit Tod oder Kenntnis. Erbenwiderspruch594dII und Fortsetzungsentscheidung gesondert. Keine automatische Feiertagsverschiebung des Pachtendtermins.")
 ergebnis
}
