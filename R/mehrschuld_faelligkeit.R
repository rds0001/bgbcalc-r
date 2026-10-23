geldschulden_nach_bestimmung_oder_rang_tilgen <- function(zahlung=NULL, schulden=NULL, bestimmte_schuld_id=NULL, einordnungsnachweis=NULL) {
 rest <- .geld(zahlung);.text(einordnungsnachweis,'einordnungsnachweis');.vorhanden(schulden,'schulden')
 if(!is.list(schulden) || !is.null(names(schulden)) || length(schulden)<1 || length(schulden)>1000) .fehler('schulden','Liste1..1000 erforderlich.')
 namen <- character();forderungen <- list();raenge <- matrix(numeric(),nrow=0,ncol=4)
 for(p in schulden) {
  if(!is.list(p) || !identical(sort(names(p)),sort(c('schuld_id','offener_betrag','faellig','sicherheitsrang','laestigkeitsrang','altersrang')))) .fehler('schulden','Genau Kennung, offener Betrag, F\u00e4lligkeit und drei Rangfelder erforderlich.')
  name <- .text(p$schuld_id,'schuld_id');betrag <- .geld(p$offener_betrag);.wahrheitswert(p$faellig,'faellig')
  if(name %in% namen) .fehler('schuld_id','Doppelte Kennung unzul\u00e4ssig.')
  if(.vergleichen(betrag,.bruch(0))<=0) .fehler('offener_betrag','Positiver offener Betrag erforderlich.')
  rang <- c(if(p$faellig) 0 else 1,vapply(c('sicherheitsrang','laestigkeitsrang','altersrang'),function(k) .ganzzahl(p[[k]],k,1,9007199254740991),numeric(1)))
  namen <- c(namen,name);forderungen <- c(forderungen,list(betrag));raenge <- rbind(raenge,unname(rang))
 }
 if(!is.null(bestimmte_schuld_id)) {
  .text(bestimmte_schuld_id,'bestimmte_schuld_id')
  if(!(bestimmte_schuld_id %in% namen)) .fehler('bestimmte_schuld_id','Bestimmte Schuld muss in der Liste stehen.')
  gruppen <- list(which(namen==bestimmte_schuld_id))
 } else {
  muster <- unique(raenge);muster <- muster[do.call(order,lapply(seq_len(4),function(j) muster[,j])),,drop=FALSE]
  gruppen <- lapply(seq_len(nrow(muster)),function(g) which(vapply(seq_len(nrow(raenge)),function(i) all(raenge[i,]==muster[g,]),logical(1))))
 }
 zugeteilt <- lapply(namen,function(x) .geld('0'))
 for(gruppe in gruppen) {
  betraege <- forderungen[gruppe];kern <- .begrenzte_quotenverteilung(rest,betraege,betraege);rest <- kern$rest
  for(j in seq_along(gruppe)) zugeteilt[[gruppe[j]]] <- kern$zugeordnet[[j]]
 }
 wert <- list(zuordnungen=lapply(seq_along(namen),function(i) list(schuld_id=namen[i],tilgungsbetrag=.bruchteile(zugeteilt[[i]]),restschuld=.bruchteile(.subtrahieren(forderungen[[i]],zugeteilt[[i]])))),nicht_zugeordnet=.bruchteile(rest))
 eingaben <- list(zahlung=zahlung, schulden=schulden, bestimmte_schuld_id=bestimmte_schuld_id, einordnungsnachweis=einordnungsnachweis)
 ergebnis <- .ergebnis(wert,"EUR","BGB_GELDSCHULDEN_NACH_BESTIMMUNG_ODER_RANG_TILGEN",eingaben,list(list(operation="Eindeutige Tilgungsbestimmung ausf\u00fchren oder gesetzliche F\u00e4lligkeits-/Sicherheits-/L\u00e4stigkeits-/Altersgruppen proportional bedienen.")),eingaben)
 ergebnis$hinweise <- list("\u00a7366I/II: bei qualifizierter eindeutiger Tilgungsbestimmung nur bestimmte Schuld bedienen; \u00dcberschuss bleibt unzugeordnet, keine erfundene weitere Schuldnerbestimmung. Ohne Bestimmung f\u00e4llige vor nicht f\u00e4lligen Schulden, dann geringere Sicherheit, gr\u00f6\u00dfere L\u00e4stigkeit, h\u00f6heres Alter; bei vollst\u00e4ndigem Gleichrang verh\u00e4ltnism\u00e4\u00dfig nach offenen Betr\u00e4gen. Nicht f\u00e4llige Forderungen m\u00fcssen vorzeitig erf\u00fcllbar sein. Qualifizierte Rangwerte sind keine automatisch bewertete Sicherheit/L\u00e4stigkeit. Mehrfachbestimmungen, Gl\u00e4ubiger-/Parteivereinbarungen und Spezialregeln gesondert. Innerhalb jeder Schuld Kosten/Zinsen/Hauptforderung367 separat; keine automatische Erstattung des unzugeordneten Betrags.")
 ergebnis
}
