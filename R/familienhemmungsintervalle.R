verjaehrung_familienzeitraeume <- function(fristlauf_erster_tag=NULL,grundfrist_letzter_tag=NULL,beziehungsart=NULL,beziehungszeitraeume=NULL,geburtsdatum_kind=NULL,einordnungsnachweis=NULL) {
  erster <- .datum(fristlauf_erster_tag,'fristlauf_erster_tag')
  .datum(grundfrist_letzter_tag,'grundfrist_letzter_tag')
  .auswahl(beziehungsart,'beziehungsart',c('ehegatten','lebenspartner','kind_eltern','kind_partner_elternteil','vormund_muendel','betreuer_betreuter','pfleger_pflegling','kind_gegen_beistand'))
  altersfall <- beziehungsart %in% c('kind_eltern','kind_partner_elternteil')
  grenze <- NULL
  if (altersfall) {
    geburt <- .datum(geburtsdatum_kind,'geburtsdatum_kind')
    grenze <- .tage_addieren(.datum(lebensalter_beginn(geburtsdatum_kind,21)$wert,'altersgrenze'),-1)
    if (geburt > erster) .fehler('geburtsdatum_kind','Geburt darf nicht nach dem ersten Fristlauftag liegen.')
  } else if (!is.null(geburtsdatum_kind)) .fehler('geburtsdatum_kind','Geburtsdatum nur f\u00fcr die beiden altersbegrenzten Kindbeziehungen angeben.')
  .vorhanden(beziehungszeitraeume,'beziehungszeitraeume')
  if (!is.list(beziehungszeitraeume) || length(beziehungszeitraeume)>10000 || !is.null(names(beziehungszeitraeume))) .fehler('beziehungszeitraeume','Liste mit h\u00f6chstens10000 abgeschlossenen Beziehungsintervallen erforderlich.')
  .text(einordnungsnachweis,'einordnungsnachweis')
  intervalle <- list()
  for (zeitraum in beziehungszeitraeume) {
    if (!is.list(zeitraum) || length(zeitraum)!=2 || !setequal(names(zeitraum),c('erster_beziehungstag','letzter_beziehungstag'))) .fehler('beziehungszeitraeume','Genau erster_beziehungstag und letzter_beziehungstag erforderlich.')
    anfang <- .datum(zeitraum$erster_beziehungstag,'erster_beziehungstag')
    ende <- .datum(zeitraum$letzter_beziehungstag,'letzter_beziehungstag')
    if (anfang > ende) .fehler('beziehungszeitraeume','Beziehungsende liegt vor Beziehungsbeginn.')
    if (altersfall && anfang < geburt) .fehler('beziehungszeitraeume','Kindbeziehung kann nicht vor Geburt beginnen.')
    if (!is.null(grenze)) ende <- min(ende,grenze)
    if (anfang <= ende) intervalle[[length(intervalle)+1]] <- list(erster_gehemmter_tag=.iso(anfang),letzter_gehemmter_tag=.iso(ende))
  }
  kern <- verjaehrung_gehemmte_kalendertage(fristlauf_erster_tag,grundfrist_letzter_tag,intervalle,TRUE)
  eingaben <- list(fristlauf_erster_tag=fristlauf_erster_tag,grundfrist_letzter_tag=grundfrist_letzter_tag,beziehungsart=beziehungsart,beziehungszeitraeume=beziehungszeitraeume,geburtsdatum_kind=geburtsdatum_kind,einordnungsnachweis=einordnungsnachweis)
  ergebnis <- .ergebnis(kern$wert,'datum_und_tage','BGB_VERJAEHRUNG_FAMILIENZEITRAEUME',eingaben,c(list(list(operation='Kindbeziehungen auf letzten Tag vor Vollendung21 begrenzen; \u00fcbrige qualifizierte Beziehungsintervalle unver\u00e4ndert vereinigen und aus Fristlauf herausrechnen.')),kern$rechenschritte),eingaben)
  ergebnis$hinweise <- list('Abgeschlossene rechtlich qualifizierte Beziehungsintervalle mit beiden eingeschlossenen ganzen Kalendertagen. Keine automatische Begr\u00fcndung oder Beendigung von Ehe, Betreuung oder Beistandschaft. Kind-gegen-Beistand nur in dieser Anspruchsrichtung. Alter21 begrenzt ausschlie\u00dflich Kind-Eltern und Kind-Partner-Elternteil. Ein Zeitpunkt laufender Auswertung darf nicht als tats\u00e4chliches Beziehungsende ausgegeben werden. Vor Fristbeginn liegende Tage werden nicht angerechnet; \u00fcberlappende Intervalle nur einmal. Keine Wiederbelebung bereits abgelaufener Fristen. Andere Hemmungen,208, Ablaufhemmung, Neubeginn und193 gesondert.')
  ergebnis
}
