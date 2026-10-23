zugewinnausgleich_sachanrechnungsrest <- function(ausgleichsforderung=NULL,gerichtlicher_anrechnungsbetrag=NULL,anrechnungsnachweis=NULL) {
  forderung <- .geld(ausgleichsforderung);sachbetrag <- .geld(gerichtlicher_anrechnungsbetrag)
  .text(anrechnungsnachweis,"anrechnungsnachweis")
  eingaben <- list(ausgleichsforderung=ausgleichsforderung,gerichtlicher_anrechnungsbetrag=gerichtlicher_anrechnungsbetrag,anrechnungsnachweis=anrechnungsnachweis)
  rest <- .subtrahieren(forderung,sachbetrag);if (.vergleichen(rest,.bruch(0))<0) rest <- .bruch(0)
  ergebnis <- .ergebnis(.bruchteile(rest),"EUR","BGB_ZUGEWINNAUSGLEICH_SACHANRECHNUNGSREST",eingaben,list(list(operation="Gerichtlich festgesetzten und rechtlich wirksam anzurechnenden Sachbetrag von Ausgleichsforderung abziehen; Rest mindestens null.")),eingaben)
  ergebnis$hinweise <- list("Nur\u00a71383I-Anrechnungsrechnung: Ausgleichsforderung bereits bestimmt, Anrechnungsbetrag gerichtlich festgesetzt und seine tats\u00e4chliche Anrechnungsvoraussetzung qualifiziert. Keinen Marktwert anstelle des festgesetzten Betrags einsetzen. Ob Anordnung/\u00dcbertragung/Erf\u00fcllung wirksam ist und wann anzurechnen ist, nicht automatisch entschieden. \u00dcbersteigt Anrechnungsbetrag die betrachtete Forderung, Rest0; kein automatisch festgestellter \u00dcberschuss-/R\u00fcckzahlungsanspruch. Keine erneute Zugewinn-, Sachwert- oder Billigkeitsbewertung.")
  ergebnis
}
minderjaehrigen_unterhaltsfehlbetrag <- function(unterhaltsbedarf=NULL,anrechenbare_vermoegenseinkuenfte=NULL,anrechenbarer_arbeitsertrag=NULL,bewertungsnachweis=NULL) {
  bedarf <- .geld(unterhaltsbedarf);vermoegensertrag <- .geld(anrechenbare_vermoegenseinkuenfte);arbeit <- .geld(anrechenbarer_arbeitsertrag)
  .text(bewertungsnachweis,"bewertungsnachweis")
  deckung <- .addieren(vermoegensertrag,arbeit)
  eingaben <- list(unterhaltsbedarf=unterhaltsbedarf,anrechenbare_vermoegenseinkuenfte=anrechenbare_vermoegenseinkuenfte,anrechenbarer_arbeitsertrag=anrechenbarer_arbeitsertrag,bewertungsnachweis=bewertungsnachweis)
  rest <- .subtrahieren(bedarf,deckung);if (.vergleichen(rest,.bruch(0))<0) rest <- .bruch(0)
  ergebnis <- .ergebnis(.bruchteile(rest),"EUR","BGB_MINDERJAEHRIGEN_UNTERHALTSFEHLBETRAG",eingaben,list(list(operation="Qualifizierte anrechenbare Verm\u00f6genseink\u00fcnfte und Arbeitsertr\u00e4ge addieren, vom Unterhaltsbedarf abziehen, Fehlbetrag mindestens null.")),eingaben)
  ergebnis$hinweise <- list("\u00a71602II im Verh\u00e4ltnis des minderj\u00e4hrigen Kindes zu seinen Eltern. Bed\u00fcrftigkeitsrest, kein abschlie\u00dfender Zahlungsanspruch gegen einzelne Elternteile. Kindesalter, Bedarf, Anrechenbarkeit und identischer Zeitraum rechtlich qualifiziert; Eink\u00fcnfte nicht ungepr\u00fcft brutto einsetzen. Verm\u00f6gensstamm wird nicht verbraucht und ist keine Eingabe. Rang, Leistungsf\u00e4higkeit, Kindergeldbehandlung, weitere Deckungsmittel, Naturalunterhalt und Elternverteilung gesondert und ohne Doppelanrechnung. Nicht ungepr\u00fcft auf vollj\u00e4hrige Kinder \u00fcbertragen.")
  ergebnis
}
betreuer_staatskassen_anspruchsuebergang <- function(bestehender_betreueranspruch=NULL,staatskassenbefriedigung=NULL,zuordnungsnachweis=NULL) {
  anspruch <- .geld(bestehender_betreueranspruch);zahlung <- .geld(staatskassenbefriedigung)
  .text(zuordnungsnachweis,"zuordnungsnachweis")
  uebergang <- if (.vergleichen(anspruch,zahlung)<=0) anspruch else zahlung
  eingaben <- list(bestehender_betreueranspruch=bestehender_betreueranspruch,staatskassenbefriedigung=staatskassenbefriedigung,zuordnungsnachweis=zuordnungsnachweis)
  ergebnis <- .ergebnis(list(uebergegangener_anspruch=.bruchteile(uebergang),verbleibender_betreueranspruch=.bruchteile(.subtrahieren(anspruch,uebergang))),"EUR","BGB_BETREUER_STAATSKASSEN_ANSPRUCHSUEBERGANG",eingaben,list(list(operation="Bestehenden Betreueranspruch h\u00f6chstens im Umfang zugeordneter Staatskassenbefriedigung \u00fcbergehen lassen; verbleibenden Anspruch ausweisen.")),eingaben)
  ergebnis$hinweise <- list("\u00a71881Satz1, ein rechtlich abgegrenzter bestehender Anspruch des Betreuers gegen den Betreuten unmittelbar vor der betrachteten Befriedigung. Zugeordnete Zahlung der Staatskasse f\u00fcr denselben Anspruch; fr\u00fchere Zahlungen/\u00dcberg\u00e4nge nicht nochmals einrechnen. \u00dcberschie\u00dfende Zahlung erzeugt keinen zus\u00e4tzlichen Anspruch gegen den Betreuten und keinen automatisch festgestellten R\u00fcckzahlungsanspruch. Entstehung/H\u00f6he des Betreueranspruchs und Mittellosigkeit nicht gepr\u00fcft. Die Erbenhaftung nachSatz2 wird in dieser Funktion nicht berechnet. Der separate Baustein betreuer_erbenhaftungsbetrag berechnet den BGB-Nachlasswertdeckel; externe102III/IV-SGB-XII-Ausnahmen bleiben ausdr\u00fccklich rechtlich vorzuqualifizieren.")
  ergebnis
}
