---
updatedAt: 2026-10-20T18:47:35.000Z
agentTools:
  siteIndex: https://docs.cielo.com.br/llms.txt
  projectIndex: https://docs.cielo.com.br/ecommerce-cielo/llms.txt
---

# Criar pagamento com cartão de débito

Cria transação com o meio de pagamento cartão de débito.

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

<br />

<Callout icon="ℹ️" theme="info">
  Saiba mais sobre essa funcionalidade <a href="https://docs.cielo.com.br/ecommerce-cielo/docs/cartao-credito" target="_blank">na documentação</a>.
</Callout>

> ℹ️ CNPJs alfanuméricos serão implementados pela Receita Federal em julho de 2026
>
> Essa mudança afeta apenas novas inscrições, **não havendo mudanças em CNPJs existentes**.
>
> O CNPJ alfanumérico **já está sendo suportado pela Cielo**, sem mudanças na sua integração.
>
> Recomendamos verificar a necessidade de possíveis ajustes nos sistemas próprios de checkout de sua loja.

<br />

<Callout icon="⚠️" theme="warn">
  ### Atenção

  Os retornos de autorização estão sujeitos a inserção de novos campos advindos das bandeiras/emissores.<br />Faça sua integração de forma a prever este tipo de comportamento utilizando adequadamente as técnicas de serialização e deserialização de objetos.
</Callout>

> ⚠️ A bandeira Hipercard foi descontinuada em 30/06/2025

> ⚠️ Identificação de transações oriundas de link de pagamento para cartões da bandeira Elo
>
> A partir de 17 de outubro de 2025 será obrigatório identificar transações oriundas de link de pagamento para cartões da bandeira Elo. Envie o parâmetro `Payment.SolutionType` = "ExternalLinkPay".

<br />

**Atenção**

