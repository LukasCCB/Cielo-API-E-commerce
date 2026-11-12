---
updatedAt: 2025-10-30T01:18:18.000Z
agentTools:
  siteIndex: https://docs.cielo.com.br/llms.txt
  projectIndex: https://docs.cielo.com.br/ecommerce-cielo/llms.txt
---

# Consultar por Tid

Consulta uma transação informando o `Tid` (Transaction Id)

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
        <div class="headline-container-article-info2GaOf2jMpV0r">
          <span class="rm-APIMethod APIMethod APIMethod_fixedWidth APIMethod_get headline-container-api-method1Hc-Fm7uaccR" data-testid="http-method">get</span>
        </div>
      </td>

      <td style={{ textAlign: "left" }}>
        `https://apiquerysandbox.cieloecommerce.cielo.com.br/1/sales/{AcquirerOrderId}/{Tid}`
      </td>
    </tr>

    <tr>
      <td style={{ textAlign: "left" }}>
        Produção
      </td>

      <td style={{ textAlign: "left" }}>
        <div class="headline-container-article-info2GaOf2jMpV0r">
          <span class="rm-APIMethod APIMethod APIMethod_fixedWidth APIMethod_get headline-container-api-method1Hc-Fm7uaccR" data-testid="http-method">get</span>
        </div>
      </td>

      <td style={{ textAlign: "left" }}>
        `https://apiquery.cieloecommerce.cielo.com.br/1/sales/{AcquirerOrderId}/{Tid}`
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

<br />

