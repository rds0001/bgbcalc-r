pflichtteilsergaenzung_gleichzeitige_schenkungen <- function(fehlbetrag=NULL, beschenkte=NULL, einordnungsnachweis=NULL) {
 betrag <- .geld(fehlbetrag);.text(einordnungsnachweis,'einordnungsnachweis');.vorhanden(beschenkte,'beschenkte')
 if(!is.list(beschenkte) || !is.null(names(beschenkte)) || length(beschenkte)<2 || length(beschenkte)>1000) .fehler('beschenkte','Liste2..1000 erforderlich.')
 namen <- character();werte <- list()
 for(p in beschenkte) {
  if(!is.list(p) || !identical(sort(names(p)),sort(c('beschenkter_id','massgeblicher_schenkungswert')))) .fehler('beschenkte','Genau Kennung und ma\u00dfgeblicher Schenkungswert erforderlich.')
  name <- .text(p$beschenkter_id,'beschenkter_id');wert_einzeln <- .geld(p$massgeblicher_schenkungswert)
  if(name %in% namen) .fehler('beschenkter_id','Jede Person genau einmal.')
  if(.vergleichen(wert_einzeln,.bruch(0))<=0) .fehler('massgeblicher_schenkungswert','Positiver Wert erforderlich.')
  namen <- c(namen,name);werte <- c(werte,list(wert_einzeln))
 }
 kern <- .begrenzte_quotenverteilung(betrag,werte,werte)
 anteile <- lapply(seq_along(namen),function(i) list(beschenkter_id=namen[i],rechnerischer_haftungsanteil=.bruchteile(kern$zugeordnet[[i]])))
 wert <- list(beschenktenanteile=anteile,nicht_gedeckter_fehlbetrag=.bruchteile(kern$rest))
 eingaben <- list(fehlbetrag=fehlbetrag, beschenkte=beschenkte, einordnungsnachweis=einordnungsnachweis)
 ergebnis <- .ergebnis(wert,"EUR","BGB_PFLICHTTEILSERGAENZUNG_GLEICHZEITIGE_SCHENKUNGEN",eingaben,list(list(operation="Fehlbetrag innerhalb einer qualifizierten Gleichzeitigkeitsgruppe proportional nach Schenkungswerten bis zur Summe dieser Werte aufteilen.")),eingaben)
 ergebnis$hinweise <- list("\u00a72329III mit erg\u00e4nzender Prim\u00e4rquelle AG Bielefeld, Urteil17.05.2019,409C30/18,Rn35: gleichzeitige Schenkungen anteilig nach ma\u00dfgeblichen Schenkungswerten. Nur Grundfall ohne zus\u00e4tzliche individuelle Haftungsbegrenzungen/Ausf\u00e4lle und ohne gruppen\u00fcbergreifende Personenrahmen. Fehlbetrag h\u00f6chstens bis zur Summe dieser Schenkungswerte proportional zuordnen; gr\u00f6\u00dferer Rest bleibt f\u00fcr eine gesonderte Pr\u00fcfung fr\u00fcherer Schenkungen. Nicht nach K\u00f6pfen, keine Gesamtschuld. Werte, Gleichzeitigkeit und Bereicherungs-/Pflichtteilsvoraussetzungen rechtlich qualifizieren; kein automatischer Geldanspruch statt Sachherausgabe. Kein allgemeiner Streitentscheid \u00fcber Sonderf\u00e4lle aus einem amtsgerichtlichen Urteil ableiten.")
 ergebnis
}
