API POST NEW USER + Contratto

{
    "email":"string",
    "password":"string",
    "firstName":"string",
    "lastName":"string"
}

URL: POST /v1/users/signup

CODICI RITORNO
201 = CREATED
400 = BAD REQUEST -> errore nel json
{
  "status": "error",
  "errorCode" : "ERR003",
  "message" : "Email non valida"
}


500 = INTERNAL ERROR SERVER


--------------------------------------


