---
updatedAt: 2026-10-05T20:39:41.000Z
agentTools:
  siteIndex: https://docs.cielo.com.br/llms.txt
  projectIndex: https://docs.cielo.com.br/ecommerce-cielo/llms.txt
---

# Cancelar transação de débito via MerchantOrderId

| Ambiente | Método                                                                                                                                                                                                                | Endpoint                                                                                                |
| :------- | :-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- | :------------------------------------------------------------------------------------------------------ |
| Sandbox  | <div class="headline-container-article-info2GaOf2jMpV0r"><span class="rm-APIMethod APIMethod APIMethod_fixedWidth APIMethod_put headline-container-api-method1Hc-Fm7uaccR" data-testid="http-method">put</span></div> | `https://apisandbox.cieloecommerce.cielo.com.br/1/sales/OrderId/{MerchantOrderId}/void?amount={Amount}` |
| Produção | <div class="headline-container-article-info2GaOf2jMpV0r"><span class="rm-APIMethod APIMethod APIMethod_fixedWidth APIMethod_put headline-container-api-method1Hc-Fm7uaccR" data-testid="http-method">put</span></div> | `https://api.cieloecommerce.cielo.com.br/1/sales/OrderId/{MerchantOrderId}/void?amount={Amount}`        |

Consulte os [Códigos de retorno de cancelamento.](https://docs.cielo.com.br/ecommerce-cielo/reference/codigos-retorno-cancelamento)

<Callout icon="⚠️" theme="warn">
  ### Atenção

  O cancelamento por MerchantOrderId afeta sempre a transação mais nova, ou seja, caso haja pedidos com o número do pedido duplicado, somente o pedido mais atual será cancelado. O pedido anterior não poderá ser cancelado por esse método.
</Callout>

<br />

<Callout icon="ℹ️" theme="info">
  ### Cancelamento parcial

  Para cartão de débito, é possível fazer apenas um cancelamento parcial.
</Callout>

# OpenAPI definition

```json
{
  "openapi": "3.1.0",
  "info": {
    "title": "cartão-de-débito",
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
    "/1/sales/OrderId/{MerchantOrderId}/void": {
      "put": {
        "summary": "Cancelar transação de débito via MerchantOrderId",
        "description": "",
        "operationId": "cancelamento-debito-merchantorderid",
        "parameters": [
          {
            "name": "MerchantId",
            "in": "header",
            "description": "Identificador da loja na API Cielo E-commerce. Tamanho: 36.<br>*Esta documentação traz um `MerchantId` padrão para permitir os testes em sandbox, mas você também pode informar o `MerchantId` habilitado durante o processo de implantação.*",
            "required": true,
            "schema": {
              "type": "string",
              "default": "8937bd5b-9796-494d-9fe5-f76b3e4da633"
            }
          },
          {
            "name": "MerchantKey",
            "in": "header",
            "description": "Chave pública para Autenticação Dupla na API Cielo E-commerce. Tamanho: 40. Formato: GUID. <br>*Esta documentação traz um `MerchantKey` padrão para permitir os testes em sandbox, mas você também pode informar o `MerchantKey` habilitado durante o processo de implantação.*",
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
          },
          {
            "name": "MerchantOrderId",
            "in": "path",
            "description": "Identificação do pedido, informada na criação da transação.<br> *Atenção: Os caracteres permitidos são apenas a-z, A-Z, 0-9. Não são permitidos caracteres especiais e espaços em branco.* <br>Tamanho: 50.",
            "schema": {
              "type": "string"
            },
            "required": true
          },
          {
            "name": "Amount",
            "in": "query",
            "description": "Valor do Pedido (ser enviado em centavos). Tamanho: 15.",
            "schema": {
              "type": "integer",
              "format": "int32"
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
                    "value": "{\n  \"Status\": 10,\n  \"Tid\": \"0719094510712\",\n  \"ProofOfSale\": \"4510712\",\n  \"AuthorizationCode\": \"693066\",\n  \"ReturnCode\": \"9\",\n  \"ReturnMessage\": \"Operation Successful\",\n  \"Links\": [\n    {\n      \"Method\": \"GET\",\n      \"Rel\": \"self\",\n      \"Href\": \"https://apiquerysandbox.cieloecommerce.cielo.com.br/1/sales/{MerchantOrderId}\"\n    }\n  ]\n}"
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
                            "example": "https://apiquerysandbox.cieloecommerce.cielo.com.br/1/sales/{MerchantOrderId}"
                          }
                        }
                      }
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
  "x-readme": {
    "headers": [],
    "explorer-enabled": true,
    "proxy-enabled": true
  },
  "x-readme-fauxas": true
}
```