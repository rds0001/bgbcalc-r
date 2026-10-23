reallast_persoenlicher_faelligkeitsbetrag <- function(erster_haftungstag=NULL,letzter_haftungstag=NULL,leistungen=NULL,einordnungsnachweis=NULL) {
 erster <- .datum(erster_haftungstag,'erster_haftungstag');letzter <- .datum(letzter_haftungstag,'letzter_haftungstag')
 if(erster>letzter) .fehler('letzter_haftungstag','Letzter Haftungstag darf nicht vor erstem liegen.')
 .text(einordnungsnachweis,'einordnungsnachweis');.vorhanden(leistungen,'leistungen')
 if(!is.list(leistungen)||!is.null(names(leistungen))||length(leistungen)>10000) .fehler('leistungen','Liste mit h\u00f6chstens10000 eindeutig abgegrenzten Geldleistungen erforderlich.')
 namen <- character();zugeordnet <- list();ausserhalb <- list();summe <- .bruch(0)
 for(leistung in leistungen) {
  if(!is.list(leistung)||length(leistung)!=3||!setequal(names(leistung),c('leistung_id','faellig_am','betrag'))) .fehler('leistungen','Genau leistung_id, faellig_am und betrag erforderlich.')
  name <- .text(leistung$leistung_id,'leistung_id');datum <- .datum(leistung$faellig_am,'faellig_am');betrag <- .geld(leistung$betrag)
  if(name %in% namen) .fehler('leistung_id','Geldleistung darf nicht mehrfach ber\u00fccksichtigt werden.')
  namen <- c(namen,name)
  if(erster<=datum && datum<=letzter) {zugeordnet[[length(zugeordnet)+1]] <- name;summe <- .addieren(summe,betrag)} else ausserhalb[[length(ausserhalb)+1]] <- name
 }
 eingaben <- list(erster_haftungstag=erster_haftungstag,letzter_haftungstag=letzter_haftungstag,leistungen=leistungen,einordnungsnachweis=einordnungsnachweis)
 wert <- list(persoenlicher_haftungsbetrag=.bruchteile(summe),zugeordnete_leistungen=zugeordnet,zeitlich_nicht_zugeordnete_leistungen=ausserhalb)
 ergebnis <- .ergebnis(wert,'EUR_und_Leistungszuordnung','BGB_REALLAST_PERSOENLICHER_FAELLIGKEITSBETRAG',eingaben,list(list(operation='Nur w\u00e4hrend des qualifizierten Eigentumszeitraums f\u00e4llige Geldleistungen vollst\u00e4ndig summieren; keine zeitanteilige K\u00fcrzung nach Leistungsperiode.')),eingaben)
 ergebnis$hinweise <- list("\u00a71108I-Grundfall ohne abweichende Bestimmung. Ma\u00dfgeblich ist F\u00e4lligkeit w\u00e4hrend des Eigentums, nicht anteilige Dauer der Leistungsperiode. Erster und letzter eingeschlossener Haftungstag sind rechtlich normalisierte Grenzen eines abgeschlossenen Eigentumszeitraums; bei Eigentumswechsel am F\u00e4lligkeitstag muss die zeitliche Zuordnung eindeutig vorqualifiziert sein. Keine automatischen Grundbuch-/Eigentumsfeststellungen, keine intrat\u00e4gliche Zeitrechnung. Nur bereits bestimmte Geldleistungen; Naturalleistungen nicht eigenm\u00e4chtig bewerten. Eingangsbetr\u00e4ge sind die rechtlich ma\u00dfgeblichen noch offenen Leistungen ohne doppelte Positionen. Verj\u00e4hrung, Einreden, dingliche Verwertung und andere Haftungsgr\u00fcnde werden nicht entschieden. Teilgrundst\u00fcckseigent\u00fcmer nach1108II nicht durch freie Fl\u00e4chenquote entlasten; Gesamtschuld und Innenausgleich separat.")
 ergebnis
}
