---
updatedAt: 2025-10-30T01:18:48.000Z
agentTools:
  siteIndex: https://docs.cielo.com.br/llms.txt
  projectIndex: https://docs.cielo.com.br/ecommerce-cielo/llms.txt
---

# Criar pagamento com conversão de moeda

Cria um pagamento com cartão de crédito estrangeiro solicitando a conversão para a moeda local do comprador

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
        Produção
      </td>

      <td style={{ textAlign: "left" }}>
        <div className="headline-container-article-info2GaOf2jMpV0r"><span className="rm-APIMethod APIMethod APIMethod_fixedWidth APIMethod_post headline-container-api-method1Hc-Fm7uaccR" data-testid="http-method">post</span></div>
      </td>

      <td style={{ textAlign: "left" }}>
        `https://api.cieloecommerce.cielo.com.br/1/sales`
      </td>
    </tr>
  </tbody>
</Table>

> ℹ️
>
> Saiba mais sobre essa funcionalidade <a href="https://docs.cielo.com.br/ecommerce-cielo/docs/conversor-moedas-ecommerce" target="_blank">na documentação</a>.

A requisição será igual a uma transação de crédito padrão, com a adição do campo `DynamicCurrencyConversion` igual a *true*.

A resposta irá retornar o nó `CurrencyExchangeData`, que contém as opções de conversão:

* Valor (`ConvertedAmount`);
* Taxa (`ConversionRate`);
* Moeda local do cartão do comprador (`Currency`);

### Resposta da transação de conversão de moeda

```json Exemplo do retorno das opções de conversão
"CurrencyExchangeData": {
      "CurrencyExchanges": [
        {
          "ConvertedAmount": 21,
          "ConversionRate": 0.2124,
          "Currency": "USD"
        }
      ]
}
```

