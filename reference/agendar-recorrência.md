---
updatedAt: 2026-01-16T17:46:59.000Z
agentTools:
  siteIndex: https://docs.cielo.com.br/llms.txt
  projectIndex: https://docs.cielo.com.br/ecommerce-cielo/llms.txt
---

# Agendar recorrência programada

<div class="headline-container-article-info2GaOf2jMpV0r">
  <span class="rm-APIMethod APIMethod APIMethod_fixedWidth APIMethod_post headline-container-api-method1Hc-Fm7uaccR" data-testid="http-method">post</span>
</div>

É possível criar uma recorrência programada que não autoriza a transação imediatamente, mas sim agenda uma transação futura. Essa ação é chamada de agendar recorrência, e tem duas características:

* Para não autorizar a transação no momento em que é criada, envie `AuthorizeNow` como “false”;
* Envie o parâmetro `StartDate`, que determina a data de início da cobrança recorrente.

<Callout icon="ℹ️" theme="info">
  Ao configurar uma recorrência com uma data de início (`StartDate`) anterior à data atual, o sistema realizará cobranças retroativas diárias, uma para cada pagamento pendente até a data atual. Esse processo continua até que a próxima data de cobrança seja futura.
</Callout>

> ℹ️ Antes de agendar uma recorrência programada, use o <a href="https://docs.cielo.com.br/ecommerce-cielo/reference/validar-cartao" target="_blank">Zero Auth</a> para validar o cartão. Desta forma, você garante que está agendando a recorrência com um cartão válido.

> **Meio de pagamento aceito**: cartão de crédito.

> ⚠️ Identificação de transações oriundas de link de pagamento para cartões da bandeira Elo
>
> A partir de 17 de outubro de 2025 será obrigatório identificar transações oriundas de link de pagamento para cartões da bandeira Elo. Envie o parâmetro `Payment.SolutionType` = "ExternalLinkPay".

<br />

#### Requisição

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

```json
{
    "MerchantOrderId": "2014113245231706",
    "Customer": {
        "Name": "Comprador rec programada",
        "Identity": "12345678909",
        "IdentityType": "CPF",
        "Email": "linedesouza@email.com",
        "Birthdate": "1990-01-01",
        "Address": {
            "Street": "Rua das Rosas",
            "Number": "123",
            "Complement": "apartamento 101",
            "ZipCode": "12345987",
            "City": "São Paulo",
            "State": "SP",
            "Country": "BRA",
            "District": "Jardim das Flores",
            "AddressType": 0
        },
        "DeliveryAddress": {
            "Street": "Rua das Rosas",
            "Number": "123",
            "Complement": "apartamento 101",
            "ZipCode": "12345987",
            "City": "São Paulo",
            "State": "SP",
            "Country": "BRA",
            "District": "Jardim das Flores",
            "AddressType": 0
        }
    },
    "Payment": {
    "Type": "CreditCard",
    "Amount": 1500,
    "Installments": 1,
    "SoftDescriptor": "123456789ABCD",
    "SolutionType": "ExternalLinkPay",
    "RecurrentPayment": {
      "AuthorizeNow": "false",
      "EndDate": "2030-12-01",
      "Interval": "SemiAnnual",
      "StartDate": "2025-12-01"
    },
    "CreditCard": {
      "CardNumber": "1234123412341231",
      "Holder": "Teste Holder",
      "ExpirationDate": "12/2030",
      "SecurityCode": "262",
      "Brand": "Visa"
    }
  }
}
```

