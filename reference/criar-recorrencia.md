---
updatedAt: 2026-10-20T18:39:31.000Z
agentTools:
  siteIndex: https://docs.cielo.com.br/llms.txt
  projectIndex: https://docs.cielo.com.br/ecommerce-cielo/llms.txt
---

# Criar pagamento recorrente

Cria um pagamento recorrente de cartão de crédito na modalidade Recorrência Programada.

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

  Saiba mais sobre essa funcionalidade <a href="https://docs.cielo.com.br/ecommerce-cielo/docs/recorrencia#recorr%C3%AAncia-programada" target="_blank">na documentação</a>.

  Para recorrência programada, envie `AuthorizeNow` como _true_.
</Callout>

> ℹ️ CNPJs alfanuméricos serão implementados pela Receita Federal em julho de 2026
>
> Essa mudança afeta apenas novas inscrições, **não havendo mudanças em CNPJs existentes**.
>
> O CNPJ alfanumérico **já está sendo suportado pela Cielo**, sem mudanças na sua integração.
>
> Recomendamos verificar a necessidade de possíveis ajustes nos sistemas próprios de checkout de sua loja.

**Orientações para criar transação recorrente em sandbox**:

* O cartão precisa ser final 0, 1 ou 4;
* O cartão precisa ser válido no *mod10* (Algoritmo de Luhn), uma vez que a transação recorrente armazena o cartão de forma tokenizada;
* Os campos `IssuerTransactionId` e `TransactionLinkId` só são retornados com o provider `Simulado` e cenário de transação autorizada.

