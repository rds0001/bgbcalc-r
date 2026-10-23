argumente <- getOption("bgb.pruefargumente", commandArgs(trailingOnly = TRUE))
stopifnot(length(argumente) == 1)
options(warn = 2)
if (!isTRUE(getOption("bgb.instrumentiert"))) {
  for (datei in list.files(file.path(argumente[[1]], "r", "R"), full.names = TRUE)) source(datei)
}
pruefe_bruch <- function(wert, zaehler, nenner = "1") {
  stopifnot(identical(wert, list(zaehler = zaehler, nenner = nenner)))
}
knoten <- function(kennung, tritt_ein = TRUE, abkoemmlinge = list()) {
  list(person_id = kennung, tritt_ein = tritt_ein, abkoemmlinge = abkoemmlinge)
}

ehe <- ehegatten_erbquote("erste_ordnung", "guetertrennung", 2, 0, 1,
  TRUE, FALSE, FALSE, FALSE, FALSE)$wert
anteil <- ehe$verwandtenquote
kinder <- abkoemmlings_erbquoten(
  list(knoten("A"), knoten("B", FALSE, list(knoten("B1"), knoten("B2")))),
  as.numeric(anteil$zaehler), as.numeric(anteil$nenner))$wert
pruefe_bruch(ehe$ehegattenquote, "1", "3")
pruefe_bruch(kinder$erbquoten[[1]]$quote, "1", "3")
pruefe_bruch(kinder$erbquoten[[2]]$quote, "1", "6")
pruefe_bruch(kinder$erbquoten[[3]]$quote, "1", "6")

paare <- list(vaeterlich = list(knoten("V1"), knoten("V2")),
  muetterlich = list(knoten("M1"), knoten("M2", FALSE, list(knoten("N")))))
rein <- grosselternlinien_erbquoten(paare, FALSE, 1, 1)$wert
anteil <- rein$abkoemmlingsquote
ehe <- ehegatten_erbquote("grosseltern", "zugewinngemeinschaft", 0,
  as.numeric(anteil$zaehler), as.numeric(anteil$nenner), TRUE, FALSE, FALSE, FALSE, FALSE)$wert
# Die bekannte unabhängige Verteilungsbasis ist 1 - 1/2 - 1/4 = 1/4.
vor_zuschlag <- grosselternlinien_erbquoten(paare, FALSE, 1, 4)$wert
grosseltern <- Filter(function(teil) length(teil$stammpfad) == 1, vor_zuschlag$erbteile)
stopifnot(length(grosseltern) == 3)
for (teil in grosseltern) pruefe_bruch(teil$quote, "1", "16")
pruefe_bruch(ehe$grosselternabkoemmlingszuschlag, "1", "16")
pruefe_bruch(ehe$ehegattenquote, "13", "16")

stufe <- unterhaltsaltersstufe("2020-05-20", "2026-05-01")$wert
minimum <- mindestunterhalt_aus_existenzminimum("6000", stufe, "Synthetische Jahresgrundlage")$wert
unterhalt <- dynamischer_kindesunterhalt(minimum, "100.19",
  "Synthetischer altersbezogener Mindestunterhalt")$wert
ergebnis <- kindbezogene_leistung_anrechnen(unterhalt, "200", "0",
  TRUE, "kindergeld", TRUE, FALSE)$wert
stopifnot(stufe == 2)
pruefe_bruch(minimum, "500")
pruefe_bruch(unterhalt, "501")
pruefe_bruch(ergebnis$verbleibender_barbedarf, "401")
pflichtteil <- pflichtteil_betrag("1", 1, 3, "0", FALSE, TRUE,
  "Synthetischer bewerteter Nachlass und gesetzliche Quote")$wert
zusatz <- zusatzpflichtteil_betrag(pflichtteil, list(zaehler = "1", nenner = "12"), TRUE)
pruefe_bruch(pflichtteil, "1", "6")
pruefe_bruch(zusatz$wert, "1", "12")
stopifnot(identical(zusatz$nutzervorgaben$pflichtteilsbetrag, pflichtteil))
zuordnung <- modernisierung_drittmittel_aufteilen("1", list(
  list(wohnung_id = "A", aufgewendete_kosten = "1"),
  list(wohnung_id = "B", aufgewendete_kosten = "2")), FALSE)$wert
ursprungsbetrag <- zuordnung[[1]]$drittmittel
vorteil <- modernisierung_zinsermaessigung(ursprungsbetrag, "1", "4",
  "Synthetischer Abschlussstichtag und Marktzinssatz", TRUE, FALSE)$wert
pruefe_bruch(ursprungsbetrag, "1", "3")
pruefe_bruch(vorteil, "1", "100")
grund <- TRUE # Extern qualifizierte rechtliche Eingabe.
zwischen <- modernisierung_regulaerer_zwischenbetrag(
  ursprungsbetrag, "0", "0", vorteil, "0", grund)
