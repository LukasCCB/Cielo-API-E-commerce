---
updatedAt: 2026-01-16T17:47:34.000Z
agentTools:
  siteIndex: https://docs.cielo.com.br/llms.txt
  projectIndex: https://docs.cielo.com.br/ecommerce-cielo/llms.txt
---

# Criar pagamento recorrente com cartão tokenizado

É possível criar uma transação recorrente com um cartão de crédito que já está armazenado (tokenizado).

> **Meio de pagamento aceito**: cartão de crédito.

> ⚠️ Identificação de transações oriundas de link de pagamento para cartões da bandeira Elo
>
> A partir de 17 de outubro de 2025 será obrigatório identificar transações oriundas de link de pagamento para cartões da bandeira Elo. Envie o parâmetro `Payment.SolutionType` = "ExternalLinkPay".

## Requisição

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

```json
{
  "MerchantOrderId": "Loja123456",
  "Customer": {
    "Name": "Aline de Souza"
  },
  "Payment": {
    "Type": "CreditCard",
    "Amount": 1500,
    "Installments": 1,
    "Capture": true,
    "SolutionType": "ExternalLinkPay",
    "RecurrentPayment": {
      "AuthorizeNow": "true",
      "EndDate": "2030-10-01",
      "Interval": "Monthly"
    },
    "CreditCard": {
      "CardToken": "4086baad-a31c-48b9-830d-8596bfe9c33c",
      "Brand": "Visa",
      "SecurityCode": "123",
    }
  }
}
```

**Parâmetros no header**

| Propriedade   | Descrição                                                                                          | Tipo   | Tamanho | Obrigatório |
| ------------- | -------------------------------------------------------------------------------------------------- | ------ | ------- | ----------- |
| `MerchantId`  | Identificador da loja na API E-commerce Cielo.                                                     | GUID   | 36      | Sim         |
| `MerchantKey` | Chave pública para autenticação dupla na API E-commerce Cielo.                                     | string | 40      | Sim         |
| `RequestId`   | Identificador da requisição, usado quando a loja usa diferentes servidores para cada GET/POST/PUT. | GUID   | 36      | Não         |

<br />

**Parâmetros no body**

<Table align={["left","left","left","left","left"]}>
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

      <th>
        Obrigatório
      </th>
    </tr>
  </thead>

  <tbody>
    <tr>
      <td>
        `MerchantOrderId`
      </td>

      <td>
        Número de identificação do pedido. _Atenção: Os caracteres permitidos são apenas a-z, A-Z, 0-9. Não são permitidos caracteres especiais e espaços em branco._
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
    </tr>

    <tr>
      <td>
        `Customer.Name`
      </td>

      <td>
        Nome do comprador. _Atenção: Os caracteres permitidos são apenas a-z, A-Z. Não são permitidos caracteres especiais e números._
      </td>

      <td>
        Texto
      </td>

      <td>
        255
      </td>

      <td>
        Sim
      </td>
    </tr>

    <tr>
      <td>
        `Payment.Type`
      </td>

      <td>
        Tipo do meio de pagamento.
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
    </tr>

    <tr>
      <td>
        `Payment.Amount`
      </td>

      <td>
        Valor do pedido (ser enviado em centavos).
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
    </tr>

    <tr>
      <td>
        `Payment.Installments`
      </td>

      <td>
        Número de parcelas. Como se trata de uma recorrência, o número de parcelas será 1.
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
    </tr>

    <tr>
      <td>
        `Payment.Capture`
      </td>

      <td>
        Booleano que identifica que a autorização deve ser com captura automática (“true”) ou captura posterior (“false”).
      </td>

      <td>
        Boolean
      </td>

      <td>
        \-
      </td>

      <td>
        Não (default: _false_)
      </td>
    </tr>

    <tr>
      <td>
        `Payment.SoftDescriptor`
      </td>

      <td>
        Texto que será impresso na fatura bancária do portador.  
        Disponível apenas para Visa e Mastercard - não permite caracteres especiais.
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
    </tr>

    <tr>
      <td>
        `Payment.RecurrentPayment`
      </td>

      <td>
        Indica que uma transação é de recorrência própria.
      </td>

      <td>
        Boolean
      </td>

      <td>
        5
      </td>

      <td>
        Sim*   
      </td>
    </tr>

    <tr>
      <td>
        `Payment.SolutionType`
      </td>

      <td>
        Origem do pagamento. **Obrigatório para transação de cartão da bandeira Elo oriunda de link de pagamento**. <br />Enviar como _"ExternalLinkPay"_.
      </td>

      <td>
        String
      </td>

      <td>
        15
      </td>

      <td>
        Não
      </td>
    </tr>

    <tr>
      <td>
        `CreditCard.CardNumber`
      </td>

      <td>
        Número do cartão do comprador.
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
    </tr>

    <tr>
      <td>
        `CreditCard.Holder`
      </td>

      <td>
        Nome do comprador impresso no cartão.
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
    </tr>

    <tr>
      <td>
        `CreditCard.ExpirationDate`
      </td>

      <td>
        Data de validade impressa no cartão.
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
    </tr>

    <tr>
      <td>
        `CreditCard.SecurityCode`
      </td>

      <td>
        Código de segurança impresso no verso do cartão.
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
    </tr>

    <tr>
      <td>
        `CreditCard.Brand`
      </td>

      <td>
        Bandeira do cartão.
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
    </tr>
  </tbody>
</Table>

## Resposta

```json
{
  "MerchantOrderId": "Loja123456",
  "Customer": {
    "Name": "Aline de Souza"
  },
  "Payment": {
    "Installments": 1,
    "Capture": true,
    "CreditCard": {
      "CardToken": "4086baad-a31c-48b9-830d-8596bfe9c33c",
      "Brand": "Visa",
      "SecurityCode": "123",
    },
    "ProofOfSale": "3827556",
    "Tid": "0504043827555",
    "AuthorizationCode": "149867",
    "PaymentId": "737a8d9a-88fe-4f74-931f-acf81149f4a0",
    "Type": "CreditCard",
    "Amount": 1500,
    "Currency": "BRL",
    "Country": "BRA",
    "Provider": "Simulado",
    "SolutionType": "ExternalLinkPay",
    "ExtraDataCollection": [],
    "Status": 1,
    "ReturnCode": "4",
    "ReturnMessage": "Operation Successful",
    "RecurrentPayment": {
      "RecurrentPaymentId": "61e5bd30-ec11-44b3-ba0a-56fbbc8274c5",
      "NextRecurrency": "2025-03-04",
      "EndDate": "2030-12-01",
      "Interval": "Monthly",
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
        "Rel": "void",
        "Href": "https://apiquerysandbox.cieloecommerce.cielo.com.br/1/sales/{PaymentId}/void"
      }
    ]
  }
}
```