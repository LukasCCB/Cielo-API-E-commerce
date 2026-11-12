---
updatedAt: 2026-10-20T18:39:31.000Z
agentTools:
  siteIndex: https://docs.cielo.com.br/llms.txt
  projectIndex: https://docs.cielo.com.br/ecommerce-cielo/llms.txt
---

# Criar pagamento com cartão tokenizado

Cria uma transação usando um cartão tokenizado anteriormente

<Table align={["left","left","left"]}>
  <thead>
    <tr>
      <th>
        Ambiente
      </th>

      <th>
        Método
      </th>

      <th>
        Endpoint
      </th>
    </tr>
  </thead>

  <tbody>
    <tr>
      <td>
        Sandbox
      </td>

      <td>
        <div class="headline-container-article-info2GaOf2jMpV0r">
          <span class="rm-APIMethod APIMethod APIMethod_fixedWidth APIMethod_post headline-container-api-method1Hc-Fm7uaccR" data-testid="http-method">post</span>
        </div>
      </td>

      <td>
        `https://apisandbox.cieloecommerce.cielo.com.br/1/sales/`
      </td>
    </tr>

    <tr>
      <td>
        Produção
      </td>

      <td>
        <div class="headline-container-article-info2GaOf2jMpV0r">
          <span class="rm-APIMethod APIMethod APIMethod_fixedWidth APIMethod_post headline-container-api-method1Hc-Fm7uaccR" data-testid="http-method">post</span>
        </div>
      </td>

      <td>
        `https://api.cieloecommerce.cielo.com.br/1/sales/`
      </td>
    </tr>
  </tbody>
</Table>

<br />

<Callout icon="ℹ️" theme="info">
  ###

  Saiba mais sobre essa funcionalidade <a href="https://docs.cielo.com.br/ecommerce-cielo/docs/cielo-tokenization" target="_blank">na documentação</a>.
</Callout>

Essa é uma transação de cartão de crédito, mas no lugar de enviar os dados do cartão aberto, é possível criar a transação informando um `CardToken` criado previamente.

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

### Resposta da transação de cartão de crédito usando cartão tokenizado

A tabela a seguir apresenta os principais parâmetros que podem ser retornados pela API na criação de um pagamento com cartão de crédito tokenizado.

