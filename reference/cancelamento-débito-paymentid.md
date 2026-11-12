---
updatedAt: 2026-10-05T20:39:33.000Z
agentTools:
  siteIndex: https://docs.cielo.com.br/llms.txt
  projectIndex: https://docs.cielo.com.br/ecommerce-cielo/llms.txt
---

# Cancelar transação de débito via PaymentId

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
    "/1/sales/{PaymentId}/void": {
      "put": {
        "summary": "Cancelar transação de débito via PaymentId",
        "description": "",
        "operationId": "cancelamento-débito-paymentid",
        "parameters": [
          {
            "name": "MerchantId",
            "in": "header",
            "description": "Identificador da loja na API Cielo E-commerce. Tamanho: 36. Formato: GUID. <br>*Esta documentação traz um `MerchantId` padrão para permitir os testes em sandbox, mas você também pode informar o `MerchantId` habilitado durante o processo de implantação.*",
            "required": true,
            "schema": {
              "type": "string",
              "default": "8937bd5b-9796-494d-9fe5-f76b3e4da633"
            }
          },
          {
            "name": "MerchantKey",
            "in": "header",
            "description": "Chave pública para Autenticação Dupla na API Cielo E-commerce. Tamanho: 40.",
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
            "name": "PaymentId",
            "in": "path",
            "description": "Número de identificação do pagamento, necessário para operações como Consulta, Captura e Cancelamento. Tamanho: 36.",
            "schema": {
              "type": "string"
            },
            "required": true
          },
          {
            "name": "Amount",
            "in": "query",
            "description": "Valor a ser cancelado (ser enviado em centavos). Tamanho: 15.",
            "required": true,
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