* O `Tid` é o número de referência único da transação na adquirente;
* A consulta por `Tid` irá retornar todas as informações da transação, como dados do comprador, dados de pagamento e outras informações que foram enviadas e/ou retornadas na criação do pagamento.

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
    "/1/sales/{AcquirerOrderId}/{Tid}": {
      "get": {
        "summary": "Consultar por Tid",
        "description": "Consulta uma transação informando o `Tid` (Transaction Id)",
        "operationId": "consulta-tid-api",
        "parameters": [
          {
            "name": "Tid",
            "in": "path",
            "description": "Número de identificação do pagamento na adquirente. Tamanho: 36.",
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
            "name": "AcquirerOrderId",
            "in": "path",
            "description": "Id da transação enviado ao autorizador, caso o `MerchantOrderId` seja maior que 20 caracteres ou tenha símbolos. Tamanho: 50.<br> *Ele pode ser obtido na resposta da consulta por `PaymentId`*",
            "required": true,
            "schema": {
              "type": "string"
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
                    "value": "{\n  \"MerchantOrderId\": \"8887655681\",\n  \"Customer\": {\n    \"Name\": \"Aline de Souza\",\n    \"Address\": {}\n  },\n  \"Payment\": {\n    \"ServiceTaxAmount\": 0,\n    \"Installments\": 1,\n    \"Interest\": \"ByMerchant\",\n    \"Capture\": false,\n    \"Authenticate\": true,\n    \"Recurrent\": false,\n    \"CreditCard\": {\n      \"CardNumber\": \"40916******7641\",\n      \"Holder\": \"Aline de Souza\",\n      \"ExpirationDate\": \"12/35\",\n      \"Brand\": \"Visa\",\n      \"PaymentAccountReference\": \"BZ8YRUFRW6Z4VPKYI0MF8V8IZBNIK\"\n    },\n    \"ProofOfSale\": \"762232\",\n    \"Tid\": \"071112571096\",\n    \"AuthorizationCode\": \"207324\",\n    \"PaymentId\": \"3b09ebae-be98-8e4p-96e5-57a4374e21b1\",\n    \"Type\": \"CreditCard\",\n    \"Amount\": 13599,\n    \"ReceivedDate\": \"2025-07-11 12:57:15\",\n    \"Currency\": \"BRL\",\n    \"Country\": \"BRA\",\n    \"Provider\": \"Simulado\",\n    \"Status\": 1,\n    \"Links\": [\n      {\n        \"Method\": \"GET\",\n        \"Rel\": \"self\",\n        \"Href\": \"https://apiquerysandbox.cieloecommerce.cielo.com.br/1/sales/3b09ebae-be98-4d8e-96e5-57a4374e21b1\"\n      },\n      {\n        \"Method\": \"PUT\",\n        \"Rel\": \"capture\",\n        \"Href\": \"https://apisandbox.cieloecommerce.cielo.com.br/1/sales/3b09ebae-be98-4d8e-96e5-57a4374e21b1/capture\"\n      },\n      {\n        \"Method\": \"PUT\",\n        \"Rel\": \"void\",\n        \"Href\": \"https://apisandbox.cieloecommerce.cielo.com.br/1/sales/3b09ebae-be98-4d8e-96e5-57a4374e21b1/void\"\n      }\n    ]\n  },\n  \"Merchant\": {\n    \"Id\": \"8937bd5b-4535-878r-9fe5-f76b3e4da633\",\n    \"TradeName\": \"Floricultura\"\n  }\n}"
                  }
                },
                "schema": {
                  "type": "object",
                  "properties": {
                    "MerchantOrderId": {
                      "type": "string",
                      "example": "8887655681"
                    },
                    "Customer": {
                      "type": "object",
                      "properties": {
                        "Name": {
                          "type": "string",
                          "example": "Aline de Souza"
                        },
                        "Address": {
                          "type": "object",
                          "properties": {}
                        }
                      }
                    },
                    "Payment": {
                      "type": "object",
                      "properties": {
                        "ServiceTaxAmount": {
                          "type": "integer",
                          "example": 0,
                          "default": 0
                        },
                        "Installments": {
                          "type": "integer",
                          "example": 1,
                          "default": 0
                        },
                        "Interest": {
                          "type": "string",
                          "example": "ByMerchant"
                        },
                        "Capture": {
                          "type": "boolean",
                          "example": false,
                          "default": true
                        },
                        "Authenticate": {
                          "type": "boolean",
                          "example": true,
                          "default": true
                        },
                        "Recurrent": {
                          "type": "boolean",
                          "example": false,
                          "default": true
                        },
                        "CreditCard": {
                          "type": "object",
                          "properties": {
                            "CardNumber": {
                              "type": "string",
                              "example": "40916******7641"
                            },
                            "Holder": {
                              "type": "string",
                              "example": "Aline de Souza"
                            },
                            "ExpirationDate": {
                              "type": "string",
                              "example": "12/35"
                            },
                            "Brand": {
                              "type": "string",
                              "example": "Visa"
                            },
                            "PaymentAccountReference": {
                              "type": "string",
                              "example": "BZ8YRUFRW6Z4VPKYI0MF8V8IZBNIK"
                            }
                          }
                        },
                        "ProofOfSale": {
                          "type": "string",
                          "example": "762232"
                        },
                        "Tid": {
                          "type": "string",
                          "example": "071112571096"
                        },
                        "AuthorizationCode": {
                          "type": "string",
                          "example": "207324"
                        },
                        "PaymentId": {
                          "type": "string",
                          "example": "3b09ebae-be98-8e4p-96e5-57a4374e21b1"
                        },
                        "Type": {
                          "type": "string",
                          "example": "CreditCard"
                        },
                        "Amount": {
                          "type": "integer",
                          "example": 13599,
                          "default": 0
                        },
                        "ReceivedDate": {
                          "type": "string",
                          "example": "2025-07-11 12:57:15"
                        },
                        "Currency": {
                          "type": "string",
                          "example": "BRL"
                        },
                        "Country": {
                          "type": "string",
                          "example": "BRA"
                        },
                        "Provider": {
                          "type": "string",
                          "example": "Simulado"
                        },
                        "Status": {
                          "type": "integer",
                          "example": 1,
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
                                "example": "https://apiquerysandbox.cieloecommerce.cielo.com.br/1/sales/3b09ebae-be98-4d8e-96e5-57a4374e21b1"
                              }
                            }
                          }
                        }
                      }
                    },
                    "Merchant": {
                      "type": "object",
                      "properties": {
                        "Id": {
                          "type": "string",
                          "example": "8937bd5b-4535-878r-9fe5-f76b3e4da633"
                        },
                        "TradeName": {
                          "type": "string",
                          "example": "Floricultura"
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