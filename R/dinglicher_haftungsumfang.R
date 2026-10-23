dinglicher_haftungsumfang <- function(regelfall=NULL, forderungsbestandteile=NULL, zuordnungsnachweis=NULL) {
  faelle <- list(hypothek_1118=c("forderung","gesetzliche_zinsen","kuendigungskosten","rechtsverfolgungskosten"), pfand_1210=c("forderung","zinsen","vertragsstrafen","verwendungsersatz","kuendigungskosten","rechtsverfolgungskosten","pfandverkaufskosten"))
  .text(regelfall,'regelfall')
  if (!regelfall %in% names(faelle)) .fehler('regelfall','Unbekannter Sicherungsfall.')
  .vorhanden(forderungsbestandteile,'forderungsbestandteile')
  if (!is.list(forderungsbestandteile) || length(forderungsbestandteile)!=length(faelle[[regelfall]]) || !setequal(names(forderungsbestandteile),faelle[[regelfall]])) .fehler('forderungsbestandteile','Genau die f\u00fcr den Sicherungsfall festgelegten Komponenten erforderlich; fehlende Anspr\u00fcche mit nullEUR angeben.')
  .text(zuordnungsnachweis,'zuordnungsnachweis')
  summe <- .bruch(0)
  for (name in faelle[[regelfall]]) summe <- .addieren(summe,.geld(forderungsbestandteile[[name]]))
  eingaben <- list(regelfall=regelfall,forderungsbestandteile=forderungsbestandteile,zuordnungsnachweis=zuordnungsnachweis)
  ergebnis <- .ergebnis(.bruchteile(summe),'EUR','BGB_DINGLICHER_HAFTUNGSUMFANG',eingaben,list(list(operation='Rechtlich gedeckte, nicht \u00fcberlappende Forderungsbestandteile summieren.')),eingaben)
  ergebnis$hinweise <- list("Nur Umfang bereits rechtlich zugeordneter, nicht \u00fcberlappender gedeckter Forderungsbestandteile.1118 enth\u00e4lt gesetzliche Zinsen sowie K\u00fcndigung und Rechtsverfolgung zur Befriedigung aus dem Grundst\u00fcck.1210: nachtr\u00e4gliche rechtsgesch\u00e4ftliche Erweiterungen des pers\u00f6nlichen Schuldners bei abweichendem Pfandeigent\u00fcmer ausgeschlossen. Forderung ohne nochmals getrennt erfasste Nebenbetr\u00e4ge angeben. Keine Ermittlung von Zinslauf, Rang, Verwertungserl\u00f6s oder tats\u00e4chlicher Deckung; externe Sonderbegrenzungen gesondert.")
  ergebnis
}
