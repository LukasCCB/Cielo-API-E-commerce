---
updatedAt: 2026-10-05T20:39:16.000Z
agentTools:
  siteIndex: https://docs.cielo.com.br/llms.txt
  projectIndex: https://docs.cielo.com.br/ecommerce-cielo/llms.txt
---

# Cancelar transação de crédito via PaymentId

Cancela o valor total ou parcial de uma transação de crédito informando o `PaymentId`

<Table align={["left","left","left"]}>
  <thead>
    <tr>
      <th>
        Ambiente
      </th>

      <th>
        Método
      </th>

      <th>
        Endpoint
      </th>
    </tr>
  </thead>

  <tbody>
    <tr>
      <td>
        Sandbox
      </td>

      <td>
        <div class="headline-container-article-info2GaOf2jMpV0r">
          <span class="rm-APIMethod APIMethod APIMethod_fixedWidth APIMethod_put headline-container-api-method1Hc-Fm7uaccR" data-testid="http-method">put</span>
        </div>
      </td>

      <td>
        `https://apisandbox.cieloecommerce.cielo.com.br/1/sales/{PaymentId}/void?amount={Amount}`
      </td>
    </tr>

    <tr>
      <td>
        Produção
      </td>

      <td>
        <div class="headline-container-article-info2GaOf2jMpV0r">
          <span class="rm-APIMethod APIMethod APIMethod_fixedWidth APIMethod_put headline-container-api-method1Hc-Fm7uaccR" data-testid="http-method">put</span>
        </div>
      </td>

      <td>
        `https://api.cieloecommerce.cielo.com.br/1/sales/{PaymentId}/void?amount={Amount}`
      </td>
    </tr>
  </tbody>
</Table>

