landpacht_anpassung_zeitgrenzen <- function(pachtbeginn_am=NULL, letzte_aenderung_wirksam_am=NULL, beginnart=NULL, naturereignis_ausnahme=NULL, aenderungsverlangen_am=NULL, pachtjahr_beginn_am=NULL, pachtjahr_ende_am=NULL, einordnungsnachweis=NULL) {
 beginn <- .datum(pachtbeginn_am,'pachtbeginn_am')
 verlangen <- .datum(aenderungsverlangen_am,'aenderungsverlangen_am')
 bezug <- beginn
 if(!is.null(letzte_aenderung_wirksam_am)) bezug <- .datum(letzte_aenderung_wirksam_am,'letzte_aenderung_wirksam_am')
 if(!(beginn<=bezug && bezug<=verlangen)) .fehler('letzte_aenderung_wirksam_am','Beginn und letzte \u00c4nderung m\u00fcssen sp\u00e4testens beim Verlangen liegen; \u00c4nderung nicht vor Beginn.')
 jahrbeginn <- .datum(pachtjahr_beginn_am,'pachtjahr_beginn_am')
 jahrende <- .datum(pachtjahr_ende_am,'pachtjahr_ende_am')
 if(!(jahrbeginn<=verlangen && verlangen<=jahrende)) .fehler('pachtjahr_beginn_am','Das qualifizierte Pachtjahr muss den Erkl\u00e4rungstag umfassen.')
 .auswahl(beginnart,'beginnart',c('ereignis','tagesbeginn'))
 .wahrheitswert(naturereignis_ausnahme,'naturereignis_ausnahme');.text(einordnungsnachweis,'einordnungsnachweis')
 frueh <- if(naturereignis_ausnahme) NULL else .tage_addieren(.frist(.iso(bezug),2,'jahre',beginnart),1)
 wert <- list(erster_tag_nach_wartezeit=if(is.null(frueh)) NULL else .iso(frueh),rechnerische_rueckwirkungsgrenze=.iso(jahrbeginn),wartezeit_eingehalten=is.null(frueh)||verlangen>=frueh)
 eingaben <- list(pachtbeginn_am=pachtbeginn_am, letzte_aenderung_wirksam_am=letzte_aenderung_wirksam_am, beginnart=beginnart, naturereignis_ausnahme=naturereignis_ausnahme, aenderungsverlangen_am=aenderungsverlangen_am, pachtjahr_beginn_am=pachtjahr_beginn_am, pachtjahr_ende_am=pachtjahr_ende_am, einordnungsnachweis=einordnungsnachweis)
 ergebnis <- .ergebnis(wert,"daten","BGB_LANDPACHT_ANPASSUNG_ZEITGRENZEN",eingaben,list(list(operation="Zweijahreswartezeit und Ausnahme rechnerisch verkn\u00fcpfen, Erkl\u00e4rungstag vergleichen und R\u00fcckwirkungsgrenze des zugeordneten Pachtjahres ausweisen.")),eingaben)
 ergebnis$hinweise <- list("\u00a7593II/III: Zweijahreswartezeit ab Beginn beziehungsweise letzter wirksamer Vertragsleistungs\u00e4nderung, au\u00dfer qualifiziertem verw\u00fcstendem Naturereignis ohne \u00fcblichen Versicherungsschutz. Beginnart rechtlich bestimmen; beim Tagesbeginn1.Juli2022 endet die Wartezeit30.Juni2024, erster Folgetag1.Juli2024. Ausgewiesene R\u00fcckwirkungsgrenze ist der Beginn des Pachtjahres des tats\u00e4chlichen Verlangens, nicht automatisch der Erkl\u00e4rungstag oder Kalenderjahresbeginn. Eine rechnerisch verfr\u00fchte Erkl\u00e4rung wird weder verschoben noch als wirksam best\u00e4tigt. Grundlegende Verh\u00e4ltnis\u00e4nderung, grobes Missverh\u00e4ltnis, Ausschl\u00fcsse und konkrete neue Vertragsleistung bleiben extern qualifiziert. Keine \u00c4nderung der Pachtdauer, kein automatisch berechneter angemessener Pachtzins; weitere gerichtliche/vertragliche Wirkungen separat.")
 ergebnis
}
