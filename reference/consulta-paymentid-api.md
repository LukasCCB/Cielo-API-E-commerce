---
updatedAt: 2026-10-20T18:39:31.000Z
agentTools:
  siteIndex: https://docs.cielo.com.br/llms.txt
  projectIndex: https://docs.cielo.com.br/ecommerce-cielo/llms.txt
---

# Consultar por PaymentId

Consulta uma transação informando o `PaymentId`

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
        `https://apiquerysandbox.cieloecommerce.cielo.com.br/1/sales/{PaymentId}`
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
        `https://apiquery.cieloecommerce.cielo.com.br/1/sales/{PaymentId}`
      </td>
    </tr>
  </tbody>
</Table>

<br />

<Callout icon="ℹ️" theme="info">
  Saiba mais sobre essa funcionalidade <a href="https://docs.cielo.com.br/ecommerce-cielo/docs/consulta" target="_blank">na documentação</a>.
</Callout>

<br />

<Callout icon="ℹ️" theme="info">
  Apenas as transações dentro dos últimos três meses podem ser consultadas via API.
</Callout>

* O `PaymentId` é o identificador retornado na criação da transação (de qualquer meio de pagamento);
* A consulta por `PaymentId` irá retornar todas as informações da transação, como dados do comprador, dados de pagamento e outras informações que foram enviadas e/ou retornadas na criação do pagamento;
* Use a consulta para recuperar o `IssuerTransactionId` e o `TransactionLinkId` da transação CIT quando a loja não os tiver armazenado. Saiba mais em <Anchor target="_blank" href="https://docs.cielo.com.br/ecommerce-cielo/docs/identificadores-de-bandeira">Identificadores de bandeira</Anchor>.

### TLID Mastercard

O **Transaction Link Identifier (TLID)**, enviado e retornado no campo `TransactionLinkId`, é um identificador único gerado pela bandeira **Mastercard** durante uma transação CIT, usado para vincular as transações MIT relacionadas. O TLID vale para a resposta do Zero Auth (apenas resposta) e para as transações de crédito, débito e recorrência própria.

Na Mastercard, envie `IssuerTransactionId` e `TransactionLinkId` juntos nas transações MIT: os dois parâmetros são obrigatórios.

