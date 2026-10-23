# Interner Rechenkern; validierte exakte Werte. Keine rechtliche Quotenauswahl.
.begrenzte_quotenverteilung <- function(fehl,quoten,grenzen) {
 zugeordnet <- lapply(quoten,function(x) .bruch(0)); aktiv <- which(vapply(quoten,function(x) .vergleichen(x,.bruch(0))>0,logical(1))); rest <- fehl
 while(.vergleichen(rest,.bruch(0))>0 && length(aktiv)>0) {
  anteilssumme <- .bruch(0)
  for(i in aktiv) anteilssumme <- .addieren(anteilssumme,quoten[[i]])
  vorschlag <- lapply(aktiv,function(i) .multiplizieren(rest,.dividieren(quoten[[i]],anteilssumme)))
  begrenzt <- aktiv[vapply(seq_along(aktiv),function(j) .vergleichen(grenzen[[aktiv[j]]],vorschlag[[j]])<0,logical(1))]
  if(length(begrenzt)==0) {
   for(j in seq_along(aktiv)) zugeordnet[[aktiv[j]]] <- vorschlag[[j]]
   rest <- .bruch(0)
  } else {
   for(i in begrenzt) { zugeordnet[[i]] <- grenzen[[i]]; rest <- .subtrahieren(rest,grenzen[[i]]) }
   aktiv <- aktiv[!aktiv %in% begrenzt]
  }
 }
 list(zugeordnet=zugeordnet,rest=rest)
}
