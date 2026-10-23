staffelmiete_flexible_betragsfolge <- function(staffeln=NULL, schutzmodell=NULL, einordnungsnachweis=NULL) {
 .vorhanden(staffeln,'staffeln');.text(einordnungsnachweis,'einordnungsnachweis');.auswahl(schutzmodell,'schutzmodell',c('hoechste_wirksame_vorstaffel','unmittelbar_vorherige_staffel'))
 if(!is.list(staffeln)||!is.null(names(staffeln))||length(staffeln)<2||length(staffeln)>1000) .fehler('staffeln','Liste2..1000erforderlich.')
 daten <- list();betraege <- list()
 for(s in staffeln) {
  if(!is.list(s)||length(s)!=3||!setequal(names(s),c('staffelbeginn_am','vereinbarte_monatsmiete','zulaessige_monatsmiete_ohne_vorstaffelschutz'))) .fehler('staffeln','Genau Beginn,Vereinbarungsbetrag und Grenze erforderlich.')
  daten[[length(daten)+1]] <- s$staffelbeginn_am;betraege[[length(betraege)+1]] <- list(m=.geld(s$vereinbarte_monatsmiete),g=.geld(s$zulaessige_monatsmiete_ohne_vorstaffelschutz))
 }
 if(!staffelmiete_mindestabstaende(daten,einordnungsnachweis)$wert$alle_jahresabstaende_eingehalten) .fehler('staffeln','G\u00fcltige Jahresabst\u00e4nde erforderlich.')
 schutz <- .geld('0');wert <- list()
 for(i in seq_along(daten)) {
  vereinbart <- betraege[[i]]$m;grenze <- betraege[[i]]$g;if(.vergleichen(schutz,grenze)>0) grenze <- schutz
  miete <- if(.vergleichen(vereinbart,grenze)<0) vereinbart else grenze
  wert[[i]] <- list(staffelbeginn_am=daten[[i]],rechnerische_monatsgrenze=.bruchteile(grenze),rechnerische_monatsmiete=.bruchteile(miete),monatlicher_ueberhoehungsbetrag=.bruchteile(.subtrahieren(vereinbart,miete)))
  if(schutzmodell=='unmittelbar_vorherige_staffel'||.vergleichen(miete,schutz)>0) schutz <- miete
 }
 eingaben <- list(staffeln=staffeln, schutzmodell=schutzmodell, einordnungsnachweis=einordnungsnachweis)
 ergebnis <- .ergebnis(wert,"EUR","BGB_STAFFELMIETE_FLEXIBLE_BETRAGSFOLGE",eingaben,list(list(operation="Vereinbarte Staffelbetr\u00e4ge mit aktueller Grenze und rechtlich gew\u00e4hltem historischen Schutz vergleichen, ohne niedrigere Vereinbarung anzuheben.")),eingaben)
 ergebnis$hinweise <- list("Jede vereinbarte Staffel wird nur nach oben durch ihre individuelle556d\u2013g-Grenze samt qualifiziertem Vorstaffelschutz begrenzt. Gesch\u00fctzte fr\u00fchere Miete darf eine niedriger vereinbarte Miete nicht erh\u00f6hen. Modell h\u00f6chste_wirksame_Vorstaffel h\u00e4lt den h\u00f6chsten tats\u00e4chlich zul\u00e4ssigen fr\u00fcheren Betrag; Modell unmittelbar_vorherige_Staffel schreibt nur den zuletzt wirksam begr\u00fcndeten Betrag fort. Rechtliche Fortgeltung bei sinkenden/neu vereinbarten Betr\u00e4gen ist ausdr\u00fccklich vorzugeben, keine allgemeine Entscheidung dieser Auslegungsfrage. In keiner Variante anf\u00e4nglich unzul\u00e4ssige \u00dcberh\u00f6hung sch\u00fctzen. Eine rechtlich eigenst\u00e4ndige neue Folge gesondert rechnen und etwaiges556e-Vormietprivileg mit vorhandenem Vormietkern bestimmen; nicht ungepr\u00fcft historischen H\u00f6chstwert \u00fcbertragen. Mindestjahresabst\u00e4nde mit vorhandenem Kalenderkern.556g-Auskunft/Privilegnutzbarkeit und R\u00fcge gesondert; keine automatische10%-Grenze ohne556e-Ausnahmen.")
 ergebnis
}
