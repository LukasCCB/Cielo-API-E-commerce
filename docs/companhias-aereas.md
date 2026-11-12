---
updatedAt: 2025-10-30T01:03:43.000Z
agentTools:
  siteIndex: https://docs.cielo.com.br/llms.txt
  projectIndex: https://docs.cielo.com.br/ecommerce-cielo/llms.txt
---

# Companhias aéreas e agências de turismo

É possível cobrar pela taxa de embarque separada do valor da passagem

## Taxa de embarque e número da passagem

A Cielo disponibiliza um recurso especial que permite que as **companhias aéreas** e **agências de turismo** cobrem a **taxa de embarque** separadamente do valor da passagem. Quando o comprador faz a compra da passagem de forma parcelada, a taxa de embarque é incluída integralmente no valor da primeira parcela.

> ℹ️
>
> Na API, a taxa de embarque é representada pelo parâmetro **`Payment.ServiceTaxAmount`**, exclusivo para empresas aéreas e agências de turismo. Consulte o exemplo de requisição em <a href="https://docs.cielo.com.br/ecommerce-cielo/reference/criar-pagamento-credito" target="_blank">**Criar pagamento com cartão de crédito**</a>.

Além disso, recomendamos informar o **número da passagem** no parâmetro `Payment.AirlineData.TicketNumber`.

Na requisição, os dois parâmetros irão aparecer conforme o exemplo a seguir:

```json
{
    (...)
    "Payment": {
      (...)
      "ServiceTaxAmount": 0,
      "AirlineData": {
        "TicketNumber": "AR988983"
      }
    }
  }
```

### Bandeiras aceitas

As bandeiras aceitas são:

* American Express (Amex);
* Elo;
* Mastercard;
* Visa.

## Análise de fraude para companhias aéreas e agências de turismo

A Cielo recomenda que as companhias aéreas e agências de turismo integrem com o **Antifraude** para minimizar os riscos de fraude e chargeback. A análise de fraude pode acontecer antes ou após a autorização da transação, conforme as regras estabelecidas pelo loja.

A integração com o Antifraude é feita através do próprio fluxo transacional, na mesma requisição de criação da transação ou a loja pode adquirir o Antifraude a parte. Saiba mais em <a href="https://docs.cielo.com.br/ecommerce-cielo/reference/af-clearsale" target="_blank">**Análise de Fraude**</a>.