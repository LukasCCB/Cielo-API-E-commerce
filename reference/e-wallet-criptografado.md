---
updatedAt: 2026-04-02T18:33:39.000Z
agentTools:
  siteIndex: https://docs.cielo.com.br/llms.txt
  projectIndex: https://docs.cielo.com.br/ecommerce-cielo/llms.txt
---

# Criar pagamento com e-wallet com cartão criptografado

Cria uma transação de e-wallet usando um cartão criptografado

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
        `https://apisandbox.cieloecommerce.cielo.com.br/1/sales/`
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
        `https://api.cieloecommerce.cielo.com.br/1/sales/`
      </td>
    </tr>
  </tbody>
</Table>

<br />

<Callout icon="ℹ️" theme="info">
  Saiba mais sobre essa funcionalidade <a href="https://docs.cielo.com.br/ecommerce-cielo/docs/e-wallets" target="_blank">na documentação</a>.
</Callout>

A criação de um pagamento com cartão criptografado é indicado para estabelecimentos que não possuem certificação PCI DSS. A requisição contém o nó `Wallet`, o campo `WalletKey` (usado pela Cielo para descriptografar os dados das e-wallets) e tokens adicionais de acordo com cada e-wallet.

> ⚠️ Atenção
>
> * Quando o nó `Wallet` for enviado na requisição, o nó `CreditCard` passa a ser opcional;
> * Devido a necessidade de utilização de chaves efêmeras para realizar operações de crédito, a recorrência não está disponível para transações de e-wallets.
> * Aceitamos apenas cartões de crédito e débito via e-wallets.

### WalletKey

WalletKey é o identificador utilizado pela Cielo para descriptografar payloads retornados pela wallet.\
Confira a seguir os formatos de `WalletKey` a serem repassados a API Cielo E-commerce:

<Table align={["left","left","left"]}>
  <thead>
    <tr>
      <th>
        Carteira
      </th>

      <th>
        Exemplo
      </th>

      <th>

      </th>
    </tr>
  </thead>

  <tbody>
    <tr>
      <td>
        _Apple Pay_
      </td>

      <td>
        9zcCAciwoTS+qBx8jWb++64eHT2QZTWBs6qMVJ0GO+AqpcDVkxGPNpOR/D1bv5AZ62+5lKvucati0+eu7hdilwUYT3n5swkHuIzX2KO80Apx/<br />SkhoVM5dqgyKrak5VD2/drcGh9xqEanWkyd7wl200sYj4QUMbeLhyaY7bCdnnpKDJgpOY6J883fX3TiHoZorb/QlEEOpvYcbcFYs3ELZ7QVtjxyr<br />O2LmPsIkz2BgNm5f+JaJUSAOectahgLZnZR+easdhghrsa/E9A6DwjMd0fDYnxjj0bQDfaZpBPeGGPFLu5YYn1IDc
      </td>

      <td>

      </td>
    </tr>

    <tr>
      <td>
        _Samsung Pay_
      </td>

      <td>
        eyJhbGciOiJSU0ExXzUiLCJraWQiOiIvam1iMU9PL2hHdFRVSWxHNFpxY2VYclVEbmFOUFV1ZUR5M2FWeHBzYXVRPS<br />IsInR5cCI6IkpPU0UiLCJjaGFubmVsU2VjdXJpdHlDb250ZXh0IjoiUlNBX1BLSSIsImVuYyI6IkExMjhHQ00ifQ.cCsGbqgFdzVb1jhXNR<br />--gApzoXH-fdafddfa-Bo_utsmDN_DuGm69Kk2_nh6txa7ML9PCI59LFfOMniAf7ZwoZUBDCY7Oh8kx3wsZ0kxNBwfy<br />LBCMEYzET0qcIYxePezQpkNcaZ4oogmdNSpYY-KbZGMcWpo1DKhWphDVp0lZcLxA6Q25K78e5AtarR5whN4HUAkurQ.CFjWpHkAVoLCG8q0.NcsTuauebemJXmos_mLMTyLhEHL-<br />p5Wv6J88WkgzyjAt_DW7laiPMYw2sqRXkOiMJLwhifRzbSp8ZgJBM25IX05dKKSS4XfFjJQQjOBHw6PYtEF5pUDMLHML3jcddCrX07abfef_DuP41PqOQYsjwesLZ8XsRj-<br />R0TH4diOZ_GQop8_oawjRIo9eJr9Wbtho0h8kAzHYpfuhamOPT718EaGAY6SSrR7t6nBkzGNkrKAmHkC7aRwe.AbZG53wRqgF0XRG3wUK_UQ
      </td>

      <td>

      </td>
    </tr>

    <tr>
      <td>
        _Google Pay_
      </td>

      <td>
        `{
          "encryptedMessage":"0mXBb94Cy9JZhMuwtrBhMjXb8pDslrNsN5KhcEqnowOINqJgjXHD36KcCuzpQQ4cDAe64ZLmk2N3UBGXsN9hMMyeMakXlidVmteE<br />+QMaNZIor048oJqlUIFPD54B/ic8zCdqq3xnefUmyKQe0I03x57TcEA9xAT/E4x3rYfyqLFUAEtu2lT0GwTdwgrsT8pKoTldHIgP+wVNTjrKvJrB4xM/Bhn6JfcSmOzFyI6w37<br />mBU71/TK761nYOSxt7z1bNWSLZ4b8xBu1dlRgen2BSlqdafuQjV3UZjr6ubSvaJ8NiCh5FD/X013kAwLuLALMS2uAFS9j8cZ6R6zNIi13fK6Fe4ACbFTHw<br />LzSNZjQiaRDb6MlMnY8/amncPIOXzpirb5ScIz8EZUL05xd+3YWVTVfpqgFo1eaaS+wZdUyRG0QEgOsr6eLBoH8d5lfV9Rx6XdioorUuT7s1Yqc0OJZO<br />+fhBt6X0izE9hBGTexdZyg\\u003d\\u003d",
        "ephemeralPublicKey":"BMdwrkJeEgCOtLevYsN3MbdP8xbOItXiTejoB6vXy0Kn0ZM10jy4Aasd6jTSxtoxo<br />TpFydLhj5kzoOhbw2OzZu0\\u003d",
        "tag":"yAQIjWZ0VuCC7SWyYwc4eXOzpSUKhZduF9ip0Ji+Gj8\\u003d"
        }`
      </td>

      <td>

      </td>
    </tr>
  </tbody>
