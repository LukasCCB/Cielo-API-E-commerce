---
updatedAt: 2026-07-17T12:48:07.000Z
agentTools:
  siteIndex: https://docs.cielo.com.br/llms.txt
  projectIndex: https://docs.cielo.com.br/ecommerce-cielo/llms.txt
---

# Criar transação de carnê

Cria uma transação de carnê

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
  ### <br />Saiba mais sobre essa funcionalidade <a href="https://docs.cielo.com.br/ecommerce-cielo/docs/carn%C3%AA" target="_blank">na documentação</a>.
</Callout>

O **carnê** é uma **transação de débito** utilizada para efetuar o pagamento de uma conta.

> O carnê é um meio de pagamento válido para as bandeiras Mastercard, Visa e Elo.

Essa modalidade pode ser utilizada por lojistas que **emitem carnês próprios e faturas de cartões Private Label**. O produto carnê permite a **separação das vendas** relacionadas à **compra de produtos e pagamento de serviços**, facilitando reporte de valores junto ao Fisco.

Como qualquer transação de débito no e-commerce, as transações de carnê precisam ser autenticadas via protocolo 3DS 2.2. Obtenha mais informações sobre o protocolo de autenticação no <a href="https://docs.cielo.com.br/ecommerce-cielo/docs/3ds-sobre" target="_blank">**manual do 3DS 2.2**</a>.

### Resposta da transação de carnê

A tabela a seguir apresenta os principais parâmetros que podem ser retornados pela API na criação de um pagamento com carnê.

