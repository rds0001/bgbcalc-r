buergschaft_schuldkomponenten <- function(schuldpositionen=NULL,einordnungsnachweis=NULL) {
 .vorhanden(schuldpositionen,'schuldpositionen')
 if(!is.list(schuldpositionen)||!is.null(names(schuldpositionen))||length(schuldpositionen)<1||length(schuldpositionen)>1000) .fehler('schuldpositionen','Liste mit1bis1000 eindeutig zugeordneten Schuldpositionen erforderlich.')
 .text(einordnungsnachweis,'einordnungsnachweis');namen <- character();einbezogen <- .bruch(0);ausgeschlossen <- .bruch(0)
 for(position in schuldpositionen) {
  if(!is.list(position)||length(position)!=3||!setequal(names(position),c('positions_id','betrag','spaetere_rechtsgeschaeftliche_erweiterung'))) .fehler('schuldpositionen','Genau positions_id, betrag und spaetere_rechtsgeschaeftliche_erweiterung erforderlich.')
  name <- .text(position$positions_id,'positions_id')
  if(name %in% namen) .fehler('positions_id','Schuldposition darf nicht mehrfach erfasst werden.')
  namen <- c(namen,name);betrag <- .geld(position$betrag);.wahrheitswert(position$spaetere_rechtsgeschaeftliche_erweiterung,'spaetere_rechtsgeschaeftliche_erweiterung')
  if(!position$spaetere_rechtsgeschaeftliche_erweiterung) einbezogen <- .addieren(einbezogen,betrag) else ausgeschlossen <- .addieren(ausgeschlossen,betrag)
 }
 eingaben <- list(schuldpositionen=schuldpositionen,einordnungsnachweis=einordnungsnachweis)
 ergebnis <- .ergebnis(list(schuldumfang_nach_767=.bruchteile(einbezogen),ausgeschlossene_erweiterungen=.bruchteile(ausgeschlossen)),'EUR','BGB_BUERGSCHAFT_SCHULDKOMPONENTEN',eingaben,list(list(operation="Qualifizierte Schuldkomponenten summieren; sp\u00e4tere rechtsgesch\u00e4ftliche Erweiterungen getrennt ausschlie\u00dfen.")),eingaben)
 ergebnis$hinweise <- list("\u00a7767I/II: qualifizierter gegenw\u00e4rtiger Hauptschuldbestand einschlie\u00dflich zurechenbarer Verschuldens-/Verzugsfolgen und vom Hauptschuldner zu ersetzender K\u00fcndigungs-/Rechtsverfolgungskosten. Jede Komponente nur einmal erfassen. Durch ein nach \u00dcbernahme der B\u00fcrgschaft vorgenommenes Rechtsgesch\u00e4ft des Hauptschuldners bewirkte Erweiterungen gesondert ausschlie\u00dfen; nur den Erweiterungsanteil als eigene Position kennzeichnen, nicht die unver\u00e4nderte gesamte Hauptschuld. Ursache, Zeitpunkt, wirksame B\u00fcrgschaft und Zuordnung extern qualifizieren. Vertragliche H\u00f6chstbetr\u00e4ge, weitere Haftungsgrenzen, Einreden768/770, Mitb\u00fcrgen769 und bereits geleistete Zahlungen gesondert ber\u00fccksichtigen. Numerischer Umfang nach767, kein abschlie\u00dfender durchsetzbarer Zahlungsanspruch. Keine Positionen ausdr\u00fccklich als einzelne Nullposition eingeben.")
 ergebnis
}
