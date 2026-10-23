betriebskosten_wohnungsanteile <- function(kostenpositionen=NULL,einordnungsnachweis=NULL) {
 .text(einordnungsnachweis,'einordnungsnachweis'); .vorhanden(kostenpositionen,'kostenpositionen')
 if(!is.list(kostenpositionen) || !is.null(names(kostenpositionen)) || length(kostenpositionen)<1 || length(kostenpositionen)>1000) .fehler('kostenpositionen','Liste mit1bis1000 Kostenpositionen erforderlich.')
 namen <- character(); positionen <- list(); summe <- .bruch(0)
 for(p in kostenpositionen) {
  if(!is.list(p) || !identical(sort(names(p)),sort(c('position_id','gesamtkosten','wohnungsbezugswert','gesamtbezugswert','umlagemassstab')))) .fehler('kostenpositionen','Kennung, Gesamtkosten, Wohnungs-/Gesamtbezugswert und Umlagema\u00dfstab erforderlich.')
  name <- .text(p$position_id,'position_id'); kosten <- .geld(p$gesamtkosten); teil <- .geld(p$wohnungsbezugswert); gesamt <- .geld(p$gesamtbezugswert)
  .auswahl(p$umlagemassstab,'umlagemassstab',c('wohnflaeche','verbrauch','verursachung','vereinbarung','wohnungseigentum'))
  if(name %in% namen || .vergleichen(gesamt,.bruch(0))<=0 || .vergleichen(teil,gesamt)>0) .fehler('kostenpositionen','Eindeutige Positionen, positive Gesamtbezugswerte und Wohnungswerte h\u00f6chstens Gesamtwert erforderlich.')
  namen <- c(namen,name); quote <- .dividieren(teil,gesamt); betrag <- .multiplizieren(kosten,quote); summe <- .addieren(summe,betrag)
  positionen[[length(positionen)+1]] <- list(position_id=name,wohnungsquote=.bruchteile(quote),wohnungsbetrag=.bruchteile(betrag))
 }
 eingaben <- list(kostenpositionen=kostenpositionen,einordnungsnachweis=einordnungsnachweis)
 ergebnis <- .ergebnis(list(positionen=positionen,gesamtwohnungsbetrag=.bruchteile(summe)),'EUR_und_quoten','BGB_BETRIEBSKOSTEN_WOHNUNGSANTEILE',eingaben,list(list(operation='Je Position Gesamtkosten mal Wohnungsbezugswert/Gesamtbezugswert; daraus entstehende Wohnungsbetr\u00e4ge exakt summieren.')),eingaben)
 ergebnis$hinweise <- list("Nur \u00a7556a mit bereits rechtlich qualifiziertem Umlagema\u00dfstab und umlagef\u00e4higen Kosten. Vorrang abweichender Vorschriften/Vereinbarungen, erfasster Verbr\u00e4uche/Verursachung sowie besonderer WEG-Verteilung rechtlich bestimmen; unbilligen WEG-Schl\u00fcssel nicht ungepr\u00fcft \u00fcbernehmen. Bezugswerte je Position m\u00fcssen denselben vollst\u00e4ndigen Abrechnungskreis und Zeitraum betreffen. Einheiten k\u00f6nnen zwischen Positionen verschieden sein, innerhalb einer Position identisch. Verbrauchsabh\u00e4ngige Mischschl\u00fcssel in disjunkte Kostenkomponenten aufteilen, keine Doppelz\u00e4hlung. Keine Bestimmung der Kostenumlagef\u00e4higkeit, Messwertsch\u00e4tzung, Leerstands-/Nutzerwechselzuordnung oder Heizkosten-Sondervorschriften.")
 ergebnis
}
betriebskosten_umstellung_mietherabsetzung <- function(bisherige_zeitraummiete=NULL,bisher_enthaltener_kostenanteil=NULL,einordnungsnachweis=NULL) {
 miete <- .geld(bisherige_zeitraummiete); kosten <- .geld(bisher_enthaltener_kostenanteil); .text(einordnungsnachweis,'einordnungsnachweis')
 if(.vergleichen(kosten,miete)>0) .fehler('bisher_enthaltener_kostenanteil','Enthaltener Kostenanteil darf bisherige Miete nicht \u00fcbersteigen.')
 eingaben <- list(bisherige_zeitraummiete=bisherige_zeitraummiete,bisher_enthaltener_kostenanteil=bisher_enthaltener_kostenanteil,einordnungsnachweis=einordnungsnachweis)
 ergebnis <- .geld_ergebnis(.subtrahieren(miete,kosten),'BGB_BETRIEBSKOSTEN_UMSTELLUNG_MIETHERABSETZUNG',eingaben,list(list(operation='Qualifiziert bislang enthaltenen k\u00fcnftig gesondert umgelegten Kostenanteil von Miete desselben Zeitraums abziehen.')))
 ergebnis$hinweise <- c(ergebnis$hinweise,list("Nur \u00a7556a Absatz2 Satz3 nach qualifiziert zul\u00e4ssiger Umstellung der Umlage erfassten Verbrauchs/Verursachung. Kostenanteil und Miete gleiche Zeiteinheit, nicht Jahreskosten unmittelbar von Monatsmiete abziehen. Nur bisher tats\u00e4chlich in der Miete enthaltenen k\u00fcnftig gesonderten Anteil abziehen, keine Sch\u00e4tzung durch Bibliothek. Textform, rechtzeitige Erkl\u00e4rung vor Abrechnungsbeginn und Wirksamkeit gesondert."))
 ergebnis
}
