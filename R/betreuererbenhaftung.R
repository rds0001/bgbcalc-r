betreuer_erbenhaftungsbetrag <- function(verbleibender_uebergegangener_anspruch=NULL, nachlasswert_im_erbfall=NULL, bereits_ausgeschoepfter_haftungsrahmen=NULL, haftungsnachweis=NULL) {
 anspruch <- .geld(verbleibender_uebergegangener_anspruch)
 nachlass <- .geld(nachlasswert_im_erbfall);ausgeschoepft <- .geld(bereits_ausgeschoepfter_haftungsrahmen)
 .text(haftungsnachweis,'haftungsnachweis')
 rahmen <- if(.vergleichen(nachlass,ausgeschoepft)>0) .subtrahieren(nachlass,ausgeschoepft) else .bruch(0)
 betrag <- if(.vergleichen(anspruch,rahmen)<0) anspruch else rahmen
 wert <- list(verbleibender_haftungsrahmen=.bruchteile(rahmen),rechnerischer_haftungsbetrag=.bruchteile(betrag),durch_rahmen_nicht_gedeckter_anspruch=.bruchteile(.subtrahieren(anspruch,betrag)))
 eingaben <- list(verbleibender_uebergegangener_anspruch=verbleibender_uebergegangener_anspruch, nachlasswert_im_erbfall=nachlasswert_im_erbfall, bereits_ausgeschoepfter_haftungsrahmen=bereits_ausgeschoepfter_haftungsrahmen, haftungsnachweis=haftungsnachweis)
 ergebnis <- .ergebnis(wert,"EUR","BGB_BETREUER_ERBENHAFTUNGSBETRAG",eingaben,list(list(operation="Verbleibenden Nachlasswert-Haftungsrahmen als nichtnegativen Rest nach rechtlich qualifizierter Aussch\u00f6pfung berechnen; verbleibenden Staatskassenanspruch auf diesen Rahmen begrenzen.")),eingaben)
 ergebnis$hinweise <- list("\u00a71881Satz2: nur BGB-Nachlasswertdeckel bei bereits rechtlich bestimmten Eingaben, keine vollst\u00e4ndige Sozialhilfe-Erbenhaftungsberechnung. Entsprechend102III/IVSGBXII geltende Ausnahmen und Erl\u00f6schen sind vorab in den verbleibenden Anspruch einzubeziehen; externe Freibetr\u00e4ge nicht erfinden.1880II wird nach1881Satz2 auf Erben nicht angewandt. Die Wertgrenze desselben Nachlasses bei mehreren Anspr\u00fcchen nicht mehrfach ungek\u00fcrzt aussch\u00f6pfen; anrechenbare Vorbefriedigungen rechtlich belegen. Keine automatische Erbquotenaufteilung, gesamtschuldnerische Innenverteilung oder Sachbewertung. Betrag au\u00dferhalb des Rahmens ist rechnerisch ungedeckt, kein automatisches Erl\u00f6schen gegen\u00fcber anderen Verpflichteten. \u00dcberh\u00f6hte fr\u00fchere Zahlung erzeugt hier keine R\u00fcckerstattung.")
 ergebnis
}