</Table>

### EphemeralPublicKey

Formato de `EphemeralPublicKey` que deve ser repassado a API Cielo E-commerce na integração da ApplePay:

| Carteira    | Exemplo                                                                                                                      |
| ----------- | ---------------------------------------------------------------------------------------------------------------------------- |
| *Apple Pay* | MFkwEwYHKoZIzj0CAQYIKoZIzj0DAQcDQgAEoedz1NqI6hs9hEO6dBsnn0X0xp5/DKj3gXirjEqxNIJ8JyhGxVB3ITd0E+6uG4W6Evt+kugG8gOhCBrdUU6JwQ== |

### Signature

Formato de `Signature` que deve ser repassado a API Cielo E-commerce na integração da GooglePay:

| Carteira     | Exemplo                                                                                               |
| ------------ | ----------------------------------------------------------------------------------------------------- |
| *Google Pay* | MEUCIQCGQLOmwxe5eFMSuTcr4EcwSZu35fB0KlCWcVop6ZxxhgIgbdtNHThSlynOopfxMIxkDs0cLh2NFh5es+J5uDmaViA\u003d |

### Resposta da transação de e-wallet com cartão criptografado

A tabela a seguir apresenta os principais parâmetros que podem ser retornados pela API na criação de um pagamento com e-wallets.

| Propriedade         | Descrição                                                                                                                        | Tipo   | Tamanho |
| ------------------- | -------------------------------------------------------------------------------------------------------------------------------- | ------ | ------- |
| `ProofOfSale`       | Número da autorização, idêntico ao NSU.                                                                                          | string | 6       |
| `Tid`               | Identificador da transação na adquirente.                                                                                        | string | 20      |
| `AuthorizationCode` | Código de autorização.                                                                                                           | string | 6       |
| `SoftDescriptor`    | Texto que será impresso na fatura bancária do portador. Disponível apenas para Visa e Master - não permite caracteres especiais. | string | 13      |
| `PaymentId`         | Campo identificador do pedido. Será usado no futuro para captura, cancelamento e consulta da transação.                          | GUID   | 36      |
| `ECI`               | *Electronic Commerce Indicator*. Representa o quão segura é uma transação.                                                       | string | 2       |
| `Status`            | Status da transação.                                                                                                             | byte   | 2       |
| `ReturnCode`        | Código de retorno.                                                                                                               | string | 32      |
| `ReturnMessage`     | Mensagem de retorno.                                                                                                             | string | --      |

