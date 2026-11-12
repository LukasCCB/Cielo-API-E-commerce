---
updatedAt: 2025-10-30T01:18:52.000Z
agentTools:
  siteIndex: https://docs.cielo.com.br/llms.txt
  projectIndex: https://docs.cielo.com.br/ecommerce-cielo/llms.txt
---

# Confirmar a conversão de moeda

Confirma a conversão do pagamento em reais para a moeda do cartão estrangeiro

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
        Produção
      </td>

      <td style={{ textAlign: "left" }}>
        <div class="headline-container-article-info2GaOf2jMpV0r">
          <span class="rm-APIMethod APIMethod APIMethod_fixedWidth APIMethod_put headline-container-api-method1Hc-Fm7uaccR" data-testid="http-method">put</span>
        </div>
      </td>

      <td style={{ textAlign: "left" }}>
        `https://api.cieloecommerce.cielo.com.br/1/sales/{PaymentId}/confirm`
      </td>
    </tr>
  </tbody>
</Table>

<br />

> ℹ️
>
> Saiba mais sobre essa funcionalidade <a href="https://docs.cielo.com.br/ecommerce-cielo/docs/conversor-moedas-ecommerce" target="_blank">na documentação</a>.

Depois que o comprador decide pagar na moeda estrangeira, a loja deve enviar a requisição de confirmação da conversão com o campo `CurrencyConversion` igual a *true*. Após a confirmação, a API E-commerce Cielo irá submeter a transação para autorização.

> ⚠️ Atenção ao tempo limite para confirmação
>
> A confirmação deve ser feita em até vinte minutos.
>
> Se o tempo para confirmação da moeda desejada for superior a vinte minutos, a API irá retornar o código **020** com a mensagem “Status não permite autorização”.
>
> Se a captura não for automática (`Payment.Capture` igual a *true*), a captura posterior também deve se feita em até 20 minutos, para garantir o câmbio ao comprador.

# OpenAPI definition

```json
{
  "openapi": "3.1.0",
  "info": {
    "title": "conversor-de-moedas-e-commerce",
    "version": "3.0"
  },
  "servers": [
    {
      "url": "https://api.cieloecommerce.cielo.com.br/1/sales"
    }
  ],
  "security": [
    {}
  ],
  "paths": {
    "/1/sales/{PaymentId}/confirm": {
      "put": {
        "summary": "Confirmar a conversão de moeda",
        "description": "Confirma a conversão do pagamento em reais para a moeda do cartão estrangeiro",
        "operationId": "confirmar-conversao",
        "parameters": [
          {
            "name": "MerchantId",
            "in": "header",
            "description": "Identificador da loja na Cielo. Tamanho: 36. Formato: GUID.",
            "required": true,
            "schema": {
              "type": "string",
              "default": "8937bd5b-9796-494d-9fe5-f76b3e4da633"
            }
          },
          {
            "name": "MerchantKey",
            "in": "header",
            "description": "Chave pública para autenticação dupla na Cielo. Tamanho: 40. Formato: GUID.",
            "required": true,
            "schema": {
              "type": "string",
              "default": "XKGHUBSBKIRXKAVPSKWLVXYCLVJUGTNZLIHPUSYV"
            }
          },
          {
            "name": "Content-Type",
            "in": "header",
            "description": "Tamanho: 40.",
            "required": true,
            "schema": {
              "type": "string",
              "default": "application/json"
            }
          },
          {
            "name": "RequestId",
            "in": "header",
            "description": "Identificador da requisição, usado quando a loja usa diferentes servidores para cada GET/POST/PUT. Tamanho: 36.",
            "schema": {
              "type": "string"
            }
          },
          {
            "name": "PaymentId",
            "in": "path",
            "description": "Número de identificação do pagamento, necessário para futuras operações como Consulta, Captura e Cancelamento. Tamanho: 36.",
            "schema": {
              "type": "string"
            },
            "required": true
          }
        ],
        "requestBody": {
          "content": {
            "application/json": {
              "schema": {
                "type": "object",
                "required": [
                  "CurrencyConversion"
                ],
                "properties": {
                  "CurrencyConversion": {
                    "type": "boolean",
                    "description": "Booleano que confirma que o comprador optou por realizar a conversão. <br>Quando *true*, indica que a transação será submetida para autorização na moeda estrangeira. <br>Quando *false*, indica que a transação será submetida para autorização em reais."
                  }
                }
              },
              "examples": {
                "Request Example": {
                  "value": {
                    "CurrencyConversion": true
                  }
                }
              }
            }
          }
        },
        "responses": {
          "200": {
            "description": "200",
            "content": {
              "application/json": {
                "examples": {
                  "Result": {
                    "value": "{\n    \"Status\": 1,\n    \"ReasonCode\": 0,\n    \"ReasonMessage\": \"Successful\",\n    \"ProviderReturnCode\": \"4\",\n    \"ProviderReturnMessage\": \"Transacao autorizada\",\n    \"ReturnCode\": \"4\",\n    \"ReturnMessage\": \"Transacao autorizada\",\n    \"Tid\": \"204089197230RE45724B\",\n    \"ProofOfSale\": \"523001\",\n    \"AuthorizationCode\": \"693848\",\n    \"Links\": [\n      {\n        \"Method\": \"GET\",\n        \"Rel\": \"self\",\n        \"Href\": \"https://apiquerysandbox.cieloecommerce.cielo.com.br/1/sales/fb375c6c-1025-46f3-a338-aa2403c44f89\"\n      },\n      {\n        \"Method\": \"PUT\",\n        \"Rel\": \"capture\",\n        \"Href\": \"https://apisandbox.cieloecommerce.cielo.com.br/1/sales/fb375c6c-1025-46f3-a338-aa2403c44f89/capture\"\n      },\n      {\n        \"Method\": \"PUT\",\n        \"Rel\": \"void\",\n        \"Href\": \"https://apisandbox.cieloecommerce.cielo.com.br/1/sales/fb375c6c-1025-46f3-a338-aa2403c44f89/void\"\n      }\n    ]\n  }\n"
                  }
                },
                "schema": {
                  "type": "object",
                  "properties": {
                    "Status": {
                      "type": "integer",
                      "example": 1,
                      "default": 0
                    },
                    "ReasonCode": {
                      "type": "integer",
                      "example": 0,
                      "default": 0
                    },
                    "ReasonMessage": {
                      "type": "string",
                      "example": "Successful"
                    },
                    "ProviderReturnCode": {
                      "type": "string",
                      "example": "4"
                    },
                    "ProviderReturnMessage": {
                      "type": "string",
                      "example": "Transacao autorizada"
                    },
                    "ReturnCode": {
                      "type": "string",
                      "example": "4"
                    },
                    "ReturnMessage": {
                      "type": "string",
                      "example": "Transacao autorizada"
                    },
                    "Tid": {
                      "type": "string",
                      "example": "204089197230RE45724B"
                    },
                    "ProofOfSale": {
                      "type": "string",
                      "example": "523001"
                    },
                    "AuthorizationCode": {
                      "type": "string",
                      "example": "693848"
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
                            "example": "https://apiquerysandbox.cieloecommerce.cielo.com.br/1/sales/fb375c6c-1025-46f3-a338-aa2403c44f89"
                          }
                        }
                      }
                    }
                  }
                }
              }
            }
          },
          "400": {
            "description": "400",
            "content": {
              "application/json": {
                "examples": {
                  "Result": {
                    "value": "{}"
                  }
                },
                "schema": {
                  "type": "object",
                  "properties": {}
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
    "explorer-enabled": false,
    "proxy-enabled": true
  },
  "x-readme-fauxas": true
}
```