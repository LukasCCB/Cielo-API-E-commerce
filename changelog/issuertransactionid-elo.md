---
agentTools:
  siteIndex: https://docs.cielo.com.br/llms.txt
  projectIndex: https://docs.cielo.com.br/ecommerce-cielo/llms.txt
---

# IssuerTransactionId obrigatório para Elo

> **Nota:&#x20;**&#x41; versão em inglês desta nota de versão está disponível abaixo da versão em português.&#x20;
>
> **Note:&#x20;**&#x54;he English version of this release note is available below the Portuguese version.

## Atenção: preenchimento obrigatório do IssuerTransactionId para Elo

**Bandeira:** Elo
**Afeta:** Recorrência, Autorização Incremental e Venda Reautorizada

O preenchimento do campo `IssuerTransactionId` é obrigatório para transações
Elo de **Pagamento Recorrente**, **Autorização Incremental** e **Venda no Cartão
Reautorizada**.

Lojas que processam esses cenários com a bandeira Elo devem armazenar o
identificador retornado na transação original (CIT) e enviá-lo em todas as
transações MIT subsequentes do mesmo ciclo.

**Saiba mais:** [Identificadores de bandeira](https://docs.cielo.com.br/ecommerce-cielo/docs/identificadores-de-bandeira)

***

## Warning: IssuerTransactionId is mandatory for Elo

**Brand:** Elo
**Affects:** Recurrence, Incremental Authorization, and Reauthorized Sale

The `IssuerTransactionId` field is mandatory for Elo transactions of
**Recurring Payment**, **Incremental Authorization**, and **Reauthorized Card
Sale**.

Merchants processing these scenarios with the Elo brand must store the
identifier returned in the original transaction (CIT) and send it in all
subsequent MIT transactions of the same cycle.

**Learn more:** [Brand identifiers](https://docs.cielo.com.br/ecommerce-cielo/docs/identificadores-de-bandeira)