> Status 12: indica que a transação está pendente, aguardando uma requisição de [confirmação da loja ](https://docs.cielo.com.br/ecommerce-cielo/reference/confirmar-conversao) para prosseguir com a transação.

A loja deve preparar a página de checkout para apresentar uma tela com as opções de conversão de moedas ao comprador, com base nas opções retornadas no nó `CurrencyExchangeData`.

> ℹ️ Confira a [lista de moedas disponíveis para conversão.](https://docs.cielo.com.br/ecommerce-cielo/reference/conversor-moedas-disponiveis)

> **Atenção**: O exemplo desta página apresenta os parâmetros necessários para o Conversor de Moedas E-commerce e apenas os parâmetros obrigatórios para uma transação de cartão de crédito. Para verificar todos os parâmetros possíveis, vá para [Criar pagamento com cartão de crédito](https://docs.cielo.com.br/ecommerce-cielo/reference/criar-pagamento-credito).

# OpenAPI definition

```json
{
  "openapi": "3.1.0",
  "info": {
    "title": "conversor-de-moedas-e-commerce",
    "version": "3.0"
  },
  "servers": [
    {
      "url": "https://api.cieloecommerce.cielo.com.br/1/sales"
    }
  ],
  "security": [
    {}
  ],
  "paths": {
    "/1/sales": {
      "post": {
        "summary": "Criar pagamento com conversão de moeda",
        "description": "Cria um pagamento com cartão de crédito estrangeiro solicitando a conversão para a moeda local do comprador",
        "operationId": "conversor-moedas-api",
        "parameters": [
          {
            "name": "MerchantId",
            "in": "header",
            "description": "Identificador da loja na Cielo. Tamanho: 36. Formato: GUID.",
            "required": true,
            "schema": {
              "type": "string"
            }
          },
          {
            "name": "MerchantKey",
            "in": "header",
            "description": "Chave pública para autenticação dupla na Cielo. Tamanho: 40. Formato: GUID.",
            "required": true,
            "schema": {
              "type": "string"
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
                    "description": "Identificação do pedido. Poderá ser usada para cancelar ou consultar a transação no futuro. <br>*Atenção: Os caracteres permitidos são apenas a-z, A-Z, 0-9. Não são permitidos caracteres especiais e espaços em branco.*<br>Tamanho: 50."
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
                        "description": "Tipo do meio de pagamento. Para a conversão de moedas, o tipo deve ser \"CreditCard\".",
                        "default": "CreditCard"
                      },
                      "Amount": {
                        "type": "string",
                        "description": "Valor do pedido (ser enviado em centavos de real). Tamanho: 15."
                      },
                      "DynamicCurrencyConversion": {
                        "type": "boolean",
                        "description": "Enviar como *true* para solicitar a conversão do valor do pedido para a moeda local do cartão de crédito estrangeiro usado na compra."
                      },
                      "CreditCard": {
                        "properties": {
                          "CardNumber": {
                            "type": "string",
                            "description": "Número do cartão do comprador. Tamanho: 19."
                          },
                          "Holder": {
                            "type": "string",
                            "description": "Nome do comprador impresso no cartão. Não aceita caracteres especiais ou acentuação. Tamanho: 25."
                          },
                          "ExpirationDate": {
                            "type": "string",
                            "description": "Data de validade impressa no cartão. Ex. MM/AAAA. Tamanho: 7."
                          },
                          "SecurityCode": {
                            "type": "string",
                            "description": "Código de segurança impresso no verso do cartão. Tamanho: 4."
                          },
                          "Brand": {
                            "type": "string",
                            "description": "Bandeira do cartão. Valores possíveis: Visa / Master. Tamanho: 10."
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
                    },
                    "required": [
                      "Type",
                      "Amount",
                      "DynamicCurrencyConversion"
                    ],
                    "type": "object"
                  }
                }
              },
              "examples": {
                "Request Example": {
                  "value": {
                    "MerchantOrderId": "507313793",
                    "Customer": {
                      "Name": "Nome do comprador"
                    },
                    "Payment": {
                      "Type": "CreditCard",
                      "Amount": 100,
                      "Provider": "Cielo",
                      "Installments": 1,
                      "DynamicCurrencyConversion": true,
                      "CreditCard": {
                        "Holder": "Nome do titular do cartão",
                        "CardNumber": "************8404",
                        "ExpirationDate": "03/2032",
                        "SecurityCode": "***",
                        "Brand": "Master"
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
                    "value": "{\n  \"MerchantOrderId\": \"507313793\",\n  \"Customer\": {\n    \"Name\": \"Nome do comprador\"\n  },\n  \"Payment\": {\n    \"ServiceTaxAmount\": 0,\n    \"Installments\": 1,\n    \"Interest\": 0,\n    \"Capture\": false,\n    \"Authenticate\": false,\n    \"Recurrent\": false,\n    \"CreditCard\": {\n      \"CardNumber\": \"************8404\",\n      \"Holder\": \"Nome do titular do cartão\",\n      \"ExpirationDate\": \"03/2032\",\n      \"SaveCard\": false,\n      \"Brand\": \"Master\"\n    },\n    \"Tid\": \"204089197230RE45724B\",\n    \"Provider\": \"Cielo\",\n    \"Eci\": \"0\",\n    \"Credentials\": {\n      \"Code\": \"2040891972\",\n      \"Key\": \"****************************************************************\"\n    },\n    \"DynamicCurrencyConversion\": true,\n    \"CurrencyExchangeData\": {\n      \"CurrencyExchanges\": [\n        {\n          \"ConvertedAmount\": 21,\n          \"ConversionRate\": 0.2124,\n          \"Currency\": \"USD\"\n        }\n      ]\n    },\n    \"Amount\": 100,\n    \"ReceivedDate\": \"2023-11-24 15:46:15\",\n    \"Status\": 12,\n    \"IsSplitted\": false,\n    \"ReturnMessage\": \"Deseja pagar na moeda do seu País? Would you like to pay in your currency? ¿Quieres pagar en la moneda de tu país?\",\n    \"ReturnCode\": \"1\",\n    \"PaymentId\": \"fb375c6c-1025-46f3-a338-aa2403c44f89\",\n    \"Type\": \"CreditCard\",\n    \"Currency\": \"BRL\",\n    \"Country\": \"BRA\",\n    \"Links\": [\n      {\n        \"Method\": \"GET\",\n        \"Rel\": \"self\",\n        \"Href\": \"https://apiquerysandbox.cieloecommerce.cielo.com.br/1/sales/fb375c6c-1025-46f3-a338-aa2403c44f89\"\n      },\n      {\n        \"Method\": \"PUT\",\n        \"Rel\": \"confirm\",\n        \"Href\": \"https://apisandbox.cieloecommerce.cielo.com.br/1/sales/fb375c6c-1025-46f3-a338-aa2403c44f89/confirm\"\n      }\n    ]\n  }\n}"
                  }
                },
                "schema": {
                  "type": "object",
                  "properties": {
                    "MerchantOrderId": {
                      "type": "string",
                      "example": "507313793"
                    },
                    "Customer": {
                      "type": "object",
                      "properties": {
                        "Name": {
                          "type": "string",
                          "example": "Nome do comprador"
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
                              "example": "************8404"
                            },
                            "Holder": {
                              "type": "string",
                              "example": "Nome do titular do cartão"
                            },
                            "ExpirationDate": {
                              "type": "string",
                              "example": "03/2032"
                            },
                            "SaveCard": {
                              "type": "boolean",
                              "example": false,
                              "default": true
                            },
                            "Brand": {
                              "type": "string",
                              "example": "Master"
                            }
                          }
                        },
                        "Tid": {
                          "type": "string",
                          "example": "204089197230RE45724B"
                        },
                        "Provider": {
                          "type": "string",
                          "example": "Cielo"
                        },
                        "Eci": {
                          "type": "string",
                          "example": "0"
                        },
                        "Credentials": {
                          "type": "object",
                          "properties": {
                            "Code": {
                              "type": "string",
                              "example": "2040891972"
                            },
                            "Key": {
                              "type": "string",
                              "example": "****************************************************************"
                            }
                          }
                        },
                        "DynamicCurrencyConversion": {
                          "type": "boolean",
                          "example": true,
                          "default": true
                        },
                        "CurrencyExchangeData": {
                          "type": "object",
                          "properties": {
                            "CurrencyExchanges": {
                              "type": "array",
                              "items": {
                                "type": "object",
                                "properties": {
                                  "ConvertedAmount": {
                                    "type": "integer",
                                    "example": 21,
                                    "default": 0
                                  },
                                  "ConversionRate": {
                                    "type": "number",
                                    "example": 0.2124,
                                    "default": 0
                                  },
                                  "Currency": {
                                    "type": "string",
                                    "example": "USD"
                                  }
                                }
                              }
                            }
                          }
                        },
                        "Amount": {
                          "type": "integer",
                          "example": 100,
                          "default": 0
                        },
                        "ReceivedDate": {
                          "type": "string",
                          "example": "2023-11-24 15:46:15"
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
                        "ReturnMessage": {
                          "type": "string",
                          "example": "Deseja pagar na moeda do seu País? Would you like to pay in your currency? ¿Quieres pagar en la moneda de tu país?"
                        },
                        "ReturnCode": {
                          "type": "string",
                          "example": "1"
                        },
                        "PaymentId": {
                          "type": "string",
                          "example": "fb375c6c-1025-46f3-a338-aa2403c44f89"
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
                                "example": "https://apiquerysandbox.cieloecommerce.cielo.com.br/1/sales/fb375c6c-1025-46f3-a338-aa2403c44f89"
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
          "400": {
            "description": "400",
            "content": {
              "application/json": {
                "examples": {
                  "Result": {
                    "value": "{}"
                  }
                },
                "schema": {
                  "type": "object",
                  "properties": {}
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
    "explorer-enabled": false,
    "proxy-enabled": true
  },
  "x-readme-fauxas": true
}
```