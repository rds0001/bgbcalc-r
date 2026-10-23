pacht_kuendigungstermin <- function(fristfall=NULL, kuendigungszugang_am=NULL, fristabschnitte=NULL, werktagskalender=NULL, einordnungsnachweis=NULL) {
 .auswahl(fristfall,'fristfall',c('pacht_584','landpacht_ordentlich_594a','landpacht_ausserordentlich_594a'))
 zugang <- .datum(kuendigungszugang_am,'kuendigungszugang_am');.text(einordnungsnachweis,'einordnungsnachweis')
 .vorhanden(werktagskalender,'werktagskalender')
 if(!is.list(werktagskalender)||is.null(names(werktagskalender))||length(werktagskalender)!=3L||!setequal(names(werktagskalender),c('erster_kalendertag','letzter_kalendertag','werktage'))) .fehler('werktagskalender','Genau erster_kalendertag, letzter_kalendertag und werktage erforderlich.')
 kalender <- .bankkalender(list(erster_kalendertag=werktagskalender$erster_kalendertag,letzter_kalendertag=werktagskalender$letzter_kalendertag,geschaeftstage=werktagskalender$werktage))
 .vorhanden(fristabschnitte,'fristabschnitte')
 if(!is.list(fristabschnitte)||!is.null(names(fristabschnitte))||length(fristabschnitte)<1L||length(fristabschnitte)>1000L) .fehler('fristabschnitte','Geordnete Liste1..1000 vollst\u00e4ndig qualifizierter Fristabschnitte erforderlich.')
 vorher <- NULL;wert <- NULL
 for(abschnitt in fristabschnitte) {
  if(!is.list(abschnitt)||is.null(names(abschnitt))||length(abschnitt)!=2L||!setequal(names(abschnitt),c('fristabschnitt_beginn_am','pachtende_am'))) .fehler('fristabschnitte','Genau fristabschnitt_beginn_am und pachtende_am erforderlich.')
  beginn <- .datum(abschnitt$fristabschnitt_beginn_am,'fristabschnitt_beginn_am');ende <- .datum(abschnitt$pachtende_am,'pachtende_am')
  if(ende<beginn||(!is.null(vorher)&&(beginn<=vorher[[1L]]||ende<=vorher[[2L]]))) .fehler('fristabschnitte','Beginn und Ende streng aufsteigend, Ende nicht vor Beginn.')
  vorher <- list(beginn,ende)
  dritter <- .banktermin(.banktermin(beginn,kalender,'ab'),kalender,'nach',2)
  if(dritter>ende) .fehler('fristabschnitte','Dritter Werktag darf nicht nach dem zugeordneten Pachtende liegen.')
  if(is.null(wert)&&zugang<=dritter) wert <- list(letzter_zugangstag=.iso(dritter),rechnerischer_pachtendtermin=.iso(ende))
 }
 if(is.null(wert)) .fehler('fristabschnitte','Kein nach Zugang noch erreichbarer Termin in der vollst\u00e4ndigen Liste.')
 eingaben <- list(fristfall=fristfall, kuendigungszugang_am=kuendigungszugang_am, fristabschnitte=fristabschnitte, werktagskalender=werktagskalender, einordnungsnachweis=einordnungsnachweis)
 ergebnis <- .ergebnis(wert,"daten","BGB_PACHT_KUENDIGUNGSTERMIN",eingaben,list(list(operation="Dritten qualifizierten Werktag je normativ zugeordnetem Pachtabschnitt z\u00e4hlen und ersten beim Zugang noch erreichbaren Pachtendtermin ausw\u00e4hlen.")),eingaben)
 ergebnis$hinweise <- list("\u00a7584I/II beziehungsweise594aI/II: dritten einschl\u00e4gigen Werktag ab dem qualifizierten Fristabschnittsbeginn einschlie\u00dflich bestimmen und erstes Pachtende ausw\u00e4hlen, dessen Stichtag beim Zugang noch nicht \u00fcberschritten ist.594aI koppelt Pachtjahresbeginn an Ende des n\u00e4chsten Pachtjahres;584/594aII koppelt letzten Halbjahresbeginn an Ende desselben Pachtjahres. Diese Periodenzuordnung ist ausdr\u00fccklich Eingabe, keine freie K\u00fcrzungsvereinbarung. Liste muss s\u00e4mtliche m\u00f6glichen Termine ab Zugang vollst\u00e4ndig enthalten; kein automatisches \u00dcberspringen ausgelassener Jahre. Samstag-/Feiertagsqualifikation extern, keine Gleichsetzung mit Bankgesch\u00e4ftstagen trotz Wiederverwendung derselben Kalendersuche. Keine automatische K\u00fcndigungsberechtigung oder Textform-/Zugangsbewertung. Ein zu kurzer Kalender oder fehlender erreichbarer Termin ist Eingabefehler, kein unbefristeter Vertrag.")
 ergebnis
}