<Table align={["left","left","left","left"]}>
  <thead>
    <tr>
      <th>
        Propriedade
      </th>

      <th>
        Descrição
      </th>

      <th>
        Tipo
      </th>

      <th>
        Tamanho
      </th>
    </tr>
  </thead>

  <tbody>
    <tr>
      <td>
        `ProofOfSale`
      </td>

      <td>
        Número da autorização, idêntico ao NSU.
      </td>

      <td>
        string
      </td>

      <td>
        6
      </td>
    </tr>

    <tr>
      <td>
        `Tid`
      </td>

      <td>
        Identificador da transação na adquirente.
      </td>

      <td>
        string
      </td>

      <td>
        20
      </td>
    </tr>

    <tr>
      <td>
        `AuthorizationCode`
      </td>

      <td>
        Código de autorização.
      </td>

      <td>
        string
      </td>

      <td>
        6
      </td>
    </tr>

    <tr>
      <td>
        `PaymentId`
      </td>

      <td>
        Número de identificação do pagamento.<br />O `PaymentId` será usado em futuras operações como consulta, captura e cancelamento.
      </td>

      <td>
        GUID
      </td>

      <td>
        36
      </td>
    </tr>

    <tr>
      <td>
        `Status`
      </td>

      <td>
        Status da Transação. Veja a tabela completa de [Status transacional](https://docs.cielo.com.br/ecommerce-cielo/reference/payment-status)
      </td>

      <td>
        byte
      </td>

      <td>
        ***
      </td>
    </tr>

    <tr>
      <td>
        `ReturnCode`
      </td>

      <td>
        Código de retorno.
      </td>

      <td>
        string
      </td>

      <td>
        32
      </td>
    </tr>

    <tr>
      <td>
        `ReturnMessage`
      </td>

      <td>
        Mensagem de retorno.
      </td>

      <td>
        string
      </td>

      <td>
        512
      </td>
    </tr>

    <tr>
      <td>
        `Payment.MerchantAdviceCode`
      </td>

      <td>
        Código de retorno da bandeira que define período para retentativa. _Válido somente para bandeira Mastercard_. Saiba mais [Programa de retentativa das bandeiras para Mastercard](https://docs.cielo.com.br/ecommerce-cielo/reference/retentativa-bandeira#mastercard)
      </td>

      <td>
        string
      </td>

      <td>
        2
      </td>
    </tr>

    <tr>
      <td>
        `TryAutomaticCancellation`
      </td>

      <td>
        Retorna como "true" se a Garantia de Cancelamento estiver habilitada e ocorrer algum erro durante a autorização (status Não Finalizada - "0").
      </td>

      <td>
        boolean
      </td>

      <td>
        -
      </td>
    </tr>

    <tr>
      <td>
        `Payment.CreditCard.PaymentAccountReference`
      </td>

      <td>
        O PAR (Payment Account Reference) é o número que associa diferentes tokens a um mesmo cartão. Será retornado pelas bandeiras Master e Visa e repassado para os clientes do e-commerce Cielo. Caso a bandeira não envie a informação o campo não será retornado.
      </td>

      <td>
        string
      </td>

      <td>
        29
      </td>
    </tr>

    <tr>
      <td>
        `Payment.IssuerTransactionId`
      </td>

      <td>
        Identificador da transação gerado pela bandeira e retornado na resposta da transação CIT. Armazene o valor para enviá-lo nas transações MIT seguintes: o envio é obrigatório, para todas as bandeiras, em transações recorrentes, incrementais e reautorizadas. Consulte mais informações em <Anchor target="_blank" href="https://docs.cielo.com.br/ecommerce-cielo/docs/identificadores-de-bandeira">Identificadores de bandeira</Anchor>.
      </td>

      <td>
        string
      </td>

      <td>
        30
      </td>
    </tr>

    <tr>
      <td>
        `Payment.TransactionLinkId`
      </td>

      <td>
        Identificador único (TLID) gerado pela Mastercard e retornado na resposta, usado para vincular a transação CIT às transações MIT seguintes. Na Mastercard, envie o `TransactionLinkId` original junto com o `IssuerTransactionId`: os dois são obrigatórios, e o envio do `TransactionLinkId` é obrigatório a partir de 23/10/2026. Consulte mais informações em <Anchor target="_blank" href="https://docs.cielo.com.br/ecommerce-cielo/docs/identificadores-de-bandeira">Identificadores de bandeira</Anchor>.

        **Formato**: 22 caracteres alfanuméricos (A-Z, a-z), com diferenciação entre maiúsculas e minúsculas e podem incluir hífens (-) e sublinhados (\_).
      </td>

      <td>
        string
      </td>

      <td>
        22
      </td>
    </tr>
  </tbody>
</Table>

<br />

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
    "/1/sales/": {
      "post": {
        "summary": "Criar pagamento com cartão tokenizado",
        "description": "Cria uma transação usando um cartão tokenizado anteriormente",
        "operationId": "cartao-tokenizado-api",
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
                  "MerchantOrderId"
                ],
                "properties": {
                  "MerchantOrderId": {
                    "type": "string",
                    "description": "Número de identificação do pedido. *Atenção: Os caracteres permitidos são apenas a-z, A-Z, 0-9. Não são permitidos caracteres especiais e espaços em branco.* Tamanho: 20."
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
                        "description": "Tipo do meio de pagamento."
                      },
                      "Amount": {
                        "type": "string",
                        "description": "Valor do pedido (ser enviado em centavos). Tamanho: 15."
                      },
                      "Installments": {
                        "type": "integer",
                        "description": "Número de parcelas. Se a transação for uma recorrência, o número de parcelas será 1. Para transações parceladas, o número de parcelas será sempre maior que 1. Tamanho: 2.",
                        "format": "int32"
                      },
                      "Capture": {
                        "type": "boolean",
                        "description": "Booleano que identifica se a autorização deve ser com **captura automática (\"true\")** ou **[captura posterior](https://developercielo.github.io/manual/cielo-ecommerce#captura) (\"false\")**."
                      },
                      "CreditCard": {
                        "properties": {
                          "CardToken": {
                            "type": "string",
                            "description": "Token de identificação do Cartão. Tamanho: 36."
                          },
                          "SecurityCode": {
                            "type": "string",
                            "description": "Código de segurança impresso no verso do cartão. Tamanho: 4."
                          },
                          "Brand": {
                            "type": "string",
                            "description": "Bandeira do cartão. Tamanho: 10."
                          }
                        },
                        "required": [
                          "CardToken",
                          "SecurityCode"
                        ],
                        "type": "object"
                      },
                      "InitiatedTransactionIndicator": {
                        "type": "object",
                        "properties": {
                          "Category": {
                            "type": "string",
                            "description": "**Obrigatório para bandeira Mastercard**.  Categoria do indicador de início da transação. Válido apenas para bandeira Mastercard.<br>Valores possíveis:<br>- “C1”: transação inciada pelo portador do cartão;<br>- “M1”: transação recorrente ou parcelada iniciada pela loja;<br>- “M2”: transação iniciada pela loja.  Tamanho: 2."
                          },
                          "Subcategory": {
                            "type": "string",
                            "description": "**Obrigatório para bandeira Mastercard**.  Subcategoria do indicador. Válido apenas para bandeira Mastercard.<br>Valores possíveis:<br>Se `InitiatedTransactionIndicator.Category` = \"C1\" ou \"M1\"<br>*CredentialsOnFile*<br>*StandingOrder*<br>*Subscription*<br>*Installment*<br>Se `InitiatedTransactionIndicator.Category` = \"M2\"<br>*PartialShipment*<br>*RelatedOrDelayedCharge*<br>*NoShow*<br>*Resubmission*<br>Consulte a tabela com a descrição das subcategorias em <a href=\"https://docs.cielo.com.br/gateway/page/cit-mit\" target=\"_blank\">Indicador de Início da Transação</a>."
                          }
                        }
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
                      "Name": "Comprador Teste"
                    },
                    "Payment": {
                      "Type": "CreditCard",
                      "Amount": 100,
                      "Installments": 1,
                      "Capture": false,
                      "SoftDescriptor": "123456789ABCD",
                      "CreditCard": {
                        "CardToken": "6e1bf77a-b28b-4660-b14f-455e2a1c95e9",
                        "SecurityCode": "262",
                        "Brand": "Visa"
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
                    "value": "{\n  \"MerchantOrderId\": \"Loja123456\",\n  \"Customer\": {\n    \"Name\": \"Comprador Teste\"\n  },\n  \"Payment\": {\n    \"ServiceTaxAmount\": 0,\n    \"Installments\": 1,\n    \"Interest\": \"ByMerchant\",\n    \"Capture\": false,\n    \"Authenticate\": false,\n    \"CreditCard\": {\n      \"SaveCard\": false,\n      \"CardToken\": \"6e1bf77a-b28b-4660-b14f-455e2a1c95e9\",\n      \"Brand\": \"Visa\"\n    },\n    \"ProofOfSale\": \"5036294\",\n    \"Tid\": \"0310025036294\",\n    \"AuthorizationCode\": \"319285\",\n    \"SoftDescriptor\": \"123456789ABCD\",\n    \"PaymentId\": \"c3ec8ec4-1ed5-4f8d-afc3-19b18e5962a8\",\n    \"Type\": \"CreditCard\",\n    \"Amount\": 100,\n    \"Currency\": \"BRL\",\n    \"Country\": \"BRA\",\n    \"ExtraDataCollection\": [],\n    \"Status\": 1,\n    \"Links\": [\n      {\n        \"Method\": \"GET\",\n        \"Rel\": \"self\",\n        \"Href\": \"https://apiquerysandbox.cieloecommerce.cielo.com.br/1/sales/{PaymentId}\"\n      },\n      {\n        \"Method\": \"PUT\",\n        \"Rel\": \"capture\",\n        \"Href\": \"https://apisandbox.cieloecommerce.cielo.com.br/1/sales/{PaymentId}/capture\"\n      },\n      {\n        \"Method\": \"PUT\",\n        \"Rel\": \"void\",\n        \"Href\": \"https://apisandbox.cieloecommerce.cielo.com.br/1/sales/{PaymentId}/void\"\n      }\n    ]\n  }\n}"
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
                          "example": "Comprador Teste"
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
                        "CreditCard": {
                          "type": "object",
                          "properties": {
                            "SaveCard": {
                              "type": "boolean",
                              "example": false,
                              "default": true
                            },
                            "CardToken": {
                              "type": "string",
                              "example": "6e1bf77a-b28b-4660-b14f-455e2a1c95e9"
                            },
                            "Brand": {
                              "type": "string",
                              "example": "Visa"
                            }
                          }
                        },
                        "ProofOfSale": {
                          "type": "string",
                          "example": "5036294"
                        },
                        "Tid": {
                          "type": "string",
                          "example": "0310025036294"
                        },
                        "AuthorizationCode": {
                          "type": "string",
                          "example": "319285"
                        },
                        "SoftDescriptor": {
                          "type": "string",
                          "example": "123456789ABCD"
                        },
                        "PaymentId": {
                          "type": "string",
                          "example": "c3ec8ec4-1ed5-4f8d-afc3-19b18e5962a8"
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
                        "Currency": {
                          "type": "string",
                          "example": "BRL"
                        },
                        "Country": {
                          "type": "string",
                          "example": "BRA"
                        },
                        "ExtraDataCollection": {
                          "type": "array",
                          "items": {
                            "type": "object",
                            "properties": {}
                          }
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