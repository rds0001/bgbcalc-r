besitzhaftung_verantwortungsgrenze <- function(schaden_nach_989 = NULL, verantwortungsbetrag_gegenueber_mittelbarem_besitzer = NULL, anwendungsfall_qualifiziert = NULL, bewertungsnachweis = NULL) {
  betrag_eins <- .geld(schaden_nach_989)
  betrag_zwei <- .geld(verantwortungsbetrag_gegenueber_mittelbarem_besitzer)
  .wahrheitswert(anwendungsfall_qualifiziert, "anwendungsfall_qualifiziert")
  .text(bewertungsnachweis, "bewertungsnachweis")
  eingaben <- list(schaden_nach_989 = schaden_nach_989, verantwortungsbetrag_gegenueber_mittelbarem_besitzer = verantwortungsbetrag_gegenueber_mittelbarem_besitzer, anwendungsfall_qualifiziert = anwendungsfall_qualifiziert, bewertungsnachweis = bewertungsnachweis)
  wert <- NULL
  if (anwendungsfall_qualifiziert) {
    wert <- if (.vergleichen(betrag_eins, betrag_zwei) <= 0) betrag_eins else betrag_zwei
  }
  ergebnis <- .geld_ergebnis(wert, "BGB_BESITZHAFTUNG_VERANTWORTUNGSGRENZE", eingaben, list(list(operation = "Schadensbetrag nach\u00a7989 auf Verantwortungsbetrag gegen\u00fcber dem mittelbaren Besitzer begrenzen.")))
  ergebnis$hinweise <- c(ergebnis$hinweise, list("Nur qualifizierter Fall\u00a7991 Absatz2 mit bei Besitzerwerb gutgl\u00e4ubigem Besitzer. Beide Betr\u00e4ge betreffen denselben Schaden; keine eigenst\u00e4ndige Haftungs-/Verschuldenspr\u00fcfung."))
  ergebnis
}

niessbrauch_uebermassfruechte_ersatz <- function(wert_der_uebermassfruechte = NULL, wert_der_beeintraechtigten_eigenen_nutzungen = NULL, anwendungsfall_qualifiziert = NULL, bewertungsnachweis = NULL) {
  betrag_eins <- .geld(wert_der_uebermassfruechte)
  betrag_zwei <- .geld(wert_der_beeintraechtigten_eigenen_nutzungen)
  .wahrheitswert(anwendungsfall_qualifiziert, "anwendungsfall_qualifiziert")
  .text(bewertungsnachweis, "bewertungsnachweis")
  eingaben <- list(wert_der_uebermassfruechte = wert_der_uebermassfruechte, wert_der_beeintraechtigten_eigenen_nutzungen = wert_der_beeintraechtigten_eigenen_nutzungen, anwendungsfall_qualifiziert = anwendungsfall_qualifiziert, bewertungsnachweis = bewertungsnachweis)
  wert <- NULL
  if (anwendungsfall_qualifiziert) {
    wert <- .subtrahieren(betrag_eins, betrag_zwei)
    if (wert$zaehler < 0) wert <- .bruch(0)
  }
  ergebnis <- .geld_ergebnis(wert, "BGB_NIESSBRAUCH_UEBERMASSFRUECHTE_ERSATZ", eingaben, list(list(operation = "Fruchtwert um Beeintr\u00e4chtigung der dem Nie\u00dfbraucher geb\u00fchrenden Nutzungen mindern, mindestens null.")))
  ergebnis$hinweise <- c(ergebnis$hinweise, list("Nur wenn Verwendung zur Wiederherstellung nicht verlangt wird. Eingaben rechtlich bewertete, kausal zusammengeh\u00f6rige Werte. Eigenst\u00e4ndige Verschuldenshaftung, Sicherheitsleistung und Wiederherstellungsalternative nicht eingerechnet."))
  ergebnis
}

