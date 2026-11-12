---
updatedAt: 2026-07-16T19:36:59.000Z
agentTools:
  siteIndex: https://docs.cielo.com.br/llms.txt
  projectIndex: https://docs.cielo.com.br/ecommerce-cielo/llms.txt
---

# E-wallets

**E-wallets** são cofres (repositórios) de cartões e dados de pagamento destinados a consumidores do e-commerce e do mundo físico. As carteiras digitais permitem que um consumidor realize o cadastro de seus dados de pagamento tornando o processo de compra mais conveniente e seguro.

<Callout icon="⚠️" theme="warn">
  ### Atenção

  - Para usar e-wallets na API E-commerce Cielo, o estabelecimento comercial deverá ter as carteiras integradas em seu checkout;
  - Habilite as e-wallets: [**Apple Pay**, **Google Pay** e **Samsung Pay**](https://docs.cielo.com.br/ecommerce-cielo/docs/habilitar-e-wallet#/) diretamente no site Cielo.
</Callout>

Entre em contato com o provedor de sua preferência para maiores informações sobre como contratar o serviço.

<Callout icon="ℹ️" theme="info">
  ### Importante

  - Aceitamos apenas cartões de crédito e débito via e-wallets;
  - A loja deve consultar a carteira para identificar o meio de pagamento utilizado na transação;
  - A API E-commerce Cielo é capaz de tokenizar cartões de crédito de e-wallets, podendo ser cartões [criptografados ](https://docs.cielo.com.br/ecommerce-cielo/docs/e-wallets#cart%C3%A3o-criptografado) ou [descriptografados](https://docs.cielo.com.br/ecommerce-cielo/docs/e-wallets#cart%C3%A3o-descriptografado). É necessário que a loja tenha o serviço de tokenização contratado e que  o parâmetro `SaveCard` seja informado igual a "true".
</Callout>

# E-wallets Disponíveis

API Cielo E-commerce possui suporte para as seguintes carteiras digitais:

* <a href="https://www.apple.com/br/apple-pay/" target="_blank">*Apple Pay*</a>
* <a href="https://pay.google.com/intl/pt-BR_br/about/" target="_blank">*Google Pay*</a>
* <a href="https://samsung.com.br/services/pay/" target="_blank">*Samsung Pay*</a>

## Bandeiras aceitas pelas wallets

Para saber as bandeiras de cartão aceitas, visite o site de cada carteira:

* <a href="https://support.google.com/wallet/answer/12059326?visit_id=638217380303676306-1822163035&rd=1" target="_blank">GooglePay</a>;
* <a href="https://www.apple.com/br/apple-pay/" target="_blank">ApplePay</a>;
* <a href="https://www.samsung.com.br/services/pay/" target="_blank">SamsungPay</a>.

# Integração da e-wallet

A requisição de autorização com o meio de pagamento e-wallet pode acontecer de duas formas:

1. **Autorização com cartão criptografado**: a requisição contém o nó `Wallet`, o campo `WalletKey` (usado pela Cielo para descriptografar os dados das e-wallets) e tokens adicionais de acordo com cada e-wallet. Esse tipo de integração é indicado para estabelecimentos que não possuem certificação PCI DSS;
2. **Autorização com cartão descriptografado**: a requisição contém o nó `Wallet` e a própria loja descriptografa os dados do cartão e submete os dados de forma aberta na autorização. Esse tipo de integração é indicado para estabelecimentos com certificação PCI DSS.

## Cartão criptografado

Veja abaixo a representação de um **fluxo transacional** padrão na integração de uma e-wallet com cartão criptografado:

<Image src="https://files.readme.io/036c672-e-wallets-cielo-100.png" alt="Fluxo transacional e-wallet com cartão criptografado" align="center" />

<Callout icon="ℹ️" theme="info">
  ### Confira o exemplo de requisição padrão para integração da <a href="https://docs.cielo.com.br/ecommerce-cielo/reference/e-wallet-criptografado" target="_blank">e-wallet com cartão criptografado na Referência da API</a>.
</Callout>

## Cartão descriptografado

A autorização com cartão descriptografado acontece quando a própria loja descriptografa o payload recebido da wallet e envia por conta própria para a API Cielo E-commerce para processamento e autorização.

<Callout icon="ℹ️" theme="info">
  ### Confira o exemplo de requisição padrão para integração da <a href="https://docs.cielo.com.br/ecommerce-cielo/reference/e-wallet-descriptografado" target="_blank">e-wallet com cartão descriptografado na Referência da API</a>.
</Callout>

# Zero Auth

O **Zero Auth** é uma ferramenta da Cielo que permite verificar se um cartão está válido para realizar uma compra antes que o pedido seja finalizado. O Zero Auth simula uma autorização sem afetar o limite de crédito ou alertar o portador do cartão sobre o teste. Para mais informações, visite [Zero Auth](https://docs.cielo.com.br/ecommerce-cielo/docs/zero-auth).

# Recorrência&#x20;

Devido a necessidade de utilização de chaves efêmeras para realizar operações de crédito, **a recorrência não está disponível para transações de e-wallets**.

<br />