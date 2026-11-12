---
updatedAt: 2026-10-22T19:22:11.000Z
agentTools:
  siteIndex: https://docs.cielo.com.br/llms.txt
  projectIndex: https://docs.cielo.com.br/ecommerce-cielo/llms.txt
---

# Merchant Advice Code (MAC) – Mastercard

O **Merchant Advice Code (MAC)** é um código retornado pela Mastercard em **transações negadas** ou em outros cenários específicos, como casos envolvendo **cartões virtuais**, **atualização de dados do cartão (ABU)** ou **requisitos de token**.
Ele complementa o código de retorno da transação (`ReturnCode`) e orienta a loja sobre qual ação deve ser tomada:

* Retentar a transação;
* Aguardar um intervalo mínimo;
* ou não retentar, conforme o cenário identificado pela bandeira.

Na resposta da API, o MAC é retornado no campo `Payment.MerchantAdviceCode`.

## Como interpretar o MAC

Para interpretar o MAC em uma transação negada:

1. Localize o motivo da negativa no campo `ReturnCode`. Consulte a <Anchor label="tabela ABECS Mastercard" target="_blank" href="https://docs.cielo.com.br/ecommerce-cielo/page/abecs">tabela ABECS Mastercard</Anchor> para entender o motivo principal da recusa;
2. Verifique o campo `Payment.MerchantAdviceCode`;
3. Consulte a <Anchor label="tabela de MACs da Mastercard" target="_blank" href="https://docs.cielo.com.br/ecommerce-cielo/reference/retentativa-bandeira#tabela-com-toda-rela%C3%A7%C3%A3o-de-macs">tabela de MACs da Mastercard</Anchor> para entender a instrução associada ao código.

Siga exatamente a instrução da tabela, pois cada código MAC representa uma instrução específica.

## Exemplo de retorno

```json Cartão de crédito
{
  "MerchantOrderId": "2017051001",
  "Customer": {
    "Name": "Aline de Souza",
    "Identity": "12345678909",
    "IdentityType": "CPF",
    "Birthdate": "1990-01-01",
    },
  },
  "Payment": {
    "Installments": 1,
    "Interest": 0,
    "Capture": true,
    "Authenticate": false,
    "Recurrent": false,
    "CreditCard": {
      "CardNumber": "4091688625337641",
      "Holder": "Aline de Souza",
      "ExpirationDate": "12/2035",
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
    "InitiatedTransactionIndicator": {
      "Category": "C1",
      "Subcategory": "StandingOrder"
    },
    "SentOrderId": "202512091523357AF3AB",
    "Amount": 10000,
    "ReceivedDate": "2025-12-09 15:23:35",
    "CapturedAmount": 10000,
    "CapturedDate": "2025-12-09 15:23:35",
    "Status": 3,
    "IsSplitted": false,
    "ReturnCode": "51",
    "ReturnMessage": "Autorização negada",
    "MerchantAdviceCode": "25",
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
}
```
```json Cartão de débito
{
  "MerchantOrderId": "202301131052",
  "Customer": {
    "Name": "Aline de Souza",
    "Identity": "12345678909",
    "IdentityType": "CPF",
    "Birthdate": "1990-01-01",
    },
  "Payment": {
    "DebitCard": {
      "CardNumber": "4091688625337641",
      "Holder": "Aline De Souza",
      "ExpirationDate": "12/2035",
      "SaveCard": false,
      "Brand": "Master",
      "PaymentAccountReference": "9UAPP3YTRG9ICN42TM09I8TH83116"
    },
    "AuthorizationCode": "539727",
    "ProofOfSale": "603679",
    "Authenticate": true,
    "Recurrent": false,
    "SentOrderId": "202301131052",
    "Amount": 0,
    "ReceivedDate": "2026-03-02 16:09:32",
    "CapturedAmount": 0,
    "CapturedDate": "2026-03-02 16:09:32",
    "Status": 3,
    "IsSplitted": false,
    "ReturnCode": "51",
    "ReturnMessage": "Autorização negada",
    "MerchantAdviceCode": "25",
    "PaymentId": "f898786f-4377-4d9f-b73d-7a336ecf0edf",
    "Type": "DebitCard",
    "Currency": "BRL",
    "Country": "BRA",
    "Links": [
      {
        "Method": "GET",
        "Rel": "self",
        "Href": "https://apiquerysandbox.cieloecommerce.cielo.com.br/1/sales/f898786f-4377-4d9f-b73d-7a336ecf0edf"
      }
    ]
  }
}
```

<br />