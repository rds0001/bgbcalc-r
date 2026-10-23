verjaehrung_besondere_grundfrist <- function(anspruchsart = NULL,
    anspruchsbeginn_am = NULL, titelereignis_am = NULL,
    kuenftig_wiederkehrende_leistung = NULL, abweichende_sonderregel = NULL,
    einordnungsnachweis = NULL) {
  .auswahl(anspruchsart, "anspruchsart", c("grundstuecksanspruch", "vorsaetzliche_personenverletzung",
    "herausgabeanspruch", "rechtskraeftig_festgestellt", "vollstreckbarer_vergleich_urkunde",
    "insolvenzfeststellung", "zwangsvollstreckungskosten"))
  beginn <- .datum(anspruchsbeginn_am, "anspruchsbeginn_am")
  titelarten <- c("rechtskraeftig_festgestellt", "vollstreckbarer_vergleich_urkunde",
    "insolvenzfeststellung", "zwangsvollstreckungskosten")
  titel <- NULL
  if (!is.null(titelereignis_am) || anspruchsart %in% titelarten) {
    titel <- .datum(titelereignis_am, "titelereignis_am")
  }
  .wahrheitswert(kuenftig_wiederkehrende_leistung, "kuenftig_wiederkehrende_leistung")
  .wahrheitswert(abweichende_sonderregel, "abweichende_sonderregel")
  .text(einordnungsnachweis, "einordnungsnachweis")
  regelmaessig <- anspruchsart %in% titelarten[1:3] && kuenftig_wiederkehrende_leistung
  wert <- NULL
  if (!abweichende_sonderregel && !regelmaessig) {
    if (anspruchsart %in% titelarten) beginn <- max(beginn, titel)
    jahre <- if (anspruchsart == "grundstuecksanspruch") 10 else 30
    wert <- list(fristdauer_jahre = jahre, fristbeginnereignis_am = .iso(beginn),
      rechnerischer_letzter_tag = .iso(.frist(.iso(beginn), jahre, "jahre", "ereignis")))
  }
  eingaben <- list(anspruchsart = anspruchsart, anspruchsbeginn_am = anspruchsbeginn_am,
    titelereignis_am = titelereignis_am, kuenftig_wiederkehrende_leistung = kuenftig_wiederkehrende_leistung,
    abweichende_sonderregel = abweichende_sonderregel, einordnungsnachweis = einordnungsnachweis)
  ergebnis <- .ergebnis(wert, "fristdaten", "BGB_VERJAEHRUNG_BESONDERE_GRUNDFRIST", eingaben,
    list(list(operation = "\u00a7196: zehn Jahre; \u00a7197: drei\u00dfig Jahre; \u00a7201: sp\u00e4terer Anspruchs-/Titelbeginn; Ausnahme \u00a7197 Absatz2")), eingaben)
  ergebnis$status <- if (!is.null(wert)) "BERECHNET" else "NICHT_ANWENDBAR"
  ergebnis$annahmen <- list("Anspruchsart und ma\u00dfgebliche Entstehung beziehungsweise Zuwiderhandlung bei Unterlassung rechtlich eingeordnet; feste lokale BGB-Fassung.")
  ergebnis$hinweise <- list("Nur Grundfrist; Hemmung, Ablaufhemmung, Neubeginn und gegebenenfalls \u00a7193 gesondert. Kein endg\u00fcltiger Verj\u00e4hrungstag.", "K\u00fcnftig f\u00e4llige wiederkehrende Leistungen nach \u00a7197 Absatz1 Nummer3 bis5 unterliegen der regelm\u00e4\u00dfigen Frist; NICHT_ANWENDBAR bedeutet keine Verj\u00e4hrungsfreiheit. Bereits f\u00e4llige R\u00fcckst\u00e4nde getrennt behandeln.")
  ergebnis
}
