---
updatedAt: 2026-04-10T13:05:56.000Z
agentTools:
  siteIndex: https://docs.cielo.com.br/llms.txt
  projectIndex: https://docs.cielo.com.br/ecommerce-cielo/llms.txt
---

# Lista de status da recorrência de cartão de crédito

Possíveis status de recorrência

A [consulta da recorrência de cartão de crédito](https://docs.cielo.com.br/ecommerce-cielo/reference/consulta-recorrencia-api) retorna o status da recorrência no parâmetro `Payment.RecurrentPayment.Status`. Confira a seguir os status possíveis.

| Código | Descrição                                                    | Meio de pagamento |
| ------ | ------------------------------------------------------------ | :---------------- |
| 1      | Recorrência ativa.                                           | Cartão de crédito |
| 2      | Recorrência atingiu a data final.                            | Cartão de crédito |
| 3      | Recorrência desativada pelo estabelecimento.                 | Cartão de crédito |
| 4      | Recorrência desativada por atingir o máximo de tentativas.   | Cartão de crédito |
| 5      | Recorrência desativada devido a cartão de crédito expirado.  | Cartão de crédito |
| 8      | Recorrência desativada devido a bloqueio do estabelecimento. | Cartão de crédito |

<br />