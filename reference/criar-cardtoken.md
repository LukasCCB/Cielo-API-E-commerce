---
updatedAt: 2025-10-30T01:18:59.000Z
agentTools:
  siteIndex: https://docs.cielo.com.br/llms.txt
  projectIndex: https://docs.cielo.com.br/ecommerce-cielo/llms.txt
---

# Criar cartão tokenizado antes da autorização

Cria um cartão de crédito tokenizado

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
        <div class="headline-container-article-info2GaOf2jMpV0r"><span class="rm-APIMethod APIMethod APIMethod_fixedWidth APIMethod_post headline-container-api-method1Hc-Fm7uaccR" data-testid="http-method">post</span></div>
      </td>

      <td style={{ textAlign: "left" }}>
        `https://apisandbox.cieloecommerce.cielo.com.br/1/card/`
      </td>
    </tr>

    <tr>
      <td style={{ textAlign: "left" }}>
        Produção
      </td>

      <td style={{ textAlign: "left" }}>
        <div class="headline-container-article-info2GaOf2jMpV0r"><span class="rm-APIMethod APIMethod APIMethod_fixedWidth APIMethod_post headline-container-api-method1Hc-Fm7uaccR" data-testid="http-method">post</span></div>
      </td>

      <td style={{ textAlign: "left" }}>
        `https://api.cieloecommerce.cielo.com.br/1/card/`
      </td>
    </tr>
  </tbody>
</Table>

<br />

> ℹ️
>
> Saiba mais sobre essa funcionalidade <a href="https://docs.cielo.com.br/ecommerce-cielo/docs/cielo-tokenization" target="_blank">na documentação</a>.

<br />

### Resposta da criação do cartão tokenizado

A resposta irá retornar o `CardToken` que deverá ser armazenado e usado em [transações futuras](https://docs.cielo.com.br/ecommerce-cielo/reference/cartao-tokenizado-api).

| Propriedade | Descrição                         | Tipo | Tamanho |
| ----------- | --------------------------------- | ---- | ------- |
| `Cardtoken` | Token de identificação do cartão. | GUID | 36      |

# OpenAPI definition

```json
{
  "openapi": "3.1.0",
  "info": {
    "title": "tokenização-de-cartões",
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
    "/1/card/": {
      "post": {
        "summary": "Criar cartão tokenizado antes da autorização",
        "description": "Cria um cartão de crédito tokenizado",
        "operationId": "criar-cardtoken",
        "parameters": [
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
            "description": "Identificador da requisição, usado quando a loja usa diferentes servidores para cada GET/POST/PUT. Tamanho: 36.",
            "schema": {
              "type": "string"
            }
          }
        ],
        "requestBody": {
          "content": {
            "application/json": {
              "schema": {
                "type": "object",
                "required": [
                  "CustomerName",
                  "CardNumber",
                  "Holder",
                  "ExpirationDate",
                  "Brand"
                ],
                "properties": {
                  "CustomerName": {
                    "type": "string",
                    "description": "Nome do comprador. Tamanho: 255.<br>_Atenção: Os caracteres permitidos são apenas a-z, A-Z. Não são permitidos caracteres especiais e números._"
                  },
                  "CardNumber": {
                    "type": "string",
                    "description": "Número do cartão de crédito do comprador. Tamanho: 16."
                  },
                  "Holder": {
                    "type": "string",
                    "description": "Nome do comprador impresso no cartão. Tamanho: 25."
                  },
                  "ExpirationDate": {
                    "type": "string",
                    "description": "Data de validade impressa no cartão. Tamanho: 7."
                  },
                  "Brand": {
                    "type": "string",
                    "description": "Bandeira do cartão (Visa / Master / Amex / Elo / Aura / JCB / Diners / Discover). Tamanho: 10"
                  }
                }
              },
              "examples": {
                "Request Example": {
                  "value": {
                    "CustomerName": "Comprador Teste Cielo",
                    "CardNumber": "4024007110880035",
                    "Holder": "Comprador T Cielo",
                    "ExpirationDate": "10/2026",
                    "Brand": "Visa"
                  }
                }
              }
            }
          }
        },
        "responses": {
          "201": {
            "description": "201",
            "content": {
              "application/json": {
                "examples": {
                  "Result": {
                    "value": "{\n  \"CardToken\": \"db62dc71-d07b-4745-9969-42697b988ccb\",\n  \"Links\": {\n    \"Method\": \"GET\",\n    \"Rel\": \"self\",\n    \"Href\": \"https://apiquerydev.cieloecommerce.cielo.com.br/1/card/db62dc71-d07b-4745-9969-42697b988ccb\"\n  }\n}"
                  }
                },
                "schema": {
                  "type": "object",
                  "properties": {
                    "CardToken": {
                      "type": "string",
                      "example": "db62dc71-d07b-4745-9969-42697b988ccb"
                    },
                    "Links": {
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
                          "example": "https://apiquerydev.cieloecommerce.cielo.com.br/1/card/db62dc71-d07b-4745-9969-42697b988ccb"
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