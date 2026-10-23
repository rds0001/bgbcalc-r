
lieferantenregress_verjaehrungsgrundfrist <- function(ablieferung_am=NULL, kaeuferanspruch_erfuellt_am=NULL, einordnungsnachweis=NULL) {
 erster <- .datum(ablieferung_am,"ablieferung_am")
 zweiter <- .datum(kaeuferanspruch_erfuellt_am,"kaeuferanspruch_erfuellt_am")
 .text(einordnungsnachweis,"einordnungsnachweis")
 ende1 <- .frist(ablieferung_am,2,"jahre","ereignis")
 ende2 <- .frist(kaeuferanspruch_erfuellt_am,2,"monate","ereignis")
 ende <- max(ende1,ende2)
 eingaben <- list(ablieferung_am=ablieferung_am, kaeuferanspruch_erfuellt_am=kaeuferanspruch_erfuellt_am, einordnungsnachweis=einordnungsnachweis)
 ergebnis <- .ergebnis(list(zweijahres_grundfristende=.iso(ende1),zweimonats_mindestende=.iso(ende2),verknuepftes_grundfristende=.iso(ende)),"daten","BGB_LIEFERANTENREGRESS_VERJAEHRUNGSGRUNDFRIST",eingaben,list(list(operation="Sp\u00e4teres Ende aus Ablieferung plus zwei Jahre und Erf\u00fcllung des K\u00e4uferanspruchs plus zwei Monate")),eingaben)
 ergebnis$annahmen <- list("Qualifizierter gesetzlicher Anwendungsfall und rechtlich bestimmte Ereignistage; feste lokale BGB-Fassung.")
 ergebnis$hinweise <- list("Nur verkn\u00fcpfte gesetzliche Grundfristen; keine automatische Hemmung, Ablaufhemmung, Neubeginn oder Feiertagskorrektur. Ende bezeichnet letzten eingeschlossenen Tag bis Tagesablauf. Keine abschlie\u00dfende Feststellung eingetretener Verj\u00e4hrung.","Nur\u00a7445b Absatz1/2 f\u00fcr qualifizierten Lieferantenregress beim Mangel einer neu hergestellten Sache. Keine historische F\u00fcnfjahreskappung. K\u00e4uferanspruchserf\u00fcllung muss rechtlich bestimmt sein; mehrere Anspr\u00fcche/Teilbefriedigungen separat qualifizieren. Nicht digitale Vertriebskette327u. Verj\u00e4hrung anderer437-Anspr\u00fcche kann andereGrundfrist haben: hier ausdr\u00fccklich zweij\u00e4hrige445a-Aufwendungsersatzgrundfrist.")
 ergebnis
}

delikt_restbereicherung_verjaehrungsgrundfrist <- function(anspruch_entstanden_am=NULL, verletzungsereignis_am=NULL, einordnungsnachweis=NULL) {
 erster <- .datum(anspruch_entstanden_am,"anspruch_entstanden_am")
 zweiter <- .datum(verletzungsereignis_am,"verletzungsereignis_am")
 .text(einordnungsnachweis,"einordnungsnachweis")
 if(erster < zweiter) .fehler("anspruch_entstanden_am","Anspruchsentstehung darf nicht vor dem ausl\u00f6senden Verletzungsereignis liegen.")
 ende1 <- .frist(anspruch_entstanden_am,10,"jahre","ereignis")
 ende2 <- .frist(verletzungsereignis_am,30,"jahre","ereignis")
 ende <- min(ende1,ende2)
 eingaben <- list(anspruch_entstanden_am=anspruch_entstanden_am, verletzungsereignis_am=verletzungsereignis_am, einordnungsnachweis=einordnungsnachweis)
 ergebnis <- .ergebnis(list(zehnjahres_grundfristende=.iso(ende1),dreissigjahres_grundfristende=.iso(ende2),verknuepftes_grundfristende=.iso(ende)),"daten","BGB_DELIKT_RESTBEREICHERUNG_VERJAEHRUNGSGRUNDFRIST",eingaben,list(list(operation="Fr\u00fcheres Ende aus Entstehung des Restbereicherungsanspruchs plus zehn Jahre und Verletzungshandlung/sonstigem ausl\u00f6sendem Ereignis plus drei\u00dfig Jahre")),eingaben)
 ergebnis$annahmen <- list("Qualifizierter gesetzlicher Anwendungsfall und rechtlich bestimmte Ereignistage; feste lokale BGB-Fassung.")
 ergebnis$hinweise <- list("Nur verkn\u00fcpfte gesetzliche Grundfristen; keine automatische Hemmung, Ablaufhemmung, Neubeginn oder Feiertagskorrektur. Ende bezeichnet letzten eingeschlossenen Tag bis Tagesablauf. Keine abschlie\u00dfende Feststellung eingetretener Verj\u00e4hrung.","Nur\u00a7852 Restbereicherung nach deliktischem Erlangen auf Kosten des Verletzten, keine allgemeine Schadensersatzverj\u00e4hrung oder Anspruchsh\u00f6he. Ma\u00dfgebliches ausl\u00f6sendes Ereignis rechtlich qualifizieren; Entstehung nicht vor Ereignis. Kenntnis ist hier kein Beginnparameter. Herausgabeumfang nachBereicherungsrecht gesondert.")
 ergebnis
}

lieferantenregress_verjaehrungsnachlauf <- function(bisheriges_fristende=NULL,kaeuferanspruch_erfuellt_am=NULL,einordnungsnachweis=NULL) {
 bisher <- .datum(bisheriges_fristende,"bisheriges_fristende")
 .datum(kaeuferanspruch_erfuellt_am,"kaeuferanspruch_erfuellt_am")
 .text(einordnungsnachweis,"einordnungsnachweis")
 minimum <- .frist(kaeuferanspruch_erfuellt_am,2,"monate","ereignis")
 eingaben <- list(bisheriges_fristende=bisheriges_fristende,kaeuferanspruch_erfuellt_am=kaeuferanspruch_erfuellt_am,einordnungsnachweis=einordnungsnachweis)
 ergebnis <- .ergebnis(list(bisheriges_fristende=bisheriges_fristende,zweimonats_mindestende=.iso(minimum),verknuepftes_fristende=.iso(max(bisher,minimum))),"daten","BGB_LIEFERANTENREGRESS_VERJAEHRUNGSNACHLAUF",eingaben,list(list(operation="Sp\u00e4teres Ende aus separat bestimmter Anspruchsfrist und K\u00e4uferanspruchserf\u00fcllung plus zwei Monate")),eingaben)
 ergebnis$annahmen <- list("Qualifizierter\u00a7445b Absatz2-Anspruch und separat bestimmter bisheriger Fristablauf; feste lokale BGB-Fassung.")
 ergebnis$hinweise <- list("Nur Zweimonats-Ablaufminimum f\u00fcr qualifizierte437-/445a-Anspr\u00fcche wegen mangelhafter neu hergestellter Sache, nicht digitale Vertriebskette327u. Bisheriges Ende muss zum konkreten Anspruch passen; keine pauschale Zweijahresfrist f\u00fcr alle437-Anspr\u00fcche. Keine historische F\u00fcnfjahreskappung. Sonstige Hemmung/Ablaufhemmung/Neubeginn und Kalenderkorrekturen separat qualifizieren. Keine eigenst\u00e4ndige Wiederbelebungsentscheidung oder Feststellung von K\u00e4uferbefriedigung. Ende jeweils letzter eingeschlossener Tag bis Tagesablauf.")
 ergebnis
}