> **Identificadores de bandeira:** na recorrência programada, os campos `IssuerTransactionId` e `TransactionLinkId` são enviados automaticamente nas transações seguintes. Saiba mais em [Identificadores de bandeira](https://docs.cielo.com.br/ecommerce-cielo/docs/identificadores-de-bandeira).

> ⚠️ Identificação de transações oriundas de link de pagamento para cartões da bandeira Elo
>
> A partir de 17 de outubro de 2025 será obrigatório identificar transações oriundas de link de pagamento para cartões da bandeira Elo. Envie o parâmetro `Payment.SolutionType` = "ExternalLinkPay".

<br />

### Resposta da transação de cartão de crédito recorrente

A tabela a seguir apresenta os principais parâmetros que podem ser retornados pela API na criação de um pagamento com cartão de crédito com recorrência. A resposta também irá conter os dados informados na criação do pagamento recorrente.

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
        `Payment.CreditCard.PaymentAccountReference`
      </td>

      <td>
        O PAR (Payment Account Reference) é o número que associa diferentes tokens a um mesmo cartão. Será retornado pelas bandeiras Master e Visa e repassado para os clientes do e-commerce Cielo. Caso a bandeira não envie a informação, o campo não será retornado.
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
        `RecurrentPaymentId`
      </td>

      <td>
        Campo Identificador da próxima recorrência.
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
        `NextRecurrency`
      </td>

      <td>
        Data da próxima recorrência.
      </td>

      <td>
        string
      </td>

      <td>
        7
      </td>
    </tr>

    <tr>
      <td>
        `EndDate`
      </td>

      <td>
        Data de término da recorrência.
      </td>

      <td>
        string
      </td>

      <td>
        7
      </td>
    </tr>

    <tr>
      <td>
        `Interval`
      </td>

      <td>
        Intervalo entre as recorrências.
      </td>

      <td>
        integer
      </td>

      <td>
        10
      </td>
    </tr>

    <tr>
      <td>
        `AuthorizeNow`
      </td>

      <td>
        Define se a primeira recorrência já irá ser autorizada ou não.<br />Caso deseje autorizar uma recorrência posteriormente, veja como <a href="https://docs.cielo.com.br/ecommerce-cielo/reference/agendar-recorr%C3%AAncia" target="_blank">Agendar uma recorrência</a>.
      </td>

      <td>
        boolean
      </td>

      <td>
        ***
      </td>
    </tr>

    <tr>
      <td>
        `CardBrandStatus`
      </td>

      <td>
        Retorno de status da conta Mastercard

        - VALID: Cartão Valido ou sem atualizações na base;
        - UNKNOWN: Cartão não está disponível na ABU;
        - NON_PARTICIPATING: Cartão não está disponível na ABU;
        - ACCOUNT_CLOSED: Cartão está encerrado;
        - UPDATE: Atualização de plástico ou validade;
        - EXPIRY: Atualização da validade;
        - ERROR: Houve algum erro na atualização (ex: timeout).<br />Saiba mais na <a href="https://docs.cielo.com.br/ecommerce-cielo/docs/automatic-billing-updater-abu" target="_blank">documentação</a>
      </td>

      <td>
        string
      </td>

      <td>
        -
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

### Campos retornados pelo Renova Fácil

Caso a loja tenha o Renova Fácil ou o ABU habilitado, e exista um novo cartão disponível, os dados atualizados serão retornados no nó `NewCard` da resposta.

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
        `NewCard.CardNumber`
      </td>

      <td>
        Novo número do cartão do comprador.
      </td>

      <td>
        string
      </td>

      <td>
        16
      </td>
    </tr>

    <tr>
      <td>
        `NewCard.ExpirationDate`
      </td>

      <td>
        Nova data de validade do cartão.
      </td>

      <td>
        string
      </td>

      <td>
        7
      </td>
    </tr>

    <tr>
      <td>
        `NewCard.Brand`
      </td>

      <td>
        Bandeira do cartão.
      </td>

      <td>
        string
      </td>

      <td>
        10
      </td>
    </tr>

    <tr>
      <td>
        `NewCard.SaveCard`
      </td>

      <td>
        Identifica se o cartão gerou `Cardtoken` durante a transação. Saiba mais sobre <a href="https://docs.cielo.com.br/ecommerce-cielo/docs/tokenizando-cartoes" target="_blank">Tokenização</a>
      </td>

      <td>
        booleano
      </td>

      <td>
        ***
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
    "title": "recorrência",
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
        "summary": "Criar pagamento recorrente",
        "description": "Cria um pagamento recorrente de cartão de crédito na modalidade Recorrência Programada.",
        "operationId": "criar-recorrencia",
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
            "description": "Identificador do Request, utilizado quando o lojista usa diferentes servidores para cada GET/POST/PUT",
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
                    "description": "Número de identificação do pedido. *Atenção: Os caracteres permitidos são apenas a-z, A-Z, 0-9. Não são permitidos caracteres especiais e espaços em branco.*. Tamanho: 20."
                  },
                  "Customer": {
                    "properties": {
                      "Name": {
                        "type": "string",
                        "description": "Nome do Comprador. Tamanho: 255.<br>_Atenção: Os caracteres permitidos são apenas a-z, A-Z. Não são permitidos caracteres especiais e números._"
                      },
                      "Email": {
                        "type": "string",
                        "description": "Email do Comprador. Tamanho: 255."
                      },
                      "Birthdate": {
                        "type": "string",
                        "description": "Data de nascimento do comprador (AAAA/MM/DD). Tamanho: 10.",
                        "format": "date"
                      },
                      "IdentityType": {
                        "type": "string",
                        "description": "Tipo de documento de identificação do comprador (CPF ou CNPJ).  Tamanho: 255."
                      },
                      "Identity": {
                        "type": "string",
                        "description": "Número do CPF ou CNPJ do comprador. Tamanho: 14.<br>**Permite envio de CNPJs alfanuméricos.**"
                      },
                      "Address": {
                        "properties": {
                          "Street": {
                            "type": "string",
                            "description": "Endereço do Comprador. Tamanho: 255."
                          },
                          "Number": {
                            "type": "string",
                            "description": "Número do endereço do Comprador. Tamanho: 15."
                          },
                          "Complement": {
                            "type": "string",
                            "description": "Complemento do endereço do Comprador. Tamanho: 50."
                          },
                          "ZipCode": {
                            "type": "string",
                            "description": "CEP do endereço do Comprador. Tamanho: 9."
                          },
                          "City": {
                            "type": "string",
                            "description": "Cidade do endereço do Comprador. Tamanho: 50."
                          },
                          "State": {
                            "type": "string",
                            "description": "Estado do endereço do Comprador. Tamanho: 2."
                          },
                          "Country": {
                            "type": "string",
                            "description": "Pais do endereço do Comprador. Tamanho: 35."
                          },
                          "District": {
                            "type": "string",
                            "description": "Bairro do Comprador. Tamanho: 50."
                          }
                        },
                        "required": [],
                        "type": "object"
                      },
                      "DeliveryAddress": {
                        "properties": {
                          "Street": {
                            "type": "string",
                            "description": "Endereço do Comprador. Tamanho: 255."
                          },
                          "Number": {
                            "type": "string",
                            "description": "Número do endereço do Comprador. Tamanho: 15."
                          },
                          "Complement": {
                            "type": "string",
                            "description": "Complemento do endereço do Comprador. Tamanho: 50."
                          },
                          "ZipCode": {
                            "type": "string",
                            "description": "CEP do endereço do Comprador. Tamanho: 9."
                          },
                          "City": {
                            "type": "string",
                            "description": "Cidade do endereço do Comprador. Tamanho: 50."
                          },
                          "State": {
                            "type": "string",
                            "description": "Estado do endereço do Comprador. Tamanho: 2."
                          },
                          "Country": {
                            "type": "string",
                            "description": "Pais do endereço do Comprador. Tamanho: 35."
                          },
                          "District": {
                            "type": "string",
                            "description": "Bairro do Comprador. Tamanho: 50."
                          }
                        },
                        "required": [],
                        "type": "object"
                      }
                    },
                    "required": [
                      "Name"
                    ],
                    "type": "object"
                  },
                  "Payment": {
                    "properties": {
                      "Type": {
                        "type": "string",
                        "description": "Tipo do meio de pagamento. Para recorrência só é permitido cartão de crédito (\"CreditCard\").",
                        "default": "CreditCard"
                      },
                      "Amount": {
                        "type": "integer",
                        "description": "Valor do Pedido (ser enviado em centavos). Tamanho: 15.",
                        "format": "int32"
                      },
                      "Installments": {
                        "type": "integer",
                        "description": "Número de parcelas. Como se trata de uma recorrência, o número de parcelas será 1. Tamanho: 2.",
                        "format": "int32"
                      },
                      "Capture": {
                        "type": "boolean",
                        "description": "Booleano que identifica se a autorização deve ser com **captura automática (\"true\")** ou **captura posterior (\"false\").**<br>Caso não seja enviado, será considerado como *false*. <br> O parâmetro `Payment.Capture` determina apenas o comportamento da primeira transação da recorrência programada; as transações subsequentes serão capturadas automaticamente."
                      },
                      "SoftDescriptor": {
                        "type": "string",
                        "description": "Texto que será impresso na fatura bancaria do portador - Disponivel apenas para VISA/MASTER - não permite caracteres especiais. Tamanho: 13."
                      },
                      "CreditCard": {
                        "properties": {
                          "CardNumber": {
                            "type": "string",
                            "description": "Número do Cartão do Comprador. Tamanho: 19."
                          },
                          "Holder": {
                            "type": "string",
                            "description": "Nome do Comprador impresso no cartão. Tamanho: 25."
                          },
                          "ExpirationDate": {
                            "type": "string",
                            "description": "Data de validade impresso no cartão. Tamanho: 7.<br>Ex.: MM/AAAA"
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
                          "SecurityCode"
                        ],
                        "type": "object"
                      },
                      "RecurrentPayment": {
                        "properties": {
                          "Interval": {
                            "type": "string",
                            "description": "Intervalo da recorrência: <br>Monthly (mensal, é o padrão) <br>Bimonthly (bimestral) <br>Quarterly (trimestral) <br>SemiAnnual (semestral) <br>Annual (anual). <br>Tamanho: 10."
                          },
                          "AuthorizeNow": {
                            "type": "string",
                            "description": "Booleano para saber se a primeira recorrência já vai ser autorizada ou não. ⚠️**Para recorrência programada, envie `AuthorizeNow` = true.**."
                          },
                          "EndDate": {
                            "type": "string",
                            "description": "Data para término da cobrança recorrente. Tamanho: 10. Formato: 2030-12-31 (YYYY/MM/DD). Tamanho: 7.",
                            "format": "date"
                          }
                        },
                        "required": [
                          "AuthorizeNow"
                        ],
                        "type": "object"
                      },
                      "SolutionType": {
                        "type": "string",
                        "description": "Origem do pagamento. **Obrigatório para transação de cartão da bandeira Elo oriunda de link de pagamento**. <br>Enviar como *\"ExternalLinkPay\"*. <br>Tamanho: 15."
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
                "Recorrência Programada": {
                  "value": {
                    "MerchantOrderId": "Loja123456",
                    "Customer": {
                      "Name": "Aline de Souza",
                      "Email": "linedesouza@email.com",
                      "Birthdate": "1990-01-01",
                      "IdentityType": "CPF",
                      "Identity": "12345678909",
                      "Address": {
                        "Street": "Rua das Rosas",
                        "Number": "123",
                        "Complement": "apartamento 101",
                        "ZipCode": "12345987",
                        "City": "São Paulo",
                        "State": "SP",
                        "Country": "BRA",
                        "District": "Jardim das Flores"
                      },
                      "DeliveryAddress": {
                        "Street": "Rua das Rosas",
                        "Number": "123",
                        "Complement": "apartamento 101",
                        "ZipCode": "12345987",
                        "City": "São Paulo",
                        "State": "SP",
                        "Country": "BRA",
                        "District": "Jardim das Flores"
                      }
                    },
                    "Payment": {
                      "Type": "CreditCard",
                      "Amount": 1500,
                      "Installments": 1,
                      "SoftDescriptor": "123456789ABCD",
                      "Capture": false,
                      "CreditCard": {
                        "CardNumber": "4091688625337641",
                        "Holder": "Nome do Portador",
                        "ExpirationDate": "12/2035",
                        "SecurityCode": "333",
                        "SaveCard": "false",
                        "Brand": "Visa"
                      },
                      "RecurrentPayment": {
                        "AuthorizeNow": "true",
                        "EndDate": "2030-12-31",
                        "Interval": "Monthly"
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
                  "Recorrência Programada": {
                    "value": "{\n    \"MerchantOrderId\": \"Loja123456\",\n    \"Customer\": {\n        \"Name\": \"Aline de Souza\",\n        \"Identity\": \"12345678909\",\n        \"IdentityType\": \"CPF\",\n        \"Email\": \"linedesouza@email.com\",\n        \"Birthdate\": \"1990-01-01\",\n        \"Address\": {\n            \"Street\": \"Rua das Rosas\",\n            \"Number\": \"123\",\n            \"Complement\": \"apartamento 101\",\n            \"ZipCode\": \"12345987\",\n            \"City\": \"São Paulo\",\n            \"State\": \"SP\",\n            \"Country\": \"BRA\",\n            \"District\": \"Jardim das Flores\",\n            \"AddressType\": 0\n        },\n        \"DeliveryAddress\": {\n            \"Street\": \"Rua das Rosas\",\n            \"Number\": \"123\",\n            \"Complement\": \"apartamento 101\",\n            \"ZipCode\": \"12345987\",\n            \"City\": \"São Paulo\",\n            \"State\": \"SP\",\n            \"Country\": \"BRA\",\n            \"District\": \"Jardim das Flores\",\n            \"AddressType\": 0\n        }\n    },\n    \"Payment\": {\n        \"ServiceTaxAmount\": 0,\n        \"Installments\": 1,\n        \"Interest\": 0,\n        \"Capture\": false,\n        \"Authenticate\": false,\n        \"Recurrent\": false,\n        \"CreditCard\": {\n            \"CardNumber\": \"409168******7641\",\n            \"Holder\": \"Nome do Portador\",\n            \"ExpirationDate\": \"12/2035\",\n            \"SaveCard\": false,\n            \"Brand\": \"Visa\",\n            \"PaymentAccountReference\": \"D3XUS15XYY0GB4AMUI1EYDG4SA1MV\"\n        },\n        \"Tid\": \"0724122149606\",\n        \"ProofOfSale\": \"081133\",\n        \"AuthorizationCode\": \"625821\",\n        \"SoftDescriptor\": \"123456789ABCD\",\n        \"Provider\": \"Simulado\",\n        \"IsQrCode\": false,\n        \"RecurrentPayment\": {\n            \"RecurrentPaymentId\": \"ed535ad9-eb4f-4fef-9a77-a2c9620702ce\",\n            \"ReasonCode\": 0,\n            \"ReasonMessage\": \"Successful\",\n            \"NextRecurrency\": \"2025-08-24\",\n            \"EndDate\": \"2030-12-31\",\n            \"Interval\": 1,\n            \"Link\": {\n                \"Method\": \"GET\",\n                \"Rel\": \"recurrentPayment\",\n                \"Href\": \"https://apiquerysandbox.cieloecommerce.cielo.com.br/1/RecurrentPayment/ed535ad9-eb4f-4fef-9a77-a2c9620702ce\"\n            },\n            \"AuthorizeNow\": true\n        },\n        \"Amount\": 1500,\n        \"ReceivedDate\": \"2025-07-24 12:21:49\",\n        \"Status\": 1,\n        \"IsSplitted\": false,\n        \"ReturnMessage\": \"Operation Successful\",\n        \"ReturnCode\": \"4\",\n        \"PaymentId\": \"c5142036-956e-49ce-a0ad-680522b1bac4\",\n        \"Type\": \"CreditCard\",\n        \"Currency\": \"BRL\",\n        \"Country\": \"BRA\",\n        \"Links\": [\n            {\n                \"Method\": \"GET\",\n                \"Rel\": \"self\",\n                \"Href\": \"https://apiquerysandbox.cieloecommerce.cielo.com.br/1/sales/c5142036-956e-49ce-a0ad-680522b1bac4\"\n            },\n            {\n                \"Method\": \"PUT\",\n                \"Rel\": \"capture\",\n                \"Href\": \"https://apisandbox.cieloecommerce.cielo.com.br/1/sales/c5142036-956e-49ce-a0ad-680522b1bac4/capture\"\n            },\n            {\n                \"Method\": \"PUT\",\n                \"Rel\": \"void\",\n                \"Href\": \"https://apisandbox.cieloecommerce.cielo.com.br/1/sales/c5142036-956e-49ce-a0ad-680522b1bac4/void\"\n            }\n        ]\n    }\n}"
                  },
                  "Elo via Link de Pagamento": {
                    "value": "{\n  \"MerchantOrderId\": \"Loja123456\",\n  \"Customer\": {\n    \"Name\": \"Aline de Souza\",\n    \"Identity\": \"12345678909\",\n    \"IdentityType\": \"CPF\",\n    \"Email\": \"linedesouza@email.com\",\n    \"Birthdate\": \"1990-01-01\",\n    \"Address\": {\n      \"Street\": \"Rua das Rosas\",\n      \"Number\": \"123\",\n      \"Complement\": \"apartamento 101\",\n      \"ZipCode\": \"12345987\",\n      \"City\": \"São Paulo\",\n      \"State\": \"SP\",\n      \"Country\": \"BRA\",\n      \"District\": \"Jardim das Flores\",\n      \"AddressType\": 0\n    },\n    \"DeliveryAddress\": {\n      \"Street\": \"Rua das Rosas\",\n      \"Number\": \"123\",\n      \"Complement\": \"apartamento 101\",\n      \"ZipCode\": \"12345987\",\n      \"City\": \"São Paulo\",\n      \"State\": \"SP\",\n      \"Country\": \"BRA\",\n      \"District\": \"Jardim das Flores\",\n      \"AddressType\": 0\n    }\n  },\n  \"Payment\": {\n    \"ServiceTaxAmount\": 0,\n    \"Installments\": 1,\n    \"Interest\": 0,\n    \"Capture\": false,\n    \"Authenticate\": false,\n    \"Recurrent\": false,\n    \"SolutionType\": \"ExternalLinkPay\",\n    \"CreditCard\": {\n      \"CardNumber\": \"409168******7641\",\n      \"Holder\": \"Nome do Portador\",\n      \"ExpirationDate\": \"12/2035\",\n      \"SaveCard\": false,\n      \"Brand\": \"Elo\",\n      \"PaymentAccountReference\": \"D3XUS15XYY0GB4AMUI1EYDG4SA1MV\"\n    },\n    \"Tid\": \"0724122149606\",\n    \"ProofOfSale\": \"081133\",\n    \"AuthorizationCode\": \"625821\",\n    \"SoftDescriptor\": \"123456789ABCD\",\n    \"Provider\": \"Simulado\",\n    \"IsQrCode\": false,\n    \"RecurrentPayment\": {\n      \"RecurrentPaymentId\": \"ed535ad9-eb4f-4fef-9a77-a2c9620702ce\",\n      \"ReasonCode\": 0,\n      \"ReasonMessage\": \"Successful\",\n      \"NextRecurrency\": \"2025-08-24\",\n      \"EndDate\": \"2030-12-31\",\n      \"Interval\": 1,\n      \"Link\": {\n        \"Method\": \"GET\",\n        \"Rel\": \"recurrentPayment\",\n        \"Href\": \"https://apiquerysandbox.cieloecommerce.cielo.com.br/1/RecurrentPayment/ed535ad9-eb4f-4fef-9a77-a2c9620702ce\"\n      },\n      \"AuthorizeNow\": true\n    },\n    \"Amount\": 1500,\n    \"ReceivedDate\": \"2025-07-24 12:21:49\",\n    \"Status\": 1,\n    \"IsSplitted\": false,\n    \"ReturnMessage\": \"Operation Successful\",\n    \"ReturnCode\": \"4\",\n    \"PaymentId\": \"c5142036-956e-49ce-a0ad-680522b1bac4\",\n    \"Type\": \"CreditCard\",\n    \"Currency\": \"BRL\",\n    \"Country\": \"BRA\",\n    \"Links\": [\n      {\n        \"Method\": \"GET\",\n        \"Rel\": \"self\",\n        \"Href\": \"https://apiquerysandbox.cieloecommerce.cielo.com.br/1/sales/c5142036-956e-49ce-a0ad-680522b1bac4\"\n      },\n      {\n        \"Method\": \"PUT\",\n        \"Rel\": \"capture\",\n        \"Href\": \"https://apisandbox.cieloecommerce.cielo.com.br/1/sales/c5142036-956e-49ce-a0ad-680522b1bac4/capture\"\n      },\n      {\n        \"Method\": \"PUT\",\n        \"Rel\": \"void\",\n        \"Href\": \"https://apisandbox.cieloecommerce.cielo.com.br/1/sales/c5142036-956e-49ce-a0ad-680522b1bac4/void\"\n      }\n    ]\n  }\n}"
                  }
                },
                "schema": {
                  "oneOf": [
                    {
                      "title": "Recorrência Programada",
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
                              "example": "12345678909"
                            },
                            "IdentityType": {
                              "type": "string",
                              "example": "CPF"
                            },
                            "Email": {
                              "type": "string",
                              "example": "linedesouza@email.com"
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
                                "District": {
                                  "type": "string",
                                  "example": "Jardim das Flores"
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
                                "District": {
                                  "type": "string",
                                  "example": "Jardim das Flores"
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
                                  "example": "409168******7641"
                                },
                                "Holder": {
                                  "type": "string",
                                  "example": "Nome do Portador"
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
                                  "example": "Visa"
                                },
                                "PaymentAccountReference": {
                                  "type": "string",
                                  "example": "D3XUS15XYY0GB4AMUI1EYDG4SA1MV"
                                }
                              }
                            },
                            "Tid": {
                              "type": "string",
                              "example": "0724122149606"
                            },
                            "ProofOfSale": {
                              "type": "string",
                              "example": "081133"
                            },
                            "AuthorizationCode": {
                              "type": "string",
                              "example": "625821"
                            },
                            "SoftDescriptor": {
                              "type": "string",
                              "example": "123456789ABCD"
                            },
                            "Provider": {
                              "type": "string",
                              "example": "Simulado"
                            },
                            "IsQrCode": {
                              "type": "boolean",
                              "example": false,
                              "default": true
                            },
                            "RecurrentPayment": {
                              "type": "object",
                              "properties": {
                                "RecurrentPaymentId": {
                                  "type": "string",
                                  "example": "ed535ad9-eb4f-4fef-9a77-a2c9620702ce"
                                },
                                "ReasonCode": {
                                  "type": "integer",
                                  "example": 0,
                                  "default": 0
                                },
                                "ReasonMessage": {
                                  "type": "string",
                                  "example": "Successful"
                                },
                                "NextRecurrency": {
                                  "type": "string",
                                  "example": "2025-08-24"
                                },
                                "EndDate": {
                                  "type": "string",
                                  "example": "2030-12-31"
                                },
                                "Interval": {
                                  "type": "integer",
                                  "example": 1,
                                  "default": 0
                                },
                                "Link": {
                                  "type": "object",
                                  "properties": {
                                    "Method": {
                                      "type": "string",
                                      "example": "GET"
                                    },
                                    "Rel": {
                                      "type": "string",
                                      "example": "recurrentPayment"
                                    },
                                    "Href": {
                                      "type": "string",
                                      "example": "https://apiquerysandbox.cieloecommerce.cielo.com.br/1/RecurrentPayment/ed535ad9-eb4f-4fef-9a77-a2c9620702ce"
                                    }
                                  }
                                },
                                "AuthorizeNow": {
                                  "type": "boolean",
                                  "example": true,
                                  "default": true
                                }
                              }
                            },
                            "Amount": {
                              "type": "integer",
                              "example": 1500,
                              "default": 0
                            },
                            "ReceivedDate": {
                              "type": "string",
                              "example": "2025-07-24 12:21:49"
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
                              "example": "c5142036-956e-49ce-a0ad-680522b1bac4"
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
                                    "example": "https://apiquerysandbox.cieloecommerce.cielo.com.br/1/sales/c5142036-956e-49ce-a0ad-680522b1bac4"
                                  }
                                }
                              }
                            }
                          }
                        }
                      }
                    },
                    {
                      "title": "Elo via Link de Pagamento",
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
                              "example": "12345678909"
                            },
                            "IdentityType": {
                              "type": "string",
                              "example": "CPF"
                            },
                            "Email": {
                              "type": "string",
                              "example": "linedesouza@email.com"
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
                                "District": {
                                  "type": "string",
                                  "example": "Jardim das Flores"
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
                                "District": {
                                  "type": "string",
                                  "example": "Jardim das Flores"
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
                            "SolutionType": {
                              "type": "string",
                              "example": "ExternalLinkPay"
                            },
                            "CreditCard": {
                              "type": "object",
                              "properties": {
                                "CardNumber": {
                                  "type": "string",
                                  "example": "409168******7641"
                                },
                                "Holder": {
                                  "type": "string",
                                  "example": "Nome do Portador"
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
                                  "example": "D3XUS15XYY0GB4AMUI1EYDG4SA1MV"
                                }
                              }
                            },
                            "Tid": {
                              "type": "string",
                              "example": "0724122149606"
                            },
                            "ProofOfSale": {
                              "type": "string",
                              "example": "081133"
                            },
                            "AuthorizationCode": {
                              "type": "string",
                              "example": "625821"
                            },
                            "SoftDescriptor": {
                              "type": "string",
                              "example": "123456789ABCD"
                            },
                            "Provider": {
                              "type": "string",
                              "example": "Simulado"
                            },
                            "IsQrCode": {
                              "type": "boolean",
                              "example": false,
                              "default": true
                            },
                            "RecurrentPayment": {
                              "type": "object",
                              "properties": {
                                "RecurrentPaymentId": {
                                  "type": "string",
                                  "example": "ed535ad9-eb4f-4fef-9a77-a2c9620702ce"
                                },
                                "ReasonCode": {
                                  "type": "integer",
                                  "example": 0,
                                  "default": 0
                                },
                                "ReasonMessage": {
                                  "type": "string",
                                  "example": "Successful"
                                },
                                "NextRecurrency": {
                                  "type": "string",
                                  "example": "2025-08-24"
                                },
                                "EndDate": {
                                  "type": "string",
                                  "example": "2030-12-31"
                                },
                                "Interval": {
                                  "type": "integer",
                                  "example": 1,
                                  "default": 0
                                },
                                "Link": {
                                  "type": "object",
                                  "properties": {
                                    "Method": {
                                      "type": "string",
                                      "example": "GET"
                                    },
                                    "Rel": {
                                      "type": "string",
                                      "example": "recurrentPayment"
                                    },
                                    "Href": {
                                      "type": "string",
                                      "example": "https://apiquerysandbox.cieloecommerce.cielo.com.br/1/RecurrentPayment/ed535ad9-eb4f-4fef-9a77-a2c9620702ce"
                                    }
                                  }
                                },
                                "AuthorizeNow": {
                                  "type": "boolean",
                                  "example": true,
                                  "default": true
                                }
                              }
                            },
                            "Amount": {
                              "type": "integer",
                              "example": 1500,
                              "default": 0
                            },
                            "ReceivedDate": {
                              "type": "string",
                              "example": "2025-07-24 12:21:49"
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
                              "example": "c5142036-956e-49ce-a0ad-680522b1bac4"
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
                                    "example": "https://apiquerysandbox.cieloecommerce.cielo.com.br/1/sales/c5142036-956e-49ce-a0ad-680522b1bac4"
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