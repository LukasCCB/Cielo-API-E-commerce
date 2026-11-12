---
updatedAt: 2026-10-22T19:22:11.000Z
agentTools:
  siteIndex: https://docs.cielo.com.br/llms.txt
  projectIndex: https://docs.cielo.com.br/ecommerce-cielo/llms.txt
---

# Criando recorrências

> ℹ️
>
> Vá para a <a href="https://docs.cielo.com.br/ecommerce-cielo/reference/criar-recorrencia" target="\_blank">Referência da API para acessar os exemplos completos de requisição e resposta</a>.

A marcação de recorrência é importante para a segurança de uma transação recorrente, para evitar que seja negada por suspeita de fraude. Sendo assim:

* Envie o campo `Payment.Recurrent` = "true" no caso de recorrência própria;
* Envie o nó `RecurrentPayment` no caso de recorrência programada;
* Para transações recorrentes com credenciais armazenadas:
  * Envie o campo `CardOnFile.Usage`. Saiba mais em <a href="https://docs.cielo.com.br/ecommerce-cielo/reference/card-on-file" target="_blank">Card On File</a>;
  * Para cartões Mastercard, envie o nó de indicador do início da transação (`Payment.InitiatedTransactionIndicator`), para informar se a transação foi iniciada pelo comprador ou pela loja. Saiba mais em Indicador de Início da Transação Mastercard.

É possível alterar os dados de uma recorrência:

* Dados do comprador
* Data final;
* Intervalo;
* Dia do pagamento;
* Valor;
* Data do próximo pagamento;
* Dados do pagamento.

Além disso, é possível também:

* Desativar um pedido recorrente;
* Reativar um pedido recorrente.
* Consulte a Referência da API para os exemplos de como fazer essas modificações via API.

> ℹ️
>
> Para consultar uma transação recorrente e visualizar todos os seus detalhes, acesse a [referência da API](https://docs.cielo.com.br/ecommerce-cielo/reference/consulta-recorrencia-api).