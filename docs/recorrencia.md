---
updatedAt: 2026-10-20T18:39:31.000Z
agentTools:
  siteIndex: https://docs.cielo.com.br/llms.txt
  projectIndex: https://docs.cielo.com.br/ecommerce-cielo/llms.txt
---

# Sobre a recorrência

## O que é a recorrência?

A recorrência é um modelo de cobrança periódica, geralmente mensal, e usada para serviços ou produtos programados/contínuos, como serviços de streaming, assinaturas e mensalidades para cobrar seus clientes de forma mais prática.

**Qual é o impacto do uso no meu negócio?**

Ao usar a recorrência, a loja tem a facilidade de gerar cobranças periódicas sem a necessidade do portador do cartão participar do processo mais do que uma vez. Com isso, a recorrência pode aumentar a conversão.

## Como usar a recorrência?

Existem dois tipos de recorrência:

* **Recorrência própria**: quando a **loja** cria a própria inteligência de repetição de compra e armazena os dados do cartão. A loja deve criar a transação recorrente nas datas acordadas com o comprador. As transações recorrentes enviadas pela loja precisam ter a marcação de recorrência (`Payment.Recurrent` igual a *true*);
* **Recorrência programada Cielo**: quando a **Cielo** é responsável pela inteligência da repetição e armazenamento dos dados do cartão. A loja envia os detalhes de cobrança, período (mensal, semestral, anual etc) e a data final de recorrência. Com estas informações, a Cielo cria a recorrência e o valor da transação será cobrado na periodicidade escolhida até a data final.

> Saiba mais sobre [Recorrência Própria](https://docs.cielo.com.br/ecommerce-cielo/docs/recorrencia#recorr%C3%AAncia-pr%C3%B3pria) e [Recorrência Programada](https://docs.cielo.com.br/ecommerce-cielo/docs/recorrencia#recorr%C3%AAncia-programada).
>
> Solicite a habilitação da funcionalidade para [Suporte E-commerce](https://docs.cielo.com.br/ecommerce-cielo/docs/suporte-cielo).

<br />

> ℹ️ **Meios de pagamento aceito**:
>
> * **Recorrência própria**: cartão de crédito e débito;
> * **Recorrência programada Cielo**: cartão de crédito.

**O que não fazer?**

* Não envie a primeira transação da recorrência sem o CVV ou o `CardOnFile`: a primeira transação da recorrência deve obrigatoriamente informar o CVV ou o `CardOnFile`;
* Não envie a transação com a função parcelada (mais de uma parcela) e recorrente ao mesmo tempo;
* Não envie pedidos recorrentes sem a marcação de recorrência (`Payment.Recurrent` para recorrência própria e `RecurrentPayment` para recorrência programada);
* Não envie uma transação recorrente usando cartão inválido: sempre valide o cartão no Zero Auth antes de criar a recorrência.

> ℹ️ Importante
>
> O motor de recorrência Cielo possui configurações de retentativas, podendo reprocessar transações negadas (exceto as irreversíveis) já considerando as regras do <Anchor label="Programa de Retentativa das Bandeiras" target="_blank" href="https://docs.cielo.com.br/ecommerce-cielo/reference/retentativa-bandeira">Programa de Retentativa das Bandeiras</Anchor>.

## Identificadores de transações com credenciais armazenadas

Conforme as regras das bandeiras, as transações recorrentes exigem o envio de campos de identificação que vinculam cada cobrança à transação CIT original: o `IssuerTransactionId` (todas as bandeiras) e o `TransactionLinkId` (Mastercard). Na recorrência própria, envie também o `Payment.OriginalRecurrentAmount`. Na recorrência programada, os campos `IssuerTransactionId` e `TransactionLinkId` são enviados automaticamente nas transações seguintes.

### Identificador das bandeiras: `IssuerTransactionId`

O identificador da bandeira (`IssuerTransactionId`) é um código retornado na resposta da transação CIT ou da validação do cartão [(Zero Auth)](https://docs.cielo.com.br/ecommerce-cielo/docs/zero-auth) e enviado, obrigatoriamente, nas transações recorrentes seguintes de todas as bandeiras. Saiba mais em [Identificadores de bandeira](https://docs.cielo.com.br/ecommerce-cielo/docs/identificadores-de-bandeira).

### TLID Mastercard

O **Transaction Link Identifier (TLID)**, enviado e retornado no campo `TransactionLinkId`, é um identificador único gerado pela bandeira **Mastercard** durante uma transação. Esse identificador é criado na transação CIT e deve ser enviado, junto com o `IssuerTransactionId`, para relacionar todas as transações subsequentes (MIT) do mesmo ciclo.

| Fase   | Data                   | Descrição                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                       |
| ------ | ---------------------- | --------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| Fase 1 | Vigente                | Disponibilização do `TransactionLinkId` na resposta da [validação de cartão por Zero Auth](https://docs.cielo.com.br/ecommerce-cielo/reference/validar-cartao), [criação de pagamento com cartão de crédito](https://docs.cielo.com.br/ecommerce-cielo/reference/criar-pagamento-credito) ,[criação de pagamento com cartão de débito](https://docs.cielo.com.br/ecommerce-cielo/reference/debito) e na [consulta por `PaymentId`](https://docs.cielo.com.br/ecommerce-cielo/reference/consulta-paymentid-api). |
| Fase 2 | A partir de 23/10/2026 | Envio obrigatório do `TransactionLinkId` no request (MIT)                                                                                                                                                                                                                                                                                                                                                                                                                                                       |

> Saiba mais em [Identificadores de bandeira](https://docs.cielo.com.br/ecommerce-cielo/docs/identificadores-de-bandeira).