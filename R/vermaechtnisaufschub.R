vermaechtnis_dreissigjahresgrenze <- function(erbfall_am = NULL, aufschubgrund = NULL,
    massgebliches_ereignis_am = NULL, prueftag = NULL, bestimmtes_personenereignis_angeordnet = NULL,
    ereignisperson_lebt_beim_erbfall = NULL, ereignisperson_juristische_person = NULL,
    geschwistervermaechtnis_nach_2163 = NULL, einordnungsnachweis = NULL) {
  erbfall <- .datum(erbfall_am, "erbfall_am")
  grund <- .text(aufschubgrund, "aufschubgrund")
  if (!grund %in% c("bedingung", "anfangstermin", "zeugung", "persoenlichkeitsbestimmung"))
    .fehler("aufschubgrund", "Bedingung, Anfangstermin, Zeugung oder Pers\u00f6nlichkeitsbestimmung als gesetzlich qualifizierten Aufschubgrund w\u00e4hlen.")
  tag <- .datum(prueftag, "prueftag")
  if (tag < erbfall) .fehler("prueftag", "Pr\u00fcftag darf nicht vor Erbfall liegen.")
  ende <- .frist(erbfall_am, 30, "jahre", "ereignis")
  ereignis <- NULL
  if (!is.null(massgebliches_ereignis_am)) {
    ereignis <- .datum(massgebliches_ereignis_am, "massgebliches_ereignis_am")
    if (ereignis > tag) .fehler("massgebliches_ereignis_am", "Nur bis Pr\u00fcftag tats\u00e4chlich eingetretenes Ereignis vorgeben; k\u00fcnftiger Termin als noch nicht eingetreten behandeln.")
    if (grund %in% c("zeugung", "persoenlichkeitsbestimmung") && ereignis < erbfall)
      .fehler("massgebliches_ereignis_am", "Bei\u00a72162 Absatz2 muss das ma\u00dfgebliche Ereignis nach dem Erbfall liegen; am selben Kalendertag tats\u00e4chliche Reihenfolge belegen.")
  }
  eingaben <- list(erbfall_am = erbfall_am, aufschubgrund = aufschubgrund,
    massgebliches_ereignis_am = massgebliches_ereignis_am, prueftag = prueftag,
    bestimmtes_personenereignis_angeordnet = bestimmtes_personenereignis_angeordnet,
    ereignisperson_lebt_beim_erbfall = ereignisperson_lebt_beim_erbfall,
    ereignisperson_juristische_person = ereignisperson_juristische_person,
    geschwistervermaechtnis_nach_2163 = geschwistervermaechtnis_nach_2163,
    einordnungsnachweis = einordnungsnachweis)
  for (name in c("bestimmtes_personenereignis_angeordnet", "ereignisperson_lebt_beim_erbfall",
    "ereignisperson_juristische_person", "geschwistervermaechtnis_nach_2163")) .wahrheitswert(eingaben[[name]], name)
  .text(einordnungsnachweis, "einordnungsnachweis")
  ausnahme <- ((bestimmtes_personenereignis_angeordnet && ereignisperson_lebt_beim_erbfall) || geschwistervermaechtnis_nach_2163) && !ereignisperson_juristische_person
  rechtzeitig <- !is.null(ereignis) && ereignis <= ende
  abgelaufen <- tag >= ende
  wert <- list(dreissigjahresfristende = .iso(ende), frist_am_prueftag_abgelaufen = abgelaufen,
    massgebliches_ereignis_rechtzeitig = rechtzeitig, ausnahme_nach_2163 = ausnahme,
    unwirksam_wegen_geprueften_aufschubgrundes = abgelaufen && !rechtzeitig && !ausnahme)
  ergebnis <- .ergebnis(wert, "daten_und_wahrheitswerte", "BGB_VERMAECHTNIS_DREISSIGJAHRESGRENZE", eingaben,
    list(list(operation = "Drei\u00dfig Jahre ab Erbfall; tats\u00e4chliches ma\u00dfgebliches Ereignis sp\u00e4testens am Endtag verhindert Fristunwirksamkeit, ebenso qualifizierte Ausnahme f\u00fcr nat\u00fcrliche Ereignisperson beziehungsweise Geschwisterverm\u00e4chtnis")), eingaben)
  ergebnis$annahmen <- list("Ein rechtlich qualifizierter Aufschubgrund nach\u00a72162; Pr\u00fcfung zum Ende des Pr\u00fcftags. Ereignisse am Endtag geschehen vor Fristablauf um Tagesende.")
  ergebnis$hinweise <- list("Bei mehreren gleichzeitig einschl\u00e4gigen Aufschubgr\u00fcnden jeden einzeln pr\u00fcfen; FALSE best\u00e4tigt nur fehlende Unwirksamkeit aus diesem Grund, nicht Gesamtwirksamkeit oder Anfall. Zeugung ist Fristwahrungsereignis nach\u00a72162 Absatz2, Geburt ist gesondertes Anfallsereignis nach\u00a72178. Bei Bedingung/Anfangstermin kann das Ereignis bereits vor Erbfall liegen. Bei Zeugung/Pers\u00f6nlichkeitsbestimmung setzt Absatz2 noch fehlendes Ereignis im Zeitpunkt des Erbfalls voraus; am selben Kalendertag Reihenfolge belegen. NULL bedeutet Ereignis bis Pr\u00fcftag nicht eingetreten, nicht unbekannt. Nach Fristablauf eingetretenes Ereignis heilt ohne einschl\u00e4gige Ausnahme den Ablauf nicht. Personenereignis muss in Beschwertem oder Bedachtem vorgesehen sein; blo\u00dfes Ereignis in beliebiger dritter Person gen\u00fcgt nicht. \u00a72163 Absatz2 bel\u00e4sst bei juristischer Ereignisperson die Drei\u00dfigjahresgrenze; widerspr\u00fcchliche Eingaben zu Leben/Geschwisterfall ersetzen keine rechtliche Qualifikation. Keine automatische Fristverl\u00e4ngerung oder Wochenendverschiebung, kein Nacherbfolgemodell\u00a72109.")
  ergebnis
}