pruefe_bruch(zwischen$wert$jaehrlicher_zwischenbetrag, "1", "60")
pruefe_bruch(zwischen$wert$monatlicher_zwischenbetrag, "1", "720")
stopifnot(identical(zwischen$nutzervorgaben$jaehrliche_zinsermaessigung, vorteil))

angekuendigt <- list(zaehler = "100", nenner = "1")
tatsaechlich <- list(zaehler = "11001", nenner = "100")
haerte <- modernisierung_haerteberuecksichtigung(TRUE, TRUE, FALSE, TRUE,
  FALSE, angekuendigt, tatsaechlich)$wert
beginn <- modernisierung_erhoehungsbeginn("2026-01-31", TRUE,
  angekuendigt, tatsaechlich, TRUE)$wert
stopifnot(isTRUE(haerte$umstaende_beruecksichtigungsfaehig),
  identical(beginn, "2026-10-01"))
grund <- regelverjaehrung_grundfrist("2019-05-01", "2019-06-01", TRUE)$wert
erster <- .iso(as.Date(grund$beginn_mit_jahresschluss) + 1)
gehemmt <- verjaehrung_gehemmte_kalendertage(erster, grund$rechnerischer_letzter_tag,
  list(list(erster_gehemmter_tag = "2020-02-28", letzter_gehemmter_tag = "2020-03-01")),
  TRUE)$wert
stopifnot(identical(grund$rechnerischer_letzter_tag, "2022-12-31"),
  identical(gehemmt$rechnerischer_letzter_tag, "2023-01-03"),
  gehemmt$beruecksichtigte_hemmungstage == 3)
gehemmt <- verjaehrung_gehemmte_kalendertage("2026-01-01", "2026-01-10",
  list(list(erster_gehemmter_tag = "2026-01-05", letzter_gehemmter_tag = "2026-01-20")),
  TRUE)$wert
nachlauf <- verjaehrung_verhandlungen_mindestablauf(
  "2026-01-20", gehemmt$rechnerischer_letzter_tag, TRUE)$wert
stopifnot(identical(gehemmt$rechnerischer_letzter_tag, "2026-01-26"),
  identical(nachlauf$rechnerischer_letzter_tag, "2026-04-20"))
grund <- regelverjaehrung_grundfrist("2024-01-01", "2024-01-01", TRUE)$wert
stopifnot(as.Date("2026-01-15") < as.Date(grund$rechnerischer_letzter_tag))
antrag <- FALSE # Extern qualifizierte rechtliche Eingabe.
anerkenntnis <- TRUE # Extern qualifizierte rechtliche Eingabe.
verworfen <- verjaehrung_neubeginn_grundfrist("2026-01-15", 3, "jahre",
  antrag)
erneuert <- verjaehrung_neubeginn_grundfrist("2026-01-15", 3, "jahre",
  anerkenntnis)
stopifnot(identical(verworfen$status, "NICHT_ANWENDBAR"), is.null(verworfen$wert),
  identical(erneuert$wert, "2029-01-15"))
grund <- regelverjaehrung_grundfrist("2024-01-01", "2024-01-01", TRUE)$wert
nachlass <- verjaehrung_ablaufhemmung_mindestablauf("nachlass",
  list(list(ereignis = "erbschaft_angenommen", datum = "2027-11-01")), 3, "jahre",
  grund$rechnerischer_letzter_tag, FALSE, TRUE)$wert
stopifnot(identical(grund$rechnerischer_letzter_tag, "2027-12-31"),
  identical(nachlass$mindestablauf, "2028-05-01"),
  identical(nachlass$rechnerischer_letzter_tag, "2028-05-01"))
vor_quote <- sachschaden_ersatzbetrag("1000", "190", "0")$wert
nach_quote <- vermoegensschaden_mitverschulden(vor_quote, "0.25",
  "Synthetische Quote für den gesamten Sachschaden dieser Position", TRUE)$wert
pruefe_bruch(vor_quote, "1190")
pruefe_bruch(nach_quote$kuerzungsbetrag, "595", "2")
pruefe_bruch(nach_quote$verbleibender_ersatzbetrag, "1785", "2")
zuordnung <- faellige_geldschulden_gesetzlich_tilgen("120", list(
  list(schuld_id = "A", offener_betrag = "100", sicherheitsrang = 1,
    laestigkeitsrang = 1, altersrang = 1),
  list(schuld_id = "B", offener_betrag = "100", sicherheitsrang = 2,
    laestigkeitsrang = 1, altersrang = 1)), FALSE, TRUE)$wert$zuordnungen
a <- zahlung_anrechnen(zuordnung[[1]]$tilgungsbetrag, "10", "20", "70", NULL, FALSE)$wert
b <- zahlung_anrechnen(zuordnung[[2]]$tilgungsbetrag, "5", "10", "85", NULL, FALSE)$wert
for (i in seq_len(3)) {
  pruefe_bruch(a$zuordnungen[[i]]$betrag, c("10", "20", "70")[[i]])
  pruefe_bruch(b$zuordnungen[[i]]$betrag, c("5", "10", "5")[[i]])
}
pruefe_bruch(b$zuordnungen[[3]]$restforderung, "80")
pruefe_bruch(a$nicht_zugeordnet, "0")
pruefe_bruch(b$nicht_zugeordnet, "0")
erste <- indexmiete_betrag("800", "100", "110",
  "Synthetische gleiche Indexreihe und Basis", TRUE)$wert$neue_miete
