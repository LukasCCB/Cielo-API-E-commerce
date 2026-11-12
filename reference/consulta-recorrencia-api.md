---
updatedAt: 2025-10-30T01:18:41.000Z
agentTools:
  siteIndex: https://docs.cielo.com.br/llms.txt
  projectIndex: https://docs.cielo.com.br/ecommerce-cielo/llms.txt
---

# Consultar recorrência

Consulta uma transação recorrente informando o `RecurrentPaymentId`

<Table align={["left","left","left"]}>
  <thead>
    <tr>
      <th style={{ textAlign: "left" }}>
        Ambiente
      </th>

      <th style={{ textAlign: "left" }}>
        Método
      </th>

      <th style={{ textAlign: "left" }}>
        Endpoint
      </th>
    </tr>
  </thead>

  <tbody>
    <tr>
      <td style={{ textAlign: "left" }}>
        Sandbox
      </td>

      <td style={{ textAlign: "left" }}>
        <div className="headline-container-article-info2GaOf2jMpV0r">
          <span className="rm-APIMethod APIMethod APIMethod_fixedWidth APIMethod_get headline-container-api-method1Hc-Fm7uaccR" data-testid="http-method">get</span>
        </div>
      </td>

      <td style={{ textAlign: "left" }}>
        `https://apiquerysandbox.cieloecommerce.cielo.com.br/1/RecurrentPayment/{RecurrentPaymentId}`
      </td>
    </tr>

    <tr>
      <td style={{ textAlign: "left" }}>
        Produção
      </td>

      <td style={{ textAlign: "left" }}>
        <div className="headline-container-article-info2GaOf2jMpV0r">
          <span className="rm-APIMethod APIMethod APIMethod_fixedWidth APIMethod_get headline-container-api-method1Hc-Fm7uaccR" data-testid="http-method">get</span>
        </div>
      </td>

      <td style={{ textAlign: "left" }}>
        `https://apiquery.cieloecommerce.cielo.com.br/1/RecurrentPayment/{RecurrentPaymentId}`
      </td>
    </tr>
  </tbody>
</Table>

<br />

> ℹ️
>
> Saiba mais sobre essa funcionalidade <a href="https://docs.cielo.com.br/ecommerce-cielo/docs/consulta" target="_blank">na documentação</a>.

> ℹ️
>
> Apenas as transações dentro dos últimos três meses podem ser consultadas via API.

* O `RecurrentPaymentId` é a identificação do pedido recorrente retornado na criação do pagamento com recorrência;
* A consulta por `RecurrentPaymentId` irá retornar todos os detalhes da transação recorrente.

## Resposta da consulta de pedido recorrente

A tabela a seguir apresenta os principais parâmetros que podem ser retornados pela API na consulta de um pedido recorrente.

| **Propriedade**         | **Descrição**                                                                   | **Tipo** | **Tamanho** |
| ----------------------- | ------------------------------------------------------------------------------- | -------- | ----------- |
| `Installments`          | Número de parcelas.                                                             | intenger | 2           |
| `RecurrentPaymentId`    | ID que representa a recorrência, utilizada para consultas e alterações futuras. | string   | 36          |
| `NextRecurrency`        | Data de quando acontecerá a próxima recorrência.                                | string   | 10          |
| `StartDate`             | Data para início da recorrência.                                                | string   | 10          |
| `EndDate`               | Data do fim da recorrência.                                                     | string   | 10          |
| `Interval`              | Intervalo entre as recorrências.                                                | string   | 10          |
| `CurrentRecurrencyTry`  | Número atual da tentativa de recorrência.                                       | integer  | 1           |
| `RecurrencyDay`         | Dia da recorrência.                                                             | integer  | 2           |
| `SuccessfulRecurrences` | Quantidade de recorrências realizadas com sucesso.                              | integer  | 2           |

# OpenAPI definition

