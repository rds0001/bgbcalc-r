erbauseinandersetzung_dreissigjahresgrenze <- function(erbfall_am = NULL, prueftag = NULL,
    fortgeltungsanordnung = NULL, angeordnetes_ereignis_am = NULL,
    miterbe_juristische_person = NULL, anordnung_rechtlich_qualifiziert = NULL, einordnungsnachweis = NULL) {
  erbfall <- .datum(erbfall_am, "erbfall_am")
  tag <- .datum(prueftag, "prueftag")
  if (tag < erbfall) .fehler("prueftag", "Pr\u00fcftag darf nicht vor Erbfall liegen.")
  ende <- .frist(erbfall_am, 30, "jahre", "ereignis")
  .auswahl(fortgeltungsanordnung, "fortgeltungsanordnung", c("keine", "miterbenereignis", "nacherbfolge", "vermaechtnisanfall"))
  ereignis <- if (!is.null(angeordnetes_ereignis_am)) .datum(angeordnetes_ereignis_am, "angeordnetes_ereignis_am") else NULL
  if (!is.null(ereignis) && !(erbfall <= ereignis && ereignis <= tag))
    .fehler("angeordnetes_ereignis_am", "Angeordnetes Ereignis muss zwischen Erbfall und Pr\u00fcftag liegen.")
  if (fortgeltungsanordnung == "keine" && !is.null(ereignis))
    .fehler("angeordnetes_ereignis_am", "Ohne besondere Anordnung kein zugeh\u00f6riges Ereignisdatum angeben.")
  .wahrheitswert(miterbe_juristische_person, "miterbe_juristische_person")
  .wahrheitswert(anordnung_rechtlich_qualifiziert, "anordnung_rechtlich_qualifiziert")
  .text(einordnungsnachweis, "einordnungsnachweis")
  verlaengerbar <- fortgeltungsanordnung != "keine" && !(fortgeltungsanordnung == "miterbenereignis" && miterbe_juristische_person)
  wert <- list(dreissigjahresfristende = .iso(ende), besondere_fortgeltung_zulaessig = verlaengerbar,
    angeordnetes_ereignis_eingetreten = !is.null(ereignis),
    zeitliche_wirkung_beendet = !is.null(ereignis) || (tag >= ende && !verlaengerbar))
  eingaben <- list(erbfall_am = erbfall_am, prueftag = prueftag, fortgeltungsanordnung = fortgeltungsanordnung,
    angeordnetes_ereignis_am = angeordnetes_ereignis_am, miterbe_juristische_person = miterbe_juristische_person,
    anordnung_rechtlich_qualifiziert = anordnung_rechtlich_qualifiziert, einordnungsnachweis = einordnungsnachweis)
  if (!anordnung_rechtlich_qualifiziert) wert <- NULL
  ergebnis <- .ergebnis(wert, "daten_und_wahrheitswerte", "BGB_ERBAUSEINANDERSETZUNG_DREISSIGJAHRESGRENZE", eingaben,
    list(list(operation = "Drei\u00dfig Jahre ab Erbfall; besondere Anordnung und juristischen Ereignismiterben pr\u00fcfen; eingetretenes Ereignis beendet Anordnung")), eingaben)
  if (!anordnung_rechtlich_qualifiziert) ergebnis$status <- "NICHT_ANWENDBAR"
  ergebnis$annahmen <- list("Pr\u00fcfung nach vollst\u00e4ndigem Ablauf des Pr\u00fcftags; fr\u00fchere andere Beendigungstatbest\u00e4nde gesondert gepr\u00fcft. Feste lokale BGB-Fassung.")
  ergebnis$hinweise <- list("Nur zeitliche Wirkung nach\u00a72044 Absatz2 bei wirksamer letztwilliger Beschr\u00e4nkung f\u00fcr Nachlass oder einzelne Gegenst\u00e4nde; kein vollst\u00e4ndiger Auseinandersetzungsanspruch. Modell umfasst unbefristete Anordnung oder ausdr\u00fcckliches Ereignisende, keine anderweitig k\u00fcrzer befristete Anordnung. Wichtiger Grund\u00a7749 Absatz2/3, Zweifelsregel bei Tod\u00a7750, Gl\u00e4ubiger-/Nachfolgewirkung\u00a7751 und Grundbucheintragung\u00a71010 Absatz1 gesondert pr\u00fcfen. Besonderes Ereignis muss letztwillig als Endpunkt angeordnet sein; Nacherbfolge/Verm\u00e4chtnis allein verl\u00e4ngern nicht automatisch. Ereignisdatum NULL bedeutet bis Pr\u00fcftag nicht eingetreten, nicht unbekannt; ein Ereignis beendet ab seinem Eintritt. Juristische Person sperrt Verl\u00e4ngerung nur bei Ereignis gerade in der Person dieses Miterben, nicht pauschal bei Verm\u00e4chtnis-/Nacherbfolgeanordnung. \u00a72044 enth\u00e4lt keinen ausdr\u00fccklichen Verweis auf\u00a72109; dessen Lebend- und Geschwistervoraussetzungen nicht \u00fcbertragen. Wirksamkeit einer zugrunde gelegten Nacherbfolge gegebenenfalls einschlie\u00dflich\u00a72109 separat qualifizieren. Keine automatische Wochenend-/Feiertagsverschiebung.")
  ergebnis
}
