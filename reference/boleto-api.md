---
updatedAt: 2026-07-17T12:43:54.000Z
agentTools:
  siteIndex: https://docs.cielo.com.br/llms.txt
  projectIndex: https://docs.cielo.com.br/ecommerce-cielo/llms.txt
---

# Criar pagamento com boleto

Cria transação de boleto.

| Ambiente | Método                                                                                                                                                                                                                  | Endpoint                                                  |
| :------- | :---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- | :-------------------------------------------------------- |
| Sandbox  | <div class="headline-container-article-info2GaOf2jMpV0r"><span class="rm-APIMethod APIMethod APIMethod_fixedWidth APIMethod_post headline-container-api-method1Hc-Fm7uaccR" data-testid="http-method">post</span></div> | `https://apisandbox.cieloecommerce.cielo.com.br/1/sales/` |
| Produção | <div class="headline-container-article-info2GaOf2jMpV0r"><span class="rm-APIMethod APIMethod APIMethod_fixedWidth APIMethod_post headline-container-api-method1Hc-Fm7uaccR" data-testid="http-method">post</span></div> | `https://api.cieloecommerce.cielo.com.br/1/sales/`        |

<br />

<Callout icon="ℹ️" theme="info">
  ###

  Saiba mais sobre essa funcionalidade <a href="https://docs.cielo.com.br/ecommerce-cielo/docs/boleto" target="_blank">na documentação</a>.
</Callout>

> ℹ️ CNPJs alfanuméricos serão implementados pela Receita Federal em julho de 2026
>
> Essa mudança afeta apenas novas inscrições, **não havendo mudanças em CNPJs existentes**.
>
> O CNPJ alfanumérico **já está sendo suportado pela Cielo**, sem mudanças na sua integração.
>
> Recomendamos verificar a necessidade de possíveis ajustes nos sistemas próprios de checkout de sua loja.

<br />

**Regras adicionais para boleto do Branco do Brasil:**

