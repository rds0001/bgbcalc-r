gesellschaft_erbenrechtsfrist <- function(erbschaftskenntnis_am=NULL, ablaufhemmung_mindestende_am=NULL, ausschlagungsrecht_bei_dreimonatsablauf_noch_offen=NULL, ausschlagungsfristende_am=NULL, einordnungsnachweis=NULL) {
 grund <- .frist(erbschaftskenntnis_am,3,'monate','ereignis');ende <- grund
 .wahrheitswert(ausschlagungsrecht_bei_dreimonatsablauf_noch_offen,'ausschlagungsrecht_bei_dreimonatsablauf_noch_offen')
 .text(einordnungsnachweis,'einordnungsnachweis')
 if(!is.null(ablaufhemmung_mindestende_am)) ende <- max(ende,.datum(ablaufhemmung_mindestende_am,'ablaufhemmung_mindestende_am'))
 if(ausschlagungsrecht_bei_dreimonatsablauf_noch_offen) {
  ausschlagung <- .datum(ausschlagungsfristende_am,'ausschlagungsfristende_am')
  if(ausschlagung<grund) .fehler('ausschlagungsfristende_am','Offene Ausschlagungsfrist darf nicht bereits vor der Dreimonatsgrundgrenze enden.')
  ende <- max(ende,ausschlagung)
 } else if(!is.null(ausschlagungsfristende_am)) .fehler('ausschlagungsfristende_am','Ohne noch bestehendes Ausschlagungsrecht Zusatzende ausdr\u00fccklich null.')
 wert <- list(dreimonatsgrundfristende=.iso(grund),rechnerisches_ausuebungsfristende=.iso(ende))
 eingaben <- list(erbschaftskenntnis_am=erbschaftskenntnis_am, ablaufhemmung_mindestende_am=ablaufhemmung_mindestende_am, ausschlagungsrecht_bei_dreimonatsablauf_noch_offen=ausschlagungsrecht_bei_dreimonatsablauf_noch_offen, ausschlagungsfristende_am=ausschlagungsfristende_am, einordnungsnachweis=einordnungsnachweis)
 ergebnis <- .ergebnis(wert,"daten","BGB_GESELLSCHAFT_ERBENRECHTSFRIST",eingaben,list(list(operation="Dreimonatsgrundfrist mit wirksamer210-Ablaufhemmung und noch offener Ausschlagungsfrist als sp\u00e4testes Ende verkn\u00fcpfen.")),eingaben)
 ergebnis$hinweise <- list("\u00a7724III: Drei Monate ab Kenntnis des Erbschaftsanfalls, entsprechend210 bestimmtes Mindestende und gegebenenfalls sp\u00e4teres Ausschlagungsfristende als Maximum. Ob das Ausschlagungsrecht bei Ablauf der Dreimonatsgrundfrist noch besteht, separat rechtlich vorqualifizieren, nicht allein aus einem theoretischen Datum folgern.210-Mindestende mit vorhandener Ablaufhemmungsfunktion berechnen: die ma\u00dfgebliche Frist betr\u00e4gt drei Monate, daher210-Nachlauf grunds\u00e4tzlich entsprechend k\u00fcrzer als sechs Monate. Offene/ungekl\u00e4rte Schutzereignisse nicht durch fiktives Enddatum oder null ersetzen. Keine automatische Annahme/Ausschlagung, Kommanditistenstellung, K\u00fcndigungswirksamkeit oder Haftungsbeschr\u00e4nkung nachAbsatz4. Keine pauschale Feiertagsverschiebung; gegebenenfalls weitere rechtliche Kalenderkorrektur separat.")
 ergebnis
}
