genehmigung_aufforderungsfrist <- function(regelbereich = NULL, aufforderungszugang_am = NULL,
    massgebliches_fristende = NULL, prueftag = NULL, genehmigung_erklaert_am = NULL,
    gegenueber_aufforderndem = NULL, genehmigung_durch_berechtigten = NULL,
    aufforderung_wirksam = NULL, einordnungsnachweis = NULL) {
  .auswahl(regelbereich, "regelbereich", c("minderjaehrigenvertrag", "vertretung_ohne_vertretungsmacht"))
  zugang <- .datum(aufforderungszugang_am, "aufforderungszugang_am")
  ende <- .datum(massgebliches_fristende, "massgebliches_fristende")
  tag <- .datum(prueftag, "prueftag")
  genehmigung <- if (!is.null(genehmigung_erklaert_am)) .datum(genehmigung_erklaert_am, "genehmigung_erklaert_am") else NULL
  if (tag < zugang) .fehler("prueftag", "Pr\u00fcftag darf nicht vor Aufforderungszugang liegen.")
  if (!is.null(genehmigung) && (genehmigung < zugang || genehmigung > tag))
    .fehler("genehmigung_erklaert_am", "Hier gepr\u00fcfte Genehmigung muss zwischen Aufforderungszugang und Pr\u00fcftag liegen.")
  grundende <- .frist(aufforderungszugang_am, 2, "wochen", "ereignis")
  if (ende < grundende) .fehler("massgebliches_fristende", "Ma\u00dfgebliches Ende darf die gesetzliche Zweiwochenfrist nicht verk\u00fcrzen.")
  eingaben <- list(regelbereich = regelbereich, aufforderungszugang_am = aufforderungszugang_am,
    massgebliches_fristende = massgebliches_fristende, prueftag = prueftag,
    genehmigung_erklaert_am = genehmigung_erklaert_am, gegenueber_aufforderndem = gegenueber_aufforderndem,
    genehmigung_durch_berechtigten = genehmigung_durch_berechtigten,
    aufforderung_wirksam = aufforderung_wirksam, einordnungsnachweis = einordnungsnachweis)
  for (name in names(eingaben)[6:8]) .wahrheitswert(eingaben[[name]], name)
  .text(einordnungsnachweis, "einordnungsnachweis")
  wert <- NULL
  if (aufforderung_wirksam) {
    rechtzeitig <- !is.null(genehmigung) && genehmigung <= ende && gegenueber_aufforderndem && genehmigung_durch_berechtigten
    abgelaufen <- tag > ende
    wert <- list(rechnerisches_zweiwochenende = .iso(grundende), frist_abgelaufen = abgelaufen,
      genehmigung_rechtzeitig_erklaert = rechtzeitig, genehmigung_gilt_verweigert = abgelaufen && !rechtzeitig)
  }
  ergebnis <- .ergebnis(wert, "daten_und_wahrheitswerte", "BGB_GENEHMIGUNG_AUFFORDERUNGSFRIST", eingaben,
    list(list(operation = "Zweiwochenmindestfrist pr\u00fcfen; Genehmigung durch Berechtigten gegen\u00fcber aufforderndem Teil bis zum ma\u00dfgeblichen Fristende; sonst Verweigerungsfiktion nach Ablauf")), eingaben)
  ergebnis$status <- if (aufforderung_wirksam) "BERECHNET" else "NICHT_ANWENDBAR"
  ergebnis$annahmen <- list("Wirksame Aufforderung im konkreten gesetzlichen Genehmigungstatbestand und rechtlich ma\u00dfgebliches Fristende einschlie\u00dflich erforderlicher Kalenderkorrekturen vorgegeben.")
  ergebnis$hinweise <- list("Nur Frist-/Empf\u00e4ngerpr\u00fcfung der Genehmigung nach Aufforderung, keine vollst\u00e4ndige Vertragswirksamkeit. Vorher gegen\u00fcber Minderj\u00e4hrigem beziehungsweise Vertreter erkl\u00e4rte Genehmigung/Verweigerung wird durch qualifizierte Aufforderung unwirksam; solche vorherigen Erkl\u00e4rungen hier nicht als sp\u00e4tere Genehmigung eingeben. Bereits wirksam gegen\u00fcber dem anderen Vertragsteil erkl\u00e4rte Genehmigung nicht automatisch r\u00fcckg\u00e4ngig machen. Minderj\u00e4hriger nach Eintritt unbeschr\u00e4nkter Gesch\u00e4ftsf\u00e4higkeit nach\u00a7108 Absatz3 selbst genehmigungsberechtigt; Berechtigung rechtlich bestimmen. Tats\u00e4chliche fr\u00fchere Verweigerung, Widerruf und andere Unwirksamkeitsgr\u00fcnde separat. Erkl\u00e4rungstag muss rechtlich ma\u00dfgeblichen Zugang abbilden, nicht blo\u00df Versand; untert\u00e4gige Reihenfolge gesondert. Nach Ablauf fingierte Verweigerung wird durch versp\u00e4tete Genehmigung nicht automatisch geheilt.")
  ergebnis
}
