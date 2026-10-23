fund_herausgabebetrag_nach_kosten <- function(herausgabefaehiger_bruttobetrag = NULL, abzugsfaehige_kosten = NULL, anwendungsfall_qualifiziert = NULL, bewertungsnachweis = NULL) {
  betrag_eins <- .geld(herausgabefaehiger_bruttobetrag)
  betrag_zwei <- .geld(abzugsfaehige_kosten)
  .wahrheitswert(anwendungsfall_qualifiziert, "anwendungsfall_qualifiziert")
  .text(bewertungsnachweis, "bewertungsnachweis")
  eingaben <- list(herausgabefaehiger_bruttobetrag = herausgabefaehiger_bruttobetrag, abzugsfaehige_kosten = abzugsfaehige_kosten, anwendungsfall_qualifiziert = anwendungsfall_qualifiziert, bewertungsnachweis = bewertungsnachweis)
  wert <- NULL
  if (anwendungsfall_qualifiziert) {
    wert <- .subtrahieren(betrag_eins, betrag_zwei)
    if (wert$zaehler < 0) wert <- .bruch(0)
  }
  ergebnis <- .geld_ergebnis(wert, "BGB_FUND_HERAUSGABEBETRAG_NACH_KOSTEN", eingaben, list(list(operation = "Qualifizierten herauszugebenden Fundbetrag um abzugsf\u00e4hige Kosten mindern, mindestens null.")))
  ergebnis$hinweise <- c(ergebnis$hinweise, list("Nur rechtlich qualifizierter Herausgabebetrag und zugeh\u00f6rige abzugsf\u00e4hige Kosten nach981Absatz3. Anspruchsperson, Erl\u00f6szuordnung und Fristablauf getrennt; \u00fcbersteigende Kosten ergeben hier keinen negativen Auszahlungsbetrag und keinen neu festgestellten Zahlungsanspruch."))
  ergebnis
}

abtrennung_abwendungsfehlbetrag <- function(bestandteilswert_nach_abtrennung = NULL, bereits_ersetzter_bestandteilswert = NULL, anwendungsfall_qualifiziert = NULL, bewertungsnachweis = NULL) {
  betrag_eins <- .geld(bestandteilswert_nach_abtrennung)
  betrag_zwei <- .geld(bereits_ersetzter_bestandteilswert)
  .wahrheitswert(anwendungsfall_qualifiziert, "anwendungsfall_qualifiziert")
  .text(bewertungsnachweis, "bewertungsnachweis")
  eingaben <- list(bestandteilswert_nach_abtrennung = bestandteilswert_nach_abtrennung, bereits_ersetzter_bestandteilswert = bereits_ersetzter_bestandteilswert, anwendungsfall_qualifiziert = anwendungsfall_qualifiziert, bewertungsnachweis = bewertungsnachweis)
  wert <- NULL
  if (anwendungsfall_qualifiziert) {
    wert <- .subtrahieren(betrag_eins, betrag_zwei)
    if (wert$zaehler < 0) wert <- .bruch(0)
  }
  ergebnis <- .geld_ergebnis(wert, "BGB_ABTRENNUNG_ABWENDUNGSFEHLBETRAG", eingaben, list(list(operation = "Wert des Bestandteils nach Abtrennung um bereits ersetzten Wert mindern, mindestens null.")))
  ergebnis$hinweise <- c(ergebnis$hinweise, list("Nur numerischer Fehlbetrag der Wertabwendung nach997Absatz2. Wert ist der rechtlich bewertete Nutzen des abgetrennten Bestandteils gerade f\u00fcr den Besitzer; tats\u00e4chlicher Ersatz, kein blo\u00df angebotenes Geld. Weitere Ausschl\u00fcsse wegen gew\u00f6hnlicher Erhaltung oder fehlendem Nutzen sowie258 bleiben separat; Ergebnis allein entscheidet kein Abtrennungsrecht."))
  ergebnis
}

