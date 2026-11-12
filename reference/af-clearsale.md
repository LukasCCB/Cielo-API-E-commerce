---
updatedAt: 2026-07-17T12:53:00.000Z
agentTools:
  siteIndex: https://docs.cielo.com.br/llms.txt
  projectIndex: https://docs.cielo.com.br/ecommerce-cielo/llms.txt
---

# Criar pagamento com análise de fraude ClearSale

Cria um pagamento de cartão de crédito e envia a transação para o Antifraude (solução Braspag) no provedor ClearSale

| Ambiente | Método                                                                                                                                                                                                                  | Endpoint                                                  |
| :------- | :---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- | :-------------------------------------------------------- |
| Sandbox  | <div class="headline-container-article-info2GaOf2jMpV0r"><span class="rm-APIMethod APIMethod APIMethod_fixedWidth APIMethod_post headline-container-api-method1Hc-Fm7uaccR" data-testid="http-method">post</span></div> | `https://apisandbox.cieloecommerce.cielo.com.br/1/sales/` |
| Produção | <div class="headline-container-article-info2GaOf2jMpV0r"><span class="rm-APIMethod APIMethod APIMethod_fixedWidth APIMethod_post headline-container-api-method1Hc-Fm7uaccR" data-testid="http-method">post</span></div> | `https://api.cieloecommerce.cielo.com.br/1/sales/`        |

<br />

> O Antifraude (solução Braspag) está disponível mediante contratação adicional. <a href="https://www.cielo.com.br/e-commerce/" target="_blank">Saiba mais na página de soluções do e-commerce Cielo</a>.

<Callout icon="ℹ️" theme="info">
  ###

  Saiba mais sobre essa funcionalidade <a href="https://docs.cielo.com.br/ecommerce-cielo/docs/analise-de-fraude" target="_blank">na documentação</a>.
</Callout>

> ℹ️ CNPJs alfanuméricos serão implementados pela Receita Federal em julho de 2026
>
> Essa mudança afeta apenas novas inscrições, **não havendo mudanças em CNPJs existentes**.
>
> O CNPJ alfanumérico **já está sendo suportado pela Cielo**, sem mudanças na sua integração.
>
> Recomendamos verificar a necessidade de possíveis ajustes nos sistemas próprios de checkout de sua loja.

<br />

### Resposta da criação de pagamento com análise de fraude

A resposta irá trazer os mesmos resultados que uma transação de crédito convencional, mais os parâmetros referentes ao resultado da análise de fraude.

<br />

