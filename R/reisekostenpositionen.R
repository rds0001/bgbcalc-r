pauschalreise_zusatzkosten_informationsgrenze <- function(kostenpositionen=NULL,einordnungsnachweis=NULL) {
 .vorhanden(kostenpositionen,'kostenpositionen')
 if(!is.list(kostenpositionen)||!is.null(names(kostenpositionen))||length(kostenpositionen)<1||length(kostenpositionen)>1000) .fehler('kostenpositionen','Liste mit1bis1000 eindeutig zugeordneten Kostenpositionen erforderlich.')
 .text(einordnungsnachweis,'einordnungsnachweis');namen <- character();einbezogen <- .bruch(0);ausgeschlossen <- .bruch(0)
 for(position in kostenpositionen) {
  if(!is.list(position)||length(position)!=3||!setequal(names(position),c('kosten_id','betrag','rechtzeitig_ordnungsgemaess_informiert'))) .fehler('kostenpositionen','Genau kosten_id, betrag und rechtzeitig_ordnungsgemaess_informiert erforderlich.')
  name <- .text(position$kosten_id,'kosten_id')
  if(name %in% namen) .fehler('kosten_id','Kostenposition darf nicht mehrfach erfasst werden.')
  namen <- c(namen,name);betrag <- .geld(position$betrag);.wahrheitswert(position$rechtzeitig_ordnungsgemaess_informiert,'rechtzeitig_ordnungsgemaess_informiert')
  if(position$rechtzeitig_ordnungsgemaess_informiert) einbezogen <- .addieren(einbezogen,betrag) else ausgeschlossen <- .addieren(ausgeschlossen,betrag)
 }
 eingaben <- list(kostenpositionen=kostenpositionen,einordnungsnachweis=einordnungsnachweis)
 ergebnis <- .ergebnis(list(nach_informationsgrenze_einbezogene_kosten=.bruchteile(einbezogen),wegen_information_ausgeschlossene_kosten=.bruchteile(ausgeschlossen)),'EUR','BGB_PAUSCHALREISE_ZUSATZKOSTEN_INFORMATIONSGRENZE',eingaben,list(list(operation="Kosten mit rechtzeitiger ordnungsgem\u00e4\u00dfer Vorabinformation summieren; ausgeschlossene Kosten gesondert ausweisen.")),eingaben)
 ergebnis$hinweise <- list("\u00a7651dII: zus\u00e4tzliche Geb\u00fchren, Entgelte und sonstige Kosten; rechtzeitig bedeutet vor Abgabe der Vertragserkl\u00e4rung des Reisenden, nicht blo\u00df vor Best\u00e4tigung des Veranstalters. Inhaltlich ordnungsgem\u00e4\u00dfe Information nach dem verwiesenen EGBGB rechtlich vorqualifizieren; die Library pr\u00fcft kein Informationsformular. Einbeziehung ist nur diese numerische Teilgrenze, kein Nachweis s\u00e4mtlicher Anspruchsvoraussetzungen oder Vertragswirksamkeit. Positionen m\u00fcssen im \u00dcbrigen der ma\u00dfgeblichen Reise zugeordnet und \u00fcberschneidungsfrei sein; bereits gezahlte Betr\u00e4ge separat. Keine Zusatzkosten ausdr\u00fccklich als einzelne Nullposition, keine fehlende Liste.")
 ergebnis
}
pauschalreise_notbeherbergungskosten <- function(nachtkosten=NULL,dreinaechtegrenze_anwendbar=NULL,einordnungsnachweis=NULL) {
 .vorhanden(nachtkosten,'nachtkosten')
 if(!is.list(nachtkosten)||!is.null(names(nachtkosten))||length(nachtkosten)>10000) .fehler('nachtkosten','Chronologische Liste mit0bis10000 Nachtbetr\u00e4gen erforderlich.')
 gesamt <- if(length(nachtkosten)) .rechnungssumme(nachtkosten,'nachtkosten') else .bruch(0)
 .wahrheitswert(dreinaechtegrenze_anwendbar,'dreinaechtegrenze_anwendbar');.text(einordnungsnachweis,'einordnungsnachweis')
 anzahl <- if(dreinaechtegrenze_anwendbar) min(length(nachtkosten),3) else length(nachtkosten)
 beruecksichtigt <- if(anzahl) .rechnungssumme(nachtkosten[seq_len(anzahl)],'nachtkosten') else .bruch(0)
 eingaben <- list(nachtkosten=nachtkosten,dreinaechtegrenze_anwendbar=dreinaechtegrenze_anwendbar,einordnungsnachweis=einordnungsnachweis)
 wert <- list(anzahl_erfasster_naechte=length(nachtkosten),anzahl_beruecksichtigter_naechte=anzahl,kosten_im_qualifizierten_umfang=.bruchteile(beruecksichtigt),kosten_ausserhalb_dreinaechtegrenze=.bruchteile(.subtrahieren(gesamt,beruecksichtigt)))
 ergebnis <- .ergebnis(wert,'EUR_und_naechte','BGB_PAUSCHALREISE_NOTBEHERBERGUNGSKOSTEN',eingaben,list(list(operation="Chronologisch notwendige Nachtkosten summieren; bei anwendbarer Drein\u00e4chtebegrenzung nur die ersten drei N\u00e4chte ber\u00fccksichtigen, Rest gesondert.")),eingaben)
 ergebnis$hinweise <- list("\u00a7651kIV/V: nur qualifizierte notwendige Beherbergung wegen unm\u00f6glicher vertraglicher R\u00fcckbef\u00f6rderung infolge unvermeidbarer au\u00dfergew\u00f6hnlicher Umst\u00e4nde. Nachtkosten chronologisch ab erster notwendiger Nacht vollst\u00e4ndig eingeben, auch eine kostenlose Nacht als0, damit keine sp\u00e4tere Nacht an ihre Stelle r\u00fcckt. Bei anwendbarer Begrenzung keine Auswahl der teuersten drei N\u00e4chte. FALSE nur nach qualifizierter Ausnahme651kV; dann s\u00e4mtliche eingegebenen N\u00e4chte rechtlich dem anderweitig ma\u00dfgeblichen notwendigen Umfang zuordnen, keine unbegrenzte Hotelzusage. Vorrangige EU-Regelungen, pers\u00f6nliche Voraussetzungen/48Stundeninformation, Gleichwertigkeit der Unterkunft und bereits gezahlte Kosten separat. Keine Cent-Rundung und keine automatische R\u00fcckzahlung oder Verdoppelung schon \u00fcbernommener Kosten.")
 ergebnis
}
