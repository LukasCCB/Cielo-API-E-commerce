---
updatedAt: 2026-08-07T13:17:06.000Z
agentTools:
  siteIndex: https://docs.cielo.com.br/llms.txt
  projectIndex: https://docs.cielo.com.br/ecommerce-cielo/llms.txt
---

# Consulta BIN

Retorna informações do cartão.

<Callout icon="ℹ️" theme="info">
  Vá para a <Anchor target="_blank" href="https://docs.cielo.com.br/ecommerce-cielo/reference/consulta-bin-cartao">Referência da API para acessar os exemplos completos de requisição e resposta</Anchor>.
</Callout>

## O que é a Consulta BIN?

A **Consulta BIN** é um serviço de **pesquisa de dados do cartão**, que identifica características do cartão de crédito ou débito com base no BIN. É possível enviar de 6 a 19 dígitos para consulta, sendo eles:

* BIN de 6 dígitos;
* BIN de 8 dígitos (padrão ISO atual);
* Número completo do cartão (PAN)

Quando um número completo de cartão é informado, a API utiliza os dígitos necessários para realizar a consulta.

Ao fazer a consulta, serão retornadas informações que permitem validar os dados preenchidos na tela de pagamento:

* **Bandeira do cartão:** nome da bandeira;
* **Tipo de cartão:** crédito, débito ou múltiplo (crédito e débito);
* **Nacionalidade do cartão:** estrangeiro ou nacional;
* **Cartão Corporativo:** se o cartão é ou não é corporativo;
* **Banco Emissor:** código e nome do emissor;
* **Cartão pré-pago:** se o cartão é ou não é pré-pago.

> ℹ️
>
> O emissor e produto são informações obtidas na base de consulta Cielo.

## Qual é o impacto do uso no meu negócio?

Com as informações retornadas pela Consulta BIN o estabelecimento pode tomar ações como:

* Oferecer descontos e promoções para cartões específicos;
* Deixar a página de pagamento mais moderna com a identificação automática da bandeira do cartão a partir da digitação do BIN e evitar erros por preenchimento indevido da bandeira,
* Confirmar o tipo de cartão, como por exemplo identificar um cartão que é puro débito e notificar o portador caso ele tente passar uma transação no crédito.

Como vantagens temos: fornece dados para o estabelecimento tomar ações para converter vendas e pode ser utilizado antes da autorização.

<Callout icon="ℹ️" theme="info">
  ### Importante

  A Consulta BIN é um serviço de consulta e enriquecimento de dados voltado ao apoio à tomada de decisão e à melhoria da taxa de conversão, não devendo ser tratado como parte transacional crítica dos fluxos.

  Para garantir resiliência e continuidade operacional, recomenda‑se que sua integração não seja bloqueante, permitindo que o processamento principal prossiga mesmo em casos de timeout, erro ou indisponibilidade do serviço, adotando estratégia _fail‑open_.

  O retorno da Consulta BIN deve ser utilizado como informação complementar, com timeouts bem definidos, tratamento adequado de exceções e mecanismos de fallback, seguindo boas práticas de arquiteturas tolerantes a falhas.
</Callout>

## Como usar a Consulta BIN?

Com base no resultado da Consulta BIN você pode desenvolver funcionalidades no seu checkout para melhorar a usabilidade para quem está comprando e, assim, ajudar na recuperação de carrinhos e na melhor conversão da sua loja.

**1. Evitar erros referentes à bandeira ou ao tipo de cartão**:

* A consulta BIN retorna a **bandeira correta** do cartão uma vez que está associada à base de BINS das bandeiras; esse é um método muito mais seguro do que se basear em algoritmos no formulário;

* No checkout da sua loja, você pode criar uma mensagem para avisar ao consumidor se ele está usando um cartão de débito quando na verdade deveria usar um de crédito.

**2. Oferecer recuperação de carrinhos online**

Você pode desenvolver um fluxo no seu checkout para que, caso um cartão informado na tela de pagamento seja múltiplo (crédito e débito), a sua loja pode reter os dados do cartão e, caso a transação de crédito falhe, oferecer automaticamente ao consumidor uma transação de débito com o mesmo cartão.

**3. Alertar sobre cartões internacionais ou pré-pagos**

A Consulta BIN no carrinho pode indicar a tentativa de uso de um cartão internacional ou pré-pago. Se a sua loja não deseja receber pagamentos internacionais ou de cartões pré-pagos, você pode configurar o seu checkout para informar ao consumidor que a loja não aceita o cartão informado.

<Callout icon="ℹ️" theme="info">
  Veja como <Anchor target="_blank" href="https://docs.cielo.com.br/ecommerce-cielo/docs/como-habilitar-microsservi%C3%A7os#silent-order-post">habilitar a Consulta BIN</Anchor>.
</Callout>

<Callout icon="⚠️" theme="warn">
  **Atenção**

  - Alguns BINs ou bandeiras podem não ter o retorno das informações do cartão;
  - Se a API exibir a mensagem de erro `323`, significa que a Consulta BIN não está habilitada. Entre em contato com o Atendimento Cielo;
  - O serviço está sujeito a condições comerciais e poderá implicar custos adicionais
</Callout>

## O que não fazer?

Não realize a consulta de forma excessiva, sem estar vinculada a uma transação ou armazenamento do cartão.

## Como testar a consulta BIN em sandbox?

Para testar a Consulta BIN, siga as orientações em <Anchor target="_blank" href="https://docs.cielo.com.br/ecommerce-cielo/reference/consulta-bin-sandbox">Consulta Bin em sandbox</Anchor>. No ambiente de teste, cada um dos seis primeiros dígitos irá trazer um resultado simulado correspondente.

> ⚠️&#x20;
>
> Em ambiente Sandbox, determinados retornos são simulados para fins de teste.
>
> A correspondência baseada nos primeiros dígitos do cartão (dígitos 1 a 6) é utilizada apenas para geração de cenários simulados e não representa o comportamento da consulta em Produção.