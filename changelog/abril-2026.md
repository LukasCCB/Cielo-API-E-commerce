---
agentTools:
  siteIndex: https://docs.cielo.com.br/llms.txt
  projectIndex: https://docs.cielo.com.br/ecommerce-cielo/llms.txt
---

# Abril de 2026

Acompanhe as últimas atualizações da API E-commerce Cielo.

## 🚀 Novidades

Confira os novos recursos que adicionamos para melhorar sua experiência:

* **Suporte a transações de [NFTs, criptomoedas e moedas estáveis em pagamentos de crédito](https://docs.cielo.com.br/ecommerce-cielo/reference/criar-pagamento-credito)**:
  * Inclusão do campo `DigitalAsset` para indicar transações relacionadas a NFTs, criptomoedas e moedas estáveis.
  * O campo é do tipo string e deve ser utilizado conforme a bandeira do cartão (Visa e Mastercard).
* **Nova tela de [Transações no site Cielo](https://docs.cielo.com.br/ecommerce-cielo/docs/transacoes) com layout modernizado e navegação simplificada**:
  * Disponibilizada visão consolidada das transações, permitindo rápida identificação de status, valores e datas;
  * Controle de transações;
  * Inclusão de filtros dinâmicos para refino de buscas por período, status e tipo de transação.
* **Disponibilizado novo provedor do [Banco do Brasil para Pix](https://docs.cielo.com.br/ecommerce-cielo/reference/api-pix-bb)**:
  * Use o provedor `BancoDoBrasil3` para usar Banco do Brasil como provedor para pagamentos Pix;
* **Disponibilizada a [configuração de e-wallets como meio de pagamento no site Cielo](https://docs.cielo.com.br/ecommerce-cielo/docs/habilitar-e-wallet)**:
  * As carteiras digitais disponíveis para serem habilitadas no site Cielo são Apple Pay, Google Pay e Samsung Pay.

## 🛠️ Melhorias

Incluímos ajustes e otimizações com foco em qualidade e performance.

* **Novo campo obrigatório para [cancelamento de transações](https://docs.cielo.com.br/ecommerce-cielo/reference/cancelamento-paymentid) por risco de fraude**.
  * A partir de 17/04/2026, passa a ser necessário informar o campo Reason quando o cancelamento for motivado por suspeita de fraude identificada pelo estabelecimento.
* **Disponibilizados cartões de teste com resultado negativo para Zero Auth**:
  * Novos cartões de teste disponibilizados para testar validação de cartão com resultado negativo no Zero Auth.