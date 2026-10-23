vermaechtnis_pflichtteilskuerzung <- function(erwerbswert_vor_vermaechtnis=NULL,vermaechtniswert=NULL,gesamte_pflichtteilslast=NULL,anderweitig_getragene_last_2323=NULL,schutzart=NULL,geschuetzter_pflichtteilswert=NULL,einzelfall_nach_2318_qualifiziert=NULL,bewertungsnachweis=NULL) {
 erwerb <- .geld(erwerbswert_vor_vermaechtnis);vermaechtnis <- .geld(vermaechtniswert);gesamt <- .geld(gesamte_pflichtteilslast);fremd <- .geld(anderweitig_getragene_last_2323);schutz <- .geld(geschuetzter_pflichtteilswert)
 .auswahl(schutzart,'schutzart',c('kein_schutz','vermaechtnisnehmer','erbe'))
 if(.vergleichen(vermaechtnis,erwerb)>0 || .vergleichen(gesamt,erwerb)>0) .fehler('erwerbswert_vor_vermaechtnis','Verm\u00e4chtnis und gesamte Pflichtteilslast jeweils h\u00f6chstens Erwerbswert; sonst vorgelagerte Haftungsfragen kl\u00e4ren.')
 if(.vergleichen(fremd,gesamt)>0) .fehler('anderweitig_getragene_last_2323','Anderweitig getragene Last h\u00f6chstens gesamte Pflichtteilslast.')
 if(schutzart=='kein_schutz' && .vergleichen(schutz,.bruch(0))!=0) .fehler('geschuetzter_pflichtteilswert','Ohne Schutzfall Pflichtteilswert null erforderlich.')
 if(schutzart=='erbe' && .vergleichen(schutz,.subtrahieren(erwerb,vermaechtnis))>0) .fehler('geschuetzter_pflichtteilswert','Eigener Pflichtteil muss vor dieser Pflichtteilslast bereits gedeckt sein; sonst vorgelagerte andere Rechte kl\u00e4ren.')
 .wahrheitswert(einzelfall_nach_2318_qualifiziert,'einzelfall_nach_2318_qualifiziert');.text(bewertungsnachweis,'bewertungsnachweis')
 eingaben <- list(erwerbswert_vor_vermaechtnis=erwerbswert_vor_vermaechtnis,vermaechtniswert=vermaechtniswert,gesamte_pflichtteilslast=gesamte_pflichtteilslast,anderweitig_getragene_last_2323=anderweitig_getragene_last_2323,schutzart=schutzart,geschuetzter_pflichtteilswert=geschuetzter_pflichtteilswert,einzelfall_nach_2318_qualifiziert=einzelfall_nach_2318_qualifiziert,bewertungsnachweis=bewertungsnachweis)
 wert <- NULL
 if(einzelfall_nach_2318_qualifiziert) {
  last <- .subtrahieren(gesamt,fremd);proportional <- if(.vergleichen(erwerb,.bruch(0))==0) .bruch(0) else .multiplizieren(last,.dividieren(vermaechtnis,erwerb));kuerzung <- proportional
  if(schutzart=='vermaechtnisnehmer') {
   deckel <- .subtrahieren(vermaechtnis,schutz);if(.vergleichen(deckel,.bruch(0))<0) deckel <- .bruch(0)
   if(.vergleichen(deckel,kuerzung)<0) kuerzung <- deckel
  } else if(schutzart=='erbe') {
   rest <- .subtrahieren(.subtrahieren(erwerb,vermaechtnis),last);bedarf <- .subtrahieren(schutz,rest)
   if(.vergleichen(bedarf,.bruch(0))<0) bedarf <- .bruch(0)
   if(.vergleichen(bedarf,vermaechtnis)>0) bedarf <- vermaechtnis
   if(.vergleichen(bedarf,kuerzung)>0) kuerzung <- bedarf
  }
  wert <- list(anteilige_grundkuerzung=.bruchteile(proportional),kuerzungsbetrag=.bruchteile(kuerzung),verbleibender_vermaechtniswert=.bruchteile(.subtrahieren(vermaechtnis,kuerzung)),beim_erben_verbleibende_pflichtteilslast=.bruchteile(.subtrahieren(last,kuerzung)))
 }
 ergebnis <- .ergebnis(wert,'EUR','BGB_VERMAECHTNIS_PFLICHTTEILSKUERZUNG',eingaben,list(list(operation='Nach2323 selbst zu tragende Last mit Verm\u00e4chtnis/Erwerb quotieren; isolierten Schutz2318II oderIII ber\u00fccksichtigen')),eingaben)
 ergebnis$status <- if(!is.null(wert)) 'BERECHNET' else 'NICHT_ANWENDBAR'
 ergebnis$annahmen <- list("Ein Erbe, ein bewertetes Verm\u00e4chtnis beziehungsweise eine Auflage; keine weiteren Beschwerungen, Vorr\u00e4nge oder gleichzeitigen Schutzrechte beider Beteiligter.")
 ergebnis$hinweise <- list("Erwerbswert nach sonstigen ber\u00fccksichtigungsf\u00e4higen Verbindlichkeiten, aber vor diesem Verm\u00e4chtnis und Pflichtteilslast.2323: rechtlich nach2320\u20132322 anderweitig getragene Last zuerst abziehen. Kein Schutzfall: proportionale Lastverteilung. Nur Verm\u00e4chtnisnehmer gesch\u00fctzt: K\u00fcrzung h\u00f6chstens positiver Verm\u00e4chtnis\u00fcberschuss \u00fcber dessen Pflichtteil; ein schon vorher unzureichendes Verm\u00e4chtnis erzeugt hier keinen zus\u00e4tzlichen Anspruch. Nur Erbe gesch\u00fctzt: K\u00fcrzung zus\u00e4tzlich bis Erhalt des eigenen Pflichtteils, begrenzt auf Verm\u00e4chtniswert; eigener Pflichtteil muss vor hinzutretender Pflichtteilslast bereits gedeckt sein. Beide Beteiligten pflichtteilsberechtigt, mehrere Verm\u00e4chtnisse, Vorr\u00e4nge2189 oder abweichende Anordnungen2324 brauchen gesondertes kombiniertes Modell und d\u00fcrfen nicht als einer dieser F\u00e4lle eingegeben werden. Keine Sachverm\u00e4chtnis-Geldzahlungsautomatik.")
 ergebnis
}
