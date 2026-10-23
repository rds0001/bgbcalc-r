dienstkuendigung_vorausverguetungsrueckzahlung <- function(vorausverguetung=NULL, zeitanteil_nach_kuendigung_zaehler=NULL, zeitanteil_nach_kuendigung_nenner=NULL, kuendigungsumstand_nicht_zu_vertreten=NULL, abziehbare_entreicherung=NULL, einordnungsnachweis=NULL) {
 anteil <- .teilbetrag(vorausverguetung,zeitanteil_nach_kuendigung_zaehler,zeitanteil_nach_kuendigung_nenner)
 .wahrheitswert(kuendigungsumstand_nicht_zu_vertreten,'kuendigungsumstand_nicht_zu_vertreten');.text(einordnungsnachweis,'einordnungsnachweis')
 verlust <- .bruch(0)
 if(kuendigungsumstand_nicht_zu_vertreten) {
  verlust <- .geld(abziehbare_entreicherung)
  if(.vergleichen(verlust,anteil)>0) .fehler('abziehbare_entreicherung','Abzugsbetrag darf den Nachk\u00fcndigungsanteil nicht \u00fcbersteigen.')
 } else if(!is.null(abziehbare_entreicherung)) .fehler('abziehbare_entreicherung','Im346-Fall ausdr\u00fccklich null, kein Bereicherungsabzug.')
 wert <- list(rechnerischer_vorausanteil=.bruchteile(anteil),rechnerischer_rueckzahlungsbetrag=.bruchteile(.subtrahieren(anteil,verlust)))
 eingaben <- list(vorausverguetung=vorausverguetung, zeitanteil_nach_kuendigung_zaehler=zeitanteil_nach_kuendigung_zaehler, zeitanteil_nach_kuendigung_nenner=zeitanteil_nach_kuendigung_nenner, kuendigungsumstand_nicht_zu_vertreten=kuendigungsumstand_nicht_zu_vertreten, abziehbare_entreicherung=abziehbare_entreicherung, einordnungsnachweis=einordnungsnachweis)
 ergebnis <- .ergebnis(wert,"EUR","BGB_DIENSTKUENDIGUNG_VORAUSVERGUETUNGSRUECKZAHLUNG",eingaben,list(list(operation="Vorauszahlung mit qualifiziertem Nachk\u00fcndigungsanteil multiplizieren; nur im Bereicherungsfall rechtlich abzugsf\u00e4hige Entreicherung abziehen.")),eingaben)
 ergebnis$hinweise <- list("\u00a7628I3 nach qualifizierter K\u00fcndigung626/627 nach Dienstbeginn: nur im Voraus entrichtete Verg\u00fctung f\u00fcr Zeit nach K\u00fcndigung. Anteil auf den tats\u00e4chlich vorausbezahlten Zeitraum beziehen, nicht blind auf gesamte Vertragsverg\u00fctung oder bisherige Leistungsquote. Teilbetrag nach der rechtlich einschl\u00e4gigen Verg\u00fctungs-/Zeitkonvention bestimmen; keine universelle Drei\u00dfigtage- oder Jahreskonvention. Hat der Dienstverpflichtete den K\u00fcndigungsumstand nicht zu vertreten, gelten Bereicherungsvorschriften; abzugsf\u00e4hige Entreicherung insbesondere unter Ber\u00fccksichtigung818/819/820 rechtlich bestimmen. Im346-Fall keine818III-Entreicherung abziehen. Weitere Nutzungen, Wertersatz, fr\u00fchere Leistungen und Interessenverlust628I1/2 sowie K\u00fcndigungsschaden628II separat; keine automatische Aufrechnung.")
 ergebnis
}
