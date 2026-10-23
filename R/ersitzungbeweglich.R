ersitzung_bewegliche_sache <- function(eigenbesitzbeginn_am = NULL, qualifiziertes_fristende = NULL,
    prueftag = NULL, kenntnis_fremdeigentum_am = NULL, guter_glaube_bei_eigenbesitzbeginn = NULL,
    bewegliche_sache = NULL, besitzverlauf_qualifiziert = NULL, sonstige_erwerbsvoraussetzungen_erfuellt = NULL,
    einordnungsnachweis = NULL) {
  beginn <- .datum(eigenbesitzbeginn_am, "eigenbesitzbeginn_am")
  ende <- .datum(qualifiziertes_fristende, "qualifiziertes_fristende")
  tag <- .datum(prueftag, "prueftag")
  grundende <- .frist(eigenbesitzbeginn_am, 10, "jahre", "ereignis")
  if (ende < grundende) .fehler("qualifiziertes_fristende", "Qualifiziertes Ende darf die Zehnjahresgrundfrist nicht unterschreiten; Anrechnung fremder Besitzzeiten ist au\u00dferhalb dieses Modells.")
  if (tag < beginn) .fehler("prueftag", "Pr\u00fcftag darf nicht vor Eigenbesitzbeginn liegen.")
  kenntnis <- NULL
  if (!is.null(kenntnis_fremdeigentum_am)) {
    kenntnis <- .datum(kenntnis_fremdeigentum_am, "kenntnis_fremdeigentum_am")
    if (kenntnis < beginn || kenntnis > tag) .fehler("kenntnis_fremdeigentum_am", "Sp\u00e4tere Kenntnis muss zwischen Eigenbesitzbeginn und Pr\u00fcftag liegen; Kenntnis bei Beginn \u00fcber guten Glauben qualifizieren.")
  }
  eingaben <- list(eigenbesitzbeginn_am = eigenbesitzbeginn_am, qualifiziertes_fristende = qualifiziertes_fristende,
    prueftag = prueftag, kenntnis_fremdeigentum_am = kenntnis_fremdeigentum_am,
    guter_glaube_bei_eigenbesitzbeginn = guter_glaube_bei_eigenbesitzbeginn, bewegliche_sache = bewegliche_sache,
    besitzverlauf_qualifiziert = besitzverlauf_qualifiziert,
    sonstige_erwerbsvoraussetzungen_erfuellt = sonstige_erwerbsvoraussetzungen_erfuellt,
    einordnungsnachweis = einordnungsnachweis)
  for (name in c("guter_glaube_bei_eigenbesitzbeginn", "bewegliche_sache", "besitzverlauf_qualifiziert", "sonstige_erwerbsvoraussetzungen_erfuellt")) .wahrheitswert(eingaben[[name]], name)
  .text(einordnungsnachweis, "einordnungsnachweis")
  ausschluss <- !guter_glaube_bei_eigenbesitzbeginn || (!is.null(kenntnis) && kenntnis <= ende)
  abgelaufen <- tag >= ende
  wert <- NULL
  if (bewegliche_sache && besitzverlauf_qualifiziert) wert <- list(zehnjahresgrundfristende = .iso(grundende), ersitzungsfristende = .iso(ende),
    frist_am_prueftag_vollendet = abgelaufen, ausschluss_nach_937_absatz_2 = ausschluss,
    eigentum_durch_ersitzung_erworben = abgelaufen && !ausschluss && sonstige_erwerbsvoraussetzungen_erfuellt)
  ergebnis <- .ergebnis(wert, "daten_und_wahrheitswerte", "BGB_ERSITZUNG_BEWEGLICHE_SACHE", eingaben,
    list(list(operation = "Zehn Jahre ab qualifiziertem Eigenbesitzbeginn; qualifiziertes Ende und Pr\u00fcftag vergleichen; fehlender Anfangsglaube oder Kenntnis bis Ende schlie\u00dfen Erwerb aus")), eingaben)
  ergebnis$status <- if (bewegliche_sache && besitzverlauf_qualifiziert) "BERECHNET" else "NICHT_ANWENDBAR"
  ergebnis$annahmen <- list("Pr\u00fcfung zum Ende des Pr\u00fcftags; Eigenbesitzbeginn als Ereignis. Rechtlich anrechenbarer Besitzverlauf und korrigiertes Ende sind belegt, ohne Anrechnung fremder Besitzzeiten.")
  ergebnis$hinweise <- list("Grundfrist zehn Jahre nach\u00a7937, nicht selbst berechnete Hemmung/Unterbrechung. \u00a7\u00a7939\u2013942 einschlie\u00dflich relativer Hemmung und R\u00fcckerlangung nach\u00a7940 Absatz2 sind vorzupr\u00fcfen; physisch l\u00fcckenloser Besitz wird nicht pauschal gefordert. Nach wirksamer Unterbrechung nur zutreffenden Neubeginn verwenden. Anrechnung von Rechtsvorg\u00e4nger-/Erbschaftsbesitzerzeiten\u00a7\u00a7943/944 au\u00dferhalb dieses Modells. Qualifiziertes Ende einschlie\u00dflich einschl\u00e4giger Hemmung/Ablaufhemmung belegen; keine automatische Wochenendverschiebung. Besitzverlauf bis zum fr\u00fcheren von Pr\u00fcftag und qualifiziertem Ende rechtlich qualifizieren. Kenntnis NULL bedeutet bis Pr\u00fcftag nicht eingetreten, nicht unbekannt. Kenntnis am Endtag z\u00e4hlt vor Vollendung am Tagesende; danach erstmals erlangte Kenntnis nimmt bereits vollendeten Erwerb nicht zur\u00fcck. Bei fehlenden sonstigen Voraussetzungen entsteht auch ohne Kenntnisausschluss kein Erwerb. Keine Aussage \u00fcber sp\u00e4tere Eigentums\u00fcbertragungen oder Erl\u00f6schen von Drittrechten nach\u00a7945; gutgl\u00e4ubiger Erwerb nach\u00a7\u00a7932ff. ist eigenst\u00e4ndig.")
  ergebnis
}
