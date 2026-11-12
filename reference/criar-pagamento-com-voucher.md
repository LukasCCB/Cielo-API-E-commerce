---
updatedAt: 2026-07-17T12:45:35.000Z
agentTools:
  siteIndex: https://docs.cielo.com.br/llms.txt
  projectIndex: https://docs.cielo.com.br/ecommerce-cielo/llms.txt
---

# Criar pagamento com voucher

Cria transação com o meio de pagamento voucher Alelo

<Callout icon="ℹ️" theme="info">
  Saiba mais sobre essa funcionalidade <a href="https://docs.cielo.com.br/ecommerce-cielo/docs/voucher" target="_blank">na documentação.</a>
</Callout>

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

> ℹ️ CNPJs alfanuméricos serão implementados pela Receita Federal em julho de 2026
>
> Essa mudança afeta apenas novas inscrições, **não havendo mudanças em CNPJs existentes**.
>
> O CNPJ alfanumérico **já está sendo suportado pela Cielo**, sem mudanças na sua integração.
>
> Recomendamos verificar a necessidade de possíveis ajustes nos sistemas próprios de checkout de sua loja.

> ⚠️ Atenção
>
> * A Cielo aceita somente o Voucher Alelo;
> * Use a integração desta página para o voucher **Alelo multibenefícios**.

Para processar um pagamento com **cartão Alelo** via API E-commerce Cielo, utilize o mesmo formato de requisição usado para uma transação com cartão de débito.

Além disso, é necessário configurar os seguintes parâmetros:

* `Payment.Authenticate` precisa estar como **`false`** ou não ser enviado;
* `DebitCard.Brand` precisa ser enviada como **"Elo"**.

<br />

### Orientações para cancelamento em voucher Alelo

Para o voucher Alelo:

* Não é possível realizar cancelamento parcial;
* O cancelamento total pode ser feito apenas no dia da transação (D0);
* Para cancelar após o dia da transação (D+1 em diante), é necessário contatar a Alelo.

Para cancelar a transação de voucher, siga a requisição [Cancelar transação de débito via PaymentId](ref:cancelamento-débito-paymentid).

<br />

# OpenAPI definition