zweite <- indexmiete_betrag(erste, "110", "121",
  "Fortschreibung ab dem zur neuen Mietbasis gehörenden Index110", TRUE)$wert$neue_miete
direkt <- indexmiete_betrag("800", "100", "121",
  "Vergleichsrechnung von der ursprünglichen Basis", TRUE)$wert$neue_miete
pruefe_bruch(erste, "880")
pruefe_bruch(zweite, "968")
pruefe_bruch(direkt, "968")
beginn <- lebensalter_beginn("2016-02-29", 10)$wert
vorher <- delikt_altersvoraussetzungen("2016-02-29", "2026-02-28", TRUE, FALSE, TRUE)$wert
nachher <- delikt_altersvoraussetzungen("2016-02-29", beginn, TRUE, FALSE, TRUE)$wert
stopifnot(identical(beginn, "2026-03-01"), vorher$ausschluss_nach_absatz_2,
  !nachher$ausschluss_nach_absatz_2, nachher$vollendete_lebensjahre == 10)
schwelle <- verbraucherdarlehen_verzugsschwelle("10000", "1000", "3", 2, FALSE, TRUE)$wert
rechnerisch <- fristende("2026-10-10", 2, "wochen", "ereignis")$wert
massgeblich <- werktagsverschiebung(rechnerisch, "leistung", list(),
  "Synthetischer Leistungsort", "Synthetischer vollständiger Kalender ohne zusätzliche Feiertage",
  "2026-10-01", "2026-10-31")$wert
noch_offen <- verbraucherdarlehen_kuendigungsnachfrist("2026-10-10", massgeblich,
  "2026-10-25", "Vorgeschaltete §193-Prüfung", FALSE, TRUE, TRUE)$wert
abgelaufen <- verbraucherdarlehen_kuendigungsnachfrist("2026-10-10", massgeblich,
  "2026-10-27", "Vorgeschaltete §193-Prüfung", TRUE, TRUE, TRUE)$wert
stopifnot(identical(rechnerisch, "2026-10-24"), identical(massgeblich, "2026-10-26"),
  schwelle$voraussetzungen_nummer_1_erfuellt, !noch_offen$nachfrist_am_prueftag_abgelaufen,
  !noch_offen$voraussetzungen_nummer_2_erfuellt, abgelaufen$voraussetzungen_nummer_2_erfuellt)
ausnahmen <- mietpreisbegrenzung_ausnahmen("2000-01-01", "2000-02-01", FALSE,
  "Synthetischer Altbau ohne umfassende Modernisierung")$wert
grundbetrag <- mietpreisbegrenzung_grundbetrag("800", TRUE, ausnahmen$ausnahme_von_556d,
  "Synthetische gültige Verordnung; keine Ausnahme oder Auskunftshindernisse")$wert
mit_privileg <- mietpreisbegrenzung_vormietgrenze(grundbetrag, "900", TRUE,
  "Bereinigte geschuldete Vormiete, erforderliche Auskunft erteilt")$wert
ohne_privileg <- mietpreisbegrenzung_vormietgrenze(grundbetrag, "900", FALSE,
  "Vormietprivileg wegen fehlender Auskunft derzeit nicht nutzbar")$wert
pruefe_bruch(grundbetrag, "880")
pruefe_bruch(mit_privileg, "900")
pruefe_bruch(ohne_privileg, "880")
bestand <- vereins_liquidationsueberschuss("1000", "100",
  "Synthetischer konsistenter Liquidationsbestand")$wert
kalender <- vereins_liquidationssperrjahr("2024-02-27", TRUE,
  "Synthetische ordnungsgemäße erste Einrückung")$wert
anteil <- vereinsvermoegen_mitgliederanteil(bestand$ueberschuss, 7, FALSE, TRUE,
  "Synthetisch am 01.03.2025 sämtliche Gläubiger befriedigt, Sicherungsfragen erledigt, keine andere Anfallbestimmung")$wert
stopifnot(identical(kalender$fruehester_tag_nach_sperrjahr, "2025-03-01"))
pruefe_bruch(bestand$fehlbetrag, "0")
pruefe_bruch(bestand$ueberschuss, "900")
pruefe_bruch(anteil, "900", "7")

grund <- verjaehrung_besondere_grundfrist("vorsaetzliche_personenverletzung", "2025-02-27",
  NULL, FALSE, FALSE, "Synthetischer vorsätzlicher Eingriff in sexuelle Selbstbestimmung; Anspruch entsteht 27.02.2025")$wert
