---
updatedAt: 2026-08-06T19:19:03.000Z
agentTools:
  siteIndex: https://docs.cielo.com.br/llms.txt
  projectIndex: https://docs.cielo.com.br/ecommerce-cielo/llms.txt
---

# Gerar um QR Code via API

Cria uma transação de QR Code

| Ambiente | Método                                                                                                                                                                                                                  | Endpoint                                                  |
| :------- | :---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- | :-------------------------------------------------------- |
| Sandbox  | <div class="headline-container-article-info2GaOf2jMpV0r"><span class="rm-APIMethod APIMethod APIMethod_fixedWidth APIMethod_post headline-container-api-method1Hc-Fm7uaccR" data-testid="http-method">post</span></div> | `https://apisandbox.cieloecommerce.cielo.com.br/1/sales/` |
| Produção | <div class="headline-container-article-info2GaOf2jMpV0r"><span class="rm-APIMethod APIMethod APIMethod_fixedWidth APIMethod_post headline-container-api-method1Hc-Fm7uaccR" data-testid="http-method">post</span></div> | `https://api.cieloecommerce.cielo.com.br/1/sales/`        |

<br />

<Callout icon="ℹ️" theme="info">
  Saiba mais sobre essa funcionalidade <a href="https://docs.cielo.com.br/ecommerce-cielo/docs/qr-code" target="_blank">na documentação</a>.
</Callout>

Uma transação de QR Code é semelhante a uma transação de cartão de crédito, mas é necessário enviar o parâmetro `Payment.Type` como "qrcode".

<Callout icon="⚠️" theme="warn">
  ### Atenção

  - Não é possível realizar uma transação com valor (`Amount`) = 0;
  - **Facilitadores de Pagamento** (ou subcredenciadores) devem, obrigatoriamente, enviar os parâmetros do nó `PaymentFacilitator` por exigência do Banco Central e das bandeiras. Caso não sejam enviados, a bandeira pode aplicar penalidades ao facilitador de pagamento.
</Callout>

<br />

### Resposta da criação da transação de QR Code

A tabela a seguir apresenta os principais parâmetros que podem ser retornados pela API na criação de um pagamento com QR Code.

