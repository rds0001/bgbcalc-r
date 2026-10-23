schuldverschreibung_vorlegungsfrist <- function(
    urkundenart = NULL, leistungszeit_am = NULL, leistungszeit_beginnart = NULL, prueftag = NULL,
    vorlegung_am = NULL, gerichtliche_geltendmachung_am = NULL,
    gesetzlicher_unveraenderter_fristenlauf = NULL, einordnungsnachweis = NULL) {
  .auswahl(urkundenart, "urkundenart", c("hauptschuldverschreibung", "zinsschein", "rentenschein", "gewinnanteilschein"))
  leistung <- .datum(leistungszeit_am, "leistungszeit_am")
  .auswahl(leistungszeit_beginnart, "leistungszeit_beginnart", c("ereignis", "tagesbeginn"))
  tag <- .datum(prueftag, "prueftag")
  if (tag < leistung) .fehler("prueftag", "Pr\u00fcftag darf nicht vor Eintritt der Leistungszeit liegen.")
  vorlegung <- if (!is.null(vorlegung_am)) .datum(vorlegung_am, "vorlegung_am") else NULL
  gerichtlich <- if (!is.null(gerichtliche_geltendmachung_am)) .datum(gerichtliche_geltendmachung_am, "gerichtliche_geltendmachung_am") else NULL
  ereignisse <- list(vorlegung_am = vorlegung, gerichtliche_geltendmachung_am = gerichtlich)
  for (name in names(ereignisse)) {
    datum <- ereignisse[[name]]
    if (!is.null(datum) && !(leistung <= datum && datum <= tag)) .fehler(name, "Qualifiziertes Wahrungsereignis muss zwischen Leistungszeit und Pr\u00fcftag liegen.")
  }
  .wahrheitswert(gesetzlicher_unveraenderter_fristenlauf, "gesetzlicher_unveraenderter_fristenlauf")
  .text(einordnungsnachweis, "einordnungsnachweis")
  if (urkundenart == "hauptschuldverschreibung") {
    vorlegungsende <- .frist(leistungszeit_am, 30, "jahre", leistungszeit_beginnart)
  } else {
    vorlegungsende <- .frist(paste0(substr(leistungszeit_am, 1, 4), "-12-31"), 4, "jahre", "ereignis")
  }
  gewahrt <- (!is.null(vorlegung) && vorlegung <= vorlegungsende) || (!is.null(gerichtlich) && gerichtlich <= vorlegungsende)
  verjaehrungsende <- if (gewahrt) .frist(.iso(vorlegungsende), 2, "jahre", "ereignis") else NULL
  eingaben <- list(urkundenart = urkundenart, leistungszeit_am = leistungszeit_am,
    leistungszeit_beginnart = leistungszeit_beginnart, prueftag = prueftag,
    vorlegung_am = vorlegung_am, gerichtliche_geltendmachung_am = gerichtliche_geltendmachung_am,
    gesetzlicher_unveraenderter_fristenlauf = gesetzlicher_unveraenderter_fristenlauf,
    einordnungsnachweis = einordnungsnachweis)
  wert <- if (!gesetzlicher_unveraenderter_fristenlauf) NULL else list(
    vorlegungsfristende = .iso(vorlegungsende), vorlegungsfrist_gewahrt = gewahrt,
    anspruch_nach_801_erloschen = !gewahrt && tag >= vorlegungsende,
    verjaehrungsgrundfristende = if (!is.null(verjaehrungsende)) .iso(verjaehrungsende) else NULL,
    verjaehrungsgrundfrist_abgelaufen = !is.null(verjaehrungsende) && tag >= verjaehrungsende)
  ergebnis <- .ergebnis(wert, "daten_und_wahrheitswerte", "BGB_SCHULDVERSCHREIBUNG_VORLEGUNGSFRIST", eingaben,
    list(list(operation = "Haupturkunde30 Jahre ab Leistungszeit; Scheine4 Jahre ab Jahresschluss; bei rechtzeitiger Vorlegung oder gerichtlicher Geltendmachung2 Jahre ab Vorlegungsfristende")), eingaben)
  ergebnis$status <- if (gesetzlicher_unveraenderter_fristenlauf) "BERECHNET" else "NICHT_ANWENDBAR"
  ergebnis$annahmen <- list("Gesetzlicher unver\u00e4nderter Fristenlauf, qualifizierte Urkundenart und Leistungszeit; Pr\u00fcfung zum Ende des Pr\u00fcftags; rechtzeitige Wahrung am Endtag wird vorrangig ber\u00fccksichtigt; feste lokale BGB-Fassung.")
  ergebnis$hinweise <- list("Nur Inhaberschuldverschreibungen und genannte Scheine nach\u00a7801. Bei Haupturkunde Beginnart rechtlich bestimmen: festgelegter Tagesbeginn wird mitgez\u00e4hlt, Ereignistag nicht; bei Scheinen zwingender Jahresschlussbeginn unabh\u00e4ngig von dieser Eingabe. Gerichtliche Geltendmachung muss Anspruch aus der Urkunde betreffen; blo\u00dfe Mahnung oder Verlustanzeige\u00a7804 gen\u00fcgt nicht. NULL bedeutet bis Pr\u00fcftag keine entsprechende Vorlegung/Geltendmachung, nicht unbekannt. Fr\u00fchere Handlungen vor Leistungszeit werden in diesem Modell nicht bewertet. Zwei Jahre beginnen nach Ende der Vorlegungsfrist, nicht nach tats\u00e4chlicher fr\u00fcher Vorlegung. Abweichende Dauer/Beginn in Urkunde\u00a7801 Absatz3, Zahlungssperre\u00a7802, sonstige Hemmung/Neubeginn und zul\u00e4ssige Kalenderkorrekturen f\u00fchren aus diesem unver\u00e4nderten Standardmodell heraus. Keine pauschale Feiertagsverl\u00e4ngerung. Verj\u00e4hrung bedeutet nicht Erl\u00f6schen; Einrede/Aus\u00fcbung und weitere Anspruchsvoraussetzungen gesondert pr\u00fcfen. Kein automatischer Anspruch aus Verlustanzeige\u00a7804 und keine automatische Verbindung von Hauptforderung und selbst\u00e4ndigen Zinsscheinen\u00a7803.")
  ergebnis
}
