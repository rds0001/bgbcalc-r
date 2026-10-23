# Native Anwendungsketten gegen den installierten Namespace, ohne Quellpaket.
if (requireNamespace('jsonlite', quietly=TRUE)) local({
  verbindung <- gzfile(system.file('daten','kompositionen.json.gz',package='bgbcalc'),'rt',encoding='UTF-8')
  inhalte <- jsonlite::fromJSON(paste(readLines(verbindung,warn=FALSE),collapse='\n'),simplifyVector=FALSE)
  close(verbindung)
  wurzel <- tempfile('bgb-kompositionen-');dir.create(wurzel)
  on.exit(unlink(wurzel,recursive=TRUE))
  for (name in names(inhalte)) {
    stopifnot(!grepl('(^/|(^|/)\\.\\.(/|$)|\\\\)',name))
    ziel <- file.path(wurzel,name);dir.create(dirname(ziel),recursive=TRUE,showWarnings=FALSE)
    writeLines(enc2utf8(inhalte[[name]]),ziel,useBytes=TRUE)
  }
  vorher <- options(bgb.instrumentiert=TRUE,bgb.pruefargumente=wurzel,warn=2)
  on.exit(options(vorher),add=TRUE)
  kern <- asNamespace('bgbcalc')
  skripte <- sort(list.files(file.path(wurzel,'pruefungen/r'),pattern='\\.R$',full.names=TRUE))
  for (datei in skripte) sys.source(datei,envir=new.env(parent=kern))
  cat(length(skripte),'installierte native R-Anwendungstestdateien bestanden.\n')
}) else message('Anwendungsprüfung übersprungen: vorgeschlagenes Paket jsonlite fehlt.')
