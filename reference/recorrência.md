---
updatedAt: 2026-10-22T19:22:11.000Z
agentTools:
  siteIndex: https://docs.cielo.com.br/llms.txt
  projectIndex: https://docs.cielo.com.br/ecommerce-cielo/llms.txt
---

# Recorrência

O exemplo abaixo mostra como utilizar a funcionalidade **Card on File** em uma transação **recorrente**, quando o cartão já foi armazenado e utilizado anteriormente.

<Callout icon="ℹ️" theme="info">
  ###

  Saiba mais sobre essa funcionalidade <a href="https://docs.cielo.com.br/ecommerce-cielo/docs/card-on-file-1" target="_blank">na documentação</a>.
</Callout>

<div>
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
</div>

## Requisição

```json Recorrência própria
{
  "MerchantOrderId": "2014113245231706",
  "Customer":{  
      "Name":"Aline de Souza",
      "Email":"alinedesouza@email.com",
      "Birthdate":"1990-01-01"
   },
  "Payment": {
    "Type": "CreditCard",
    "Amount": 1500,
    "Installments": 1,
    "SoftDescriptor": "123456789ABCD",
    "Recurrent": true,
    "CreditCard": {
      "CardNumber": "4091688625337641",
      "Holder": "Teste Holder",
      "ExpirationDate": "12/2035",
      "SecurityCode": "333",
      "SaveCard": "false",
      "Brand": "Visa",
      "CardOnFile":{
        "Usage": "Used"
      }
    }
  }
}
```
```json Recorrência programada Cielo
{
  "MerchantOrderId": "Loja123456",
  "Customer":{  
      "Name":"Aline de Souza",
      "Email":"alinedesouza@email.com",
      "Birthdate":"1990-01-01"
   },
  "Payment": {
    "Type": "CreditCard",
    "Amount": 1500,
    "Installments": 1,
    "SoftDescriptor": "123456789ABCD",
    "Capture": "false",
    "RecurrentPayment": {
      "AuthorizeNow": "true",
      "EndDate": "2030-12-01",
      "Interval": "Monthly"
    },
    "CreditCard": {
      "CardNumber": "4091688625337641",
      "Holder": "Teste Holder",
      "ExpirationDate": "12/2035",
      "SecurityCode": "333",
      "SaveCard": "false",
      "Brand": "Visa",
      "CardOnFile":{
        "Usage": "Used"
      }
    }
  }
}
```

<br />

