---
updatedAt: 2026-10-14T14:48:50.000Z
agentTools:
  siteIndex: https://docs.cielo.com.br/llms.txt
  projectIndex: https://docs.cielo.com.br/ecommerce-cielo/llms.txt
---

# Como funciona a conversão de moedas

<Callout icon="ℹ️" theme="info">
  Vá para a <a href="https://docs.cielo.com.br/ecommerce-cielo/reference/conversor-moedas-api" target="\_blank">Referência da API para acessar os exemplos completos de requisição e resposta</a>.
</Callout>

O **conversor de moedas e-commerce** é indicado para lojas que apresentam os produtos da vitrine online em **reais**, mas que aceitam pagamentos com cartões estrangeiros e desejam oferecer aos seus clientes a facilidade de pagar uma compra com a moeda local do seu cartão.

O **valor** do produto ou serviço em real **é convertido** automaticamente com base no câmbio do dia e apresentado como opção ao comprador.

> ℹ️ A API irá apresentar a opção de conversão para a moeda local do cartão do comprador. <a href="https://docs.cielo.com.br/ecommerce-cielo/reference/conversor-moedas-disponiveis" target="_blank">Confira a lista de moedas locais aceitas</a>.

### Benefício para o comprador

O conversor de moedas e-commerce é uma facilidade para o portador do cartão porque apresenta o cálculo automático da conversão. Assim, o **comprador visualiza o câmbio no ato da compra** e opta pela **melhor opção de moeda**, sem precisar esperar a fatura do cartão.

### Benefício para a loja

A taxa aplicada pela Cielo para cada transação com o **conversor de moedas e-commerce** tem um desconto de 0,5%. Assim, quanto mais a sua loja vender, maior será a economia.

### Cartões aceitos para a conversão de moedas

A conversão de moedas permite o uso de **cartões estrangeiros** das bandeiras **Visa** e **Mastercard**, na modalidade de pagamento **crédito à vista**.

<br />

> ❗️ Em quais situações a conversão não é permitida?
>
> A conversão de moedas não é permitida para transações recorrentes, e transações de cartão de débito, cartão pré-pago (multicurrency), cartão de crédito parcelado, cartões internacionais emitidos no Brasil e carteiras digitais.

<br />

## Como funciona a conversão de moedas

A autorização da transação de crédito com conversão de moeda é composta pela **etapa de conversão da moeda** e pela **etapa de confirmação** da opção de pagamento em moeda estrangeira.

### Fluxo padrão com cartão de crédito estrangeiro

A seguir apresentamos o fluxo padrão da conversão de moedas, usando um **cartão estrangeiro** e com o **portador do cartão concordando com uma das opções de conversão** apresentadas. Nesse cenário, a loja irá confirmar a conversão e a transação será autorizada na moeda escolhida.

<Image alt="Fluxo transacional com cartão de crédito estrangeiro" border={false} src="https://files.readme.io/83587d48d0c34e6857d7da82a75dc6971ffbe1422bc62e56abc60571c154f966-image.png" />

<br />

#### Etapa de conversão da moeda

1. Na página de checkout da loja, o comprador escolhe pagar com cartão de crédito;
2. O back-end da loja envia a requisição de autorização, informando o campo `DynamicCurrencyConversion` igual a *true* para verificar a elegibilidade do cartão ao conversor de moedas;
3. A API E-commerce Cielo retorna na resposta o nó `CurrencyExchangeData`, que informa se o cartão é elegível ao conversor de moedas e apresenta as opções de câmbio;
4. O front-end da loja exibe as opções de conversão na página de checkout, para decisão do comprador.

#### Etapa de confirmação

5. O comprador escolhe entre pagar em moeda estrangeira ou em real\_;
6. Se o comprador escolheu a moeda estrangeira (diferente de real), a loja envia requisição de confirmação da conversão com o campo `CurrencyConversion` igual a *true*;
7. A API E-commerce Cielo envia retorno de sucesso;
8. A loja envia confirmação de pagamento ao comprador.

* Caso o comprador escolha pagar em real, a transação será confirmada em reais. Veja o fluxo completo em \[Fluxo com cartão de crédito estrangeiro e venda em reais].

<br />

### Informações ao comprador

De acordo com os **regulamentos das bandeiras Visa e Mastercard**, o comprador deve ter a opção de aceitar a conversão de moedas ou de recusar a conversão e pagar na moeda local (BRL) e estar ciente da taxa cobrada pela conversão (Markup Exchange Rate de 16%).

> **Importante**: A taxa de conversão é cobrada do portador do cartão. O estabelecimento comercial não é cobrado pela conversão.

Por isso, é necessário que a loja exiba uma série de informações tanto na tela de conversão no momento do pagamento como também no comprovante de venda enviado para o comprador (portador do cartão):

* Taxa de câmbio (*exchange rate*) - retornada pela API no parâmetro`ConversionRate`;
* Valor na moeda do comprador - retornado pela API no parâmetro `ConvertedAmount`;
* Valor na moeda local (reais) - retornado pela API no parâmetro `Currency`;
* Taxa de serviço ou *markup* de 16% (*exchange-rate fee*).

## Informações importantes

<Callout icon="ℹ️" theme="info">
  * A loja precisa **preparar o seu próprio front-end** para exibir a mensagem com as opções de conversão ao comprador;
  * Caso seja enviado um **cartão nacional ou um cartão de débito**, a API E-commerce irá retornar uma mensagem informando que a conversão não aceita cartão nacional. Em seguida, a loja precisará enviar a confirmação da transação. Saiba em [Fluxo com cartão nacional ou cartão de débito](https://docs.cielo.com.br/ecommerce-cielo/docs/fluxos-alternativos-conversao#fluxo-com-cart%C3%A3o-nacional-ou-cart%C3%A3o-de-d%C3%A9bit);
  * O comprador tem a opção de **não aceitar a conversão** de moeda. Nessa situação, a loja precisa enviar `CurrencyConversion` igual a _false_ na etapa de confirmação e a autorização será realizada em reais. Confira mais informações em [Fluxo com cartão de crédito estrangeiro e venda em reais](https://docs.cielo.com.br/ecommerce-cielo/docs/fluxos-alternativos-conversao#fluxo-com-cart%C3%A3o-de-cr%C3%A9dito-estrangeiro-e-venda-em-reais);
  * O conversor de moedas e-commerce é específico para o momento do pagamento e a conversão é garantida durante o tempo da autorização (até 20 minutos após a requisição de conversão). Saiba mais sobre a [captura de transações com conversão](https://docs.cielo.com.br/ecommerce-cielo/docs/conversor-moedas-captura-cancelamento);
  * A conversão de moedas não atua na reserva de valores, mas apenas no momento da efetivação do pagamento (quando os dados do cartão são preenchidos).
</Callout>