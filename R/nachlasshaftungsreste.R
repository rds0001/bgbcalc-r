.haftungsrest_ergebnis <- function(wert,regel,eingaben,operation,hinweis) {
 ergebnis <- .ergebnis(wert,'EUR',regel,eingaben,list(list(operation=operation)),eingaben);ergebnis$status <- if(!is.null(wert)) 'BERECHNET' else 'NICHT_ANWENDBAR'
 ergebnis$annahmen <- list('Rechtlich qualifizierte Haftungsmasse, individuelle Forderung und vorrangige Bindungen; keine automatische Insolvenz- oder Rangpr\u00fcfung.');ergebnis$hinweise <- list(hinweis);ergebnis
}
nachlassglaeubiger_restdeckung <- function(haftungsmasse_vor_bindungen=NULL,vorrangig_gebundener_betrag=NULL,forderungsbetrag=NULL,haftungsfall=NULL,rang_und_einrede_qualifiziert=NULL,bewertungsnachweis=NULL) {
 masse <- .geld(haftungsmasse_vor_bindungen);bindung <- .geld(vorrangig_gebundener_betrag);forderung <- .geld(forderungsbetrag)
 .auswahl(haftungsfall,'haftungsfall',c('ausgeschlossener_glaeubiger_1973','spaetglaeubiger_1974','duerftigkeit_1990','vermaechtnisueberschuldung_1992'))
 .wahrheitswert(rang_und_einrede_qualifiziert,'rang_und_einrede_qualifiziert');.text(bewertungsnachweis,'bewertungsnachweis')
 eingaben <- list(haftungsmasse_vor_bindungen=haftungsmasse_vor_bindungen,vorrangig_gebundener_betrag=vorrangig_gebundener_betrag,forderungsbetrag=forderungsbetrag,haftungsfall=haftungsfall,rang_und_einrede_qualifiziert=rang_und_einrede_qualifiziert,bewertungsnachweis=bewertungsnachweis)
 wert <- NULL
 if(rang_und_einrede_qualifiziert) {
  frei <- .subtrahieren(masse,bindung);if(.vergleichen(frei,.bruch(0))<0) frei <- .bruch(0)
  gedeckt <- if(.vergleichen(frei,forderung)<0) frei else forderung
  wert <- list(freie_haftungsmasse=.bruchteile(frei),gedeckter_forderungsteil=.bruchteile(gedeckt),nicht_gedeckter_forderungsteil=.bruchteile(.subtrahieren(forderung,gedeckt)))
 }
 .haftungsrest_ergebnis(wert,"BGB_NACHLASSGLAEUBIGER_RESTDECKUNG",eingaben,"Positive Haftungsmasse nach vorrangigen Bindungen bestimmen; einzelne Forderung darauf begrenzen, ungedeckten Rest getrennt","1973: Nichtausgeschlossene grunds\u00e4tzlich vorab; Pflichtteils-/Verm\u00e4chtnis-/Auflagenlasten grunds\u00e4tzlich nachrangig, au\u00dfer schon vor Geltendmachung berichtigt.1974II: unter diesen besonderen Lastarten nur Vorrang entsprechend Nachlassinsolvenz; Rang muss ausdr\u00fccklich vorqualifiziert sein.1990 erfordert besondere D\u00fcrftigkeitseinrede,1992 einschl\u00e4gige Verm\u00e4chtnis-/Auflagen\u00fcberschuldung;1991IV-Insolvenzrang ber\u00fccksichtigen. Bereicherungsrechtlich ma\u00dfgebliche Haftungsmasse1973II und Verantwortlichkeitskorrekturen1991 vorher bewerten. Bereits befriedigte oder gleichstehend rechtskr\u00e4ftig zuerkannte Betr\u00e4ge1973II3/1991III k\u00f6nnen Bindungen sein, nicht doppelt von bereits bereinigter Masse abziehen. Keine automatische Gleichrangquote; bei konkurrierenden gleichrangigen Forderungen verf\u00fcgbare Masse/Bindungen rechtlich zuordnen. Ungedeckte Forderung erlischt nicht, Sachherausgabe nicht pauschal in Geldpflicht umwandeln.")
}
nacherbe_haftungsmasse <- function(erlangter_erbschaftswert_ohne_vorerbenansprueche=NULL,anspruchswert_gegen_vorerben=NULL,bewertungsnachweis=NULL) {
 erlangt <- .geld(erlangter_erbschaftswert_ohne_vorerbenansprueche);ansprueche <- .geld(anspruchswert_gegen_vorerben);.text(bewertungsnachweis,'bewertungsnachweis')
 eingaben <- list(erlangter_erbschaftswert_ohne_vorerbenansprueche=erlangter_erbschaftswert_ohne_vorerbenansprueche,anspruchswert_gegen_vorerben=anspruchswert_gegen_vorerben,bewertungsnachweis=bewertungsnachweis)
 wert <- .bruchteile(.addieren(erlangt,ansprueche))
 .haftungsrest_ergebnis(wert,"BGB_NACHERBE_HAFTUNGSMASSE",eingaben,"Erlangten Erbschaftswert und \u00fcberschneidungsfrei bewertete Anspr\u00fcche gegen Vorerben summieren","Nur numerische Masse2144I; Anspr\u00fcche gegen Vorerben als solchen rechtlich und wirtschaftlich bewerten. Keine doppelte Erfassung bereits erf\u00fcllter Anspr\u00fcche als erhaltene Gegenst\u00e4nde und offene Forderungen. Kein automatischer Haftungsdeckel f\u00fcr jede Schuld: Voraussetzungen der Haftungsbeschr\u00e4nkung sowie Rang-/Kostenbindungen separat. Inventarwirkung2144II und Sonderverh\u00e4ltnis2144III sind rechtliche Voraussetzungen, keine zus\u00e4tzliche Rechnung.")
}
vorerbe_verbleibende_haftung <- function(nachlassschuld=NULL,rechtlich_vom_nacherben_getragener_schuldteil=NULL,schuld_im_innenverhaeltnis_vorerbe=NULL,vorerbe_unbeschraenkt_haftend=NULL,fuer_forderung_verfuegbare_vorerbenmasse=NULL,nacherbfall_qualifiziert=NULL,bewertungsnachweis=NULL) {
 schuld <- .geld(nachlassschuld);nacherbe <- .geld(rechtlich_vom_nacherben_getragener_schuldteil);masse <- .geld(fuer_forderung_verfuegbare_vorerbenmasse)
 if(.vergleichen(nacherbe,schuld)>0) .fehler('rechtlich_vom_nacherben_getragener_schuldteil','Rechtlicher Nacherbenhaftungsteil darf Gesamtforderung nicht \u00fcbersteigen.')
 .wahrheitswert(schuld_im_innenverhaeltnis_vorerbe,'schuld_im_innenverhaeltnis_vorerbe');.wahrheitswert(vorerbe_unbeschraenkt_haftend,'vorerbe_unbeschraenkt_haftend');.wahrheitswert(nacherbfall_qualifiziert,'nacherbfall_qualifiziert');.text(bewertungsnachweis,'bewertungsnachweis')
 eingaben <- list(nachlassschuld=nachlassschuld,rechtlich_vom_nacherben_getragener_schuldteil=rechtlich_vom_nacherben_getragener_schuldteil,schuld_im_innenverhaeltnis_vorerbe=schuld_im_innenverhaeltnis_vorerbe,vorerbe_unbeschraenkt_haftend=vorerbe_unbeschraenkt_haftend,fuer_forderung_verfuegbare_vorerbenmasse=fuer_forderung_verfuegbare_vorerbenmasse,nacherbfall_qualifiziert=nacherbfall_qualifiziert,bewertungsnachweis=bewertungsnachweis)
 wert <- NULL
 if(nacherbfall_qualifiziert) {
  resthaftung <- if(schuld_im_innenverhaeltnis_vorerbe) schuld else .subtrahieren(schuld,nacherbe)
  deckung <- if(vorerbe_unbeschraenkt_haftend || .vergleichen(resthaftung,masse)<0) resthaftung else masse
  wert <- list(verbleibende_haftung_vor_massenbegrenzung=.bruchteile(resthaftung),befriedigungsbetrag_nach_massenbegrenzung=.bruchteile(deckung),wegen_massenbegrenzung_nicht_gedeckter_teil=.bruchteile(.subtrahieren(resthaftung,deckung)))
 }
 .haftungsrest_ergebnis(wert,"BGB_VORERBE_VERBLEIBENDE_HAFTUNG",eingaben,"Ohne eigene Innenlast rechtlich vom Nacherben getragenen Teil abziehen; bei eigener Innenlast volle Schuld; beschr\u00e4nkte Vorerbenhaftung auf zugeordnete Masse begrenzen","Nach Eintritt Nacherbfolge2145. Ma\u00dfgeblich ist rechtliche Haftung des Nacherben, nicht dessen Zahlungsf\u00e4higkeit oder bisherige Zahlung. Innenlast betrifft gesamte hier eingegebene Forderung; gemischte Innenlasten vorher \u00fcberschneidungsfrei aufteilen. Rechtliche Resthaftung bei eigener Innenlast nicht doppelt addieren. Verf\u00fcgbare Vorerbenmasse ist der ihm von Erbschaft geb\u00fchrende, dieser Forderung nach Rang/Bindungen tats\u00e4chlich zugeordnete Wert;1990/1991 entsprechend ber\u00fccksichtigen. Unbeschr\u00e4nkte Haftung wird nicht auf diese Masse gekappt. Keine beliebige eigene Verm\u00f6genssumme und kein automatisches Erl\u00f6schen ungedeckter Forderung.")
}
