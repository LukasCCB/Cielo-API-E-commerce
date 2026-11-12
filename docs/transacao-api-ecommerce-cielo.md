---
updatedAt: 2025-10-30T01:04:30.000Z
agentTools:
  siteIndex: https://docs.cielo.com.br/llms.txt
  projectIndex: https://docs.cielo.com.br/ecommerce-cielo/llms.txt
---

# Criar transação com Apple Pay na API E-commerce Cielo

A autorização com o token do Apple Pay funciona como a de um cartão de crédito mas em vez de fornecer os dados do cartão, você deve fornecer os dados recebidos pelo Apple Pay nos campos `Payment.Wallet.WalletKey` e `Payment.Wallet.AdditionalData.EphemeralPublicKey`, como mostra o exemplo:

**Exemplo de transação com os campos de e-wallet**

```json
{
   "MerchantOrderId": "2017051002",
   "Customer": {
     (…)
   },
   "Payment": {
      "Type": "CreditCard",
      "Amount": 1000,
      "Installments": 1,
      "Currency": "BRL",
      "Wallet": {
         "Type": "ApplePay",
         "WalletKey":"['paymentData.data']",
         "AdditionalData": {
            "EphemeralPublicKey": "['ephemeralPublicKey.header.EphemeralPublicKey']"
         }
      }
   }
}
```

| Parâmetro                                          | Descrição                                                                                                   | Tipo e Tamanho |
| -------------------------------------------------- | ----------------------------------------------------------------------------------------------------------- | -------------- |
| `Payment.Wallet.Type`                              | Nome do provedor do meio de pagamento. Para transações Apple Pay, utilize "ApplePay".                       | String (15)    |
| `Payment.Wallet.WalletKey`                         | Preencher com o valor do parâmetro `paymentData.data` retornado pelo Apple Pay.                             | String         |
| `Payment.Wallet.AdditionalData.EphemeralPublicKey` | Preencher com o valor do parâmetro `ephemeralPublicKey.header.EphemeralPublicKey` retornado pelo Apple Pay. | String         |

> ℹ️
>
> Vá para a <a href="https://docs.cielo.com.br/ecommerce-cielo/reference/e-wallet-criptografado" target="_blank">Referência da API para acessar os exemplos completos de requisição e resposta</a>.