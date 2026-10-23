dinglicher_vorkauf_preisabrechnung <- function(vereinbarter_kaufpreis = NULL, bereits_berichtigter_kaufpreis = NULL,
    anwendungsfall_qualifiziert = NULL, bewertungsnachweis = NULL) {
  preis <- .geld(vereinbarter_kaufpreis)
  berichtigt <- .geld(bereits_berichtigter_kaufpreis)
  if (.vergleichen(berichtigt, preis) > 0) .fehler("bereits_berichtigter_kaufpreis", "Berichtigter Kaufpreis darf vereinbarten Kaufpreis nicht \u00fcbersteigen.")
  .wahrheitswert(anwendungsfall_qualifiziert, "anwendungsfall_qualifiziert")
  .text(bewertungsnachweis, "bewertungsnachweis")
  rest <- .subtrahieren(preis, berichtigt)
  eingaben <- list(vereinbarter_kaufpreis = vereinbarter_kaufpreis, bereits_berichtigter_kaufpreis = bereits_berichtigter_kaufpreis,
    anwendungsfall_qualifiziert = anwendungsfall_qualifiziert, bewertungsnachweis = bewertungsnachweis)
  wert <- if (anwendungsfall_qualifiziert) list(erstattung_an_kaeufer = .bruchteile(berichtigt),
    verbleibender_vorkaufpreis_an_verpflichteten = .bruchteile(rest), befreiung_urspruenglicher_kaeufer = .bruchteile(rest)) else NULL
  ergebnis <- .ergebnis(wert, "EUR", "BGB_DINGLICHER_VORKAUF_PREISABRECHNUNG", eingaben,
    list(list(operation = "Bereits berichtigten Kaufpreis als Erstattung ausweisen; denselben Betrag vom Vorkaufpreis abziehen; urspr\u00fcnglichen K\u00e4ufer von unberichtigtem Rest befreien")), eingaben)
  ergebnis$status <- if (anwendungsfall_qualifiziert) "BERECHNET" else "NICHT_ANWENDBAR"
  ergebnis$annahmen <- list("Qualifizierter dinglicher Vorkaufsfall mit identischem ma\u00dfgeblichem Kaufpreis und Eigentumsverlust des urspr\u00fcnglichen K\u00e4ufers; feste lokale BGB-Fassung.")
  ergebnis$hinweise <- list("Nur miteinander korrespondierende Preisbetr\u00e4ge nach1100\u20131102. Neuer Eigent\u00fcmer ist K\u00e4ufer oder dessen Rechtsnachfolger, Erstattungsvoraussetzungen und Herausgabezug um Zug sind vorqualifiziert. Der urspr\u00fcngliche K\u00e4ufer wird nur vom noch nicht berichtigten Kaufpreis frei; bereits gezahlten Preis erh\u00e4lt er nach1100 vom Vorkaufsberechtigten, nicht nochmals nach1102 vom Verk\u00e4ufer. Unberichtigter Rest ist zugleich verbleibender Vorkaufpreis an den Verpflichteten. Abweichende Preisgrundlagen, \u00dcberzahlungen, Erf\u00fcllung mehrerer Preisforderungen und sonstige Anspr\u00fcche nicht vermischen; keine automatische Eigentums-/Grundbuchentscheidung.")
  ergebnis
}