niessbrauch_einloesungskapital <- function(tilgungskapital = NULL, einloesungspraemie = NULL, anwendungsfall_qualifiziert = NULL, bewertungsnachweis = NULL) {
  betrag_eins <- .geld(tilgungskapital)
  betrag_zwei <- .geld(einloesungspraemie)
  .wahrheitswert(anwendungsfall_qualifiziert, "anwendungsfall_qualifiziert")
  .text(bewertungsnachweis, "bewertungsnachweis")
  eingaben <- list(tilgungskapital = tilgungskapital, einloesungspraemie = einloesungspraemie, anwendungsfall_qualifiziert = anwendungsfall_qualifiziert, bewertungsnachweis = bewertungsnachweis)
  wert <- NULL
  if (anwendungsfall_qualifiziert) {
    wert <- .addieren(betrag_eins, betrag_zwei)
  }
  ergebnis <- .geld_ergebnis(wert, "BGB_NIESSBRAUCH_EINLOESUNGSKAPITAL", eingaben, list(list(operation = "Tilgungskapital und Einl\u00f6sungspr\u00e4mie zu Kapitalbetrag addieren.")))
  ergebnis$hinweise <- c(ergebnis$hinweise, list("Nur Einl\u00f6sung des vom Nie\u00dfbrauch betroffenen Papiers. Einl\u00f6sungspr\u00e4mie wird als Kapital, nicht Zinsertrag behandelt; separat f\u00e4llige Zinsen nicht als Pr\u00e4mie eingeben. Keine Bewertung oder automatische Auszahlung an den Nie\u00dfbraucher."))
  ergebnis
}

hypothek_schuldneruebergangsbetrag <- function(hypothekarisch_gesicherte_befriedigung = NULL, ersatzanspruch_gegen_eigentuemer = NULL, anwendungsfall_qualifiziert = NULL, bewertungsnachweis = NULL) {
  betrag_eins <- .geld(hypothekarisch_gesicherte_befriedigung)
  betrag_zwei <- .geld(ersatzanspruch_gegen_eigentuemer)
  .wahrheitswert(anwendungsfall_qualifiziert, "anwendungsfall_qualifiziert")
  .text(bewertungsnachweis, "bewertungsnachweis")
  eingaben <- list(hypothekarisch_gesicherte_befriedigung = hypothekarisch_gesicherte_befriedigung, ersatzanspruch_gegen_eigentuemer = ersatzanspruch_gegen_eigentuemer, anwendungsfall_qualifiziert = anwendungsfall_qualifiziert, bewertungsnachweis = bewertungsnachweis)
  wert <- NULL
  if (anwendungsfall_qualifiziert) {
    wert <- if (.vergleichen(betrag_eins, betrag_zwei) <= 0) betrag_eins else betrag_zwei
  }
  ergebnis <- .geld_ergebnis(wert, "BGB_HYPOTHEK_SCHULDNERUEBERGANGSBETRAG", eingaben, list(list(operation = "Gesicherten Befriedigungsbetrag auf rechtlich bestehenden Ersatzanspruch begrenzen.")))
  ergebnis$hinweise <- c(ergebnis$hinweise, list("Nur Umfang des \u00dcbergangs nach1164, nicht dingliche Rangverteilung. Befriedigung bezeichnet tats\u00e4chlich getilgten hypothekarisch gesicherten Betrag, keine ungesicherten Nebenforderungen. Vereinigung von Forderung und Schuld ist als entsprechender qualifizierter Betrag verwendbar. Konkurrierende Eigent\u00fcmerhypothek darf nicht zum Nachteil des Schuldners geltend gemacht werden; kein Verteilungsplan."))
  ergebnis
}

hypothek_schuldbefreiung_nach_regressverlust <- function(persoenliche_restschuld = NULL, verlorener_hypothekarischer_regress = NULL, anwendungsfall_qualifiziert = NULL, bewertungsnachweis = NULL) {
  betrag_eins <- .geld(persoenliche_restschuld)
  betrag_zwei <- .geld(verlorener_hypothekarischer_regress)
  .wahrheitswert(anwendungsfall_qualifiziert, "anwendungsfall_qualifiziert")
  .text(bewertungsnachweis, "bewertungsnachweis")
  eingaben <- list(persoenliche_restschuld = persoenliche_restschuld, verlorener_hypothekarischer_regress = verlorener_hypothekarischer_regress, anwendungsfall_qualifiziert = anwendungsfall_qualifiziert, bewertungsnachweis = bewertungsnachweis)
  wert <- NULL
  if (anwendungsfall_qualifiziert) {
    wert <- if (.vergleichen(betrag_eins, betrag_zwei) <= 0) betrag_eins else betrag_zwei
  }
  ergebnis <- .geld_ergebnis(wert, "BGB_HYPOTHEK_SCHULDBEFREIUNG_NACH_REGRESSVERLUST", eingaben, list(list(operation = "Pers\u00f6nliche Restschuld bis zur H\u00f6he des kausal verlorenen hypothekarischen Ersatzes freistellen.")))
  ergebnis$hinweise <- c(ergebnis$hinweise, list("Qualifizierter Verzicht, Aufhebung oder Vorrangeinr\u00e4umung durch Gl\u00e4ubiger. Verlorener Regress ist rechtlich bewerteter ohne Verf\u00fcgung erzielbarer1164-Ersatz, nicht pauschaler Grundst\u00fccks- oder Hypothekennennwert."))
  ergebnis
}

