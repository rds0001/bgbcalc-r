gesellschaft_jahresendkuendigung <- function(kuendigungszugang_am=NULL, kuendigungsfall=NULL, einordnungsnachweis=NULL) {
 .auswahl(kuendigungsfall,'kuendigungsfall',c('mitgliedschaft_725','privatglaeubiger_726'));.text(einordnungsnachweis,'einordnungsnachweis')
 m <- .frist(kuendigungszugang_am,3,'monate','ereignis');e <- as.Date(paste0(format(m,'%Y'),'-12-31'))
 wert <- list(dreimonatsfristende=format(m,'%Y-%m-%d'),beendigungsgrundtermin=format(e,'%Y-%m-%d'))
 eingaben <- list(kuendigungszugang_am=kuendigungszugang_am, kuendigungsfall=kuendigungsfall, einordnungsnachweis=einordnungsnachweis)
 ergebnis <- .ergebnis(wert,"daten","BGB_GESELLSCHAFT_JAHRESENDKUENDIGUNG",eingaben,list(list(operation="Dreimonats-Ereignisfrist berechnen und ersten danach liegenden Kalenderjahresablauf bestimmen.")),eingaben)
 ergebnis$hinweise <- list("725I/726: drei Kalendermonate ab wirksamem Zugang nach187I/188; erster Kalenderjahresablauf, der nicht vor diesem Mindestfristende liegt. Keine90Tage-Pauschale.725Gesellschaftsvertrags-/Zweckabweichungen, wichtiger Grund und Unzeit separat;726wirksame Anteilspf\u00e4ndung, Titel und erfolgloseVollstreckung im Sechsmonatsr\u00fcckblick rechtlich und zeitlich vorqualifizieren. Tats\u00e4chlicher K\u00fcndigungszugang ist Eingabe, keine automatische Vorverlegung oder193-Verschiebung. Ergebnis ausschlie\u00dflich gesetzlicher ordentlicher Beendigungsgrundtermin.")
 ergebnis
}
