---
updatedAt: 2026-01-08T14:52:23.000Z
agentTools:
  siteIndex: https://docs.cielo.com.br/llms.txt
  projectIndex: https://docs.cielo.com.br/ecommerce-cielo/llms.txt
---

# Cartão multibenefícios

## O que é o cartão multibenefícios?

Os cartões multibenefícios são um novo meio de pagamento que contemplam os benefícios de vale alimentação, refeição, cultura e transporte em um único cartão.

Na API E-commerce, o cartão multibenefício funciona de maneira semelhante ao pagamento de cartão de crédito, mas é necessário informar o parâmetro `Voucher` = *true*.

> ℹ️ Confira na Referência da API a requisição completa em <a href="https://docs.cielo.com.br/ecommerce-cielo/reference/criar-pagamento-multibeneficios" target="_blank">**Criar pagamento com cartão multibenefícios**</a>

## Bandeiras aceitas

A API E-commerce aceita cartões multibenefícios das seguintes bandeiras:

* Visa;
* Mastercard;
* Elo.

> ℹ️ Para habilitar o meio de pagamento cartão multibenefícios, entre em contato com seu gestor comercial.

<br />

> ⚠️ Atenção
>
> O voucher **Alelo multibenefícios** usa a integração de <Anchor label="voucher convencional" target="_blank" href="https://docs.cielo.com.br/ecommerce-cielo/reference/criar-pagamento-com-voucher">voucher convencional</Anchor> .