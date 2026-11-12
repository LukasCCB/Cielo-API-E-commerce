---
updatedAt: 2026-10-14T14:48:53.000Z
agentTools:
  siteIndex: https://docs.cielo.com.br/llms.txt
  projectIndex: https://docs.cielo.com.br/ecommerce-cielo/llms.txt
---

# Captura e cancelamento de transações com conversão de moeda

## Captura

A operação de captura pode ser automática ou posterior:

* A **captura automática** é determinada pelo envio do parâmetro `Payment.Capture` igual a “true” na requisição de conversão (autorização);
* A **captura posterior** deve ser feita em até 20 minutos após a requisição de conversão (autorização) para garantir o valor de câmbio exibido ao comprador. Saiba mais em <a href="https://docs.cielo.com.br/ecommerce-cielo/reference/capturar-apos-autorizacao" target="_blank">Capturar transação de crédito após a autorização na Referência da API</a>.

## Cancelamento

O cancelamento de uma venda realizada com o Conversor de Moedas E-commerce deve seguir o mesmo fluxo adotado para o cancelamento de uma venda de crédito à vista.

> ℹ️
>
> Saiba mais em <a href="https://docs.cielo.com.br/ecommerce-cielo/reference/cancelamento-paymentid" target="_blank">Cancelar transação de crédito via PaymentId</a> ou em <a href="https://docs.cielo.com.br/ecommerce-cielo/reference/cancelamento-merchantorderid" target="\_blank">Cancelar transação de crédito via MerchantOrderId</a>.

* O **portador do cartão** irá receber o estorno na moeda escolhida e no valor exato de pagamento, caso seja um cancelamento total;
* A **loja** irá receber o estorno em reais (BRL).