---
updatedAt: 2026-07-17T12:55:51.000Z
agentTools:
  siteIndex: https://docs.cielo.com.br/llms.txt
  projectIndex: https://docs.cielo.com.br/ecommerce-cielo/llms.txt
---

# Criar pagamento com análise fraude Cybersource

Cria um pagamento de cartão de crédito e envia a transação para o Antifraude (solução Braspag) no provedor Cybersource

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
        `https://apisandbox.cieloecommerce.cielo.com.br/post/1/sales/`
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
        `https://api.cieloecommerce.cielo.com.br//post/1/sales/`
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

> O Antifraude (solução Braspag) está disponível mediante contratação adicional. <a href="https://www.cielo.com.br/e-commerce/" target="_blank">Saiba mais na página de soluções do e-commerce Cielo</a>.

<Callout icon="ℹ️" theme="info">
  Saiba mais sobre essa funcionalidade <a href="https://docs.cielo.com.br/ecommerce-cielo/docs/analise-de-fraude" target="_blank">na documentação</a>.
</Callout>

> ℹ️ Importante: companhias aéreas
>
> * O campo `ServiceTaxAmount` é exclusivo para empresas aéreas;

<br />

### Resposta da criação de pagamento com análise de fraude

A resposta irá trazer os mesmos resultados que uma transação de crédito convencional, mais os parâmetros referentes ao resultado da análise de fraude.

