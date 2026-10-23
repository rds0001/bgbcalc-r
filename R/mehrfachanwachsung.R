# Mehrere gemeinsam qualifizierte Wegfälle; keine zeitlich gestaffelte Kaskade.
erbteile_gleichzeitige_anwachsung <- function(eingesetzte_erben=NULL,weggefallene_erben_ids=NULL,
 gesetzliche_erbfolge_ausgeschlossen=NULL,anwachsung_testamentarisch_ausgeschlossen=NULL,vorrangiges_ersatzerbrecht=NULL,
 gemeinsamer_wegfall_qualifiziert=NULL,einordnungsnachweis=NULL) {
 .vorhanden(weggefallene_erben_ids,'weggefallene_erben_ids')
 if(!is.list(weggefallene_erben_ids)||!is.null(names(weggefallene_erben_ids))||length(weggefallene_erben_ids)<1L||length(weggefallene_erben_ids)>1000L) .fehler('weggefallene_erben_ids','Liste1..1000 eindeutiger gleichzeitig weggefallener Erben erforderlich.')
 weg <- vapply(weggefallene_erben_ids,function(x).text(x,'weggefallene_erben_ids'),character(1))
 if(anyDuplicated(weg)) .fehler('weggefallene_erben_ids','Weggefallene Erben nicht doppelt angeben.')
 .wahrheitswert(gemeinsamer_wegfall_qualifiziert,'gemeinsamer_wegfall_qualifiziert')
 erbteil_anwachsungsquoten(eingesetzte_erben,weg[[1]],gesetzliche_erbfolge_ausgeschlossen,anwachsung_testamentarisch_ausgeschlossen,vorrangiges_ersatzerbrecht,einordnungsnachweis)
 namen <- vapply(eingesetzte_erben,function(p)p$erbe_id,character(1))
 if(!all(weg %in% namen)) .fehler('weggefallene_erben_ids','Jeder Wegfall muss in der Originalliste stehen.')
 uebrige <- Filter(function(p)!(p$erbe_id %in% weg),eingesetzte_erben)
 zusatz <- setNames(lapply(uebrige,function(p).bruch(0)),vapply(uebrige,function(p)p$erbe_id,character(1)))
 sonderteile <- list();frei <- .bruch(0)
 for(p in eingesetzte_erben) {
  if(!(p$erbe_id %in% weg)) next
  quote <- .zahleneingabe(p$erbquote)
  empfaenger <- Filter(function(q)!is.null(p$gemeinschaft_id)&&identical(p$gemeinschaft_id,q$gemeinschaft_id),uebrige)
  if(length(empfaenger)==0L&&gesetzliche_erbfolge_ausgeschlossen) empfaenger <- uebrige
  if(anwachsung_testamentarisch_ausgeschlossen||vorrangiges_ersatzerbrecht) empfaenger <- list()
  summe <- .bruch(0)
  for(q in empfaenger) summe <- .addieren(summe,.zahleneingabe(q$erbquote))
  verteilung <- list()
  for(q in empfaenger) {
   anteil <- .multiplizieren(quote,.dividieren(.zahleneingabe(q$erbquote),summe))
   zusatz[[q$erbe_id]] <- .addieren(zusatz[[q$erbe_id]],anteil)
   verteilung[[length(verteilung)+1L]] <- list(erbe_id=q$erbe_id,angewachsener_erbteil=.bruchteile(anteil))
  }
  rest <- if(length(empfaenger)>0L).bruch(0) else quote
  frei <- .addieren(frei,rest)
  sonderteile[[length(sonderteile)+1L]] <- list(weggefallener_erbe_id=p$erbe_id,verteilung=verteilung,nicht_angewachsener_erbteil=.bruchteile(rest))
 }
 wert <- if(gemeinsamer_wegfall_qualifiziert) list(sonderteile_nach_ursprung=sonderteile,erbteile=lapply(uebrige,function(p)list(erbe_id=p$erbe_id,urspruenglicher_erbteil=.bruchteile(.zahleneingabe(p$erbquote)),angewachsener_erbteil=.bruchteile(zusatz[[p$erbe_id]]),gesamter_erbteil=.bruchteile(.addieren(.zahleneingabe(p$erbquote),zusatz[[p$erbe_id]])))),nicht_angewachsene_wegfallquote=.bruchteile(frei)) else NULL
 eingaben <- list(eingesetzte_erben=eingesetzte_erben,weggefallene_erben_ids=weggefallene_erben_ids,gesetzliche_erbfolge_ausgeschlossen=gesetzliche_erbfolge_ausgeschlossen,anwachsung_testamentarisch_ausgeschlossen=anwachsung_testamentarisch_ausgeschlossen,vorrangiges_ersatzerbrecht=vorrangiges_ersatzerbrecht,gemeinsamer_wegfall_qualifiziert=gemeinsamer_wegfall_qualifiziert,einordnungsnachweis=einordnungsnachweis)
 ergebnis <- .ergebnis(wert,'erbquoten','BGB_ERBTEILE_GLEICHZEITIGE_ANWACHSUNG',eingaben,list(list(operation='Gemeinsam Weggefallene vor Empf\u00e4ngerauswahl entfernen; jeden Originalteil mit Gruppenvorrang proportional zu verbleibenden Originalquoten verteilen; Sonderteile je Ursprung bewahren')),eingaben)
 ergebnis$status <- if(!is.null(wert))'BERECHNET' else 'NICHT_ANWENDBAR'
 ergebnis$annahmen <- list("Ein gemeinsamer rechtlich qualifizierter Wegfallzeitpunkt, einfache nicht verschachtelte Gruppen und s\u00e4mtliche Originalanteile vor Anwachsung.")
 ergebnis$hinweise <- list("Keine zeitlich gestaffelte Kaskade: vorher angewachsene Sonderteile d\u00fcrfen nicht als blo\u00dfe Gesamtquote eingegeben werden. Gruppenvorrang je weggefallenem Originalteil; mangels \u00fcberlebendem Gruppenmitglied allgemeine Anwachsung nur bei vollst\u00e4ndigem Ausschluss gesetzlicher Erbfolge. Testamentarischer Ausschluss oder Ersatzerbvorrang betrifft hier s\u00e4mtliche untersuchten Wegf\u00e4lle einheitlich. Nicht angewachsene Quote wird nicht automatisch gesetzlichen/Ersatzerben zugeteilt. Sonderteile nach2095 bleiben nach Ursprung getrennt; Gesamtquote ist nur Summe. Verschachtelte Gruppen, individuelle Teilsperren und2098-Ersatzerbeneinsetzungen nicht umfasst.")
 ergebnis
}
