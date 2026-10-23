wohnraum_umwandlung_sperrfrist <- function(massgeblicher_erwerb_am=NULL, sperrfrist_monate=NULL, einordnungsnachweis=NULL) {
 .datum(massgeblicher_erwerb_am,'massgeblicher_erwerb_am');monate <- .ganzzahl(sperrfrist_monate,'sperrfrist_monate',36,120)
 ende <- .frist(massgeblicher_erwerb_am,monate,'monate','ereignis')
 wert <- list(sperrfristende=.iso(ende),erster_tag_nach_sperrfrist=.iso(.tage_addieren(ende,1)))
 .text(einordnungsnachweis,"einordnungsnachweis")
 eingaben <- list(massgeblicher_erwerb_am=massgeblicher_erwerb_am, sperrfrist_monate=sperrfrist_monate, einordnungsnachweis=einordnungsnachweis)
 ergebnis <- .ergebnis(wert,"daten_und_zahlen","BGB_WOHNRAUM_UMWANDLUNG_SPERRFRIST",eingaben,list(list(operation="Qualifizierte Sperrfrist von36bis120Monaten ab ma\u00dfgeblichem Erwerb berechnen und ersten Tag nach Fristablauf ausweisen.")),eingaben)
 ergebnis$hinweise <- list("\u00a7577aI/Ia/II/IIa: nur Ende der qualifizierten K\u00fcndigungsbeschr\u00e4nkung. Bei sp\u00e4terer Begr\u00fcndung von Wohnungseigentum nachVer\u00e4u\u00dferung/BelastungIa l\u00e4uft die Frist bereits ab dem VorgangIa, nicht erneut ab Umwandlung. Nach Ablauf kann erst diese Sperre entfallen; keine automatische K\u00fcndigungsberechtigung, kein Mietende und keine Verk\u00fcrzung gesetzlicher K\u00fcndigungsfristen. Einschl\u00e4gige verl\u00e4ngerte Dauer ausdr\u00fccklich eingeben; nicht pauschal zehn Jahre f\u00fcr s\u00e4mtliche Orte. Keine193Verschiebung, da Schutzzeitraum.")
 ergebnis
}
landpacht_fortsetzungsdauergrenze <- function(pachtbeginn_am=NULL, vereinbartes_pachtende_am=NULL, pachtart=NULL, einordnungsnachweis=NULL) {
 beginn <- .datum(pachtbeginn_am,'pachtbeginn_am');vertrag <- .datum(vereinbartes_pachtende_am,'vereinbartes_pachtende_am')
 if(vertrag<beginn) .fehler('vereinbartes_pachtende_am','Pachtende darf nicht vor Beginn liegen.')
 .auswahl(pachtart,'pachtart',c('betrieb_oder_kultiviertes_moor_oedland','anderes_grundstueck'))
 jahre <- if(pachtart=='betrieb_oder_kultiviertes_moor_oedland') 18 else 12
 ende <- .frist(pachtbeginn_am,jahre,'jahre','tagesbeginn')
 wert <- list(dauergrenze_jahre=jahre,gerichtlicher_hoechsttermin=.iso(ende),vereinbarte_dauer_erreicht_grenze=vertrag>=ende)
 .text(einordnungsnachweis,"einordnungsnachweis")
 eingaben <- list(pachtbeginn_am=pachtbeginn_am, vereinbartes_pachtende_am=vereinbartes_pachtende_am, pachtart=pachtart, einordnungsnachweis=einordnungsnachweis)
 ergebnis <- .ergebnis(wert,"daten_und_zahlen","BGB_LANDPACHT_FORTSETZUNGSDAUERGRENZE",eingaben,list(list(operation="Zw\u00f6lf- beziehungsweise Achtzehnjahresgrenze ab Beginn des laufenden Pachtverh\u00e4ltnisses berechnen und vereinbarte Dauer damit vergleichen.")),eingaben)
 ergebnis$hinweise <- list("\u00a7595III3/VI:18Jahre f\u00fcr Betriebspacht, betriebsbildende Zupachtung oder vom P\u00e4chter kultiviertes Moor-/\u00d6dland, sonst12Jahre. Vereinbarte Dauer mindestens dieser L\u00e4nge ist eine numerische Ausschlussgrenze nachIII3; keine alleinige Entscheidung \u00fcber alle Fortsetzungsgr\u00fcnde. Gerichtliche Fortsetzung nachVI h\u00f6chstens bis zum ausgegebenen Termin, gerechnet ab Beginn des laufenden Pachtverh\u00e4ltnisses, nicht je Verl\u00e4ngerung neu. Weitere Ausschlussgr\u00fcnde, angemessene k\u00fcrzere Dauer, Teilfl\u00e4chen und Bedingungen extern qualifizieren. Ende einschlie\u00dflich Endtag; keine193Verschiebung.")
 ergebnis
}