```shell
curl
--request POST "https://apisandbox.cieloecommerce.cielo.com.br/1/sales/"
--header "Content-Type: application/json"
--header "MerchantId: xxxxxxxx-xxxx-xxxx-xxxx-xxxxxxxxxxxx"
--header "MerchantKey: 0123456789012345678901234567890123456789"
--header "RequestId: xxxxxxxx-xxxx-xxxx-xxxx-xxxxxxxxxxxx"
--data-binary
{
   "MerchantOrderId":"2014113245231706",
   "Customer":{
      "Name":"Comprador rec programada"
   },
   "Payment":{
     "Type":"CreditCard",
     "Amount":1500,
     "Installments":1,
     "SoftDescriptor":"123456789ABCD",
     "RecurrentPayment":{
       "AuthorizeNow":"false",
       "EndDate":"2019-12-01",
       "Interval":"SemiAnnual",
       "StartDate":"2015-06-01"
     },
     "CreditCard":{
         "CardNumber":"1234123412341231",
         "Holder":"Teste Holder",
         "ExpirationDate":"12/2030",
         "SecurityCode":"262",
         "Brand":"Visa"
     }
   }
}
--verbose
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
        String
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
        Nome do Comprador.<br />_Atenção: Os caracteres permitidos são apenas a-z, A-Z. Não são permitidos caracteres especiais e números._
      </td>

      <td>
        String
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
        Tipo do Meio de Pagamento.
      </td>

      <td>
        String
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
        Valor do Pedido (ser enviado em centavos).
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
        `Payment.SoftDescriptor`
      </td>

      <td>
        Texto que será impresso na fatura bancaria do portador - Disponivel apenas para VISA/MASTER - não permite caracteres especiais
      </td>

      <td>
        String
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
        `Payment.RecurrentPayment.AuthorizeNow`
      </td>

      <td>
        Booleano que indica se a primeira recorrência já vai ser autorizada ou não. Para agendar uma recorrência, envie como "_true_".
      </td>

      <td>
        Boolean
      </td>

      <td>
        \-
      </td>

      <td>
        Sim
      </td>
    </tr>

    <tr>
      <td>
        `Payment.RecurrentPayment.StartDate`
      </td>

      <td>
        Data de início da recorrência.
      </td>

      <td>
        Boolean
      </td>

      <td>
        \-
      </td>

      <td>
        Sim
      </td>
    </tr>

    <tr>
      <td>
        `Payment.RecurrentPayment.EndDate`
      </td>

      <td>
        Data para término da recorrência.
      </td>

      <td>
        String
      </td>

      <td>
        10
      </td>

      <td>
        Não
      </td>
    </tr>

    <tr>
      <td>
        `Payment.RecurrentPayment.Interval`
      </td>

      <td>
        Intervalo da recorrência.

        * Monthly (mensal, é o padrão)
        * Bimonthly  (bimensal)
        * Quarterly  (trimestral)
        * SemiAnnual  (semestral)
        * Annual (anual)
      </td>

      <td>
        String
      </td>

      <td>
        10
      </td>

      <td>
        Não
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
        Número do Cartão do Comprador.
      </td>

      <td>
        String
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
        Nome do Comprador impresso no cartão.
      </td>

      <td>
        String
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
        Data de validade impresso no cartão.
      </td>

      <td>
        String
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
        String
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
        String
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

<br />

#### Resposta

```json
{
    "MerchantOrderId": "2014113245231706",
    "Customer": {
        "Name": "Comprador rec programada",
        "Identity": "12345678909",
        "IdentityType": "CPF",
        "Email": "linedesouza@email.com",
        "Birthdate": "1990-01-01",
        "Address": {
            "Street": "Rua das Rosas",
            "Number": "123",
            "Complement": "apartamento 101",
            "ZipCode": "12345987",
            "City": "São Paulo",
            "State": "SP",
            "Country": "BRA",
            "District": "Jardim das Flores",
            "AddressType": 0
        },
        "DeliveryAddress": {
            "Street": "Rua das Rosas",
            "Number": "123",
            "Complement": "apartamento 101",
            "ZipCode": "12345987",
            "City": "São Paulo",
            "State": "SP",
            "Country": "BRA",
            "District": "Jardim das Flores",
            "AddressType": 0
        }
    },
    "Payment": {
        "ServiceTaxAmount": 0,
        "Installments": 1,
        "Interest": 0,
        "Capture": false,
        "Authenticate": false,
        "Recurrent": false,
        "SolutionType": "ExternalLinkPay",
        "CreditCard": {
            "Holder": "Teste Holder",
            "ExpirationDate": "12/2030",
            "SaveCard": false,
            "Brand": "Visa"
        },
        "SoftDescriptor": "123456789ABCD",
        "Provider": "Simulado",
        "IsQrCode": false,
        "RecurrentPayment": {
            "ReasonCode": 7,
            "ReasonMessage": "Denied",
            "StartDate": "2025-12-01",
            "EndDate": "2030-12-01",
            "Interval": 6,
            "AuthorizeNow": false
        },
        "Amount": 1500,
        "Status": 13,
        "IsSplitted": false,
        "Type": "CreditCard",
        "Currency": "BRL",
        "Country": "BRA"
    }
}
```

```shell
--header "Content-Type: application/json"
--header "RequestId: xxxxxxxx-xxxx-xxxx-xxxx-xxxxxxxxxxxx"
--data-binary
{
    "MerchantOrderId": "2014113245231706",
    "Customer": {
        "Name": "Comprador rec programada"
    },
    "Payment": {
        "ServiceTaxAmount": 0,
        "Installments": 1,
        "Interest": "ByMerchant",
        "Capture": false,
        "Authenticate": false,
        "Recurrent": false,
        "CreditCard": {
            "CardNumber": "123412******1231",
            "Holder": "Teste Holder",
            "ExpirationDate": "12/2030",
            "SaveCard": false,
            "Brand": "Visa"
        },
        "SoftDescriptor":"123456789ABCD",
        "Type": "CreditCard",
        "Amount": 1500,
        "Currency": "BRL",
        "Country": "BRA",
        "Provider": "Simulado",
        "ExtraDataCollection": [],
        "Status": 20,
        "RecurrentPayment": {
            "RecurrentPaymentId": "0d2ff85e-594c-47b9-ad27-bb645a103db4",
            "NextRecurrency": "2015-06-01",
            "StartDate": "2015-06-01",
            "EndDate": "2019-12-01",
            "Interval": "SemiAnnual",
            "Link": {
                "Method": "GET",
                "Rel": "recurrentPayment",
                "Href": "https://apiquerysandbox.cieloecommerce.cielo.com.br/1/RecurrentPayment/{PaymentId}"
            },
            "AuthorizeNow": false
        }
    }
}
```

<Table>
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

      <th>
        Formato
      </th>
    </tr>
  </thead>

  <tbody>
    <tr>
      <td>
        `RecurrentPaymentId`
      </td>

      <td>
        Campo identificador da recorrência.
      </td>

      <td>
        GUID
      </td>

      <td>
        36
      </td>

      <td>
        xxxxxxxx-xxxx-xxxx-xxxx-xxxxxxxxxxxx
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
        String
      </td>

      <td>
        7
      </td>

      <td>
        12/2030 (MM/YYYY)
      </td>
    </tr>

    <tr>
      <td>
        `StartDate`
      </td>

      <td>
        Data do início da recorrência.
      </td>

      <td>
        String
      </td>

      <td>
        7
      </td>

      <td>
        12/2030 (MM/YYYY)
      </td>
    </tr>

    <tr>
      <td>
        `EndDate`
      </td>

      <td>
        Data do fim da recorrência.
      </td>

      <td>
        String
      </td>

      <td>
        7
      </td>

      <td>
        12/2030 (MM/YYYY)
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
        Número
      </td>

      <td>
        10
      </td>

      <td>
        * Monthly (mensal, é o padrão) 
        * Bimonthly  (bimensal)
        * Quarterly  (trimestral)
        * SemiAnnual  (semestral)
        * Annual (anual)
      </td>
    </tr>

    <tr>
      <td>
        `AuthorizeNow`
      </td>

      <td>
        Booleano para saber se a primeira recorrência já vai ser autorizada ou se será apenas agendada.
      </td>

      <td>
        Boolean
      </td>

      <td>
        ***
      </td>

      <td>
        false
      </td>
    </tr>
  </tbody>
</Table>