| Propriedade  | Descrição                                                                                                                                | Tipo   | Tamanho |
| ------------ | ---------------------------------------------------------------------------------------------------------------------------------------- | ------ | ------- |
| `Tid`        | Id da transação na adquirente.                                                                                                           | string | 20      |
| `PaymentId`  | Número de identificação do pagamento. O `PaymentId` será usado em futuras operações como consulta e cancelamento.                        | GUID   | 36      |
| `Status`     | Status da Transação. Veja a tabela completa de [Status transacional](https://docs.cielo.com.br/ecommerce-cielo/reference/payment-status) | byte   | \*\*\*  |
| `ReturnCode` | Código de retorno da adquirência.                                                                                                        | string | 32      |

<br />

# OpenAPI definition

```json
{
  "openapi": "3.1.0",
  "info": {
    "title": "carnê",
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
        "summary": "Criar transação de carnê",
        "description": "Cria uma transação de carnê",
        "operationId": "carne-api",
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
                      "Provider": {
                        "type": "string",
                        "description": "Define comportamento do meio de pagamento. Valor possível: Cielo. Não é obrigatório para crédito. Tamanho: 15."
                      },
                      "Authenticate": {
                        "type": "boolean",
                        "description": "Define se o comprador será direcionado ao banco emissor para autenticação do cartão."
                      },
                      "Installments": {
                        "type": "integer",
                        "description": "Número de parcelas. Se a transação for uma recorrência, o número de parcelas será 1. Para transações parceladas, o número de parcelas será sempre maior que 1. Tamanho: 2.",
                        "format": "int32"
                      },
                      "Amount": {
                        "type": "integer",
                        "description": "Valor do pedido (ser enviado em centavos). Tamanho: 15.",
                        "format": "int32"
                      },
                      "Type": {
                        "type": "string",
                        "description": "Tipo do meio de pagamento."
                      },
                      "SoftDescriptor": {
                        "type": "string",
                        "description": "O complemento do nome da loja que aparecerá na fatura do cartão. Não permite caracteres especiais. Tamanho: 13."
                      },
                      "DebitCard": {
                        "properties": {
                          "ExpirationDate": {
                            "type": "string",
                            "description": "Data de validade impresso no cartão. Tamanho: 7."
                          },
                          "CardNumber": {
                            "type": "string",
                            "description": "Número do cartão do comprador. Tamanho: 19."
                          },
                          "Holder": {
                            "type": "string",
                            "description": "Nome do comprador impresso no cartão. Tamanho: 25."
                          },
                          "Brand": {
                            "type": "string",
                            "description": "Bandeira do cartão. Tamanho: 10."
                          },
                          "SecurityCode": {
                            "type": "string",
                            "description": "Código de segurança impresso no verso do cartão. Tamanho: 4."
                          },
                          "CardOnFile": {
                            "properties": {
                              "Usage": {
                                "type": "string",
                                "description": "**First** se o cartão foi armazenado e é seu primeiro uso.<br>**Used** se o cartão foi armazenado e ele já foi utilizado anteriormente em outra transação. Saiba mais em <a href=\"https://developercielo.github.io/manual/cielo-ecommerce#card-on-file\" target=\"_blank\">Card On File</a>."
                              }
                            },
                            "required": [],
                            "type": "object"
                          }
                        },
                        "required": [
                          "ExpirationDate",
                          "CardNumber",
                          "Holder",
                          "Brand"
                        ],
                        "type": "object"
                      }
                    },
                    "required": [
                      "Installments",
                      "Amount",
                      "Type"
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
                      "Name": "Comprador Carnet simples"
                    },
                    "Payment": {
                      "Provider": "CieloSandbox",
                      "Authenticate": true,
                      "Installments": 1,
                      "Amount": 100,
                      "Type": "DebitCard",
                      "SoftDescriptor": "123456789ABCD",
                      "DebitCard": {
                        "ExpirationDate": "02/2026",
                        "CardNumber": "5207992865485567",
                        "Holder": "Test Holder",
                        "Brand": "Visa",
                        "SecurityCode": "835",
                        "CardOnFile": {
                          "Usage": "first"
                        }
                      },
                      "ExternalAuthentication": {
                        "Eci": "05",
                        "Cavv": "AAABAWFlmQAAAABjRWWZEEFgFz+=",
                        "Xid": "blNhMmtMUWg4RDFoV2JaM1RRbjA="
                      },
                      "iscarnetransaction": true
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
                  "Created": {
                    "value": "{\n  \"MerchantOrderId\": \"Loja123456\",\n  \"Customer\": {\n    \"Name\": \"Comprador Carnet simples\"\n  },\n  \"Payment\": {\n    \"DebitCard\": {\n      \"CardNumber\": \"5207992865485567\",\n      \"Holder\": \"Test Holder\",\n      \"ExpirationDate\": \"02/2026\",\n      \"SaveCard\": false,\n      \"Brand\": \"Visa\",\n      \"CardOnFile\": {\n        \"Usage\": \"first\"\n      }\n    },\n    \"Provider\": \"Cielo\",\n    \"SoftDescriptor\": \"123456789ABCD\",\n    \"Authenticate\": true,\n    \"ExternalAuthentication\": {\n      \"Cavv\": \"AAABAWFlmQAAAABjRWWZEEFgFz+=\",\n      \"Xid\": \"blNhMmtMUWg4RDFoV2JaM1RRbjA=\",\n      \"Eci\": \"05\"\n    },\n    \"Recurrent\": false,\n    \"IsCarneTransaction\": true,\n    \"Amount\": 100,\n    \"ReceivedDate\": \"2024-09-09 16:48:38\",\n    \"Status\": 0,\n    \"IsSplitted\": false,\n    \"ReturnMessage\": \"Carnê gerado com sucesso\",\n    \"ReturnCode\": \"001\",\n    \"PaymentId\": \"582abe8a-72ff-416a-b98d-410a4674386d\",\n    \"Type\": \"DebitCard\",\n    \"Currency\": \"BRL\",\n    \"Country\": \"BRA\",\n    \"Links\": [\n      {\n        \"Method\": \"GET\",\n        \"Rel\": \"self\",\n        \"Href\": \"https://apiquerysandbox.cieloecommerce.cielo.com.br/1/sales/582abe8a-72ff-416a-b98d-410a4674386d\"\n      }\n    ]\n  }\n}"
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
                          "example": "Comprador Carnet simples"
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
                              "example": "5207992865485567"
                            },
                            "Holder": {
                              "type": "string",
                              "example": "Test Holder"
                            },
                            "ExpirationDate": {
                              "type": "string",
                              "example": "02/2026"
                            },
                            "SaveCard": {
                              "type": "boolean",
                              "example": false,
                              "default": true
                            },
                            "Brand": {
                              "type": "string",
                              "example": "Visa"
                            },
                            "CardOnFile": {
                              "type": "object",
                              "properties": {
                                "Usage": {
                                  "type": "string",
                                  "example": "first"
                                }
                              }
                            }
                          }
                        },
                        "Provider": {
                          "type": "string",
                          "example": "Cielo"
                        },
                        "SoftDescriptor": {
                          "type": "string",
                          "example": "123456789ABCD"
                        },
                        "Authenticate": {
                          "type": "boolean",
                          "example": true,
                          "default": true
                        },
                        "ExternalAuthentication": {
                          "type": "object",
                          "properties": {
                            "Cavv": {
                              "type": "string",
                              "example": "AAABAWFlmQAAAABjRWWZEEFgFz+="
                            },
                            "Xid": {
                              "type": "string",
                              "example": "blNhMmtMUWg4RDFoV2JaM1RRbjA="
                            },
                            "Eci": {
                              "type": "string",
                              "example": "05"
                            }
                          }
                        },
                        "Recurrent": {
                          "type": "boolean",
                          "example": false,
                          "default": true
                        },
                        "IsCarneTransaction": {
                          "type": "boolean",
                          "example": true,
                          "default": true
                        },
                        "Amount": {
                          "type": "integer",
                          "example": 100,
                          "default": 0
                        },
                        "ReceivedDate": {
                          "type": "string",
                          "example": "2024-09-09 16:48:38"
                        },
                        "Status": {
                          "type": "integer",
                          "example": 0,
                          "default": 0
                        },
                        "IsSplitted": {
                          "type": "boolean",
                          "example": false,
                          "default": true
                        },
                        "ReturnMessage": {
                          "type": "string",
                          "example": "Carnê gerado com sucesso"
                        },
                        "ReturnCode": {
                          "type": "string",
                          "example": "001"
                        },
                        "PaymentId": {
                          "type": "string",
                          "example": "582abe8a-72ff-416a-b98d-410a4674386d"
                        },
                        "Type": {
                          "type": "string",
                          "example": "DebitCard"
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
                                "example": "https://apiquerysandbox.cieloecommerce.cielo.com.br/1/sales/582abe8a-72ff-416a-b98d-410a4674386d"
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