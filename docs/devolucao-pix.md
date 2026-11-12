---
updatedAt: 2026-09-14T20:24:41.000Z
agentTools:
  siteIndex: https://docs.cielo.com.br/llms.txt
  projectIndex: https://docs.cielo.com.br/ecommerce-cielo/llms.txt
---

# Devolução Pix

Caso a sua loja precise devolver total ou parcialmente um pagamento Pix, é possível realizar uma operação de **devolução**. É importante ressaltar que a devolução não é uma operação instantânea, podendo ser acatada ou não pelo provedor Pix. Quando uma devolução é acatada, uma [notificação](https://docs.cielo.com.br/ecommerce-cielo/docs/webhook) será enviada para a sua loja.

Para solicitar uma devolução Pix:

* O comprador deve solicitar à loja a devolução total ou parcial do pagamento;
* A loja deve identificar a transação Pix original e enviar a solicitação de devolução.

**Quando posso solicitar uma devolução Pix?**

É possível solicitar uma devolução Pix quando, por exemplo, houver devolução do produto, erro na cobrança e indisponibilidade do produto em estoque.

**Quem solicita a devolução Pix pela API E-commerce Cielo?**

A loja (vendedor que recebeu a transação Pix) é quem solicita a devolução à API E-commerce Cielo, em acordo com o comprador. É importante se atentar aos prazos (de acordo com regulamento do Banco Central).

**Como solicitar à devolução Pix?**

Via [API E-commerce Cielo](https://docs.cielo.com.br/ecommerce-cielo/docs/sobre-api-ecommerce) ou App Cielo Gestão.

<Callout icon="ℹ️" theme="info">
  ### Importante

  A possibilidade de realizar uma devolução Pix depende do modelo de repasse configurado para a conta Pix na Cielo.

  Para consultar ou alterar essa configuração, acesse [Gestão da conta Pix na Cielo](https://docs.cielo.com.br/ecommerce-cielo/docs/conta-pix-cielo).
</Callout>

### Regras para devolução Pix

* A devolução ocorre somente se houver saldo disponível na conta Pix na Cielo;
* Para transferências, vendas e demais transações com o Pix, o prazo para solicitar a devolução é de 90 dias, conforme especificação do BACEN;
* É necessário que a conta Pix na Cielo esteja configurada com o modelo **transferência automática programada** ou **Conta Cielo**;
* Os clientes que optarem pela **transferência automática por venda** não terão saldo disponível para devolução. Nesse caso, a solicitação será rejeitada com o retorno *"Lojista com saldo insuficiente para devolução"*;
* A devolução de uma transação Pix não isenta a cobrança da taxa da transação original. A taxa permanece aplicável porque o pagamento foi processado com sucesso. A cobrança não está relacionada à devolução, mas ao processamento da transação realizado anteriormente.