| Propriedade                                             | Descrição                                                                                                                                     | Tipo     |
| ------------------------------------------------------- | --------------------------------------------------------------------------------------------------------------------------------------------- | -------- |
| `Payment.FraudAnalysis.IsRetryTransaction`              | Retentativa de uma análise, e deverá ser enviado com valor igual a "true" quando o código de retorno na primeira tentativa for igual a BP900. | booleano |
| `Payment.FraudAnalysis.Id`                              | Identificação transação no Antifraude                                                                                                         | GUID     |
| `Payment.FraudAnalysis.Status`                          | [Status da transação no Antifraude](https://docs.cielo.com.br/ecommerce-cielo/reference/lista-de-status-do-antifraude).                       | número   |
| `Payment.FraudAnalysis.StatusDescription`               | Descrição do status do Antifraude.                                                                                                            | texto    |
| `Payment.FraudAnalysis.ReplyData.ProviderTransactionId` | Identificador da transação na ClearSale                                                                                                       | string   |

<br />

# OpenAPI definition

```json
{
  "openapi": "3.1.0",
  "info": {
    "title": "pagamentos-com-análise-de-fraude-clearsale",
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
        "summary": "Criar pagamento com análise de fraude ClearSale",
        "description": "Cria um pagamento de cartão de crédito e envia a transação para o Antifraude (solução Braspag) no provedor ClearSale",
        "operationId": "af-clearsale",
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
            "description": "Identificador do request definido pela loja. Tamanho: 36.",
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
                        "description": "Nome completo do comprador. Tamanho: 120.<br>_Atenção: Os caracteres permitidos são apenas a-z, A-Z. Não são permitidos caracteres especiais e números._"
                      },
                      "Identity": {
                        "type": "string",
                        "description": "Número do CPF ou CNPJ do comprador. Tamanho: 14.<br>**Permite envio de CNPJs alfanuméricos.**"
                      },
                      "IdentityType": {
                        "type": "string",
                        "description": "Tipo de documento de identificação do comprador <br/> Possíveis valores: CPF ou CNPJ. Tamanho: 255."
                      },
                      "Email": {
                        "type": "string",
                        "description": "E-mail do comprador. Tamanho: 100."
                      },
                      "Birthdate": {
                        "type": "string",
                        "description": "Data de nascimento do comprador <br/> Ex.: 1991-01-10. Tamanho: 10."
                      },
                      "Phone": {
                        "type": "string",
                        "description": "**É obrigatório enviar pelo menos um telefone**. Telefone residencial. Fomato +DDI DDD NNNN-NNNN Exemplo: +55 11 5555-1001. Tamanho: 20."
                      },
                      "Mobile": {
                        "type": "string",
                        "description": "**É obrigatório enviar pelo menos um telefone**. Celular. Fomato +DDI DDD NNNNN-NNNN Exemplo: +55 11 99999-9999. Tamanho: 20."
                      },
                      "DeliveryAddress": {
                        "properties": {
                          "Street": {
                            "type": "string",
                            "description": "Logradouro do endereço de entrega. Tamanho: 54."
                          },
                          "Number": {
                            "type": "string",
                            "description": "Número do endereço de entrega. Tamanho: 5."
                          },
                          "Complement": {
                            "type": "string",
                            "description": "Complemento do endereço de entrega. Tamanho: 14."
                          },
                          "ZipCode": {
                            "type": "string",
                            "description": "Código postal do endereço de entrega. Tamanho: 9."
                          },
                          "City": {
                            "type": "string",
                            "description": "Cidade do endereço de entrega. Tamanho: 50."
                          },
                          "State": {
                            "type": "string",
                            "description": "Estado do endereço de entrega. Tamanho: 2."
                          },
                          "Country": {
                            "type": "string",
                            "description": "País do endereço de entrega. Mais informações em <a href=\"https://www.iso.org/obp/ui/#search\" target=\"_blank\">ISO 2-Digit Alpha Country Code</a>. Tamanho: 2."
                          },
                          "District": {
                            "type": "string",
                            "description": "Bairro do endereço de entrega. Tamanho: 45."
                          }
                        },
                        "required": [],
                        "type": "object"
                      },
                      "BillingAddress": {
                        "properties": {
                          "Street": {
                            "type": "string",
                            "description": "Logradouro do endereço de cobrança. Tamanho: 54."
                          },
                          "Number": {
                            "type": "string",
                            "description": "Número do endereço de cobrança. Tamanho: 5."
                          },
                          "Complement": {
                            "type": "string",
                            "description": "Complemento do endereço de cobrança. Tamanho: 14."
                          },
                          "ZipCode": {
                            "type": "string",
                            "description": "Código postal do endereço de cobrança. Tamanho: 9."
                          },
                          "City": {
                            "type": "string",
                            "description": "Cidade do endereço de cobrança. Tamanho: 2."
                          },
                          "State": {
                            "type": "string",
                            "description": "Estado do endereço de cobrança. Tamanho: 2."
                          },
                          "Country": {
                            "type": "string",
                            "description": "País do endereço de cobrança. Mais informações em <a href=\"https://www.iso.org/obp/ui/#search\" target=_blank>ISO 2-Digit Alpha Country Code</a>. Tamanho: 2."
                          },
                          "District": {
                            "type": "string",
                            "description": "Bairro do endereço de cobrança. Tamanho: 45."
                          }
                        },
                        "required": [
                          "Street",
                          "Number",
                          "ZipCode",
                          "Country",
                          "District"
                        ],
                        "type": "object"
                      }
                    },
                    "required": [
                      "Name",
                      "Identity",
                      "Email",
                      "Birthdate"
                    ],
                    "type": "object"
                  },
                  "Payment": {
                    "properties": {
                      "Type": {
                        "type": "string",
                        "description": "Tipo do meio de pagamento. <br/> Obs.: Somente o tipo _CreditCard_ funciona com análise de fraude. Tamanho: 100."
                      },
                      "Provider": {
                        "type": "string",
                        "description": "Define comportamento do meio de pagamento (ver Anexo) <br/> Obs.: Não obrigatório para `Payment.Type` igual a _CreditCard_.<br>Tamanho: 15."
                      },
                      "Amount": {
                        "type": "integer",
                        "description": "Valor da transação financeira em centavos <br/> Ex: 150000 = r$ 1.500,00. Tamanho: 15.",
                        "format": "int32"
                      },
                      "Installments": {
                        "type": "integer",
                        "description": "Número de parcelas. Tamanho: 2.",
                        "format": "int32"
                      },
                      "Capture": {
                        "type": "boolean",
                        "description": "Indica se a autorização deverá ser com captura automática.<br>Possíveis valores: “true” / “false” (default).<br>**Obs. 1**: Verifique junto à adquirente a disponibilidade desta funcionalidade.<br>**Obs. 2**: Este campo deverá ser preenchido de acordo com o fluxo da análise de fraude."
                      },
                      "Recurrent": {
                        "type": "boolean",
                        "description": "Indica se a transação é do tipo recorrente.<br>Possíveis valores: “true” / “false” (default).<br>**Obs. 1**: Este campo igual a “true” não irá criar uma recorrência; apenas permitirá a realização de uma transação sem a necessidade de envio do CVV, indicando para a adquirente que é a cobrança de uma transação de uma recorrência.<br>**Obs. 2**: Somente para transações Cielo.<br>**Obs. 3**: O campo `Payment.Authenticate` deve ser igual a “false” quando  `Payment.Recurrent`  for igual a “true”."
                      },
                      "SoftDescriptor": {
                        "type": "string",
                        "description": "Texto que será impresso na fatura do portador <br/> Obs.: O valor deste campo tem que ser claro e fácil de identificar pelo portador o estabelecimento onde foi realizada a compra, pois é um dos principais ofensores para chargeback. Tamanho: 13."
                      },
                      "CreditCard": {
                        "properties": {
                          "CardNumber": {
                            "type": "string",
                            "description": "Número do cartão de crédito. Tamanho: 16."
                          },
                          "Holder": {
                            "type": "string",
                            "description": "Nome do portador impresso no cartão de crédito. Tamanho: 25."
                          },
                          "ExpirationDate": {
                            "type": "string",
                            "description": "Data de validade do cartão de crédito. Tamanho: 7."
                          },
                          "SecurityCode": {
                            "type": "string",
                            "description": "Código de segurança no verso do cartão de crédito. Tamanho: 4."
                          },
                          "SaveCard": {
                            "type": "boolean",
                            "description": "Booleano que identifica se o cartão será salvo para gerar o token (CardToken) <br/> Possíveis valores: true / false (default)."
                          },
                          "Brand": {
                            "type": "string",
                            "description": "Bandeira do cartão de crédito. Tamanho: 10."
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
                      },
                      "FraudAnalysis": {
                        "properties": {
                          "Provider": {
                            "type": "string",
                            "description": "Provedor de AntiFraude <br/> Neste caso, use \"ClearSale\". Tamanho: 10."
                          },
                          "Sequence": {
                            "type": "string",
                            "description": "Tipo de fluxo da análise de fraude. Possíveis valores: AnalyseFirst / AuthorizeFirst. <br> Saiba mais em <a href=\"https://docs.cielo.com.br/risco/docs/analise-fraude#authorizefirst-x-analysefirst\" target=\"_blank\">Fluxos da análise de fraude.</a> Tamanho:  14."
                          },
                          "SequenceCriteria": {
                            "type": "string",
                            "description": "Critério do fluxo da análise de fraude <br/> Possíveis valores: OnSuc/ Always. <br> Saiba mais em <a href=\"https://docs.cielo.com.br/risco/docs/analise-fraude#authorizefirst-x-analysefirst\" target=\"_blank\">Fluxos da análise de fraude.</a> Tamanho: 9."
                          },
                          "CaptureOnLowRisk": {
                            "type": "boolean",
                            "description": "Indica se a transação após a análise de fraude será capturada <br/> Possíveis valores: true / false (default) <br/> Obs.: Quando enviado igual a _true_ e o retorno da análise de fraude for de baixo risco (Accept) a transação anteriormente autorizada será capturada <br/> Obs2.: Quando enviado igual a _true_ e o retorno da análise de fraude for revisão (Review) a transação ficará autorizada. A mesma será capturada após a Cielo receber o novo status da análise manual e este for de baixo risco (Accept) <br/> Obs.: Para a utilização deste parâmetro, a sequência do fluxo de análise de risco deve ser obrigatoriamente _AuthorizeFirst_"
                          },
                          "VoidOnHighRisk": {
                            "type": "boolean",
                            "description": "Indica se a transação será cancelada após a análise de fraude se o retorno for alto risco.<br/> Possíveis valores: true / false (default) <br/> Obs.: Quando enviado igual a *true* e o retorno da análise de fraude for de alto risco (Reject) a transação anteriormente autorizada será cancelada <br/> Obs2.: Quando enviado igual a *true* e o retorno da análise de fraude for revisão (Review) a transação ficará autorizada. A transação será cancelada após a Cielo receber o novo status da análise manual e este for alto risco (Reject) <br/> Obs.: Para a utilização deste parâmetro, a sequência do fluxo de análise de risco deve ser obrigatoriamente *AuthorizeFirst*"
                          },
                          "TotalOrderAmount": {
                            "type": "integer",
                            "description": "Valor total do pedido em centavos <br/> Ex: 123456 = r$ 1.234,56. Tamanho: 15.",
                            "format": "int32"
                          },
                          "Browser": {
                            "properties": {
                              "BrowserFingerprint": {
                                "type": "string",
                                "description": "Identificador utilizado para cruzar informações obtidas do dispositivo do comprador. Este mesmo identificador deve ser utilizado para gerar o valor que será atribuído ao campo `session_id` do script ou utilizando os SDKs (iOS ou Android) que será incluído na página de checkout. <br/> Obs.: Este identificador poderá ser qualquer valor ou o número do pedido, mas deverá ser único durante 48 horas. Tamanho: 100."
                              }
                            },
                            "required": [
                              "BrowserFingerprint"
                            ],
                            "type": "object"
                          },
                          "Shipping": {
                            "properties": {
                              "Addressee": {
                                "type": "string",
                                "description": "Nome completo do responsável a receber o produto no endereço de entrega. Tamanho: 120."
                              },
                              "Method": {
                                "type": "string",
                                "description": "Meio de entrega do pedido <br/> <a href=\"https://docs.cielo.com.br/risco/reference/tabela-39-paymentfraudanalysisshippingmethod\" target=\"_blank\">Tabela 39 - Payment.Fraudanalysis.Shipping.Method.</a>"
                              }
                            },
                            "required": [],
                            "type": "object"
                          },
                          "Cart": {
                            "properties": {
                              "IsGift": {
                                "type": "boolean",
                                "description": "Indica se o pedido realizado pelo comprador é para presente."
                              },
                              "ReturnsAccepted": {
                                "type": "boolean",
                                "description": "Indica se o pedido realizado pelo comprador pode ser devolvido a loja <br/> Possíveis valores: true / false (default)."
                              },
                              "Items": {
                                "properties": {
                                  "Name": {
                                    "type": "string",
                                    "description": "Nome do Produto.  Tamanho: 255."
                                  },
                                  "Quantity": {
                                    "type": "integer",
                                    "description": "Quantidade do produto.  Tamanho: 15.",
                                    "format": "int32"
                                  },
                                  "Sku": {
                                    "type": "string",
                                    "description": "SKU (Stock Keeping Unit - Unidade de Controle de Estoque) do produto.  Tamanho: 255."
                                  },
                                  "UnitPrice": {
                                    "type": "integer",
                                    "description": "Preço unitário do produto <br/> Ex: 10950 = R$109,50.  Tamanho: 15.",
                                    "format": "int32"
                                  },
                                  "Type": {
                                    "type": "string",
                                    "description": "Categoria do produto <br/><a href=\"https://docs.cielo.com.br/risco/reference/tabela-36-cartitemntype\" target=\"_blank\">Tabela 36 - CartItem[n].Type</a>.<br>Tamanho: 19."
                                  }
                                },
                                "required": [
                                  "Name",
                                  "Quantity",
                                  "Sku"
                                ],
                                "type": "object"
                              }
                            },
                            "required": [],
                            "type": "object"
                          },
                          "Travel": {
                            "properties": {
                              "Passengers": {
                                "properties": {
                                  "Name": {
                                    "type": "string",
                                    "description": "Nome completo do passageiro. Tamanho: 120."
                                  },
                                  "TravelLegs": {
                                    "properties": {
                                      "Origin": {
                                        "type": "string",
                                        "description": "Código do aeroporto de partida. Mais informações em <a href=\"http://www.nationsonline.org/oneworld/IATA_Codes/airport_code_list.htm\" target=\"_blank\">IATA 3-Letter Codes</a>.<br>Tamanho: 3."
                                      },
                                      "Destination": {
                                        "type": "string",
                                        "description": "Código do aeroporto de chegada. Mais informações em <a href=\"http://www.nationsonline.org/oneworld/IATA_Codes/airport_code_list.htm\" target=\"_blank\">IATA 3-Letter Codes</a>.<br>Tamanho: 3."
                                      },
                                      "DepartureDate": {
                                        "type": "string",
                                        "description": "Data e hora de partida. <br/> Formato: \"2023-10-09T18:30:00\".",
                                        "format": "date"
                                      },
                                      "Boarding": {
                                        "type": "string",
                                        "description": "Data e hora de embarque. Formato: \"2023-10-09T18:30:00\".",
                                        "format": "date"
                                      },
                                      "Arriving": {
                                        "type": "string",
                                        "description": "Data e hora de chegada. Formato: \"2023-10-09T18:30:00\"."
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
                            "required": [],
                            "type": "object"
                          }
                        },
                        "required": [
                          "Sequence",
                          "SequenceCriteria",
                          "TotalOrderAmount"
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
                  }
                }
              },
              "examples": {
                "Request Example": {
                  "value": {
                    "MerchantOrderId": "Loja123456",
                    "Customer": {
                      "Name": "Aline de Souza",
                      "Identity": "11111111111",
                      "IdentityType": "CPF",
                      "Email": "nome@email.com.br",
                      "Birthdate": "1996-11-14",
                      "Phone": "+55 11 5555-1001",
                      "Mobile": "+55 11 5555-1001",
                      "DeliveryAddress": {
                        "Street": "Alameda Xingu",
                        "Number": "512",
                        "Complement": "27 andar",
                        "ZipCode": "06455030",
                        "City": "Barueri",
                        "State": "SP",
                        "Country": "BR",
                        "District": "Alphaville"
                      },
                      "BillingAddress": {
                        "Street": "Alameda Xingu",
                        "Number": "512",
                        "Complement": "21 andar",
                        "ZipCode": "06455030",
                        "City": "Barueri",
                        "State": "SP",
                        "Country": "BR",
                        "District": "Alphaville"
                      }
                    },
                    "Payment": {
                      "Type": "CreditCard",
                      "Provider": "Simulado",
                      "Amount": 45500,
                      "Installments": 1,
                      "Capture": false,
                      "Recurrent": false,
                      "SoftDescriptor": "Nome fantasia da loja",
                      "CreditCard": {
                        "CardNumber": "4000021231111111",
                        "Holder": "Guilherme Silva",
                        "ExpirationDate": "08/2033",
                        "SaveCard": false,
                        "Brand": "Visa"
                      },
                      "FraudAnalysis": {
                        "Provider": "ClearSale",
                        "Sequence": "AuthorizeFirst",
                        "SequenceCriteria": "OnSuccess",
                        "CaptureOnLowRisk": false,
                        "VoidOnHighRisk": false,
                        "TotalOrderAmount": 46000,
                        "Cart": {
                          "IsGift": false,
                          "ReturnsAccepted": true,
                          "Items": [
                            {
                              "Name": "Mouse",
                              "Quantity": 1,
                              "Sku": "100010",
                              "UnitPrice": 532400,
                              "Type": "EletronicGood"
                            },
                            {
                              "Name": "Windows 11 Professional",
                              "Quantity": 2,
                              "Sku": "100011",
                              "UnitPrice": 85515,
                              "Type": "EletronicSoftware"
                            }
                          ]
                        },
                        "Travel": {
                          "Passengers": [
                            {
                              "Name": "Aline de Souza",
                              "TravelLegs": [
                                {
                                  "Origin": "SDU",
                                  "Destination": "CGH",
                                  "DepartureDate": "2025-10-09T18:30:00",
                                  "Boarding": "2025-10-09T18:45:00",
                                  "Arriving": "2025-10-09T20:00:00"
                                }
                              ]
                            },
                            {
                              "Name": "Guilherme Silva",
                              "TravelLegs": [
                                {
                                  "Origin": "SDU",
                                  "Destination": "CGH",
                                  "DepartureDate": "2025-10-09T18:30:00",
                                  "Boarding": "2025-10-09T18:45:00",
                                  "Arriving": "2025-10-09T20:00:00"
                                }
                              ]
                            }
                          ]
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
                    "value": "{\n    \"MerchantOrderId\": \"Loja123456\",\n    \"Customer\": {\n        \"Name\": \"Aline de Souza\",\n        \"Identity\": \"11111111111\",\n        \"IdentityType\": \"CPF\",\n        \"Email\": \"homolog@cielo.com.br\",\n        \"Birthdate\": \"1996-11-14\",\n        \"Phone\": \"+55 11 5555-1001\",\n        \"Mobile\": \"+55 11 5555-1001\"\n        \"DeliveryAddress\": {\n            \"Street\": \"Alameda Xingu\",\n            \"Number\": \"512\",\n            \"Complement\": \"27 andar\",\n            \"ZipCode\": \"12345987\",\n            \"City\": \"São Paulo\",\n            \"State\": \"SP\",\n            \"Country\": \"BR\",\n            \"District\": \"Alphaville\",\n            \"AddressType\": 0,\n        },\n        \"BillingAddress\": {\n            \"Street\": \"Alameda Xingu\",\n            \"Number\": \"512\",\n            \"Complement\": \"21 andar\",\n            \"ZipCode\": \"06455030\",\n            \"City\": \"Barueri\",\n            \"State\": \"SP\",\n            \"Country\": \"BR\",\n            \"District\": \"Alphaville\"\n        }\n    },\n    \"Payment\": {\n        \"ServiceTaxAmount\": 0,\n        \"Installments\": 1,\n        \"Interest\": 0,\n        \"Capture\": false,\n        \"Authenticate\": false,\n        \"Recurrent\": false,\n        \"CreditCard\": {\n            \"CardNumber\": \"400002******1111\",\n            \"Holder\": \"Guilherme Silva\",\n            \"ExpirationDate\": \"08/2033\",\n            \"SaveCard\": false,\n            \"Brand\": \"Visa\",\n            \"PaymentAccountReference\": \"2UKZQRDOXLRMGW3B41E8IB5KZOH8V\"\n        },\n        \"Tid\": \"1020115320892\",\n        \"ProofOfSale\": \"039771\",\n        \"AuthorizationCode\": \"616672\",\n        \"SoftDescriptor\": \"Nome fantasia da loja\",\n        \"Provider\": \"Simulado\",\n        \"FraudAnalysis\": {\n            \"Id\": \"7bc9a7ea-25a9-483c-1f61-08dbbaaa0d60\",\n            \"Status\": 1,\n            \"StatusDescription\": \"Accept\",\n            \"ReplyData\": {\n                \"ProviderTransactionId\": \"7BC9A7EA-25A9-483C-1F61-08DBBAAA0D60\"\n            },            \n            \"Sequence\": \"AuthorizeFirst\",\n            \"SequenceCriteria\": \"OnSuccess\",\n            \"TotalOrderAmount\": 46000,\n            \"TransactionAmount\": 0,\n            \"Cart\": {\n                \"IsGift\": false,\n                \"ReturnsAccepted\": true,\n                \"Items\": [\n                    {\n                        \"Type\": 4,\n                        \"Name\": \"Mouse\",\n                        \"Risk\": 0,\n                        \"Sku\": \"100010\",\n                        \"OriginalPrice\": 0,\n                        \"UnitPrice\": 532400,\n                        \"Quantity\": 1,\n                        \"GiftCategory\": 0,\n                        \"Weight\": 0,\n                        \"CartType\": 0\n                    },\n                    {\n                        \"Type\": 5,\n                        \"Name\": \"Windows 11 Professional\",\n                        \"Risk\": 0,\n                        \"Sku\": \"100011\",\n                        \"OriginalPrice\": 0,\n                        \"UnitPrice\": 85515,\n                        \"Quantity\": 2,\n                        \"GiftCategory\": 0,\n                        \"Weight\": 0,\n                        \"CartType\": 0\n                    }\n                ]\n            },\n            \"Travel\": {\n                \"Passengers\": [\n                    {\n                        \"Name\": \"Aline de Souza\",\n                        \"Rating\": 0,\n                        \"PassengerType\": \"Undefined\",\n                        \"TravelLegs\": [\n                            {\n                                \"Destination\": \"CGH\",\n                                \"Origin\": \"SDU\",\n                                \"DepartureDate\": \"2025-10-09T18:30:00\",\n                                \"Boarding\": \"2025-10-09T18:45:00\",\n                                \"Arriving\": \"2025-10-09T20:00:00\"\n                            }\n                        ]\n                    },\n                    {\n                        \"Name\": \"Guilherme Silva\",\n                        \"Rating\": 0,\n                        \"PassengerType\": \"Undefined\",\n                        \"TravelLegs\": [\n                            {\n                                \"Destination\": \"CGH\",\n                                \"Origin\": \"SDU\",\n                                \"DepartureDate\": \"2025-10-09T18:30:00\",\n                                \"Boarding\": \"2025-10-09T18:45:00\",\n                                \"Arriving\": \"2025-10-09T20:00:00\"\n                            }\n                        ]\n                    }\n                ]\n            },\n            \"Shipping\": {\n                \"Addressee\": \"Nome Comprador\",\n                \"Phone\": \"+55 11 5555-1001\",\n                \"Method\": 5,\n                \"Email\": \"nome@email.com.br\",\n                \"WorkPhone\": \"+55 11 5555-1002\",\n                \"Mobile\": \"+55 11 5555-1003\",\n                \"Identity\": \"99988877711\",\n                \"IdentityType\": \"CPF\"\n            },\n            \"CaptureOnLowRisk\": false,\n            \"VoidOnHighRisk\": false,\n            \"FraudAnalysisReasonCode\": 1,\n            \"Provider\": \"ClearSale\",\n            \"IsRetryTransaction\": false\n        },\n        \"IsQrCode\": false,\n        \"Amount\": 45500,\n        \"ReceivedDate\": \"2025-10-20 11:53:18\",\n        \"Status\": 1,\n        \"IsSplitted\": false,\n        \"ReturnMessage\": \"Operation Successful\",\n        \"ReturnCode\": \"4\",\n        \"PaymentId\": \"d0109922-2cd3-4a3f-89fc-4c69230d3438\",\n        \"Type\": \"CreditCard\",\n        \"Currency\": \"BRL\",\n        \"Country\": \"BRA\",\n        \"Links\": [\n            {\n                \"Method\": \"GET\",\n                \"Rel\": \"self\",\n                \"Href\": \"https://apiquerysandbox.cieloecommerce.cielo.com.br/1/sales/d0109922-2cd3-4a3f-89fc-4c69230d3438\"\n            },\n            {\n                \"Method\": \"PUT\",\n                \"Rel\": \"capture\",\n                \"Href\": \"https://apisandbox.cieloecommerce.cielo.com.br/1/sales/d0109922-2cd3-4a3f-89fc-4c69230d3438/capture\"\n            },\n            {\n                \"Method\": \"PUT\",\n                \"Rel\": \"void\",\n                \"Href\": \"https://apisandbox.cieloecommerce.cielo.com.br/1/sales/d0109922-2cd3-4a3f-89fc-4c69230d3438/void\"\n            }\n        ]\n    }\n}"
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
    "explorer-enabled": false,
    "proxy-enabled": true
  },
  "x-readme-fauxas": true
}
```