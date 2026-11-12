---
updatedAt: 2026-09-29T19:46:49.000Z
agentTools:
  siteIndex: https://docs.cielo.com.br/llms.txt
  projectIndex: https://docs.cielo.com.br/ecommerce-cielo/llms.txt
---

# Tabela de ECI

O **ECI** (Electronic Commerce Indicator) é um código retornado pelas bandeiras e **indica o resultado da autenticação 3DS** do portador do cartão junto ao emissor ou bandeira.

Com base no resultado do ECI a loja deve decidir se vai prosseguir com a transação submetendo-a para autorização ou não. É possível enviar uma transação não autenticada para autorização, mas a responsabilidade em caso de chargeback é do estabelecimento.

Confira na tabela a seguir os ECIs correspondentes à cada bandeira e o resultado da autenticação.

<Callout icon="⚠️" theme="warn">
  ### Posteriormente, envie o valor do ECI na requisição da transação de crédito ou débito no campo `Payment.ExternalAuthentication.Eci`.
</Callout>

| Mastercard               | Visa                     | Elo                  | Amex                 | Resultado da autenticação                                                                                        | A transação foi autenticada? |
| ------------------------ | ------------------------ | -------------------- | :------------------- | ---------------------------------------------------------------------------------------------------------------- | ---------------------------- |
| 02                       | 05                       | 05                   | 05                   | **Autenticada** pelo emissor – risco de chargeback passa a ser do emissor.                                       | Sim                          |
| 01                       | 06                       | 06                   | 06                   | **Autenticada** pela bandeira – risco de chargeback passa a ser do emissor.                                      | Sim                          |
| -                        | -                        | 04                   | -                    | **Autenticada in app** (e-wallet) - risco de chargeback passa a ser do emissor.                                  | Sim                          |
| Diferente de 01, 02 e 04 | Diferente de 05, 06 e 07 | Diferente de 05 e 06 | Diferente de 05 e 06 | Não autenticada – risco de chargeback permanece com o estabelecimento.                                           | Não                          |
| 04                       | 7                        | -                    | -                    | Não autenticada, transação caracterizada como *Data Only* – risco de chargeback permanece com o estabelecimento. | Não                          |