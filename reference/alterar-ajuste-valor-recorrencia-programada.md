---
updatedAt: 2025-11-11T15:02:40.000Z
agentTools:
  siteIndex: https://docs.cielo.com.br/llms.txt
  projectIndex: https://docs.cielo.com.br/ecommerce-cielo/llms.txt
---

# Alterar atualização de valor de uma recorrência programada

Altera atualização de valor para uma determinada recorrência.

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
          <span class="rm-APIMethod APIMethod APIMethod_fixedWidth APIMethod_put headline-container-api-method1Hc-Fm7uaccR" data-testid="http-method">put</span>
        </div>
      </td>

      <td style={{ textAlign: "left" }}>
        `https://apisandbox.cieloecommerce.cielo.com.br/1/RecurrentPayment/{RecurrentPaymentId}/Schedule/{RecurrentScheduleId}`
      </td>
    </tr>

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
        `https://api.cieloecommerce.cielo.com.br/1/RecurrentPayment/{RecurrentPaymentId}/Schedule/{RecurrentScheduleId}`
      </td>
    </tr>
  </tbody>
</Table>

# OpenAPI definition

```json
{
  "openapi": "3.1.0",
  "info": {
    "title": "recorrência",
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
    "/1/RecurrentPayment/{RecurrentPaymentId}/Schedule/{RecurrentScheduleId}": {
      "put": {
        "summary": "Alterar ajuste de valor de uma recorrência programada",
        "description": "Altera os dados de ajuste de valor para uma determinada recorrência.",
        "operationId": "alterar-ajuste-valor-recorrencia-programada",
        "parameters": [
          {
            "name": "RecurrentPaymentId",
            "in": "path",
            "description": "Número de identificação da Recorrência. Tamanho: 50.",
            "schema": {
              "type": "string"
            },
            "required": true
          },
          {
            "name": "RecurrentScheduleId",
            "in": "path",
            "description": "Código referência da edição programada. _O código é recebido a essa edição de recorrência programada é criada._",
            "schema": {
              "type": "string"
            },
            "required": true
          },
          {
            "name": "Content-Type",
            "in": "header",
            "description": "application-json",
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
          }
        ],
        "requestBody": {
          "content": {
            "application/json": {
              "schema": {
                "type": "object",
                "required": [
                  "Amount",
                  "Description",
                  "TargetDate"
                ],
                "properties": {
                  "Amount": {
                    "type": "string",
                    "description": "Valor do Pedido em centavos: 156 equivale a R$ 1,56. Tamanho: 15."
                  },
                  "Description": {
                    "type": "string",
                    "description": "Descrição de teste. Tamanho: 100"
                  },
                  "TargetDate": {
                    "type": "string",
                    "description": "Deve ser pelo menos maior que 2 dias a partir de hoje.",
                    "format": "date"
                  }
                }
              },
              "examples": {
                "Request Example": {
                  "value": {
                    "Amount": "2222",
                    "Description": "Um novo teste 2222",
                    "TargetDate": "2025-02-09"
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
                    "value": "OK"
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