stiftung_grundstock_soll_ist_vergleich <- function(erforderlicher_erhaltungswert=NULL, vorhandener_erhaltungswert=NULL, einordnungsnachweis=NULL) {
 soll <- .geld(erforderlicher_erhaltungswert);ist <- .geld(vorhandener_erhaltungswert)
 .text(einordnungsnachweis,'einordnungsnachweis')
 unter <- .vergleichen(ist,soll)<0
 wert <- list(rechnerische_unterdeckung=.bruchteile(if(unter) .subtrahieren(soll,ist) else .bruch(0)),rechnerischer_mehrbestand=.bruchteile(if(unter) .bruch(0) else .subtrahieren(ist,soll)),sollwert_erreicht=!unter)
 eingaben <- list(erforderlicher_erhaltungswert=erforderlicher_erhaltungswert, vorhandener_erhaltungswert=vorhandener_erhaltungswert, einordnungsnachweis=einordnungsnachweis)
 ergebnis <- .ergebnis(wert,"EUR_und_wahrheitswert","BGB_STIFTUNG_GRUNDSTOCK_SOLL_IST_VERGLEICH",eingaben,list(list(operation="Qualifizierten Erhaltungs-Sollwert und vorhandenen Grundstockwert vergleichen, Unterdeckung und Mehrbestand getrennt ausweisen.")),eingaben)
 ergebnis$hinweise <- list("\u00a783cI: ausschlie\u00dflich numerischer Soll/Ist-Vergleich unter rechtlich qualifiziertem Erhaltungsma\u00dfstab. Keine selbst erfundene Wahl zwischen nominaler, realer oder gegenst\u00e4ndlicher Kapitalerhaltung, keine automatische Inflationsindexierung. Positiver Mehrbestand ist weder automatisch verwendbarer Umschichtungsgewinn noch aussch\u00fcttbarer Ertrag. Zul\u00e4ssiger Verbrauch und Wiederaufstockung83cII bleiben getrennt.")
 ergebnis
}
stiftung_uebertragene_vermoegensbestaende <- function(grundstock_uebernehmende_stiftung=NULL, sonstiges_vermoegen_uebernehmende_stiftung=NULL, uebertragende_stiftungen=NULL, einordnungsnachweis=NULL) {
 grund <- .geld(grundstock_uebernehmende_stiftung);sonstig <- .geld(sonstiges_vermoegen_uebernehmende_stiftung)
 .text(einordnungsnachweis,'einordnungsnachweis');.vorhanden(uebertragende_stiftungen,'uebertragende_stiftungen')
 if(!is.list(uebertragende_stiftungen) || !is.null(names(uebertragende_stiftungen)) || length(uebertragende_stiftungen)<1 || length(uebertragende_stiftungen)>1000) .fehler('uebertragende_stiftungen','Liste1..1000 erforderlich.')
 kennungen <- character()
 for(s in uebertragende_stiftungen) {
  if(!is.list(s) || !identical(sort(names(s)),sort(c('stiftung_id','grundstockvermoegen','sonstiges_vermoegen')))) .fehler('uebertragende_stiftungen','Genau Kennung, Grundstock und sonstiger Bestand erforderlich.')
  kennung <- .text(s$stiftung_id,'stiftung_id')
  if(kennung %in% kennungen) .fehler('stiftung_id','Doppelte Stiftung unzul\u00e4ssig.')
  kennungen <- c(kennungen,kennung);grund <- .addieren(grund,.geld(s$grundstockvermoegen));sonstig <- .addieren(sonstig,.geld(s$sonstiges_vermoegen))
 }
 wert <- list(grundstockvermoegen_nach_uebertragung=.bruchteile(grund),sonstiges_vermoegen_nach_uebertragung=.bruchteile(sonstig),gesamtvermoegen_nach_uebertragung=.bruchteile(.addieren(grund,sonstig)))
 eingaben <- list(grundstock_uebernehmende_stiftung=grundstock_uebernehmende_stiftung, sonstiges_vermoegen_uebernehmende_stiftung=sonstiges_vermoegen_uebernehmende_stiftung, uebertragende_stiftungen=uebertragende_stiftungen, einordnungsnachweis=einordnungsnachweis)
 ergebnis <- .ergebnis(wert,"EUR","BGB_STIFTUNG_UEBERTRAGENE_VERMOEGENSBESTAENDE",eingaben,list(list(operation="Grundstock und sonstige Verm\u00f6gensbest\u00e4nde wirksam \u00fcbertragender Stiftungen getrennt zum Bestand der \u00fcbernehmenden Stiftung addieren.")),eingaben)
 ergebnis$hinweise <- list("\u00a786cI2/II und86fI/II: vollst\u00e4ndig \u00fcbertragene qualifizierte Verm\u00f6gensbest\u00e4nde addieren, Grundstock getrennt als Grundstock fortf\u00fchren. Kein mehrfaches Einrechnen schon in der \u00fcbernehmenden Stiftung erfasster \u00dcbertragungen. Nichtnegative qualifizierte Verm\u00f6genswerte, keine automatische Saldierung von Verbindlichkeiten oder konzerninternen Forderungen, keine rechtliche \u00dcbertragungswirksamkeit/Neugr\u00fcndung. Genehmigung, Unanfechtbarkeit und Zahl \u00fcbertragender Stiftungen bei Zusammenlegung gesondert; keine k\u00fcnstliche Umwidmung sonstigen Verm\u00f6gens in Grundstock.")
 ergebnis
}