<Table align={["left","left","left","left","left"]}>
  <thead>
    <tr>
      <th>
        PROPRIEDADE
      </th>

      <th>
        TIPO
      </th>

      <th>
        TAMANHO
      </th>

      <th>
        OBRIGATÓRIO
      </th>

      <th>
        DESCRIÇÃO
      </th>
    </tr>
  </thead>

  <tbody>
    <tr>
      <td>
        `MerchantOrderId`
      </td>

      <td>
        Texto
      </td>

      <td>
        50
      </td>

      <td>
        Sim
      </td>

      <td>
        Número de identificação do pedido. _Atenção: Os caracteres permitidos são apenas a-z, A-Z, 0-9. Não são permitidos caracteres especiais e espaços em branco._
      </td>
    </tr>

    <tr>
      <td>
        `Customer.Name`
      </td>

      <td>
        Texto
      </td>

      <td>
        255
      </td>

      <td>
        Não
      </td>

      <td>
        Nome do comprador. _Atenção: Os caracteres permitidos são apenas a-z, A-Z. Não são permitidos caracteres especiais e números._
      </td>
    </tr>

    <tr>
      <td>
        `Customer.Email`
      </td>

      <td>
        Texto
      </td>

      <td>
        255
      </td>

      <td>
        Não
      </td>

      <td>
        E-mail do comprador.
      </td>
    </tr>

    <tr>
      <td>
        `Customer.Birthdate`
      </td>

      <td>
        Date
      </td>

      <td>
        10
      </td>

      <td>
        Não
      </td>

      <td>
        Data de nascimento do comprador (AAAA/MM/DD).
      </td>
    </tr>

    <tr>
      <td>
        `Payment.Type`
      </td>

      <td>
        Texto
      </td>

      <td>
        100
      </td>

      <td>
        Sim
      </td>

      <td>
        Tipo do meio de pagamento.
      </td>
    </tr>

    <tr>
      <td>
        `Payment.Amount`
      </td>

      <td>
        Número
      </td>

      <td>
        15
      </td>

      <td>
        Sim
      </td>

      <td>
        Valor do pedido (ser enviado em centavos).
      </td>
    </tr>

    <tr>
      <td>
        `Payment.Currency`
      </td>

      <td>
        Texto
      </td>

      <td>
        3
      </td>

      <td>
        Não
      </td>

      <td>
        Moeda na qual o pagamento será feito (BRL).
      </td>
    </tr>

    <tr>
      <td>
        `Payment.Country`
      </td>

      <td>
        Texto
      </td>

      <td>
        3
      </td>

      <td>
        Não
      </td>

      <td>
        País na qual o pagamento será feito.
      </td>
    </tr>

    <tr>
      <td>
        `Payment.Installments`
      </td>

      <td>
        Número
      </td>

      <td>
        2
      </td>

      <td>
        Sim
      </td>

      <td>
        Número de parcelas. Se a transação for uma recorrência, o número de parcelas será 1. Para transações parceladas, o número de parcelas será sempre maior que 1.
      </td>
    </tr>

    <tr>
      <td>
        `Payment.Capture`
      </td>

      <td>
        Booleano
      </td>

      <td>
        -
      </td>

      <td>
        Não (Default false)
      </td>

      <td>
        Booleano que identifica que a autorização deve ser com captura automática (“true”) ou captura posterior (“false”).
      </td>
    </tr>

    <tr>
      <td>
        `Payment.SoftDescriptor`
      </td>

      <td>
        Texto
      </td>

      <td>
        13
      </td>

      <td>
        Não
      </td>

      <td>
        O complemento do nome da loja que aparecerá na fatura do cartão. Não permite caracteres especiais.
      </td>
    </tr>

    <tr>
      <td>
        `Payment.Recurrent`
      </td>

      <td>
        Booleano
      </td>

      <td>
        5
      </td>

      <td>
        Sim\* |
      </td>

      <td>
        Indica que uma transação é de recorrência própria.<br />**⚠️Obrigatório para recorrência própria.**
      </td>
    </tr>

    <tr>
      <td>
        `RecurrentPayment.AuthorizeNow`
      </td>

      <td>
        Booleano
      </td>

      <td>
        -
      </td>

      <td>
        Sim
      </td>

      <td>
        Booleano para saber se a primeira recorrência já vai ser autorizada ou não. ⚠️**Para recorrência programada, envie**`AuthorizeNow`**&#x20;= true.**.
      </td>
    </tr>

    <tr>
      <td>
        `RecurrentPayment.EndDate`
      </td>

      <td>
        Texto
      </td>

      <td>
        10
      </td>

      <td>
        Sim\* |
      </td>

      <td>
        Data para término da cobrança recorrente. Formato: 12/2030 (MM/YYYY).<br />**⚠️Obrigatório para recorrência programada.**
      </td>
    </tr>

    <tr>
      <td>
        `RecurrentPayment.Interval`
      </td>

      <td>
        Texto
      </td>

      <td>
        10
      </td>

      <td>
        Sim\* |
      </td>

      <td>
        Intervalo da recorrência:

        - Monthly (mensal, é o padrão)
        - Bimonthly (bimestral)
        - Quarterly (trimestral)
        - SemiAnnual (semestral)
        - Annual (anual).

        **⚠️Obrigatório para recorrência programada.**
      </td>
    </tr>

    <tr>
      <td>
        `CreditCard.CardNumber`
      </td>

      <td>
        Texto
      </td>

      <td>
        19
      </td>

      <td>
        Sim
      </td>

      <td>
        Número do cartão do comprador.
      </td>
    </tr>

    <tr>
      <td>
        `CreditCard.Holder`
      </td>

      <td>
        Texto
      </td>

      <td>
        25
      </td>

      <td>
        Sim
      </td>

      <td>
        Nome do comprador impresso no cartão. Não aceita caracteres especiais ou acentuação.
      </td>
    </tr>

    <tr>
      <td>
        `CreditCard.ExpirationDate`
      </td>

      <td>
        Texto
      </td>

      <td>
        7
      </td>

      <td>
        Sim
      </td>

      <td>
        Data de validade impressa no cartão. Ex. MM/AAAA.
      </td>
    </tr>

    <tr>
      <td>
        `CreditCard.SecurityCode`
      </td>

      <td>
        Texto
      </td>

      <td>
        4
      </td>

      <td>
        Não
      </td>

      <td>
        Código de segurança impresso no verso do cartão.
      </td>
    </tr>

    <tr>
      <td>
        `CreditCard.SaveCard`
      </td>

      <td>
        Booleano
      </td>

      <td>
        -
      </td>

      <td>
        Não (Default false)
      </td>

      <td>
        Booleano que identifica se o cartão será salvo para gerar o `CardToken`. Saiba mais sobre <a href="https://docs.cielo.com.br/ecommerce-cielo/docs/tokenizando-cartoes" target="_blank">Tokenização</a>
      </td>
    </tr>

    <tr>
      <td>
        `CreditCard.Brand`
      </td>

      <td>
        Texto
      </td>

      <td>
        10
      </td>

      <td>
        Sim
      </td>

      <td>
        Bandeira do cartão. Valores possíveis: Visa / Master / Amex / Elo / Aura / JCB / Dinners / Discover.
      </td>
    </tr>

    <tr>
      <td>
        `CreditCard.CardOnFile.Usage`
      </td>

      <td>
        Texto
      </td>

      <td>
        -
      </td>

      <td>
        Não
      </td>

      <td>
        "First" se o cartão foi armazenado e é seu primeiro uso.<br />"Used" se o cartão foi armazenado e ele já foi utilizado anteriormente em outra transação
      </td>
    </tr>
  </tbody>
