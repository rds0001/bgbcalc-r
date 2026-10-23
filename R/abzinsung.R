vorzeitiger_befriedigungsbetrag <- function(forderungsbetrag = NULL,
    zeitanteil_zaehler = NULL, zeitanteil_nenner = NULL, zeitanteil_nachweis = NULL,
    unverzinslich = NULL, noch_nicht_faellig = NULL, befriedigungsgrund = NULL,
    voraussetzungen_erfuellt = NULL) {
  eingaben <- list(forderungsbetrag = forderungsbetrag, zeitanteil_zaehler = zeitanteil_zaehler,
    zeitanteil_nenner = zeitanteil_nenner, zeitanteil_nachweis = zeitanteil_nachweis,
    unverzinslich = unverzinslich, noch_nicht_faellig = noch_nicht_faellig,
    befriedigungsgrund = befriedigungsgrund, voraussetzungen_erfuellt = voraussetzungen_erfuellt)
  forderung <- .geld(forderungsbetrag)
  anteil <- .zeitanteil(zeitanteil_zaehler, zeitanteil_nenner, zeitanteil_nachweis)
  for (parameter in c("unverzinslich", "noch_nicht_faellig", "voraussetzungen_erfuellt")) {
    .wahrheitswert(eingaben[[parameter]], parameter)
  }
  .auswahl(befriedigungsgrund, "befriedigungsgrund", c("hypothek_gefaehrdung", "pfand_rueckgabe"))
  anwendbar <- unverzinslich && noch_nicht_faellig && voraussetzungen_erfuellt
  schritte <- list(list(operation = "Voraussetzungen der vorzeitigen Befriedigung", anwendbar = anwendbar))
  wert <- NULL
  if (anwendbar) {
    faktor <- .addieren(.bruch(1), .multiplizieren(.bruch(1, 25), anteil))
    wert <- .dividieren(forderung, faktor)
    schritte <- c(schritte, list(list(
      operation = "Forderungsbetrag durch einfachen Aufzinsungsfaktor teilen",
      aufzinsungsfaktor = .bruchteile(faktor))))
  }
  .geld_ergebnis(wert, "BGB_VORZEITIGE_BEFRIEDIGUNG", eingaben, schritte,
    list(zeitanteil_nachweis = zeitanteil_nachweis, voraussetzungen_erfuellt = voraussetzungen_erfuellt))
}
