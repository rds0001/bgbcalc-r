digitale_vertragsgrundfrist <- function(fristfall=NULL,ereignis_am=NULL,aenderung_am=NULL,einordnungsnachweis=NULL) {
 faelle <- list(
  minderung_erstattung=list(14,"tage","\u00a7327n Absatz4: Zugang der Minderungserkl\u00e4rung beim Unternehmer; H\u00f6chstfrist ersetzt nicht unverz\u00fcgliche Erstattung."),
  beendigung_erstattung=list(14,"tage","\u00a7327o Absatz4 mit\u00a7327n Absatz4: Zugang der Beendigungserkl\u00e4rung; H\u00f6chstfrist ersetzt nicht unverz\u00fcgliche Erstattung."),
  datentraeger_rueckforderung=list(14,"tage","\u00a7327o Absatz5: rechtlich wirksame Vertragsbeendigung; Frist f\u00fcr das R\u00fccksendeverlangen des Unternehmers, nicht R\u00fccksendefrist des Verbrauchers."),
  aenderung_beendigung=list(30,"tage","\u00a7327r Absatz3: Zugang der qualifizierten \u00c4nderungsinformation, bei sp\u00e4terer \u00c4nderung deren Zeitpunkt; AusnahmenAbsatz4/6 und Beeintr\u00e4chtigung gesondert."),
  regress_nichtbereitstellung=list(6,"monate","\u00a7327u Absatz2 Nummer1: Aus\u00fcbung des Verbraucherrechts nach\u00a7327c Absatz1 Satz1; nicht erst Erstattung oder sp\u00e4tere Beschwerde."),
  regress_nacherfuellung=list(6,"monate","\u00a7327u Absatz2 Nummer2: Erf\u00fcllung der Verbraucheranspr\u00fcche nach\u00a7327l Absatz1; keine automatische Hemmung oder Neubeginn."),
  beweislast_einmalbereitstellung=list(1,"jahre","\u00a7327k Absatz1: Bereitstellung an Verbraucher, auch im R\u00fcckgriff327u Absatz3; nur zeitliche Einjahresgrenze, keine Beweis-/Mangelentscheidung. DauerbereitstellungAbsatz2 gesondert."))
 .auswahl(fristfall,"fristfall",names(faelle))
 ausloeser <- .datum(ereignis_am,"ereignis_am")
 .text(einordnungsnachweis,"einordnungsnachweis")
 if(fristfall == "aenderung_beendigung") {
  aenderung <- .datum(aenderung_am,"aenderung_am")
  ausloeser <- max(ausloeser,aenderung)
 } else if(!is.null(aenderung_am)) .fehler("aenderung_am","\u00c4nderungstag ist ausschlie\u00dflich im \u00c4nderungsbeendigungsfall zul\u00e4ssig.")
 fall <- faelle[[fristfall]]
 ende <- .frist(.iso(ausloeser),fall[[1]],fall[[2]],"ereignis")
 eingaben <- list(fristfall=fristfall,ereignis_am=ereignis_am,aenderung_am=aenderung_am,einordnungsnachweis=einordnungsnachweis)
 ergebnis <- .ergebnis(list(massgeblicher_ausloesertag=.iso(ausloeser),rechnerisches_fristende=.iso(ende)),"daten","BGB_DIGITALE_VERTRAGSGRUNDFRIST",eingaben,list(list(operation="Gesetzliche Ereignisfrist nach digitalem Vertragsfall; beim \u00c4nderungsfall sp\u00e4teres Datum aus Information und \u00c4nderung w\u00e4hlen")),eingaben)
 ergebnis$annahmen <- list("Qualifizierter digitaler Vertrags-/Regressfall und rechtlich ma\u00dfgeblicher Ereignistag; feste lokale BGB-Fassung.")
 ergebnis$hinweise <- list("Nur rechnerische Grundfrist. Rechtliche Anspruchsvoraussetzungen und qualifizierte Ereignisse sowie Hemmung, Ablaufhemmung und Feiertagskorrekturen separat. Ende bezeichnet letzten eingeschlossenen Tag bis Tagesablauf, rechtzeitige Handlung am Endtag bleibt m\u00f6glich. Keine automatische Vertragsbeendigung, Mangelvermutung oder abschlie\u00dfende Verj\u00e4hrung.",fall[[3]])
 ergebnis
}
