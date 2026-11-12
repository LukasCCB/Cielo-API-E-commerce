---
updatedAt: 2026-11-11T17:43:21.000Z
agentTools:
  siteIndex: https://docs.cielo.com.br/llms.txt
  projectIndex: https://docs.cielo.com.br/ecommerce-cielo/llms.txt
---

# Integração entre os scripts de autenticação 3DS e Silent Order Post (SOP)

A [autenticação 3DS](https://docs.cielo.com.br/ecommerce-cielo/docs/3ds-sobre) pode ser combinada com o [script do Silent Order Post](https://docs.cielo.com.br/ecommerce-cielo/docs/integrando-com-o-sop) (SOP) para realizar transações autenticadas e seguras. Nesse modelo, o processo de autenticação ocorre de forma separada da autorização, permitindo que os dados gerados pelo script 3DS sejam informados na requisição de autorização junto com o `PaymentToken` gerado via Silent Order Post.

### Etapa 1 – Autenticação 3DS

A autenticação deve ser realizada antes da autorização da transação. Para isso, é necessário executar o [script de autenticação 3DS](https://docs.cielo.com.br/ecommerce-cielo/docs/script-autenticacao) na página de checkout.

Após a execução do script, são retornados os seguintes dados:

* `eci`;
* `cavv`;
* `xid`;
* `referenceId`

Esses dados devem ser informados na requisição de autorização no nó `Payment.ExternalAuthentication`.

Envie o campo `Authenticate` como *true* para indicar que a transação foi autenticada via 3DS antes da autorização.

### Etapa 2 – Executar o script do Silent Order Post (SOP)

Após obter o `PaymentToken` por meio do [script do Silent Order Post](https://docs.cielo.com.br/ecommerce-cielo/docs/integrando-com-o-sop), inicie o processo de autorização e envie o `PaymentToken` no lugar dos dados do cartão.

O fluxo a seguir descreve as etapas de 3DS com Silent Order Post:

<Image src="https://files.readme.io/4622205e866f309a7322d24d05f5cb293edac12a29f17f42c4bb1544d45d2554-3DS_com_SOP.png" alt="Fluxo 3DS com Silent Order Post" align="center" />

1. O **Comprador** escolhe pagar com cartão (crédito ou débito) e preenche os dados;
2. A **loja** executa script de autenticação 3DS, que consulta bandeira e emissor para validar a transação;
3. O **3DS Server Cielo** retorna os dados da autenticação (`ECI`, `Cavv`, `Xid`, `Version`,  `ReferenceId`) no evento de `OnSuccess`;
4. A **Loja** executa o script do Silent Order Post, que utiliza OAuth2 para autenticação antes de enviar os dados;
5. O **Silent Order Post** retorna os dados do cartão tokenizado (`Payment.Token`);
6. A **Loja** solicita autorização à **API Cielo E-commerce**, informando:
   1. Dados da autenticação 3DS (`ECI`, `Cavv`, `Xid`, etc.) no parâmetro `Payment.ExternalAuthentication`;
   2. Token do cartão (`Payment.Token`).
7. A **API Cielo E-commerce** retorna a resposta da autorização;
8. A **loja** confirma o pedido do comprador, se desejar

<Callout icon="ℹ️" theme="info">
  ### Este é um fluxo simplificado. Para detalhes completos, consulte:

  [Como funciona a autorização com autenticação 3DS;](https://docs.cielo.com.br/ecommerce-cielo/docs/autoriza%C3%A7%C3%A3o-com-autenticacao-3ds#/)

  [Integrando o Silent Order Post](https://docs.cielo.com.br/ecommerce-cielo/docs/integrando-com-o-sop#/).
</Callout>