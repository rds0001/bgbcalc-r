gesellschaft_fuenfjahresgrundfrist <- function(fristfall=NULL, ausscheiden_oder_erloeschen_am=NULL, glaeubigerkenntnis_am=NULL, registereintragung_am=NULL, kuerzere_gesellschaftsfrist_letzter_tag=NULL, einordnungsnachweis=NULL) {
 .auswahl(fristfall,'fristfall',c('nachhaftung_728b','erloeschen_verjaehrung_739'))
 wirksam <- .datum(ausscheiden_oder_erloeschen_am,'ausscheiden_oder_erloeschen_am')
 .text(einordnungsnachweis,'einordnungsnachweis')
 anlaesse <- list()
 for(name in c('glaeubigerkenntnis_am','registereintragung_am')) {
  eingabe <- get(name)
  if(!is.null(eingabe)) {
   datum <- .datum(eingabe,name)
   if(datum<wirksam) .fehler(name,'Beginnanlass nicht vor rechtlich wirksamem Ausscheiden/Erl\u00f6schen eingeben.')
   anlaesse[[length(anlaesse)+1L]] <- datum
  }
 }
 if(length(anlaesse)==0L) .vorhanden(NULL,'glaeubigerkenntnis_am_oder_registereintragung_am')
 beginn <- anlaesse[[1L]]
 for(datum in anlaesse) if(datum<beginn) beginn <- datum
 grundende <- .frist(.iso(beginn),5,'jahre','ereignis')
 vergleich <- NULL
 if(!is.null(kuerzere_gesellschaftsfrist_letzter_tag)) {
  if(fristfall!='erloeschen_verjaehrung_739') .fehler('kuerzere_gesellschaftsfrist_letzter_tag','Zusatzvergleich nur739; bei728b ausdr\u00fccklich null.')
  vergleich <- .iso(min(grundende,.datum(kuerzere_gesellschaftsfrist_letzter_tag,'kuerzere_gesellschaftsfrist_letzter_tag')))
 }
 wert <- list(massgeblicher_beginnanlass_am=.iso(beginn),rechnerisches_fuenfjahresende=.iso(grundende),ende_im_qualifizierten_kuerzeren_grundfall=vergleich)
 eingaben <- list(fristfall=fristfall, ausscheiden_oder_erloeschen_am=ausscheiden_oder_erloeschen_am, glaeubigerkenntnis_am=glaeubigerkenntnis_am, registereintragung_am=registereintragung_am, kuerzere_gesellschaftsfrist_letzter_tag=kuerzere_gesellschaftsfrist_letzter_tag, einordnungsnachweis=einordnungsnachweis)
 ergebnis <- .ergebnis(wert,"daten","BGB_GESELLSCHAFT_FUENFJAHRESGRUNDFRIST",eingaben,list(list(operation="Fr\u00fchere qualifizierte Gl\u00e4ubigerkenntnis oder Registereintragung bestimmen und f\u00fcnfj\u00e4hrige Ereignisgrundfrist berechnen.")),eingaben)
 ergebnis$hinweise <- list("\u00a7728bI3 beziehungsweise739II: fr\u00fchester feststehender Beginnanlass aus Gl\u00e4ubigerkenntnis und Registereintragung, danach f\u00fcnf Kalenderjahre ohne Jahresendverschiebung. Ausscheiden oder Erl\u00f6schen allein ersetzt weder Kenntnis noch Eintragung. Vorherige blo\u00dfe Kenntnis einer Absicht beziehungsweise unzutreffender Registereintrag sind nicht qualifiziert. Nur ungest\u00f6rter Grundlauf:728b-Nachhaftung verlangt zus\u00e4tzlich rechtzeitig f\u00e4llige Altverbindlichkeit sowie Feststellung/Vollstreckung oder schriftliches Anerkenntnis; bei Schadensersatz muss Pflichtverletzung vor Ausscheiden liegen.728b-Verweise204/206/210/211/212II/III gesondert.739: Optionaler Minimumvergleich mit rechtlich bestimmtem Ende der k\u00fcrzeren Gesellschaftsanspruchsfrist ausschlie\u00dflich f\u00fcr den ungest\u00f6rten F\u00fcnfjahresgrundlauf. Ohne Eingabe bleibt Vergleich null. Bei Hemmung/Neubeginn739III zuvor beide Laufzeiten gesondert korrigieren; ein Vergleich mit unberichtigter Grundfrist w\u00e4re dann unzul\u00e4ssig; Ergebnis keinesfalls als abschlie\u00dfende Haftungs-/Verj\u00e4hrungsgrenze verwenden. Kein automatischer Haftungsausschluss.")
 ergebnis
}