```json
{
  "openapi": "3.1.0",
  "info": {
    "title": "voucher",
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
        "summary": "Criar pagamento com voucher",
        "description": "Cria transação com o meio de pagamento voucher Alelo",
        "operationId": "criar-pagamento-com-voucher",
        "parameters": [
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
          },
          {
            "name": "Content-Type",
            "in": "header",
            "description": "Tamanho: 40.",
            "required": true,
            "schema": {
              "type": "string",
              "default": "application/json"
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
                    "description": "Identificação do pedido. Poderá ser usada para cancelar ou consultar a transação no futuro.<br> *Atenção: Os caracteres permitidos são apenas a-z, A-Z, 0-9. Não são permitidos caracteres especiais e espaços em branco.* <br>Tamanho: 50."
                  },
                  "Customer": {
                    "properties": {
                      "Name": {
                        "type": "string",
                        "description": "Nome do comprador. Tamanho: 255.<br>_Atenção: Os caracteres permitidos são apenas a-z, A-Z. Não são permitidos caracteres especiais e números._"
                      },
                      "Identity": {
                        "type": "string",
                        "description": "Número do CPF ou CNPJ do comprador. Tamanho: 14.<br>**Permite envio de CNPJs alfanuméricos.**"
                      },
                      "IdentityType": {
                        "type": "string",
                        "description": "Tipo de documento de identificação do comprador (CPF/CNPJ). Tamanho: 255."
                      },
                      "Email": {
                        "type": "string",
                        "description": "E-mail do comprador. Tamanho: 255."
                      },
                      "Birthdate": {
                        "type": "string",
                        "description": "Data de nascimento do comprador (AAAA/MM/DD). Tamanho: 10.",
                        "format": "date"
                      },
                      "Address": {
                        "properties": {
                          "Street": {
                            "type": "string",
                            "description": "Endereço do comprador. Tamanho: 255."
                          },
                          "Number": {
                            "type": "string",
                            "description": "Número do endereço do comprador. Tamanho: 15."
                          },
                          "Complement": {
                            "type": "string",
                            "description": "Complemento do endereço do comprador. Tamanho: 50."
                          },
                          "ZipCode": {
                            "type": "string",
                            "description": "CEP do endereço do comprador. Tamanho: 9."
                          },
                          "City": {
                            "type": "string",
                            "description": "Cidade do endereço do comprador. Tamanho: 50."
                          },
                          "State": {
                            "type": "string",
                            "description": "Estado do endereço do comprador. Tamanho: 2."
                          },
                          "Country": {
                            "type": "string",
                            "description": "País do endereço do comprador. Tamanho: 35."
                          }
                        },
                        "required": [],
                        "type": "object"
                      },
                      "DeliveryAddress": {
                        "properties": {
                          "Street": {
                            "type": "string",
                            "description": "Endereço do comprador. Tamanho: 255."
                          },
                          "Complement": {
                            "type": "string",
                            "description": "Complemento do endereço do comprador. Tamanho: 50."
                          },
                          "ZipCode": {
                            "type": "string",
                            "description": "CEP do endereço do comprador. Tamanho: 9."
                          },
                          "City": {
                            "type": "string",
                            "description": "Cidade do endereço do comprador. Tamanho: 50."
                          },
                          "State": {
                            "type": "string",
                            "description": "Estado do endereço do comprador. Tamanho: 2."
                          },
                          "Country": {
                            "type": "string",
                            "description": "País do endereço do comprador. Tamanho: 35."
                          }
                        },
                        "required": [],
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
                            "description": "País do endereço de cobrança. Mais informações em <a href=\"https://www.iso.org/obp/ui/#search\" target=\"_blank\">ISO 2-Digit Alpha Country Code</a>. Tamanho: 2."
                          },
                          "ZipCode": {
                            "type": "string",
                            "description": "Código postal do endereço de cobrança. Tamanho: 9."
                          }
                        },
                        "required": [],
                        "type": "object"
                      }
                    },
                    "required": [],
                    "type": "object"
                  },
                  "Payment": {
                    "properties": {
                      "Type": {
                        "type": "string",
                        "description": "Tipo do meio de pagamento.",
                        "default": "DebitCard"
                      },
                      "Authenticate": {
                        "type": "boolean",
                        "description": "Indica se a transação foi autenticada via 3DS antes da autorização."
                      },
                      "Amount": {
                        "type": "integer",
                        "description": "Valor do pedido (ser enviado em centavos). Tamanho: 15.",
                        "format": "int32"
                      },
                      "DebitCard": {
                        "properties": {
                          "CardNumber": {
                            "type": "string",
                            "description": "Número do cartão do comprador. Tamanho: 19."
                          },
                          "Holder": {
                            "type": "string",
                            "description": "Nome do comprador impresso no cartão. Tamanho: 25."
                          },
                          "ExpirationDate": {
                            "type": "string",
                            "description": "Data de validade impresso no cartão. Tamanho: 7."
                          },
                          "SecurityCode": {
                            "type": "string",
                            "description": "Código de segurança impresso no verso do cartão. Tamanho: 4."
                          },
                          "Brand": {
                            "type": "string",
                            "description": "Bandeira do cartão. Tamanho: 10.",
                            "default": "Elo"
                          }
                        },
                        "required": [
                          "CardNumber",
                          "Holder",
                          "ExpirationDate",
                          "SecurityCode",
                          "Brand"
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
                    "MerchantOrderId": "2014121201",
                    "Customer": {
                      "Name": "Aline de Souza",
                      "Identity": "11225468954",
                      "IdentityType": "CPF",
                      "Email": "alinedesouza@email.com",
                      "Birthdate": "1990-01-01",
                      "Address": {
                        "Street": "Rua das Rosas",
                        "Number": "123",
                        "Complement": "apartamento 101",
                        "ZipCode": "12345987",
                        "City": "São Paulo",
                        "State": "SP",
                        "Country": "BRA"
                      },
                      "DeliveryAddress": {
                        "Street": "Rua das Rosas",
                        "Number": "123",
                        "Complement": "apartamento 101",
                        "ZipCode": "12345987",
                        "City": "São Paulo",
                        "State": "SP",
                        "Country": "BRA"
                      },
                      "Billing": {
                        "Street": "Rua das Rosas",
                        "Number": "123",
                        "Complement": "apartamento 101",
                        "Neighborhood": "Centro",
                        "City": "São Paulo",
                        "State": "SP",
                        "Country": "BR",
                        "ZipCode": "12345987"
                      }
                    },
                    "Payment": {
                      "Type": "DebitCard",
                      "Authenticate": false,
                      "Amount": 50,
                      "DebitCard": {
                        "CardNumber": "5080540487508044",
                        "Holder": "Comprador Cartão de Alelo",
                        "ExpirationDate": "12/2035",
                        "SecurityCode": "333",
                        "brand": "Elo"
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
                    "value": "{\n    \"MerchantOrderId\": \"2014121201\",\n    \"Customer\": {\n        \"Name\": \"Aline de Souza\",\n        \"Identity\": \"11225468954\",\n        \"IdentityType\": \"CPF\",\n        \"Email\": \"alinedesouza@email.com\",\n        \"Birthdate\": \"1990-01-01\",\n        \"Address\": {\n            \"Street\": \"Rua das Rosas\",\n            \"Number\": \"123\",\n            \"Complement\": \"apartamento 101\",\n            \"ZipCode\": \"12345987\",\n            \"City\": \"São Paulo\",\n            \"State\": \"SP\",\n            \"Country\": \"BRA\",\n            \"AddressType\": 0\n        },\n        \"DeliveryAddress\": {\n            \"Street\": \"Rua das Rosas\",\n            \"Number\": \"123\",\n            \"Complement\": \"apartamento 101\",\n            \"ZipCode\": \"12345987\",\n            \"City\": \"São Paulo\",\n            \"State\": \"SP\",\n            \"Country\": \"BRA\",\n            \"AddressType\": 0\n        }\n    },\n    \"Payment\": {\n        \"DebitCard\": {\n            \"CardNumber\": \"508054******8044\",\n            \"Holder\": \"Comprador Cartão de Alelo\",\n            \"ExpirationDate\": \"12/2035\",\n            \"SaveCard\": false,\n            \"Brand\": \"Elo\",\n            \"PaymentAccountReference\": \"290HF92799KE5AY8F01G8PKGU18BH\"\n        },\n        \"Provider\": \"Simulado\",\n        \"AuthorizationCode\": \"441494\",\n        \"Tid\": \"0722122543881\",\n        \"ProofOfSale\": \"912235\",\n        \"Authenticate\": false,\n        \"Recurrent\": false,\n        \"Amount\": 50,\n        \"ReceivedDate\": \"2025-07-22 12:25:43\",\n        \"CapturedAmount\": 50,\n        \"CapturedDate\": \"2025-07-22 12:25:43\",\n        \"Status\": 2,\n        \"IsSplitted\": false,\n        \"ReturnMessage\": \"Operation Successful\",\n        \"ReturnCode\": \"6\",\n        \"PaymentId\": \"cb024e08-22c7-4684-9bba-ec854d7fbd2a\",\n        \"Type\": \"DebitCard\",\n        \"Currency\": \"BRL\",\n        \"Country\": \"BRA\",\n        \"Links\": [\n            {\n                \"Method\": \"GET\",\n                \"Rel\": \"self\",\n                \"Href\": \"https://apiquerysandbox.cieloecommerce.cielo.com.br/1/sales/cb024e08-22c7-4684-9bba-ec854d7fbd2a\"\n            }\n        ]\n    }\n}"
                  }
                },
                "schema": {
                  "type": "object",
                  "properties": {
                    "MerchantOrderId": {
                      "type": "string",
                      "example": "2014121201"
                    },
                    "Customer": {
                      "type": "object",
                      "properties": {
                        "Name": {
                          "type": "string",
                          "example": "Aline de Souza"
                        },
                        "Identity": {
                          "type": "string",
                          "example": "11225468954"
                        },
                        "IdentityType": {
                          "type": "string",
                          "example": "CPF"
                        },
                        "Email": {
                          "type": "string",
                          "example": "alinedesouza@email.com"
                        },
                        "Birthdate": {
                          "type": "string",
                          "example": "1990-01-01"
                        },
                        "Address": {
                          "type": "object",
                          "properties": {
                            "Street": {
                              "type": "string",
                              "example": "Rua das Rosas"
                            },
                            "Number": {
                              "type": "string",
                              "example": "123"
                            },
                            "Complement": {
                              "type": "string",
                              "example": "apartamento 101"
                            },
                            "ZipCode": {
                              "type": "string",
                              "example": "12345987"
                            },
                            "City": {
                              "type": "string",
                              "example": "São Paulo"
                            },
                            "State": {
                              "type": "string",
                              "example": "SP"
                            },
                            "Country": {
                              "type": "string",
                              "example": "BRA"
                            },
                            "AddressType": {
                              "type": "integer",
                              "example": 0,
                              "default": 0
                            }
                          }
                        },
                        "DeliveryAddress": {
                          "type": "object",
                          "properties": {
                            "Street": {
                              "type": "string",
                              "example": "Rua das Rosas"
                            },
                            "Number": {
                              "type": "string",
                              "example": "123"
                            },
                            "Complement": {
                              "type": "string",
                              "example": "apartamento 101"
                            },
                            "ZipCode": {
                              "type": "string",
                              "example": "12345987"
                            },
                            "City": {
                              "type": "string",
                              "example": "São Paulo"
                            },
                            "State": {
                              "type": "string",
                              "example": "SP"
                            },
                            "Country": {
                              "type": "string",
                              "example": "BRA"
                            },
                            "AddressType": {
                              "type": "integer",
                              "example": 0,
                              "default": 0
                            }
                          }
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
                              "example": "508054******8044"
                            },
                            "Holder": {
                              "type": "string",
                              "example": "Comprador Cartão de Alelo"
                            },
                            "ExpirationDate": {
                              "type": "string",
                              "example": "12/2035"
                            },
                            "SaveCard": {
                              "type": "boolean",
                              "example": false,
                              "default": true
                            },
                            "Brand": {
                              "type": "string",
                              "example": "Elo"
                            },
                            "PaymentAccountReference": {
                              "type": "string",
                              "example": "290HF92799KE5AY8F01G8PKGU18BH"
                            }
                          }
                        },
                        "Provider": {
                          "type": "string",
                          "example": "Simulado"
                        },
                        "AuthorizationCode": {
                          "type": "string",
                          "example": "441494"
                        },
                        "Tid": {
                          "type": "string",
                          "example": "0722122543881"
                        },
                        "ProofOfSale": {
                          "type": "string",
                          "example": "912235"
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
                        "Amount": {
                          "type": "integer",
                          "example": 50,
                          "default": 0
                        },
                        "ReceivedDate": {
                          "type": "string",
                          "example": "2025-07-22 12:25:43"
                        },
                        "CapturedAmount": {
                          "type": "integer",
                          "example": 50,
                          "default": 0
                        },
                        "CapturedDate": {
                          "type": "string",
                          "example": "2025-07-22 12:25:43"
                        },
                        "Status": {
                          "type": "integer",
                          "example": 2,
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
                          "example": "6"
                        },
                        "PaymentId": {
                          "type": "string",
                          "example": "cb024e08-22c7-4684-9bba-ec854d7fbd2a"
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
                                "example": "https://apiquerysandbox.cieloecommerce.cielo.com.br/1/sales/cb024e08-22c7-4684-9bba-ec854d7fbd2a"
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
                    "value": "Bad request"
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