nachlass_spaetglaeubiger <- function(erbfall_am = NULL, geltendmachung_am = NULL,
    todeserklaerung_oder_todeszeitfeststellung = NULL, rechtskraft_am = NULL,
    erbenkenntnis_am = NULL, qualifizierte_anmeldung_im_aufgebot = NULL,
    glaeubiger_nach_1971_ausgenommen = NULL, einordnungsnachweis = NULL) {
  erbfall <- .datum(erbfall_am, "erbfall_am")
  geltendmachung <- .datum(geltendmachung_am, "geltendmachung_am")
  if (geltendmachung < erbfall) .fehler("geltendmachung_am", "Geltendmachung als Nachlassforderung darf nicht vor Erbfall liegen.")
  .wahrheitswert(todeserklaerung_oder_todeszeitfeststellung, "todeserklaerung_oder_todeszeitfeststellung")
  rechtskraft <- if (!is.null(rechtskraft_am)) .datum(rechtskraft_am, "rechtskraft_am") else NULL
  if (todeserklaerung_oder_todeszeitfeststellung && is.null(rechtskraft))
    .fehler("rechtskraft_am", "Rechtskraftdatum des qualifizierten Beschlusses erforderlich.", "EINGABE_FEHLT")
  if (!todeserklaerung_oder_todeszeitfeststellung && !is.null(rechtskraft))
    .fehler("rechtskraft_am", "Ohne qualifizierten Beschluss kein Rechtskraftdatum angeben.")
  beginn <- if (!is.null(rechtskraft)) max(erbfall, rechtskraft) else erbfall
  ende <- .frist(.iso(beginn), 5, "jahre", "ereignis")
  kenntnis <- if (!is.null(erbenkenntnis_am)) .datum(erbenkenntnis_am, "erbenkenntnis_am") else NULL
  if (!is.null(kenntnis) && kenntnis > geltendmachung)
    .fehler("erbenkenntnis_am", "Kenntnisdatum darf nicht nach dem betrachteten Geltendmachungsdatum liegen.")
  .wahrheitswert(qualifizierte_anmeldung_im_aufgebot, "qualifizierte_anmeldung_im_aufgebot")
  .wahrheitswert(glaeubiger_nach_1971_ausgenommen, "glaeubiger_nach_1971_ausgenommen")
  .text(einordnungsnachweis, "einordnungsnachweis")
  eingaben <- list(erbfall_am = erbfall_am, geltendmachung_am = geltendmachung_am,
    todeserklaerung_oder_todeszeitfeststellung = todeserklaerung_oder_todeszeitfeststellung,
    rechtskraft_am = rechtskraft_am, erbenkenntnis_am = erbenkenntnis_am,
    qualifizierte_anmeldung_im_aufgebot = qualifizierte_anmeldung_im_aufgebot,
    glaeubiger_nach_1971_ausgenommen = glaeubiger_nach_1971_ausgenommen,
    einordnungsnachweis = einordnungsnachweis)
  rechtzeitig_bekannt <- !is.null(kenntnis) && kenntnis <= ende
  spaet <- geltendmachung > ende
  wert <- list(fristbeginnereignis_am = .iso(beginn), fuenfjahresfristende = .iso(ende),
    geltendmachung_nach_fuenf_jahren = spaet, forderung_rechtzeitig_bekannt = rechtzeitig_bekannt,
    ausgeschlossenem_glaeubiger_gleichgestellt = spaet && !rechtzeitig_bekannt && !qualifizierte_anmeldung_im_aufgebot)
  if (glaeubiger_nach_1971_ausgenommen) wert <- NULL
  ergebnis <- .ergebnis(wert, "daten_und_wahrheitswerte", "BGB_NACHLASS_SPAETGLAEUBIGER", eingaben,
    list(list(operation = "F\u00fcnf Jahre ab sp\u00e4testem Start; strikt sp\u00e4tere Geltendmachung, rechtzeitige Erbenkenntnis und qualifizierte Anmeldung pr\u00fcfen")), eingaben)
  if (glaeubiger_nach_1971_ausgenommen) ergebnis$status <- "NICHT_ANWENDBAR"
  ergebnis$annahmen <- list("Taggenaue Pr\u00fcfung; Kenntnis am letzten Fristtag liegt vor dessen Ablauf. Feste lokale BGB-Fassung.")
  ergebnis$hinweise <- list("Nur Gleichstellung nach\u00a71974 Absatz1, kein Erl\u00f6schen oder Verj\u00e4hren der Forderung und keine automatische Einredeaus\u00fcbung. Absatz2-Rangfolgen und Rechtsfolgen\u00a71973 getrennt pr\u00fcfen. Erbenkenntnis NULL bedeutet bis Geltendmachung nicht bekannt, nicht ungekl\u00e4rte Kenntnis. Anmeldung muss als die Ausnahme des\u00a71974 Absatz1 tragende Anmeldung rechtlich einschlie\u00dflich zeitlicher Anforderungen qualifiziert sein; kein beliebiger Schriftsatz. \u00a71971-Ausnahme nur soweit der gesicherte Gegenstand betroffen ist, keine globale Befreiung ungesicherter Restforderungen. Rechtskraftdatum betrifft ausschlie\u00dflich Todeserkl\u00e4rung/Todeszeitfeststellung nach Verschollenheitsgesetz; keine andere Nachlassentscheidung. Keine automatische Hemmung oder Wochenend-/Feiertagsverschiebung.")
  ergebnis
}
