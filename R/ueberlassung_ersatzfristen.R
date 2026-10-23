ueberlassung_ersatzverjaehrungsgrundfrist <- function(anspruchsfall=NULL,ereignis_am=NULL,rueckgabeanspruch_fristende=NULL,einordnungsnachweis=NULL) {
 faelle <- list(
  miete_vermieter=list(TRUE,"\u00a7548 Absatz1: tats\u00e4chlicher rechtlich ma\u00dfgeblicher R\u00fcckerhalt der Mietsache; Ersatz wegen Ver\u00e4nderung/Verschlechterung."),
  miete_mieter=list(FALSE,"\u00a7548 Absatz2: Beendigung des Mietverh\u00e4ltnisses; Verwendungsersatz/Wegnahmegestattung."),
  landpacht_verpaechter=list(TRUE,"\u00a7591b: rechtlich ma\u00dfgeblicher R\u00fcckerhalt der Pachtsache; Ersatz wegen Ver\u00e4nderung/Verschlechterung."),
  landpacht_paechter=list(FALSE,"\u00a7591b: Beendigung des Landpachtverh\u00e4ltnisses; Verwendungsersatz/Wegnahmegestattung."),
  leihe_verleiher=list(TRUE,"\u00a7606 mit\u00a7548: rechtlich ma\u00dfgeblicher R\u00fcckerhalt der Leihsache; Ersatz wegen Ver\u00e4nderung/Verschlechterung."),
  leihe_entleiher=list(FALSE,"\u00a7606 mit\u00a7548: Beendigung der Leihe; Verwendungsersatz/Wegnahmegestattung."),
  niessbrauch_eigentuemer=list(TRUE,"\u00a71057 mit\u00a7548: rechtlich ma\u00dfgeblicher R\u00fcckerhalt der Sache; Eigent\u00fcmerersatz wegen Ver\u00e4nderung/Verschlechterung."),
  niessbrauch_berechtigter=list(FALSE,"\u00a71057 mit\u00a7548: rechtlich ma\u00dfgebliche Beendigung des Nie\u00dfbrauchs; Verwendungsersatz/Wegnahmegestattung."),
  pfand_verpfaender=list(TRUE,"\u00a71226 mit\u00a7548: rechtlich ma\u00dfgeblicher R\u00fcckerhalt des Pfandes; Verpf\u00e4nderersatz wegen Ver\u00e4nderung/Verschlechterung."),
  pfand_pfandglaeubiger=list(FALSE,"\u00a71226 mit\u00a7548: rechtlich ma\u00dfgebliche Beendigung des Pfandrechtsverh\u00e4ltnisses; Verwendungsersatz/Wegnahmegestattung."))
 .auswahl(anspruchsfall,"anspruchsfall",names(faelle))
 .datum(ereignis_am,"ereignis_am")
 .text(einordnungsnachweis,"einordnungsnachweis")
 fall <- faelle[[anspruchsfall]]
 gekoppelt <- fall[[1]]
 rueckgabegrenze <- NULL
 if(!is.null(rueckgabeanspruch_fristende)) {
  rueckgabegrenze <- .datum(rueckgabeanspruch_fristende,"rueckgabeanspruch_fristende")
  if(!gekoppelt) .fehler("rueckgabeanspruch_fristende","R\u00fcckgabeanspruchsgrenze ist nur bei \u00dcberlasser-/Eigent\u00fcmerersatzanspr\u00fcchen zul\u00e4ssig.")
 }
 grundende <- .frist(ereignis_am,6,"monate","ereignis")
 kopplungsende <- if(!is.null(rueckgabegrenze)) .iso(min(grundende,rueckgabegrenze)) else NULL
 eingaben <- list(anspruchsfall=anspruchsfall,ereignis_am=ereignis_am,rueckgabeanspruch_fristende=rueckgabeanspruch_fristende,einordnungsnachweis=einordnungsnachweis)
 ergebnis <- .ergebnis(list(sechsmonatiges_grundfristende=.iso(grundende),rueckgabeanspruchskopplung_erforderlich=gekoppelt,mit_rueckgabeanspruch_begrenztes_grundfristende=kopplungsende),"daten_und_wahrheitswert","BGB_UEBERLASSUNG_ERSATZVERJAEHRUNGSGRUNDFRIST",eingaben,list(list(operation="Sechs Monate ab qualifiziertem R\u00fcckerhalt oder Verh\u00e4ltnisende; auf \u00dcberlasserseite zus\u00e4tzlich fr\u00fchere vorgegebene R\u00fcckgabeanspruchsgrenze ber\u00fccksichtigen")),eingaben)
 ergebnis$annahmen <- list("Anspruchsart, R\u00fcckerhalt oder rechtliches Verh\u00e4ltnisende und gegebenenfalls R\u00fcckgabeanspruchsablauf ausdr\u00fccklich qualifiziert; feste lokale BGB-Fassung.")
 ergebnis$hinweise <- list("Grundfrist vor eigener Hemmung/Ablaufhemmung/Neubeginn/Feiertagskorrektur. Auf \u00dcberlasser-/Eigent\u00fcmerseite verj\u00e4hren Ersatzanspr\u00fcche sp\u00e4testens mit dem R\u00fcckgabeanspruch: Ohne dessen gesondert bestimmten Fristablauf bleibt die gekoppelte Grenze ausdr\u00fccklich unbekannt (null). Eine vorgegebene Grenze ist ein qualifiziertes Datum, keine hier berechnete Verj\u00e4hrung des R\u00fcckgabeanspruchs. Keine automatische sechsmonatige Verj\u00e4hrung des R\u00fcckgabeanspruchs selbst. Bei Nutzeranspr\u00fcchen keine solche Kopplung.",fall[[2]])
 ergebnis
}