# OpenAPI definition

```json
{
  "openapi": "3.1.0",
  "info": {
    "title": "e-wallets",
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
        "summary": "Criar pagamento com e-wallet com cartão criptografado",
        "description": "Cria uma transação de e-wallet usando um cartão criptografado",
        "operationId": "e-wallet-criptografado",
        "parameters": [
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
            "description": "Identificador do request, utilizado quando o lojista usa diferentes servidores para cada GET/POST/PUT. Tamanho: 36.",
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
                      },
                      "Status": {
                        "type": "string",
                        "description": "Status de cadastro do comprador na loja (\"NEW\" / \"EXISTING\"). Tamanho: 255."
                      }
                    },
                    "required": [],
                    "type": "object"
                  },
                  "Payment": {
                    "properties": {
                      "Type": {
                        "type": "string",
                        "description": "Tipo do meio de pagamento.Valores possíveis:<br>-\"CreditCard” para ApplePay, SamsungPay e GooglePay;<br>-\"DebitCard\" para ApplePay, SamsungPay e GooglePay;<br>-”Wallet” para PayPal.<br>Tamanho: 100."
                      },
                      "Amount": {
                        "type": "integer",
                        "description": "Valor do pedido, em centavos. Tamanho: 15.",
                        "format": "int32"
                      },
                      "Installments": {
                        "type": "integer",
                        "description": "Número de parcelas. Tamanho: 2.",
                        "format": "int32"
                      },
                      "Capture": {
                        "type": "boolean",
                        "description": "Indica se a autorização deve ser com captura automática (“true”) ou não (“false”). Se \"false\", será necessário realizar a captura posterior."
                      },
                      "Wallet": {
                        "properties": {
                          "Type": {
                            "type": "string",
                            "description": "Tipo de carteira. Valores possíveis:<br>- \"ApplePay\"<br>- \"SamsungPay\"<br>- \"AndroidPay\" para GooglePay"
                          },
                          "WalletKey": {
                            "type": "string",
                            "description": "Chave criptográfica que identifica lojas nas wallets. Consultar a tabela [WalletKey](https://docs.cielo.com.br/ecommerce-cielo/reference/e-wallet-criptografado#walletkey) para mais informações."
                          },
                          "AdditionalData": {
                            "properties": {
                              "EphemeralPublicKey": {
                                "type": "string",
                                "description": "Token retornado pela wallet. Obrigatório somente para ApplePay."
                              },
                              "Signature": {
                                "type": "string",
                                "description": "Token retornado pela wallet. Obrigatório somente para GooglePay."
                              }
                            },
                            "required": [],
                            "type": "object"
                          }
                        },
                        "required": [
                          "Type",
                          "WalletKey"
                        ],
                        "type": "object"
                      }
                    },
                    "required": [
                      "Type",
                      "Amount"
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
                      "Name": "Aline de Souza",
                      "Identity": "58154781050",
                      "IdentityType": "CPF"
                    },
                    "Payment": {
                      "Type": "CreditCard",
                      "Amount": 100,
                      "Installments": 1,
                      "Currency": "BRL",
                      "Capture": "false",
                      "Wallet": {
                        "AdditionalData": {
                          "EphemeralPublicKey": "TOKEN INFORMADO PELA WALLET"
                        },
                        "Type": "TIPO DE WALLET",
                        "WalletKey": "IDENTIFICADOR DA LOJA NA WALLET"
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
                    "value": "## e-wallet doc\n\n{\n  \"MerchantOrderId\": \"2014111703\",\n  \"Customer\": {\n    \"Name\": \"Aline de Souza\"\n  },\n  \"Payment\": {\n    \"ServiceTaxAmount\": 0,\n    \"Installments\": 1,\n    \"Interest\": 0,\n    \"Capture\": false,\n    \"Authenticate\": false,\n    \"Recurrent\": false,\n    \"CreditCard\": {\n      \"CardNumber\": \"58154781050\",\n      \"Holder\": \"Aline de Souza\",\n      \"ExpirationDate\": \"12/2035\",\n      \"SaveCard\": false,\n      \"Brand\": \"Visa\"\n    },\n    \"Tid\": \"27682184185GRQ5IDLOC\",\n    \"ProofOfSale\": \"817883\",\n    \"AuthorizationCode\": \"365335\",\n    \"Provider\": \"Cielo\",\n    \"Eci\": \"2\",\n    \"Wallet\": {\n      \"Type\": \"TIPO DE WALLET\",\n      \"Cavv\": \"AOlT0TkHSGD8868GS==\",\n      \"Eci\": 2,\n      \"AdditionalData\": {\n        \"EphemeralPublicKey\": \"TOKEN INFORMADO PELA WALLET\"\n      }\n    },\n    \"SentOrderId\": \"97653567\",\n    \"Amount\": 100,\n    \"AuthorizationCode\": \"027795\",\n    \"PaymentId\": \"e57b09eb-475b-44b6-ac71-01b9b82f2491\",\n    \"Amount\": 100,\n    \"ReceivedDate\": \"2018-03-19 16:08:16\",\n    \"CapturedAmount\": 100,\n    \"CapturedDate\": \"2018-03-18 12:06:24\",\n    \"SoftDescriptor\": \"123456789ABCD\",\n    \"Status\": 2,\n    \"ReturnMessage\": \"Transacao capturada com sucesso\",\n    \"ReturnCode\": \"00\",\n    \"Type\": \"CreditCard\",\n    \"Currency\": \"BRL\",\n    \"Country\": \"BRA\",\n    \"Links\": [\n      {\n        \"Method\": \"GET\",\n        \"Rel\": \"self\",\n        \"Href\": \"https://apiquery.cieloecommerce.cielo.com.br/1/sales/d596c890-9c51-48c8-99ce-fcb70c6b9cc9\"\n      },\n      {\n        \"Method\": \"PUT\",\n        \"Rel\": \"void\",\n        \"Href\": \"https://api.cieloecommerce.cielo.com.br/1/sales/d596c890-9c51-48c8-99ce-fcb70c6b9cc9/void\"\n      }\n    ]\n  }\n}"
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
                          "example": "Nome comprador"
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
                        "CreditCard": {
                          "type": "object",
                          "properties": {
                            "CardNumber": {
                              "type": "string",
                              "example": "453211******1521"
                            },
                            "Holder": {
                              "type": "string",
                              "example": "Titular do cartão"
                            },
                            "ExpirationDate": {
                              "type": "string",
                              "example": "08/2020"
                            },
                            "SaveCard": {
                              "type": "boolean",
                              "example": false,
                              "default": true
                            },
                            "Brand": {
                              "type": "string",
                              "example": "Visa"
                            }
                          }
                        },
                        "Tid": {
                          "type": "string",
                          "example": "0319040817883"
                        },
                        "ProofOfSale": {
                          "type": "string",
                          "example": "817883"
                        },
                        "AuthorizationCode": {
                          "type": "string",
                          "example": "027795"
                        },
                        "Wallet": {
                          "type": "object",
                          "properties": {
                            "Type": {
                              "type": "string",
                              "example": "TIPO DE WALLET"
                            },
                            "WalletKey": {
                              "type": "string",
                              "example": "IDENTIFICADOR DA LOJA NA WALLET"
                            },
                            "Eci": {
                              "type": "integer",
                              "example": 0,
                              "default": 0
                            },
                            "AdditionalData": {
                              "type": "object",
                              "properties": {
                                "EphemeralPublicKey": {
                                  "type": "string",
                                  "example": "TOKEN INFORMADO PELA WALLET"
                                }
                              }
                            }
                          }
                        },
                        "SoftDescriptor": {
                          "type": "string",
                          "example": "123456789ABCD"
                        },
                        "Amount": {
                          "type": "integer",
                          "example": 100,
                          "default": 0
                        },
                        "ReceivedDate": {
                          "type": "string",
                          "example": "2018-03-19 16:08:16"
                        },
                        "Status": {
                          "type": "integer",
                          "example": 1,
                          "default": 0
                        },
                        "IsSplitted": {
                          "type": "boolean",
                          "example": false,
                          "default": true
                        },
                        "ReturnMessage": {
                          "type": "string",
                          "example": "Operation Successful"
                        },
                        "ReturnCode": {
                          "type": "string",
                          "example": "4"
                        },
                        "PaymentId": {
                          "type": "string",
                          "example": "e57b09eb-475b-44b6-ac71-01b9b82f2491"
                        },
                        "Type": {
                          "type": "string",
                          "example": "CreditCard"
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