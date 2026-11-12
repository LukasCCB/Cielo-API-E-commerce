---
updatedAt: 2026-03-19T20:31:43.000Z
agentTools:
  siteIndex: https://docs.cielo.com.br/llms.txt
  projectIndex: https://docs.cielo.com.br/ecommerce-cielo/llms.txt
---

# Criar pagamento com Click to Pay

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
          <span class="rm-APIMethod APIMethod APIMethod_fixedWidth APIMethod_post headline-container-api-method1Hc-Fm7uaccR" data-testid="http-method">post</span>
        </div>
      </td>

      <td style={{ textAlign: "left" }}>
        `https://apisandbox.cieloecommerce.cielo.com.br/1/sales`
      </td>
    </tr>

    <tr>
      <td style={{ textAlign: "left" }}>
        Produção
      </td>

      <td style={{ textAlign: "left" }}>
        <div class="headline-container-article-info2GaOf2jMpV0r">
          <span class="rm-APIMethod APIMethod APIMethod_fixedWidth APIMethod_post headline-container-api-method1Hc-Fm7uaccR" data-testid="http-method">post</span>
        </div>
      </td>

      <td style={{ textAlign: "left" }}>
        `https://api.cieloecommerce.cielo.com.br/1/sales`
      </td>
    </tr>
  </tbody>
</Table>

Para a requisição de Click to Pay, envie o parâmetro `Payment.Type` como “CreditCard” e o parâmetro `WalletType` como “ClickToPay”;

> ⚠️ CAVV e código de segurança do cartão
>
> * Quando um cartão é tokenizado, o Click to Pay retorna o **CAVV** do cartão. Ao enviar uma transação com CAVV (`Wallet.Cavv`), não é obrigatório enviar o código de segurança do cartão;
> * Quando um cartão não é tokenizado, o CAVV não existe, então é obrigatório enviar o código de segurança do cartão (`Payment.CreditCard.SecurityCode`).

> ℹ️ Importante
>
> Nas transações do tipo **Click To Pay**, não é necessário o envio do campo ECI. **A Cielo** realiza automaticamente a atribuição do valor "2" ao campo ECI sempre que identifica uma transação dessa natureza, tornando esse processo transparente. Caso seja enviado um valor diferente para o ECI (por exemplo, "5"), o sistema mantém o valor "2", em conformidade com as especificações do manual da bandeira.

<Callout icon="⚠️">
  O Click to Pay funciona com os dados do cartão ou DPAN. Não é possível criar transação com dados criptografados.

  Veja como decriptar os dados de cartão na <Anchor label="documentação da Mastercard" target="_blank" href="https://developer.mastercard.com/account-catalog-services/documentation/api-basics/#how-to-consume-the-account-catalog-services-api">documentação da Mastercard</Anchor>.
</Callout>

# OpenAPI definition