</Table>

## Resposta

```json Recorrência própria
{
  "MerchantOrderId": "2014113245231706",
  "Customer":{  
      "Name":"Aline de Souza",
      "Email":"alinedesouza@email.com",
      "Birthdate":"1990-01-01"
   },
  "Payment": {
      "ServiceTaxAmount": 0,
      "Installments": 1,
      "Interest": "ByMerchant",
      "Capture": false,
      "Authenticate": false,
      "Recurrent": true,
      "CreditCard": {
          "CardNumber": "4091688625337641",
          "Holder": "Teste Holder",
          "ExpirationDate": "12/2035",
          "SaveCard": false,
          "Brand": "Visa",
          "CardOnFile":{
            "Usage": "Used"
          }
      },
      "ProofOfSale": "3827556",
      "Tid": "0504043827555",
      "AuthorizationCode": "149867",
      "SoftDescriptor":"123456789ABCD",
      "PaymentId": "737a8d9a-88fe-4f74-931f-acf81149f4a0",
      "Type": "CreditCard",
      "Amount": 1500,
      "Currency": "BRL",
      "Country": "BRA",
      "Provider": "Simulado",
      "ExtraDataCollection": [],
      "Status": 1,
      "ReturnCode": "4",
      "ReturnMessage": "Operation Successful",
      "Link": {
              "Method": "GET",
              "Rel": "recurrentPayment",
              "Href": "https://apiquerysandbox.cieloecommerce.cielo.com.br/1/RecurrentPayment/{RecurrentPaymentId}"
          },
          "AuthorizeNow": true
      },
      "Links": [
          {
              "Method": "GET",
              "Rel": "self",
              "Href": "https://apiquerysandbox.cieloecommerce.cielo.com.br/1/sales/{PaymentId}"
          },
          {
              "Method": "PUT",
              "Rel": "capture",
              "Href": "https://apiquerysandbox.cieloecommerce.cielo.com.br/1/sales/{PaymentId}/capture"
          },
          {
              "Method": "PUT",
              "Rel": "void",
              "Href": "https://apiquerysandbox.cieloecommerce.cielo.com.br/1/sales/{PaymentId}/void"
          }
      ]
}
```
```json Recorrência programada Cielo
{
  "MerchantOrderId": "Loja123456",
  "Customer":{  
      "Name":"Aline de Souza",
      "Email":"alinedesouza@email.com",
      "Birthdate":"1990-01-01"
  },
  "Payment": {
    "ServiceTaxAmount": 0,
    "Installments": 1,
    "Interest": "ByMerchant",
    "Capture": false,
    "Authenticate": false,
    "Recurrent": false,
    "CreditCard": {
      "CardNumber": "4091688625337641",
      "Holder": "Teste Holder",
      "ExpirationDate": "12/2035",
      "SaveCard": false,
      "Brand": "Visa",
      "CardOnFile":{
        "Usage": "Used"
      }
    },
    "ProofOfSale": "3827556",
    "Tid": "0504043827555",
    "AuthorizationCode": "149867",
    "SoftDescriptor": "123456789ABCD",
    "PaymentId": "737a8d9a-88fe-4f74-931f-acf81149f4a0",
    "Type": "CreditCard",
    "Amount": 1500,
    "Currency": "BRL",
    "Country": "BRA",
    "Provider": "Simulado",
    "ExtraDataCollection": [],
    "Status": 1,
    "ReturnCode": "4",
    "ReturnMessage": "Operation Successful",
    "RecurrentPayment": {
      "RecurrentPaymentId": "61e5bd30-ec11-44b3-ba0a-56fbbc8274c5",
      "NextRecurrency": "2015-11-04",
      "EndDate": "2019-12-01",
      "Interval": "SemiAnnual",
      "Link": {
        "Method": "GET",
        "Rel": "recurrentPayment",
        "Href": "https://apiquerysandbox.cieloecommerce.cielo.com.br/1/RecurrentPayment/{RecurrentPaymentId}"
      },
      "AuthorizeNow": true
    },
    "Links": [
      {
        "Method": "GET",
        "Rel": "self",
        "Href": "https://apiquerysandbox.cieloecommerce.cielo.com.br/1/sales/{PaymentId}"
      },
      {
        "Method": "PUT",
        "Rel": "capture",
        "Href": "https://apiquerysandbox.cieloecommerce.cielo.com.br/1/sales/{PaymentId}/capture"
      },
      {
        "Method": "PUT",
        "Rel": "void",
        "Href": "https://apiquerysandbox.cieloecommerce.cielo.com.br/1/sales/{PaymentId}/void"
      }
    ]
  }
}
```

<br />

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
        Código de retorno. Veja a tabela completa de [ReturnCode](https://docs.cielo.com.br/ecommerce-cielo/reference/api-codes)
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
        Mensagem de retorno. Veja a tabela completa de [ReturnMessage](https://docs.cielo.com.br/ecommerce-cielo/reference/api-codes)
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
        Booleano para saber se a primeira recorrência já vai ser autorizada ou não.
      </td>

      <td>
        boolean
      </td>

      <td>
        ***
      </td>
    </tr>
  </tbody>
</Table>

<Callout icon="⚠️" theme="warn">
  ### Atenção:

  - Envie os parâmetros em `Payment.RecurrentPayment` para criar uma Recorrência Programada;
  - Envie o parâmetro `Payment.Recurrent`= "true" para criar uma Recorrência Própria;
  - Para a bandeira **Mastercard** é necessário enviar o nó `Payment.InitiatedTransactionIndicator` para indicar o <a href="https://docs.cielo.com.br/ecommerce-cielo/page/indicador-de-in%C3%ADcio-da-transa%C3%A7%C3%A3o-cit-e-mit" target="_blank">iniciador de transação</a>.
</Callout>

<br />