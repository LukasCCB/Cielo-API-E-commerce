---
updatedAt: 2026-10-14T14:48:43.000Z
agentTools:
  siteIndex: https://docs.cielo.com.br/llms.txt
  projectIndex: https://docs.cielo.com.br/ecommerce-cielo/llms.txt
---

# Criar transação com Google Pay na API E-commerce Cielo

A autorização com o token do Google Pay funciona como a de um cartão de crédito mas em vez de fornecer os dados do cartão, você deve fornecer os dados recebidos pelo Google Pay nos campos `Payment.Wallet.WalletKey` e `Payment.Wallet.AdditionalData.EphemeralPublicKey`, como mostra o exemplo:

> **Atenção**: A integração a seguir deve ser feita por lojas que enviam dados de cartão de forma criptografada. Se a sua loja envia a requisição de autorização de e-wallet com dados descriptografados, vá para <a href="https://docs.cielo.com.br/ecommerce-cielo/reference/e-wallet-descriptografado" target="_blank">Cartão descriptografado</a>.

**Exemplo de transação com os campos de e-wallet**

```json
{
  "MerchantOrderId": "2014111708",
  "Customer": {
    (…)
  },
  "Payment": {
    "Type": "CreditCard",
    "Amount": 100,
    "Installments": 1,
    "Wallet": {
      "Type": "AndroidPay",
      "WalletKey": "{\"encryptedMessage\": \"ZW5jcnlwdGVkTWVzc2FnZQ==\",\"ephemeralPublicKey\": \"ZXBoZW1lcmFsUHVibGljS2V5\",\"tag\": \"c2lnbmF0dXJl\"}",
      "AdditionalData": {
        "Signature": "ZXBoZW1lcmFsUHVibGljS2V5"
      }
    }
  }
}
```

| Parâmetro                                 | Descrição                                                                                | Tipo e tamanho |
| ----------------------------------------- | ---------------------------------------------------------------------------------------- | -------------- |
| `Payment.Wallet.Type`                     | Nome do provedor de meio de pagamento. Para transações Google Pay, utilize "AndroidPay". | String (15)    |
| `Payment.Wallet.WalletKey`                | Preencher com o valor do parâmetro `signedMessage` retornado pelo Google Pay.            | String         |
| `Payment.Wallet.AdditionalData.Signature` | Preencher com o valor do parâmetro `signature` retornado pelo Google Pay.                | String         |

> ℹ️
>
> Vá para a <a href="https://docs.cielo.com.br/ecommerce-cielo/reference/e-wallet-criptografado" target="_blank">Referência da API para acessar os exemplos completos de requisição e resposta</a>.