```json
{
  "openapi": "3.1.0",
  "info": {
    "title": "click-to-pay",
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
    "/1/sales": {
      "post": {
        "summary": "Criar pagamento com Click to Pay",
        "description": "",
        "operationId": "pagamento-click-to-pay",
        "parameters": [
          {
            "name": "MerchantId",
            "in": "header",
            "description": "Identificador da loja na Cielo.  Tamanho: 36.",
            "required": true,
            "schema": {
              "type": "string",
              "default": "8937bd5b-9796-494d-9fe5-f76b3e4da633"
            }
          },
          {
            "name": "MerchantKey",
            "in": "header",
            "description": "Chave pública para autenticação dupla na Cielo.  Tamanho: 40.",
            "required": true,
            "schema": {
              "type": "string",
              "default": "XKGHUBSBKIRXKAVPSKWLVXYCLVJUGTNZLIHPUSYV"
            }
          },
          {
            "name": "Content-Type",
            "in": "header",
            "description": "application/json",
            "required": true,
            "schema": {
              "type": "string",
              "default": "application/json"
            }
          },
          {
            "name": "RequestId",
            "in": "header",
            "description": "Identificador da requisição, usado quando o lojista usa diferentes servidores para cada GET/POST/PUT.  Tamanho: 36.",
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
                "properties": {
                  "MerchantOrderId": {
                    "type": "string",
                    "description": "Número de identificação do pedido.  Tamanho: 50."
                  },
                  "Customer": {
                    "properties": {
                      "Name": {
                        "type": "string",
                        "description": "Nome do comprador.  Tamanho: 255.<br>_Atenção: Os caracteres permitidos são apenas a-z, A-Z. Não são permitidos caracteres especiais e números._"
                      }
                    },
                    "required": [],
                    "type": "object"
                  },
                  "Payment": {
                    "properties": {
                      "Type": {
                        "type": "string",
                        "description": "Tipo do meio de pagamento.  Tamanho: 100."
                      },
                      "Amount": {
                        "type": "integer",
                        "description": "Valor do pedido (ser enviado em centavos).  Tamanho: 15.",
                        "format": "int32"
                      },
                      "Installments": {
                        "type": "integer",
                        "description": "Número de parcelas.  Tamanho: 2.",
                        "format": "int32"
                      },
                      "CreditCard": {
                        "properties": {
                          "CardNumber": {
                            "type": "string",
                            "description": "Número do cartão do comprador ou DPAN. Tamanho: 19."
                          },
                          "Holder": {
                            "type": "string",
                            "description": "Nome do comprador impresso no cartão. Não aceita caracteres especiais ou acentuação.  Tamanho: 25."
                          },
                          "ExpirationDate": {
                            "type": "string",
                            "description": "Data de validade impressa no cartão. Ex. MM/AAAA.  Tamanho: 7."
                          },
                          "Brand": {
                            "type": "string",
                            "description": "Bandeira do cartão. Valores possíveis: Visa / Master.  Tamanho: 10."
                          },
                          "SecurityCode": {
                            "type": "string",
                            "description": "Código de segurança impresso no verso do cartão.  Tamanho: 4."
                          }
                        },
                        "required": [
                          "CardNumber",
                          "ExpirationDate",
                          "Brand"
                        ],
                        "type": "object"
                      }
                    },
                    "required": [
                      "Type",
                      "Amount",
                      "Installments"
                    ],
                    "type": "object"
                  },
                  "Wallet": {
                    "properties": {
                      "Type": {
                        "type": "string",
                        "description": "Tipo de carteira. Usar ClickToPay.  Tamanho: 255."
                      },
                      "Cavv": {
                        "type": "string",
                        "description": "Criptograma do cartão tokenizado. É obtido diretamente com o Click to Pay caso o cartão já tenha sido tokenizado.  Tamanho: 255."
                      },
                      "AdditionalData": {
                        "properties": {
                          "Provider": {
                            "type": "string",
                            "description": "Bandeira do cartão. Valores possíveis: Visa e Mastercard."
                          }
                        },
                        "required": [
                          "Provider"
                        ],
                        "type": "object"
                      }
                    },
                    "required": [
                      "Type",
                      "Cavv"
                    ],
                    "type": "object"
                  }
                }
              },
              "examples": {
                "requisição com envio do Cavv": {
                  "value": {
                    "MerchantOrderId": "123456",
                    "Customer": {
                      "Name": "Nome do Comprador"
                    },
                    "Payment": {
                      "Type": "CreditCard",
                      "Amount": 1000,
                      "Installments": 1,
                      "CreditCard": {
                        "CardNumber": "************1234",
                        "Holder": "Cielo",
                        "ExpirationDate": "12/2030",
                        "Brand": "Master"
                      },
                      "Wallet": {
                        "Type": "ClickToPay",
                        "Cavv": "AM1mbqehL24XAAa0J04CAoABFA==",
                        "AdditionalData": {
                          "Provider": "Mastercard"
                        }
                      }
                    }
                  }
                },
                "Requisição sem envio do Cavv": {
                  "value": {
                    "MerchantOrderId": "123456",
                    "Customer": {
                      "Name": "Nome do Comprador"
                    },
                    "Payment": {
                      "Type": "CreditCard",
                      "Amount": 1000,
                      "Installments": 1,
                      "CreditCard": {
                        "CardNumber": "************1234",
                        "Holder": "Cielo",
                        "ExpirationDate": "12/2030",
                        "Brand": "Master",
                        "SecurityCode": "123"
                      },
                      "Wallet": {
                        "Type": "ClickToPay",
                        "AdditionalData": {
                          "Provider": "Mastercard"
                        }
                      }
                    }
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
                    "value": "{ \n\n   \"MerchantOrderId\":\"123456\", \n\n   \"Customer\":{ \n\n      \"Name\":\"Nome do Comprador\" \n\n   }, \n\n   \"Payment\":{ \n\n      \"Type\":\"CreditCard\", \n\n      \"Amount\":1000, \n\n      \"Installments\":1, \n        \n         \"CreditCard\":{ \n\n         \"CardNumber\":\"************1234\", \n\n         \"Holder\":\"Cielo\", \n\n         \"ExpirationDate\":\"12/2030\", \n\n         \"Brand\":\"Master\" \n\n  }\n\n      \"Wallet\":{ \n\n         \"Type\":\"ClickToPay\", \n\n         \"Cavv\":\"AM1mbqehL24XAAa0J04CAoABFA==\", \n\n         \"AdditionalData\":{ \n\n            \"Provider\":\"Mastercard\" \n\n         } \n\n      }, \n\n    \"ReturnMessage\": \"Operation Successful\", \n\n    \"ReturnCode\": \"4\", \n\n    \"PaymentId\": \"e57b09eb-475b-44b6-ac71-01b9b82f2024\", \n\n    \"Links\": [ \n\n        { \n\n          \"Method\": \"GET\", \n\n          \"Rel\": \"self\", \n\n          \"Href\": \"https://apiquerysandbox.cieloecommerce.cielo.com.br/1/sales/e57b09eb-475b-44b6-ac71-01b9b82f2491\" \n\n        }, \n\n        { \n\n          \"Method\": \"PUT\", \n\n          \"Rel\": \"capture\", \n\n          \"Href\": \"https://apisandbox.cieloecommerce.cielo.com.br/1/sales/e57b09eb-475b-44b6-ac71-01b9b82f2491/capture\" \n\n        }, \n\n        { \n\n          \"Method\": \"PUT\", \n\n          \"Rel\": \"void\", \n\n          \"Href\": \"https://apisandbox.cieloecommerce.cielo.com.br/1/sales/e57b09eb-475b-44b6-ac71-01b9b82f2491/void\" \n\n        } \n\n      ] \n\n  } \n\n} "
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