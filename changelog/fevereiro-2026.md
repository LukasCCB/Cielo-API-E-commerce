---
agentTools:
  siteIndex: https://docs.cielo.com.br/llms.txt
  projectIndex: https://docs.cielo.com.br/ecommerce-cielo/llms.txt
---

# [FEV] Atualizações na documentação API E-commerce Cielo

* Disponibilizado passo a passo para utilização do [boleto Bradesco](https://docs.cielo.com.br/ecommerce-cielo/docs/boleto-bradesco);
* Atualizada a documentação para ampliar a lista de bandeiras compatíveis com Soft Descriptor. As bandeiras disponíveis são:
  * Visa;
  * Mastercard;
  * Amex;
  * Elo.

> Veja mais detalhes em [Soft Descriptor](https://docs.cielo.com.br/ecommerce-cielo/docs/soft-descriptor).

* Incluída na documentação a orientação sobre o campo `Payment.DigitalAsset` para [transações de compra ou venda de Criptomoedas e NFTs](https://docs.cielo.com.br/ecommerce-cielo/reference/criar-pagamento-credito) com a bandeira Visa;
  * Valores suportados: **Cryptocurrency** e **NFT**;
  * Aplicável exclusivamente a transações Visa;
* Atualizado para informar que o retorno de um [cartão com final 9  no ambiente Sandbox](https://docs.cielo.com.br/ecommerce-cielo/reference/credito-sandbox) será sempre:
  * 6 – Operation Successful, ou
  * 9 – Time Out
* Atualizada o tamanho máximo permitido do parâmetro `bpmpi_totalamount` no [mapeamento de classes para integração 3DS](https://docs.cielo.com.br/ecommerce-cielo/docs/mapeando-classes):
  * Atualizado de até 15 posições para até **11 posições**.
* Atualizadas informações sobre envio de criptograma em transações MIT tokenizadas na bandeira Mastercard:
  * Não é necessário enviar o criptograma em transações MIT tokenizadas na bandeira Mastercard, pois o token já foi validado previamente na transação CIT original.
  * Saiba mais em [Indicador de início da transação - CIT e MIT](https://docs.cielo.com.br/ecommerce-cielo/reference/token-bandeira-externo).