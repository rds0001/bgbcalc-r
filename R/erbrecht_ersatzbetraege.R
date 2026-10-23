erbschaftsbesitzer_verwendungsrest <- function(ersatzfaehige_verwendungen=NULL,
    bereits_durch_bereicherungsanrechnung_gedeckt=NULL,anspruch_nach_2022_qualifiziert=NULL,
    bewertungsnachweis=NULL) {
  aufwand <- .geld(ersatzfaehige_verwendungen)
  gedeckt <- .geld(bereits_durch_bereicherungsanrechnung_gedeckt)
  if (.vergleichen(gedeckt,aufwand)>0) .fehler("bereits_durch_bereicherungsanrechnung_gedeckt","Bereits gedeckter Betrag darf die betrachteten Verwendungen nicht \u00fcbersteigen.")
  .wahrheitswert(anspruch_nach_2022_qualifiziert,"anspruch_nach_2022_qualifiziert")
  .text(bewertungsnachweis,"bewertungsnachweis")
  eingaben <- list(ersatzfaehige_verwendungen=ersatzfaehige_verwendungen,
    bereits_durch_bereicherungsanrechnung_gedeckt=bereits_durch_bereicherungsanrechnung_gedeckt,
    anspruch_nach_2022_qualifiziert=anspruch_nach_2022_qualifiziert,bewertungsnachweis=bewertungsnachweis)
  wert <- if (anspruch_nach_2022_qualifiziert) .bruchteile(.subtrahieren(aufwand,gedeckt)) else NULL
  ergebnis <- .ergebnis(wert,"EUR","BGB_ERBSCHAFTSBESITZER_VERWENDUNGSREST",eingaben,
    list(list(operation="Qualifizierte Verwendungen um den bereits durch Bereicherungsanrechnung gedeckten Teil vermindern")),eingaben)
  ergebnis$status <- if (!is.null(wert)) "BERECHNET" else "NICHT_ANWENDBAR"
  ergebnis$annahmen <- list("Feste lokale BGB-Fassung; derselbe rechtlich bestimmte Aufwand und dessen bereits gedeckter Teil, keine doppelte Ber\u00fccksichtigung.")
  ergebnis$hinweise <- list("\u00a72022 Absatz2 kann rechtlich qualifizierte Lasten-/Schuldentilgungsaufwendungen einschlie\u00dfen. Bereits gedeckt meint gerade Anrechnung auf die nach\u00a72021 herauszugebende Bereicherung, nicht beliebige Zahlungen ohne Bezug. Weitergehender Ersatz nach\u00a72022 Absatz3 und versch\u00e4rfte Haftung\u00a7\u00a72023\u20132025 sind separat zu pr\u00fcfen. Zur\u00fcckbehaltung sowie\u00a7\u00a71000\u20131003 und Durchsetzbarkeit nicht automatisch entschieden. Keine Bewertung von Verwendungen oder Bereicherung erfunden.")
  ergebnis
}
erbauflage_herausgabebegrenzung <- function(bereicherungsrechtlicher_zuwendungswert=NULL,
    zur_auflagenvollziehung_erforderlicher_zuwendungsanteil=NULL,
    herausgabevoraussetzungen_2196_erfuellt=NULL,bewertungsnachweis=NULL) {
  wert_zuwendung <- .geld(bereicherungsrechtlicher_zuwendungswert)
  zweckanteil <- .geld(zur_auflagenvollziehung_erforderlicher_zuwendungsanteil)
  .wahrheitswert(herausgabevoraussetzungen_2196_erfuellt,"herausgabevoraussetzungen_2196_erfuellt")
  .text(bewertungsnachweis,"bewertungsnachweis")
  eingaben <- list(bereicherungsrechtlicher_zuwendungswert=bereicherungsrechtlicher_zuwendungswert,
    zur_auflagenvollziehung_erforderlicher_zuwendungsanteil=zur_auflagenvollziehung_erforderlicher_zuwendungsanteil,
    herausgabevoraussetzungen_2196_erfuellt=herausgabevoraussetzungen_2196_erfuellt,bewertungsnachweis=bewertungsnachweis)
  wert <- if (herausgabevoraussetzungen_2196_erfuellt) .bruchteile(if (.vergleichen(wert_zuwendung,zweckanteil)<0) wert_zuwendung else zweckanteil) else NULL
  ergebnis <- .ergebnis(wert,"EUR","BGB_ERBAUFLAGE_HERAUSGABEBEGRENZUNG",eingaben,
    list(list(operation="Kleineren Betrag aus bereicherungsrechtlichem Zuwendungswert und auflagenzweckgebundenem Anteil bestimmen")),eingaben)
  ergebnis$status <- if (!is.null(wert)) "BERECHNET" else "NICHT_ANWENDBAR"
  ergebnis$annahmen <- list("Feste lokale BGB-Fassung; wertm\u00e4\u00dfige Begrenzung einer rechtlich qualifizierten Herausgabe, keine automatische Umwandlung von Sachherausgabe in Geldzahlung.")
  ergebnis$hinweise <- list("Qualifikation umfasst\u00a72196 Absatz1 schuldhaft unm\u00f6gliche Auflagenvollziehung oder Absatz2 rechtskr\u00e4ftige Vollziehungsverurteilung mit erfolglosen zul\u00e4ssigen Zwangsmitteln bei nicht durch Dritten vollziehbarer Auflage, sowie Berechtigung des vom Wegfall Beg\u00fcnstigten. Blo\u00dfe Nichtvollziehung gen\u00fcgt nicht. Zweckspezifischer Anteil ist der Teil der Zuwendung, der h\u00e4tte verwendet werden m\u00fcssen, keine frei erfundene Pauschale. Bereicherungsrechtliche Bewertung einschlie\u00dflich einschl\u00e4giger Einwendungen vorgeben. Kein automatischer Zahlungsanspruch, keine Frist-/Vollstreckungspr\u00fcfung.")
  ergebnis
}
