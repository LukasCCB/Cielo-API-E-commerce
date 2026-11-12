---
updatedAt: 2026-07-17T12:46:25.000Z
agentTools:
  siteIndex: https://docs.cielo.com.br/llms.txt
  projectIndex: https://docs.cielo.com.br/ecommerce-cielo/llms.txt
---

# Criar pagamento com cartão multibenefícios

Cria solicitação de autorização para transação de cartão multibenefícios.

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
        <div class="headline-container-article-info2GaOf2jMpV0r"><span class="rm-APIMethod APIMethod APIMethod_fixedWidth APIMethod_post headline-container-api-method1Hc-Fm7uaccR" data-testid="http-method">post</span></div>
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
        <div class="headline-container-article-info2GaOf2jMpV0r"><span class="rm-APIMethod APIMethod APIMethod_fixedWidth APIMethod_post headline-container-api-method1Hc-Fm7uaccR" data-testid="http-method">post</span></div>
      </td>

      <td style={{ textAlign: "left" }}>
        `https://api.cieloecommerce.cielo.com.br/1/sales`
      </td>
    </tr>
  </tbody>
</Table>

<Callout icon="ℹ️" theme="info">
  Saiba mais sobre essa funcionalidade na <a href="https://docs.cielo.com.br/ecommerce-cielo/docs/cartao-multibeneficios" target="_blank">documentação</a>.
</Callout>

> ℹ️ CNPJs alfanuméricos serão implementados pela Receita Federal em julho de 2026
>
> Essa mudança afeta apenas novas inscrições, **não havendo mudanças em CNPJs existentes**.
>
> O CNPJ alfanumérico **já está sendo suportado pela Cielo**, sem mudanças na sua integração.
>
> Recomendamos verificar a necessidade de possíveis ajustes nos sistemas próprios de checkout de sua loja.

O pagamento com cartão multibenefícios é semelhante a um pagamento de cartão de crédito.

* Envie os dados do cartão no nó `Payment.CreditCard`;
* Informe `Voucher` = *true*.
* Bandeiras aceitas: **Visa, Mastercard e Elo**.

> ℹ️ Captura e cancelamento
>
> * É possível fazer a captura posterior;
> * É permitido cancelar a transação dentro do prazo de 360 dias.

