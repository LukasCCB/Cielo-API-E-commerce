---
updatedAt: 2026-04-10T13:05:56.000Z
agentTools:
  siteIndex: https://docs.cielo.com.br/llms.txt
  projectIndex: https://docs.cielo.com.br/ecommerce-cielo/llms.txt
---

# Códigos HTTP

O código HTTP, presente no cabeçalho (header) de toda resposta, indica o status da comunicação entre o seu sistema e a API E-commerce.

## Respostas de sucesso (2xx)

| Código HTTP     | Descrição                                                 | Cenário de exemplo                                                                                    |
| --------------- | --------------------------------------------------------- | ----------------------------------------------------------------------------------------------------- |
| **200 OK**      | A sua solicitação foi recebida e processada com sucesso.  | Retornado em operações de consulta (GET), captura (PUT) e cancelamento (PUT).                         |
| **201 Created** | A sua solicitação para criar um recurso foi bem-sucedida. | Retornado na criação de uma transação de pagamento (POST /1/sales), para todos os meios de pagamento. |

**Exemplos de respostas para transação de cartão de crédito**:

```json 201 OK - Autorizada
{
  (...)
  "Payment": {
    (...)
    "Status": 1,
    "ReturnMessage": "Operation Successful",
    "ReturnCode": "4",
  }
}
```
```json 201 OK - Negada
{
  (...)
  "Payment": {
    (...)
    "Status": 3,
    "ReturnMessage": "Autorizacao negada",
    "ReturnCode": "51",
  }
}
```

## Respostas de Erro do Cliente (4xx)

Indicam um problema com a sua requisição. Geralmente, é necessário corrigir o erro antes de reenviar a mesma requisição.

| Código HTTP                | Descrição                                                                                                   | Cenário de Exemplo                                                                                                                                               | Corpo da Resposta                                                    |
| -------------------------- | ----------------------------------------------------------------------------------------------------------- | ---------------------------------------------------------------------------------------------------------------------------------------------------------------- | -------------------------------------------------------------------- |
| **400 Bad Request**        | A requisição está mal formatada ou contém dados inválidos.                                                  | Erro de sintaxe no JSON enviado; `PaymentId` inválido em uma consulta.                                                                                           | Geralmente contém os campos `Code` e `Message` com detalhes do erro. |
| **401 Unauthorized**       | Erro de autenticação. As credenciais (`MerchantId` e `MerchantKey`) estão incorretas ou não foram enviadas. | Enviar um `MerchantId` ou `MerchantKey` incorreto no header.                                                                                                     | Não retorna corpo (body).                                            |
| **403 Forbidden**          | Acesso negado.                                                                                              | O IP de origem da requisição não está na [lista de IPs autorizados no site Cielo](https://docs.cielo.com.br/ecommerce-cielo/docs/configura%C3%A7%C3%A3o-de-ips). | Não retorna corpo (body).                                            |
| **404 Not Found**          | O recurso solicitado não foi encontrado.                                                                    | Endpoint incorreto; consulta a um `PaymentId` que não existe ou pertence a outra loja; consulta a um `PaymentId` superior à três meses.                          | Não retorna corpo (body).                                            |
| **405 Method Not Allowed** | O método HTTP (GET, POST, PUT) usado é incorreto para o endpoint.                                           | Usar GET no endpoint de criação de transação (/1/sales), que espera POST.                                                                                        | Não retorna corpo (body).                                            |

**Exemplo de erro HTTP 400 (Bad Request)**:

Erros HTTP 400 (Bad Request) geralmente contém os campos `Code` e `Message` no corpo (body):

```json
[
  {
    "Code": 132,
    "Message": "MerchantKey is invalid"
  }
]
```

`Code` representa o código de erro, equivalente ao `ReturnCode`, e `Message` representa a mensagem correspondente ao erro, equivalente ao `ReturnMessage`.

> Confira os códigos retornados em `Code` e `Message` em [Tabela de `ReturnCode` e `ReturnMessage`]().

## Respostas de erro do servidor (5xx)

Indicam uma falha interna nos servidores da Cielo, da bandeira ou emissor, a indisponibilidade de algum meio de pagamento ou lentidão. Nestes casos, é recomendado aguardar e, se o erro persistir, contatar o suporte.

| Código HTTP                   | Descrição                                                                               |
| ----------------------------- | --------------------------------------------------------------------------------------- |
| **500 Internal Server Error** | Ocorreu um erro inesperado no servidor.                                                 |
| **502 Bad Gateway**           | O servidor que atua como gateway recebeu uma resposta inválida de um servidor upstream. |
| **503 Service Unavailable**   | O servidor não está pronto para lidar com a requisição (ex: sobrecarga ou manutenção).  |

> Consulte a página de [status das APIs](https://status.cielo.com.br/) para verificar a disponibilidade do serviço.