```json
{
  "openapi": "3.1.0",
  "info": {
    "title": "consultas",
    "version": "3.0"
  },
  "servers": [
    {
      "url": "https://apiquerysandbox.cieloecommerce.cielo.com.br"
    }
  ],
  "security": [
    {}
  ],
  "paths": {
    "/1/RecurrentPayment/{RecurrentPaymentId}": {
      "get": {
        "summary": "Consultar recorrência",
        "description": "Consulta uma transação recorrente informando o `RecurrentPaymentId`",
        "operationId": "consulta-recorrencia-api",
        "parameters": [
          {
            "name": "RecurrentPaymentId",
            "in": "path",
            "description": "Campo Identificador da Recorrência. Tamanho: 36.",
            "schema": {
              "type": "string"
            },
            "required": true
          },
          {
            "name": "Content-Type",
            "in": "header",
            "required": true,
            "schema": {
              "type": "string",
              "default": "application/json"
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
                    "value": "{\n  \"Customer\": {\n    \"Name\": \"Fulano da Silva\"\n  },\n  \"RecurrentPayment\": {\n    \"RecurrentPaymentId\": \"c30f5c78-fca2-459c-9f3c-9c4b41b09048\",\n    \"NextRecurrency\": \"2017-06-07\",\n    \"StartDate\": \"2017-04-07\",\n    \"EndDate\": \"2017-02-27\",\n    \"Interval\": \"Bimonthly\",\n    \"Amount\": 15000,\n    \"Country\": \"BRA\",\n    \"CreateDate\": \"2017-04-07T00:00:00\",\n    \"Currency\": \"BRL\",\n    \"CurrentRecurrencyTry\": 1,\n    \"Provider\": \"Simulado\",\n    \"RecurrencyDay\": 7,\n    \"SuccessfulRecurrences\": 0,\n    \"Links\": [\n      {\n        \"Method\": \"GET\",\n        \"Rel\": \"self\",\n        \"Href\": \"https://apiquerysandbox.cieloecommerce.cielo.com.br/1/RecurrentPayment/c30f5c78-fca2-459c-9f3c-9c4b41b09048\"\n      }\n    ],\n    \"RecurrentTransactions\": [\n      {\n        \"PaymentId\": \"f70948a8-f1dd-4b93-a4ad-90428bcbdb84\",\n        \"PaymentNumber\": 0,\n        \"TryNumber\": 1\n      }\n    ],\n    \"Status\": 1\n  }\n}"
                  }
                },
                "schema": {
                  "type": "object",
                  "properties": {
                    "Customer": {
                      "type": "object",
                      "properties": {
                        "Name": {
                          "type": "string",
                          "example": "Fulano da Silva"
                        }
                      }
                    },
                    "RecurrentPayment": {
                      "type": "object",
                      "properties": {
                        "RecurrentPaymentId": {
                          "type": "string",
                          "example": "c30f5c78-fca2-459c-9f3c-9c4b41b09048"
                        },
                        "NextRecurrency": {
                          "type": "string",
                          "example": "2017-06-07"
                        },
                        "StartDate": {
                          "type": "string",
                          "example": "2017-04-07"
                        },
                        "EndDate": {
                          "type": "string",
                          "example": "2017-02-27"
                        },
                        "Interval": {
                          "type": "string",
                          "example": "Bimonthly"
                        },
                        "Amount": {
                          "type": "integer",
                          "example": 15000,
                          "default": 0
                        },
                        "Country": {
                          "type": "string",
                          "example": "BRA"
                        },
                        "CreateDate": {
                          "type": "string",
                          "example": "2017-04-07T00:00:00"
                        },
                        "Currency": {
                          "type": "string",
                          "example": "BRL"
                        },
                        "CurrentRecurrencyTry": {
                          "type": "integer",
                          "example": 1,
                          "default": 0
                        },
                        "Provider": {
                          "type": "string",
                          "example": "Simulado"
                        },
                        "RecurrencyDay": {
                          "type": "integer",
                          "example": 7,
                          "default": 0
                        },
                        "SuccessfulRecurrences": {
                          "type": "integer",
                          "example": 0,
                          "default": 0
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
                                "example": "https://apiquerysandbox.cieloecommerce.cielo.com.br/1/RecurrentPayment/c30f5c78-fca2-459c-9f3c-9c4b41b09048"
                              }
                            }
                          }
                        },
                        "RecurrentTransactions": {
                          "type": "array",
                          "items": {
                            "type": "object",
                            "properties": {
                              "PaymentId": {
                                "type": "string",
                                "example": "f70948a8-f1dd-4b93-a4ad-90428bcbdb84"
                              },
                              "PaymentNumber": {
                                "type": "integer",
                                "example": 0,
                                "default": 0
                              },
                              "TryNumber": {
                                "type": "integer",
                                "example": 1,
                                "default": 0
                              }
                            }
                          }
                        },
                        "Status": {
                          "type": "integer",
                          "example": 1,
                          "default": 0
                        }
                      }
                    }
                  }
                }
              }
            }
          }
        },
        "deprecated": false
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