---
updatedAt: 2026-10-28T18:59:06.000Z
agentTools:
  siteIndex: https://docs.cielo.com.br/llms.txt
  projectIndex: https://docs.cielo.com.br/ecommerce-cielo/llms.txt
---

# Validar cartão com o Zero Auth

Simula uma autorização para verificar se o cartão está válido no momento.

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
        `https://apisandbox.cieloecommerce.cielo.com.br/1/zeroauth/`
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
        `https://api.cieloecommerce.cielo.com.br/1/zeroauth/`
      </td>
    </tr>
  </tbody>
</Table>

<br />

<Callout icon="ℹ️" theme="info">
  Saiba mais sobre essa funcionalidade <a href="https://docs.cielo.com.br/ecommerce-cielo/docs/zero-auth" target="_blank">na documentação</a>.
</Callout>

O exemplo desta página é valido para envio do cartão com os dados abertos (não tokenizados).

<Callout icon="ℹ️" theme="info">
  ### Importante

  - Habilite o Zero Auth pelo [site Cielo](https://docs.cielo.com.br/ecommerce-cielo/docs/como-habilitar-microsservi%C3%A7os#zero-auth)  ou com o suporte Cielo. Se a API retornar o código de **erro 322**, entre em contato com o Atendimento para habilitar a funcionalidade;
  - Caso a API retorne o erro **389 – Restrição Cadastral**, procure o gestor comercial para validar se o serviço está habilitado corretamente; se estiver, o retorno indica que essa tentativa não pode ser validada por critérios internos da Cielo, recomendamos tentar outro cartão para concluir a validação;
  - Para simular cenários de autorização, confira a documentação [ Zero Auth em sandbox](https://docs.cielo.com.br/ecommerce-cielo/reference/zero-auth-em-sandbox).
</Callout>

## Bandeiras disponíveis no Zero Auth

O Zero Auth está disponível para as bandeiras **Visa**, **Master**, **Elo** e **Diners**\*.

> \*Disponível a partir de outubro de 2026.

<Callout icon="❗" theme="error">
  ### Se a resposta for negativa, não submeta o cartão para autorização.

  Envie o cartão para autorização apenas se o código de resposta da verificação Zero Auth for positivo.
</Callout>

<Callout icon="ℹ️" theme="info">
  ### Transações de Zero Auth de cartão Visa tokenizado

  A partir de 17/04/2026, será necessário **enviar o criptograma** em transações de verificação de cartão com **tokenização externa na bandeira Visa**:

  - Envie o **DPAN** (token) no campo `Card.CardNumber`;
  - Envie o **criptograma** no campo `Cryptogram`.
</Callout>

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

### Resposta da validação no Zero Auth

A resposta sempre retorna se o cartão pode ser autorizado no momento. Essa informação apenas significa que o *cartão está válido para transacionar*, mas não indica que um determinado valor será autorizado.

Os campos retornados na resposta dependem do resultado da validação. A tabela a seguir apresenta todos os campos possíveis.

<Table align={["left","left","left","left"]}>
  <thead>
    <tr>
      <th>
        Parâmetro
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
        `Valid`
      </td>

      <td>
        Situação do cartão:

        - _True_: cartão válido
        - _False_: cartão inválido
      </td>

      <td>
        Boolean
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
        Código de retorno. Consulte os [Códigos de retorno Zero Auth.](https://docs.cielo.com.br/ecommerce-cielo/reference/codigos-de-retorno-zero-auth)
      </td>

      <td>
        String
      </td>

      <td>
        2
      </td>
    </tr>

    <tr>
      <td>
        `ReturnMessage`
      </td>

      <td>
        Mensagem de retorno. Consulte os [Códigos de retorno Zero Auth.](https://docs.cielo.com.br/ecommerce-cielo/reference/codigos-de-retorno-zero-auth)
      </td>

      <td>
        String
      </td>

      <td>
        255
      </td>
    </tr>

    <tr>
      <td>
        `IssuerTransactionId`
      </td>

      <td>
        Identificador da transação gerado pela bandeira, retornado na resposta do Zero Auth. O Zero Auth não recebe esse campo no request. Armazene o valor para enviá-lo, obrigatoriamente, nas transações recorrentes seguintes de crédito e débito. Na recorrência programada, o campo é enviado automaticamente nas transações seguintes. Consulte mais informações em <Anchor target="_blank" href="https://docs.cielo.com.br/ecommerce-cielo/docs/identificadores-de-bandeira">Identificadores de bandeira</Anchor>.
      </td>

      <td>
        String
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
        Identificador único (TLID) gerado pela Mastercard e retornado na resposta do Zero Auth. O Zero Auth não recebe esse campo no request. Armazene o valor original para enviá-lo, junto com o `IssuerTransactionId`, nas transações MIT seguintes. Consulte mais informações em <Anchor target="_blank" href="https://docs.cielo.com.br/ecommerce-cielo/docs/identificadores-de-bandeira">Identificadores de bandeira</Anchor>.

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

# OpenAPI definition

```json
{
  "openapi": "3.1.0",
  "info": {
    "title": "zero-auth",
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
    "/1/zeroauth/": {
      "post": {
        "summary": "Validar cartão com o Zero Auth",
        "description": "Simula uma autorização para verificar se o cartão está válido no momento.",
        "operationId": "validar-cartao",
        "parameters": [
          {
            "name": "MerchantId",
            "in": "header",
            "description": "Identificador da loja na API. Tamanho: 36. Formato: GUID. <br>*Esta documentação traz um `MerchantId` padrão para permitir os testes em sandbox, mas você também pode informar o `MerchantId` habilitado durante o processo de implantação.*",
            "required": true,
            "schema": {
              "type": "string",
              "default": "8937bd5b-9796-494d-9fe5-f76b3e4da633"
            }
          },
          {
            "name": "MerchantKey",
            "in": "header",
            "description": "Chave pública para autenticação dupla na API. Tamanho: 40. Formato: GUID. <br>*Esta documentação traz um `MerchantKey` padrão para permitir os testes em sandbox, mas você também pode informar o `MerchantKey` habilitado durante o processo de implantação.*",
            "required": true,
            "schema": {
              "type": "string",
              "default": "XKGHUBSBKIRXKAVPSKWLVXYCLVJUGTNZLIHPUSYV"
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
          }
        ],
        "requestBody": {
          "content": {
            "application/json": {
              "schema": {
                "type": "object",
                "required": [
                  "CardType",
                  "CardNumber",
                  "Holder",
                  "ExpirationDate",
                  "SecurityCode",
                  "Brand"
                ],
                "properties": {
                  "CardType": {
                    "type": "string",
                    "description": "*Creditcard* ou *DebitCard*. Tamanho: 255."
                  },
                  "CardNumber": {
                    "type": "string",
                    "description": "Número do cartão do comprador. Tamanho: 16.</br>Para verificação de cartões Visa tokenizados, envie o token do cartão.",
                    "default": "5502095822650000"
                  },
                  "Holder": {
                    "type": "string",
                    "description": "Nome do comprador impresso no cartão. Tamanho: 25."
                  },
                  "ExpirationDate": {
                    "type": "string",
                    "description": "Data de e validade impresso no cartão. Tamanho: 7."
                  },
                  "SecurityCode": {
                    "type": "string",
                    "description": "Código de segurança impresso no verso do cartão. </br>Para verificação de cartões Visa tokenizados, envie o criptograma no campo Cryptogram. Tamanho: 4."
                  },
                  "Brand": {
                    "type": "string",
                    "description": "Bandeira do cartão: Visa, Master, Elo e Diners**. Tamanho: 10 </br> * *Disponível a partir de outubro de 2026."
                  },
                  "CardToken": {
                    "type": "string",
                    "description": "**Obrigatório o envio se estiver informando cartão tokenizado**. Token do cartão na API E-commerce Cielo. Tamanho: 36."
                  },
                  "CardOnFile": {
                    "properties": {
                      "Usage": {
                        "type": "string",
                        "description": "First se o cartão foi armazenado e é seu primeiro uso. Used se o cartão foi armazenado e ele já foi utilizado anteriormente em outra transação."
                      },
                      "Reason": {
                        "type": "string",
                        "description": "**Condicional**. Indica o propósito de armazenamento de cartões, caso o campo “Usage” for “Used”. Recurring - Compra recorrente programada (ex. assinaturas). Se for transação recorrente, usar Payment.Recurrent = true (recorrência própria) ou Recurrent.Payment = true (recorrência programada). Unscheduled - Compra recorrente sem agendamento (ex. aplicativos de serviços) Installments - Parcelamento através da recorrência."
                      }
                    },
                    "required": [],
                    "type": "object"
                  },
                  "Cryptogram": {
                    "type": "string",
                    "description": "Criptograma gerado para autenticação de cartões tokenizados. Tamanho: até 28 caracteres."
                  }
                }
              },
              "examples": {
                "Request Example": {
                  "value": {
                    "CardNumber": "5502095822650000",
                    "Holder": "Aline de Souza",
                    "ExpirationDate": "12/2035",
                    "SecurityCode": "123",
                    "Brand": "Visa",
                    "CardOnFile": {
                      "Usage": "First",
                      "Reason": "Recurring"
                    }
                  }
                },
                "Cartão Visa tokenizado": {
                  "summary": "Cartão Visa tokenizado",
                  "value": {
                    "CardNumber": "5502095822650000",
                    "Holder": "Aline de Souza",
                    "ExpirationDate": "12/2035",
                    "SecurityCode": "1234",
                    "Cryptogram": "AAABB2gHA1B5EFNjWQcDAAAAAAB=",
                    "Brand": "Visa"
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
                  "Cartão válido": {
                    "value": "{\n  \"Valid\": true,\n  \"ReturnCode\": \"00\",\n  \"ReturnMessage\": \"Transacao autorizada\",\n  \"IssuerTransactionId\": \"580027442382078\"\n}"
                  },
                  "Cartão inválido": {
                    "value": "{\n  \"Valid\": false,\n  \"ReturnCode\": \"57\",\n  \"ReturnMessage\": \"Autorizacao negada\",\n  }"
                  },
                  "Bandeira inválida": {
                    "value": "{\n  \"Code\": 57,\n  \"Message\": \"Bandeira inválida\"\n}"
                  },
                  "Restrição cadastral": {
                    "value": "{\n  \"Code\": 389,\n  \"Message\": \"Restrição Cadastral\"\n}"
                  },
                  "Cartão Válido Mastercard TransactionLinkId": {
                    "summary": "Cartão Válido Mastercard TransactionLinkId",
                    "value": {
                      "Valid": true,
                      "ReturnCode": "00",
                      "ReturnMessage": "Transacao autorizada",
                      "IssuerTransactionId": "580027442382078",
                      "TransactionLinkId": "Qm5tR8xL-3cVa_7PzK2nWe"
                    }
                  }
                },
                "schema": {
                  "oneOf": [
                    {
                      "title": "Cartão válido",
                      "type": "object",
                      "properties": {
                        "Valid": {
                          "type": "boolean",
                          "example": true,
                          "default": true
                        },
                        "ReturnCode": {
                          "type": "string",
                          "example": "00"
                        },
                        "ReturnMessage": {
                          "type": "string",
                          "example": "Transacao autorizada"
                        },
                        "IssuerTransactionId": {
                          "type": "string",
                          "example": "580027442382078",
                          "description": "Identificador da transação gerado pela bandeira, retornado na resposta do Zero Auth. Armazene o valor para enviá-lo nas transações recorrentes seguintes."
                        },
                        "TransactionLinkId": {
                          "type": "string",
                          "example": "mK8vT2qA-9LpX7dWc3Rf_H",
                          "description": "Identificador único (TLID) gerado pela Mastercard, retornado na resposta do Zero Auth. Armazene o valor original para enviá-lo, junto com o `IssuerTransactionId`, nas transações MIT seguintes."
                        }
                      }
                    },
                    {
                      "title": "Bandeira inválida",
                      "type": "object",
                      "properties": {
                        "Code": {
                          "type": "integer",
                          "example": 57,
                          "default": 0
                        },
                        "Message": {
                          "type": "string",
                          "example": "Bandeira inválida"
                        }
                      }
                    },
                    {
                      "title": "Restrição cadastral",
                      "type": "object",
                      "properties": {
                        "Code": {
                          "type": "integer",
                          "example": 389,
                          "default": 0
                        },
                        "Message": {
                          "type": "string",
                          "example": "Restrição Cadastral"
                        }
                      }
                    }
                  ]
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
                  },
                  "Serviço não habilitado": {
                    "value": "[\n    {\n       \"ReturnCode\": 322,\n       \"ReturnMessage\": \"Zero Dollar Auth is not enabled\"\n    }\n  ]"
                  }
                },
                "schema": {
                  "type": "array",
                  "items": {
                    "type": "object",
                    "properties": {
                      "ReturnCode": {
                        "type": "integer",
                        "example": 322,
                        "default": 0
                      },
                      "ReturnMessage": {
                        "type": "string",
                        "example": "Zero Dollar Auth is not enabled"
                      }
                    }
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
                  "Result": {
                    "value": "Internal Server Error"
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