---
updatedAt: 2026-01-08T13:12:48.000Z
agentTools:
  siteIndex: https://docs.cielo.com.br/llms.txt
  projectIndex: https://docs.cielo.com.br/ecommerce-cielo/llms.txt
---

# Visa Intelligent Data Exchange (IDX)

O **Visa Intelligent Data Exchange (IDX)** é uma solução da Visa para compartilhamento de dados em transações sem cartão presente.

Provedores de dados terceirizados enviam dados adicionais para Visa, que envia esses dados para os emissores de forma apartada. Os emissores, então, usam esses dados para a análise de risco e decisão de autorização. Esses dados são identificados via **chave IDX**, enviada pela loja ao criar um pagamento com cartão de crédito. O objetivo é melhorar a análise de risco feita pelos emissores sem aumentar a fricção para o portador do cartão.

Para enviar a chave IDX, preencha o nó `ExternalAuthentication` da seguinte forma:

```json
{
  "Payment": {
    "ExternalAuthentication": {
      "Eci": 7,
      "Cavv": "chave IDX"
    }
  }
}

```

* `Payment.ExternalAuthentication.Eci`: envie com valor "7", indicando autenticação externa;
* `Payment.ExternalAuthentication.Cavv`: insira a chave IDX provida pelo provedor de dados.

<Callout icon="ℹ️" theme="info">
  - O serviço IDX da Visa não funciona em conjunto com a autenticação 3DS, é necessário escolher uma forma de autenticação;
  - O serviço IDX não está disponível para transações em sandbox;
  - O serviço IDX é exclusivo para transações com cartões da bandeira Visa.
</Callout>

Para usar o IDX, é preciso **contratar o serviço com a Visa** e usar um provedor de dados terceirizado que faça parte do programa.

Saiba mais sobre o serviço na <a href="https://developer.visa.com/capabilities/visa-intelligent-data-exchange-api/docs-getting-started" target="_blank">documentação da Visa.</a>

<br />

**Exemplo de requisição com chave IDX**

```json
{
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
'
```

Os parâmetros influenciados pelo IDX são:

| Parâmetros                            | Descrição                                                    |
| :------------------------------------ | :----------------------------------------------------------- |
| `Payment.ExternalAuthentication.Eci`  | Envie o campo com valor "7", indicando autenticação externa. |
| `Payment.ExternalAuthentication.Cavv` | Envie sua chave IDX.                                         |

**Exemplo de resposta com chave IDX**

```json
{
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
```

<br />