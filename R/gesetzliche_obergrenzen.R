verjaehrung_vereinbarungsobergrenze <- function(gesetzlicher_verjaehrungsbeginn = NULL, vereinbartes_fristende = NULL, beginnart = NULL, einordnungsnachweis = NULL) {
  beginn <- .datum(gesetzlicher_verjaehrungsbeginn, "gesetzlicher_verjaehrungsbeginn")
  ende <- .datum(vereinbartes_fristende, "vereinbartes_fristende")
  .auswahl(beginnart, "beginnart", c("ereignis", "tagesbeginn"))
  .text(einordnungsnachweis, "einordnungsnachweis")
  if (ende < beginn) .fehler("vereinbartes_fristende", "Vereinbartes Ende darf nicht vor dem angegebenen gesetzlichen Beginn liegen.")
  grenze <- .frist(gesetzlicher_verjaehrungsbeginn, 30, "jahre", beginnart)
  eingaben <- list(gesetzlicher_verjaehrungsbeginn = gesetzlicher_verjaehrungsbeginn,
    vereinbartes_fristende = vereinbartes_fristende, beginnart = beginnart, einordnungsnachweis = einordnungsnachweis)
  ergebnis <- .ergebnis(list(dreissigjahres_vereinbarungsgrenze = .iso(grenze), vereinbartes_ende_innerhalb_grenze = ende <= grenze),
    "daten_und_wahrheitswerte", "BGB_VERJAEHRUNG_VEREINBARUNGSOBERGRENZE", eingaben,
    list(list(operation = "Gesetzlicher Verj\u00e4hrungsbeginn plus30 Jahre mit qualifizierter Beginnart; vereinbartes Ende darf Grenze nicht \u00fcberschreiten")), eingaben)
  ergebnis$annahmen <- list("Gesetzlicher Beginn und Beginnart sowie vereinbartes Ende rechtlich qualifiziert; feste lokale BGB-Fassung.")
  ergebnis$hinweise <- list("Nur quantitative Vereinbarungsgrenze\u00a7202 Absatz2, keine Aussage zur gesamten Wirksamkeit. Ausgangspunkt ist gesetzlicher Verj\u00e4hrungsbeginn, nicht Vertragsabschluss oder frei gew\u00e4hlter sp\u00e4terer Beginn. Bei Jahresschlussbeginn Schlussdatum mit Ereignisbeginn verwenden. Vorsatzhaftung darf nach Absatz1 nicht im Voraus erleichtert werden; das und andere zwingende Verbote gesondert pr\u00fcfen. Zu langes vereinbartes Ende wird nicht automatisch gek\u00fcrzt oder geheilt. Hemmung/Ablaufhemmung/Neubeginn und tats\u00e4chlicher Ablauf nicht aus dieser Vereinbarungspr\u00fcfung ableiten; keine allgemeine absolute30-Jahresgrenze aller Anspr\u00fcche behaupten.")
  ergebnis
}
hypothek_zinserweiterungsrahmen <- function(bisheriger_zinssatz = NULL, vorgesehener_zinssatz = NULL, einordnungsnachweis = NULL) {
  bisher <- .geld(bisheriger_zinssatz)
  neu <- .geld(vorgesehener_zinssatz)
  .text(einordnungsnachweis, "einordnungsnachweis")
  fuenf <- .bruch(5)
  spielraum <- if (.vergleichen(bisher, fuenf) < 0) .subtrahieren(fuenf, bisher) else .bruch(0)
  eingaben <- list(bisheriger_zinssatz = bisheriger_zinssatz, vorgesehener_zinssatz = vorgesehener_zinssatz, einordnungsnachweis = einordnungsnachweis)
  ergebnis <- .ergebnis(list(erweiterungsspielraum_prozentpunkte = .bruchteile(spielraum),
    zinssatz_wird_erhoeht = .vergleichen(neu, bisher) > 0,
    erhoehung_innerhalb_fuenfprozentrahmen = .vergleichen(bisher, neu) < 0 && .vergleichen(neu, fuenf) <= 0),
    "prozentpunkte_und_wahrheitswerte", "BGB_HYPOTHEK_ZINSERWEITERUNGSRAHMEN", eingaben,
    list(list(operation = "Rest bis f\u00fcnf Prozent=max(5 minus bisheriger Zinssatz,0); tats\u00e4chliche Erh\u00f6hung muss \u00fcber bisherigem Satz und h\u00f6chstens bei f\u00fcnf Prozent liegen")), eingaben)
  ergebnis$annahmen <- list("Hypothekarisch gesicherte Forderung und konkrete Zinss\u00e4tze rechtlich qualifiziert; Prozentwerte als Zahlen, etwa5 f\u00fcr5Prozent; feste lokale BGB-Fassung.")
  ergebnis$hinweise <- list("Nur numerischer Rahmen\u00a71119 Absatz1 f\u00fcr Erh\u00f6hung ohne Zustimmung gleich-/nachrangiger Berechtigter, keine vollst\u00e4ndige \u00c4nderungswirksamkeit. Bisher unverzinslich als0 eingeben. Genau5Prozent ist Obergrenze, bei bisher5odermehr kein Spielraum f\u00fcr weitere Erh\u00f6hung aus dieser Norm. Unver\u00e4nderter oder gesenkter Zinssatz ist keine hier gepr\u00fcfte Erh\u00f6hung. Zinssatz\u00e4nderung der Forderung, Einigung/Eintragung und sonstige Voraussetzungen separat. Kein gesetzlicher Zinssatzwechsel auf5Prozent und keine automatische Betrags- oder Zinseszinsberechnung.")
  ergebnis
}