hypothek_ausfall_nach_benachrichtigungsschaden <- function(ausfallforderung = NULL, kausaler_benachrichtigungsschaden = NULL, anwendungsfall_qualifiziert = NULL, bewertungsnachweis = NULL) {
  betrag_eins <- .geld(ausfallforderung)
  betrag_zwei <- .geld(kausaler_benachrichtigungsschaden)
  .wahrheitswert(anwendungsfall_qualifiziert, "anwendungsfall_qualifiziert")
  .text(bewertungsnachweis, "bewertungsnachweis")
  eingaben <- list(ausfallforderung = ausfallforderung, kausaler_benachrichtigungsschaden = kausaler_benachrichtigungsschaden, anwendungsfall_qualifiziert = anwendungsfall_qualifiziert, bewertungsnachweis = bewertungsnachweis)
  wert <- NULL
  if (anwendungsfall_qualifiziert) {
    wert <- .subtrahieren(betrag_eins, betrag_zwei)
    if (wert$zaehler < 0) wert <- .bruch(0)
  }
  ergebnis <- .geld_ergebnis(wert, "BGB_HYPOTHEK_AUSFALL_NACH_BENACHRICHTIGUNGSSCHADEN", eingaben, list(list(operation = "Ausfallforderung um kausalen Schaden aus unterbliebener Benachrichtigung mindern, mindestens null.")))
  ergebnis$hinweise <- c(ergebnis$hinweise, list("Nur nach1166 qualifiziertes Verweigerungsrecht, insbesondere Ersatzberechtigung, vom Gl\u00e4ubiger betriebene Versteigerung und nicht untunliche Benachrichtigung. Ergebnis ist verbleibender nicht durch diesen Schaden abgedeckter Ausfall, kein Erl\u00f6schen oder automatische Rechtsaus\u00fcbung."))
  ergebnis
}

pfandrecht_einziehungsgrenze <- function(einziehbare_geldforderung = NULL, erforderlicher_befriedigungsbetrag = NULL, anwendungsfall_qualifiziert = NULL, bewertungsnachweis = NULL) {
  betrag_eins <- .geld(einziehbare_geldforderung)
  betrag_zwei <- .geld(erforderlicher_befriedigungsbetrag)
  .wahrheitswert(anwendungsfall_qualifiziert, "anwendungsfall_qualifiziert")
  .text(bewertungsnachweis, "bewertungsnachweis")
  eingaben <- list(einziehbare_geldforderung = einziehbare_geldforderung, erforderlicher_befriedigungsbetrag = erforderlicher_befriedigungsbetrag, anwendungsfall_qualifiziert = anwendungsfall_qualifiziert, bewertungsnachweis = bewertungsnachweis)
  wert <- NULL
  if (anwendungsfall_qualifiziert) {
    wert <- if (.vergleichen(betrag_eins, betrag_zwei) <= 0) betrag_eins else betrag_zwei
  }
  ergebnis <- .geld_ergebnis(wert, "BGB_PFANDRECHT_EINZIEHUNGSGRENZE", eingaben, list(list(operation = "Einziehbare Geldforderung auf erforderlichen Befriedigungsbetrag begrenzen.")))
  ergebnis$hinweise <- c(ergebnis$hinweise, list("Einziehungsberechtigung gem\u00e4\u00df1228Absatz2/1282 und Umfang der gepf\u00e4ndeten Geldforderung vorqualifiziert. Erforderlicher Befriedigungsbetrag enth\u00e4lt ausschlie\u00dflich gedeckte Anspr\u00fcche; keine eigenst\u00e4ndige Feststellung der F\u00e4lligkeit oder Erm\u00e4chtigung zu anderen Verf\u00fcgungen."))
  ergebnis
}

