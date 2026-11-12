---
agentTools:
  siteIndex: https://docs.cielo.com.br/llms.txt
  projectIndex: https://docs.cielo.com.br/ecommerce-cielo/llms.txt
---

# [MAR] Atualizações na documentação API E-commerce Cielo

* Novos [códigos de retorno das bandeiras](https://docs.cielo.com.br/ecommerce-cielo/page/abecs):
  * **Elo**: códigos 15, 66, 73, 79, 80;
  * **Amex**: código 102;
* Atualização da descrição de [códigos de retorno das bandeiras](https://docs.cielo.com.br/ecommerce-cielo/page/abecs):
  * **Visa**: código 46;
  * **Elo**: código 78;
* A partir do dia 17/04/2026, será necessário **enviar o criptograma** em [transações de verificação de cartão (Zero Auth)](https://docs.cielo.com.br/ecommerce-cielo/reference/validar-cartao) com tokenização na bandeira Visa:
  * Envie o DPAN (token) no campo `Card.CardNumber`;
  * Envie o criptograma no campo `Card.SecurityCode`.
* Nova página para [gestão de recorrências](https://docs.cielo.com.br/ecommerce-cielo/docs/gestao-de-recorrencia) disponibilizada:
  * Agora é possível **editar, ativar ou desativar** uma recorrência via site Cielo!
* Aviso sobre [Click to Pay](https://docs.cielo.com.br/ecommerce-cielo/reference/pagamento-click-to-pay) funcionar apenas com os dados do cartão ou DPAN incluso.
* Nova página sobre [Merchant Advice Code (MAC) – Mastercard](https://docs.cielo.com.br/ecommerce-cielo/docs/merchant-advice-code-mac-mastercard) disponibilizada:
  * O Merchant Advice Code (MAC) é um código retornado pela Mastercard em transações negadas ou em outros cenários específicos, como casos envolvendo cartões virtuais, atualização de dados do cartão (ABU) ou requisitos de token.
* Novo código [298 – Split payment facilitator data not found](https://docs.cielo.com.br/ecommerce-cielo/reference/api-errors-code-message#tabela-de-code-e-message) :
  * O MerchantId informado não existe na base de dados do ambiente selecionado (produção ou sandbox).

<br />