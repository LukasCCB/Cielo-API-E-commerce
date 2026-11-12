---
updatedAt: 2025-10-30T01:15:14.000Z
agentTools:
  siteIndex: https://docs.cielo.com.br/llms.txt
  projectIndex: https://docs.cielo.com.br/ecommerce-cielo/llms.txt
---

# Solicitar uma devolução Pix

Solicita a devolução de uma transação Pix.

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
          <span className="rm-APIMethod APIMethod APIMethod_fixedWidth APIMethod_put headline-container-api-method1Hc-Fm7uaccR" data-testid="http-method">put</span>
        </div>
      </td>

      <td style={{ textAlign: "left" }}>
        `https://apisandbox.cieloecommerce.cielo.com.br/1/sales/{PaymentId}/void?amount={Amount}`
      </td>
    </tr>

    <tr>
      <td style={{ textAlign: "left" }}>
        Produção
      </td>

      <td style={{ textAlign: "left" }}>
        <div className="headline-container-article-info2GaOf2jMpV0r">
          <span className="rm-APIMethod APIMethod APIMethod_fixedWidth APIMethod_put headline-container-api-method1Hc-Fm7uaccR" data-testid="http-method">put</span>
        </div>
      </td>

      <td style={{ textAlign: "left" }}>
        `https://api.cieloecommerce.cielo.com.br/1/sales/{PaymentId}/void?amount={Amount}`
      </td>
    </tr>
  </tbody>
</Table>

> ⚠️ Nova integração Pix na Cielo
>
> A partir de 01/09/2025, novas integrações de Pix serão feitas com o novo provedor de Pix na Cielo, o `Cielo2`. Saiba mais sobre a <a href="https://docs.cielo.com.br/ecommerce-cielo/docs/pix-cielo" target="_blank">nova integração de Pix na Cielo</a>.

<br />

Para solicitar uma devolução Pix, é necessário que a loja tenha a conta do tipo **transferência programada**.

> ℹ️ Confira as regras para [solicitação da devolução Pix](https://docs.cielo.com.br/ecommerce-cielo/docs/pix#devolu%C3%A7%C3%A3o-pix).

# OpenAPI definition

```json
{
  "openapi": "3.1.0",
  "info": {
    "title": "pix",
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
        "summary": "Solicitar uma devolução Pix",
        "description": "Solicita a devolução de uma transação Pix.",
        "operationId": "devoluçao-pix-api",
        "parameters": [
          {
            "name": "MerchantId",
            "in": "header",
            "description": "Identificador da loja na API. Tamanho: 36.<br>*Esta documentação traz um `MerchantId` padrão para permitir os testes em sandbox, mas você também pode informar o `MerchantId` habilitado durante o processo de implantação.*",
            "required": true,
            "schema": {
              "type": "string",
              "default": "8937bd5b-9796-494d-9fe5-f76b3e4da633"
            }
          },
          {
            "name": "PaymentId",
            "in": "path",
            "description": "Número de identificação do pagamento, retornado pela API na criação do QR Code Pix. Tamanho: 36.",
            "schema": {
              "type": "string"
            },
            "required": true
          },
          {
            "name": "Amount",
            "in": "query",
            "description": "Valor a ser cancelado/estornado, em centavos. Verifique se a adquirente contratada suporta a operação de cancelamento ou estorno. Tamanho: 15.",
            "schema": {
              "type": "string"
            }
          },
          {
            "name": "MerchantKey",
            "in": "header",
            "description": "Chave pública para autenticação dupla na API. Tamanho: 40.<br>*Esta documentação traz um `MerchantKey` padrão para permitir os testes em sandbox, mas você também pode informar o `MerchantKey` habilitado durante o processo de implantação.*",
            "required": true,
            "schema": {
              "type": "string",
              "default": "XKGHUBSBKIRXKAVPSKWLVXYCLVJUGTNZLIHPUSYV"
            }
          },
          {
            "name": "RequestId",
            "in": "header",
            "description": "Identificador do request definido pela loja, utilizado quando o lojista usa diferentes servidores para cada GET/POST/PUT. Tamanho: 36.",
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
                    "value": "{\n  \"Status\": 12,\n  \"ReasonCode\": 0,\n  \"ReasonMessage\": \"Successful\",\n  \"ReturnCode\": \"0\",\n  \"ReturnMessage\": \"Reembolso solicitado com sucesso\",\n  \"Links\": [\n    {\n      \"Method\": \"GET\",\n      \"Rel\": \"self\",\n      \"Href\": \"https://(...)/sales/{PaymentId}\"\n    }\n  ]\n}"
                  }
                },
                "schema": {
                  "type": "object",
                  "properties": {
                    "Status": {
                      "type": "integer",
                      "example": 12,
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
                    "ReturnCode": {
                      "type": "string",
                      "example": "0"
                    },
                    "ReturnMessage": {
                      "type": "string",
                      "example": "Reembolso solicitado com sucesso"
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
                            "example": "https://(...)/sales/{PaymentId}"
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