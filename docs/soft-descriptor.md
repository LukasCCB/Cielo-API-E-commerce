---
updatedAt: 2026-10-14T14:48:26.000Z
agentTools:
  siteIndex: https://docs.cielo.com.br/llms.txt
  projectIndex: https://docs.cielo.com.br/ecommerce-cielo/llms.txt
---

# Soft Descriptor

O **Soft Descriptor** é uma funcionalidade que permite personalizar o nome exibido na fatura do cartão do portador. Isso proporciona maior transparência para o consumidor e ajuda a reduzir as chances de chargeback, pois muitos clientes contestam compras por não reconhecerem o nome do estabelecimento na fatura.

Para utilizar essa funcionalidade, basta preencher o campo `SoftDescriptor` dentro do nó `Payment`, que é opcional.

<Callout icon="ℹ️" theme="info">
  O campo `SoftDescriptor` pode ser utilizado na <a href="https://docs.cielo.com.br/ecommerce-cielo/reference/criar-pagamento-credito" target="_blank">transação de crédito</a> e <a href="https://docs.cielo.com.br/ecommerce-cielo/reference/debito" target="_blank">transação de débito.</a>
</Callout>

## Benefícios do Soft Descriptor

• **Redução de chargeback:** descrições mais claras ajudam o cliente a reconhecer a transação, evitando cancelamentos indevidos.\
• **Identificação de marcas e filiais:** permite personalizar o nome conforme a marca, unidade ou campanha específica.\
• **Experiência do cliente:** oferece mais transparência, evitando que o cliente se confunda com descrições genéricas.

## Estrutura do Soft Descriptor

O lojista pode enviar um texto de até **13 caracteres** para compor o **Soft Descriptor**, que será exibido na fatura do portador ao lado do **Nome Fantasia** da loja.

Esse texto deve respeitar o limite total permitido por cada bandeira.

A composição sempre segue o formato:

**\[Nome Fantasia ou Hard Descriptor] + \* + \[Soft Descriptor]**

Onde:

**Nome Fantasia ou Hard Descriptor**\* → cadastrado no portal

**Asterisco** → separador obrigatório

**Soft Descriptor** → enviado via API

<Callout icon="ℹ️" theme="info">
  O Soft Descriptor não permite caracteres especiais.
</Callout>

## Regras por bandeira

### Visa

* Limite total: **25 caracteres**
* Nome Fantasia: até **12 caracteres** (inclui espaços)
* Asterisco: **1 caractere**

Soft Descriptor: **25 – (tamanho do Nome Fantasia) – 1**

### Mastercard

* Limite total: **22 caracteres**
* Nome Fantasia: até **12 caracteres**
* Asterisco: **1 caractere**

Soft Descriptor: **22 – (tamanho do Nome Fantasia) – 1**

### Elo

* Limite total: **22 caracteres**
* Nome Fantasia: até **12 caracteres**
* Asterisco: **1 caractere**

Soft Descriptor: **22 – (tamanho do Nome Fantasia) – 1**

### Amex

* Limite total: **22 caracteres**
* Nome Fantasia: até **12 caracteres**
* Asterisco: **1 caractere**

Soft Descriptor: **22 – (tamanho do Nome Fantasia) – 1**

<br />

<Callout icon="⚠️" theme="warn">
  O Soft Descriptor não funciona para estabelecimentos com MCCs 5960 a 5969.
</Callout>