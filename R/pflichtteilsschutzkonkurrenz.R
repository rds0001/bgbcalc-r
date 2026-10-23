# Explizit rechtlich begründete Erbenvorrangvariante, keine allgemeine Konkurrenzentscheidung.
vermaechtniskuerzung_bei_qualifiziertem_erbenvorrang <- function(erwerbswert_vor_vermaechtnis=NULL,vermaechtniswert=NULL,
 gesamte_pflichtteilslast=NULL,anderweitig_getragene_last_2323=NULL,pflichtteilswert_erbe=NULL,pflichtteilswert_vermaechtnisnehmer=NULL,
 erbenvorrang_und_einzelfall_qualifiziert=NULL,rechts_und_bewertungsnachweis=NULL) {
 n <- .geld(erwerbswert_vor_vermaechtnis);v <- .geld(vermaechtniswert);eigen <- .geld(pflichtteilswert_erbe)
 .wahrheitswert(erbenvorrang_und_einzelfall_qualifiziert,'erbenvorrang_und_einzelfall_qualifiziert');.text(rechts_und_bewertungsnachweis,'rechts_und_bewertungsnachweis')
 bedacht <- vermaechtnis_pflichtteilskuerzung(erwerbswert_vor_vermaechtnis,vermaechtniswert,gesamte_pflichtteilslast,anderweitig_getragene_last_2323,'vermaechtnisnehmer',pflichtteilswert_vermaechtnisnehmer,TRUE,rechts_und_bewertungsnachweis)$wert
 kleiner <- function(a,b) if(.vergleichen(a,b)<=0) a else b
 groesser <- function(a,b) if(.vergleichen(a,b)>=0) a else b
 geschuetzt <- kleiner(eigen,.subtrahieren(n,v))
 last <- .subtrahieren(.geld(gesamte_pflichtteilslast),.geld(anderweitig_getragene_last_2323))
 bedarf <- kleiner(v,groesser(.subtrahieren(geschuetzt,.subtrahieren(.subtrahieren(n,v),last)),.bruch(0)))
 kuerzung <- groesser(.zahleneingabe(bedacht$kuerzungsbetrag),bedarf)
 eingaben <- list(erwerbswert_vor_vermaechtnis=erwerbswert_vor_vermaechtnis,vermaechtniswert=vermaechtniswert,gesamte_pflichtteilslast=gesamte_pflichtteilslast,anderweitig_getragene_last_2323=anderweitig_getragene_last_2323,pflichtteilswert_erbe=pflichtteilswert_erbe,pflichtteilswert_vermaechtnisnehmer=pflichtteilswert_vermaechtnisnehmer,erbenvorrang_und_einzelfall_qualifiziert=erbenvorrang_und_einzelfall_qualifiziert,rechts_und_bewertungsnachweis=rechts_und_bewertungsnachweis)
 wert <- if(erbenvorrang_und_einzelfall_qualifiziert) list(anteilige_grundkuerzung=bedacht$anteilige_grundkuerzung,geschuetzter_vorbestehender_erbenwert=.bruchteile(geschuetzt),kuerzung_nach_bedachtenschutz=bedacht$kuerzungsbetrag,vorrangiger_erbenbedarf=.bruchteile(bedarf),kuerzungsbetrag=.bruchteile(kuerzung),verbleibender_vermaechtniswert=.bruchteile(.subtrahieren(v,kuerzung)),verbleibender_erbenwert=.bruchteile(.subtrahieren(.subtrahieren(n,.subtrahieren(v,kuerzung)),last))) else NULL
 ergebnis <- .ergebnis(wert,'EUR','BGB_VERMAECHTNISKUERZUNG_BEI_QUALIFIZIERTEM_ERBENVORRANG',eingaben,list(list(operation='Bedachtenschutz begrenzt proportionale K\u00fcrzung; nur fachlich qualifizierter vorrangiger Erbenbedarf hebt diese Grenze an; Schutz h\u00f6chstens vorbestehender Erbenwert')),eingaben)
 ergebnis$status <- if(!is.null(wert)) 'BERECHNET' else 'NICHT_ANWENDBAR'
 ergebnis$annahmen <- list("Ein Erbe und ein Verm\u00e4chtnis; Erbenvorrang in konkreter2318-Schutzkonkurrenz ausdr\u00fccklich rechtlich qualifiziert.")
 ergebnis$hinweise <- list("Keine automatische Entscheidung der Auslegungskonkurrenz2318II/III: Erbenvorrang muss fachlich vorgegeben sein. Vorbestehende Beeintr\u00e4chtigung durch Verm\u00e4chtnis wird nicht beseitigt; gesch\u00fctzt ist h\u00f6chstens min(eigenerPflichtteil,Erwerb\u2212Verm\u00e4chtnis). Nur zus\u00e4tzliche selbst zu tragende Pflichtteilslast nach2323 wird verteilt. Beide Beteiligten mit vergleichbar bewerteten Pflichtteilen; null als qualifizierter Schutzbetrag zul\u00e4ssig. Keine Mehrverm\u00e4chtnisse,2189-Vorr\u00e4nge,2324-Anordnungen oder vorgelagerte Haftungsbeschr\u00e4nkungen. Erwerb,Verm\u00e4chtnis und gesamteLast wie im Grundkern begrenzt; negativer verbleibender Erbenwert ist kein automatisch festgestellter Zahlungsanspruch.")
 ergebnis
}
