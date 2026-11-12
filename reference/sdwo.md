---
updatedAt: 2026-09-09T17:47:29.000Z
agentTools:
  siteIndex: https://docs.cielo.com.br/llms.txt
  projectIndex: https://docs.cielo.com.br/ecommerce-cielo/llms.txt
---

# SDWO

Staged Digital Wallet Operators (SDWO) são carteiras digitais que permitem o armazenamento de informações de pagamento e a realização de transações online.

Confira os exemplos de requisições para as SDWOs de cada categoria aceita no e-commerce Cielo:

**SDWO de arranjo de transferência de fundos:**

* [**Transferência para o mesmo portador (Me2Me)**](https://docs.cielo.com.br/ecommerce-cielo/reference/sdwo-me2me)
* [**Transferência para outro portador (P2P)**](https://docs.cielo.com.br/ecommerce-cielo/reference/sdwo-p2p)
* [**Transferência para outro arranjo**](https://docs.cielo.com.br/ecommerce-cielo/reference/sdwo-outro-arranjo)
* [**Pagamento de conta identificada**](https://docs.cielo.com.br/ecommerce-cielo/reference/sdwo-pagamento-de-conta-identificada)
* [**Pagamento de conta não identificada**](https://docs.cielo.com.br/ecommerce-cielo/reference/sdwo-pagamento-conta-nao-identificada)
* [**Pedágio**](https://docs.cielo.com.br/ecommerce-cielo/reference/pedagio-sdwo)

No caso de transações de e-commerce de uma SDWO com cartão de crédito ou débito (não originadas por um QR Code), é necessário que a carteira mande alguns dados adicionais na transação, para que as bandeiras possam identificar e diferenciar esse tipo de transação.

⚠️ Além dos campos específicos dessa modalidade, para transações SDWO de compra também é obrigatório enviar:

* Soft Descriptor (campo `Payment.SoftDescriptor`);
* CNPJ do portador, caso seja pessoa jurídica (campos `Customer.Identity` e `Customer.IdentityType`);
* Razão social (`CompanyName`).

> ℹ️ Para testar transações de SDWO, é necessário seguir as orientações do menu [Sandbox e ferramentas](https://docs.cielo.com.br/ecommerce-cielo/reference/como-usar-o-sandbox)

Para enviar o MCC do varejista na transação de SDWO, a orientação do mercado é utilizar a tabela da ABECS (Associação Brasileira das Empresas de cartões de crédito e Serviços) que realiza o de-para de CNAEs para os MCCS de toda a indústria. Essa tabela é atualizada constantemente e está disponível online no site da ABECS no seguinte link: <a href="https://abecs.org.br/portal-mcc" target="_blank">ABECS</a>

> ℹ️ Para transações SDWO de boleto identificado e não identificado da bandeira Mastercard o MCC deve ser 6540.

## Bandeiras e cartões aceitos para SDWO

A marcação de SDWO é apenas aceita para as seguintes modalidades e bandeiras:

| Tipo de cartão    | Bandeira               |
| :---------------- | :--------------------- |
| Cartão de crédito | Visa, Mastercard e Elo |
| Cartão de débito  | Visa, Mastercard e Elo |

Aceita cartões estrangeiros.

> ⚠️ Atenção
>
> * Para a bandeira Visa, a carteira digital SDWO deve estar localizada no mesmo país que o varejista que recebe o pagamento da carteira digital;
> * Para a bandeira Elo, a partir de 17 de outubro de 2025 as transações de cartão oriundas de link de pagamento precisam ser identificadas. Envie o parâmetro `Payment.SolutionType` = "ExternalLinkPay"