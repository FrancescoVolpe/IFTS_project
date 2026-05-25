GET

v1/immagini/tags_colori

param
?autore=....

ritorna
{
    tags:[],
    colori:[]
}

ritorna l'elenco dei tags in ordine alfabetico e l'elenco dei colori in ordine alfabetico. Se è stato passato l'autore, deve ritornare i tags e i colori utilizzati dall'autore

1) check access token
2) get utente corrente
3) ritorno aggregate mongodb sulle immagini filtrato per autore se è passato (deve ritornare sempre un output)