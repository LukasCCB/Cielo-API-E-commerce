---
updatedAt: 2026-10-20T18:47:35.000Z
agentTools:
  siteIndex: https://docs.cielo.com.br/llms.txt
  projectIndex: https://docs.cielo.com.br/ecommerce-cielo/llms.txt
---

# Criar pagamento com cartão de crédito

Cria solicitação de autorização para transação de cartão de crédito.

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

> ⚠️ Identificação de transações oriundas de link de pagamento para cartões da bandeira Elo
>
> A partir de 17 de outubro de 2025 será obrigatório identificar transações oriundas de link de pagamento para cartões da bandeira Elo. Envie o parâmetro `Payment.SolutionType` = "ExternalLinkPay".

<Callout icon="⚠️" theme="warn">
  - Por padrão, a API E-commerce aceita até 12 parcelas para cartão de crédito;
    - Para habilitar até 24 parcelas, é necessário entrar em contato com o Atendimento E-commerce. A habilitação estará sujeita à uma análise interna da Cielo.
</Callout>

<Callout icon="ℹ️" theme="info">
  ### A **captura** da transação da crédito pode ser **automática** ou **posterior**.

  - Para captura automática, envie o campo `Payment.Capture` na requisição como “true”;
  - Para captura posterior, envie o campo como "false" e, posteriormente, faça a [requisição de captura](https://docs.cielo.com.br/ecommerce-cielo/reference/capturar-apos-autorizacao).
</Callout>

<br />

**Atenção**

* Não é possível realizar uma transação com valor (`Amount`) 0. Para verificar a validade de um cartão, use o [Zero Auth](https://docs.cielo.com.br/ecommerce-cielo/docs/zero-auth);
* **Transações de crédito Mastercard com credenciais armazenadas**: a bandeira Mastercard exige o envio do **Indicador de Início da Transação** para compras de **cartão de crédito e débito** que usam os dados armazenados de um cartão. O objetivo é indicar se a transação foi iniciada pelo comprador (Cardholder-Initiated Transaction - CIT) ou pela loja (Merchant-Initiated Transaction - MIT). Nesse cenário é obrigatório o envio do nó `InitiatedTransactionIndicator` com os parâmetros `Category` e `SubCategory` para transações Mastercard, dentro do nó `Payment`. Confira o exemplo do nó e a lista de categorias e subcategorias em [Indicador de início da transação Mastercard](https://docs.cielo.com.br/ecommerce-cielo/page/indicador-de-in%C3%ADcio-da-transa%C3%A7%C3%A3o-cit-e-mit);
* O campo `Payment.ServiceTaxAmount` é exclusivo para companhias aéreas e agências de turismo. Para as companhias aéreas, permite a cobrança da taxa de embarque separadamente do valor da passagem aérea. Já para as agências de turismo, é utilizado especialmente para a cobrança de taxas na primeira parcela;
* O número de identificação do pedido (`MerchantOrderId`) não sofre alteração ao longo do fluxo transacional. Contudo, um novo número (`SentOrderId`) pode ser gerado para o pedido e utilizado durante a transação. Esse número só será diferente se:
  * o valor do `MerchantOrderID` enviado estiver fora do formato esperado pelo campo, ou possuir mais de **20 caracteres**;
  * o `MerchantOrderID` enviado já tiver sido utilizado nas últimas 24 horas.
* Para fins de conciliação, use o `TransactionId` (TID).

<br />

### Autenticação 3DS nas transações de cartão de crédito

* Se a sua loja tem integração com o <a href="https://docs.cielo.com.br/ecommerce-cielo/docs/3ds-sobre" target="_blank">protocolo 3DS</a> para <Glossary>autenticação</Glossary> do <Glossary>portador</Glossary> do cartão, informe os dados recebidos na saída do script no nó `Payment.ExternalAuthentication`;
* Em transações com autenticação 3DS Data Only, é necessário informar o parâmetro `ExternalAuthentication.DataOnly` como *true*;
* Para confirmar se a autenticação foi acatada na autorização, verifique o valor do ECI retornado em `Payment.Eci`. A API replica o ECI informado pela loja no campo `Payment.ExternalAuthentication`. No entanto, o valor efetivamente utilizado pela bandeira na autorização é o que aparece em `Payment.Eci`.

<Callout icon="ℹ️" theme="info">
  ### Importante

  A validação e o retorno do campo `Payment.Eci` ocorrem **apenas no ambiente de produção** neste primeiro momento.
</Callout>

### Visa Intelligent Data Exchange (IDX)

Caso use o serviço de autenticação IDX da Visa, veja [Visa Intelligent Data Exchange (IDX)](https://docs.cielo.com.br/ecommerce-cielo/reference/visa-intelligent-data-exchange-idx).

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

### Resposta da transação de cartão de crédito

A tabela a seguir apresenta os principais parâmetros que podem ser retornados pela API na criação de um pagamento com cartão de crédito.

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

        - Se o `MerchantOrderId` informado estiver fora do formato esperado pelo campo, ou possuir mais de **20 caracteres**, um novo identificador será gerado e retornado no campo `SentOrderId`.
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
        \*\*
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

<br />

<br />

# OpenAPI definition

```json
{
  "openapi": "3.1.0",
  "info": {
    "title": "cartão-de-crédito",
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
        "summary": "Criar pagamento com cartão de crédito",
        "description": "Cria solicitação de autorização para transação de cartão de crédito.",
        "operationId": "criar-pagamento-credito",
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
                        "default": "CreditCard"
                      },
                      "Amount": {
                        "type": "integer",
                        "description": "Valor do pedido (ser enviado em centavos). Tamanho: 15.",
                        "format": "int32"
                      },
                      "Currency": {
                        "type": "string",
                        "description": "Moeda na qual o pagamento será feito (BRL). Tamanho: 3."
                      },
                      "Country": {
                        "type": "string",
                        "description": "País na qual o pagamento será feito. Tamanho: 3."
                      },
                      "Provider": {
                        "type": "string",
                        "description": "Define comportamento do meio de pagamento. Valor possível: Cielo. Não é obrigatório para crédito. Tamanho: 15."
                      },
                      "ServiceTaxAmount": {
                        "type": "integer",
                        "description": "Aplicável apenas para empresas aéreas e agências de turismo. Montante do valor da autorização que deve ser destinado à taxa de serviço. O valor do ` ServiceTaxAmount ` será liquidado integralmente junto com o valor da primeira parcela. Tamanho: 15.",
                        "format": "int32"
                      },
                      "SoftDescriptor": {
                        "type": "string",
                        "description": "O complemento do nome da loja que aparecerá na fatura do cartão. Não permite caracteres especiais. Tamanho: 13."
                      },
                      "Installments": {
                        "type": "integer",
                        "description": "Número de parcelas. Se a transação for uma recorrência, o número de parcelas será 1. Para transações parceladas, o número de parcelas será sempre maior que 1.<br> _Saiba quais bandeiras permitem parcelamento em_ <a href=\"https://docs.cielo.com.br/ecommerce-cielo/docs/cartao-credito#bandeiras-aceitas\" target=\"_blank\">_bandeiras aceitas._</a> Tamanho: 2. <br>*No caso de parcelamento pela loja (ByMerchant), o valor mínimo da parcela precisa ser de R$5,00 (cinco reais) conforme o <a href=\"https://www.cielo.com.br/contrato-de-credenciamento/ \" target=\"_blank\">Contrato de Credenciamento da Cielo</a>*.",
                        "format": "int32"
                      },
                      "Interest": {
                        "type": "string",
                        "description": "Tipo de parcelamento, válido para cartões emitidos no Brasil. Valores possíveis:<br>-\"ByMerchant\" (parcelado pela loja)<br>ou<br> -\"ByIssuer\" (parcelado pelo emissor).<br><br>No caso de parcelamento pela loja (ByMerchant), o valor mínimo da parcela precisa ser de R$5,00 (cinco reais) conforme o <a href=\"https://www.cielo.com.br/contrato-de-credenciamento/\" target=\"_blank\">Contrato de Credenciamento da Cielo</a>.<br>Tamanho: 10."
                      },
                      "Capture": {
                        "type": "boolean",
                        "description": "Booleano que identifica se a autorização deve ser com **captura automática (\"true\")** ou **[captura posterior](https://docs.cielo.com.br/ecommerce-cielo/docs/captura) (\"false\")**."
                      },
                      "Authenticate": {
                        "type": "boolean",
                        "description": "Indica se a transação foi autenticada via 3DS antes da autorização"
                      },
                      "Recurrent": {
                        "type": "boolean",
                        "description": "**Condicional**. Indica se a transação é do tipo recorrente (“true”) ou não (“false”). O valor “true” não originará uma nova recorrência, apenas permitirá a realização de uma transação sem a necessidade de envio do CVV. Authenticate deve ser “false” quando Recurrent é “true”. Saiba mais sobre [Recorrência](https://developercielo.github.io/manual/cielo-ecommerce#recorr%C3%AAncia)."
                      },
                      "IsCryptocurrencyNegociation": {
                        "type": "boolean",
                        "description": "Deve ser enviado com valor “true” caso se trate de uma transação de compra ou venda de Criptomoeda.",
                        "default": false
                      },
                      "AirlineData": {
                        "properties": {
                          "TicketNumber": {
                            "type": "string",
                            "description": "Número do principal bilhete aéreo da transação. Tamanho: 13."
                          }
                        },
                        "required": [],
                        "type": "object"
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
                          "SaveCard": {
                            "type": "boolean",
                            "description": "Booleano que identifica se o cartão será salvo para gerar o `CardToken`. Saiba mais sobre [Tokenização](https://developercielo.github.io/manual/cielo-ecommerce#tokeniza%C3%A7%C3%A3o-de-cart%C3%B5es)."
                          },
                          "Brand": {
                            "type": "string",
                            "description": "Bandeira do cartão. Valores possíveis: Visa / Master / Amex / Elo / Aura / JCB / Diners / Discover. Tamanho: 10."
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
                            "description": "**Obrigatório apenas para bandeira Mastercard**. Categoria do indicador de início da transação. Válido apenas para bandeira Mastercard.<br>Valores possíveis:<br>- “C1”: transação inciada pelo portador do cartão;<br>- “M1”: transação recorrente ou parcelada iniciada pela loja;<br>- “M2”: transação iniciada pela loja."
                          },
                          "Subcategory": {
                            "type": "string",
                            "description": "**Obrigatório apenas para bandeira Mastercard**. Subcategoria do indicador. Válido apenas para bandeira Mastercard.<br>Valores possíveis:<br>Se `InitiatedTransactionIndicator.Category` = \"C1\" ou \"M1\"<br>*CredentialsOnFile*<br>*StandingOrder*<br>*Subscription*<br>*Installment*<br>Se `InitiatedTransactionIndicator.Category` = \"M2\"<br>*PartialShipment*<br>*RelatedOrDelayedCharge*<br>*NoShow*<br>*Resubmission*<br>Consulte a tabela com a descrição das subcategorias em [Indicador de início da transação](https://docs.cielo.com.br/ecommerce-cielo/page/indicador-de-in%C3%ADcio-da-transa%C3%A7%C3%A3o-cit-e-mit)."
                          }
                        },
                        "required": [],
                        "type": "object"
                      },
                      "Tip": {
                        "type": "boolean",
                        "description": "As gorjetas são um tipo de transação que funcionam para cartão de crédito ou débito, tokenizados ou não. Se o valor for \"true\", a transação é identificada como gorjeta, caso contrário, o valor deverá ser \"false\"."
                      },
                      "ExternalAuthentication": {
                        "properties": {
                          "Eci": {
                            "type": "integer",
                            "description": "Electronic Commerce Indicator retornado no processo de autenticação.<br>Caso use o **serviço IDX da Visa**, envie o campo com valor \"7\", indicando autenticação externa. Tamanho: 2.",
                            "format": "int32"
                          },
                          "ReferenceId": {
                            "type": "string",
                            "description": "RequestID retornado no processo de autenticação.<br>- _O `ReferenceId` não é retornado em todas as autenticações._<br>- _O envio é recomendado caso o `ReferenceId` tenha sido retornado no script._ Tamanho: 36."
                          },
                          "Cavv": {
                            "type": "string",
                            "description": "Assinatura retornada nos cenários de sucesso na autenticação.<br>**⚠️Este campo é obrigatório para transações que foram autenticadas pelo emissor ou pela bandeira e nas solicitações de autorizações com Data Only.**<br>Caso use o **serviço IDX da Visa**, envie aqui sua chave IDX."
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
                        "required": [],
                        "type": "object"
                      },
                      "SolutionType": {
                        "type": "string",
                        "description": "Origem do pagamento. **Obrigatório para transação de cartão da bandeira Elo oriunda de link de pagamento**. <br>Enviar como *\"ExternalLinkPay\"*. <br>Tamanho: 15."
                      },
                      "DigitalAsset": {
                        "type": "string",
                        "description": "Indicador de transação de compra ou venda de **NFTs**, **criptomoedas** e **moedas estáveis**. <br>Valores possíveis: <br/> **Visa**: \"Cryptocurrency\" ou \"NFT\";<br/>**Mastercard**: \"Cryptocurrency\" ou \"Stablecoin\"."
                      },
                      "IssuerTransactionId": {
                        "type": "string",
                        "description": "Identificador da transação gerado pela bandeira, retornado na transação CIT ou no Zero Auth. Envie nas transações MIT recorrentes, incrementais e reautorizadas. **Envio obrigatório** para as bandeiras Visa, Mastercard, Elo e Amex. Tamanho: 30."
                      },
                      "TransactionLinkId": {
                        "type": "string",
                        "description": "Identificador único gerado pela bandeira Mastercard (TLID), usado para vincular a transação CIT a transações MIT subsequentes relacionadas, como recorrências, parcelas futuras, cobranças pós-autorizadas e pagamentos com cartão salvo (card-on-file). Envie o valor original, junto com o `IssuerTransactionId`: os dois são obrigatórios na Mastercard, e o envio do `TransactionLinkId` é obrigatório a partir de 23/10/2026. Tamanho: 22.\nFormato: 22 caracteres alfanuméricos (A-Z, a-z, com diferenciação entre maiúsculas e minúsculas), podendo incluir hífen (-) e underscore (_)."
                      },
                      "OriginalRecurrentAmount": {
                        "type": "integer",
                        "description": "Valor da transação original (primeira do ciclo), em centavos. **Obrigatório na recorrência própria**, junto com o `IssuerTransactionId` e, na Mastercard, o `TransactionLinkId`. Tamanho: 15."
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
                "Cartão de crédito completo": {
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
                        "City": "São Paulo",
                        "State": "SP",
                        "Country": "BR",
                        "ZipCode": "12345987"
                      },
                      "Name": "Aline de Souza",
                      "Identity": "12345678909",
                      "IdentityType": "CPF",
                      "Email": "aline@email.com",
                      "Birthdate": "1990-01-01"
                    },
                    "Payment": {
                      "Type": "CreditCard",
                      "IsCryptocurrencyNegociation": false,
                      "IssuerTransactionId": "580027442382078",
                      "CreditCard": {
                        "CardOnFile": {
                          "Usage": "Used"
                        },
                        "CardNumber": "5371542802050634",
                        "Holder": "Aline de Souza",
                        "ExpirationDate": "07/2027",
                        "SecurityCode": "574",
                        "SaveCard": false,
                        "Brand": "Master"
                      },
                      "InitiatedTransactionIndicator": {
                        "Category": "C1",
                        "Subcategory": "Standingorder"
                      },
                      "Amount": 10000,
                      "Currency": "BRL",
                      "Country": "BRA",
                      "SoftDescriptor": "LojaTeste",
                      "Installments": 1,
                      "Capture": true,
                      "Authenticate": false,
                      "Recurrent": false,
                      "Tip": false
                    },
                    "MerchantOrderId": "2017051001"
                  },
                  "summary": "Cartão de crédito completo"
                },
                "Elo via Link de Pagamento": {
                  "value": {
                    "MerchantOrderId": "Loja123456",
                    "Customer": {
                      "Name": "Aline de Souza",
                      "Email": "aline@email.com",
                      "Birthdate": "1991-01-02",
                      "Address": {
                        "Street": "Rua Teste",
                        "Number": "123",
                        "Complement": "AP 123",
                        "ZipCode": "12345987",
                        "City": "Rio de Janeiro",
                        "State": "RJ",
                        "Country": "BRA"
                      },
                      "DeliveryAddress": {
                        "Street": "Rua Teste",
                        "Number": "123",
                        "Complement": "AP 123",
                        "ZipCode": "12345987",
                        "City": "Rio de Janeiro",
                        "State": "RJ",
                        "Country": "BRA"
                      },
                      "Billing": {
                        "Street": "Rua Neturno",
                        "Number": "12345",
                        "Complement": "Sala 123",
                        "Neighborhood": "Centro",
                        "City": "Rio de Janeiro",
                        "State": "RJ",
                        "Country": "BR",
                        "ZipCode": "20080123"
                      }
                    },
                    "Payment": {
                      "Currency": "BRL",
                      "Country": "BRA",
                      "ServiceTaxAmount": 0,
                      "Installments": 1,
                      "Interest": "ByMerchant",
                      "Capture": true,
                      "Authenticate": "false",
                      "Recurrent": "false",
                      "SoftDescriptor": "123456789ABCD",
                      "Tip": false,
                      "CreditCard": {
                        "CardNumber": "1234123412341234",
                        "Holder": "Aline de Souza",
                        "ExpirationDate": "12/2030",
                        "SecurityCode": "123",
                        "SaveCard": "false",
                        "Brand": "Elo",
                        "CardOnFile": {
                          "Usage": "Used"
                        }
                      },
                      "IsCryptoCurrencyNegotiation": false,
                      "SolutionType": "ExternalLinkPay",
                      "Type": "CreditCard",
                      "Amount": 15700,
                      "AirlineData": {
                        "TicketNumber": ""
                      }
                    }
                  }
                },
                "Cartão de crédito simplificado": {
                  "summary": "Cartão de crédito simplificado",
                  "value": {
                    "Customer": {
                      "Name": "Aline de Souza",
                      "Identity": "12345678909",
                      "IdentityType": "CPF",
                      "Email": "aline@email.com",
                      "Birthdate": "1990-01-01"
                    },
                    "Payment": {
                      "Type": "CreditCard",
                      "IsCryptocurrencyNegociation": false,
                      "IssuerTransactionId": "580027442382078",
                      "CreditCard": {
                        "CardNumber": "4091688625337641",
                        "Holder": "Aline de Souza",
                        "ExpirationDate": "12/2035",
                        "SecurityCode": "333",
                        "Brand": "Visa",
                        "SaveCard": false
                      },
                      "Amount": 10000,
                      "Currency": "BRL",
                      "Country": "BRA",
                      "SoftDescriptor": "LojaTeste",
                      "Installments": 1,
                      "Interest": "ByMerchant",
                      "Capture": true,
                      "Authenticate": false,
                      "Recurrent": false
                    },
                    "MerchantOrderId": "2017051001"
                  }
                },
                "Cartão de crédito com autenticação 3DS": {
                  "summary": "Cartão de crédito com autenticação 3DS",
                  "value": {
                    "Customer": {
                      "Name": "Aline de Souza",
                      "Identity": "12345678909",
                      "IdentityType": "CPF",
                      "Email": "aline@email.com",
                      "Birthdate": "1990-01-01"
                    },
                    "Payment": {
                      "Type": "CreditCard",
                      "IsCryptocurrencyNegociation": false,
                      "CreditCard": {
                        "CardNumber": "4091688625337641",
                        "Holder": "Aline de Souza",
                        "ExpirationDate": "12/2035",
                        "SecurityCode": "333",
                        "Brand": "Visa",
                        "SaveCard": false
                      },
                      "ExternalAuthentication": {
                        "Eci": 5,
                        "Cavv": "AAABB2gHA1B5EFNjWQcDAAAAAAB=",
                        "Xid": "Uk5ZanBHcWw2RjRCbEN5dGtiMTB=",
                        "Version": "2.2.0"
                      },
                      "Amount": 10000,
                      "Currency": "BRL",
                      "Country": "BRA",
                      "SoftDescriptor": "LojaAline",
                      "Installments": 1,
                      "Interest": "ByMerchant",
                      "Capture": true,
                      "Authenticate": true,
                      "Recurrent": false
                    },
                    "MerchantOrderId": "2017051001"
                  }
                },
                "Cartão de crédito com autenticação Data Only": {
                  "summary": "Cartão de crédito com autenticação Data Only",
                  "value": {
                    "Customer": {
                      "Name": "Aline de Souza",
                      "Identity": "12345678909",
                      "IdentityType": "CPF",
                      "Email": "aline@email.com",
                      "Birthdate": "1990-01-01"
                    },
                    "Payment": {
                      "Type": "CreditCard",
                      "IsCryptocurrencyNegociation": false,
                      "CreditCard": {
                        "CardNumber": "4091688625337641",
                        "Holder": "Aline de Souza",
                        "ExpirationDate": "12/2035",
                        "SecurityCode": "333",
                        "Brand": "Visa",
                        "SaveCard": false
                      },
                      "ExternalAuthentication": {
                        "Eci": 5,
                        "Cavv": "AAABB2gHA1B5EFNjWQcDAAAAAAB=",
                        "Xid": "Uk5ZanBHcWw2RjRCbEN5dGtiMTB=",
                        "Version": "2.2.0",
                        "DataOnly": true
                      },
                      "Amount": 10000,
                      "Currency": "BRL",
                      "Country": "BRA",
                      "SoftDescriptor": "LojaTeste",
                      "Installments": 1,
                      "Interest": "ByMerchant",
                      "Capture": true,
                      "Authenticate": false,
                      "Recurrent": false
                    },
                    "MerchantOrderId": "2017051001"
                  }
                },
                "Cartão de crédito com Card On File": {
                  "summary": "Cartão de crédito com Card On File",
                  "value": {
                    "Customer": {
                      "Name": "Aline de Souza",
                      "Identity": "12345678909",
                      "IdentityType": "CPF",
                      "Email": "aline@email.com",
                      "Birthdate": "1990-01-01"
                    },
                    "Payment": {
                      "Type": "CreditCard",
                      "IsCryptocurrencyNegociation": false,
                      "CreditCard": {
                        "CardOnFile": {
                          "Usage": "Used"
                        },
                        "CardNumber": "4091688625337641",
                        "Holder": "Aline de Souza",
                        "ExpirationDate": "12/2035",
                        "SecurityCode": "333",
                        "Brand": "Visa",
                        "SaveCard": false
                      },
                      "Amount": 10000,
                      "Currency": "BRL",
                      "Country": "BRA",
                      "SoftDescriptor": "LojaTeste",
                      "Installments": 1,
                      "Interest": "ByMerchant",
                      "Capture": true,
                      "Authenticate": false,
                      "Recurrent": false
                    },
                    "MerchantOrderId": "2017051001"
                  }
                },
                "Cartão de crédito para cias aéras e agências de turismo": {
                  "summary": "Cartão de crédito para cias aéras e agências de turismo",
                  "value": {
                    "Customer": {
                      "Name": "Aline de Souza",
                      "Identity": "12345678909",
                      "IdentityType": "CPF",
                      "Email": "aline@email.com",
                      "Birthdate": "1990-01-01"
                    },
                    "Payment": {
                      "Type": "CreditCard",
                      "IsCryptocurrencyNegociation": false,
                      "AirlineData": {
                        "TicketNumber": "AR988983"
                      },
                      "CreditCard": {
                        "CardNumber": "4091688625337641",
                        "Holder": "Aline de Souza",
                        "ExpirationDate": "12/2035",
                        "SecurityCode": "333",
                        "Brand": "Visa",
                        "SaveCard": false
                      },
                      "Amount": 10000,
                      "Currency": "BRL",
                      "Country": "BRA",
                      "SoftDescriptor": "LojaTeste",
                      "Installments": 2,
                      "Interest": "ByMerchant",
                      "Capture": true,
                      "Authenticate": false,
                      "Recurrent": false,
                      "ServiceTaxAmount": 1000
                    },
                    "MerchantOrderId": "2017051001"
                  }
                },
                "Cartão de crédito com Indicador de Início da Transação": {
                  "summary": "Cartão de crédito com Indicador de Início da Transação",
                  "value": {
                    "Customer": {
                      "Name": "Aline de Souza",
                      "Identity": "12345678909",
                      "IdentityType": "CPF",
                      "Email": "aline@email.com",
                      "Birthdate": "1990-01-01"
                    },
                    "Payment": {
                      "Type": "CreditCard",
                      "IsCryptocurrencyNegociation": false,
                      "CreditCard": {
                        "CardNumber": "5371542802050634",
                        "Holder": "Aline de Souza",
                        "ExpirationDate": "07/2027",
                        "SecurityCode": "574",
                        "Brand": "Master",
                        "SaveCard": false
                      },
                      "InitiatedTransactionIndicator": {
                        "Category": "C1",
                        "Subcategory": "StandingOrder"
                      },
                      "Amount": 10000,
                      "Currency": "BRL",
                      "Country": "BRA",
                      "SoftDescriptor": "LojaTeste",
                      "Installments": 1,
                      "Interest": "ByMerchant",
                      "Capture": true,
                      "Authenticate": false,
                      "Recurrent": false
                    },
                    "MerchantOrderId": "2017051001"
                  }
                },
                "Cartão de crédito com Visa IDX": {
                  "summary": "Cartão de crédito com Visa IDX",
                  "value": {
                    "Customer": {
                      "Name": "Aline de Souza",
                      "Identity": "12345678909",
                      "IdentityType": "CPF",
                      "Email": "aline@email.com",
                      "Birthdate": "1990-01-01"
                    },
                    "Payment": {
                      "Type": "CreditCard",
                      "IsCryptocurrencyNegociation": false,
                      "CreditCard": {
                        "CardNumber": "4091688625337641",
                        "Holder": "Aline de Souza",
                        "ExpirationDate": "12/2035",
                        "SecurityCode": "333",
                        "Brand": "Visa",
                        "SaveCard": false
                      },
                      "ExternalAuthentication": {
                        "Eci": 7,
                        "Cavv": "chaveIDX"
                      },
                      "Amount": 10000,
                      "Currency": "BRL",
                      "Country": "BRA",
                      "SoftDescriptor": "LojaTeste",
                      "Installments": 1,
                      "Interest": "ByMerchant",
                      "Capture": true,
                      "Authenticate": false,
                      "Recurrent": false
                    },
                    "MerchantOrderId": "2017051001"
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
                      "Type": "CreditCard",
                      "IsCryptocurrencyNegociation": false,
                      "IssuerTransactionId": "580027442382078",
                      "TransactionLinkId": "Xk7pQ2mR-9wLz_4TbN8vCd",
                      "CreditCard": {
                        "CardNumber": "5123450000000000",
                        "Holder": "Aline de Souza",
                        "ExpirationDate": "12/2035",
                        "SecurityCode": "333",
                        "Brand": "Master",
                        "SaveCard": false
                      },
                      "Amount": 10000,
                      "Currency": "BRL",
                      "Country": "BRA",
                      "SoftDescriptor": "LojaTeste",
                      "Installments": 1,
                      "Interest": "ByMerchant",
                      "Capture": true,
                      "Authenticate": false,
                      "Recurrent": false
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
                  "Elo via Link de Pagamento": {
                    "value": "{\n  \"MerchantOrderId\": \"Loja123456\",\n  \"Customer\": {\n    \"Name\": \"Aline de Souza\",\n    \"Identity\": \"11225468954\",\n    \"IdentityType\": \"CPF\",\n    \"Email\": \"aline@email.com\",\n    \"Birthdate\": \"1991-01-02\",\n    \"Address\": {\n      \"Street\": \"Rua Teste\",\n      \"Number\": \"123\",\n      \"Complement\": \"AP 123\",\n      \"ZipCode\": \"12345987\",\n      \"City\": \"Rio de Janeiro\",\n      \"State\": \"RJ\",\n      \"Country\": \"BRA\"\n    },\n    \"DeliveryAddress\": {\n      \"Street\": \"Rua Teste\",\n      \"Number\": \"123\",\n      \"Complement\": \"AP 123\",\n      \"ZipCode\": \"12345987\",\n      \"City\": \"Rio de Janeiro\",\n      \"State\": \"RJ\",\n      \"Country\": \"BRA\"\n    },\n    \"Billing\": {\n      \"Street\": \"Rua Neturno\",\n      \"Number\": \"12345\",\n      \"Complement\": \"Sala 123\",\n      \"Neighborhood\": \"Centro\",\n      \"City\": \"Rio de Janeiro\",\n      \"State\": \"RJ\",\n      \"Country\": \"BR\",\n      \"ZipCode\": \"20080123\"\n    }\n  },\n  \"Payment\": {\n    \"ServiceTaxAmount\": 0,\n    \"Installments\": 1,\n    \"Interest\": \"ByMerchant\",\n    \"Capture\": true,\n    \"Authenticate\": false,\n    \"Tip\": false,\n    \"CreditCard\": {\n      \"CardNumber\": \"455187******0183\",\n      \"Holder\": \"Teste Holder\",\n      \"ExpirationDate\": \"12/2030\",\n      \"SaveCard\": false,\n      \"Brand\": \"Elo\",\n      \"PaymentAccountReference\": \"92745135160550440006111072222\",\n      \"CardOnFile\": {\n        \"Usage\": \"Used\"\n      }\n    },\n    \"IsCryptoCurrencyNegotiation\": true,\n    \"TryAutomaticCancellation\": true,\n    \"ProofOfSale\": \"674532\",\n    \"Tid\": \"0305020554239\",\n    \"AuthorizationCode\": \"123456\",\n    \"SoftDescriptor\": \"123456789ABCD\",\n    \"PaymentId\": \"24bc8366-fc31-4d6c-8555-17049a836a07\",\n    \"Type\": \"CreditCard\",\n    \"Amount\": 15700,\n    \"CapturedAmount\": 15700,\n    \"Country\": \"BRA\",\n    \"SolutionType\": \"ExternalLinkPay\"\n    \"AirlineData\": {\n      \"TicketNumber\": \"AR988983\"\n    },\n    \"ExtraDataCollection\": [],\n    \"Status\": 2,\n    \"ReturnCode\": \"6\",\n    \"ReturnMessage\": \"Operation Successful\",\n    \"Links\": [\n      {\n        \"Method\": \"GET\",\n        \"Rel\": \"self\",\n        \"Href\": \"https://apiquerysandbox.cieloecommerce.cielo.com.br/1/sales/{PaymentId}\"\n      },\n      {\n        \"Method\": \"PUT\",\n        \"Rel\": \"void\",\n        \"Href\": \"https://apisandbox.cieloecommerce.cielo.com.br/1/sales/{PaymentId}/void\"\n      }\n    ]\n  }\n}"
                  },
                  "Cartão de crédito com autenticação 3DS": {
                    "summary": "Cartão de crédito com autenticação 3DS",
                    "value": {
                      "MerchantOrderId": "2017051001",
                      "Customer": {
                        "Name": "Aline de Souza",
                        "Identity": "12345678909",
                        "IdentityType": "CPF",
                        "Email": "aline@email.com",
                        "Birthdate": "1990-01-01"
                      },
                      "Payment": {
                        "ServiceTaxAmount": 0,
                        "Installments": 1,
                        "Interest": 0,
                        "Capture": true,
                        "Authenticate": true,
                        "Recurrent": false,
                        "CreditCard": {
                          "CardNumber": "409168******7641",
                          "Holder": "Aline de Souza",
                          "ExpirationDate": "12/2035",
                          "SaveCard": false,
                          "Brand": "Visa",
                          "PaymentAccountReference": "6XPS4SU5B3OLK4WKNAX3IB9ESK678"
                        },
                        "Tid": "1124051533914",
                        "ProofOfSale": "212180",
                        "AuthorizationCode": "172135",
                        "SoftDescriptor": "LojaAline",
                        "Provider": "Simulado",
                        "Eci": "5",
                        "ExternalAuthentication": {
                          "Cavv": "AAABB2gHA1B5EFNjWQcDAAAAAAB=",
                          "Xid": "Uk5ZanBHcWw2RjRCbEN5dGtiMTB=",
                          "Eci": "5",
                          "Version": "2.2.0"
                        },
                        "IsQrCode": false,
                        "SentOrderId": "2025112417153321BD39",
                        "Amount": 10000,
                        "ReceivedDate": "2025-11-24 17:15:33",
                        "CapturedAmount": 10000,
                        "CapturedDate": "2025-11-24 17:15:33",
                        "Status": 2,
                        "IsSplitted": false,
                        "ReturnMessage": "Operation Successful",
                        "ReturnCode": "6",
                        "PaymentId": "2fee214f-5b35-4eef-bf9a-f34a48b664d1",
                        "Type": "CreditCard",
                        "Currency": "BRL",
                        "Country": "BRA",
                        "Links": [
                          {
                            "Method": "GET",
                            "Rel": "self",
                            "Href": "https://apiquerysandbox.cieloecommerce.cielo.com.br/1/sales/2fee214f-5b35-4eef-bf9a-f34a48b664d1"
                          },
                          {
                            "Method": "PUT",
                            "Rel": "void",
                            "Href": "https://apisandbox.cieloecommerce.cielo.com.br/1/sales/2fee214f-5b35-4eef-bf9a-f34a48b664d1/void"
                          }
                        ]
                      }
                    }
                  },
                  "Cartão de crédito com autenticação Data Only": {
                    "summary": "Cartão de crédito com autenticação Data Only",
                    "value": {
                      "MerchantOrderId": "2017051001",
                      "Customer": {
                        "Name": "Aline de Souza",
                        "Identity": "12345678909",
                        "IdentityType": "CPF",
                        "Email": "aline@email.com",
                        "Birthdate": "1990-01-01"
                      },
                      "Payment": {
                        "ServiceTaxAmount": 0,
                        "Installments": 1,
                        "Interest": 0,
                        "Capture": true,
                        "Authenticate": false,
                        "Recurrent": false,
                        "CreditCard": {
                          "CardNumber": "409168******7641",
                          "Holder": "Aline de Souza",
                          "ExpirationDate": "12/2035",
                          "SaveCard": false,
                          "Brand": "Visa",
                          "PaymentAccountReference": "NQANHK1AVVCHDBGZASJZXAOMPWMCH"
                        },
                        "Tid": "1124053300564",
                        "ProofOfSale": "207344",
                        "AuthorizationCode": "175111",
                        "SoftDescriptor": "LojaTeste",
                        "Provider": "Simulado",
                        "Eci": "5",
                        "ExternalAuthentication": {
                          "Cavv": "AAABB2gHA1B5EFNjWQcDAAAAAAB=",
                          "Xid": "Uk5ZanBHcWw2RjRCbEN5dGtiMTB=",
                          "Eci": "5",
                          "Version": "2.2.0",
                          "DataOnly": true
                        },
                        "IsQrCode": false,
                        "SentOrderId": "202511241733000C3372",
                        "Amount": 10000,
                        "ReceivedDate": "2025-11-24 17:33:00",
                        "CapturedAmount": 10000,
                        "CapturedDate": "2025-11-24 17:33:00",
                        "Status": 2,
                        "IsSplitted": false,
                        "ReturnMessage": "Operation Successful",
                        "ReturnCode": "6",
                        "PaymentId": "788a4ee8-2755-490e-a675-3fe4420f6881",
                        "Type": "CreditCard",
                        "Currency": "BRL",
                        "Country": "BRA",
                        "Links": [
                          {
                            "Method": "GET",
                            "Rel": "self",
                            "Href": "https://apiquerysandbox.cieloecommerce.cielo.com.br/1/sales/788a4ee8-2755-490e-a675-3fe4420f6881"
                          },
                          {
                            "Method": "PUT",
                            "Rel": "void",
                            "Href": "https://apisandbox.cieloecommerce.cielo.com.br/1/sales/788a4ee8-2755-490e-a675-3fe4420f6881/void"
                          }
                        ]
                      }
                    }
                  },
                  "Cartão de crédito com Card On File": {
                    "summary": "Cartão de crédito com Card On File",
                    "value": {
                      "MerchantOrderId": "2017051001",
                      "Customer": {
                        "Name": "Aline de Souza",
                        "Identity": "12345678909",
                        "IdentityType": "CPF",
                        "Email": "aline@email.com",
                        "Birthdate": "1990-01-01"
                      },
                      "Payment": {
                        "ServiceTaxAmount": 0,
                        "Installments": 1,
                        "Interest": 0,
                        "Capture": true,
                        "Authenticate": false,
                        "Recurrent": false,
                        "CreditCard": {
                          "CardNumber": "409168******7641",
                          "Holder": "Aline de Souza",
                          "ExpirationDate": "12/2035",
                          "SaveCard": false,
                          "Brand": "Visa",
                          "CardOnFile": {
                            "Usage": "Used"
                          },
                          "PaymentAccountReference": "970UZI3LF5Y8SGFJ7QR6DBHWS86P6"
                        },
                        "Tid": "1124055001076",
                        "ProofOfSale": "803707",
                        "AuthorizationCode": "024169",
                        "SoftDescriptor": "LojaTeste",
                        "Provider": "Simulado",
                        "IsQrCode": false,
                        "SentOrderId": "2025112417500059AF2E",
                        "Amount": 10000,
                        "ReceivedDate": "2025-11-24 17:50:00",
                        "CapturedAmount": 10000,
                        "CapturedDate": "2025-11-24 17:50:01",
                        "Status": 2,
                        "IsSplitted": false,
                        "ReturnMessage": "Operation Successful",
                        "ReturnCode": "6",
                        "PaymentId": "5cd9ccaf-e3b2-430c-b5dd-2b674cfd656a",
                        "Type": "CreditCard",
                        "Currency": "BRL",
                        "Country": "BRA",
                        "Links": [
                          {
                            "Method": "GET",
                            "Rel": "self",
                            "Href": "https://apiquerysandbox.cieloecommerce.cielo.com.br/1/sales/5cd9ccaf-e3b2-430c-b5dd-2b674cfd656a"
                          },
                          {
                            "Method": "PUT",
                            "Rel": "void",
                            "Href": "https://apisandbox.cieloecommerce.cielo.com.br/1/sales/5cd9ccaf-e3b2-430c-b5dd-2b674cfd656a/void"
                          }
                        ]
                      }
                    }
                  },
                  "Cartão de crédito com Indicador de Início da Transação": {
                    "summary": "Cartão de crédito com Indicador de Início da Transação",
                    "value": {
                      "MerchantOrderId": "2017051001",
                      "Customer": {
                        "Name": "Aline de Souza",
                        "Identity": "12345678909",
                        "IdentityType": "CPF",
                        "Email": "aline@email.com",
                        "Birthdate": "1990-01-01"
                      },
                      "Payment": {
                        "ServiceTaxAmount": 0,
                        "Installments": 1,
                        "Interest": 0,
                        "Capture": true,
                        "Authenticate": false,
                        "Recurrent": false,
                        "CreditCard": {
                          "CardNumber": "537154******0634",
                          "Holder": "Aline de Souza",
                          "ExpirationDate": "07/2027",
                          "SaveCard": false,
                          "Brand": "Master",
                          "PaymentAccountReference": "0KAAG9EPJ37DSW3V8O65Q3C0XUNGK"
                        },
                        "Tid": "1124060048956",
                        "ProofOfSale": "040911",
                        "AuthorizationCode": "944979",
                        "SoftDescriptor": "LojaTeste",
                        "Provider": "Simulado",
                        "IsQrCode": false,
                        "InitiatedTransactionIndicator": {
                          "Category": "C1",
                          "Subcategory": "StandingOrder"
                        },
                        "SentOrderId": "2025112418004891D955",
                        "Amount": 10000,
                        "ReceivedDate": "2025-11-24 18:00:48",
                        "CapturedAmount": 10000,
                        "CapturedDate": "2025-11-24 18:00:48",
                        "Status": 2,
                        "IsSplitted": false,
                        "ReturnMessage": "Operation Successful",
                        "ReturnCode": "6",
                        "PaymentId": "7b14a177-9025-4c13-b1c1-99eb5a87bd6f",
                        "Type": "CreditCard",
                        "Currency": "BRL",
                        "Country": "BRA",
                        "Links": [
                          {
                            "Method": "GET",
                            "Rel": "self",
                            "Href": "https://apiquerysandbox.cieloecommerce.cielo.com.br/1/sales/7b14a177-9025-4c13-b1c1-99eb5a87bd6f"
                          },
                          {
                            "Method": "PUT",
                            "Rel": "void",
                            "Href": "https://apisandbox.cieloecommerce.cielo.com.br/1/sales/7b14a177-9025-4c13-b1c1-99eb5a87bd6f/void"
                          }
                        ]
                      }
                    }
                  },
                  "Cartão de crédito para cias aéras e agências de turismo": {
                    "summary": "Cartão de crédito para cias aéras e agências de turismo",
                    "value": {
                      "MerchantOrderId": "2017051001",
                      "Customer": {
                        "Name": "Aline de Souza",
                        "Identity": "12345678909",
                        "IdentityType": "CPF",
                        "Email": "aline@email.com",
                        "Birthdate": "1990-01-01"
                      },
                      "Payment": {
                        "ServiceTaxAmount": 1000,
                        "Installments": 2,
                        "Interest": 0,
                        "Capture": true,
                        "Authenticate": false,
                        "Recurrent": false,
                        "CreditCard": {
                          "CardNumber": "409168******7641",
                          "Holder": "Aline de Souza",
                          "ExpirationDate": "12/2035",
                          "SaveCard": false,
                          "Brand": "Visa",
                          "PaymentAccountReference": "LQ3W28C7QRT0TARDRLR2ZWQNEQJNH"
                        },
                        "Tid": "1124055324407",
                        "ProofOfSale": "581156",
                        "AuthorizationCode": "621715",
                        "SoftDescriptor": "LojaTeste",
                        "Provider": "Simulado",
                        "IsQrCode": false,
                        "SentOrderId": "20251124175324775553",
                        "Amount": 10000,
                        "ReceivedDate": "2025-11-24 17:53:24",
                        "CapturedAmount": 10000,
                        "CapturedDate": "2025-11-24 17:53:24",
                        "Status": 2,
                        "IsSplitted": false,
                        "ReturnMessage": "Operation Successful",
                        "ReturnCode": "6",
                        "PaymentId": "f0b5e24b-d405-4be8-9d84-a1081c69385e",
                        "Type": "CreditCard",
                        "Currency": "BRL",
                        "Country": "BRA",
                        "AirlineData": {
                          "TicketNumber": "AR988983"
                        },
                        "Links": [
                          {
                            "Method": "GET",
                            "Rel": "self",
                            "Href": "https://apiquerysandbox.cieloecommerce.cielo.com.br/1/sales/f0b5e24b-d405-4be8-9d84-a1081c69385e"
                          },
                          {
                            "Method": "PUT",
                            "Rel": "void",
                            "Href": "https://apisandbox.cieloecommerce.cielo.com.br/1/sales/f0b5e24b-d405-4be8-9d84-a1081c69385e/void"
                          }
                        ]
                      }
                    }
                  },
                  "Cartão de crédito completo": {
                    "value": {
                      "MerchantOrderId": "2017051001",
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
                        "ServiceTaxAmount": 0,
                        "Installments": 1,
                        "Interest": 0,
                        "Capture": true,
                        "Authenticate": false,
                        "Recurrent": false,
                        "IssuerTransactionId": "580027442382078",
                        "CreditCard": {
                          "CardNumber": "537154******0634",
                          "Holder": "Aline de Souza",
                          "ExpirationDate": "07/2027",
                          "SaveCard": false,
                          "Brand": "Master",
                          "CardOnFile": {
                            "Usage": "Used"
                          },
                          "PaymentAccountReference": "ZEYO5L521MBLKDQU0HHXENP1B1B58"
                        },
                        "Tid": "1209032335683",
                        "ProofOfSale": "255231",
                        "AuthorizationCode": "875176",
                        "SoftDescriptor": "LojaTeste",
                        "Provider": "Simulado",
                        "IsQrCode": false,
                        "InitiatedTransactionIndicator": {
                          "Category": "C1",
                          "Subcategory": "StandingOrder"
                        },
                        "Tip": false,
                        "SentOrderId": "202512091523357AF3AB",
                        "Amount": 10000,
                        "ReceivedDate": "2025-12-09 15:23:35",
                        "CapturedAmount": 10000,
                        "CapturedDate": "2025-12-09 15:23:35",
                        "Status": 2,
                        "IsSplitted": false,
                        "ReturnMessage": "Operation Successful",
                        "ReturnCode": "6",
                        "PaymentId": "71c908df-c72d-425c-89d2-3376f1b5a76d",
                        "Type": "CreditCard",
                        "Currency": "BRL",
                        "Country": "BRA",
                        "Links": [
                          {
                            "Method": "GET",
                            "Rel": "self",
                            "Href": "https://apiquerysandbox.cieloecommerce.cielo.com.br/1/sales/71c908df-c72d-425c-89d2-3376f1b5a76d"
                          },
                          {
                            "Method": "PUT",
                            "Rel": "void",
                            "Href": "https://apisandbox.cieloecommerce.cielo.com.br/1/sales/71c908df-c72d-425c-89d2-3376f1b5a76d/void"
                          }
                        ]
                      }
                    },
                    "summary": "Cartão de crédito completo"
                  },
                  "Cartão de crédito simplificado": {
                    "summary": "Cartão de crédito simplificado",
                    "value": {
                      "MerchantOrderId": "2017051001",
                      "Customer": {
                        "Name": "Aline de Souza",
                        "Identity": "12345678909",
                        "IdentityType": "CPF",
                        "Email": "aline@email.com",
                        "Birthdate": "1990-01-01"
                      },
                      "Payment": {
                        "ServiceTaxAmount": 0,
                        "Installments": 1,
                        "Interest": 0,
                        "Capture": true,
                        "Authenticate": false,
                        "Recurrent": false,
                        "IssuerTransactionId": "580027442382078",
                        "CreditCard": {
                          "CardNumber": "409168******7641",
                          "Holder": "Aline de Souza",
                          "ExpirationDate": "12/2035",
                          "SaveCard": false,
                          "Brand": "Visa",
                          "PaymentAccountReference": "4ZI0GII5L9RV8O1MU7DQ9WNOC17IE"
                        },
                        "Tid": "1124060407175",
                        "ProofOfSale": "182738",
                        "AuthorizationCode": "663864",
                        "SoftDescriptor": "LojaTeste",
                        "Provider": "Simulado",
                        "IsQrCode": false,
                        "SentOrderId": "20251124180407BDDA31",
                        "Amount": 10000,
                        "ReceivedDate": "2025-11-24 18:04:07",
                        "CapturedAmount": 10000,
                        "CapturedDate": "2025-11-24 18:04:07",
                        "Status": 2,
                        "IsSplitted": false,
                        "ReturnMessage": "Operation Successful",
                        "ReturnCode": "6",
                        "PaymentId": "6f8d1753-86bb-4dc0-9ebb-09a29093e1fb",
                        "Type": "CreditCard",
                        "Currency": "BRL",
                        "Country": "BRA",
                        "Links": [
                          {
                            "Method": "GET",
                            "Rel": "self",
                            "Href": "https://apiquerysandbox.cieloecommerce.cielo.com.br/1/sales/6f8d1753-86bb-4dc0-9ebb-09a29093e1fb"
                          },
                          {
                            "Method": "PUT",
                            "Rel": "void",
                            "Href": "https://apisandbox.cieloecommerce.cielo.com.br/1/sales/6f8d1753-86bb-4dc0-9ebb-09a29093e1fb/void"
                          }
                        ]
                      }
                    }
                  },
                  "Cartão de crédito com Visa IDX": {
                    "summary": "Cartão de crédito com Visa IDX",
                    "value": {
                      "MerchantOrderId": "2017051001",
                      "Customer": {
                        "Name": "Aline de Souza",
                        "Identity": "12345678909",
                        "IdentityType": "CPF",
                        "Email": "aline@email.com",
                        "Birthdate": "1990-01-01"
                      },
                      "Payment": {
                        "ServiceTaxAmount": 0,
                        "Installments": 1,
                        "Interest": 0,
                        "Capture": true,
                        "Authenticate": false,
                        "Recurrent": false,
                        "CreditCard": {
                          "CardNumber": "409168******7641",
                          "Holder": "Aline de Souza",
                          "ExpirationDate": "12/2035",
                          "SaveCard": false,
                          "Brand": "Visa"
                        },
                        "Tid": "0107044351159",
                        "SoftDescriptor": "LojaTeste",
                        "Provider": "Simulado",
                        "ExternalAuthentication": {
                          "Cavv": "chaveIDX",
                          "Eci": "7"
                        },
                        "IsQrCode": false,
                        "SentOrderId": "20260107164351589784",
                        "Amount": 10000,
                        "ReceivedDate": "2026-01-07 16:43:51",
                        "Status": 3,
                        "IsSplitted": false,
                        "ReturnMessage": "Operation Successful",
                        "ReturnCode": "6",
                        "PaymentId": "ca9e8fb4-bf10-4bd9-a9d3-be9c991b0ce4",
                        "Type": "CreditCard",
                        "Currency": "BRL",
                        "Country": "BRA",
                        "Links": [
                          {
                            "Method": "GET",
                            "Rel": "self",
                            "Href": "https://apiquerysandbox.cieloecommerce.cielo.com.br/1/sales/ca9e8fb4-bf10-4bd9-a9d3-be9c991b0ce4"
                          }
                        ]
                      }
                    }
                  },
                  " Retorno Mastercard TLID": {
                    "summary": " Retorno Mastercard TLID",
                    "value": {
                      "MerchantOrderId": "2017051001",
                      "Customer": {
                        "Name": "Aline de Souza",
                        "Identity": "12345678909",
                        "IdentityType": "CPF",
                        "Email": "aline@email.com",
                        "Birthdate": "1990-01-01"
                      },
                      "Payment": {
                        "ServiceTaxAmount": 0,
                        "Installments": 1,
                        "Interest": 0,
                        "Capture": true,
                        "Authenticate": false,
                        "Recurrent": false,
                        "IssuerTransactionId": "580027442382078",
                        "TransactionLinkId": "aH3nV6qP_2sKe-8YjW1uBf",
                        "SentTransactionLinkId": "Xk7pQ2mR-9wLz_4TbN8vCd",
                        "CreditCard": {
                          "CardNumber": "512345******0000",
                          "Holder": "Aline de Souza",
                          "ExpirationDate": "12/2035",
                          "SaveCard": false,
                          "Brand": "Master",
                          "PaymentAccountReference": "4ZI0GII5L9RV8O1MU7DQ9WNOC17IE"
                        },
                        "Tid": "1124060407175",
                        "ProofOfSale": "182738",
                        "AuthorizationCode": "663864",
                        "SoftDescriptor": "LojaTeste",
                        "Provider": "Simulado",
                        "IsQrCode": false,
                        "SentOrderId": "20251124180407BDDA31",
                        "Amount": 10000,
                        "ReceivedDate": "2025-11-24 18:04:07",
                        "CapturedAmount": 10000,
                        "CapturedDate": "2025-11-24 18:04:07",
                        "Status": 2,
                        "IsSplitted": false,
                        "ReturnMessage": "Operation Successful",
                        "ReturnCode": "6",
                        "PaymentId": "6f8d1753-86bb-4dc0-9ebb-09a29093e1fb",
                        "Type": "CreditCard",
                        "Currency": "BRL",
                        "Country": "BRA",
                        "Links": [
                          {
                            "Method": "GET",
                            "Rel": "self",
                            "Href": "https://apiquerysandbox.cieloecommerce.cielo.com.br/1/sales/6f8d1753-86bb-4dc0-9ebb-09a29093e1fb"
                          },
                          {
                            "Method": "PUT",
                            "Rel": "void",
                            "Href": "https://apisandbox.cieloecommerce.cielo.com.br/1/sales/6f8d1753-86bb-4dc0-9ebb-09a29093e1fb/void"
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
                          "example": "Comprador crédito completo"
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
                          "example": true,
                          "default": true
                        },
                        "Authenticate": {
                          "type": "boolean",
                          "example": false,
                          "default": true
                        },
                        "Tip": {
                          "type": "boolean",
                          "example": false,
                          "default": true
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
                              "example": "Teste Holder"
                            },
                            "ExpirationDate": {
                              "type": "string",
                              "example": "12/2030"
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
                              "example": "92745135160550440006111072222"
                            },
                            "CardOnFile": {
                              "type": "object",
                              "properties": {
                                "Usage": {
                                  "type": "string",
                                  "example": "Used"
                                }
                              }
                            }
                          }
                        },
                        "IsCryptoCurrencyNegotiation": {
                          "type": "boolean",
                          "example": true,
                          "default": true
                        },
                        "TryAutomaticCancellation": {
                          "type": "boolean",
                          "example": true,
                          "default": true
                        },
                        "ProofOfSale": {
                          "type": "string",
                          "example": "674532"
                        },
                        "Tid": {
                          "type": "string",
                          "example": "0305020554239"
                        },
                        "AuthorizationCode": {
                          "type": "string",
                          "example": "123456"
                        },
                        "SoftDescriptor": {
                          "type": "string",
                          "example": "123456789ABCD"
                        },
                        "SentOrderId": {
                          "type": "string",
                          "example": "20251022142252AFCD07"
                        },
                        "PaymentId": {
                          "type": "string",
                          "example": "24bc8366-fc31-4d6c-8555-17049a836a07"
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
                        "CapturedAmount": {
                          "type": "integer",
                          "example": 15700,
                          "default": 0
                        },
                        "Country": {
                          "type": "string",
                          "example": "BRA"
                        },
                        "AirlineData": {
                          "type": "object",
                          "properties": {
                            "TicketNumber": {
                              "type": "string",
                              "example": "AR988983"
                            }
                          }
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
                          "example": 2,
                          "default": 0
                        },
                        "ReturnCode": {
                          "type": "string",
                          "example": "6"
                        },
                        "ReturnMessage": {
                          "type": "string",
                          "example": "Operation Successful"
                        },
                        "MerchantAdviceCode": {
                          "type": "string",
                          "example": "1"
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
        },
        "security": []
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