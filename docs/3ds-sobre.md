---
updatedAt: 2025-10-30T01:02:17.000Z
agentTools:
  siteIndex: https://docs.cielo.com.br/llms.txt
  projectIndex: https://docs.cielo.com.br/ecommerce-cielo/llms.txt
---

# O que é a autenticação 3DS?

## O que é autenticação 3DS?

É um protocolo de autenticação que confirma se o comprador é de fato o portador do cartão (de crédito ou débito). O objetivo do **3DS** (também chamado de EMV 3DS) é evitar fraudes em transações de cartão não presente (CNP).

Por meio do 3DS, os dados do comprador são enviados para as **bandeiras e emissores do cartão**, que irão **realizar a autenticação**.

> ℹ️
>
> 3DS significa **3-D Secure Protocol** e foi desenvolvido pela <a href="https://www.emvco.com/emv-technologies/3-d-secure/" target="_blank">EMVCo</a>, um corpo técnico formado pelas principais bandeiras de cartão e que cria especificações para a interoperabilidade e aceitação de pagamentos de forma segura no mundo todo.

Para realizar a autenticação, a loja precisa enviar os dados do comprador para a bandeira por meio de um serviço intermediário, o 3DS Server, que faz a comunicação com a bandeira. É possível usar um 3DS Server externo ou o 3DS Server Cielo

> Se sua loja usa um 3DS Server externo à Cielo para autenticação de cartões, você deve informar o `Cavv` retornado pelo seu 3DS Server na requisição de autorização do Gateway. Para mais informações, pule para a etapa de [Autorização com Autenticação](https://docs.cielo.com.br/ecommerce-cielo/docs/autorizacao-autenticacao).

**Principais benefícios:**

* A responsabilidade em caso de <Glossary>chargeback</Glossary> de uma transação autenticada é do emissor ou da bandeira;
* Integração facilitada via JavaScript;
* Possibilidade de *autenticação silenciosa* (autenticação sem <Glossary>desafio</Glossary>);
* Minimiza transações com fraudes.

> ℹ️ Veja como <a href="https://docs.cielo.com.br/ecommerce-cielo/docs/como-habilitar-microsservi%C3%A7os#3ds" target="_blank">habilitar a autenticação 3DS</a>.

## Protocolo 3DS versão 2.2

A Cielo disponibiliza a versão mais recente do protocolo de autenticação 3DS para a integração.

> ✅ Como migrar para o 3DS 2.2?
>
> * O 3DS 2.2 está disponível e é obrigatório para as bandeiras Visa e Mastercard;
> * Para migrar, envie todos os campos assinalados como obrigatórios no <a href="https://docs.cielo.com.br/ecommerce-cielo/docs/mapeando-classes" target="_blank">Mapeamento de Classes</a>. Não há campos novos (com relação ao 3DS 2.0).

<br />

**Importante**:

* **O chargeback é a contestação de uma compra de cartão de débito ou crédito** feita pelo portador do cartão, ao não reconhecer determinada compra. A autenticação 3DS ajuda a diminuir a ocorrência de chargeback por fraude, uma vez que a responsabilidade em caso de chargeback passa a ser do emissor, e não da loja. Essa transferência de responsabilidade em caso de chargeback é chamada de *liability shift*;

> Saiba mais em <a href="https://docs.cielo.com.br/ecommerce-cielo/docs/prevencao#chargebacks" target="_blank">prevenção a fraudes e chargeback</a>.

* A **autenticação 3DS** não é uma análise de fraude; para aumentar a segurança das suas transações, recomendamos o uso da Autenticação 3DS e também de um serviço de análise de fraude, como o <a href="https://docs.cielo.com.br/risco/docs/antifraude#benef%C3%ADcios-do-antifraude-gateway" target="_blank">Antifraude</a>.

## Quem pode usar o 3DS?

Qualquer e-commerce pode usar a solução como uma camada extra de segurança para as suas transações.

## Quais são requisitos para a utilização do 3DS?

O e-commerce deve atender aos seguintes requisitos:

* Ter afiliação com uma das adquirentes atendidas;
* Concluir a integração técnica do protocolo de autenticação;
* Concluir a integração técnica da <Glossary>autorização</Glossary>.

## Quando usar?

A Autenticação 3DS é **obrigatória para todas as transações de cartão de débito** e opcional para transações de cartão de crédito.

## Como saber se a transação foi autenticada?

Isso irá depender do resultado da [Tabela de ECI.](https://docs.cielo.com.br/ecommerce-cielo/docs/tabela-de-eci)

## O 3DS 2.2 autentica o portador em transações recorrentes?

* A integração atual autentica a primeira transação de uma recorrência. Nas transações subsequentes, a responsabilidade em caso de chargeback permanece com o estabelecimento;
* As transações recorrentes com cartões armazenados (`CardToken`) não passam pela autenticação;
* Para transação recorrente, é necessário enviar todos os campos `bpmpi_recurring` na primeira transação. Nas transações subsequentes, não é preciso enviar os campos `bpmpi_recurring`.

## Quais são os tipos de autenticação do portador?

* **Autenticação sem desafio (autenticação silenciosa)**: quando o emissor realiza a autenticação sem a necessidade de validação complementar do portador;
* **Autenticação com desafio**: quando o emissor precisa realizar uma validação complementar do portador do cartão e apresenta um desafio, que pode ser a confirmação de um código enviado pelo aplicativo do banco, por SMS etc.

<br />

## É possível usar outro 3DS Server/MPI externo à Cielo ao criar pagamentos na API E-commerce Cielo?

Sim. Se a loja está integrada à uma solução de autenticação 3DS externa à Cielo, envie o resultado dessa autenticação no nó `Payment.ExternalAuthentication` ao criar uma transação de cartão de <a href="https://docs.cielo.com.br/ecommerce-cielo/reference/criar-pagamento-credito" target="_blank">débito</a> ou <a href="https://docs.cielo.com.br/ecommerce-cielo/reference/debito" target="_blank">crédito</a>.