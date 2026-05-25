PUT
body: {
    id:"",
    stato:""
}

Come funziona l'API
1) controllo access token
2) controllo e recupero utente
3) recupera immagine
4) controllo che l'autore dell'immagine sia uguale all'utente corrente
5) preparo il record per cambiare lo stato. Stati ammessi: visibile, bozza, cancellata
6) nella preparazione del record di modifica inserire anche dataModifica:new Date().toISODate() 
6) aggiorno mongodb, chiave _id, campi stato e dataModifica
7) ritorno record immagine modificata