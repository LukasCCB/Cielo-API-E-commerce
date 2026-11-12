---
updatedAt: 2026-06-12T11:30:51.000Z
agentTools:
  siteIndex: https://docs.cielo.com.br/llms.txt
  projectIndex: https://docs.cielo.com.br/ecommerce-cielo/llms.txt
---

# O que é a tokenização na bandeira?

A tokenização na bandeira é a criação de um token no cofre da bandeira do cartão, em um um processo regulamentado pela <a href="https://www.emvco.com/" target="_blank">EMVco</a>. Esse token substitui os dados do cartão aberto, criando o DPAN (Device Primary Account Number), que é o cartão no formato tokenizado, e o criptograma, que é um código único para o DPAN em cada transação.

## Benefícios

* **Mais segurança:** além da criação de um código (token ou DPAN) para substituir a informação do cartão aberto (PAN), as bandeiras também emitem os criptogramas, que funcionam como uma senha ou assinatura da bandeira, única para cada transação;
* **Maior performance de aprovação:** as transações tokenizadas na bandeira tendem a aumentar a chance de aprovação pelos emissores uma vez que ocorre a substituição do cartão aberto (PAN) pelo token de bandeira (DPAN) no fluxo de autorização tornando o processo mais seguro.

## Tokenização transparente na bandeira Visa

Essa opção já está habilitada para todos os clientes da API E-commerce Cielo. Quando a loja envia uma transação com o cartão aberto (PAN) da bandeira Visa, a Cielo cria e armazena um token de bandeira (DPAN) junto à Visa.

<Callout icon="ℹ️" theme="info">
  A bandeira Visa cobra uma taxa de 0,05% do valor da transação para transações submetidas com o cartão aberto (PAN). Embora a API E-commerce Cielo aceite o envio do PAN para criação de transações, a Cielo cria e armazena um token da bandeira Visa para aquele cartão, com o objetivo de evitar custos adicionais para o estabelecimento.

  Por questões de segurança e conformidade com as regras das bandeiras, recomendamos que as lojas realizem a integração com a [tokenização e armazenamento de cartões no cofre Cielo](https://docs.cielo.com.br/ecommerce-cielo/docs/cielo-tokenization) .
</Callout>

## Integração facilitada Cielo

Para clientes que usam o Cartão Protegido (tokenização no cofre Cielo) e têm o serviço de tokenização de bandeira habilitado, a Cielo, ao receber uma transação com o `CardToken`, irá realizar o fluxo transacional com as informações do DPAN (token de bandeira) e criptograma (único por transação).

> **Bandeiras aceitas**: Visa, Master e Elo.

| Bandeira     | Forma de envio dos dados de pagamento                                                                                                   | Habilitação do serviço                                                                                                                                                                                  |
| ------------ | --------------------------------------------------------------------------------------------------------------------------------------- | ------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| Visa         | A loja armazena e envia os dados do cartão real (PAN) ou o `CardToken` na autorização, e a Cielo associa os dados ao token da bandeira. | Habilitado para todas as lojas integradas à API E-commerce Cielo.                                                                                                                                       |
| Master e Elo | A loja armazena e envia o `CardToken` na autorização, e a Cielo associa o `CardToken` ao token da bandeira.                             | A loja que já usa a tokenização e armazenamento no cofre (`CardToken`) pode habilitar a tokenização na bandeira junto ao [suporte Cielo](https://docs.cielo.com.br/ecommerce-cielo/docs/suporte-cielo). |

> No extrato, será exibido o **token da bandeira**, e não mais as informações do cartão original.

> ⚠️ Atenção
>
> O sucesso da criação do DPAN está sujeito à elegibilidade do BIN do cartão de acordo com regras da bandeira do cartão.

### Fluxo da tokenização na bandeira

<Image align="center" src="https://files.readme.io/aae65867a951801088ed80d35911014f662d2b85a1c27bef5e489a546e20b5d2-tokenizacao-bandeira.png" />

<br />

1. O comprador informa os dados do cartão (PAN) e permite que a loja armazene os dados do cartão (seja para compras recorrentes ou futuras compras com um clique);
2. A loja solicita validação do cartão no Zero Auth;
3. O Zero Auth retorna que o cartão é válido;
4. A loja solicita a tokenização do cartão para a API E-commerce Cielo;
5. A API E-commerce Cielo solicita a tokenização na bandeira (DPAN);
6. A bandeira retorna o DPAN e o criptograma para a API E-commerce Cielo;
7. A API E-commerce Cielo armazena o DPAN e cria e armazena o `CardToken` no Cartão Protegido;
8. A API E-commerce Cielo informa para a loja o token criado para o cartão no parâmetro `CardToken`;
9. A loja armazena o `CardToken` para futuras transações.

<br />

> ℹ️ Confira na referência da API os exemplos de:
>
> * <a href="https://docs.cielo.com.br/ecommerce-cielo/reference/criar-cardtoken" target="_blank">Criação do `CardToken` antes da autorização</a>;
> * <a href="https://docs.cielo.com.br/ecommerce-cielo/reference/cardtoken-autorizacao" target="_blank">Criação do `CardToken` durante a autorização</a>;
> * <a href="https://docs.cielo.com.br/ecommerce-cielo/reference/cartao-tokenizado-api" target="_blank">Criação de pagamento com `CardToken` existente</a>.