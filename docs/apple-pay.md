---
updatedAt: 2025-11-27T20:01:10.000Z
agentTools:
  siteIndex: https://docs.cielo.com.br/llms.txt
  projectIndex: https://docs.cielo.com.br/ecommerce-cielo/llms.txt
---

# Apple Pay

A Apple Pay é uma carteira virtual que permite que o comprador realize pagamentos com segurança em lojas virtuais e apps utilizando seus cartões de crédito e débito armazenados em suas contas e dispositivos Apple.

## Pré-requisitos

Para usar o Apple Pay, é necessário que a loja já esteja cadastrada no programa AppleID. Além disso, você deve:

1. Realizar o cadastro no <a href="https://developer.apple.com/programs/enroll/" target="_blank">Programa de Desenvolvedores da Apple</a> e seguir todos os passos requeridos pela Apple;
2. Contratar a API E-commerce Cielo;
3. Contratar a Cielo 3.0 como adquirência;
4. Configurar o <a href="https://docs.cielo.com.br/ecommerce-cielo/docs/configura%C3%A7%C3%A3o-do-merchant-identifier" target="_blank">Merchant Identifier</a>;
5. <a href="https://docs.cielo.com.br/ecommerce-cielo/docs/integra%C3%A7%C3%A3o-com-apple-pay" target="_blank">Integrar com Apple Pay</a>;
6. <a href="https://docs.cielo.com.br/ecommerce-cielo/docs/transacao-api-ecommerce-cielo" target="_blank">Criar transação com Apple Pay na API E-commerce Cielo</a>.

> **Atenção**: A integração a seguir deve ser feita por lojas que enviam dados de cartão de forma criptografada. Se a sua loja envia a requisição de autorização de e-wallet com dados descriptografados, vá para [Cartão descriptografado](https://docs.cielo.com.br/ecommerce-cielo/docs/e-wallets#cart%C3%A3o-descriptografado).

<Callout icon="⚠️" theme="warn">
  Habilite a carteira virtual [Apple Pay](https://docs.cielo.com.br/ecommerce-cielo/docs/habilitar-e-wallet#/) diretamente no site Cielo.
</Callout>

<br />