> ⚠️ Atenção
>
> Para voucher **multibenefícios Alelo**, use [a integração do tipo voucher](https://docs.cielo.com.br/ecommerce-cielo/reference/criar-pagamento-com-voucher).

<br />

# OpenAPI definition

```json
{
  "openapi": "3.1.0",
  "info": {
    "title": "Cartão multibenefícios",
    "version": "3.0"
  },
  "tags": [
    {
      "name": "Cartão multibenefícios"
    }
  ],
  "servers": [
    {
      "url": "https://apisandbox.cieloecommerce.cielo.com.br"
    }
  ],
  "security": [],
  "paths": {
    "/1/sales/": {
      "post": {
        "summary": "Criar pagamento com cartão multibenefícios",
        "tags": [
          "Cartão multibenefícios"
        ],
        "description": "Cria solicitação de autorização para transação de cartão multibenefícios.",
        "operationId": "criar-pagamento-multibeneficios",
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
                    "description": "Identificação do pedido. Poderá ser usada para cancelar ou consultar a transação no futuro.<br> *Atenção: Os caracteres permitidos são apenas a-z, A-Z, 0-9. Não são permitidos caracteres especiais e espaços em branco.* <br>Tamanho: 50."
                  },
                  "Customer": {
                    "properties": {
                      "Name": {
                        "type": "string",
                        "description": "Nome do comprador. Tamanho: 255.<br>_Atenção: Os caracteres permitidos são apenas a-z, A-Z. Não são permitidos caracteres especiais e números._"
                      },
                      "Status": {
                        "type": "string",
                        "description": "Status de cadastro do comprador na loja (NEW / EXISTING). Tamanho: 255."
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
                        "type": "object",
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
                        "required": []
                      },
                      "DeliveryAddress": {
                        "type": "object",
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
                        "required": []
                      },
                      "Billing": {
                        "type": "object",
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
                        "required": []
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
                        "default": "CreditCard"
                      },
                      "Amount": {
                        "type": "integer",
                        "description": "Valor do pedido (ser enviado em centavos). Tamanho: 15.",
                        "format": "int32"
                      },
                      "Installments": {
                        "type": "integer",
                        "description": "Número de parcelas."
                      },
                      "CreditCard": {
                        "type": "object",
                        "properties": {
                          "CardNumber": {
                            "type": "string",
                            "description": "Número do cartão multibenefícios. Tamanho: 19."
                          },
                          "Holder": {
                            "type": "string",
                            "description": "Nome do titular do cartão multibenefícios. Tamanho: 25."
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
                            "description": "Bandeira do cartão multibenefícios.<br>Valores possíveis: *Visa*, *Mastercard* ou *Elo*. <br>Tamanho: 10."
                          }
                        },
                        "required": [
                          "CardNumber",
                          "Holder",
                          "ExpirationDate",
                          "SecurityCode",
                          "Brand"
                        ]
                      },
                      "Voucher": {
                        "type": "boolean",
                        "description": "Indica se a transação é de voucher multibenefícios."
                      }
                    },
                    "required": [
                      "Type",
                      "Amount",
                      "Installments",
                      "CreditCard",
                      "Voucher"
                    ],
                    "type": "object"
                  }
                }
              },
              "examples": {
                "Multibenefícios": {
                  "value": {
                    "MerchantOrderId": "Loja123456",
                    "Customer": {
                      "Name": "Aline de Souza",
                      "Identity": "12345678909",
                      "IdentityType": "CPF",
                      "Email": "aline@email.com",
                      "Birthdate": "1990-01-01",
                      "IpAddress": "127.0.0.1",
                      "Address": {
                        "Street": "Alameda Xingu",
                        "Number": "512",
                        "Complement": "27 andar",
                        "ZipCode": "12345987",
                        "City": "São Paulo",
                        "State": "SP",
                        "Country": "BRA",
                        "District": "Alphaville"
                      },
                      "DeliveryAddress": {
                        "Street": "Alameda Xingu",
                        "Number": "512",
                        "Complement": "27 andar",
                        "ZipCode": "12345987",
                        "City": "São Paulo",
                        "State": "SP",
                        "Country": "BRA",
                        "District": "Alphaville"
                      }
                    },
                    "Payment": {
                      "Type": "CreditCard",
                      "Amount": 15700,
                      "Installments": 1,
                      "Voucher": true,
                      "CreditCard": {
                        "CardNumber": "4532110000001234",
                        "Holder": "Aline de Souza",
                        "ExpirationDate": "12/2030",
                        "SecurityCode": "123",
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
                  "Criada": {
                    "value": {
                      "MerchantOrderId": "Loja123456",
                      "Customer": {
                        "Name": "Aline de Souza",
                        "Identity": "12345678909",
                        "IdentityType": "CPF",
                        "Email": "aline@email.com",
                        "Birthdate": "1990-01-01",
                        "Address": {
                          "Street": "Alameda Xingu",
                          "Number": "512",
                          "Complement": "27 andar",
                          "ZipCode": "12345987",
                          "City": "São Paulo",
                          "State": "SP",
                          "Country": "BRA",
                          "District": "Alphaville",
                          "AddressType": 0
                        },
                        "DeliveryAddress": {
                          "Street": "Alameda Xingu",
                          "Number": "512",
                          "Complement": "27 andar",
                          "ZipCode": "12345987",
                          "City": "São Paulo",
                          "State": "SP",
                          "Country": "BRA",
                          "District": "Alphaville",
                          "AddressType": 0
                        },
                        "IpAddress": "127.0.0.1"
                      },
                      "Payment": {
                        "ServiceTaxAmount": 0,
                        "Installments": 1,
                        "Interest": 0,
                        "Capture": false,
                        "Authenticate": false,
                        "Recurrent": false,
                        "CreditCard": {
                          "CardNumber": "453211******1234",
                          "Holder": "Aline de Souza",
                          "ExpirationDate": "12/2030",
                          "SaveCard": false,
                          "Brand": "Visa",
                          "PaymentAccountReference": "I30Y69SCA4IA3XB9F73CXG6V9HLH1"
                        },
                        "Tid": "0330112122216",
                        "ProofOfSale": "086334",
                        "AuthorizationCode": "957981",
                        "Provider": "Simulado",
                        "IsQrCode": false,
                        "Voucher": true,
                        "SentOrderId": "Loja123456",
                        "Amount": 15700,
                        "ReceivedDate": "2026-03-30 11:21:22",
                        "Status": 1,
                        "IsSplitted": false,
                        "ReturnMessage": "Operation Successful",
                        "ReturnCode": "4",
                        "PaymentId": "e5e6f0cf-9a47-414e-aead-7ee2e09d4ac4",
                        "Type": "CreditCard",
                        "Currency": "BRL",
                        "Country": "BRA",
                        "Links": [
                          {
                            "Method": "GET",
                            "Rel": "self",
                            "Href": "https://apiquerysandbox.cieloecommerce.cielo.com.br/1/sales/e5e6f0cf-9a47-414e-aead-7ee2e09d4ac4"
                          },
                          {
                            "Method": "PUT",
                            "Rel": "capture",
                            "Href": "https://apisandbox.cieloecommerce.cielo.com.br/1/sales/e5e6f0cf-9a47-414e-aead-7ee2e09d4ac4/capture"
                          },
                          {
                            "Method": "PUT",
                            "Rel": "void",
                            "Href": "https://apisandbox.cieloecommerce.cielo.com.br/1/sales/e5e6f0cf-9a47-414e-aead-7ee2e09d4ac4/void"
                          }
                        ]
                      }
                    }
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
                        },
                        "DeliveryAddress": {
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
                        },
                        "Billing": {
                          "type": "object",
                          "properties": {
                            "Street": {
                              "type": "string",
                              "example": "Rua Neturno"
                            },
                            "Number": {
                              "type": "string",
                              "example": "12345"
                            },
                            "Complement": {
                              "type": "string",
                              "example": "Sala 123"
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
                              "example": "20080123"
                            }
                          }
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
                        "CreditCard": {
                          "type": "object",
                          "properties": {
                            "CardNumber": {
                              "type": "string",
                              "example": "455187******0183"
                            },
                            "Holder": {
                              "type": "string",
                              "example": "Aline de Souza"
                            },
                            "ExpirationDate": {
                              "type": "string",
                              "example": "12/2030"
                            },
                            "Brand": {
                              "type": "string",
                              "example": "Visa"
                            }
                          }
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
                        "Country": {
                          "type": "string",
                          "example": "BRA"
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
                  "Bad Request": {
                    "value": "Bad request"
                  }
                }
              }
            }
          },
          "401": {
            "description": "401",
            "content": {
              "application/json": {
                "examples": {
                  "Unauthorized": {
                    "value": "Unauthorized"
                  }
                }
              }
            }
          },
          "403": {
            "description": "403",
            "content": {
              "application/json": {
                "examples": {
                  "Forbidden": {
                    "value": "Forbidden"
                  }
                }
              }
            }
          },
          "404": {
            "description": "404",
            "content": {
              "application/json": {
                "examples": {
                  "Not Found": {
                    "value": "Not Found"
                  }
                }
              }
            }
          },
          "405": {
            "description": "405",
            "content": {
              "application/json": {
                "examples": {
                  "Method not Allowed": {
                    "value": "Method Not Allowed"
                  }
                }
              }
            }
          },
          "500": {
            "description": "500",
            "content": {
              "application/json": {
                "examples": {
                  "Internal Server Error": {
                    "value": "Internal Server Error"
                  }
                }
              }
            }
          },
          "502": {
            "description": "502",
            "content": {
              "application/json": {
                "examples": {
                  "Bad Gateway": {
                    "value": "Bad Gateway"
                  }
                }
              }
            }
          },
          "503": {
            "description": "503",
            "content": {
              "application/json": {
                "examples": {
                  "Service Unavailable": {
                    "value": "Service Unavailable"
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
    "explorer-enabled": true,
    "proxy-enabled": true
  }
}
```