vor <- verjaehrung_sexuelle_selbstbestimmung_hemmung("2004-02-29", "2025-02-28",
  TRUE, FALSE, FALSE, "Keine häusliche Gemeinschaft")$wert
nach <- verjaehrung_sexuelle_selbstbestimmung_hemmung("2004-02-29", "2025-03-01",
  TRUE, FALSE, FALSE, "Vollendung21 am1.März")$wert
gehemmt <- verjaehrung_gehemmte_kalendertage("2025-02-28", grund$rechnerischer_letzter_tag,
  list(list(erster_gehemmter_tag = "2025-02-28", letzter_gehemmter_tag = "2025-02-28")), TRUE)$wert
stopifnot(vor$hemmungstatbestand_am_stichtag, !nach$hemmungstatbestand_am_stichtag,
  identical(grund$rechnerischer_letzter_tag, "2055-02-27"),
  identical(gehemmt$rechnerischer_letzter_tag, "2055-02-28"), gehemmt$beruecksichtigte_hemmungstage == 1)

verwirkt <- TRUE # Extern qualifizierte rechtliche Eingabe.
mit <- vertragsstrafe_schadensmindestbetrag("500", "800", "nicht_gehoerige_erfuellung",
  verwirkt, TRUE, TRUE, TRUE, "Synthetisch bei Annahme wirksam vorbehalten")$wert
ohne <- vertragsstrafe_schadensmindestbetrag("500", "800", "nicht_gehoerige_erfuellung",
  verwirkt, TRUE, FALSE, TRUE, "Kein Strafvorbehalt, aber unabhängig bestehender Schadenanspruch")$wert
stopifnot(verwirkt)
pruefe_bruch(mit$strafmindestbetrag, "500")
pruefe_bruch(mit$weiterer_schadensbetrag, "300")
pruefe_bruch(mit$gesamtbetrag, "800")
pruefe_bruch(ohne$strafmindestbetrag, "0")
pruefe_bruch(ohne$weiterer_schadensbetrag, "800")
pruefe_bruch(ohne$gesamtbetrag, "800")

wert <- pflichtteil_schenkungswert("500", "800", FALSE, FALSE,
  "Synthetische vergleichbare Werte ohne Belastungen")$wert
zeit <- pflichtteil_schenkungsabschmelzung(wert, "2000-06-15", "2005-06-16", TRUE, FALSE, NULL,
  "Synthetisch fristauslösende Drittschenkung ohne vorbehaltene Rechte")$wert
grund <- pflichtteilsergaenzung_grundbetrag("1000", zeit$beruecksichtigter_schenkungswert,
  1, 2, TRUE, "Synthetischer positiver Nachlass ohne Eigengeschenke/Ausgleichung")$wert
rest <- pflichtteilsergaenzung_mehrhinterlassung(grund$ergaenzungsgrundbetrag, "280",
  grund$ordentlicher_pflichtteilswert, "Synthetisch unbelastet hinterlassener Wert280")$wert
pruefe_bruch(wert, "500")
pruefe_bruch(zeit$beruecksichtigter_schenkungswert, "250")
pruefe_bruch(grund$ordentlicher_pflichtteilswert, "250")
pruefe_bruch(grund$ergaenzungsgrundbetrag, "125", "2")
pruefe_bruch(rest$mehrhinterlassung, "30")
pruefe_bruch(rest$verbleibende_ergaenzung, "65", "2")

quoten <- sachenverbindung_eigentumsquoten(
  list(list(eigentuemer_id = "A", sachenwert = "100"), list(eigentuemer_id = "B", sachenwert = "300")),
  "verbindung", TRUE, FALSE, FALSE, NULL, "Synthetische wesentliche Verbindung ohne Hauptsache")$wert
teilhaber <- lapply(quoten, function(e) list(person_id = e$eigentuemer_id,
  anteil_zaehler = as.numeric(e$eigentumsquote$zaehler), anteil_nenner = as.numeric(e$eigentumsquote$nenner)))
kosten <- gemeinschaft_lastenanteile("100", teilhaber, FALSE, TRUE)$wert
pruefe_bruch(quoten[[1]]$eigentumsquote, "1", "4")
pruefe_bruch(quoten[[2]]$eigentumsquote, "3", "4")
pruefe_bruch(kosten[[1]]$betrag, "25")
pruefe_bruch(kosten[[2]]$betrag, "75")

zeit <- vergleichsmiete_zeitvoraussetzungen("2024-01-01", "2025-01-15", TRUE)$wert
betrag <- vergleichsmiete_kappungsrahmen("500", "100", "650", "750", TRUE, FALSE, FALSE, TRUE,
  "Synthetischer Dreijahresverlauf:500 Ausgangsmiete,50 reguläre Erhöhung ab01.01.2024,100 ausgeschlossene Modernisierung; gültige15Prozent-Verordnung")$wert
stopifnot(zeit$jahresfrist_eingehalten, zeit$wartefrist_eingehalten,
  identical(zeit$mietbeginn_bei_zustimmung, "2025-04-01"))
