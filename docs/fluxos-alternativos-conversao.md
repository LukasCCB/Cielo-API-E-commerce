---
updatedAt: 2026-10-14T14:48:51.000Z
agentTools:
  siteIndex: https://docs.cielo.com.br/llms.txt
  projectIndex: https://docs.cielo.com.br/ecommerce-cielo/llms.txt
---

# Fluxos para conversão não realizada

Quando o comprador **usa um cartão estrangeiro, mas não aceita** a opção de conversão de moeda ou quando usa um **cartão de crédito nacional ou cartão de débito**, ainda será possível criar a transação.

Nesses cenários, também será obrigatório enviar a confirmação e **a transação será autorizada em reais**. Confira a seguir os fluxos possíveis.

## Fluxo com cartão de crédito estrangeiro e venda em reais

Nesse cenário, o comprador não concorda com a opção de conversão de moedas apresentada. A loja irá enviar a requisição de confirmação da transação com o campo `CurrencyConversion` igual a *false* e a transação será confirmada em reais.

![Fluxo com cartão de crédito estrangeiro e venda em reais](https://files.readme.io/8789696150098979d71c2bb3251b7acb928e62400ba5e872f61c5684c8fe2983-image.png)

<br />

### Etapa de conversão da moeda

1. Na página de checkout da loja, o comprador escolhe pagar com cartão de crédito estrangeiro;
2. O back-end da loja envia a requisição de autorização (POST/1/sales), informando o campo `DynamicCurrencyConversion` igual a *true*;
3. A API E-commerce Cielo retorna o nó `CurrencyExchangeData` com as opções de câmbio;
4. O front-end da loja exibe as opções de conversão na página de checkout.

### Etapa de confirmação

5. O comprador não concorda em pagar na moeda estrangeira;
6. A loja envia requisição de confirmação da conversão com o campo `CurrencyConversion` igual a *false* (PUT/1/sales);
7. A API E-commerce Cielo segue com a autorização em reais e envia retorno de sucesso;
8. A loja envia confirmação de pagamento ao comprador.

## Fluxo com cartão nacional ou cartão de débito

Nesse cenário, a API irá responder à requisição de autorização com o retorno de “cartão não elegível” e a transação estará com o status pendente. Para seguir com a criação da transação, a loja poderá enviar a requisição de confirmação com o campo `CurrencyConversion` igual a *false* e a transação será confirmada em reais.

![Fluxo com cartão nacional ou cartão de débito](https://files.readme.io/70750319ce7c0035a439bd8980db12b0bddba4cf2c0e6343922ceaa668ac44c4-image.png)

<br />

### Etapa de conversão da moeda

1. Na página de checkout da loja, o comprador envia solicitação de pagamento com cartão de crédito nacional ou cartão de débito;
2. O back-end da loja solicita a requisição de autorização (POST/1/sales), informando o campo `DynamicCurrencyConversion` igual a *true*;
3. A API E-commerce Cielo retorna informando que o cartão nacional não é elegível e o status ficará como pendente (`Status`= 11).

### Etapa de confirmação

4. A loja envia a confirmação da transação em real para a API E-commerce Cielo (PUT/1/sales), informando o campo `CurrencyConversion` igual a *false*;
5. A API E-commerce Cielo autoriza e confirma pagamento;
6. A loja envia confirmação de pagamento ao comprador.