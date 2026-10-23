zugewinn_betrag <- function(anfangsvermoegen = NULL, endvermoegen = NULL, bewertungsnachweis = NULL) {
  anfang <- .zahleneingabe(anfangsvermoegen)
  ende <- .zahleneingabe(endvermoegen)
  .text(bewertungsnachweis, "bewertungsnachweis")
  differenz <- .subtrahieren(ende, anfang)
  wert <- if (differenz$zaehler < 0) .bruch(0) else differenz
  .geld_ergebnis(wert, "BGB_ZUGEWINN_BETRAG",
    list(anfangsvermoegen = anfangsvermoegen, endvermoegen = endvermoegen,
      bewertungsnachweis = bewertungsnachweis),
    list(list(operation = "Endverm\u00f6gen minus Anfangsverm\u00f6gen, mindestens null",
      vermoegensdifferenz = .bruchteile(differenz))))
}

zugewinnausgleich_grundbetrag <- function(zugewinn_ehegatte_a = NULL, zugewinn_ehegatte_b = NULL,
    nettovermoegen_ehegatte_a = NULL, nettovermoegen_ehegatte_b = NULL,
    hinzurechnung_ehegatte_a = NULL, hinzurechnung_ehegatte_b = NULL, bewertungsnachweis = NULL) {
  eingaben <- list(zugewinn_ehegatte_a = zugewinn_ehegatte_a, zugewinn_ehegatte_b = zugewinn_ehegatte_b,
    nettovermoegen_ehegatte_a = nettovermoegen_ehegatte_a, nettovermoegen_ehegatte_b = nettovermoegen_ehegatte_b,
    hinzurechnung_ehegatte_a = hinzurechnung_ehegatte_a, hinzurechnung_ehegatte_b = hinzurechnung_ehegatte_b,
    bewertungsnachweis = bewertungsnachweis)
  zugewinn_a <- .geld(zugewinn_ehegatte_a)
  zugewinn_b <- .geld(zugewinn_ehegatte_b)
  netto_a <- .zahleneingabe(nettovermoegen_ehegatte_a)
  netto_b <- .zahleneingabe(nettovermoegen_ehegatte_b)
  hinzu_a <- .geld(hinzurechnung_ehegatte_a)
  hinzu_b <- .geld(hinzurechnung_ehegatte_b)
  .text(bewertungsnachweis, "bewertungsnachweis")
  vergleich <- .vergleichen(zugewinn_a, zugewinn_b)
  if (vergleich == 0) {
    richtung <- "kein_ueberschuss"
    halb <- .bruch(0)
    grenze <- .bruch(0)
  } else {
    richtung <- if (vergleich > 0) "a_an_b" else "b_an_a"
    differenz <- if (vergleich > 0) .subtrahieren(zugewinn_a, zugewinn_b) else .subtrahieren(zugewinn_b, zugewinn_a)
    halb <- .multiplizieren(differenz, .bruch(1, 2))
    grenze <- if (vergleich > 0) .addieren(netto_a, hinzu_a) else .addieren(netto_b, hinzu_b)
    if (grenze$zaehler < 0) grenze <- .bruch(0)
  }
  grundbetrag <- if (.vergleichen(halb, grenze) < 0) halb else grenze
  ergebnis <- .geld_ergebnis(grundbetrag, "BGB_ZUGEWINNAUSGLEICH_GRUNDBETRAG", eingaben, list(
    list(operation = "Richtung und H\u00e4lfte des Zugewinn\u00fcberschusses bestimmen", richtung = richtung),
    list(operation = "Vorhandenes Nettoverm\u00f6gen plus Hinzurechnung des Verpflichteten als Grenze anwenden")))
  ergebnis$wert <- list(richtung = richtung, halber_ueberschuss = .bruchteile(halb),
    haftungsgrenze = .bruchteile(grenze), grundbetrag = .bruchteile(grundbetrag))
  ergebnis$hinweise <- c(ergebnis$hinweise, list(
    "Grundbetrag vor \u00a7 1380 und weiteren Anspruchsmodifikationen; kein abschlie\u00dfender durchsetzbarer Zahlbetrag."))
  ergebnis
}