pruefe_bruch(betrag$kappungsbetrag_monatlich, "675")
pruefe_bruch(betrag$maximaler_erhoehungsbetrag, "25")
pruefe_bruch(betrag$miete_nach_maximaler_erhoehung, "675")

wichtiger_grund <- werkkuendigung_wichtiger_grund_verguetung("1200", 1, 3, TRUE, FALSE,
  "Synthetische wirksame wichtige Kündigung; ein Drittel erbracht")$wert
freie_kuendigung <- werk_bestellerkuendigung_verguetung("400", "800", "vermutung", "0", "0", "0",
  TRUE, FALSE, FALSE)$wert
bautraeger <- werkkuendigung_wichtiger_grund_verguetung("1200", 1, 3, TRUE, TRUE,
  "Synthetischer Bauträgervertrag:§648a ausgeschlossen")
pruefe_bruch(wichtiger_grund, "400")
pruefe_bruch(freie_kuendigung, "440")
stopifnot(identical(bautraeger$status, "NICHT_ANWENDBAR"), is.null(bautraeger$wert))

for (zulaessig in c(FALSE, TRUE)) {
  wirkung <- aufrechnung_betragswirkung("1200", "800", "2024-01-01", "2026-01-01", zulaessig,
    "Zulässigkeit und Erklärung extern rechtlich qualifiziert; Beträge zum Aufrechnungszeitpunkt")
  if (zulaessig) {
    pruefe_bruch(wirkung$wert$erloschener_betrag_je_forderung, "800")
    pruefe_bruch(wirkung$wert$rest_eigene_forderung, "400")
    pruefe_bruch(wirkung$wert$rest_gegenforderung, "0")
    stopifnot(identical(wirkung$wert$erloeschenszeitpunkt_am, "2024-01-01"))
  } else stopifnot(identical(wirkung$status, "NICHT_ANWENDBAR"))
}

betrag <- betriebskostenpauschale_aenderungsbetrag("120", "150", 1, 3, TRUE, TRUE, TRUE,
  "Synthetisch monatliche wirtschaftliche Gesamtkosten; Drittel-Umlageanteil")$wert
zeit <- betriebskostenpauschale_erhoehungsbeginn("2025-04-30", "2023-12-01", "2025-01-31",
  "2025-04-30", TRUE, TRUE, "Synthetische nachträgliche Kostensteigerung und fristgerechte Erklärung am letzten Tag")$wert
pruefe_bruch(betrag, "10")
stopifnot(zeit$dreimonatsfrist_eingehalten, zeit$rueckwirkung_anwendbar,
  identical(zeit$erhoehungsbeginn, "2024-01-01"), identical(zeit$regulaerer_erhoehungsbeginn, "2025-06-01"))


grund <- maengel_verjaehrungsgrundfrist("kauf", "sonstige_sache", "2030-01-31", FALSE, NULL,
  FALSE, "Synthetisch Ablieferung2030 und gesetzlicher Zweijahresweg")$wert$rechnerischer_letzter_tag
verlaengert <- verbrauchsgueterkauf_nachbesserungsverlaengerung(grund, TRUE, TRUE,
  "Synthetisch Nachbesserung/Rückgabe31.05.2032, vorherige Übergabe vor Ablauf der ursprünglichen Frist; Absatz5 zeitlich anwendbar")$wert$rechnerischer_letzter_tag
nochmals <- verbrauchsgueterkauf_nachbesserungsverlaengerung(grund, TRUE, TRUE,
  "Synthetisch weitere Nachbesserung; unveränderter ursprünglicher Grundtermin")$wert$rechnerischer_letzter_tag
zeigen <- verbrauchsgueterkauf_verjaehrungsnachlauf("erstmaliges_zeigen_des_mangels", "2031-12-30",
  verlaengert, TRUE, "Synthetisch derselbe Mangel erstmals30.12.2031, bereits innerhalb ursprünglicher Frist")$wert$rechnerischer_letzter_tag
rueckgabe <- verbrauchsgueterkauf_verjaehrungsnachlauf("rueckgabe_nach_nacherfuellung_garantie", "2032-05-31",
  zeigen, TRUE, "Synthetisch Übergabe zur Nacherfüllung vor31.01.2032 und Rückgabe31.05.2032")$wert$rechnerischer_letzter_tag
stopifnot(identical(grund, "2032-01-31"), identical(verlaengert, "2033-01-31"),
  identical(nochmals, verlaengert), identical(zeigen, "2033-01-31"), identical(rueckgabe, "2033-01-31"))


beginn <- modernisierung_beginnverzoegerung("2022-12-01", "2023-01-01", "2024-03-01", "2025-04-01",
  "Synthetisch verspäteter tatsächlicher Beginn der angekündigten Baumaßnahme")$wert$beginnverzoegerung_nummer_1
ruhe <- modernisierung_arbeitsruhe("2024-04-01", "tagesbeginn", NULL, "2025-04-01",
  "Synthetisch nach Beginn seit01.04.2024 ununterbrochen ruhend, Prüfung zum Tagesschluss")$wert$arbeitsruhe_nummer_4
