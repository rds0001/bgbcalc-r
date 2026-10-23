# Vollständige Offline-Referenzen gegen den installierten Namespace.
if (requireNamespace("jsonlite", quietly = TRUE)) {
  verbindung <- gzfile(system.file("daten", "referenzen.json.gz", package = "bgbcalc"), "rt", encoding = "UTF-8")
  faelle <- jsonlite::fromJSON(paste(readLines(verbindung, warn = FALSE), collapse = "\n"), simplifyVector = FALSE)
  close(verbindung)
  ergebnisse <- list()
  for (fall in faelle) {
    ergebnis <- tryCatch(do.call(getExportedValue("bgbcalc", fall$funktion), fall$eingaben),
      bgb_berechnungsfehler = function(e) list(status = e$status, wert = NULL))
    if (!identical(ergebnis$status, fall$erwartung$status) ||
        !isTRUE(all.equal(ergebnis$wert, fall$erwartung$wert))) stop(fall$fall_id)
    ergebnisse[[fall$fall_id]] <- ergebnis
  }
  ausgabe <- Sys.getenv("BGBCALC_R_ERGEBNISSE")
  if (nzchar(ausgabe)) jsonlite::write_json(ergebnisse, ausgabe, auto_unbox = TRUE, null = "null", digits = 17)
  cat(length(faelle), "installierte native R-Referenzfälle bestanden.\n")
} else {
  message("Referenzprüfung übersprungen: vorgeschlagenes Paket jsonlite fehlt.")
}
