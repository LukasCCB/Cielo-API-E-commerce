---
updatedAt: 2026-11-06T17:52:00.000Z
agentTools:
  siteIndex: https://docs.cielo.com.br/llms.txt
  projectIndex: https://docs.cielo.com.br/ecommerce-cielo/llms.txt
---

# Criar recorrência própria

Na recorrência própria o processo de recorrência e intervalo serão executados pela própria loja. A requisição segue a estrutura de uma transação de crédito padrão, mas o parâmetro `Payment.Recurrent` deve ser `true`; caso contrário, a transação será negada.

> Se `Payment.Recurrent` for enviado como `false`, a transação será negada.

<br />

> **Meio de pagamento aceito**: cartão de crédito.

> **Cartão Protegido**: na recorrência própria, é possível enviar um cartão tokenizado no Cartão Protegido. Nesse caso, envie `Payment.CreditCard.CardToken`, `Payment.CreditCard.SecurityCode` e `Payment.CreditCard.Brand` no lugar dos dados abertos do cartão. Continue enviando `Payment.Recurrent` = `true`, `Payment.IssuerTransactionId` e `Payment.OriginalRecurrentAmount`. Confira o exemplo na aba **Request Cartão Protegido**.

> ⚠️ Identificação de transações oriundas de link de pagamento para cartões da bandeira Elo
>
> A partir de 17 de outubro de 2025 será obrigatório identificar transações oriundas de link de pagamento para cartões da bandeira Elo. Envie o parâmetro `Payment.SolutionType` = "ExternalLinkPay".

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
    "Name": "Comprador rec propria"
  },
  "Payment": {
    "Type": "CreditCard",
    "Amount": 1500,
    "Installments": 1,
    "SoftDescriptor": "123456789ABCD",
    "Recurrent": true,
    "SolutionType": "ExternalLinkPay",
    "IssuerTransactionId": "580027442382078",
    "OriginalRecurrentAmount": 1500,
    "CreditCard": {
      "CardNumber": "1234123412341231",
      "Holder": "Teste Holder",
      "ExpirationDate": "12/2030",
      "SecurityCode": "262",
      "SaveCard": "false",
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
      "Name":"Comprador rec propria"
   },
   "Payment":{
     "Type":"CreditCard",
     "Amount":1500,
     "Installments":1,
     "SoftDescriptor":"123456789ABCD",
     "Recurrent": true,
     "CreditCard":{
         "CardNumber":"1234123412341231",
         "Holder":"Teste Holder",
         "ExpirationDate":"12/2030",
         "SecurityCode":"262",
         "SaveCard":"false",
         "Brand":"Visa"
     }
   }
}
--verbose
```
```json Request Mastercard TLID
{
  "MerchantOrderId": "2014113245231706",
  "Customer": {
    "Name": "Comprador rec propria"
  },
  "Payment": {
    "Type": "CreditCard",
    "Amount": 1500,
    "Installments": 1,
    "SoftDescriptor": "123456789ABCD",
    "Recurrent": true,
    "IssuerTransactionId": "580027442382078",
    "TransactionLinkId": "mK8vT2qA-9LpX7dWc3Rf_H",
    "OriginalRecurrentAmount": 1500,
    "CreditCard": {
      "CardNumber": "5123450000000000",
      "Holder": "Teste Holder",
      "ExpirationDate": "12/2030",
      "SecurityCode": "262",
      "SaveCard": "false",
      "Brand": "Master"
    }
  }
}
```
```json Request Cartão Protegido
{
  "MerchantOrderId": "2014113245231706",
  "Customer": {
    "Name": "Aline de Souza"
  },
  "Payment": {
    "Type": "CreditCard",
    "Amount": 1500,
    "Installments": 1,
    "Recurrent": true,
    "IssuerTransactionId": "580027442382078",
    "OriginalRecurrentAmount": 1500,
    "CreditCard": {
      "CardToken": "6e1bf77a-b28b-4660-b14f-455e2a1c95e9",
      "SecurityCode": "333",
      "Brand": "Visa"
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

| Parâmetro                         | Descrição                                                                                                                                                                                                                                                                                                                                 | Tipo    | Tamanho | Obrigatório                                 |
| :-------------------------------- | :---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- | :------ | :------ | :------------------------------------------ |
| `MerchantOrderId`                 | Número de identificação do pedido. *Atenção: Os caracteres permitidos são apenas a-z, A-Z, 0-9. Não são permitidos caracteres especiais e espaços em branco.*                                                                                                                                                                             | Texto   | 50      | Sim                                         |
| `Customer.Name`                   | Nome do comprador. *Atenção: Os caracteres permitidos são apenas a-z, A-Z. Não são permitidos caracteres especiais e números.*                                                                                                                                                                                                            | Texto   | 255     | Sim                                         |
| `Payment.Type`                    | Tipo do meio de pagamento.                                                                                                                                                                                                                                                                                                                | Texto   | 100     | Sim                                         |
| `Payment.Amount`                  | Valor do pedido (ser enviado em centavos).                                                                                                                                                                                                                                                                                                | Número  | 15      | Sim                                         |
| `Payment.Installments`            | Número de parcelas. Como se trata de uma recorrência, o número de parcelas será 1.                                                                                                                                                                                                                                                        | Número  | 2       | Sim                                         |
| `Payment.SoftDescriptor`          | Texto que será impresso na fatura bancária do portador.\\<br />Disponível apenas para Visa e Mastercard - não permite caracteres especiais.                                                                                                                                                                                               | Texto   | 13      | Não                                         |
| `Payment.Recurrent`               | Indica que uma transação é de recorrência própria.                                                                                                                                                                                                                                                                                        | boolean | 5       | Sim\*                                       |
| `Payment.SolutionType`            | Origem do pagamento. **Obrigatório para transação de cartão da bandeira Elo oriunda de link de pagamento**. <br />Enviar como *"ExternalLinkPay"*.                                                                                                                                                                                        | string  | 15      | Não                                         |
| `CreditCard.CardNumber`           | Número do cartão do comprador.                                                                                                                                                                                                                                                                                                            | Texto   | 19      | Sim, exceto com `CardToken`                 |
| `CreditCard.CardToken`            | Token do Cartão Protegido, criado previamente na Cielo. Envie no lugar de `CardNumber`, `Holder` e `ExpirationDate`.                                                                                                                                                                                                                      | Texto   | 36      | Sim, com Cartão Protegido                   |
| `CreditCard.Holder`               | Nome do comprador impresso no cartão.                                                                                                                                                                                                                                                                                                     | Texto   | 25      | Sim, exceto com `CardToken`                 |
| `CreditCard.ExpirationDate`       | Data de validade impressa no cartão.                                                                                                                                                                                                                                                                                                      | Texto   | 7       | Sim, exceto com `CardToken`                 |
| `CreditCard.SecurityCode`         | Código de segurança impresso no verso do cartão.                                                                                                                                                                                                                                                                                          | Texto   | 4       | Sim, com `CardToken`; nos demais casos, não |
| `CreditCard.Brand`                | Bandeira do cartão.                                                                                                                                                                                                                                                                                                                       | Texto   | 10      | Sim                                         |
| `Payment.IssuerTransactionId`     | Identificador da transação gerado pela bandeira, retornado na transação CIT ou no Zero Auth. Envie nas transações MIT recorrentes, incrementais e reautorizadas: o envio é obrigatório para as bandeiras Visa, Mastercard, Elo e American Express.                                                                                        | Texto   | 30      | Sim                                         |
| `Payment.TransactionLinkId`       | Identificador único (TLID) gerado pela Mastercard. Na Mastercard, envie o valor original retornado na transação CIT ou no Zero Auth, junto com o `IssuerTransactionId`: os dois são obrigatórios. O envio do `TransactionLinkId` é obrigatório a partir de 23/10/2026. Formato: 22 caracteres alfanuméricos, hífen (-) e sublinhado (\_). | Texto   | 22      | Sim, na Mastercard                          |
| `Payment.OriginalRecurrentAmount` | Valor da transação original (primeira do ciclo), em centavos. Envie junto com o `IssuerTransactionId` e, na Mastercard, com o `TransactionLinkId`.                                                                                                                                                                                        | Número  | 15      | Sim                                         |

\*Neste caso, o campo `Payment.Recurrent` é obrigatório, já que se trata de uma transação recorrente.

Saiba mais sobre quando enviar cada campo em <Anchor target="_blank" href="https://docs.cielo.com.br/ecommerce-cielo/docs/identificadores-de-bandeira">Identificadores de bandeira</Anchor>.

#### Resposta

```json
{
    "MerchantOrderId": "2014113245231706",
    "Customer": {
        "Name": "Comprador rec propria"
    },
    "Payment": {
        "ServiceTaxAmount": 0,
        "Installments": 1,
        "Interest": "ByMerchant",
        "Capture": false,
        "SolutionType": "ExternalLinkPay",
        "Authenticate": false,
     		"Recurrent": true,
				"IssuerTransactionId": "580027442382078",
        "CreditCard": {
            "CardNumber": "123412******1231",
            "Holder": "Teste Holder",
            "ExpirationDate": "12/2030",
            "SaveCard": false,
            "Brand": "Visa"
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
```shell
--header "Content-Type: application/json"
--header "RequestId: xxxxxxxx-xxxx-xxxx-xxxx-xxxxxxxxxxxx"
--data-binary
{
    "MerchantOrderId": "2014113245231706",
    "Customer": {
        "Name": "Comprador rec propria"
    },
    "Payment": {
        "ServiceTaxAmount": 0,
        "Installments": 1,
        "Interest": "ByMerchant",
        "Capture": false,
        "Authenticate": false,
        "Recurrent": true,
        "CreditCard": {
            "CardNumber": "123412******1231",
            "Holder": "Teste Holder",
            "ExpirationDate": "12/2030",
            "SaveCard": false,
            "Brand": "Visa"
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
```json Resposta Mastercard TLID
{
    "MerchantOrderId": "2014113245231706",
    "Customer": {
        "Name": "Comprador rec propria"
    },
    "Payment": {
        "ServiceTaxAmount": 0,
        "Installments": 1,
        "Interest": "ByMerchant",
        "Capture": false,
        "SolutionType": "ExternalLinkPay",
        "Authenticate": false,
        "Recurrent": true,
        "IssuerTransactionId": "580027442382078",
        "TransactionLinkId": "Xk7pQ2mR-9wLz_4TbN8vCd",
        "CreditCard": {
            "CardNumber": "123412******1231",
            "Holder": "Teste Holder",
            "ExpirationDate": "12/2030",
            "SaveCard": false,
            "Brand": "Master"
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
```json Resposta Cartão Protegido
{
  "MerchantOrderId": "2014113245231706",
  "Customer": {
    "Name": "Aline de Souza"
  },
  "Payment": {
    "Installments": 1,
    "Capture": false,
    "Recurrent": true,
    "CreditCard": {
      "CardToken": "6e1bf77a-b28b-4660-b14f-455e2a1c95e9",
      "Brand": "Visa"
    },
    "Tid": "0504043827555",
    "ProofOfSale": "3827556",
    "AuthorizationCode": "149867",
    "IssuerTransactionId": "580027442382078",
    "PaymentId": "737a8d9a-88fe-4f74-931f-acf81149f4a0",
    "Type": "CreditCard",
    "Amount": 1500,
    "Currency": "BRL",
    "Country": "BRA",
    "Status": 1,
    "ReturnCode": "4",
    "ReturnMessage": "Operation Successful",
    "Links": [
      {
        "Method": "GET",
        "Rel": "self",
        "Href": "https://apiquerysandbox.cieloecommerce.cielo.com.br/1/sales/{PaymentId}"
      },
      {
        "Method": "PUT",
        "Rel": "capture",
        "Href": "https://apisandbox.cieloecommerce.cielo.com.br/1/sales/{PaymentId}/capture"
      },
      {
        "Method": "PUT",
        "Rel": "void",
        "Href": "https://apisandbox.cieloecommerce.cielo.com.br/1/sales/{PaymentId}/void"
      }
    ]
  }
}
```

| Propriedade     | Descrição                                                                                                                                 | Tipo  |
| --------------- | ----------------------------------------------------------------------------------------------------------------------------------------- | ----- |
| `Status`        | Status da Transação. Veja a tabela completa de [Status transacional](https://docs.cielo.com.br/ecommerce-cielo/reference/payment-status). | Texto |
| `ReturnCode`    | Código de retorno. Veja a tabela completa de [ReturnCode](https://docs.cielo.com.br/ecommerce-cielo/reference/api-codes).                 | Texto |
| `ReturnMessage` | Mensagem de retorno. Veja a tabela completa de [ReturnMessage](https://docs.cielo.com.br/ecommerce-cielo/reference/api-codes).            | Texto |

\*Neste caso, o campo `Payment.Recurrent` é obrigatório, já que se trata de uma transação recorrente.