stopifnot(beginn, ruhe)
for (grund in c(FALSE, TRUE)) {
  vermutung <- modernisierung_pflichtverletzungsvermutung("800", "100", TRUE, beginn, FALSE, ruhe, grund,
    "Synthetisch objektiver Grund, falls bejaht, für beide zeitlichen Tatbestände dargelegt")$wert
  stopifnot(!vermutung$verdoppelung_nummer_2, vermutung$vermutungstatbestand_erfuellt,
    identical(vermutung$pflichtverletzung_wird_vermutet, !grund))
}


ausschlagung <- erbausschlagung_grundfrist("2029-12-01", "2030-01-01", TRUE, "2030-01-15", FALSE, FALSE, TRUE,
  "Synthetische Verfügung: gerichtliche Bekanntgabe später als Kenntnis; keine Fristkorrekturen")$wert
anfechtung <- erbrecht_anfechtungsgrundfrist("ausschlagungsfristversaeumung", ausschlagung$rechnerischer_letzter_tag,
  "2030-03-01", FALSE, FALSE, TRUE,
  "Synthetisch Ausschlagung unterblieben, Annahmefiktion am Fristablauf; Kenntnis des Anfechtungsgrunds erst01.03.2030")$wert
stopifnot(identical(ausschlagung$fristbeginnereignis_am, "2030-01-15"),
  identical(ausschlagung$rechnerischer_letzter_tag, "2030-02-26"),
  identical(anfechtung$rechnerisches_grundfristende, "2030-04-12"),
  identical(anfechtung$dreissigjahresgrenze, "2060-02-26"),
  identical(anfechtung$rechnerischer_letzter_tag, "2030-04-12"))


zeit <- dienst_krankenfuersorge_zeitraum("2024-02-29", "tagesbeginn", "2024-03-15", TRUE, TRUE,
  FALSE, FALSE, FALSE, "Synthetisch fortdauernder Fürsorgebedarf bis gewöhnlichem Dienstende15.03.2024")$wert
tage <- as.integer(as.Date(zeit$fuersorge_spaetestens_bis) - as.Date("2024-02-29")) + 1
betrag <- dienst_krankheitskosten_anrechnung("800", as.character(tage * 20), TRUE, TRUE,
  "Synthetisch erforderliche belegte Kosten20EUR je tatsächlichem Fürsorgetag und zugehörige Vergütung800EUR")$wert
stopifnot(tage == 16, identical(zeit$sechswochengrenze, "2024-04-10"))
pruefe_bruch(betrag$angerechnete_kosten, "320")
pruefe_bruch(betrag$verbleibende_verguetung, "480")


nachweis <- "Synthetisch gesetzliche Erbfolge ohne Fristkorrekturen; Erbe stirbt vor ursprünglichem Fristablauf"
zuerst <- erbausschlagung_grundfrist("2030-01-01", "2030-01-01", FALSE, NULL, FALSE, FALSE, TRUE,
  nachweis)$wert$rechnerischer_letzter_tag
danach <- erbausschlagung_grundfrist("2030-02-01", "2030-02-01", FALSE, NULL, FALSE, FALSE, TRUE,
  nachweis)$wert$rechnerischer_letzter_tag
ende <- vererbte_ausschlagungsfrist("2030-02-01", zuerst, danach, TRUE, nachweis)$wert
stopifnot(identical(zuerst, "2030-02-12"), identical(danach, "2030-03-15"), identical(ende, danach))


verweigerung <- untervermaechtnis_verweigerungsbetrag("80", "100", TRUE,
  "Synthetisch A erhält80 und schuldet B aus Untervermächtnis100")$wert
bei_b <- .subtrahieren(.bruch(100), .zahleneingabe(verweigerung))
kuerzung <- vermaechtnis_beschwerungskuerzung("100", .bruchteile(bei_b), "50", "untervermaechtnis_2187",
  FALSE, TRUE, "Synthetisch A übt Verweigerung20 aus; B erhält80 statt100 und darf eigene Beschwerung50 proportional kürzen")$wert
pruefe_bruch(verweigerung, "20")
pruefe_bruch(kuerzung$verbleibensquote, "4", "5")
pruefe_bruch(kuerzung$gekuerzte_beschwerung, "40")
pruefe_bruch(kuerzung$kuerzungsbetrag, "10")


quoten <- testament_erbquoten(list(list(erbe_id = "A", bestimmter_erbteil = "0.25"),
  list(erbe_id = "B", bestimmter_erbteil = "0.5")), FALSE, TRUE,
  "Synthetisch A/B mit festen Quoten und gesetzlichem Rest1/4")$wert
beschwerte <- lapply(quoten$erbquoten, function(e) list(beschwerter_id = e$erbe_id, gewicht = e$erbquote))
lasten <- vermaechtnis_lastenanteile("120", beschwerte, "erben", "vermaechtnis", TRUE,
  "Synthetisch nur A/B mit derselben Last beschwert, gesetzliche Resterben ausdrücklich unbelastet")$wert