| Propriedade                                             | Descrição                                                                                                                                     | Tipo     |
| ------------------------------------------------------- | --------------------------------------------------------------------------------------------------------------------------------------------- | -------- |
| `Payment.FraudAnalysis.IsRetryTransaction`              | Retentativa de uma análise, e deverá ser enviado com valor igual a "true" quando o código de retorno na primeira tentativa for igual a BP900. | booleano |
| `Payment.FraudAnalysis.Id`                              | Identificação transação no Antifraude                                                                                                         | GUID     |
| `Payment.FraudAnalysis.Status`                          | [Status da transação no Antifraude](https://docs.cielo.com.br/ecommerce-cielo/reference/lista-de-status-do-antifraude) .                      | número   |
| `Payment.FraudAnalysis.StatusDescription`               | Descrição do status do Antifraude.                                                                                                            | texto    |
| `Payment.FraudAnalysis.ReplyData.ProviderTransactionId` | Identificador da transação na Cybersource.                                                                                                    | string   |

# OpenAPI definition

```json
{
  "openapi": "3.1.0",
  "info": {
    "title": "pagamentos-com-análise-de-fraude-cybersource",
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
        "summary": "Criar pagamento com análise fraude Cybersource",
        "description": "Cria um pagamento de cartão de crédito e envia a transação para o Antifraude (solução Braspag) no provedor Cybersource",
        "operationId": "af-cybersource",
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
                        "description": "E-mail do comprador.  Tamanho: 100."
                      },
                      "Birthdate": {
                        "type": "string",
                        "description": "Data de nascimento do comprador <br/> Ex.: 1991-01-10.  Tamanho: 10."
                      },
                      "Phone": {
                        "type": "string",
                        "description": "Número do telefone do comprador <br/> Ex.: 5521976781114. Tamanho: 15."
                      },
                      "BillingAddress": {
                        "properties": {
                          "Street": {
                            "type": "string",
                            "description": "Logradouro do endereço de cobrança.  Tamanho: 54."
                          },
                          "Number": {
                            "type": "string",
                            "description": "Número do endereço de cobrança.  Tamanho: 5."
                          },
                          "Complement": {
                            "type": "string",
                            "description": "Complemento do endereço de cobrança. Tamanho: 14."
                          },
                          "ZipCode": {
                            "type": "string",
                            "description": "Código postal do endereço de cobrança.  Tamanho: 9."
                          },
                          "City": {
                            "type": "string",
                            "description": "Cidade do endereço de cobrança.  Tamanho: 2."
                          },
                          "State": {
                            "type": "string",
                            "description": "Estado do endereço de cobrança.  Tamanho: 2."
                          },
                          "Country": {
                            "type": "string",
                            "description": "País do endereço de cobrança. Mais informações em <a href=\"https://www.iso.org/obp/ui/#search\" target=\"_blank\">ISO 2-Digit Alpha Country Code</a>.<br>  Tamanho: 2."
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
                      },
                      "DeliveryAddress": {
                        "properties": {
                          "Street": {
                            "type": "string",
                            "description": "Logradouro do endereço de entrega.  Tamanho: 54."
                          },
                          "Number": {
                            "type": "string",
                            "description": "Número do endereço de entrega.  Tamanho: 5."
                          },
                          "Complement": {
                            "type": "string",
                            "description": "Complemento do endereço de entrega. Tamanho: 14."
                          },
                          "ZipCode": {
                            "type": "string",
                            "description": "Código postal do endereço de entrega.  Tamanho: 9."
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
                            "description": "País do endereço de entrega. Mais informações em <a href=\"https://www.iso.org/obp/ui/#search\" target=\"_blank\">ISO 2-Digit Alpha Country Code</a>.<br> Tamanho: 2."
                          },
                          "District": {
                            "type": "string",
                            "description": "Bairro do endereço de entrega. Tamanho: 45."
                          }
                        },
                        "required": [],
                        "type": "object"
                      }
                    },
                    "required": [
                      "Name",
                      "Identity",
                      "Email",
                      "Phone"
                    ],
                    "type": "object"
                  },
                  "Payment": {
                    "properties": {
                      "Provider": {
                        "type": "string",
                        "description": "Define comportamento do meio de pagamento. <br/> Não é obrigatório para crédito. Tamanho: 15."
                      },
                      "Type": {
                        "type": "string",
                        "description": "Tipo do meio de pagamento. <br/> Obs.: Somente o tipo _CreditCard_ funciona com análise de fraude.  Tamanho: 100."
                      },
                      "Amount": {
                        "type": "integer",
                        "description": "Valor da transação financeira em centavos <br/> Ex: 150000 = r$ 1.500,00",
                        "format": "int32"
                      },
                      "Currency": {
                        "type": "string",
                        "description": "Moeda na qual o pagamento será feito <br/> Possíveis valores: BRL / USD / MXN / COP / CLP / ARS / PEN / EUR / PYN / UYU / VEB / VEF / GBP. Tamanho: 3."
                      },
                      "Country": {
                        "type": "string",
                        "description": "País na qual o pagamento será realizado. Tamanho: 3."
                      },
                      "ServiceTaxAmount": {
                        "type": "integer",
                        "description": "Aplicável apenas para empresas aéreas. Montante do valor da autorização que deve ser destinado à taxa de serviço. O valor do ` ServiceTaxAmount ` será liquidado integralmente junto com o valor da primeira parcela. Tamanho: 15.",
                        "format": "int32"
                      },
                      "Installments": {
                        "type": "integer",
                        "description": "Número de parcelas. Tamanho: 2.",
                        "format": "int32"
                      },
                      "Interest": {
                        "type": "string",
                        "description": "Tipo de parcelamento <br/> Possíveis valores: ByMerchant (parcelado loja) <br/> ByIssuer (parcelado emissor). Tamanho: 10."
                      },
                      "Capture": {
                        "type": "boolean",
                        "description": "Indica se a autorização deverá ser com captura automática <br/> Possíveis valores: true / false (default)"
                      },
                      "Authenticate": {
                        "type": "boolean",
                        "description": "Indica se a transação deve ser autenticada junto ao emissor<br/> Possíveis valores: true / false (default)"
                      },
                      "SoftDescriptor": {
                        "type": "string",
                        "description": "Texto que será impresso na fatura do portador <br/> Obs.: O valor deste campo tem que ser claro e fácil de identificar pelo portador o estabelecimento onde foi realizada a compra, pois é um dos principais ofensores para chargeback.  Tamanho: 13."
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
                          "Brand": {
                            "type": "string",
                            "description": "Bandeira do cartão de crédito.  Tamanho: 10."
                          },
                          "SaveCard": {
                            "type": "boolean",
                            "description": "Booleano que identifica se o cartão será salvo para gerar o token (CardToken) <br/> Possíveis valores: true / false (default)."
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
                          "Sequence": {
                            "type": "string",
                            "description": "Tipo de fluxo da análise de fraude <br/> Possíveis valores: AnalyseFirst / AuthorizeFirst. Tamanho: 14."
                          },
                          "SequenceCriteria": {
                            "type": "string",
                            "description": "Critério do fluxo da análise de fraude <br/> Possíveis valores: OnSuccess / Always. Tamanho: 9."
                          },
                          "Provider": {
                            "type": "string",
                            "description": "Provedor de AntiFraude <br/> Possíveis valores: Cybersource. Tamanho: 10."
                          },
                          "CaptureOnLowRisk": {
                            "type": "boolean",
                            "description": "Indica se a transação após a análise de fraude será capturada <br/> Possíveis valores: true / false (default) <br/> Obs.: Quando enviado igual a _true_ e o retorno da análise de fraude for de baixo risco (Accept) a transação anteriormente autorizada será capturada <br/> Obs2.: Quando enviado igual a _true_ e o retorno da análise de fraude for revisão (Review) a transação ficará autorizada. A mesma será capturada após a Cielo receber o novo status da análise manual e este for de baixo risco (Accept) <br/> Obs.: Para a utilização deste parâmetro, a sequência do fluxo de análise de risco deve ser obrigatoriamente _AuthorizeFirst_"
                          },
                          "VoidOnHighRisk": {
                            "type": "string",
                            "description": "Indica se a transação após a análise de fraude será cancelada <br/> Possíveis valores: true / false (default) <br/> Obs.: Quando enviado igual a _true_ e o retorno da análise de fraude for de alto risco (Reject) a transação anteriormente autorizada será cancelada <br/> Obs2.: Quando enviado igual a _true_ e o retorno da análise de fraude for revisão (Review) a transação ficará autorizada. A mesma será cancelada após a Cielo receber o novo status da análise manual e este for alto risco (Reject) <br/> Obs.: Para a utilização deste parâmetro, a sequência do fluxo de análise de risco deve ser obrigatoriamente _AuthorizeFirst_"
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
                              },
                              "CookiesAccepted": {
                                "type": "boolean",
                                "description": "Identifica se o browser do comprador aceita cookies <br/> Possíveis valores: true / false (default)"
                              },
                              "Email": {
                                "type": "string",
                                "description": "E-mail registrado no browser do comprador. Pode diferenciar do e-mail de cadastro na loja(`Customer.Email`). Tamanho: 100."
                              },
                              "HostName": {
                                "type": "string",
                                "description": "Nome do host informado pelo browser do comprador e identificado através do cabeçalho HTTP. Tamanho: 60."
                              },
                              "IpAddress": {
                                "type": "string",
                                "description": "Endereço de IP do comprador. Formato IPv4 ou IPv6. Tamanho: 45."
                              },
                              "Type": {
                                "type": "string",
                                "description": "Nome do browser utilizado pelo comprador e identificado através do cabeçalho HTTP <br/> Ex.: Google Chrome, Mozilla Firefox, Safari, etc. Tamanho: 40."
                              }
                            },
                            "required": [
                              "BrowserFingerprint",
                              "CookiesAccepted"
                            ],
                            "type": "object"
                          },
                          "Cart": {
                            "properties": {
                              "IsGift": {
                                "type": "boolean",
                                "description": "Indica se o pedido realizado pelo comprador é para presente"
                              },
                              "ReturnsAccepted": {
                                "type": "boolean",
                                "description": "Indica se o pedido realizado pelo comprador pode ser devolvido a loja <br/> Possíveis valores: true / false (default)."
                              },
                              "Items": {
                                "properties": {
                                  "GiftCategory": {
                                    "type": "string",
                                    "description": "Identifica que avaliará os endereços de cobrança e entrega para diferentes cidades, estados ou países <br/> <a href=\"https://docs.cielo.com.br/gateway/reference/lista-de-valores-paymentfraudanalysiscartitemsngiftcategory\" target=\"_blank\">Lista de Valores - Payment.FraudAnalysis.Cart.Items[n].GiftCategory</a>.<br>Tamanho: 9."
                                  },
                                  "HostHedge": {
                                    "type": "string",
                                    "description": "Nível de importância dos endereços de IP e e-mail do comprador na análise de fraude <br/> <a href=\"https://docs.cielo.com.br/risco/reference/tabela-12-cartitemnhosthedge\" target=\"_blank\">Tabela 12 - CartItem[n].HostHedge</a>.<br>Tamanho: 6."
                                  },
                                  "NonSensicalHedge": {
                                    "type": "string",
                                    "description": "Nível de importância das verificações sobre os dados do comprador sem sentido na análise de fraude <br/><a href=\"https://docs.cielo.com.br/risco/reference/tabela-13-cartitemnnonsensicalhedge\" target=\"_blank\">Tabela 13 - CartItem[n].NonSensicalHedge</a>.<br>Tamanho: 6."
                                  },
                                  "ObscenitiesHedge": {
                                    "type": "string",
                                    "description": "Nível de importância das verificações sobre os dados do comprador com obscenidade na análise de fraude <br/><a href=\"https://docs.cielo.com.br/risco/reference/tabela-14-cartitemnobscenitieshedge\" target=\"_blank\">Tabela 14 - CartItem[n].ObscenitiesHedge</a>.<br>Tamanho: 6."
                                  },
                                  "PhoneHedge": {
                                    "type": "string",
                                    "description": "Nível de importância das verificações sobre os números de telefones do comprador na análise de fraude <br/><a href=\"https://docs.cielo.com.br/risco/reference/tabela-16-cartitemnphonehedge\" target=\"_blank\">Tabela 16 - CartItem[n].PhoneHedge</a>.<br>Tamanho: 6."
                                  },
                                  "Name": {
                                    "type": "string",
                                    "description": "Nome do Produto. Tamanho: 255."
                                  },
                                  "Quantity": {
                                    "type": "integer",
                                    "description": "Quantidade do produto. Tamanho: 15.",
                                    "format": "int32"
                                  },
                                  "Sku": {
                                    "type": "string",
                                    "description": "SKU (Stock Keeping Unit - Unidade de Controle de Estoque) do produto. Tamanho: 255."
                                  },
                                  "UnitPrice": {
                                    "type": "integer",
                                    "description": "Preço unitário do produto <br/> Ex: 10950 = r$ 109,50. Tamanho: 15.",
                                    "format": "int32"
                                  },
                                  "Risk": {
                                    "type": "string",
                                    "description": "Nível de risco do produto associado a quantidade de chargebacks <br/><a href=\"https://docs.cielo.com.br/risco/reference/tabela-10-cartitemnrisk\" target=\"_blank\">Tabela 10 - CartItem[n].Risk</a>.<br>Tamanho: 6."
                                  },
                                  "TimeHedge": {
                                    "type": "string",
                                    "description": "Nível de importância da hora do dia na análise de fraude que o comprador realizou o pedido <br/><a href=\"https://docs.cielo.com.br/risco/reference/tabela-15-cartitemntimehedge\" target=\"_blank\">Tabela 15 - CartItem[n].TimeHedge</a>.<br>Tamanho: 6."
                                  },
                                  "Type": {
                                    "type": "string",
                                    "description": "Categoria do produto <br/><a href=\"https://docs.cielo.com.br/risco/reference/tabela-36-cartitemntypee\" target=\"_blank\">Tabela 36 - CartItem[n].Type</a>.<br>Tamanho: 19."
                                  },
                                  "VelocityHedge": {
                                    "type": "string",
                                    "description": "Nível de importância da frequência de compra do comprador na análise de fraude dentros dos 15 minutos anteriores <br/><a href=\"https://docs.cielo.com.br/risco/reference/tabela-17-cartitemnvelocityhedge\" target=\"_blank\">Tabela 17 - CartItem[n].VelocityHedge</a>.<br>Tamanho: 6."
                                  }
                                },
                                "required": [
                                  "Name",
                                  "Quantity"
                                ],
                                "type": "object"
                              }
                            },
                            "required": [],
                            "type": "object"
                          },
                          "MerchantDefinedFields": {
                            "properties": {
                              "Id": {
                                "type": "integer",
                                "description": "ID das informações adicionais a serem enviadas <br/> <a href=\"https://docs.cielo.com.br/risco/reference/tabela-34-merchantdefineddata-cybersource\" target=\"_blank\">Tabela 34 - Payment.FraudAnalysis.MerchantDefinedFields (Cybersource)</a>.<br>Tamanho: 2.",
                                "format": "int32"
                              },
                              "Value": {
                                "type": "string",
                                "description": "Valor das informações adicionais a serem enviadas <br/> <a href=\"https://docs.cielo.com.br/risco/reference/tabela-34-merchantdefineddata-cybersource\" target=\"_blank\">Tabela 34 - Payment.FraudAnalysis.MerchantDefinedFields (Cybersource)</a>.<br>Tamanho: 255."
                              }
                            },
                            "required": [
                              "Id",
                              "Value"
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
                                "description": "Meio de entrega do pedido <br/> <a href=\"https://docs.cielo.com.br/risco/reference/tabela-39-paymentfraudanalysisshippingmethod\" target=\"_blank\">Tabela 39 - Payment.FraudAnalysis.Shipping.Method</a>. <br>Tamanho: 8."
                              },
                              "Phone": {
                                "type": "string",
                                "description": "Número do telefone do responsável a receber o produto no endereço de entrega <br/> Ex.: 552121114700. Tamanho: 15."
                              }
                            },
                            "required": [],
                            "type": "object"
                          },
                          "Travel": {
                            "properties": {
                              "JourneyType": {
                                "type": "string",
                                "description": "Tipo de viagem <br/> <a href=\"https://docs.cielo.com.br/risco/reference/tabela-7-airlinejourneytype\" target=\"_blank\">Tabela 7 - Airline.JourneyType</a>.<br>Tamanho: 32."
                              },
                              "DepartureTime": {
                                "type": "string",
                                "description": "Data e hora de partida <br/> Ex.: 2018-03-31 19:16:38.",
                                "format": "date"
                              },
                              "Passengers": {
                                "properties": {
                                  "Name": {
                                    "type": "string",
                                    "description": "Nome completo do passageiro. Tamanho: 120."
                                  },
                                  "Identity": {
                                    "type": "string",
                                    "description": "Número do documento do passageiro.  Tamanho: 32."
                                  },
                                  "Status": {
                                    "type": "string",
                                    "description": "Classificação da empresa aérea <br/><a href=\"https://docs.cielo.com.br/risco/reference/tabela-9-airlinepassengersnstatus\" target=\"_blank\">Tabela 9 - Airline.Passengers[n].Status</a>.<br>Tamanho: 15."
                                  },
                                  "Rating": {
                                    "type": "string",
                                    "description": "Tipo do passageiro <br/> <a href=\"https://docs.cielo.com.br/gateway/reference/lista-de-valores-paymentfraudanalysistravelpassengersnrating\" target=\"_blank\">Lista de Valores - Payment.FraudAnalysis.Travel.Passengers[n].Rating</a>.<br>Tamanho: 13."
                                  },
                                  "Email": {
                                    "type": "string",
                                    "description": "E-mail do passageiro. Tamanho: 255."
                                  },
                                  "Phone": {
                                    "type": "string",
                                    "description": "Telefone do passageiro <br/> Ex.: 552121114700. Tamanho: 15."
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
                          "Provider",
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
                      "Name": "Nome do Comprador",
                      "Identity": "12345678910",
                      "IdentityType": "CPF",
                      "Email": "comprador@provedor.com.br",
                      "Birthdate": "1991-01-02",
                      "Phone": "5521976781114",
                      "BillingAddress": {
                        "Street": "Alameda Xingu",
                        "Number": "512",
                        "Complement": "27 andar",
                        "ZipCode": "12345987",
                        "City": "São Paulo",
                        "State": "SP",
                        "Country": "BR",
                        "District": "Alphaville"
                      },
                      "DeliveryAddress": {
                        "Street": "Alameda Xingu",
                        "Number": "512",
                        "Complement": "27 andar",
                        "ZipCode": "12345987",
                        "City": "São Paulo",
                        "State": "SP",
                        "Country": "BR",
                        "District": "Alphaville"
                      }
                    },
                    "Payment": {
                      "Type": "CreditCard",
                      "Amount": 10000,
                      "Currency": "BRL",
                      "Country": "BRA",
                      "ServiceTaxAmount": 0,
                      "Installments": 1,
                      "Interest": "ByMerchant",
                      "Capture": false,
                      "Authenticate": false,
                      "SoftDescriptor": "Mensagem",
                      "CreditCard": {
                        "CardNumber": "4551870000000181",
                        "Holder": "Nome do Portador",
                        "ExpirationDate": "12/2021",
                        "SecurityCode": "123",
                        "Brand": "Visa",
                        "SaveCard": "false"
                      },
                      "FraudAnalysis": {
                        "Provider": "Cybersource",
                        "Sequence": "AuthorizeFirst",
                        "SequenceCriteria": "OnSuccess",
                        "CaptureOnLowRisk": false,
                        "VoidOnHighRisk": false,
                        "TotalOrderAmount": 10000,
                        "Browser": {
                          "BrowserFingerprint": "074c1ee676ed4998ab66491013c565e2",
                          "CookiesAccepted": false,
                          "Email": "comprador@test.com.br",
                          "HostName": "Teste",
                          "IpAddress": "127.0.0.1",
                          "Type": "Chrome"
                        },
                        "Cart": {
                          "IsGift": false,
                          "ReturnsAccepted": true,
                          "Items": [
                            {
                              "GiftCategory": "Undefined",
                              "HostHedge": "Off",
                              "NonSensicalHedge": "Off",
                              "ObscenitiesHedge": "Off",
                              "PhoneHedge": "Off",
                              "Name": "ItemTeste1",
                              "Quantity": 1,
                              "Sku": "20170511",
                              "UnitPrice": 10000,
                              "Risk": "High",
                              "TimeHedge": "Normal",
                              "Type": "AdultContent",
                              "VelocityHedge": "High"
                            },
                            {
                              "GiftCategory": "Undefined",
                              "HostHedge": "Off",
                              "NonSensicalHedge": "Off",
                              "ObscenitiesHedge": "Off",
                              "PhoneHedge": "Off",
                              "Name": "ItemTeste2",
                              "Quantity": 1,
                              "Sku": "20170512",
                              "UnitPrice": 10000,
                              "Risk": "High",
                              "TimeHedge": "Normal",
                              "Type": "AdultContent",
                              "VelocityHedge": "High"
                            }
                          ]
                        },
                        "MerchantDefinedFields": [
                          {
                            "Id": 2,
                            "Value": "100"
                          },
                          {
                            "Id": 4,
                            "Value": "Web"
                          },
                          {
                            "Id": 9,
                            "Value": "SIM"
                          }
                        ],
                        "Shipping": {
                          "Addressee": "João das Couves",
                          "Method": "LowCost",
                          "Phone": "551121840540"
                        },
                        "Travel": {
                          "JourneyType": "OneWayTrip",
                          "DepartureTime": "2018-01-09 18:00",
                          "Passengers": [
                            {
                              "Name": "Passenger Test",
                              "Identity": "212424808",
                              "Status": "Gold",
                              "Rating": "Adult",
                              "Email": "email@mail.com",
                              "Phone": "5564991681074",
                              "TravelLegs": [
                                {
                                  "Origin": "AMS",
                                  "Destination": "GIG"
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
          "200": {
            "description": "200",
            "content": {
              "application/json": {
                "examples": {
                  "Result": {
                    "value": "{\n    \"MerchantOrderId\":\"Loja123456\",\n    \"Customer\":{  \n        \"Name\":\"Nome do Comprador\",\n        \"Identity\":\"12345678910\",\n        \"IdentityType\":\"CPF\",\n        \"Email\":\"comprador@provedor.com.br\",\n        \"Birthdate\":\"1991-01-02\",\n        \"Phone\": \"5521976781114\",\n        \"BillingAddress\":{  \n            \"Street\":\"Alameda Xingu\",\n            \"Number\":\"512\",\n            \"Complement\":\"27 andar\",\n            \"ZipCode\":\"12345987\",\n            \"City\":\"São Paulo\",\n            \"State\":\"SP\",\n            \"Country\":\"BR\",\n            \"District\":\"Alphaville\"\n        },\n        \"DeliveryAddress\":{  \n            \"Street\":\"Alameda Xingu\",\n            \"Number\":\"512\",\n            \"Complement\":\"27 andar\",\n            \"ZipCode\":\"12345987\",\n            \"City\":\"São Paulo\",\n            \"State\":\"SP\",\n            \"Country\":\"BR\",\n            \"District\":\"Alphaville\"\n        }\n    },\n    \"Payment\": {\n        \"Type\":\"CreditCard\",\n        \"Amount\":10000,\n        \"Currency\":\"BRL\",\n        \"Country\":\"BRA\",\n        \"ServiceTaxAmount\":0,\n        \"Installments\":1,\n        \"Interest\":\"ByMerchant\",\n        \"Capture\":false,\n        \"Authenticate\":false,\n        \"SoftDescriptor\":\"Mensagem\",\n        \"CreditCard\": {\n            \"CardNumber\":\"455187******0181\",\n            \"Holder\":\"Nome do Portador\",\n            \"ExpirationDate\":\"12/2021\",\n            \"Brand\": \"Visa\",\n            \"SaveCard\": false\n        },\n        \"FraudAnalysis\": {\n            \"Provider\":\"Cybersource\",\n            \"Sequence\": \"AuthorizeFirst\",\n            \"SequenceCriteria\": \"OnSuccess\",\n            \"CaptureOnLowRisk\":false,\n            \"VoidOnHighRisk\":false,\n            \"TotalOrderAmount\":10000,\n            \"Browser\":{  \n                \"BrowserFingerprint\":\"074c1ee676ed4998ab66491013c565e2\",\n                \"CookiesAccepted\":false,\n                \"Email\":\"comprador@test.com.br\",\n                \"HostName\":\"Teste\",\n                \"IpAddress\":\"127.0.0.1\",\n                \"Type\":\"Chrome\"\n            },\n            \n            \"Cart\":{  \n                \"IsGift\":false,\n                \"ReturnsAccepted\":true,\n                \"Items\":[  \n                    {  \n                        \"GiftCategory\":\"Undefined\",\n                        \"HostHedge\":\"Off\",\n                        \"NonSensicalHedge\":\"Off\",\n                        \"ObscenitiesHedge\":\"Off\",\n                        \"PhoneHedge\":\"Off\",\n                        \"Name\":\"ItemTeste1\",\n                        \"Quantity\":1,\n                        \"Sku\":\"20170511\",\n                        \"UnitPrice\":10000,\n                        \"Risk\":\"High\",\n                        \"TimeHedge\":\"Normal\",\n                        \"Type\":\"AdultContent\",\n                        \"VelocityHedge\":\"High\"\n                    },\n                    {  \n                        \"GiftCategory\":\"Undefined\",\n                        \"HostHedge\":\"Off\",\n                        \"NonSensicalHedge\":\"Off\",\n                        \"ObscenitiesHedge\":\"Off\",\n                        \"PhoneHedge\":\"Off\",\n                        \"Name\":\"ItemTeste2\",\n                        \"Quantity\":1,\n                        \"Sku\":\"20170512\",\n                        \"UnitPrice\":10000,\n                        \"Risk\":\"High\",\n                        \"TimeHedge\":\"Normal\",\n                        \"Type\":\"AdultContent\",\n                        \"VelocityHedge\":\"High\"\n                    }\n                ]\n            },\n            \"MerchantDefinedFields\":[  \n                {  \n                    \"Id\":2,\n                    \"Value\":\"100\"\n                },\n                {  \n                    \"Id\":4,\n                    \"Value\":\"Web\"\n                },\n                {  \n                    \"Id\":9,\n                    \"Value\":\"SIM\"\n                }\n            ],\n            \"Shipping\":{  \n                \"Addressee\":\"João das Couves\",\n                \"Method\":\"LowCost\",\n                \"Phone\":\"551121840540\"\n            },\n            \"Travel\":{  \n                \"JourneyType\":\"OneWayTrip\",\n                \"DepartureTime\":\"2018-01-09 18:00\",\n                \"Passengers\":[  \n                    {  \n                        \"Name\":\"Passenger Test\",\n                        \"Identity\":\"212424808\",\n                        \"Status\":\"Gold\",\n                        \"Rating\":\"Adult\",\n                        \"Email\":\"email@mail.com\",\n                        \"Phone\":\"5564991681074\",\n                        \"TravelLegs\":[  \n                            {  \n                                \"Origin\":\"AMS\",\n                                \"Destination\":\"GIG\"\n                            }\n                        ]\n                    }\n                ]\n            },\n            \"Id\": \"0e4d0a3c-e424-4fa5-a573-4eabbd44da42\",\n            \"Status\": 1,\n            \"ReplyData\": {\n                \"AddressInfoCode\": \"COR-BA^MM-BIN\",\n                \"FactorCode\": \"B^D^R^Z\",\n                \"Score\": 42,\n                \"BinCountry\": \"us\",\n                \"CardIssuer\": \"FIA CARD SERVICES, N.A.\",\n                \"CardScheme\": \"VisaCredit\",\n                \"HostSeverity\": 1,\n                \"InternetInfoCode\": \"FREE-EM^RISK-EM\",\n                \"IpRoutingMethod\": \"Undefined\",\n                \"ScoreModelUsed\": \"default_lac\",\n                \"CasePriority\": 3\n            }\n        },\n        \"ProofOfSale\": \"492115\",\n        \"Tid\": \"12345678902606D31001\",\n        \"AuthorizationCode\": \"123456\",\n        \"PaymentId\": \"04096cfb-3f0a-4ece-946c-3b7dc5d38f19\",\n        \"ExtraDataCollection\": [],\n        \"Status\": 1,\n        \"ReturnCode\": \"4\",\n        \"ReturnMessage\": \"Transação autorizada\",\n        \"Links\": [\n            {\n                \"Method\": \"GET\",\n                \"Rel\": \"self\",\n                \"Href\": \"https://apiquerysandbox.cieloecommerce.cielo.com.br/1/sales/{PaymentId}\"\n            },\n            {\n                \"Method\": \"PUT\",\n                \"Rel\": \"capture\",\n                \"Href\": \"https://apisandbox.cieloecommerce.cielo.com.br/1/sales/{PaymentId}/capture\"\n            },\n            {\n                \"Method\": \"PUT\",\n                \"Rel\": \"void\",\n                \"Href\": \"https://apisandbox.cieloecommerce.cielo.com.br/1/sales/{PaymentId}/void\"\n            }\n        ]\n    }\n}"
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
                          "example": "Nome do Comprador"
                        },
                        "Identity": {
                          "type": "string",
                          "example": "12345678910"
                        },
                        "IdentityType": {
                          "type": "string",
                          "example": "CPF"
                        },
                        "Email": {
                          "type": "string",
                          "example": "comprador@provedor.com.br"
                        },
                        "Birthdate": {
                          "type": "string",
                          "example": "1991-01-02"
                        },
                        "Phone": {
                          "type": "string",
                          "example": "5521976781114"
                        },
                        "BillingAddress": {
                          "type": "object",
                          "properties": {
                            "Street": {
                              "type": "string",
                              "example": "Alameda Xingu"
                            },
                            "Number": {
                              "type": "string",
                              "example": "512"
                            },
                            "Complement": {
                              "type": "string",
                              "example": "27 andar"
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
                              "example": "BR"
                            },
                            "District": {
                              "type": "string",
                              "example": "Alphaville"
                            }
                          }
                        },
                        "DeliveryAddress": {
                          "type": "object",
                          "properties": {
                            "Street": {
                              "type": "string",
                              "example": "Alameda Xingu"
                            },
                            "Number": {
                              "type": "string",
                              "example": "512"
                            },
                            "Complement": {
                              "type": "string",
                              "example": "27 andar"
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
                              "example": "BR"
                            },
                            "District": {
                              "type": "string",
                              "example": "Alphaville"
                            }
                          }
                        }
                      }
                    },
                    "Payment": {
                      "type": "object",
                      "properties": {
                        "Type": {
                          "type": "string",
                          "example": "CreditCard"
                        },
                        "Amount": {
                          "type": "integer",
                          "example": 10000,
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
                        "SoftDescriptor": {
                          "type": "string",
                          "example": "Mensagem"
                        },
                        "CreditCard": {
                          "type": "object",
                          "properties": {
                            "CardNumber": {
                              "type": "string",
                              "example": "455187******0181"
                            },
                            "Holder": {
                              "type": "string",
                              "example": "Nome do Portador"
                            },
                            "ExpirationDate": {
                              "type": "string",
                              "example": "12/2021"
                            },
                            "Brand": {
                              "type": "string",
                              "example": "Visa"
                            },
                            "SaveCard": {
                              "type": "boolean",
                              "example": false,
                              "default": true
                            }
                          }
                        },
                        "FraudAnalysis": {
                          "type": "object",
                          "properties": {
                            "Provider": {
                              "type": "string",
                              "example": "Cybersource"
                            },
                            "Sequence": {
                              "type": "string",
                              "example": "AuthorizeFirst"
                            },
                            "SequenceCriteria": {
                              "type": "string",
                              "example": "OnSuccess"
                            },
                            "CaptureOnLowRisk": {
                              "type": "boolean",
                              "example": false,
                              "default": true
                            },
                            "VoidOnHighRisk": {
                              "type": "boolean",
                              "example": false,
                              "default": true
                            },
                            "TotalOrderAmount": {
                              "type": "integer",
                              "example": 10000,
                              "default": 0
                            },
                            "Browser": {
                              "type": "object",
                              "properties": {
                                "BrowserFingerprint": {
                                  "type": "string",
                                  "example": "074c1ee676ed4998ab66491013c565e2"
                                },
                                "CookiesAccepted": {
                                  "type": "boolean",
                                  "example": false,
                                  "default": true
                                },
                                "Email": {
                                  "type": "string",
                                  "example": "comprador@test.com.br"
                                },
                                "HostName": {
                                  "type": "string",
                                  "example": "Teste"
                                },
                                "IpAddress": {
                                  "type": "string",
                                  "example": "127.0.0.1"
                                },
                                "Type": {
                                  "type": "string",
                                  "example": "Chrome"
                                }
                              }
                            },
                            "Cart": {
                              "type": "object",
                              "properties": {
                                "IsGift": {
                                  "type": "boolean",
                                  "example": false,
                                  "default": true
                                },
                                "ReturnsAccepted": {
                                  "type": "boolean",
                                  "example": true,
                                  "default": true
                                },
                                "Items": {
                                  "type": "array",
                                  "items": {
                                    "type": "object",
                                    "properties": {
                                      "GiftCategory": {
                                        "type": "string",
                                        "example": "Undefined"
                                      },
                                      "HostHedge": {
                                        "type": "string",
                                        "example": "Off"
                                      },
                                      "NonSensicalHedge": {
                                        "type": "string",
                                        "example": "Off"
                                      },
                                      "ObscenitiesHedge": {
                                        "type": "string",
                                        "example": "Off"
                                      },
                                      "PhoneHedge": {
                                        "type": "string",
                                        "example": "Off"
                                      },
                                      "Name": {
                                        "type": "string",
                                        "example": "ItemTeste1"
                                      },
                                      "Quantity": {
                                        "type": "integer",
                                        "example": 1,
                                        "default": 0
                                      },
                                      "Sku": {
                                        "type": "string",
                                        "example": "20170511"
                                      },
                                      "UnitPrice": {
                                        "type": "integer",
                                        "example": 10000,
                                        "default": 0
                                      },
                                      "Risk": {
                                        "type": "string",
                                        "example": "High"
                                      },
                                      "TimeHedge": {
                                        "type": "string",
                                        "example": "Normal"
                                      },
                                      "Type": {
                                        "type": "string",
                                        "example": "AdultContent"
                                      },
                                      "VelocityHedge": {
                                        "type": "string",
                                        "example": "High"
                                      }
                                    }
                                  }
                                }
                              }
                            },
                            "MerchantDefinedFields": {
                              "type": "array",
                              "items": {
                                "type": "object",
                                "properties": {
                                  "Id": {
                                    "type": "integer",
                                    "example": 2,
                                    "default": 0
                                  },
                                  "Value": {
                                    "type": "string",
                                    "example": "100"
                                  }
                                }
                              }
                            },
                            "Shipping": {
                              "type": "object",
                              "properties": {
                                "Addressee": {
                                  "type": "string",
                                  "example": "João das Couves"
                                },
                                "Method": {
                                  "type": "string",
                                  "example": "LowCost"
                                },
                                "Phone": {
                                  "type": "string",
                                  "example": "551121840540"
                                }
                              }
                            },
                            "Travel": {
                              "type": "object",
                              "properties": {
                                "JourneyType": {
                                  "type": "string",
                                  "example": "OneWayTrip"
                                },
                                "DepartureTime": {
                                  "type": "string",
                                  "example": "2018-01-09 18:00"
                                },
                                "Passengers": {
                                  "type": "array",
                                  "items": {
                                    "type": "object",
                                    "properties": {
                                      "Name": {
                                        "type": "string",
                                        "example": "Passenger Test"
                                      },
                                      "Identity": {
                                        "type": "string",
                                        "example": "212424808"
                                      },
                                      "Status": {
                                        "type": "string",
                                        "example": "Gold"
                                      },
                                      "Rating": {
                                        "type": "string",
                                        "example": "Adult"
                                      },
                                      "Email": {
                                        "type": "string",
                                        "example": "email@mail.com"
                                      },
                                      "Phone": {
                                        "type": "string",
                                        "example": "5564991681074"
                                      },
                                      "TravelLegs": {
                                        "type": "array",
                                        "items": {
                                          "type": "object",
                                          "properties": {
                                            "Origin": {
                                              "type": "string",
                                              "example": "AMS"
                                            },
                                            "Destination": {
                                              "type": "string",
                                              "example": "GIG"
                                            }
                                          }
                                        }
                                      }
                                    }
                                  }
                                }
                              }
                            },
                            "Id": {
                              "type": "string",
                              "example": "0e4d0a3c-e424-4fa5-a573-4eabbd44da42"
                            },
                            "Status": {
                              "type": "integer",
                              "example": 1,
                              "default": 0
                            },
                            "ReplyData": {
                              "type": "object",
                              "properties": {
                                "AddressInfoCode": {
                                  "type": "string",
                                  "example": "COR-BA^MM-BIN"
                                },
                                "FactorCode": {
                                  "type": "string",
                                  "example": "B^D^R^Z"
                                },
                                "Score": {
                                  "type": "integer",
                                  "example": 42,
                                  "default": 0
                                },
                                "BinCountry": {
                                  "type": "string",
                                  "example": "us"
                                },
                                "CardIssuer": {
                                  "type": "string",
                                  "example": "FIA CARD SERVICES, N.A."
                                },
                                "CardScheme": {
                                  "type": "string",
                                  "example": "VisaCredit"
                                },
                                "HostSeverity": {
                                  "type": "integer",
                                  "example": 1,
                                  "default": 0
                                },
                                "InternetInfoCode": {
                                  "type": "string",
                                  "example": "FREE-EM^RISK-EM"
                                },
                                "IpRoutingMethod": {
                                  "type": "string",
                                  "example": "Undefined"
                                },
                                "ScoreModelUsed": {
                                  "type": "string",
                                  "example": "default_lac"
                                },
                                "CasePriority": {
                                  "type": "integer",
                                  "example": 3,
                                  "default": 0
                                }
                              }
                            }
                          }
                        },
                        "ProofOfSale": {
                          "type": "string",
                          "example": "492115"
                        },
                        "Tid": {
                          "type": "string",
                          "example": "12345678902606D31001"
                        },
                        "AuthorizationCode": {
                          "type": "string",
                          "example": "123456"
                        },
                        "PaymentId": {
                          "type": "string",
                          "example": "04096cfb-3f0a-4ece-946c-3b7dc5d38f19"
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
                        "ReturnCode": {
                          "type": "string",
                          "example": "4"
                        },
                        "ReturnMessage": {
                          "type": "string",
                          "example": "Transação autorizada"
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
    "explorer-enabled": false,
    "proxy-enabled": true
  },
  "x-readme-fauxas": true
}
```