fund_anzeigewertgrenze <- function(sachenwert=NULL) {
  wert <- .geld(sachenwert)
  eingaben <- list(sachenwert=sachenwert)
  ergebnis <- .ergebnis(list(wertgrenze=.bruchteile(.bruch(10)),wertgrenze_ueberschritten=.vergleichen(wert,.bruch(10))>0),'EUR_und_wahrheitswert','BGB_FUND_ANZEIGEWERTGRENZE',eingaben,list(list(operation='Sachenwert strikt mit10EUR vergleichen.')),eingaben)
  ergebnis$hinweise <- list('Nur Wertgrenze f\u00fcr beh\u00f6rdliche Fundanzeige nach965Absatz2. Sache und deren Wert rechtlich qualifiziert; Kenntnis/Ermittlung des Empfangsberechtigten und \u00fcbrige Anzeige-/Verwahrungspflichten gesondert. Bei genau10EUR ist die Grenze nicht \u00fcberschritten; keine allgemeine Befreiung von s\u00e4mtlichen Finderpflichten.')
  ergebnis
}
liquidatoren_einstimmigkeitsgrenze <- function(anzahl_liquidatoren=NULL,zustimmende_liquidatoren=NULL) {
  alle <- .ganzzahl(anzahl_liquidatoren,'anzahl_liquidatoren',1,9007199254740991)
  ja <- .ganzzahl(zustimmende_liquidatoren,'zustimmende_liquidatoren',0,9007199254740991)
  if (ja>alle) .fehler('zustimmende_liquidatoren','Zustimmungen d\u00fcrfen Zahl der Liquidatoren nicht \u00fcbersteigen.')
  eingaben <- list(anzahl_liquidatoren=anzahl_liquidatoren,zustimmende_liquidatoren=zustimmende_liquidatoren)
  ergebnis <- .ergebnis(list(erforderliche_zustimmungen=alle,fehlende_zustimmungen=alle-ja,einstimmigkeit_erreicht=ja==alle),'anzahl_und_wahrheitswert','BGB_LIQUIDATOREN_EINSTIMMIGKEITSGRENZE',eingaben,list(list(operation='Erforderlich sind s\u00e4mtliche Liquidatoren; fehlende Zustimmungen als Anzahl minus Zustimmungen berechnen.')),eingaben)
  ergebnis$hinweise <- list('Nur gesetzlicher Einstimmigkeitsgrundfall nach48Absatz3 ohne abweichende Bestimmung. Ma\u00dfgeblicher Liquidatorenkreis und anrechenbare Zustimmungen vorqualifiziert; Liquidatoren nicht mit Vereinsmitgliedern verwechseln. Keine Vertretungs- oder Beschlusswirksamkeitsentscheidung.')
  ergebnis
}