pruefe_bruch(quoten$rest_gesetzliche_erbfolge, "1", "4")
pruefe_bruch(lasten[[1]]$lastbetrag, "40")
pruefe_bruch(lasten[[2]]$lastbetrag, "80")
pruefe_bruch(lasten[[1]]$lastquote, "1", "3")
pruefe_bruch(lasten[[2]]$lastquote, "2", "3")


schutz <- pflichtteilsergaenzung_eigenpflichtteilsschutz("100", "50", "20", "40", TRUE,
  "Synthetisch Erbe macht eigenen Schutz70 geltend")$wert
rang <- pflichtteilsergaenzung_beschenktenrang(schutz$verweigerungsbetrag,
  list(list(beschenkter_id = "frueher", schenkungsrang = 1, haftungsgrenze = "20"),
       list(beschenkter_id = "spaeter", schenkungsrang = 2, haftungsgrenze = "3")), TRUE,
  "Synthetisch Erbe insoweit10 nicht verpflichtet; frühere und spätere Schenkung rechtlich geordnet")$wert
pruefe_bruch(schutz$verweigerungsbetrag, "10")
pruefe_bruch(rang$zugeordnete_haftung[[1]]$haftungsbetrag, "7")
pruefe_bruch(rang$zugeordnete_haftung[[2]]$haftungsbetrag, "3")
pruefe_bruch(rang$nicht_gedeckter_fehlbetrag, "0")


for (tag in c("2030-03-01", "2031-02-01")) {
  kurz <- nachlass_dreimonatseinrede("2030-02-01", "2030-01-01", "2030-03-01", tag, FALSE, FALSE,
    "Synthetisch früher Verwaltungspfleger und rechtzeitig errichtetes Inventar")$wert
  aufgebot <- nachlass_aufgebotseinrede("2030-02-01", "2030-01-01", "2030-02-15", "2031-01-01", TRUE, NULL,
    tag, FALSE, FALSE, "Synthetisch rechtzeitig zugelassenes Aufgebot ohne rechtskräftige Beendigung")$wert
  stopifnot(identical(kurz$fristbeginnereignis_am, "2030-01-01"),
    identical(aufgebot$fristbeginnereignis_am, "2030-01-01"),
    identical(kurz$dreimonatsfristende, "2030-04-01"), !kurz$verweigerungsrecht_am_prueftag,
    aufgebot$verweigerungsrecht_am_prueftag)
}
grund <- inventarfrist_grundrahmen("2030-01-31", "2030-01-01", "2030-02-28", TRUE,
  "Synthetisch erstmalige Monatsfrist ab Zustellung nach Annahme")$wert
ehe <- inventarfrist_ehegatten(grund$einmonatsgrenze, "2030-03-31", TRUE, TRUE, TRUE, TRUE,
  "Synthetisch Gesamtgut und gemeinschaftliche Verwaltung, beide Fristen bestimmt, Inventar des anderen wirksam")$wert
stopifnot(grund$bestimmtes_ende_im_sollrahmen, identical(ehe$inventarfristende_erbe, "2030-03-31"),
  ehe$inventar_kommt_erben_zustatten)


ausnahme <- ersitzung_besitzverlust_nichtunterbrechung(
  "2028-01-01", "2030-01-01", "2029-01-01", "2029-06-01", "2028-12-01",
  TRUE, TRUE, "Tatsächliche Rückerlangung mittels rechtzeitig erhobener Klage")$wert
erwerb <- ersitzung_bewegliche_sache(
  "2020-01-01", "2030-01-01", "2030-01-01", NULL, TRUE, TRUE,
  ausnahme$unterbrechung_gilt_als_nicht_erfolgt, TRUE,
  "Sonstiger Besitzverlauf und fehlende Hemmung unabhängig qualifiziert")$wert
stopifnot(!ausnahme$wiedererlangung_binnen_jahresfrist,
  ausnahme$wiedererlangung_durch_rechtzeitige_klage, erwerb$eigentum_durch_ersitzung_erworben)


original <- list(list(erbe_id="A", erbquote="0.5", gemeinschaft_id=NULL),
  list(erbe_id="B", erbquote="0.3", gemeinschaft_id=NULL),
  list(erbe_id="C", erbquote="0.2", gemeinschaft_id=NULL))
ersatz <- ersatzerben_quoten("0.5", lapply(original[2:3], function(e)
  list(erbe_id=e$erbe_id, urspruenglicher_erbteil=e$erbquote, gleicher_gemeinschaftlicher_erbteil=FALSE)),
  TRUE, TRUE, "Wirksam berufene gegenseitige Ersatzerben B und C")
stopifnot(identical(ersatz$wert$ersatzerbquoten[[1]]$zusaetzlicher_erbteil, list(zaehler="3", nenner="10")))
anwachsung <- erbteil_anwachsungsquoten(original, "A", TRUE, FALSE, ersatz$status == "BERECHNET",
  "Derselbe Wegfall wird bereits durch Ersatzerben aufgefangen")$wert
