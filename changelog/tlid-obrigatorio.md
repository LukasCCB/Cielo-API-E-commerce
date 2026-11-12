---
agentTools:
  siteIndex: https://docs.cielo.com.br/llms.txt
  projectIndex: https://docs.cielo.com.br/ecommerce-cielo/llms.txt
---

# TLID obrigatório para transações MIT Mastercard

> **Nota:&#x20;**&#x41; versão em inglês desta nota de versão está disponível abaixo da versão em português.&#x20;
>
> **Note:&#x20;**&#x54;he English version of this release note is available below the Portuguese version.

A partir de **23 de outubro de 2026**, o envio do `TransactionLinkId` (TLID) passa a ser **obrigatório** nas transações iniciadas pelo estabelecimento (MIT) vinculadas a uma transação original do portador (CIT). Isso vale para cobranças recorrentes, parcelas futuras, cartão armazenado (card-on-file), cobranças pós-autorizadas e demais MITs ligadas a uma compra original.

**O que fazer:** armazene o TLID recebido na transação CIT e envie-o nas MITs seguintes no campo `Payment.TransactionLinkId`.

```json
{
  "Payment": {
    "TransactionLinkId": "aB3dE5fG7hI9jK1lM3nO5p"
  }
}
```

***

Starting **October 23, 2026**, sending the `TransactionLinkId` (TLID) becomes **required** for merchant-initiated transactions (MIT) linked to an original cardholder-initiated transaction (CIT). This applies to recurring charges, future installments, card-on-file payments, post-authorized charges, and any other MIT tied to an original purchase.

**What to do**: store the TLID received in the CIT transaction and send it in subsequent MITs in the `Payment.TransactionLinkId` field.

```json
{
  "Payment": {
    "TransactionLinkId": "aB3dE5fG7hI9jK1lM3nO5p"
  }
}
```