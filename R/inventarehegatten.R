inventarfrist_ehegatten <- function(fristende_erbe = NULL, fristende_anderer_ehegatte = NULL,
    erbschaft_gehoert_zum_gesamtgut = NULL, anderer_ehegatte_verwaltet_gesamtgut = NULL,
    frist_auch_gegenueber_anderem_bestimmt = NULL, inventar_durch_anderen_errichtet = NULL,
    einordnungsnachweis = NULL) {
  erbe <- .datum(fristende_erbe, "fristende_erbe")
  anderer <- if (!is.null(fristende_anderer_ehegatte)) .datum(fristende_anderer_ehegatte, "fristende_anderer_ehegatte") else NULL
  eingaben <- list(fristende_erbe = fristende_erbe, fristende_anderer_ehegatte = fristende_anderer_ehegatte,
    erbschaft_gehoert_zum_gesamtgut = erbschaft_gehoert_zum_gesamtgut,
    anderer_ehegatte_verwaltet_gesamtgut = anderer_ehegatte_verwaltet_gesamtgut,
    frist_auch_gegenueber_anderem_bestimmt = frist_auch_gegenueber_anderem_bestimmt,
    inventar_durch_anderen_errichtet = inventar_durch_anderen_errichtet,
    einordnungsnachweis = einordnungsnachweis)
  for (name in c("erbschaft_gehoert_zum_gesamtgut", "anderer_ehegatte_verwaltet_gesamtgut",
    "frist_auch_gegenueber_anderem_bestimmt", "inventar_durch_anderen_errichtet")) .wahrheitswert(eingaben[[name]], name)
  .text(einordnungsnachweis, "einordnungsnachweis")
  wirksam <- !anderer_ehegatte_verwaltet_gesamtgut || frist_auch_gegenueber_anderem_bestimmt
  if (erbschaft_gehoert_zum_gesamtgut && anderer_ehegatte_verwaltet_gesamtgut && wirksam && is.null(anderer))
    .fehler("fristende_anderer_ehegatte", "Bei erforderlicher und erfolgter Fristbestimmung gegen\u00fcber dem anderen Ehegatten ist dessen qualifiziertes Fristende erforderlich.", "EINGABE_FEHLT")
  ende <- NULL
  if (wirksam) ende <- if (anderer_ehegatte_verwaltet_gesamtgut && !is.null(anderer)) max(erbe, anderer) else erbe
  wert <- NULL
  if (erbschaft_gehoert_zum_gesamtgut) wert <- list(fristbestimmung_nach_2008_wirksam = wirksam,
    inventarfristende_erbe = if (!is.null(ende)) .iso(ende) else NULL,
    inventar_kommt_erben_zustatten = inventar_durch_anderen_errichtet)
  ergebnis <- .ergebnis(wert, "daten_und_wahrheitswerte", "BGB_INVENTARFRIST_EHEGATTEN", eingaben,
    list(list(operation = "Erforderliche Fristbestimmung gegen\u00fcber verwaltendem Ehegatten pr\u00fcfen; wirksames Fristende ist Maximum beider qualifizierter Enden; wirksames Inventar des anderen kommt Erben zustatten")), eingaben)
  ergebnis$status <- if (erbschaft_gehoert_zum_gesamtgut) "BERECHNET" else "NICHT_ANWENDBAR"
  ergebnis$annahmen <- list("Qualifizierte Inventarfristenden und rechtswirksame Inventarerrichtung vorgegeben; Gesamtgutzugeh\u00f6rigkeit und Verwaltung rechtlich bestimmt. \u00a72008 gilt auch nach Beendigung der G\u00fctergemeinschaft.")
  ergebnis$hinweise <- list("Nur zus\u00e4tzliche Wirksamkeitsbedingung des \u00a72008, keine Pr\u00fcfung s\u00e4mtlicher Voraussetzungen der Fristbestimmung oder unbeschr\u00e4nkter Erbenhaftung. Fristende des Erben ohne die Verl\u00e4ngerung durch \u00a72008 eingeben; Fristende des anderen einschlie\u00dflich anderweitiger gesetzlicher Verl\u00e4ngerungen. Ohne erforderliche Bestimmung gegen\u00fcber dem verwaltenden anderen Ehegatten ergibt sich kein wirksames Fristende, nicht das urspr\u00fcngliche Ende. Verwaltet der andere weder allein noch gemeinsam, wird sein Fristende nicht zur Verl\u00e4ngerung verwendet. Inventarzurechnung nach Absatz1 Satz3 wird nicht zus\u00e4tzlich von dessen Verwaltungsberechtigung abh\u00e4ngig gemacht. Qualifizierte tats\u00e4chliche Inventarerrichtung, nicht blo\u00dfer Entwurf. Keine automatische Heilung fr\u00fcheren Fristvers\u00e4umnisses oder abschlie\u00dfende Haftungsbefreiung. Gesamtgutzugeh\u00f6rigkeit und einschl\u00e4gige Verwaltung nach Beendigung der G\u00fctergemeinschaft entsprechend Absatz2 bestimmen; Beendigung allein schlie\u00dft die Regel nicht aus.")
  ergebnis
}
