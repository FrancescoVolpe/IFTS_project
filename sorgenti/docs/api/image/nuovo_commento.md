POST

/v1/immagini/commento

body
{
    id:"id immagine",
    idCommento:"id commento/vuoto",
    commento:"base64"
}

mongo db il commento è dentro l'immagine
{
    idCommento: "unid universale",
    email:"l'email di chi ha fatto il commendo",
    dtCreazione:"data / ora",
    stato: "visibile / cancellato"
    commento: "",
    commenti: []
}