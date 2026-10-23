fortsetzung_nichtgemeinsame_abkoemmlinge_gesamtgut <- function(teilungsfaehiges_gesamtgut=NULL, erbquoten_nichtgemeinsamer_abkoemmlinge=NULL, einordnungsnachweis=NULL) {
 gut <- .geld(teilungsfaehiges_gesamtgut);.text(einordnungsnachweis,'einordnungsnachweis');.vorhanden(erbquoten_nichtgemeinsamer_abkoemmlinge,'erbquoten_nichtgemeinsamer_abkoemmlinge')
 if(!is.list(erbquoten_nichtgemeinsamer_abkoemmlinge) || !is.null(names(erbquoten_nichtgemeinsamer_abkoemmlinge)) || length(erbquoten_nichtgemeinsamer_abkoemmlinge)>1000) .fehler('erbquoten_nichtgemeinsamer_abkoemmlinge','Liste0..1000 erforderlich.')
 haelfte <- .dividieren(gut,.bruch(2));summe <- .bruch(0);quotensumme <- .bruch(0);namen <- character();anteile <- list()
 for(p in erbquoten_nichtgemeinsamer_abkoemmlinge) {
  if(!is.list(p) || length(p)!=2 || !setequal(names(p),c('abkoemmling_id','erbquote'))) .fehler('erbquoten_nichtgemeinsamer_abkoemmlinge','Genau Kennung und Erbquote erforderlich.')
  name <- .text(p$abkoemmling_id,'abkoemmling_id');quote <- .geld(p$erbquote)
  if(name %in% namen) .fehler('abkoemmling_id','Eindeutige Personen erforderlich.')
  namen <- c(namen,name);quotensumme <- .addieren(quotensumme,quote)
  if(.vergleichen(quotensumme,.bruch(1))>0) .fehler('erbquote','Summe der Erbquoten h\u00f6chstens1.')
  betrag <- .multiplizieren(haelfte,quote);summe <- .addieren(summe,betrag)
  anteile[[length(anteile)+1]] <- list(abkoemmling_id=name,betrag=.bruchteile(betrag))
 }
 wert <- list(hypothetischer_nachlassanteil_gesamtgut=.bruchteile(haelfte),herauszurechnende_anteile=anteile,herauszurechnender_gesamtbetrag=.bruchteile(summe),verbleibendes_gesamtgut=.bruchteile(.subtrahieren(gut,summe)))
 eingaben <- list(teilungsfaehiges_gesamtgut=teilungsfaehiges_gesamtgut, erbquoten_nichtgemeinsamer_abkoemmlinge=erbquoten_nichtgemeinsamer_abkoemmlinge, einordnungsnachweis=einordnungsnachweis)
 ergebnis <- .ergebnis(wert,"EUR","BGB_FORTSETZUNG_NICHTGEMEINSAME_ABKOEMMLINGE_GESAMTGUT",eingaben,list(list(operation="Gesamtgut halbieren, nichtgemeinschaftliche Erbquoten auf Nachlassh\u00e4lfte anwenden und Gesamtgutrest bestimmen.")),eingaben)
 ergebnis$hinweise <- list("\u00a71483II: urspr\u00fcnglichen, bereits bereinigten Gesamtgutwert h\u00e4lftig dem hypothetischen Nachlass zuordnen; Erbquoten der nichtgemeinschaftlichen Abk\u00f6mmlinge auf diese H\u00e4lfte anwenden und aus dem Gesamtgut herausrechnen. Nur Gesamtgutkomponente ihrer Erbteile; Sondergut/Vorbehaltsgut und sonstige Nachlasspositionen gesondert. Keine automatische G\u00fcterstands-, Abstammungs-, Erbquoten- oder Bewertungsentscheidung. Keine erneute Schuldenberichtigung bereits bereinigter Werte, kein negativer Nachlass und keine pauschale Kappung tats\u00e4chlicher Au\u00dfenhaftung. Abweichende ehevertragliche Teilungsverh\u00e4ltnisse nicht mit Halbteilung vermischen.")
 ergebnis
}
