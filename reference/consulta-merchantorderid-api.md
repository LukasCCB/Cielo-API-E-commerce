---
updatedAt: 2025-10-30T01:18:26.000Z
agentTools:
  siteIndex: https://docs.cielo.com.br/llms.txt
  projectIndex: https://docs.cielo.com.br/ecommerce-cielo/llms.txt
---

# Consultar por MerchantOrderId

Consulta uma transação informando o MerchantOrderId

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
        `https://apiquerysandbox.cieloecommerce.cielo.com.br/1/sales?merchantOrderId={merchantOrderId}`
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
        `https://apiquery.cieloecommerce.cielo.com.br/1/sales?merchantOrderId={merchantOrderId}`
      </td>
    </tr>
  </tbody>
</Table>

<br />

> ℹ️\
> Saiba mais sobre essa funcionalidade <a href="https://docs.cielo.com.br/ecommerce-cielo/docs/consulta" target="_blank">na documentação</a>.

<br />

> ℹ️\
> Apenas as transações dentro dos últimos três meses podem ser consultadas via API.

<br />

* O `MerchantOrderId` é a identificação do pedido determinada pela loja na criação da transação (para qualquer meio de pagamento);
* A consulta por `MerchantOrderId` irá retornar o `PaymentId` da transação.

## Resposta da consulta pelo MerchantOrderId

A tabela a seguir apresenta os principais parâmetros que podem ser retornados pela API na consulta de transação pelo `MerchantOrderId`.

| **Propriedade** | **Descrição**                                                                                          | **Tipo** | **Tamanho** |
| --------------- | ------------------------------------------------------------------------------------------------------ | -------- | ----------- |
| `ReasonCode`    | Código que indica sucesso ou erro no fluxo da operação solicitada.                                     | string   | 32          |
| `ReasonMessage` | Mensagem que indica sucesso ou erro no fluxo da operação solicitada.                                   | string   | 512         |
| `PaymentId`     | Número de identificação do pagamento, necessário para operações como Consulta, Captura e Cancelamento. | string   | 36          |
| `ReceivedDate`  | Data em que a transação foi recebida.                                                                  | string   | 19          |

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
    "/1/sales": {
      "get": {
        "summary": "Consultar por MerchantOrderId",
        "description": "Consulta uma transação informando o MerchantOrderId",
        "operationId": "consulta-merchantorderid-api",
        "parameters": [
          {
            "name": "MerchantOrderId",
            "in": "query",
            "description": "Número de identificação do pedido. *Atenção: Os caracteres permitidos são apenas a-z, A-Z, 0-9. Não são permitidos caracteres especiais e espaços em branco.* Tamanho: 36.",
            "schema": {
              "type": "string",
              "default": "Loja123456"
            }
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
                    "value": "{\n  \"ReasonCode\": 0,\n  \"ReasonMessage\": \"Successful\",\n  \"Payments\": [\n    {\n      \"PaymentId\": \"4b62cc74-bb20-4629-ab2d-002262738481\",\n      \"ReceveidDate\": \"2024-11-29T13:36:04.033\"\n    },\n    {\n      \"PaymentId\": \"1e7abcb6-39be-4aae-b70b-002889ee15d0\",\n      \"ReceveidDate\": \"2025-04-13T02:08:16.467\"\n    },\n    {\n      \"PaymentId\": \"6c936046-f8df-4e4a-ba8c-003b28879055\",\n      \"ReceveidDate\": \"2025-05-17T07:48:10.677\"\n    },\n    {\n      \"PaymentId\": \"55f0a6c8-387e-476b-a6e8-ffef82e9a18e\",\n      \"ReceveidDate\": \"2025-02-18T14:10:10.61\"\n    }\n  ]\n}"
                  }
                },
                "schema": {
                  "type": "object",
                  "properties": {
                    "ReasonCode": {
                      "type": "integer",
                      "example": 0,
                      "default": 0
                    },
                    "ReasonMessage": {
                      "type": "string",
                      "example": "Successful"
                    },
                    "Payments": {
                      "type": "array",
                      "items": {
                        "type": "object",
                        "properties": {
                          "PaymentId": {
                            "type": "string",
                            "example": "4b62cc74-bb20-4629-ab2d-002262738481"
                          },
                          "ReceveidDate": {
                            "type": "string",
                            "example": "2024-11-29T13:36:04.033"
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