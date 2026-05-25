Gestioni delle reactions dell'immagine
- like
- dislike
- cuori
- rabbia
- splendore
- applausi

reazioni: [
    {
        "tipo":"like",
        "persone": [
            {
                "email":"i.fabbri@webbare.it",
                "dataOra":"2026-05-20T13:20:56Z"
            }
        ]
    },
    {
        "tipo":"dislike",
        "persone": []
    },
    {
        "tipo":"cuori",
        "persone": []
    },
    {
        "tipo":"rabbia",
        "persone": []
    },
    {
        "tipo":"splendore",
        "persone": []
    },
    ,
    {
        "tipo":"applausi",
        "persone": []
    }
]

PUT 
v1/immagini/reazioni
{
    id: "id immagine",
    tipo: "applausi / like ecc"
}
La rotta rest:
1) testa l'access token
2) prende l'utente corrente
3) prende l'immagine
4) testa che l'immagine sia visibile
5) toglie dal campo reazioni tutti i record con persona.email = alla mia email, la mia email è in $items("UtenteCorrente")[0].json.email 
6) se tipo passato nel body != "" (is not empty) allora individua la reazione con tipo = body.tipo e aggiunge il record persona in persone : {
    email: mia email,
    dataOra: new Date().toISOString()
}
7) salva su mongodb il nuovo campo reazioni
8) ritorna il record immagine aggiornato
----
9) modificare l'aggregate dell'immagine e del feed per prendere nome e cognome di TUTTE le persone in tutte le reazioni

