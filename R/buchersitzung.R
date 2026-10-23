buchersitzung_dreissigjahresfrist <- function(eintragung_am = NULL, besitzbeginn_am = NULL,
    beginnart = NULL, rechtsart = NULL, korrigiertes_fristende = NULL, prueftag = NULL,
    zusammenhaengender_zeitraum_qualifiziert = NULL, einordnungsnachweis = NULL) {
  eintragung <- .datum(eintragung_am, "eintragung_am")
  besitz <- .datum(besitzbeginn_am, "besitzbeginn_am")
  .auswahl(beginnart, "beginnart", c("ereignis", "tagesbeginn"))
  .auswahl(rechtsart, "rechtsart", c("eigentum", "anderes_besitzbezogenes_recht"))
  tag <- .datum(prueftag, "prueftag")
  if (eintragung > tag) .fehler("eintragung_am", "Eintragung darf nicht nach dem Pr\u00fcftag liegen.")
  if (besitz > tag) .fehler("besitzbeginn_am", "Besitzbeginn darf nicht nach dem Pr\u00fcftag liegen.")
  beginn <- max(eintragung, besitz)
  grundende <- .frist(.iso(beginn), 30, "jahre", beginnart)
  ende <- .datum(korrigiertes_fristende, "korrigiertes_fristende")
  if (ende < grundende) .fehler("korrigiertes_fristende", "Korrigiertes Ende darf die ungek\u00fcrzte Grundfrist dieses Zeitraums nicht unterschreiten.")
  .wahrheitswert(zusammenhaengender_zeitraum_qualifiziert, "zusammenhaengender_zeitraum_qualifiziert")
  .text(einordnungsnachweis, "einordnungsnachweis")
  eingaben <- list(eintragung_am = eintragung_am, besitzbeginn_am = besitzbeginn_am,
    beginnart = beginnart, rechtsart = rechtsart, korrigiertes_fristende = korrigiertes_fristende,
    prueftag = prueftag, zusammenhaengender_zeitraum_qualifiziert = zusammenhaengender_zeitraum_qualifiziert,
    einordnungsnachweis = einordnungsnachweis)
  wert <- list(gemeinsamer_beginn_am = .iso(beginn), dreissigjahresgrundfristende = .iso(grundende),
    massgebliches_fristende = .iso(ende), frist_am_prueftag_abgelaufen = tag >= ende)
  if (!zusammenhaengender_zeitraum_qualifiziert) wert <- NULL
  ergebnis <- .ergebnis(wert, "daten_und_wahrheitswerte", "BGB_BUCHERSITZUNG_DREISSIGJAHRESFRIST", eingaben,
    list(list(operation = "Sp\u00e4teren Eintragungs-/Besitzbeginn bestimmen; drei\u00dfig Jahre nach qualifizierter Beginnart; korrigiertes Ende am Tagesende vergleichen")), eingaben)
  if (!zusammenhaengender_zeitraum_qualifiziert) ergebnis$status <- "NICHT_ANWENDBAR"
  ergebnis$annahmen <- list("Fristpr\u00fcfung nach vollst\u00e4ndigem Ablauf des Pr\u00fcftags, nicht zu dessen Beginn. Feste lokale BGB-Fassung; zusammenh\u00e4ngender qualifizierter Zeitraum ohne anzurechnende Vorg\u00e4ngerzeiten.")
  ergebnis$hinweise <- list("Nur Fristberechnung, keine abschlie\u00dfende Feststellung eines Eigentums- oder Rechtserwerbs. Eintragung und Eigenbesitz m\u00fcssen gleichzeitig vorliegen; bei Absatz2 qualifizierter besitzbezogener Rechtszustand. Recht steht dem Eingetragenen urspr\u00fcnglich nicht zu. Beginnart bezieht sich auf das erstmalige gemeinsame Vorliegen: Ereignis im Tagesverlauf oder rechtlich ma\u00dfgeblicher Tagesbeginn. Widerspruch gegen die Eintragung hemmt gem\u00e4\u00df\u00a7900 Absatz1 Satz3; sonstige anwendbare Hemmungs-/Ablaufregeln m\u00fcssen im begr\u00fcndeten korrigierten Fristende enthalten sein. Bei ungekl\u00e4rtem oder nicht bestimmbaren Ende keine Berechnung mit einem erfundenen Datum. Unterbrechung, Neustart, Besitzvermutung und Zurechnung fremder Besitzzeiten werden nicht automatisch gepr\u00fcft; solche F\u00e4lle erst rechtlich auf einen zul\u00e4ssigen zusammenh\u00e4ngenden Zeitraum reduzieren. Kein Gutglaubenserfordernis aus\u00a7937 Absatz2 \u00fcbertragen. Rang anderer Rechte nach\u00a7900 Absatz2 Satz2 wird nicht berechnet. Keine automatische Wochenend-/Feiertagsverschiebung.")
  ergebnis
}