| Fase   | Descrição                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                    |
| ------ | ---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| Fase 1 | Vigente. O campo `TransactionLinkId` está disponível na resposta da [validação de cartão por Zero Auth](https://docs.cielo.com.br/ecommerce-cielo/reference/validar-cartao), [criação de pagamento com cartão de crédito](https://docs.cielo.com.br/ecommerce-cielo/reference/criar-pagamento-credito), [criação de pagamento com cartão de débito](https://docs.cielo.com.br/ecommerce-cielo/reference/debito) e na [consulta por `PaymentId`](https://docs.cielo.com.br/ecommerce-cielo/reference/consulta-paymentid-api). |
| Fase 2 | Envio obrigatório do `TransactionLinkId` no request (MIT) a partir de **23/10/2026**.                                                                                                                                                                                                                                                                                                                                                                                                                                        |

> **Recorrência programada:** nas transações seguintes, os campos `IssuerTransactionId` e `TransactionLinkId` são enviados automaticamente.

O `TransactionLinkId` enviado no request deve ter exatamente 22 caracteres (A-Z, a-z, 0-9, hífen e sublinhado). Se o valor estiver fora desse formato, a Cielo o ignora, sem retornar erro. Quando a Cielo envia o TLID à bandeira, a resposta traz também o `SentTransactionLinkId`, com o valor enviado. O request do Zero Auth não aceita o campo.

> Saiba mais em <Anchor target="_blank" href="https://docs.cielo.com.br/ecommerce-cielo/docs/identificadores-de-bandeira">Identificadores de bandeira</Anchor>.

<br />

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
    "/1/sales/{PaymentId}": {
      "get": {
        "summary": "Consultar por PaymentId",
        "description": "Consulta uma transação informando o `PaymentId`",
        "operationId": "consulta-paymentid-api",
        "parameters": [
          {
            "name": "PaymentId",
            "in": "path",
            "description": "Número de identificação do pagamento, necessário para futuras operações como Consulta, Captura e Cancelamento. Tamanho: 36.",
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
        "responses": {
          "200": {
            "description": "200",
            "content": {
              "application/json": {
                "examples": {
                  "Transação de crédito": {
                    "value": {
                      "MerchantOrderId": "Loja123456",
                      "Customer": {
                        "Name": "Comprador crédito completo",
                        "Email": "compradorteste@teste.com",
                        "Birthdate": "1991-01-02",
                        "Address": {
                          "Street": "Rua Teste",
                          "Number": "123",
                          "Complement": "AP 123",
                          "ZipCode": "12345987",
                          "City": "Rio de Janeiro",
                          "State": "RJ",
                          "Country": "BRA"
                        }
                      },
                      "Payment": {
                        "ServiceTaxAmount": 0,
                        "Installments": 1,
                        "Interest": "ByMerchant",
                        "Capture": true,
                        "Authenticate": false,
                        "Recurrent": false,
                        "IssuerTransactionId": "580027442382078",
                        "CreditCard": {
                          "CardNumber": "123412******1234",
                          "Holder": "Teste Holder",
                          "ExpirationDate": "12/2030",
                          "Brand": "Visa",
                          "PaymentAccountReference": "NUKBZZQ3E34FLV2SAHZXJBVSGWWV8"
                        },
                        "ProofOfSale": "553486",
                        "Tid": "1212092931654",
                        "AuthorizationCode": "520520",
                        "PaymentId": "2352fc91-f9a4-4ca2-aedb-31488b9658c9",
                        "Type": "CreditCard",
                        "Amount": 15700,
                        "ReceivedDate": "2024-12-12 09:29:31",
                        "CapturedAmount": 15700,
                        "CapturedDate": "2024-12-12 09:29:31",
                        "Currency": "BRL",
                        "Country": "BRA",
                        "Provider": "Simulado",
                        "Status": 2,
                        "Links": [
                          {
                            "Method": "GET",
                            "Rel": "self",
                            "Href": "https://apiquerysandbox.cieloecommerce.cielo.com.br/1/sales/2352fc91-f9a4-4ca2-aedb-31488b9658c9"
                          },
                          {
                            "Method": "PUT",
                            "Rel": "void",
                            "Href": "https://apisandbox.cieloecommerce.cielo.com.br/1/sales/2352fc91-f9a4-4ca2-aedb-31488b9658c9/void"
                          }
                        ]
                      }
                    }
                  },
                  "Transação de débito": {
                    "value": {
                      "MerchantOrderId": "Loja123456",
                      "AcquirerOrderId": "20241212094051698547",
                      "Customer": {
                        "Name": "Comprador Cartão de débito",
                        "Address": {}
                      },
                      "Payment": {
                        "DebitCard": {
                          "CardNumber": "555187******0181",
                          "Holder": "Teste Holder",
                          "ExpirationDate": "12/2030",
                          "Brand": "Master",
                          "PaymentAccountReference": "9T9L0KBWPKHLRG1F6293IOHH3QIBN"
                        },
                        "IssuerTransactionId": "580027442382078",
                        "Authenticate": true,
                        "Recurrent": false,
                        "ProofOfSale": "713091",
                        "Tid": "1212094051254",
                        "AuthorizationCode": "365720",
                        "PaymentId": "6b0815aa-2e8e-49d6-b808-a25b99061bca",
                        "Type": "DebitCard",
                        "Amount": 15700,
                        "ReceivedDate": "2024-12-12 09:40:51",
                        "CapturedAmount": 15700,
                        "CapturedDate": "2024-12-12 09:40:51",
                        "Currency": "BRL",
                        "Country": "BRA",
                        "Provider": "Simulado",
                        "Status": 2,
                        "Links": [
                          {
                            "Method": "GET",
                            "Rel": "self",
                            "Href": "https://apiquerysandbox.cieloecommerce.cielo.com.br/1/sales/6b0815aa-2e8e-49d6-b808-a25b99061bca"
                          }
                        ]
                      }
                    }
                  },
                  "Transação Pix": {
                    "value": "{\n  \"MerchantOrderId\": \"Loja123456\",\n  \"AcquirerOrderId\": \"ECO77777MEVKS5WE\",\n  \"Customer\": {\n    \"Name\": \"Nome do Pagador\",\n    \"Identity\": \"12345678909\",\n    \"Address\": {}\n  },\n  \"Payment\": {\n    \"Installments\": 1,\n    \"Tid\": \"c9a447a4-1511-3aea-8a67-6057905e4302\",\n    \"ProofOfSale\": \"00000075\",\n    \"PaymentId\": \"47a16937-7275-4088-a7de-e2a9d70f1ca4\",\n    \"Type\": \"Pix\",\n    \"Amount\": 100,\n    \"ReceivedDate\": \"2024-12-13 11:14:11\",\n    \"Currency\": \"BRL\",\n    \"Country\": \"BRA\",\n    \"Provider\": \"Cielo\",\n    \"Status\": 12,\n    \"Links\": [\n      {\n        \"Method\": \"GET\",\n        \"Rel\": \"self\",\n        \"Href\": \"https://apiquerysandbox.cieloecommerce.cielo.com.br/1/sales/47a16937-7275-4088-a7de-e2a9d70f1ca4\"\n      }\n    ]\n  }\n}"
                  },
                  "Transação QR Code": {
                    "value": "{\n  \"MerchantOrderId\": \"Loja123456\",\n  \"Customer\": {\n    \"Name\": \"QRCode Test\",\n    \"Address\": {}\n  },\n  \"Payment\": {\n    \"ServiceTaxAmount\": 0,\n    \"Installments\": 1,\n    \"Interest\": \"ByMerchant\",\n    \"Capture\": false,\n    \"Authenticate\": false,\n    \"Recurrent\": false,\n    \"PaymentId\": \"13479370-588f-4a62-abbb-c86c4cb34516\",\n    \"Type\": \"CreditCard\",\n    \"Amount\": 100,\n    \"ReceivedDate\": \"2024-12-16 09:52:42\",\n    \"Currency\": \"BRL\",\n    \"Country\": \"BRA\",\n    \"Provider\": \"Cielo\",\n    \"Status\": 12,\n    \"Links\": [\n      {\n        \"Method\": \"GET\",\n        \"Rel\": \"self\",\n        \"Href\": \"https://apiquerysandbox.cieloecommerce.cielo.com.br/1/sales/13479370-588f-4a62-abbb-c86c4cb34516\"\n      }\n    ]\n  }\n}"
                  },
                  "Transação de boleto": {
                    "value": "{\n  \"MerchantOrderId\": \"Loja123456\",\n  \"AcquirerOrderId\": \"123\",\n  \"Customer\": {\n    \"Name\": \"Comprador Teste Boleto\",\n    \"Identity\": \"1234567890\",\n    \"Address\": {\n      \"Street\": \"Avenida Marechal Câmara\",\n      \"Number\": \"160\",\n      \"Complement\": \"Sala 934\",\n      \"ZipCode\": \"22750012\",\n      \"City\": \"Rio de Janeiro\",\n      \"State\": \"RJ\",\n      \"Country\": \"BRA\",\n      \"District\": \"Centro\"\n    }\n  },\n  \"Payment\": {\n    \"Instructions\": \"Aceitar somente até a data de vencimento, após essa data juros de 1% dia.\",\n    \"ExpirationDate\": \"2020-12-31\",\n    \"Demostrative\": \"Desmonstrative Teste\",\n    \"Url\": \"https://transactionsandbox.pagador.com.br/post/pagador/reenvia.asp/2dd4aeb5-9472-4c02-b978-874f5d8f8852\",\n    \"BoletoNumber\": \"123-2\",\n    \"BarCodeNumber\": \"00092848600000157009999250000000012399999990\",\n    \"DigitableLine\": \"00099.99921 50000.000013 23999.999909 2 84860000015700\",\n    \"Assignor\": \"Empresa Teste\",\n    \"Address\": \"Rua Teste\",\n    \"Identification\": \"11884926754\",\n    \"PaymentId\": \"2dd4aeb5-9472-4c02-b978-874f5d8f8852\",\n    \"Type\": \"Boleto\",\n    \"Amount\": 15700,\n    \"ReceivedDate\": \"2024-12-16 09:47:37\",\n    \"Currency\": \"BRL\",\n    \"Country\": \"BRA\",\n    \"Provider\": \"Simulado\",\n    \"Status\": 1,\n    \"Links\": [\n      {\n        \"Method\": \"GET\",\n        \"Rel\": \"self\",\n        \"Href\": \"https://apiquerysandbox.cieloecommerce.cielo.com.br/1/sales/2dd4aeb5-9472-4c02-b978-874f5d8f8852\"\n      }\n    ]\n  }\n}"
                  }
                },
                "schema": {
                  "oneOf": [
                    {
                      "title": "Transação de crédito",
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
                              "example": "Comprador crédito completo"
                            },
                            "Email": {
                              "type": "string",
                              "example": "compradorteste@teste.com"
                            },
                            "Birthdate": {
                              "type": "string",
                              "example": "1991-01-02"
                            },
                            "Address": {
                              "type": "object",
                              "properties": {
                                "Street": {
                                  "type": "string",
                                  "example": "Rua Teste"
                                },
                                "Number": {
                                  "type": "string",
                                  "example": "123"
                                },
                                "Complement": {
                                  "type": "string",
                                  "example": "AP 123"
                                },
                                "ZipCode": {
                                  "type": "string",
                                  "example": "12345987"
                                },
                                "City": {
                                  "type": "string",
                                  "example": "Rio de Janeiro"
                                },
                                "State": {
                                  "type": "string",
                                  "example": "RJ"
                                },
                                "Country": {
                                  "type": "string",
                                  "example": "BRA"
                                }
                              }
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
                              "type": "string",
                              "example": "ByMerchant"
                            },
                            "Capture": {
                              "type": "boolean",
                              "example": true,
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
                                  "example": "123412******1234"
                                },
                                "Holder": {
                                  "type": "string",
                                  "example": "Teste Holder"
                                },
                                "ExpirationDate": {
                                  "type": "string",
                                  "example": "12/2030"
                                },
                                "Brand": {
                                  "type": "string",
                                  "example": "Visa"
                                },
                                "PaymentAccountReference": {
                                  "type": "string",
                                  "example": "NUKBZZQ3E34FLV2SAHZXJBVSGWWV8"
                                }
                              }
                            },
                            "ProofOfSale": {
                              "type": "string",
                              "example": "553486"
                            },
                            "Tid": {
                              "type": "string",
                              "example": "1212092931654"
                            },
                            "AuthorizationCode": {
                              "type": "string",
                              "example": "520520"
                            },
                            "PaymentId": {
                              "type": "string",
                              "example": "2352fc91-f9a4-4ca2-aedb-31488b9658c9"
                            },
                            "Type": {
                              "type": "string",
                              "example": "CreditCard"
                            },
                            "Amount": {
                              "type": "integer",
                              "example": 15700,
                              "default": 0
                            },
                            "ReceivedDate": {
                              "type": "string",
                              "example": "2024-12-12 09:29:31"
                            },
                            "CapturedAmount": {
                              "type": "integer",
                              "example": 15700,
                              "default": 0
                            },
                            "CapturedDate": {
                              "type": "string",
                              "example": "2024-12-12 09:29:31"
                            },
                            "Currency": {
                              "type": "string",
                              "example": "BRL"
                            },
                            "Country": {
                              "type": "string",
                              "example": "BRA"
                            },
                            "Provider": {
                              "type": "string",
                              "example": "Simulado"
                            },
                            "Status": {
                              "type": "integer",
                              "example": 2,
                              "default": 0
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
                                    "example": "https://apiquerysandbox.cieloecommerce.cielo.com.br/1/sales/2352fc91-f9a4-4ca2-aedb-31488b9658c9"
                                  }
                                }
                              }
                            }
                          }
                        }
                      }
                    },
                    {
                      "title": "Transação de débito",
                      "type": "object",
                      "properties": {
                        "MerchantOrderId": {
                          "type": "string",
                          "example": "Loja123456"
                        },
                        "AcquirerOrderId": {
                          "type": "string",
                          "example": "20241212094051698547"
                        },
                        "Customer": {
                          "type": "object",
                          "properties": {
                            "Name": {
                              "type": "string",
                              "example": "Comprador Cartão de débito"
                            },
                            "Address": {
                              "type": "object",
                              "properties": {}
                            }
                          }
                        },
                        "Payment": {
                          "type": "object",
                          "properties": {
                            "DebitCard": {
                              "type": "object",
                              "properties": {
                                "CardNumber": {
                                  "type": "string",
                                  "example": "555187******0181"
                                },
                                "Holder": {
                                  "type": "string",
                                  "example": "Teste Holder"
                                },
                                "ExpirationDate": {
                                  "type": "string",
                                  "example": "12/2030"
                                },
                                "Brand": {
                                  "type": "string",
                                  "example": "Master"
                                },
                                "PaymentAccountReference": {
                                  "type": "string",
                                  "example": "9T9L0KBWPKHLRG1F6293IOHH3QIBN"
                                }
                              }
                            },
                            "Authenticate": {
                              "type": "boolean",
                              "example": true,
                              "default": true
                            },
                            "Recurrent": {
                              "type": "boolean",
                              "example": false,
                              "default": true
                            },
                            "ProofOfSale": {
                              "type": "string",
                              "example": "713091"
                            },
                            "Tid": {
                              "type": "string",
                              "example": "1212094051254"
                            },
                            "AuthorizationCode": {
                              "type": "string",
                              "example": "365720"
                            },
                            "PaymentId": {
                              "type": "string",
                              "example": "6b0815aa-2e8e-49d6-b808-a25b99061bca"
                            },
                            "Type": {
                              "type": "string",
                              "example": "DebitCard"
                            },
                            "Amount": {
                              "type": "integer",
                              "example": 15700,
                              "default": 0
                            },
                            "ReceivedDate": {
                              "type": "string",
                              "example": "2024-12-12 09:40:51"
                            },
                            "CapturedAmount": {
                              "type": "integer",
                              "example": 15700,
                              "default": 0
                            },
                            "CapturedDate": {
                              "type": "string",
                              "example": "2024-12-12 09:40:51"
                            },
                            "Currency": {
                              "type": "string",
                              "example": "BRL"
                            },
                            "Country": {
                              "type": "string",
                              "example": "BRA"
                            },
                            "Provider": {
                              "type": "string",
                              "example": "Simulado"
                            },
                            "Status": {
                              "type": "integer",
                              "example": 2,
                              "default": 0
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
                                    "example": "https://apiquerysandbox.cieloecommerce.cielo.com.br/1/sales/6b0815aa-2e8e-49d6-b808-a25b99061bca"
                                  }
                                }
                              }
                            }
                          }
                        }
                      }
                    },
                    {
                      "title": "Transação Pix",
                      "type": "object",
                      "properties": {
                        "MerchantOrderId": {
                          "type": "string",
                          "example": "Loja123456"
                        },
                        "AcquirerOrderId": {
                          "type": "string",
                          "example": "ECO77777MEVKS5WE"
                        },
                        "Customer": {
                          "type": "object",
                          "properties": {
                            "Name": {
                              "type": "string",
                              "example": "Nome do Pagador"
                            },
                            "Identity": {
                              "type": "string",
                              "example": "12345678909"
                            },
                            "Address": {
                              "type": "object",
                              "properties": {}
                            }
                          }
                        },
                        "Payment": {
                          "type": "object",
                          "properties": {
                            "Installments": {
                              "type": "integer",
                              "example": 1,
                              "default": 0
                            },
                            "Tid": {
                              "type": "string",
                              "example": "c9a447a4-1511-3aea-8a67-6057905e4302"
                            },
                            "ProofOfSale": {
                              "type": "string",
                              "example": "00000075"
                            },
                            "PaymentId": {
                              "type": "string",
                              "example": "47a16937-7275-4088-a7de-e2a9d70f1ca4"
                            },
                            "Type": {
                              "type": "string",
                              "example": "Pix"
                            },
                            "Amount": {
                              "type": "integer",
                              "example": 100,
                              "default": 0
                            },
                            "ReceivedDate": {
                              "type": "string",
                              "example": "2024-12-13 11:14:11"
                            },
                            "Currency": {
                              "type": "string",
                              "example": "BRL"
                            },
                            "Country": {
                              "type": "string",
                              "example": "BRA"
                            },
                            "Provider": {
                              "type": "string",
                              "example": "Cielo"
                            },
                            "Status": {
                              "type": "integer",
                              "example": 12,
                              "default": 0
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
                                    "example": "https://apiquerysandbox.cieloecommerce.cielo.com.br/1/sales/47a16937-7275-4088-a7de-e2a9d70f1ca4"
                                  }
                                }
                              }
                            }
                          }
                        }
                      }
                    },
                    {
                      "title": "Transação QR Code",
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
                            },
                            "Address": {
                              "type": "object",
                              "properties": {}
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
                              "type": "string",
                              "example": "ByMerchant"
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
                            "PaymentId": {
                              "type": "string",
                              "example": "13479370-588f-4a62-abbb-c86c4cb34516"
                            },
                            "Type": {
                              "type": "string",
                              "example": "CreditCard"
                            },
                            "Amount": {
                              "type": "integer",
                              "example": 100,
                              "default": 0
                            },
                            "ReceivedDate": {
                              "type": "string",
                              "example": "2024-12-16 09:52:42"
                            },
                            "Currency": {
                              "type": "string",
                              "example": "BRL"
                            },
                            "Country": {
                              "type": "string",
                              "example": "BRA"
                            },
                            "Provider": {
                              "type": "string",
                              "example": "Cielo"
                            },
                            "Status": {
                              "type": "integer",
                              "example": 12,
                              "default": 0
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
                                    "example": "https://apiquerysandbox.cieloecommerce.cielo.com.br/1/sales/13479370-588f-4a62-abbb-c86c4cb34516"
                                  }
                                }
                              }
                            }
                          }
                        }
                      }
                    },
                    {
                      "title": "Transação de boleto",
                      "type": "object",
                      "properties": {
                        "MerchantOrderId": {
                          "type": "string",
                          "example": "Loja123456"
                        },
                        "AcquirerOrderId": {
                          "type": "string",
                          "example": "123"
                        },
                        "Customer": {
                          "type": "object",
                          "properties": {
                            "Name": {
                              "type": "string",
                              "example": "Comprador Teste Boleto"
                            },
                            "Identity": {
                              "type": "string",
                              "example": "1234567890"
                            },
                            "Address": {
                              "type": "object",
                              "properties": {
                                "Street": {
                                  "type": "string",
                                  "example": "Avenida Marechal Câmara"
                                },
                                "Number": {
                                  "type": "string",
                                  "example": "160"
                                },
                                "Complement": {
                                  "type": "string",
                                  "example": "Sala 934"
                                },
                                "ZipCode": {
                                  "type": "string",
                                  "example": "22750012"
                                },
                                "City": {
                                  "type": "string",
                                  "example": "Rio de Janeiro"
                                },
                                "State": {
                                  "type": "string",
                                  "example": "RJ"
                                },
                                "Country": {
                                  "type": "string",
                                  "example": "BRA"
                                },
                                "District": {
                                  "type": "string",
                                  "example": "Centro"
                                }
                              }
                            }
                          }
                        },
                        "Payment": {
                          "type": "object",
                          "properties": {
                            "Instructions": {
                              "type": "string",
                              "example": "Aceitar somente até a data de vencimento, após essa data juros de 1% dia."
                            },
                            "ExpirationDate": {
                              "type": "string",
                              "example": "2020-12-31"
                            },
                            "Demostrative": {
                              "type": "string",
                              "example": "Desmonstrative Teste"
                            },
                            "Url": {
                              "type": "string",
                              "example": "https://transactionsandbox.pagador.com.br/post/pagador/reenvia.asp/2dd4aeb5-9472-4c02-b978-874f5d8f8852"
                            },
                            "BoletoNumber": {
                              "type": "string",
                              "example": "123-2"
                            },
                            "BarCodeNumber": {
                              "type": "string",
                              "example": "00092848600000157009999250000000012399999990"
                            },
                            "DigitableLine": {
                              "type": "string",
                              "example": "00099.99921 50000.000013 23999.999909 2 84860000015700"
                            },
                            "Assignor": {
                              "type": "string",
                              "example": "Empresa Teste"
                            },
                            "Address": {
                              "type": "string",
                              "example": "Rua Teste"
                            },
                            "Identification": {
                              "type": "string",
                              "example": "11884926754"
                            },
                            "PaymentId": {
                              "type": "string",
                              "example": "2dd4aeb5-9472-4c02-b978-874f5d8f8852"
                            },
                            "Type": {
                              "type": "string",
                              "example": "Boleto"
                            },
                            "Amount": {
                              "type": "integer",
                              "example": 15700,
                              "default": 0
                            },
                            "ReceivedDate": {
                              "type": "string",
                              "example": "2024-12-16 09:47:37"
                            },
                            "Currency": {
                              "type": "string",
                              "example": "BRL"
                            },
                            "Country": {
                              "type": "string",
                              "example": "BRA"
                            },
                            "Provider": {
                              "type": "string",
                              "example": "Simulado"
                            },
                            "Status": {
                              "type": "integer",
                              "example": 1,
                              "default": 0
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
                                    "example": "https://apiquerysandbox.cieloecommerce.cielo.com.br/1/sales/2dd4aeb5-9472-4c02-b978-874f5d8f8852"
                                  }
                                }
                              }
                            }
                          }
                        }
                      }
                    }
                  ]
                }
              }
            }
          },
          "201": {
            "content": {
              "application/json": {
                "schema": {
                  "type": "object",
                  "properties": {}
                },
                "examples": {
                  "Retorno Mastercard TransactionLinkId": {
                    "summary": "Retorno Mastercard TransactionLinkId",
                    "value": {
                      "MerchantOrderId": "Loja123456",
                      "Customer": {
                        "Name": "Comprador crédito completo",
                        "Email": "compradorteste@teste.com",
                        "Birthdate": "1991-01-02",
                        "Address": {
                          "Street": "Rua Teste",
                          "Number": "123",
                          "Complement": "AP 123",
                          "ZipCode": "12345987",
                          "City": "Rio de Janeiro",
                          "State": "RJ",
                          "Country": "BRA"
                        }
                      },
                      "Payment": {
                        "ServiceTaxAmount": 0,
                        "Installments": 1,
                        "Interest": "ByMerchant",
                        "Capture": true,
                        "Authenticate": false,
                        "Recurrent": false,
                        "IssuerTransactionId": "580027442382078",
                        "TransactionLinkId": "aH3nV6qP_2sKe-8YjW1uBf",
                        "CreditCard": {
                          "CardNumber": "123412******1234",
                          "Holder": "Teste Holder",
                          "ExpirationDate": "12/2030",
                          "Brand": "Master",
                          "PaymentAccountReference": "NUKBZZQ3E34FLV2SAHZXJBVSGWWV8"
                        },
                        "ProofOfSale": "553486",
                        "Tid": "1212092931654",
                        "AuthorizationCode": "520520",
                        "PaymentId": "2352fc91-f9a4-4ca2-aedb-31488b9658c9",
                        "Type": "CreditCard",
                        "Amount": 15700,
                        "ReceivedDate": "2024-12-12 09:29:31",
                        "CapturedAmount": 15700,
                        "CapturedDate": "2024-12-12 09:29:31",
                        "Currency": "BRL",
                        "Country": "BRA",
                        "Provider": "Simulado",
                        "Status": 2,
                        "Links": [
                          {
                            "Method": "GET",
                            "Rel": "self",
                            "Href": "https://apiquerysandbox.cieloecommerce.cielo.com.br/1/sales/2352fc91-f9a4-4ca2-aedb-31488b9658c9"
                          },
                          {
                            "Method": "PUT",
                            "Rel": "void",
                            "Href": "https://apisandbox.cieloecommerce.cielo.com.br/1/sales/2352fc91-f9a4-4ca2-aedb-31488b9658c9/void"
                          }
                        ]
                      }
                    }
                  }
                }
              }
            },
            "description": "Created"
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