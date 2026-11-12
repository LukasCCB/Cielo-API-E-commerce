---
updatedAt: 2025-10-30T01:05:41.000Z
agentTools:
  siteIndex: https://docs.cielo.com.br/llms.txt
  projectIndex: https://docs.cielo.com.br/ecommerce-cielo/llms.txt
---

# Mandate Visa para tokenização

Confira as regras da bandeira Visa para a tokenização

## Qual é a regra de token de bandeira para a Visa?

A Visa cobra de forma incremental 0,05% sobre o valor de toda transação online aprovada com o cartão aberto (PAN). O objetivo é aumentar a adoção do token de bandeira (network token), e melhorar a segurança das transações online.

> Essa cobrança é realizada pela Visa desde fevereiro de 2024.

A seguir, explicamos quais opções a Cielo oferece para que os clientes possam se adequar à regra.

***

## Opção 1: tokenização transparente

A **tokenização transparente** é feita para transações de cartão de crédito Visa de **estabelecimentos que não usam a tokenização e armazenamento no cofre Cielo**.

> ✅
>
> **Produtos Elegíveis:** API E-commerce Cielo, API 1.5 (legado), Link de Pagamento e Checkout Cielo.

### Como funciona?

Quando uma transação online com o cartão de crédito aberto (PAN) da bandeira Visa for recebida em nossa API, a **Cielo automaticamente cria um token da bandeira Visa** para aquele cartão\*. Dessa forma, a transação será recebida pela Visa já com o token, **evitando a cobrança da taxa de 0,05%**.

> \*\O token de bandeira será criado se o cartão for elegível.

### O token da bandeira é armazenado nos sistemas da Cielo?

Sim, o token da bandeira é armazenado no sistema da Cielo e usado nas transações seguintes do mesmo cartão e estabelecimento.

> ℹ️
>
> A Cielo não irá retornar o token a bandeira (DPAN e criptograma) para o estabelecimento.

### Quais transações são elegíveis?

Segundo a bandeira, aproximadamente 90% dos BINs Visa (seis primeiros dígitos do cartão) são elegíveis à tokenização.

### Existe custo adicional?

Neste momento a Cielo não cobra pela solução, de forma a propiciar a experiência da tokenização para nossos clientes e mitigar o custo da taxa de 0,05% sobre o valor da transação. Futuramente este tema poderá ser reavaliado.

### É necessário fazer alguma modificação na integração ou solicitar a funcionalidade para a Cielo?

Não, essa será uma tokenização transparente e não há necessidade de nenhuma integração adicional. A solução está habilitada para todos os nossos clientes.

### Qual o impacto dessa solução para estabelecimentos que já usam a tokenização de bandeira?

Caso o estabelecimento já esteja usando a tokenização de bandeira, a Cielo irá identificar que a transação já foi tokenizada com a bandeira Visa, e irá seguir para autorização com os dados já fornecidos.

### O que acontece em caso de indisponibilidade do token?

Em caso de *timeout* ou indisponibilidade da bandeira ou do emissor que impeça o provisionamento do token/criptograma para o cartão, a Cielo irá enviar a transação para autorização com o número do cartão (PAN), a fim de evitar a perda  venda.

Caso a loja opte por fazer a gestão do token de bandeira por conta própria, é possível criar transações na API E-commerce Cielo usando o modelo de [tokenização externa](https://docs.cielo.com.br/ecommerce-cielo/docs/external-token) .

<br />

***

## Opção 2: tokenização facilitada

A **tokenização facilitada** é feita para transações de cartão de crédito Visa de **estabelecimentos que já armazenam o`CardToken` da Cielo**.

Nessa opção, a loja se integra com a tokenização e armazenamento no cofre da Cielo, que cria um `CardToken` para ser armazenado pela loja. Em paralelo, a Cielo cria e armazena um token da bandeira Visa. Dessa forma, os estabelecimentos sempre terão um único token para aquele cartão (`CardToken`), mas a Cielo terá os tokens e criptogramas da bandeira Visa armazenados de forma segura e com uma integração facilitada e única.

### É necessário fazer alguma modificação na integração ou solicitar a funcionalidade para a Cielo?

Não, se a loja já estiver integrada à tokenização da Cielo e armazenando o `CardToken`, não há necessidade de integração adicional.

### O token é armazenado nos sistemas da Cielo?

Sim, o token da bandeira é armazenado no sistema da Cielo e usado nas transações seguintes do mesmo cartão e estabelecimento.

### Quais transações são elegíveis?

Segundo a bandeira, aproximadamente 90% dos BINs Visa (seis primeiros dígitos do cartão) são elegíveis à tokenização.

### Existe custo adicional?

A solução não tem custos adicionais para clientes da API E-commerce Cielo.

### Como obter essa funcionalidade?

É necessário solicitar a habilitação para o Suporte E-commerce pelo e-mail **<cieloecommerce@cielo.com.br>**.