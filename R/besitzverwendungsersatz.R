besitz_notwendiger_verwendungsersatz <- function(notwendige_eigene_verwendungen=NULL,ausgeschlossene_erhaltungskosten=NULL,ausgeschlossene_lasten=NULL,ersatzfaehige_vorgaengerverwendungen=NULL,zuordnungsnachweis=NULL) {
  eigene <- .geld(notwendige_eigene_verwendungen);erhaltung <- .geld(ausgeschlossene_erhaltungskosten);lasten <- .geld(ausgeschlossene_lasten);vorgaenger <- .geld(ersatzfaehige_vorgaengerverwendungen)
  ausschluss <- .addieren(erhaltung,lasten)
  if (.vergleichen(ausschluss,eigene)>0) .fehler('notwendige_eigene_verwendungen','Ausgeschlossene Erhaltungskosten und Lasten m\u00fcssen \u00fcberschneidungsfreie Teile der eigenen Verwendungen sein.')
  .text(zuordnungsnachweis,'zuordnungsnachweis')
  wert <- .addieren(.subtrahieren(eigene,ausschluss),vorgaenger)
  eingaben <- list(notwendige_eigene_verwendungen=notwendige_eigene_verwendungen,ausgeschlossene_erhaltungskosten=ausgeschlossene_erhaltungskosten,ausgeschlossene_lasten=ausgeschlossene_lasten,ersatzfaehige_vorgaengerverwendungen=ersatzfaehige_vorgaengerverwendungen,zuordnungsnachweis=zuordnungsnachweis)
  ergebnis <- .geld_ergebnis(wert,'BGB_BESITZ_NOTWENDIGER_VERWENDUNGSERSATZ',eingaben,list(list(operation='Eigene notwendige Verwendungen um nicht ersatzf\u00e4hige Erhaltungskosten/Lasten k\u00fcrzen und bereits bereinigte Vorg\u00e4ngeranspr\u00fcche addieren.')))
  ergebnis$hinweise <- c(ergebnis$hinweise,list('Nur994Absatz1-Grundfall vor Rechtsh\u00e4ngigkeit/990-Haftungsbeginn. Eigene Bruttoverwendungen enthalten die nach995 einbezogenen Lasten. Ausgeschlossen sind gew\u00f6hnliche Erhaltungskosten f\u00fcr die Zeit verbleibender Nutzungen sowie nicht ersatzf\u00e4hige Lasten dieser Zeit; au\u00dfergew\u00f6hnliche auf den Stammwert gelegte Lasten nicht pauschal ausschlie\u00dfen. Vorg\u00e4ngerbetrag nach999 bereits rechtlich bereinigt, nicht erneut in eigenen Kosten enthalten. Rechtsnachfolge, zeitliche Zuordnung und notwendige Verwendung vorqualifiziert.994Absatz2-Gesch\u00e4ftsf\u00fchrung-ohne-Auftrag und weitere997\u20131003-Voraussetzungen gesondert; Ergebnis keine automatische F\u00e4lligkeit oder Verwendungsbewertung.'))
  ergebnis
}
