gesellschaft_nachhaftung_fristsicherung <- function(nachhaftungsfrist_letzter_tag=NULL, faelligkeit_am=NULL, sicherungsereignisse=NULL, einordnungsnachweis=NULL) {
 ende <- .datum(nachhaftungsfrist_letzter_tag,'nachhaftungsfrist_letzter_tag');faellig <- .datum(faelligkeit_am,'faelligkeit_am');.text(einordnungsnachweis,'einordnungsnachweis');.vorhanden(sicherungsereignisse,'sicherungsereignisse')
 if(!is.list(sicherungsereignisse)||!is.null(names(sicherungsereignisse))||length(sicherungsereignisse)>1000) .fehler('sicherungsereignisse','Liste mit h\u00f6chstens1000Ereignissen erforderlich.')
 arten <- c('feststellung_197','gerichtliche_vollstreckung','behoerdliche_vollstreckung','vollstreckungsantrag','verwaltungsakt_oeffentlich_rechtlich','schriftliches_anerkenntnis');vollstreckung <- arten[2:4];ids <- character();wirksam <- list()
 for(e in sicherungsereignisse) {
  if(!is.list(e)||is.null(names(e))||length(e)!=4||!setequal(names(e),c('ereignis_id','art','datum','rueckwirkend_unwirksam_212'))) .fehler('sicherungsereignisse','Genau Kennung,Art,Datum und212-R\u00fcckwirkungsmerkmal erforderlich.')
  k <- .text(e$ereignis_id,'ereignis_id');.auswahl(e$art,'art',arten);tag <- .datum(e$datum,'datum');rueck <- .wahrheitswert(e$rueckwirkend_unwirksam_212,'rueckwirkend_unwirksam_212')
  if(k %in% ids) .fehler('ereignis_id','Kennung doppelt.')
  ids <- c(ids,k)
  if(rueck && !(e$art %in% vollstreckung)) .fehler('rueckwirkend_unwirksam_212','212II/III-R\u00fcckwirkung hier nur f\u00fcr Vollstreckung/Antrag.')
  if(!rueck && tag<=ende) wirksam[[length(wirksam)+1]] <- k
 }
 f <- faellig<=ende
 wert <- list(nachhaftungsfrist_letzter_tag=nachhaftungsfrist_letzter_tag,faelligkeit_innerhalb_frist=f,rechtzeitige_sicherungsereignis_ids=wirksam,zeitliche_kopplung_erfuellt=f && length(wirksam)>0)
 eingaben <- list(nachhaftungsfrist_letzter_tag=nachhaftungsfrist_letzter_tag, faelligkeit_am=faelligkeit_am, sicherungsereignisse=sicherungsereignisse, einordnungsnachweis=einordnungsnachweis)
 ergebnis <- .ergebnis(wert,"datum_und_wahrheitswerte","BGB_GESELLSCHAFT_NACHHAFTUNG_FRISTSICHERUNG",eingaben,list(list(operation="F\u00e4lligkeit und qualifizierte Sicherungszeitpunkte gegen unver\u00e4nderte korrigierte Nachhaftungsfrist vergleichen;212II/III-r\u00fcckwirkend unwirksame Vollstreckungsakte ausschlie\u00dfen.")),eingaben)
 ergebnis$hinweise <- list("728bI/II: F\u00e4lligkeit bis einschlie\u00dflich letztem Fristtag und mindestens ein rechtlich geeigneter rechtzeitiger Sicherungsakt; schriftliches Anerkenntnis ersetzt in qualifiziertem Umfang Feststellung. Vollstreckungsakte/Antr\u00e4ge mit rechtlich feststehender212II/III-R\u00fcckwirkung z\u00e4hlen nicht. Kein pauschaler212I-Neubeginn: der \u00fcbergebene korrigierte Nachhaftungsfristtag bleibt unver\u00e4ndert.212-R\u00fcckwirkung ist Rechtsbewertung, keine neue Fristdauer. Bei teilweise wirksamem Anerkenntnis oder nur teilweise gesicherter Forderung vorher sachlich in Forderungsteile trennen; kein volles Anerkenntnis vort\u00e4uschen. Gerichtliche/beh\u00f6rdliche Vollstreckung, Titel nach197Absatz1Nummer3\u20135und \u00f6ffentlich-rechtlicher Verwaltungsakt m\u00fcssen zum konkreten Anspruch passen. Funktion berechnet Zeitkopplung, keinen vollst\u00e4ndigen Haftungstatbestand. Untert\u00e4gige Grenzprobleme vorab qualifizieren.")
 ergebnis
}