stopifnot(!anwachsung$anwachsung_erfolgt,
  all(vapply(anwachsung$erbteile, function(e) identical(e$angewachsener_erbteil, list(zaehler="0", nenner="1")), logical(1))))
bewertung <- pflichtteil_schenkungswert("100", "80", FALSE, FALSE,
  "Vergleichbare Werte, keine Pflicht- oder Anstandsschenkung")$wert
zuordnung <- gesamtgutszuwendung_anteile(bewertung, "keine", "keine", TRUE,
  "Gemeinsames Gesamtgut ohne Sonderzuordnung")$wert
ergaenzung <- pflichtteilsergaenzung_grundbetrag("200", zuordnung$betrag_ehegatte_1, 1, 2, TRUE,
  "Erbfall des ersten Ehegatten; qualifizierte Drittschenkung im ersten Jahr, keine weiteren Anrechnungen")$wert
stopifnot(identical(zuordnung$betrag_ehegatte_1, list(zaehler="40", nenner="1")),
  identical(ergaenzung$ergaenzungsgrundbetrag, list(zaehler="10", nenner="1")))


nacherbe <- nacherbeneinsetzung_dreissigjahresgrenze("2000-01-01", "2031-01-01", NULL,
  "personenereignis", TRUE, FALSE,
  "Vorerbe bei Erbfall lebend; Nacherbfolge auf dessen noch nicht eingetretenen Tod angeordnet")$wert
sonstige_voraussetzungen_geprueft <- TRUE
qualifiziert <- sonstige_voraussetzungen_geprueft && !nacherbe$unwirksam_wegen_dreissigjahresgrenze
ohne <- erbauseinandersetzung_dreissigjahresgrenze("2000-01-01", "2031-01-01", "keine", NULL,
  FALSE, qualifiziert, "Wirksamer Teilungsausschluss ohne besonderen Fortdauerendpunkt")$wert
mit <- erbauseinandersetzung_dreissigjahresgrenze("2000-01-01", "2031-01-01", "nacherbfolge", NULL,
  FALSE, qualifiziert, "Wirksamer Teilungsausschluss ausdrücklich bis zur separat qualifizierten Nacherbfolge")$wert
stopifnot(qualifiziert, ohne$zeitliche_wirkung_beendet, !mit$zeitliche_wirkung_beendet)


# Normbezogene Wiederverwendung vorhandener Zahlen-/Kalenderkerne.
sechzehn <- lebensalter_beginn("2012-02-29", 16)$wert
achtzehn <- volljaehrigkeitsbeginn("2012-02-29")$wert
stopifnot(sechzehn == "2028-02-29", achtzehn == "2030-03-01", "2030-02-28" < achtzehn)
quoten <- abkoemmlings_erbquoten(list(knoten("A"), knoten("B")), 1, 1)$wert
quote <- quoten$erbquoten[[1]]$quote
betrag <- pflichtteil_betrag("120", as.numeric(quote$zaehler), as.numeric(quote$nenner), "0", FALSE, TRUE,
  "§2310: B enterbt, C wirksam verzichtend und kinderlos; kein Ehegatte, keine Ausgleichung")$wert
pruefe_bruch(quote, "1", "2")
pruefe_bruch(betrag, "30")
ehe <- ehegatten_erbquote("erste_ordnung", "zugewinngemeinschaft", 2, 0, 1, TRUE, FALSE, FALSE, FALSE, FALSE)$wert
anteil <- ehe$verwandtenquote
kinder <- abkoemmlings_erbquoten(list(knoten("vorhandenes_kind"), knoten("erwartetes_einzelkind")),
  as.numeric(anteil$zaehler), as.numeric(anteil$nenner))$wert
pruefe_bruch(ehe$ehegattenquote, "1", "2")
for (k in kinder$erbquoten) pruefe_bruch(k$quote, "1", "4")
zins <- gesetzliche_zinsen("1200", 1, 2,
  "§2218 i.V.m.§668: bestimmungswidrig verwendetes Geld; qualifiziertes halbes Zinsjahr", FALSE)$wert
pruefe_bruch(zins, "24")
beginn <- max(c("2030-01-01", "2030-01-10", "2030-02-01"))
stopifnot(fristende(beginn, 6, "wochen", "ereignis")$wert == "2030-03-15")
jahresende <- fristende("2029-07-01", 1, "jahre", "ereignis")$wert
frist <- testament_anfechtungsfrist("2000-01-01", "2029-07-01", jahresende, "2030-01-01", TRUE,
  "§2340III/§2345: entsprechende2082-Zeitgrenzen; Anfall und Kenntnis qualifiziert, keine Hemmung")$wert
stopifnot(frist$massgebliche_kalendergrenze == "2030-01-01", frist$anfechtung_fristgerecht)
cat("45 native R-Kompositions-/Normanwendungsfälle bestanden\n")