* Os parâmetros `Customer.Address.Street`, `Customer.Address.Number`, `Customer.Address.Complement`, `Customer.Address.District` devem totalizar até 60 caracteres;
* O parâmetro `DigitableLine` não é retornado para boleto do Banco do Brasil;
* O nó `Customer` tem restrição quanto aos caracteres aceitos:
  * **Caracteres válidos:** Letras de A a Z maiúsculas;
  * **Caracteres especiais:** hífen (-) e apóstrofo ('), mas não pode conter espaços entre as letras;
  * **Exemplos corretos**: D'EL-REI, D'ALCORTIVO, SANT'ANA;
  * **Exemplos incorretos**: D'EL - REI (espaço em branco entre palavras).

<Callout icon="⚠️" theme="warn">
  ### Atenção

  A integração de boleto do Banco do Brasil deve usar o provedor _BancoDoBrasil3_, válido a partir de 05/03/2026.
</Callout>

<br />

### Resposta da criação do boleto

Na resposta da transação de boleto, a API E-commerce Cielo vai enviar a URL do boleto e o código de barras que a loja deverá exibir para o comprador.

| Propriedade      | Descrição                                                                                                                                | Tipo   | Tamanho |
| ---------------- | ---------------------------------------------------------------------------------------------------------------------------------------- | ------ | ------- |
| `PaymentId`      | Número de identificação do pagamento; poderá ser usado no futuro para a operação de consulta.                                            | GUID   | 36      |
| `Instructions`   | Instruções do Boleto. <br />Ex: "Aceitar somente até a data de vencimento, após essa data juros de 1% dia".                              | string | 255     |
| `ExpirationDate` | Data de expiração no formato AAAA-MM-DD.                                                                                                 | string | 10      |
| `Url`            | URL do boleto gerado. <br />Ex: `https://.../pagador/reenvia.asp/8464a692-b4bd-41e7-8003-1611a2b8ef2d`                                   | string | 256     |
| `Number`         | "NossoNumero" gerado. <br />Ex: 1000000012-8                                                                                             | string | 50      |
| `BarCodeNumber`  | Representação numérica do código de barras.<br />Ex: 00091628800000157000494250100000001200656560                                        | string | 44      |
| `DigitableLine`  | Linha digitável.<br />Ex: 00090.49420 50100.000004 12006.565605 1 62880000015700                                                         | string | 256     |
| `Assignor`       | Nome do Cedente.<br /> Ex: Loja Teste                                                                                                    | string | 256     |
| `Address`        | Endereço do Cedente.<br />Ex: Av. Teste, 160                                                                                             | string | 256     |
| `Identification` | Documento de identificação do Cedente.<br />CPF ou CNPJ do Cedente sem os caracteres especiais (., /, -)                                 | string | 14      |
| `Status`         | Status da Transação. Veja a tabela completa de [Status transacional](https://docs.cielo.com.br/ecommerce-cielo/reference/payment-status) | byte   | \*\*\*  |

<br />

# OpenAPI definition

```json
{
  "openapi": "3.1.0",
  "info": {
    "title": "boleto",
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
        "summary": "Criar pagamento com boleto",
        "description": "Cria transação de boleto.",
        "operationId": "boleto-api",
        "parameters": [
          {
            "name": "Content-Type",
            "in": "header",
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
                    "description": "Identificação do pedido. Poderá ser usada para cancelar ou consultar a transação no futuro. *Atenção: Os caracteres permitidos são apenas a-z, A-Z, 0-9. Não são permitidos caracteres especiais e espaços em branco*.<br>**Bradesco:** Tamanho: 27. <br>**Banco do Brasil:** Tamanho: 50."
                  },
                  "Customer": {
                    "properties": {
                      "Name": {
                        "type": "string",
                        "description": "Nome do comprador. <br>**Bradesco:** Tamanho: 34. <br>**Banco do Brasil:** Tamanho: 60.<br>_Atenção: Os caracteres permitidos são apenas a-z, A-Z. Não são permitidos caracteres especiais e números._"
                      },
                      "Status": {
                        "type": "string",
                        "description": "Status de cadastro do comprador na loja(NEW / EXISTING) - Utilizado pela análise de fraude. Tamanho: 255."
                      },
                      "Address": {
                        "properties": {
                          "ZipCode": {
                            "type": "string",
                            "description": "CEP do endereço do comprador. Tamanho: 9."
                          },
                          "Country": {
                            "type": "string",
                            "description": "País do endereço do comprador. Tamanho: 35."
                          },
                          "State": {
                            "type": "string",
                            "description": "Estado do endereço do comprador. Tamanho: 2."
                          },
                          "City": {
                            "type": "string",
                            "description": "Cidade do endereço do comprador. <br>**Bradesco:** Tamanho: 50. <br>**Banco do Brasil:** Tamanho: 18."
                          },
                          "District": {
                            "type": "string",
                            "description": "Bairro do comprador. Tamanho: 50."
                          },
                          "Street": {
                            "type": "string",
                            "description": "Endereço do comprador. Tamanho: 255."
                          },
                          "Number": {
                            "type": "string",
                            "description": "Número do endereço do comprador. Tamanho: 15."
                          }
                        },
                        "required": [
                          "ZipCode",
                          "State",
                          "District",
                          "Street",
                          "Number"
                        ],
                        "type": "object"
                      },
                      "Billing": {
                        "properties": {
                          "Street": {
                            "type": "string",
                            "description": "Logradouro do endereço de cobrança. Tamanho: 24."
                          },
                          "Number": {
                            "type": "string",
                            "description": "Número do endereço de cobrança. Tamanho: 5."
                          },
                          "Complement": {
                            "type": "string",
                            "description": "Complemento do endereço de cobrança. Tamanho: 14."
                          },
                          "Neighborhood": {
                            "type": "string",
                            "description": "Bairro do endereço de cobrança. Tamanho: 15."
                          },
                          "City": {
                            "type": "string",
                            "description": "Cidade do endereço de cobrança. Tamanho: 20."
                          },
                          "State": {
                            "type": "string",
                            "description": "Estado do endereço de cobrança. Tamanho: 2."
                          },
                          "Country": {
                            "type": "string",
                            "description": "País do endereço de cobrança. Mais informações em <a href=”https://www.iso.org/obp/ui/#search” target=\"_blank\"> ISO 2-Digit Alpha Country Code</a>. Tamanho: 2."
                          },
                          "ZipCode": {
                            "type": "string",
                            "description": "Código postal do endereço de cobrança. Tamanho: 9."
                          }
                        },
                        "required": [],
                        "type": "object"
                      },
                      "Identity": {
                        "type": "string",
                        "description": "Número do CPF ou CNPJ do cliente. \nTamanho: 14.<br>**Permite envio de CNPJs alfanuméricos.**"
                      },
                      "IdentityType": {
                        "type": "string",
                        "description": "Tipo de documento de identificação do comprador (CPF ou CNPJ).\nTamanho: 255."
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
                        "type": "integer",
                        "description": "Valor do Pedido (ser enviado em centavos). Tamanho: 15.",
                        "format": "int32"
                      },
                      "Provider": {
                        "type": "string",
                        "description": "Define comportamento do meio de pagamento. Valores possíveis: \"Bradesco2\" ou \"BancoDoBrasil3\". Tamanho: 15."
                      },
                      "Address": {
                        "type": "string",
                        "description": "Endereço do Cedente. Tamanho: 255."
                      },
                      "BoletoNumber": {
                        "type": "integer",
                        "description": "Número do Boleto enviado pelo lojista. Usado para contar boletos emitidos (\"NossoNumero\"). <br>**Bradesco:** Tamanho: 11. <br>**Banco do Brasil:** Tamanho: 9.",
                        "format": "int32"
                      },
                      "Assignor": {
                        "type": "string",
                        "description": "Nome do Cedente. Tamanho: 200."
                      },
                      "Demonstrative": {
                        "type": "string",
                        "description": "Texto de Demonstrativo. Tamanho: 255."
                      },
                      "ExpirationDate": {
                        "type": "string",
                        "description": "Data de expiração do Boleto. Ex. 2020-12-31. Tamanho: 10.",
                        "format": "date"
                      },
                      "Identification": {
                        "type": "string",
                        "description": "Documento de identificação do Cedente. Tamanho: 14."
                      },
                      "Instructions": {
                        "type": "string",
                        "description": "Instruções do Boleto. Tamanho: 255."
                      }
                    },
                    "required": [
                      "Type",
                      "Amount",
                      "Provider"
                    ],
                    "type": "object"
                  }
                }
              },
              "examples": {
                "Integração Bradesco2": {
                  "value": {
                    "Customer": {
                      "Address": {
                        "Street": "Alameda Xingu",
                        "Number": "512",
                        "Complement": "Sala 934",
                        "ZipCode": "12345987",
                        "District": "Centro",
                        "City": "São Paulo",
                        "State": "SP",
                        "Country": "BRA"
                      },
                      "Billing": {
                        "ZipCode": "12345987",
                        "Country": "BR",
                        "State": "SP",
                        "City": "São Paulo",
                        "Neighborhood": "Centro",
                        "Complement": "Sala 25",
                        "Number": "512",
                        "Street": "Alameda Xingu"
                      },
                      "Name": "Aline de Souza",
                      "Identity": "1234567890",
                      "IdentityType": "CNPJ"
                    },
                    "Payment": {
                      "Type": "Boleto",
                      "Amount": 15700,
                      "Provider": "Bradesco2",
                      "Address": "Alameda Xingu",
                      "BoletoNumber": 512,
                      "Assignor": "Empresa Teste",
                      "Demonstrative": "Desmonstrative Teste",
                      "ExpirationDate": "2035-12-31",
                      "Identification": "11884926754",
                      "Instructions": "Aceitar somente até a data de vencimento, após essa data juros de 1% dia."
                    },
                    "MerchantOrderId": "2017051001"
                  },
                  "summary": "Integração Bradesco2"
                },
                "Integração BancoDoBrasil3": {
                  "summary": "Integração BancoDoBrasil3",
                  "value": {
                    "Customer": {
                      "Address": {
                        "Street": "Alameda Xingu",
                        "Number": "512",
                        "Complement": "Sala 934",
                        "ZipCode": "12345987",
                        "District": "Centro",
                        "City": "São Paulo",
                        "State": "SP",
                        "Country": "BRA"
                      },
                      "Name": "Aline de Souza",
                      "Identity": "1234567890",
                      "IdentityType": "CNPJ"
                    },
                    "Payment": {
                      "Type": "Boleto",
                      "Amount": 15700,
                      "Provider": "BancoDoBrasil3",
                      "Address": "Alameda Xingu",
                      "BoletoNumber": 512,
                      "Assignor": "Empresa Teste",
                      "Demonstrative": "Desmonstrative Teste",
                      "ExpirationDate": "2035-12-31",
                      "Identification": "11884926754",
                      "Instructions": "Aceitar somente até a data de vencimento, após essa data juros de 1% dia."
                    },
                    "MerchantOrderId": "2017051001"
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
                  "": {
                    "summary": "",
                    "value": "{}"
                  },
                  "Integração BancoDoBrasil3": {
                    "summary": "Integração BancoDoBrasil3",
                    "value": {
                      "MerchantOrderId": "2017051001",
                      "Customer": {
                        "Name": "Aline de Souza",
                        "Identity": "1234567890",
                        "IdentityType": "CNPJ",
                        "Address": {
                          "Street": "Alameda Xingu",
                          "Number": "512",
                          "Complement": "Sala 934",
                          "ZipCode": "12345987",
                          "City": "São Paulo",
                          "State": "SP",
                          "Country": "BRA",
                          "District": "Centro",
                          "AddressType": 0
                        }
                      },
                      "Payment": {
                        "Instructions": "Aceitar somente até a data de vencimento, após essa data juros de 1% dia.",
                        "ExpirationDate": "2035-12-31",
                        "Demonstrative": "Desmonstrative Teste",
                        "Url": "https://transactionsandbox.pagador.com.br/post/pagador/reenvia.asp/fffd9823-cf74-4d0b-b112-e3e4a477ca0e",
                        "BoletoNumber": "512-2",
                        "BarCodeNumber": "00091496400000157009999250000000051299999990",
                        "DigitableLine": "00099.99921 50000.000054 12999.999902 1 49640000015700",
                        "Assignor": "Empresa Teste",
                        "Address": "Alameda Xingu",
                        "Identification": "11884926754",
                        "Bank": 0,
                        "Amount": 15700,
                        "ReceivedDate": "2025-12-03 10:40:52",
                        "Provider": "BancoDoBrasil3",
                        "Status": 1,
                        "IsSplitted": false,
                        "PaymentId": "fffd9823-cf74-4d0b-b112-e3e4a477ca0e",
                        "Type": "Boleto",
                        "Currency": "BRL",
                        "Country": "BRA",
                        "Links": [
                          {
                            "Method": "GET",
                            "Rel": "self",
                            "Href": "https://apiquerysandbox.cieloecommerce.cielo.com.br/1/sales/fffd9823-cf74-4d0b-b112-e3e4a477ca0e"
                          }
                        ]
                      }
                    }
                  },
                  "Integração Bradesco2": {
                    "value": {
                      "MerchantOrderId": "2017051001",
                      "Customer": {
                        "Name": "Aline de Souza",
                        "Identity": "1234567890",
                        "IdentityType": "CNPJ",
                        "Address": {
                          "Street": "Alameda Xingu",
                          "Number": "512",
                          "Complement": "Sala 934",
                          "ZipCode": "12345987",
                          "City": "São Paulo",
                          "State": "SP",
                          "Country": "BRA",
                          "District": "Centro",
                          "AddressType": 0
                        }
                      },
                      "Payment": {
                        "Instructions": "Aceitar somente até a data de vencimento, após essa data juros de 1% dia.",
                        "ExpirationDate": "2035-12-31",
                        "Demonstrative": "Desmonstrative Teste",
                        "Url": "https://transactionsandbox.pagador.com.br/post/pagador/reenvia.asp/259629d4-1e45-4017-9064-ea09a4ccd4d6",
                        "BoletoNumber": "512-2",
                        "BarCodeNumber": "00091496400000157009999250000000051299999990",
                        "DigitableLine": "00099.99921 50000.000054 12999.999902 1 49640000015700",
                        "Assignor": "Empresa Teste",
                        "Address": "Alameda Xingu",
                        "Identification": "11884926754",
                        "Bank": 0,
                        "Amount": 15700,
                        "ReceivedDate": "2025-12-04 08:06:12",
                        "Provider": "Bradesco2",
                        "Status": 1,
                        "IsSplitted": false,
                        "PaymentId": "259629d4-1e45-4017-9064-ea09a4ccd4d6",
                        "Type": "Boleto",
                        "Currency": "BRL",
                        "Country": "BRA",
                        "Links": [
                          {
                            "Method": "GET",
                            "Rel": "self",
                            "Href": "https://apiquerysandbox.cieloecommerce.cielo.com.br/1/sales/259629d4-1e45-4017-9064-ea09a4ccd4d6"
                          }
                        ]
                      }
                    },
                    "summary": "Integração Bradesco2"
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
                          "example": "Comprador Boleto Completo"
                        },
                        "Address": {
                          "type": "object",
                          "properties": {
                            "Street": {
                              "type": "string",
                              "example": "Av Marechal Camara"
                            },
                            "Number": {
                              "type": "string",
                              "example": "160"
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
                        },
                        "Billing": {
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
                            "Neighborhood": {
                              "type": "string",
                              "example": "Centro"
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
                              "example": "BR"
                            },
                            "ZipCode": {
                              "type": "string",
                              "example": "22750012"
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
                          "example": "2015-01-05"
                        },
                        "Url": {
                          "type": "string",
                          "example": "https://apisandbox.cieloecommerce.cielo.com.br/post/pagador/reenvia.asp/a5f3181d-c2e2-4df9-a5b4-d8f6edf6bd51"
                        },
                        "Number": {
                          "type": "string",
                          "example": "123-2"
                        },
                        "BarCodeNumber": {
                          "type": "string",
                          "example": "00096629900000157000494250000000012300656560"
                        },
                        "DigitableLine": {
                          "type": "string",
                          "example": "00090.49420 50000.000013 23006.565602 6 62990000015700"
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
                          "example": "a5f3181d-c2e2-4df9-a5b4-d8f6edf6bd51"
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
                          "example": "Bradesco2"
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