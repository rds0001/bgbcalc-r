fortsetzung_interne_schuldanteile <- function(gesamtgutschuld=NULL, abkoemmlinge=NULL, haftungsnachweis=NULL) {
 .text(haftungsnachweis,'haftungsnachweis');.geld(gesamtgutschuld);.vorhanden(abkoemmlinge,'abkoemmlinge')
 if(!is.list(abkoemmlinge)||!is.null(names(abkoemmlinge))||length(abkoemmlinge)<1||length(abkoemmlinge)>1000) .fehler('abkoemmlinge','Begrenzte nichtleere Liste erforderlich.')
 basis <- list();gewichte <- list();summe <- .bruch(0)
 for(a in abkoemmlinge) {
  if(!is.list(a)||length(a)!=2||!setequal(names(a),c('abkoemmling_id','anteil_gesamtgut'))) .fehler('abkoemmlinge','Kennung und Gesamtgutsanteil erforderlich.')
  q <- .geld(a$anteil_gesamtgut);summe <- .addieren(summe,q)
  basis[[length(basis)+1]] <- list(abkoemmling_id=a$abkoemmling_id,grundanteilswert='0');gewichte[[length(gewichte)+1]] <- list(abkoemmling_id=a$abkoemmling_id,lastgewicht=a$anteil_gesamtgut)
 }
 if(.vergleichen(summe,.bruch(1))>0) .fehler('anteil_gesamtgut','Anteilssumme darf eins nicht uebersteigen.')
 k <- fortsetzung_beguenstigtenbezogene_lasten(basis,list(list(last_id='1504',betrag=gesamtgutschuld,beguenstigte=gewichte)),haftungsnachweis)$wert
 wert <- lapply(k$abkoemmlingssalden,function(a)list(abkoemmling_id=a$abkoemmling_id,interner_schuldanteil=a$lastensumme))
 eingaben <- list(gesamtgutschuld=gesamtgutschuld, abkoemmlinge=abkoemmlinge, haftungsnachweis=haftungsnachweis)
 ergebnis <- .ergebnis(wert,"EUR","BGB_FORTSETZUNG_INTERNE_SCHULDANTEILE",eingaben,list(list(operation="Gesamtgutschuld intern nach relativen qualifizierten Gesamtgutsanteilen verteilen; gegenstaendliche Haftungsgrenze nicht in Gelddeckel umdeuten.")),eingaben)
 ergebnis$hinweise <- list("\u00a71504 interne Verteilung der qualifizierten Gesamtgutschuld nach relativer Groesse der Gesamtgutsanteile der anteilsberechtigten Abkoemmlinge. Vorhandenen exakten Beguenstigten-Gewichtskern rein rechnerisch wiederverwenden; keine Anwendung1503III auf Glaeubigerschulden behaupten. Die Verpflichtung beschraenkt sich auf zugeteilte Gegenstaende: kein pauschaler Gelddeckel in Hoehe ihres Schaetzwerts und keine allgemeine persoenliche Nachschusspflicht. Ergebnis ist interne Schuldzuordnung vor gegenstaendlicher Vollstreckungs-/Haftungspruefung, kein bezifferter individuell durchsetzbarer Zahlungsanspruch. Keine automatische Ausfallumlage.")
 ergebnis
}