| Propriedade         | Descrição                                                                                                                                                                                                                              | Tipo     | Tamanho  |
| ------------------- | -------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- | -------- | -------- |
| `IsQrCode`          | Booleano indicando se é QR Code.                                                                                                                                                                                                       | booleano | -        |
| `QrCodeId`          | Identificador do QR Code.                                                                                                                                                                                                              | string   | -        |
| `QrCodeString`      | Código do pix (Copia e cola) que pode ser usado para pagamento.                                                                                                                                                                        | string   | -        |
| `QrCodeBase64Image` | QRCode codificado na base 64. Por exemplo, a imagem poderá ser apresentada na página utilizando o código HTML como este:<br />`<pre lang="html"><img src="data:image/png;base64, código_da_imagem_na_base_64"></pre>`                  | string   | variável |
| `PaymentId`         | Número de identificação do pagamento, necessário para futuras operações como consulta, captura e cancelamento.                                                                                                                         | GUID     | 36       |
| `Status`            | Status da Transação. No caso de uma transação de geração de QRCode de pagamento, o status inicial é 12 (Pending).  Veja a tabela completa de [Status transacional](https://docs.cielo.com.br/ecommerce-cielo/reference/payment-status) | byte     | \*\*\*   |
| `ReturnCode`        | Código de retorno.                                                                                                                                                                                                                     | string   | 32       |
| `ReturnMessage`     | Mensagem de retorno.                                                                                                                                                                                                                   | string   | 512      |

# OpenAPI definition

```json
{
  "openapi": "3.1.0",
  "info": {
    "title": "qrcode",
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
    "/1/sales/": {
      "post": {
        "summary": "Gerar um QR Code via API",
        "description": "Cria uma transação de QR Code",
        "operationId": "qr-code-api",
        "parameters": [
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
                  "MerchantOrderId"
                ],
                "properties": {
                  "MerchantOrderId": {
                    "type": "string",
                    "description": "Número de identificação do pedido. *Atenção: Os caracteres permitidos são apenas a-z, A-Z, 0-9. Não são permitidos caracteres especiais e espaços em branco.* Tamanho: 50."
                  },
                  "Customer": {
                    "properties": {
                      "Name": {
                        "type": "string",
                        "description": "Nome do comprador. Tamanho: 255.<br>_Atenção: Os caracteres permitidos são apenas a-z, A-Z. Não são permitidos caracteres especiais e números._"
                      }
                    },
                    "required": [],
                    "type": "object"
                  },
                  "Payment": {
                    "properties": {
                      "Type": {
                        "type": "string",
                        "description": "Tipo do meio de pagamento. Enviar **qrcode** para uma transação de QRCode."
                      },
                      "Amount": {
                        "type": "integer",
                        "description": "Valor do pedido (ser enviado em centavos). Tamanho: 15.",
                        "format": "int32"
                      },
                      "Installments": {
                        "type": "integer",
                        "description": "Número de parcelas. Se a transação for uma recorrência, o número de parcelas será 1. Para transações parceladas, o número de parcelas será sempre maior que 1. Tamanho: 2.",
                        "format": "int32"
                      },
                      "Capture": {
                        "type": "boolean",
                        "description": "Enviar **true** para uma trasação de captura automática."
                      },
                      "Modality": {
                        "type": "string",
                        "description": "Indica se o pagamento será feito com crédito ou débito. Valores possíveis: \"Credit\" (padrão) ou \"Debit\". Tamanho: 10."
                      },
                      "PaymentFacilitator": {
                        "properties": {
                          "EstablishmentCode": {
                            "type": "string",
                            "description": "**Obrigatório para facilitadores**. Código do estabelecimento do Facilitador. \"Facilitator ID” (Cadastro do facilitador com as bandeiras)<br>O código é diferente por bandeira, podendo variar inclusive o tamanho do campo:<br>Bandeira Mastercard –06 dígitos<br>Bandeira Visa –08 dígitos<br>Bandeira ELO –de 04 à 05 dígitos<br>Bandeira Hipercard –06 dígitos<br>Para demais bandeiras, como Amex e JCB, o campo pode ser preenchido com “0” zeros. Tamanho: 11."
                          },
                          "SubEstablishment": {
                            "properties": {
                              "EstablishmentCode": {
                                "type": "string",
                                "description": "**Obrigatório para facilitadores**. Código do estabelecimento do sub Merchant. “Sub-Merchant ID” (Cadastro do subcredenciado com o facilitador). Tamanho: 15."
                              },
                              "Identity": {
                                "type": "string",
                                "description": "**Obrigatório para facilitadores**. CNPJ ou CPF do sub-merchant. Tamanho: 14."
                              },
                              "Mcc": {
                                "type": "string",
                                "description": "**Obrigatório para facilitadores**. MCC do sub Merchant. Tamanho: 4."
                              },
                              "Address": {
                                "type": "string",
                                "description": "**Obrigatório para facilitadores**. Endereço do sub Merchant. Tamanho: 22."
                              },
                              "City": {
                                "type": "string",
                                "description": "**Obrigatório para facilitadores**. Cidade do sub Merchant. Tamanho: 13."
                              },
                              "State": {
                                "type": "string",
                                "description": "**Obrigatório para facilitadores**. Estado do sub Merchant. Tamanho: 2."
                              },
                              "PostalCode": {
                                "type": "string",
                                "description": "**Obrigatório para facilitadores**. Código postal do sub Merchant. Tamanho: 9."
                              },
                              "CountryCode": {
                                "type": "string",
                                "description": "**Obrigatório para facilitadores**. Código país do sub-merchant com base no ISO 3166<br>Ex: código ISO 3166 do Brasil é o 076.<a href=\"https://www.iso.org/obp/ui/#search/code/\" target=\"_blank\">Lista completa online</a>. Tamanho: 3."
                              },
                              "PhoneNumber": {
                                "type": "string",
                                "description": "**Obrigatório para facilitadores**. Número de telefone do sub Merchant. Tamanho: 13."
                              }
                            },
                            "required": [],
                            "type": "object"
                          }
                        },
                        "required": [],
                        "type": "object"
                      }
                    },
                    "required": [
                      "Type",
                      "Amount",
                      "Installments"
                    ],
                    "type": "object"
                  }
                }
              },
              "examples": {
                "Request Example": {
                  "value": {
                    "MerchantOrderId": "Loja123456",
                    "Customer": {
                      "Name": "QRCode Test"
                    },
                    "Payment": {
                      "Type": "qrcode",
                      "Amount": 100,
                      "Installments": 1,
                      "Capture": false,
                      "Modality": "Credit",
                      "QrCode": {
                        "MerchantName": "Loja Teste"
                      },
                      "PaymentFacilitator": {
                        "EstablishmentCode": "12345",
                        "SubEstablishment": {
                          "EstablishmentCode": "2000130733",
                          "Mcc": "8999",
                          "Address": "Av Marechal Camara 160",
                          "City": "Rio de Janeiro",
                          "State": "RJ",
                          "CountryCode": "76",
                          "PostalCode": "20020080",
                          "CompanyName": "Lojinha01",
                          "Identity": "90501654000191",
                          "PhoneNumber": "11987654321"
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
          "200": {
            "description": "200",
            "content": {
              "application/json": {
                "examples": {
                  "Result": {
                    "value": "{\n  \"MerchantOrderId\": \"Loja123456\",\n  \"Customer\": {\n    \"Name\": \"QRCode Test\"\n  },\n  \"Payment\": {\n    \"ServiceTaxAmount\": 0,\n    \"Installments\": 1,\n    \"Interest\": 0,\n    \"Capture\": false,\n    \"Authenticate\": false,\n    \"Recurrent\": false,\n    \"Provider\": \"Cielo\",\n    \"Amount\": 100,\n    \"ReceivedDate\": \"2019-01-02 10:14:29\",\n    \"Status\": 12,\n    \"IsSplitted\": false,\n    \"QrCode\": \"iVBORw0KGgoAAAANSUhEUgAAASwAAAEsCAYAAAB5fY51AAAQ1klEQVR42u3de6hlVR(...)\",\n    \"PaymentFacilitator\": {     \n        \"EstablishmentCode\": \"12345\",\n        \"SubEstablishment\": {\n            \"EstablishmentCode\": \"2000130733\",\n            \"Mcc\": \"8999\",\n            \"Address\": \"Av Marechal Camara 160\",\n            \"City\": \"Rio de Janeiro\",\n            \"State\": \"RJ\",\n            \"CountryCode\": \"76\",\n            \"PostalCode\": \"20020080\",\n            \"CompanyName\": \"Lojinha01\",\n            \"Identity\": \"90501654000191\",\n            \"PhoneNumber\": \"11987654321\"\n      }\n    },\n    \"ReturnMessage\": \"QRCode gerado com sucesso\",\n    \"PaymentId\": \"5d7e8fd3-70b6-4a88-9660-e064d72fdcdd\",\n    \"Type\": \"qrcode\",\n    \"Currency\": \"BRL\",\n    \"Country\": \"BRA\",\n    \"Links\": [\n      {\n        \"Method\": \"GET\",\n        \"Rel\": \"self\",\n        \"Href\": \"https://apiquerysandbox.cieloecommerce.cielo.com.br/1/sales/5d7e8fd3-70b6-4a88-9660-e064d72fdcdd\"\n      }\n    ]\n  }\n}"
                  }
                },
                "schema": {
                  "type": "object",
                  "properties": {
                    "MerchantOrderId": {
                      "type": "string",
                      "example": "Loja123456"
                    },
                    "Customer": {
                      "type": "object",
                      "properties": {
                        "Name": {
                          "type": "string",
                          "example": "QRCode Test"
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
                          "type": "integer",
                          "example": 0,
                          "default": 0
                        },
                        "Capture": {
                          "type": "boolean",
                          "example": false,
                          "default": true
                        },
                        "Authenticate": {
                          "type": "boolean",
                          "example": false,
                          "default": true
                        },
                        "Recurrent": {
                          "type": "boolean",
                          "example": false,
                          "default": true
                        },
                        "Provider": {
                          "type": "string",
                          "example": "Cielo"
                        },
                        "Amount": {
                          "type": "integer",
                          "example": 100,
                          "default": 0
                        },
                        "ReceivedDate": {
                          "type": "string",
                          "example": "2019-01-02 10:14:29"
                        },
                        "Status": {
                          "type": "integer",
                          "example": 12,
                          "default": 0
                        },
                        "IsSplitted": {
                          "type": "boolean",
                          "example": false,
                          "default": true
                        },
                        "QrCode": {
                          "type": "string",
                          "example": "iVBORw0KGgoAAAANSUhEUgAAASwAAAEsCAYAAAB5fY51AAAQ1klEQVR42u3de6hlVR(...)"
                        },
                        "PaymentFacilitator": {
                          "type": "object",
                          "properties": {
                            "EstablishmentCode": {
                              "type": "string",
                              "example": "12345"
                            },
                            "SubEstablishment": {
                              "type": "object",
                              "properties": {
                                "EstablishmentCode": {
                                  "type": "string",
                                  "example": "2000130733"
                                },
                                "Mcc": {
                                  "type": "string",
                                  "example": "8999"
                                },
                                "Address": {
                                  "type": "string",
                                  "example": "Av Marechal Camara 160"
                                },
                                "City": {
                                  "type": "string",
                                  "example": "Rio de Janeiro"
                                },
                                "State": {
                                  "type": "string",
                                  "example": "RJ"
                                },
                                "CountryCode": {
                                  "type": "string",
                                  "example": "76"
                                },
                                "PostalCode": {
                                  "type": "string",
                                  "example": "20020080"
                                },
                                "CompanyName": {
                                  "type": "string",
                                  "example": "Lojinha01"
                                },
                                "Identity": {
                                  "type": "string",
                                  "example": "90501654000191"
                                },
                                "PhoneNumber": {
                                  "type": "string",
                                  "example": "11987654321"
                                }
                              }
                            }
                          }
                        },
                        "ReturnMessage": {
                          "type": "string",
                          "example": "QRCode gerado com sucesso"
                        },
                        "PaymentId": {
                          "type": "string",
                          "example": "5d7e8fd3-70b6-4a88-9660-e064d72fdcdd"
                        },
                        "Type": {
                          "type": "string",
                          "example": "qrcode"
                        },
                        "Currency": {
                          "type": "string",
                          "example": "BRL"
                        },
                        "Country": {
                          "type": "string",
                          "example": "BRA"
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
                                "example": "https://apiquerysandbox.cieloecommerce.cielo.com.br/1/sales/5d7e8fd3-70b6-4a88-9660-e064d72fdcdd"
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