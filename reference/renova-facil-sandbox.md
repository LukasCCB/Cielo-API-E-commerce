---
updatedAt: 2025-10-30T01:07:01.000Z
agentTools:
  siteIndex: https://docs.cielo.com.br/llms.txt
  projectIndex: https://docs.cielo.com.br/ecommerce-cielo/llms.txt
---

# Renova Fácil em sandbox

Para simular uma transação com retorno de um novo cartão, atualizado pelo nosso serviço <a href="https://docs.cielo.com.br/ecommerce-cielo/docs/renova-facil" target="_blank">Renova Fácil</a>, siga as orientações a seguir.

Na requisição de autorização, além dos campos já previstos para o meio de pagamento utilizado, é necessário enviar os seguintes:

* No campo `CreditCard.CardNumber`: enviar um cartão com o número final sendo 3 (que simula um cenário de cartão vencido, vide tabela de cartões simulados presente na documentação);
* No campo `CreditCard.ExpirationDate`: enviar uma data de validade já vencida;
* Envie o campo `Payment.Recurrent` preenchido como *true*, para marcar a transação como recorrente.

Saiba mais sobre o [Renova Fácil](https://docs.cielo.com.br/ecommerce-cielo/docs/renova-facil).