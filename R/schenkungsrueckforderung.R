schenkungsauflage_rueckforderungsbetrag <- function(bereicherungsrechtlicher_geschenkwert = NULL,
    fuer_auflage_einzusetzender_geschenkwert = NULL, auflage_nicht_vollzogen = NULL,
    ruecktrittsvoraussetzungen_erfuellt = NULL, dritter_zur_vollziehung_berechtigt = NULL, pflicht_oder_anstandsschenkung = NULL,
    einordnungsnachweis = NULL) {
  geschenk <- .geld(bereicherungsrechtlicher_geschenkwert)
  auflage <- .geld(fuer_auflage_einzusetzender_geschenkwert)
  eingaben <- list(bereicherungsrechtlicher_geschenkwert = bereicherungsrechtlicher_geschenkwert,
    fuer_auflage_einzusetzender_geschenkwert = fuer_auflage_einzusetzender_geschenkwert,
    auflage_nicht_vollzogen = auflage_nicht_vollzogen,
    ruecktrittsvoraussetzungen_erfuellt = ruecktrittsvoraussetzungen_erfuellt,
    dritter_zur_vollziehung_berechtigt = dritter_zur_vollziehung_berechtigt,
    pflicht_oder_anstandsschenkung = pflicht_oder_anstandsschenkung, einordnungsnachweis = einordnungsnachweis)
  for (name in names(eingaben)[3:6]) .wahrheitswert(eingaben[[name]], name)
  .text(einordnungsnachweis, "einordnungsnachweis")
  gilt <- auflage_nicht_vollzogen && ruecktrittsvoraussetzungen_erfuellt &&
    !dritter_zur_vollziehung_berechtigt && !pflicht_oder_anstandsschenkung
  wert <- if (gilt) {if (.vergleichen(geschenk, auflage) < 0) geschenk else auflage} else NULL
  ergebnis <- .geld_ergebnis(wert, "BGB_SCHENKUNGSAUFLAGE_RUECKFORDERUNGSBETRAG", eingaben,
    list(list(operation = "Nichtvollziehung und R\u00fccktrittsvoraussetzungen ohne Drittrecht oder privilegierte Schenkung; geringeren Wert aus bereicherungsrechtlicher Herausgabe und Auflagenverwendungsanteil w\u00e4hlen")))
  ergebnis$hinweise <- c(ergebnis$hinweise, list("Geldm\u00e4\u00dfig rechtlich bewerteter R\u00fcckforderungsrahmen; keine automatische Umwandlung eines Anspruchs auf Sachherausgabe in Geld. Bereicherungsrechtliche Grenzen und Umfang des f\u00fcr die Auflage einzusetzenden Geschenks vorab bestimmen. Nicht beliebige Erf\u00fcllungskosten mit einzusetzendem Geschenkwert gleichsetzen. Rechtm\u00e4\u00dfige Verweigerung nach\u00a7526 und R\u00fccktrittsvoraussetzungen einschlie\u00dflich Fristsetzung separat ber\u00fccksichtigen. Anspruch eines Dritten auf Vollziehung schlie\u00dft diesen R\u00fcckforderungsweg aus. Kein automatisches R\u00fcckfordern des gesamten Geschenks wegen beliebiger Nichterf\u00fcllung."))
  ergebnis
}
schenkung_verarmungsrueckforderung_ausschluss <- function(geschenk_geleistet_am = NULL,
    beduerftigkeit_eingetreten_am = NULL, beduerftigkeit_vorsaetzlich_oder_grob_fahrlaessig = NULL,
    pflicht_oder_anstandsschenkung = NULL, einordnungsnachweis = NULL) {
  .datum(geschenk_geleistet_am, "geschenk_geleistet_am")
  beduerftigkeit <- .datum(beduerftigkeit_eingetreten_am, "beduerftigkeit_eingetreten_am")
  .wahrheitswert(beduerftigkeit_vorsaetzlich_oder_grob_fahrlaessig, "beduerftigkeit_vorsaetzlich_oder_grob_fahrlaessig")
  .wahrheitswert(pflicht_oder_anstandsschenkung, "pflicht_oder_anstandsschenkung")
  .text(einordnungsnachweis, "einordnungsnachweis")
  grenze <- .frist(geschenk_geleistet_am, 10, "jahre", "ereignis")
  zeitablauf <- beduerftigkeit > grenze
  eingaben <- list(geschenk_geleistet_am = geschenk_geleistet_am, beduerftigkeit_eingetreten_am = beduerftigkeit_eingetreten_am,
    beduerftigkeit_vorsaetzlich_oder_grob_fahrlaessig = beduerftigkeit_vorsaetzlich_oder_grob_fahrlaessig,
    pflicht_oder_anstandsschenkung = pflicht_oder_anstandsschenkung, einordnungsnachweis = einordnungsnachweis)
  wert <- list(zehnjahreszeitraum_ende = .iso(grenze), zehnjahresfrist_bei_beduerftigkeit_abgelaufen = zeitablauf,
    rueckforderung_nach_529_absatz_eins_oder_534_ausgeschlossen = zeitablauf ||
      beduerftigkeit_vorsaetzlich_oder_grob_fahrlaessig || pflicht_oder_anstandsschenkung)
  ergebnis <- .ergebnis(wert, "daten_und_wahrheitswerte", "BGB_SCHENKUNG_VERARMUNGSRUECKFORDERUNG_AUSSCHLUSS", eingaben,
    list(list(operation = "Zehnjahresablauf gerade bei Eintritt der Bed\u00fcrftigkeit, schwere Eigenverursachung und privilegierte Schenkung als alternative Ausschl\u00fcsse pr\u00fcfen")), eingaben)
  ergebnis$annahmen <- list("Konkrete Schenkung, rechtlich fristausl\u00f6sende Leistung und Eintritt der ma\u00dfgeblichen Bed\u00fcrftigkeit bestimmt; feste lokale BGB-Fassung.")
  ergebnis$hinweise <- list("Nicht Datum der Klage oder R\u00fcckforderung als Bed\u00fcrftigkeitseintritt einsetzen. Sp\u00e4tere Geltendmachung nach zehn Jahren begr\u00fcndet diesen Ausschluss nicht, wenn Bed\u00fcrftigkeit rechtzeitig eintrat. Taggenaues Modell: Ereignisfrist bis Ende des Jahrestags; untert\u00e4gige Grenzf\u00e4lle gesondert normalisieren. FALSE best\u00e4tigt keinen Anspruch:\u00a7528, bereicherungsrechtliche Grenzen, Beschenktenschutz\u00a7529 Absatz2, mehrere Beschenkte und sonstige Ausschl\u00fcsse bleiben gesondert. Ein vor Leistung liegender Bed\u00fcrftigkeitszeitpunkt l\u00f6st hier keinen Zehnjahresausschluss aus; ob\u00a7528 dann greift, wird nicht entschieden. Keine Gleichsetzung mit Pflichtteilserg\u00e4nzungsabschmelzung\u00a72325.")
  ergebnis
}
