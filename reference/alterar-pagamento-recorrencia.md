---
updatedAt: 2025-10-30T01:22:18.000Z
agentTools:
  siteIndex: https://docs.cielo.com.br/llms.txt
  projectIndex: https://docs.cielo.com.br/ecommerce-cielo/llms.txt
---

# Alterar dados do pagamento da recorrência

Altera informações de pagamento do pedido recorrente

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
        <div class="headline-container-article-info2GaOf2jMpV0r"><span class="rm-APIMethod APIMethod APIMethod_fixedWidth APIMethod_put headline-container-api-method1Hc-Fm7uaccR" data-testid="http-method">put</span></div>
      </td>

      <td style={{ textAlign: "left" }}>
        `https://apisandbox.cieloecommerce.cielo.com.br/1/RecurrentPayment/{RecurrentPaymentId}/Payment`
      </td>
    </tr>

    <tr>
      <td style={{ textAlign: "left" }}>
        Produção
      </td>

      <td style={{ textAlign: "left" }}>
        <div class="headline-container-article-info2GaOf2jMpV0r"><span class="rm-APIMethod APIMethod APIMethod_fixedWidth APIMethod_put headline-container-api-method1Hc-Fm7uaccR" data-testid="http-method">put</span></div>
      </td>

      <td style={{ textAlign: "left" }}>
        `https://api.cieloecommerce.cielo.com.br/1/RecurrentPayment/{RecurrentPaymentId}/Payment`
      </td>
    </tr>
  </tbody>
</Table>

> ⚠️ Atenção
>
> Essa alteração afeta a todos os dados do nó `Payment`. Então para manter os dados anteriores você deve informar novamente os campos que não vão sofrer alterações com os mesmos valores que já estavam salvos.

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
    "/1/RecurrentPayment/{RecurrentPaymentId}/Payment": {
      "put": {
        "summary": "Alterar dados do pagamento da recorrência",
        "description": "Altera informações de pagamento do pedido recorrente",
        "operationId": "alterar-pagamento-recorrencia",
        "parameters": [
          {
            "name": "RecurrentPaymentId",
            "in": "path",
            "description": "Numero de identificação da Recorrência. Tamanho: 50.",
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
        "requestBody": {
          "content": {
            "application/json": {
              "schema": {
                "type": "object",
                "required": [
                  "Type",
                  "Amount",
                  "Installments"
                ],
                "properties": {
                  "Type": {
                    "type": "string",
                    "description": "Tipo do Meio de Pagamento."
                  },
                  "Amount": {
                    "type": "integer",
                    "description": "Valor do Pedido (ser enviado em centavos). Tamanho: 15.",
                    "format": "int32"
                  },
                  "Installments": {
                    "type": "integer",
                    "description": "Número de parcelas. Como se trata de uma recorrência, o número de parcelas será 1. Tamanho: 2.",
                    "format": "int32"
                  },
                  "SoftDescriptor": {
                    "type": "string",
                    "description": "Texto que será impresso na fatura bancaria do portador - Disponivel apenas para VISA/MASTER - não permite caracteres especiais. Tamanho: 13."
                  },
                  "CreditCard": {
                    "properties": {
                      "CardNumber": {
                        "type": "integer",
                        "description": "Número do Cartão do Comprador. Tamanho: 16.",
                        "format": "int32"
                      },
                      "Holder": {
                        "type": "string",
                        "description": "Nome do Comprador impresso no cartão. Tamanho: 25"
                      },
                      "ExpirationDate": {
                        "type": "integer",
                        "description": "Data de validade impresso no cartão. Tamanho: 7.",
                        "format": "int32"
                      },
                      "SecurityCode": {
                        "type": "integer",
                        "description": "Código de segurança impresso no verso do cartão. Tamanho: 4.",
                        "format": "int32"
                      },
                      "Brand": {
                        "type": "string",
                        "description": "Bandeira do cartão. Tamanho: 10."
                      }
                    },
                    "required": [
                      "CardNumber",
                      "Holder",
                      "ExpirationDate",
                      "Brand"
                    ],
                    "type": "object"
                  }
                }
              },
              "examples": {
                "Request Example": {
                  "value": {
                    "Type": "CreditCard",
                    "Amount": "123",
                    "Installments": 3,
                    "Country": "USA",
                    "Currency": "BRL",
                    "SoftDescriptor": "123456789ABCD",
                    "CreditCard": {
                      "Brand": "Visa",
                      "Holder": "Teste card ",
                      "CardNumber": "4091688625337641",
                      "ExpirationDate": "12/2035"
                    }
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
              "text/plain": {
                "examples": {
                  "Result": {
                    "value": "HTTP Status 200"
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