Consulte os [Códigos de retorno de cancelamento.](https://docs.cielo.com.br/ecommerce-cielo/reference/codigos-retorno-cancelamento)

<Callout icon="⚠️" theme="warn">
  ### Não é possível estornar parcialmente uma transação não capturada.

  Para fazer um cancelamento parcial, o campo `Capture` deve ser "true" na <a href="https://docs.cielo.com.br/ecommerce-cielo/reference/criar-pagamento-credito" target="_blank">criação do pagamento com cartão de crédito</a>.
</Callout>

<br />

<Callout icon="ℹ️" theme="info">
  ### Cancelamento parcial

  Pode ocorrer inúmeras vezes, até que o valor total da transação seja cancelada.
</Callout>

<br />

<Callout icon="⚠️" theme="warn">
  ### Novo campo obrigatório para cancelamento de transações por risco de fraude

  A partir de 17/04/2026, será obrigatório informar o campo `Reason` quando o motivo do cancelamento for **risco de fraude** identificado pelo estabelecimento.

  Informe `Reason`= "HighRisk" no corpo da requisição, conforme exemplo:

  ```json
  {
      "Reason": "HighRisk"
  }
  ```
</Callout>

<br />

<br />

# OpenAPI definition

```json
{
  "openapi": "3.1.0",
  "info": {
    "title": "cartão-de-crédito",
    "version": "3.0"
  },
  "servers": [
    {
      "url": "https://apisandbox.cieloecommerce.cielo.com.br"
    }
  ],
  "security": [
    {}
  ],
  "paths": {
    "/1/sales/{PaymentId}/void": {
      "put": {
        "summary": "Cancelar transação de crédito via PaymentId",
        "description": "Cancela o valor total ou parcial de uma transação de crédito informando o `PaymentId`",
        "operationId": "cancelamento-paymentid",
        "parameters": [
          {
            "name": "PaymentId",
            "in": "path",
            "description": "Número de identificação do pagamento, retornado pela API na criação do pagamento de cartão de crédito. Tamanho: 36.",
            "required": true,
            "schema": {
              "type": "string"
            }
          },
          {
            "name": "Amount",
            "in": "query",
            "description": "Valor do Pedido (ser enviado em centavos). Tamanho: 15.",
            "schema": {
              "type": "integer",
              "format": "int32"
            }
          },
          {
            "name": "MerchantId",
            "in": "header",
            "description": "Identificador da loja na Cielo. Tamanho: 36. Formato: GUID. <br>*Esta documentação traz um `MerchantId` padrão para permitir os testes em sandbox, mas você também pode informar o `MerchantId` habilitado durante o processo de implantação.*",
            "required": true,
            "schema": {
              "type": "string",
              "default": "8937bd5b-9796-494d-9fe5-f76b3e4da633"
            }
          },
          {
            "name": "MerchantKey",
            "in": "header",
            "description": "Chave pública para autenticação dupla na Cielo. Tamanho: 40. Formato: GUID. <br>*Esta documentação traz um `MerchantKey` padrão para permitir os testes em sandbox, mas você também pode informar o `MerchantKey` habilitado durante o processo de implantação.*",
            "required": true,
            "schema": {
              "type": "string",
              "default": "XKGHUBSBKIRXKAVPSKWLVXYCLVJUGTNZLIHPUSYV"
            }
          },
          {
            "name": "RequestId",
            "in": "header",
            "description": "Identificador do Request, utilizado quando o lojista usa diferentes servidores para cada GET/POST/PUT. Tamanho: 36.",
            "schema": {
              "type": "string"
            }
          }
        ],
        "responses": {
          "200": {
            "description": "200",
            "content": {
              "application/json": {
                "examples": {
                  "Result": {
                    "value": "{\n  \"Status\": 10,\n  \"Tid\": \"0719094510712\",\n  \"ProofOfSale\": \"4510712\",\n  \"AuthorizationCode\": \"693066\",\n  \"ReturnCode\": \"9\",\n  \"ReturnMessage\": \"Operation Successful\",\n  \"Links\": [\n    {\n      \"Method\": \"GET\",\n      \"Rel\": \"self\",\n      \"Href\": \"https://apiquerysandbox.cieloecommerce.cielo.com.br/1/sales/{PaymentId}\"\n    }\n  ]\n}"
                  }
                },
                "schema": {
                  "type": "object",
                  "properties": {
                    "Status": {
                      "type": "integer",
                      "example": 10,
                      "default": 0
                    },
                    "Tid": {
                      "type": "string",
                      "example": "0719094510712"
                    },
                    "ProofOfSale": {
                      "type": "string",
                      "example": "4510712"
                    },
                    "AuthorizationCode": {
                      "type": "string",
                      "example": "693066"
                    },
                    "ReturnCode": {
                      "type": "string",
                      "example": "9"
                    },
                    "ReturnMessage": {
                      "type": "string",
                      "example": "Operation Successful"
                    },
                    "Links": {
                      "type": "array",
                      "items": {
                        "type": "object",
                        "properties": {
                          "Method": {
                            "type": "string",
                            "example": "GET"
                          },
                          "Rel": {
                            "type": "string",
                            "example": "self"
                          },
                          "Href": {
                            "type": "string",
                            "example": "https://apiquerysandbox.cieloecommerce.cielo.com.br/1/sales/{PaymentId}"
                          }
                        }
                      }
                    }
                  }
                }
              }
            }
          }
        },
        "requestBody": {
          "content": {
            "application/json": {
              "schema": {
                "type": "object",
                "properties": {
                  "Reason": {
                    "type": "string",
                    "default": "",
                    "description": "Indica que a transação foi cancelada por risco de fraude identificado pelo estabelecimento. Valor possível: \"HighRisk\". Tamanho: 8. <br/>**Obrigatório caso a transação seja cancelada porque há risco de fraude**. <br/> *Válido para cancelamento total ou parcial*.<br/>**ATENÇÃO: Este parâmetro estará funcional a partir de 17/04/2026**."
                  }
                }
              },
              "examples": {
                "Risco de fraude": {
                  "summary": "Risco de fraude",
                  "value": {
                    "Reason": "HighRisk"
                  }
                }
              }
            }
          }
        }
      }
    }
  },
  "x-readme": {
    "headers": [],
    "explorer-enabled": true,
    "proxy-enabled": true
  },
  "x-readme-fauxas": true
}
```