* Não é possível realizar uma transação com valor (`Amount`) 0. Para verificar a validade de um cartão, use o [Zero Auth](https://docs.cielo.com.br/ecommerce-cielo/docs/zero-auth);
* **Transações de crédito Mastercard com credenciais armazenadas**: a bandeira Mastercard exige o envio do **Indicador de Início da Transação** para compras de **cartão de crédito e débito** que usam os dados armazenados de um cartão. O objetivo é indicar se a transação foi iniciada pelo comprador (Cardholder-Initiated Transaction - CIT) ou pela loja (Merchant-Initiated Transaction - MIT). Nesse cenário é obrigatório o envio do nó `InitiatedTransactionIndicator` com os parâmetros `Category` e `SubCategory` para transações Mastercard, dentro do nó `Payment`. Confira o exemplo do nó e a lista de categorias e subcategorias em [Indicador de início da transação Mastercard](https://docs.cielo.com.br/ecommerce-cielo/page/indicador-de-in%C3%ADcio-da-transa%C3%A7%C3%A3o-cit-e-mit);
* O campo `Payment.ServiceTaxAmount` é exclusivo para companhias aéreas e agências de turismo. Para as companhias aéreas, permite a cobrança da taxa de embarque separadamente do valor da passagem aérea. Já para as agências de turismo, é utilizado especialmente para a cobrança de taxas na primeira parcela;
* O número de identificação do pedido (`MerchantOrderId`) não sofre alteração ao longo do fluxo transacional. Contudo, um novo número (`SentOrderId`) pode ser gerado para o pedido e utilizado durante a transação. Esse número só será diferente se:
  * o `MerchantOrderID` enviado estiver fora do formato esperado pelo campo, ou possuir mais de **20 caracteres**;
  * o `MerchantOrderID` enviado já tiver sido utilizado nas últimas 24 horas.
* Para fins de conciliação, use o `TransactionId` (TID).

<br />

### Autenticação 3DS nas transações de cartão de débito

* Se a sua loja tem integração com o <a href="https://docs.cielo.com.br/ecommerce-cielo/docs/3ds-sobre" target="_blank">protocolo 3DS</a> para <Glossary>autenticação</Glossary> do <Glossary>portador</Glossary> do cartão, informe os dados recebidos na saída do script no nó `Payment.ExternalAuthentication`;
* Em transações com autenticação 3DS Data Only, é necessário informar o parâmetro `ExternalAuthentication.DataOnly` como *true*;
* Para confirmar se a autenticação foi acatada na autorização, verifique o valor do ECI retornado em `Payment.Eci`. A API replica o ECI informado pela loja no campo `Payment.ExternalAuthentication`. No entanto, o valor efetivamente utilizado pela bandeira na autorização é o que aparece em `Payment.Eci`.

<Callout icon="ℹ️" theme="info">
  ### Importante

  A validação e o retorno do campo `Payment.Eci` ocorrem **apenas no ambiente de produção** neste primeiro momento.
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

***

### Garantia de cancelamento

Quando uma transação retornar com o status Não Finalizada e a funcionalidade **Garantia de Cancelamento** estiver habilitada para a loja, **não reutilize o mesmo valor de MerchantOrderID** em novas tentativas da transação.

Para as tentativas subsequentes, **gere um novo identificador de pedido**. O reenvio de uma transação utilizando o mesmo `MerchantOrderID` da tentativa que retornou como **Não Finalizada** pode provocar erros de processamento.

***

### Resposta da transação de cartão de débito

A tabela a seguir apresenta os principais parâmetros que podem ser retornados pela API na criação de um pagamento com cartão de débito.

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
        `SentOrderId`
      </td>

      <td>
        Indica qual número de pedido foi enviado à adquirente.

        - Se o `MerchantOrderId` informado estiver fora do formato esperado pelo campo, ou possuir **mais de 20 caracteres**, um novo identificador será gerado e retornado no campo `SentOrderId`.
        - Se o `MerchantOrderId` estiver dentro do formato esperado e com tamanho de **até 20 caracteres**, o campo `SentOrderId` conterá o mesmo valor informado em `MerchantOrderId`.
      </td>

      <td>
        GUID
      </td>

      <td>

      </td>
    </tr>

    <tr>
      <td>
        `Payment.MerchantAdviceCode`
      </td>

      <td>
        Código de retorno da bandeira que define período para retentativa. _Válido somente para bandeira Mastercard_. Saiba mais em <Anchor target="_blank" href="https://docs.cielo.com.br/ecommerce-cielo/docs/merchant-advice-code-mac-mastercard">Merchant Advice Code (MAC)</Anchor> e no [Programa de retentativa das bandeiras para Mastercard](https://docs.cielo.com.br/ecommerce-cielo/reference/retentativa-bandeira#mastercard)
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

    <tr>
      <td>
        `Payment.SentTransactionLinkId`
      </td>

      <td>
        TLID que o estabelecimento enviou no request e que a Cielo repassou à bandeira. O campo só aparece quando a Cielo enviou o TLID. Consulte mais informações em <Anchor target="_blank" href="https://docs.cielo.com.br/ecommerce-cielo/docs/identificadores-de-bandeira">Identificadores de bandeira</Anchor>.
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
    "title": "cartão-de-débito",
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
        "summary": "Criar pagamento com cartão de débito",
        "description": "Cria transação com o meio de pagamento cartão de débito.",
        "operationId": "debito",
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
                      "Status": {
                        "type": "string",
                        "description": "Status de cadastro do comprador na loja (NEW / EXISTING) - Utilizado pela análise de fraude"
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
                    "required": [
                      "Name"
                    ],
                    "type": "object"
                  },
                  "Payment": {
                    "properties": {
                      "Type": {
                        "type": "string",
                        "description": "Tipo do meio de pagamento.",
                        "default": "DebitCard"
                      },
                      "Amount": {
                        "type": "integer",
                        "description": "Valor do pedido (ser enviado em centavos). Tamanho: 15.",
                        "format": "int32"
                      },
                      "SoftDescriptor": {
                        "type": "string",
                        "description": "O complemento do nome da loja que aparecerá na fatura do cartão. Não permite caracteres especiais.<br>Tamanho: 13."
                      },
                      "Authenticate": {
                        "type": "boolean",
                        "description": "Indica se a transação foi autenticada via 3DS antes da autorização."
                      },
                      "Tip": {
                        "type": "boolean",
                        "description": "As gorjetas são um tipo de transação que funcionam para cartão de crédito ou débito, tokenizados ou não. Se o valor for \"true\", a transação é identificada como gorjeta, caso contrário, o valor deverá ser \"false\"."
                      },
                      "IsCryptocurrencyNegotiation": {
                        "type": "boolean",
                        "description": "Deve ser enviado com valor “true” caso se trate de uma transação de compra ou venda de Criptomoeda"
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
                            "description": "Bandeira do cartão.<br>Valores possíveis: Visa / Master / Elo. Tamanho: 10."
                          },
                          "CardOnFile": {
                            "properties": {
                              "Usage": {
                                "type": "string",
                                "description": "\"First\" se o cartão foi armazenado e é seu primeiro uso.<br>\"Used\" se o cartão foi armazenado e ele já foi utilizado anteriormente em outra transação. Saiba mais em <a href=\"https://docs.cielo.com.br/ecommerce-cielo/docs/card-on-file\" target=\"_blank\">Card On File</a>."
                              }
                            },
                            "required": [],
                            "type": "object"
                          }
                        },
                        "required": [
                          "CardNumber",
                          "Holder",
                          "ExpirationDate",
                          "Brand"
                        ],
                        "type": "object"
                      },
                      "InitiatedTransactionIndicator": {
                        "properties": {
                          "Category": {
                            "type": "string",
                            "description": "**Obrigatório apenas para bandeira Mastercard**. Categoria do indicador de início da transação. Válido apenas para bandeira Mastercard.<br>Valores possíveis:<br>- “C1”: transação inciada pelo portador do cartão;<br>- “M1”: transação recorrente ou parcelada iniciada pela loja;<br>- “M2”: transação iniciada pela loja. Tamanho: 2."
                          },
                          "Subcategory": {
                            "type": "integer",
                            "description": "**Obrigatório apenas para a bandeira Mastercard**. Subcategoria do indicador. Válido apenas para bandeira Mastercard.<br>Valores possíveis:<br>Se `InitiatedTransactionIndicator.Category` = \"C1\" ou \"M1\"<br>*CredentialsOnFile*<br>*StandingOrder*<br>*Subscription*<br>*Installment*<br>Se `InitiatedTransactionIndicator.Category` = \"M2\"<br>*PartialShipment*<br>*RelatedOrDelayedCharge*<br>*NoShow*<br>*Resubmission*<br>Consulte a tabela com a descrição das subcategorias em [Indicador de início da transação Mastercard](https://developercielo.github.io/manual/cielo-ecommerce#indicador-de-in%C3%ADcio-da-transa%C3%A7%C3%A3o-mastercard).",
                            "format": "int32"
                          }
                        },
                        "required": [
                          "Subcategory"
                        ],
                        "type": "object"
                      },
                      "ExternalAuthentication": {
                        "properties": {
                          "Eci": {
                            "type": "integer",
                            "description": "Electronic Commerce Indicator retornado no processo de autenticação. Tamanho: 2.",
                            "format": "int32"
                          },
                          "ReferenceID": {
                            "type": "string",
                            "description": "RequestID retornado no processo de autenticação.<br>- _O `ReferenceId` não é retornado em todas as autenticações._<br>- _O envio é recomendado caso o `ReferenceId` tenha sido retornado no script._ Tamanho: 36."
                          },
                          "Cavv": {
                            "type": "string",
                            "description": "Assinatura retornada nos cenários de sucesso na autenticação.<br>**⚠️Este campo é obrigatório para transações que foram autenticadas pelo emissor ou pela bandeira e nas solicitações de autorizações com Data Only.**"
                          },
                          "Xid": {
                            "type": "string",
                            "description": "XID retornado no processo de autenticação.<br>- _O `Xid` não é retornado em todas as autenticações._<br>- _O envio é recomendado caso o `Xid` tenha sido retornado no script._"
                          },
                          "Version": {
                            "type": "string",
                            "description": "**Campo obrigatório para transações com autenticação 3DS**.<br>Versão do 3DS aplicado no processo de autenticação.<br>Valores possíveis:<br>- Visa e Mastercard: \"2.2.0\"<br>- Elo e Amex: \"2.1.0\"<br>Tamanho: 5."
                          },
                          "DataOnly": {
                            "type": "boolean",
                            "description": "Define se é uma transação com autenticação 3DS do tipo Data Only. O envio é obrigatório no caso de transação Data Only."
                          }
                        },
                        "required": [
                          "Eci",
                          "ReferenceID",
                          "Cavv",
                          "Xid",
                          "Version"
                        ],
                        "type": "object"
                      },
                      "SolutionType": {
                        "type": "string",
                        "description": "Origem do pagamento. **Obrigatório para transação de cartão da bandeira Elo oriunda de link de pagamento**. <br>Enviar como *\"ExternalLinkPay\"*. <br>Tamanho: 15."
                      },
                      "IssuerTransactionId": {
                        "type": "string",
                        "description": "Identificador da transação gerado pela bandeira, retornado na transação CIT ou no Zero Auth. Envie nas transações MIT recorrentes, incrementais e reautorizadas. **Envio obrigatório** para as bandeiras Visa, Mastercard, Elo e Amex. Tamanho: 30."
                      },
                      "TransactionLinkId": {
                        "type": "string",
                        "description": "Identificador único gerado pela bandeira Mastercard (TLID), usado para vincular a transação inicial (CIT) a transações subsequentes relacionadas (MIT), como recorrências, parcelas futuras, cobranças pós-autorizadas e pagamentos com cartão salvo (card-on-file). Tamanho: 22.\nFormato: 22 caracteres alfanuméricos (A-Z, a-z, com diferenciação entre maiúsculas e minúsculas), podendo incluir hífen (-) e underscore (_).\nSe o valor for nulo, vazio ou estiver fora desse formato, a Cielo o ignora, sem retornar erro."
                      }
                    },
                    "required": [
                      "Type",
                      "Amount",
                      "Authenticate"
                    ],
                    "type": "object"
                  }
                }
              },
              "examples": {
                "Cartão de débito completo": {
                  "value": {
                    "Customer": {
                      "Address": {
                        "Street": "Alameda Xingu",
                        "Number": "512",
                        "Complement": "27 andar",
                        "ZipCode": "12345987",
                        "City": "São Paulo",
                        "State": "SP",
                        "Country": "BRA"
                      },
                      "DeliveryAddress": {
                        "Street": "Alameda Xingu",
                        "Complement": "27 andar",
                        "ZipCode": "12345987",
                        "City": "São Paulo",
                        "State": "SP",
                        "Country": "BRA"
                      },
                      "Billing": {
                        "Street": "Alameda Xingu",
                        "Number": "512",
                        "Complement": "27 andar",
                        "Neighborhood": "Alphaville",
                        "City": "Barueri",
                        "State": "SP",
                        "Country": "BR",
                        "ZipCode": "123456789"
                      },
                      "Name": "Aline de Souza",
                      "Identity": "12345678909",
                      "IdentityType": "CPF",
                      "Email": "alinedesouza@email.com.br",
                      "Birthdate": "1990-01-01"
                    },
                    "Payment": {
                      "Type": "DebitCard",
                      "Authenticate": true,
                      "IssuerTransactionId": "580027442382078",
                      "DebitCard": {
                        "CardOnFile": {
                          "Usage": "Used"
                        },
                        "CardNumber": "5200000000002151",
                        "Holder": "Aline De Souza",
                        "ExpirationDate": "03/2031",
                        "SecurityCode": "079",
                        "Brand": "Master"
                      },
                      "InitiatedTransactionIndicator": {
                        "Category": "C1",
                        "Subcategory": "Standingorder"
                      },
                      "ExternalAuthentication": {
                        "Eci": 5,
                        "Cavv": "AAABB2gHA1B5EFNjWQcDAAAAAAB=",
                        "ReferenceID": "a24a5d87-b1a1-4aef-a37b-2f30b91274e6",
                        "Xid": "Uk5ZanBHcWw2RjRCbEN5dGtiMTB=",
                        "Version": "2.2.0"
                      },
                      "Amount": 15700,
                      "SoftDescriptor": "LojaTeste",
                      "Tip": false,
                      "IsCryptocurrencyNegotiation": false
                    },
                    "MerchantOrderId": "202301131052"
                  },
                  "summary": "Cartão de débito completo"
                },
                "Cartão de débito simplificado com autenticação 3DS": {
                  "summary": "Cartão de débito simplificado com autenticação 3DS",
                  "value": {
                    "Customer": {
                      "Name": "Aline de Souza",
                      "Identity": "12345678909",
                      "IdentityType": "CPF",
                      "Email": "alinedesouza@email.com.br",
                      "Birthdate": "1990-01-01"
                    },
                    "Payment": {
                      "Type": "DebitCard",
                      "Authenticate": true,
                      "DebitCard": {
                        "CardNumber": "4000000000002024",
                        "Holder": "Aline de Souza",
                        "ExpirationDate": "12/2035",
                        "SecurityCode": "333",
                        "Brand": "Visa"
                      },
                      "ExternalAuthentication": {
                        "Cavv": "AAABB2gHA1B5EFNjWQcDAAAAAAB=",
                        "ReferenceID": "a24a5d87-b1a1-4aef-a37b-2f30b91274e6",
                        "Eci": 5,
                        "Xid": "Uk5ZanBHcWw2RjRCbEN5dGtiMTB=",
                        "Version": "2.2.0"
                      },
                      "Amount": 15700,
                      "SoftDescriptor": "LojaTeste",
                      "Tip": false,
                      "IsCryptocurrencyNegotiation": false
                    },
                    "MerchantOrderId": "202301131052"
                  }
                },
                "Cartão de débito com autenticação Data Only": {
                  "summary": "Cartão de débito com autenticação Data Only",
                  "value": {
                    "Customer": {
                      "Name": "Aline de Souza",
                      "Identity": "12345678909",
                      "IdentityType": "CPF",
                      "Email": "alinedesouza@email.com.br",
                      "Birthdate": "1990-01-01"
                    },
                    "Payment": {
                      "Type": "DebitCard",
                      "Authenticate": false,
                      "DebitCard": {
                        "CardNumber": "4000000000002024",
                        "Holder": "Aline de Souza",
                        "ExpirationDate": "12/2035",
                        "SecurityCode": "333",
                        "Brand": "Visa"
                      },
                      "ExternalAuthentication": {
                        "Cavv": "AAABB2gHA1B5EFNjWQcDAAAAAAB=",
                        "ReferenceID": "a24a5d87-b1a1-4aef-a37b-2f30b91274e6",
                        "Eci": 5,
                        "Xid": "Uk5ZanBHcWw2RjRCbEN5dGtiMTB=",
                        "Version": "2.2.0",
                        "DataOnly": true
                      },
                      "Amount": 15700,
                      "SoftDescriptor": "LojaTeste"
                    },
                    "MerchantOrderId": "202301131052"
                  }
                },
                "Cartão de débito com Card On File": {
                  "summary": "Cartão de débito com Card On File",
                  "value": {
                    "Customer": {
                      "Name": "Aline de Souza",
                      "Identity": "12345678909",
                      "IdentityType": "CPF",
                      "Email": "alinedesouza@email.com.br",
                      "Birthdate": "1990-01-01"
                    },
                    "Payment": {
                      "Type": "DebitCard",
                      "Authenticate": true,
                      "DebitCard": {
                        "CardOnFile": {
                          "Usage": "Used"
                        },
                        "CardNumber": "4000000000002024",
                        "Holder": "Aline de Souza",
                        "ExpirationDate": "12/2035",
                        "SecurityCode": "333",
                        "Brand": "Visa"
                      },
                      "ExternalAuthentication": {
                        "Cavv": "AAABB2gHA1B5EFNjWQcDAAAAAAB=",
                        "ReferenceID": "a24a5d87-b1a1-4aef-a37b-2f30b91274e6",
                        "Eci": 5,
                        "Xid": "Uk5ZanBHcWw2RjRCbEN5dGtiMTB=",
                        "Version": "2.2.0"
                      },
                      "Amount": 15700,
                      "SoftDescriptor": "LojaTeste"
                    },
                    "MerchantOrderId": "202301131052"
                  }
                },
                "Cartão de débito com Indicador de Início da Transação": {
                  "summary": "Cartão de débito com Indicador de Início da Transação",
                  "value": {
                    "Customer": {
                      "Name": "Aline de Souza",
                      "Identity": "12345678909",
                      "IdentityType": "CPF",
                      "Email": "alinedesouza@email.com.br",
                      "Birthdate": "1990-01-01"
                    },
                    "Payment": {
                      "Type": "DebitCard",
                      "Authenticate": true,
                      "DebitCard": {
                        "CardNumber": "5200000000002151",
                        "Holder": "Aline De Souza",
                        "ExpirationDate": "03/2031",
                        "SecurityCode": "079",
                        "Brand": "Master"
                      },
                      "InitiatedTransactionIndicator": {
                        "Category": "C1",
                        "Subcategory": "StandingOrder"
                      },
                      "ExternalAuthentication": {
                        "Cavv": "AAABB2gHA1B5EFNjWQcDAAAAAAB=",
                        "ReferenceID": "a24a5d87-b1a1-4aef-a37b-2f30b91274e6",
                        "Eci": 5,
                        "Xid": "Uk5ZanBHcWw2RjRCbEN5dGtiMTB=",
                        "Version": "2.2.0"
                      },
                      "Amount": 15700,
                      "SoftDescriptor": "LojaTeste"
                    },
                    "MerchantOrderId": "202301131052"
                  }
                },
                "Elo via Link de Pagamento": {
                  "summary": "Elo via Link de Pagamento",
                  "value": {
                    "Customer": {
                      "Address": {
                        "Street": "Alameda Xingu",
                        "Number": "512",
                        "Complement": "27 andar",
                        "ZipCode": "12345987",
                        "City": "São Paulo",
                        "State": "SP",
                        "Country": "BRA"
                      },
                      "DeliveryAddress": {
                        "Street": "Alameda Xingu",
                        "Complement": "27 andar",
                        "ZipCode": "12345987",
                        "City": "São Paulo",
                        "State": "SP",
                        "Country": "BRA"
                      },
                      "Billing": {
                        "Street": "Alameda Xingu",
                        "Number": "512",
                        "Complement": "27 andar",
                        "Neighborhood": "Alphaville",
                        "City": "Barueri",
                        "State": "SP",
                        "Country": "BR",
                        "ZipCode": "123456789"
                      },
                      "Name": "Aline de Souza",
                      "Identity": "12345678909",
                      "IdentityType": "CPF",
                      "Email": "alinedesouza@email.com.br",
                      "Birthdate": "1990-01-01"
                    },
                    "Payment": {
                      "Type": "DebitCard",
                      "Authenticate": true,
                      "DebitCard": {
                        "CardOnFile": {
                          "Usage": "Used"
                        },
                        "CardNumber": "1234123412341234",
                        "Holder": "Aline De Souza",
                        "ExpirationDate": "12/2030",
                        "SecurityCode": "123",
                        "Brand": "Elo"
                      },
                      "ExternalAuthentication": {
                        "Eci": 5,
                        "Cavv": "AAABB2gHA1B5EFNjWQcDAAAAAAB=",
                        "ReferenceID": "a24a5d87-b1a1-4aef-a37b-2f30b91274e6",
                        "Xid": "Uk5ZanBHcWw2RjRCbEN5dGtiMTB=",
                        "Version": "2.2.0"
                      },
                      "Amount": 15700,
                      "SoftDescriptor": "LojaTeste",
                      "Tip": false,
                      "IsCryptocurrencyNegotiation": false,
                      "SolutionType": "ExternalLinkPay"
                    },
                    "MerchantOrderId": "202301131052"
                  }
                },
                "Envio Mastercard TLID": {
                  "summary": "Envio Mastercard TLID",
                  "value": {
                    "Customer": {
                      "Name": "Aline de Souza",
                      "Identity": "12345678909",
                      "IdentityType": "CPF",
                      "Email": "aline@email.com",
                      "Birthdate": "1990-01-01"
                    },
                    "Payment": {
                      "Type": "DebitCard",
                      "Authenticate": true,
                      "IssuerTransactionId": "580027442382078",
                      "TransactionLinkId": "Xk7pQ2mR-9wLz_4TbN8vCd",
                      "DebitCard": {
                        "CardNumber": "5123450000000000",
                        "Holder": "Aline de Souza",
                        "ExpirationDate": "12/2035",
                        "SecurityCode": "333",
                        "Brand": "Master",
                        "SaveCard": false
                      },
                      "Amount": 15700,
                      "SoftDescriptor": "LojaTeste",
                      "Tip": false,
                      "IsCryptocurrencyNegotiation": false
                    },
                    "MerchantOrderId": "202301131052"
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
                  "Elo via Link de Pagamento": {
                    "value": {
                      "MerchantOrderId": "202301131052",
                      "Customer": {
                        "Name": "Aline de Souza",
                        "Identity": "12345678909",
                        "IdentityType": "CPF",
                        "Email": "alinedesouza@email.com.br",
                        "Birthdate": "1990-01-01",
                        "Address": {
                          "Street": "Alameda Xingu",
                          "Number": "512",
                          "Complement": "27 andar",
                          "ZipCode": "12345987",
                          "City": "São Paulo",
                          "State": "SP",
                          "Country": "BRA",
                          "AddressType": 0
                        },
                        "DeliveryAddress": {
                          "Street": "Alameda Xingu",
                          "Complement": "27 andar",
                          "ZipCode": "12345987",
                          "City": "São Paulo",
                          "State": "SP",
                          "Country": "BRA",
                          "AddressType": 0
                        }
                      },
                      "Payment": {
                        "DebitCard": {
                          "CardNumber": "123412******1234",
                          "Holder": "Aline De Souza",
                          "ExpirationDate": "12/2030",
                          "SaveCard": false,
                          "Brand": "Elo",
                          "CardOnFile": {
                            "Usage": "Used"
                          },
                          "PaymentAccountReference": "0F1SUDQRGNNCIWKGAGXVNQ2KNX2Z1"
                        },
                        "Provider": "Simulado",
                        "AuthorizationCode": "098765",
                        "SoftDescriptor": "LojaTeste",
                        "Tid": "1126102144335",
                        "ProofOfSale": "870203",
                        "Authenticate": true,
                        "Eci": "5",
                        "ExternalAuthentication": {
                          "Cavv": "AAABB2gHA1B5EFNjWQcDAAAAAAB=",
                          "Xid": "Uk5ZanBHcWw2RjRCbEN5dGtiMTB=",
                          "Eci": "5",
                          "Version": "2.2.0",
                          "ReferenceId": "a24a5d87-b1a1-4aef-a37b-2f30b91274e6"
                        },
                        "Recurrent": false,
                        "Tip": false,
                        "SentOrderId": "20251126102144AADE35",
                        "Amount": 15700,
                        "ReceivedDate": "2025-11-26 10:21:44",
                        "CapturedAmount": 15700,
                        "CapturedDate": "2025-11-26 10:21:44",
                        "Status": 2,
                        "IsSplitted": false,
                        "ReturnMessage": "Operation Successful",
                        "ReturnCode": "6",
                        "PaymentId": "b85bc2ba-c322-41ca-ad43-a306bf816b43",
                        "Type": "DebitCard",
                        "Currency": "BRL",
                        "Country": "BRA",
                        "Links": [
                          {
                            "Method": "GET",
                            "Rel": "self",
                            "Href": "https://apiquerysandbox.cieloecommerce.cielo.com.br/1/sales/b85bc2ba-c322-41ca-ad43-a306bf816b43"
                          }
                        ],
                        "IsCryptoCurrencyNegotiation": false,
                        "SolutionType": "ExternalLinkPay"
                      }
                    }
                  },
                  "Cartão de débito completo": {
                    "value": {
                      "MerchantOrderId": "Loja123456",
                      "Customer": {
                        "Name": "Aline de Souza",
                        "Email": "alinedesouza@email.com",
                        "Birthdate": "1990-01-01"
                      },
                      "Payment": {
                        "IssuerTransactionId": "580027442382078",
                        "DebitCard": {
                          "CardNumber": "555187******0181",
                          "Holder": "Teste Holder",
                          "ExpirationDate": "12/2030",
                          "SaveCard": false,
                          "Brand": "Master",
                          "PaymentAccountReference": "IC722LCXBROSHBPIBK7B44MBXO5HF",
                          "CardOnFile": {
                            "Usage": "Used"
                          }
                        },
                        "Provider": "Simulado",
                        "AuthorizationCode": "635288",
                        "Tid": "0826104754051",
                        "SoftDescriptor": "123456789ABCD",
                        "SentOrderId": "2025102214411519ECD0",
                        "ProofOfSale": "132471",
                        "Authenticate": true,
                        "Tip": false,
                        "Eci": "5",
                        "ExternalAuthentication": {
                          "Cavv": "AAABB2gHA1B5EFNjWQcDAAAAAAB=",
                          "Xid": "Uk5ZanBHcWw2RjRCbEN5dGtiMTB=",
                          "Eci": "5",
                          "Version": "2",
                          "ReferenceId": "a24a5d87-b1a1-4aef-a37b-2f30b91274e6"
                        },
                        "Recurrent": false,
                        "Amount": 15700,
                        "ReceivedDate": "2022-08-26 10:47:53",
                        "CapturedAmount": 15700,
                        "CapturedDate": "2022-08-26 10:47:54",
                        "Status": 2,
                        "IsSplitted": false,
                        "ReturnMessage": "Operation Successful",
                        "ReturnCode": "6",
                        "PaymentId": "21c9a3e7-23c2-420b-b12d-b514ef271c85",
                        "Type": "DebitCard",
                        "Currency": "BRL",
                        "Country": "BRA",
                        "Links": [
                          {
                            "Method": "GET",
                            "Rel": "self",
                            "Href": "https://apiquerysandbox.cieloecommerce.cielo.com.br/1/sales/21c9a3e7-23c2-420b-b12d-b514ef271c85"
                          }
                        ]
                      }
                    },
                    "summary": "Cartão de débito completo"
                  },
                  "Cartão de débito simplificado com autenticação 3DS": {
                    "summary": "Cartão de débito simplificado com autenticação 3DS",
                    "value": {
                      "MerchantOrderId": "202301131052",
                      "Customer": {
                        "Name": "Aline de Souza",
                        "Identity": "12345678909",
                        "IdentityType": "CPF",
                        "Email": "alinedesouza@email.com.br",
                        "Birthdate": "1990-01-01"
                      },
                      "Payment": {
                        "DebitCard": {
                          "CardNumber": "400000******2024",
                          "Holder": "Aline de Souza",
                          "ExpirationDate": "12/2035",
                          "SaveCard": false,
                          "Brand": "Visa",
                          "PaymentAccountReference": "GFQE2G6DGPC855JXVHEBG3T5N07V8"
                        },
                        "Provider": "Simulado",
                        "AuthorizationCode": "303200",
                        "SoftDescriptor": "LojaTeste",
                        "Tid": "1125115606575",
                        "ProofOfSale": "417058",
                        "Authenticate": true,
                        "Eci": "5",
                        "ExternalAuthentication": {
                          "Cavv": "AAABB2gHA1B5EFNjWQcDAAAAAAB=",
                          "Xid": "Uk5ZanBHcWw2RjRCbEN5dGtiMTB=",
                          "Eci": "5",
                          "Version": "2.2.0",
                          "ReferenceId": "a24a5d87-b1a1-4aef-a37b-2f30b91274e6"
                        },
                        "Recurrent": false,
                        "Tip": false,
                        "SentOrderId": "20251125115606794B21",
                        "Amount": 15700,
                        "ReceivedDate": "2025-11-25 11:56:06",
                        "CapturedAmount": 15700,
                        "CapturedDate": "2025-11-25 11:56:06",
                        "Status": 2,
                        "IsSplitted": false,
                        "ReturnMessage": "Operation Successful",
                        "ReturnCode": "6",
                        "PaymentId": "5d152eb8-1f63-4ad5-8a87-d80ebd086754",
                        "Type": "DebitCard",
                        "Currency": "BRL",
                        "Country": "BRA",
                        "Links": [
                          {
                            "Method": "GET",
                            "Rel": "self",
                            "Href": "https://apiquerysandbox.cieloecommerce.cielo.com.br/1/sales/5d152eb8-1f63-4ad5-8a87-d80ebd086754"
                          }
                        ],
                        "IsCryptoCurrencyNegotiation": false
                      }
                    }
                  },
                  "Cartão de débito com autenticação Data Only": {
                    "summary": "Cartão de débito com autenticação Data Only",
                    "value": {
                      "MerchantOrderId": "202301131052",
                      "Customer": {
                        "Name": "Aline de Souza",
                        "Identity": "12345678909",
                        "IdentityType": "CPF",
                        "Email": "alinedesouza@email.com.br",
                        "Birthdate": "1990-01-01"
                      },
                      "Payment": {
                        "DebitCard": {
                          "CardNumber": "400000******2024",
                          "Holder": "Aline de Souza",
                          "ExpirationDate": "12/2035",
                          "SaveCard": false,
                          "Brand": "Visa",
                          "PaymentAccountReference": "I9CD04Y5FDL0NYRAJVTLJTQ8CDWV2"
                        },
                        "Provider": "Simulado",
                        "AuthorizationCode": "570014",
                        "SoftDescriptor": "LojaTeste",
                        "Tid": "1125120519387",
                        "ProofOfSale": "401900",
                        "Authenticate": false,
                        "Eci": "5",
                        "ExternalAuthentication": {
                          "Cavv": "AAABB2gHA1B5EFNjWQcDAAAAAAB=",
                          "Xid": "Uk5ZanBHcWw2RjRCbEN5dGtiMTB=",
                          "Eci": "5",
                          "Version": "2.2.0",
                          "ReferenceId": "a24a5d87-b1a1-4aef-a37b-2f30b91274e6",
                          "DataOnly": true
                        },
                        "Recurrent": false,
                        "SentOrderId": "202511251205198EECC9",
                        "Amount": 15700,
                        "ReceivedDate": "2025-11-25 12:05:19",
                        "CapturedAmount": 15700,
                        "CapturedDate": "2025-11-25 12:05:19",
                        "Status": 2,
                        "IsSplitted": false,
                        "ReturnMessage": "Operation Successful",
                        "ReturnCode": "6",
                        "PaymentId": "fc46374a-fcb7-4b24-aed8-fd7119d63cb0",
                        "Type": "DebitCard",
                        "Currency": "BRL",
                        "Country": "BRA",
                        "Links": [
                          {
                            "Method": "GET",
                            "Rel": "self",
                            "Href": "https://apiquerysandbox.cieloecommerce.cielo.com.br/1/sales/fc46374a-fcb7-4b24-aed8-fd7119d63cb0"
                          }
                        ]
                      }
                    }
                  },
                  "Cartão de débito com Card On File": {
                    "summary": "Cartão de débito com Card On File",
                    "value": {
                      "MerchantOrderId": "202301131052",
                      "Customer": {
                        "Name": "Aline de Souza",
                        "Identity": "12345678909",
                        "IdentityType": "CPF",
                        "Email": "alinedesouza@email.com.br",
                        "Birthdate": "1990-01-01"
                      },
                      "Payment": {
                        "DebitCard": {
                          "CardNumber": "400000******2024",
                          "Holder": "Aline de Souza",
                          "ExpirationDate": "12/2035",
                          "SaveCard": false,
                          "Brand": "Visa",
                          "CardOnFile": {
                            "Usage": "Used"
                          },
                          "PaymentAccountReference": "7TLQU6OH0P9WKU0F3VJXNMSD1INDR"
                        },
                        "Provider": "Simulado",
                        "AuthorizationCode": "077634",
                        "SoftDescriptor": "LojaTeste",
                        "Tid": "1125121158117",
                        "ProofOfSale": "196455",
                        "Authenticate": true,
                        "Eci": "5",
                        "ExternalAuthentication": {
                          "Cavv": "AAABB2gHA1B5EFNjWQcDAAAAAAB=",
                          "Xid": "Uk5ZanBHcWw2RjRCbEN5dGtiMTB=",
                          "Eci": "5",
                          "Version": "2.2.0",
                          "ReferenceId": "a24a5d87-b1a1-4aef-a37b-2f30b91274e6"
                        },
                        "Recurrent": false,
                        "SentOrderId": "20251125121158637F5C",
                        "Amount": 15700,
                        "ReceivedDate": "2025-11-25 12:11:58",
                        "CapturedAmount": 15700,
                        "CapturedDate": "2025-11-25 12:11:58",
                        "Status": 2,
                        "IsSplitted": false,
                        "ReturnMessage": "Operation Successful",
                        "ReturnCode": "6",
                        "PaymentId": "6841657f-d5d0-4f34-94e0-ac0a354fef16",
                        "Type": "DebitCard",
                        "Currency": "BRL",
                        "Country": "BRA",
                        "Links": [
                          {
                            "Method": "GET",
                            "Rel": "self",
                            "Href": "https://apiquerysandbox.cieloecommerce.cielo.com.br/1/sales/6841657f-d5d0-4f34-94e0-ac0a354fef16"
                          }
                        ]
                      }
                    }
                  },
                  "Cartão de débito com Indicador de Início da Transação": {
                    "summary": "Cartão de débito com Indicador de Início da Transação",
                    "value": {
                      "MerchantOrderId": "202301131052",
                      "Customer": {
                        "Name": "Aline de Souza",
                        "Identity": "12345678909",
                        "IdentityType": "CPF",
                        "Email": "alinedesouza@email.com.br",
                        "Birthdate": "1990-01-01"
                      },
                      "Payment": {
                        "DebitCard": {
                          "CardNumber": "520000******2151",
                          "Holder": "Aline De Souza",
                          "ExpirationDate": "03/2031",
                          "SaveCard": false,
                          "Brand": "Master",
                          "PaymentAccountReference": "R6V8YAZ2QXNYWMCR86LVQ8RJUMY56"
                        },
                        "Provider": "Simulado",
                        "AuthorizationCode": "956903",
                        "SoftDescriptor": "LojaTeste",
                        "Tid": "1125121551680",
                        "ProofOfSale": "768565",
                        "Authenticate": true,
                        "Eci": "5",
                        "ExternalAuthentication": {
                          "Cavv": "AAABB2gHA1B5EFNjWQcDAAAAAAB=",
                          "Xid": "Uk5ZanBHcWw2RjRCbEN5dGtiMTB=",
                          "Eci": "5",
                          "Version": "2.2.0",
                          "ReferenceId": "a24a5d87-b1a1-4aef-a37b-2f30b91274e6"
                        },
                        "Recurrent": false,
                        "InitiatedTransactionIndicator": {
                          "Category": "C1",
                          "Subcategory": "StandingOrder"
                        },
                        "SentOrderId": "20251125121551514CF5",
                        "Amount": 15700,
                        "ReceivedDate": "2025-11-25 12:15:51",
                        "CapturedAmount": 15700,
                        "CapturedDate": "2025-11-25 12:15:51",
                        "Status": 2,
                        "IsSplitted": false,
                        "ReturnMessage": "Operation Successful",
                        "ReturnCode": "6",
                        "PaymentId": "72c490cd-5ade-48b9-80c6-fa9f82508f52",
                        "Type": "DebitCard",
                        "Currency": "BRL",
                        "Country": "BRA",
                        "Links": [
                          {
                            "Method": "GET",
                            "Rel": "self",
                            "Href": "https://apiquerysandbox.cieloecommerce.cielo.com.br/1/sales/72c490cd-5ade-48b9-80c6-fa9f82508f52"
                          }
                        ]
                      }
                    }
                  },
                  "Retorno Mastercard TLID": {
                    "summary": "Retorno Mastercard TLID",
                    "value": {
                      "MerchantOrderId": "Loja123456",
                      "Customer": {
                        "Name": "Aline de Souza",
                        "Email": "alinedesouza@email.com",
                        "Birthdate": "1990-01-01"
                      },
                      "Payment": {
                        "IssuerTransactionId": "580027442382078",
                        "TransactionLinkId": "aH3nV6qP_2sKe-8YjW1uBf",
                        "SentTransactionLinkId": "Xk7pQ2mR-9wLz_4TbN8vCd",
                        "DebitCard": {
                          "CardNumber": "512345******0000",
                          "Holder": "Teste Holder",
                          "ExpirationDate": "12/2030",
                          "SaveCard": false,
                          "Brand": "Master",
                          "PaymentAccountReference": "IC722LCXBROSHBPIBK7B44MBXO5HF",
                          "CardOnFile": {
                            "Usage": "Used"
                          }
                        },
                        "Provider": "Simulado",
                        "AuthorizationCode": "635288",
                        "Tid": "0826104754051",
                        "SoftDescriptor": "123456789ABCD",
                        "SentOrderId": "2025102214411519ECD0",
                        "ProofOfSale": "132471",
                        "Authenticate": true,
                        "Tip": false,
                        "Eci": "5",
                        "ExternalAuthentication": {
                          "Cavv": "AAABB2gHA1B5EFNjWQcDAAAAAAB=",
                          "Xid": "Uk5ZanBHcWw2RjRCbEN5dGtiMTB=",
                          "Eci": "5",
                          "Version": "2",
                          "ReferenceId": "a24a5d87-b1a1-4aef-a37b-2f30b91274e6"
                        },
                        "Recurrent": false,
                        "Amount": 15700,
                        "ReceivedDate": "2022-08-26 10:47:53",
                        "CapturedAmount": 15700,
                        "CapturedDate": "2022-08-26 10:47:54",
                        "Status": 2,
                        "IsSplitted": false,
                        "ReturnMessage": "Operation Successful",
                        "ReturnCode": "6",
                        "PaymentId": "21c9a3e7-23c2-420b-b12d-b514ef271c85",
                        "Type": "DebitCard",
                        "Currency": "BRL",
                        "Country": "BRA",
                        "Links": [
                          {
                            "Method": "GET",
                            "Rel": "self",
                            "Href": "https://apiquerysandbox.cieloecommerce.cielo.com.br/1/sales/21c9a3e7-23c2-420b-b12d-b514ef271c85"
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