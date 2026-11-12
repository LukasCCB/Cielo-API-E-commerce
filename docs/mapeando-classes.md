---
updatedAt: 2026-04-30T13:13:22.000Z
agentTools:
  siteIndex: https://docs.cielo.com.br/llms.txt
  projectIndex: https://docs.cielo.com.br/ecommerce-cielo/llms.txt
---

# 3. Mapear as classes

A solução disponibiliza dezenas de classes que devem ser mapeadas em seu código HTML.

Uma vez que a classe é mapeada em determinado campo, o script é capaz de recuperar o valor contido no campo e submetê-lo para compor a requisição de autenticação.

> ⚠️ Atenção
>
> * Quanto maior a quantidade de campos parametrizados, é maior a chance de ter uma autenticação sem desafio, pois o emissor terá maior subsídio para a análise de risco;
> * O caracter **#** indicado no campo deve ser substituído pelo número que representa o índice do item. Exemplo: `bpmpi_item_1_productName` representa o nome do item **1** do carrinho.

> ℹ️ Campo obrigatório para Amex
>
> A Amex exige a parametrização do campo `bpmpi_brand_establishment_code` em dados do [Estabelecimento](https://docs.cielo.com.br/ecommerce-cielo/docs/mapeando-classes#estabelecimento).

> ⚠️ Transações com cartão Elo
>
> A partir de 15/05/2026, a Elo passará a **exigir o envio dos campos** `bpmpi_billto_email`, `bpmpi_billto_phonenumber`, `bpmpi_billto_street1` e `bpmpi_device_ipaddress`.
>
> A partir dessa data, **requisições sem esses dados serão rejeitadas pela Elo**.
>
> Além destes parâmetros, o script do 3DS coleta alguns dados do navegador exigidos pela Elo, como idioma, dimensões do dispositivo e outros.

<br />

## Acesso e Tipo de Autenticação

<Table align={["left","left","left","left"]}>
  <thead>
    <tr>
      <th>
        **Campo**
      </th>

      <th>
        **Descrição**
      </th>

      <th>
        **Tipo/Tamanho**
      </th>

      <th>
        **Obrigatório**
      </th>
    </tr>
  </thead>

  <tbody>
    <tr>
      <td>
        `bpmpi_auth`
      </td>

      <td>
        Booleano que indica se a transação é submetida ou não para o processo de autenticação
      </td>

      <td>
        Booleano:  
        true – submeter à autenticação  
        false – não submeter à autenticação
      </td>

      <td>
        Sim
      </td>
    </tr>

    <tr>
      <td>
        `bpmpi_auth_notifyonly`
      </td>

      <td>
        Booleano que indica se a transação com cartão será submetida no modo "somente notificação". Neste modo, o processo de autenticação não será acionado, porém, os dados serão submetidos à bandeira. **Válido para cartões Mastercard e Visa**
      </td>

      <td>
        Booleano:  
        true – modo somente notificação;  
        false – modo com autenticação
      </td>

      <td>
        Condicional - obrigatório somente para transações Data Only
      </td>
    </tr>

    <tr>
      <td>
        `bpmpi_auth_suppresschallenge`
      </td>

      <td>
        Booleano que indica se ignora ou não o desafio quando houver. Se uma transação é autorizada após ignorar o desafio, o _liability_ permanece com o estabelecimento.
      </td>

      <td>
        Booleano:  
        true – ignorar desafios se houver;  
        false – apresentar desafio se houver
      </td>

      <td>
        Recomendado
      </td>
    </tr>

    <tr>
      <td>
        `bpmpi_accesstoken`
      </td>

      <td>
        Token gerado pela API de Token de Acesso (etapa 1)
      </td>

      <td>
        Alfanumérico [variável]
      </td>

      <td>
        Sim
      </td>
    </tr>
  </tbody>
</Table>

## Pedido

<Table align={["left","left","left","left"]}>
  <thead>
    <tr>
      <th>
        **Campo**
      </th>

      <th>
        **Descrição**
      </th>

      <th>
        **Tipo/Tamanho**
      </th>

      <th>
        **Obrigatório**
      </th>
    </tr>
  </thead>

  <tbody>
    <tr>
      <td>
        `bpmpi_ordernumber`
      </td>

      <td>
        Código do pedido no estabelecimento
      </td>

      <td>
        Alphanumérico [até 50 posições]
      </td>

      <td>
        Sim
      </td>
    </tr>

    <tr>
      <td>
        `bpmpi_currency`
      </td>

      <td>
        Código da moeda
      </td>

      <td>
        Fixo "BRL"
      </td>

      <td>
        Sim
      </td>
    </tr>

    <tr>
      <td>
        `bpmpi_totalamount`
      </td>

      <td>
        Valor total da transação, enviado em centavos
      </td>

      <td>
        Numérico [até 15 posições]
      </td>

      <td>
        Sim
      </td>
    </tr>

    <tr>
      <td>
        `bpmpi_installments`
      </td>

      <td>
        Número de parcelas da transação
      </td>

      <td>
        Numérico [até 2 posições]
      </td>

      <td>
        Sim
      </td>
    </tr>

    <tr>
      <td>
        `bpmpi_paymentmethod`
      </td>

      <td>
        Tipo do cartão a ser autenticado. No caso do cartão múltiplo, deverá especificar um dos tipos, Credit ou Debit
      </td>

      <td>
        Credit – Cartão de crédito  
        Debit – Cartão de débito
      </td>

      <td>
        Sim
      </td>
    </tr>

    <tr>
      <td>
        `bpmpi_cardnumber`
      </td>

      <td>
        Número do cartão
      </td>

      <td>
        Numérico [até 19 posições]
      </td>

      <td>
        Sim
      </td>
    </tr>

    <tr>
      <td>
        `bpmpi_cardexpirationmonth`
      </td>

      <td>
        Mês do vencimento do cartão
      </td>

      <td>
        Numérico [2 posições]
      </td>

      <td>
        Sim
      </td>
    </tr>

    <tr>
      <td>
        `bpmpi_cardexpirationyear`
      </td>

      <td>
        Ano do vencimento do cartão
      </td>

      <td>
        Numérico [4 posições]
      </td>

      <td>
        Sim
      </td>
    </tr>

    <tr>
      <td>
        `bpmpi_cardalias`
      </td>

      <td>
        Alias do cartão
      </td>

      <td>
        Alphanumérico [até 128 posições]
      </td>

      <td>
        Recomendado
      </td>
    </tr>

    <tr>
      <td>
        `bpmpi_default_card`
      </td>

      <td>
        Indica se é um cartão padrão do cliente na loja
      </td>

      <td>
        Booleano  
        true - sim  
        false - não
      </td>

      <td>
        Recomendado
      </td>
    </tr>
  </tbody>
</Table>

## Características do pedido

| **Campo**                              | **Descrição**                                                          | **Tipo/Tamanho**                                                                                                                                                    | **Obrigatório** |
| :------------------------------------- | :--------------------------------------------------------------------- | :------------------------------------------------------------------------------------------------------------------------------------------------------------------ | :-------------- |
| `bpmpi_recurring_enddate`              | Identifica a data de término da recorrência                            | Texto (AAAA-MM-DD)                                                                                                                                                  | Recomendado     |
| `bpmpi_recurring_frequency`            | Indica a frequência da recorrência                                     | Número<br /> 1 - Mensal<br /> 2 - Bimestral<br /> 3 - Trimestral<br /> 4 - Quadrimestral<br /> 6 - Semestral<br /> 12 - Anual                                       | Recomendado     |
| `bpmpi_recurring_originalpurchasedate` | Identifica a data da 1ª transação que originou a recorrência           | Texto (AAAA-MM-DD)                                                                                                                                                  | Recomendado     |
| `bpmpi_order_recurrence`               | Indica se é um pedido que gera recorrências futuras                    | Booleano (true ou false)                                                                                                                                            | Recomendado     |
| `bpmpi_order_productcode`              | Tipo da compra                                                         | **PHY**: compra de mercadorias<br /> **CHA**: Check acceptance<br /> **ACF**: Financiamento de conta<br /> **QCT**: Transação quase-dinheiro<br /> **PAL**: recarga | Sim             |
| `bpmpi_order_countlast24hours`         | Quantidade de pedidos efetuados por este comprador nas últimas 24h     | Numérico \[até 3 posições]                                                                                                                                          | Recomendado     |
| `bpmpi_order_countlast6months`         | Quantidade de pedidos efetuados por este comprador nos últimos 6 meses | Numérico \[até 4 posições]                                                                                                                                          | Recomendado     |
| `bpmpi_order_countlast1year`           | Quantidade de pedidos efetuados por este comprador no último ano       | Numérico \[até 3 posições]                                                                                                                                          | Recomendado     |
| `bpmpi_order_cardattemptslast24hours`  | Quantidade de transações com o mesmo cartão nas últimas 24h            | Numérico \[até 3 posições]                                                                                                                                          | Recomendado     |
| `bpmpi_order_marketingoptin`           | Indica se o comprador aceitou receber ofertas de marketing             | Booleano<br /> true – sim<br /> false – não                                                                                                                         | Recomendado     |
| `bpmpi_order_marketingsource`          | Identifica a origem da campanha de marketing                           | Alfanumérico \[até 40 posições]                                                                                                                                     | Recomendado     |
| `bpmpi_transaction_mode`               | Identifica o canal que originou a transação                            | M: MOTO<br /> R: Varejo<br /> S: E-Commerce<br /> P: Mobile<br /> T: Tablet                                                                                         | Recomendado     |
| `bpmpi_merchant_url`                   | Endereço do site do estabelecimento                                    | Alfanumérico \[100] Exemplo: `https://www.exemplo.com.br`                                                                                                           | Sim             |

<br />

## Cartões pré-pago

| **Campo**                 | **Descrição**                                                                      | **Tipo/Tamanho**                                        | **Obrigatório** |
| ------------------------- | ---------------------------------------------------------------------------------- | ------------------------------------------------------- | --------------- |
| `bpmpi_giftcard_amount`   | O total do valor da compra para cartões de presente pré-pagos em valor arredondado | Numérico \[até 15 posições], exemplo: R$ 125,54 = 12554 | Recomendado     |
| `bpmpi_giftcard_currency` | Código da moeda da transação paga com cartão do tipo pré-pago                      | Fixo "BRL"                                              | Recomendado     |

## Endereço de cobrança

| **Campo**                  | **Descrição**                                                                                                                                                              | **Tipo/Tamanho**                                       | **Obrigatório** |
| :------------------------- | :------------------------------------------------------------------------------------------------------------------------------------------------------------------------- | :----------------------------------------------------- | :-------------- |
| `bpmpi_billto_customerid`  | Identifica o CPF/CNPJ do comprador                                                                                                                                         | Numérico \[11 a 14 posições] 99999999999999            | Recomendado     |
| `bpmpi_billto_contactname` | Nome do contato do endereço de cobrança                                                                                                                                    | Alfanumérico \[até 120]                                | Sim             |
| `bpmpi_billto_phonenumber` | Telefone de contato do endereço de cobrança                                                                                                                                | Numérico \[até 15 posições], no formato: 5511999999999 | Sim\*           |
| `bpmpi_billto_email`       | E-mail do contato do endereço de cobrança                                                                                                                                  | Alfanumérico \[até 255], no formato `nome@exemplo.com` | Sim\*           |
| `bpmpi_billto_street1`     | Logradouro e Número do endereço de cobrança                                                                                                                                | Alfanumérico \[até 60]                                 | Sim\*           |
| `bpmpi_billto_street2`     | Complemento e bairro do endereço de cobrança                                                                                                                               | Alfanumérico \[até 60]                                 | Recomendado     |
| `bpmpi_billto_city`        | Cidade do endereço de cobrança                                                                                                                                             | Alfanumérico \[até 50]                                 | Sim             |
| `bpmpi_billto_state`       | Sigla do estado do endereço de cobrança.<br /> **Brasil, Estados Unidos e Canadá**: insira a sigla do estado.<br /> **Outros países**: insira a sigla do país de cobrança. | Texto \[2 posições]                                    | Sim             |
| `bpmpi_billto_zipcode`     | CEP do endereço de cobrança                                                                                                                                                | Alfanumérico \[até 8 posições], no formato: 99999999   | Sim             |
| `bpmpi_billto_country`     | País do endereço de cobrança                                                                                                                                               | Texto \[2 posições] Ex. BR                             | Sim             |

\***Transações Elo sem este campo serão rejeitadas.**

## Endereço de entrega

| **Campo**                     | **Descrição**                                                                                                                                                              | **Tipo/Tamanho**                                                                                                                                                                                                                               | **Obrigatório** |
| :---------------------------- | :------------------------------------------------------------------------------------------------------------------------------------------------------------------------- | :--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- | :-------------- |
| `bpmpi_shipto_sameasbillto`   | Indica se utiliza o mesmo endereço fornecido para endereço de cobrança                                                                                                     | Booleano (true ou false)                                                                                                                                                                                                                       | Recomendado     |
| `bpmpi_shipto_addressee`      | Nome do contato do endereço de entrega                                                                                                                                     | Alfanumérico \[até 60]                                                                                                                                                                                                                         | Recomendado     |
| `bpmpi_shipTo_phonenumber`    | Telefone de contato do endereço de entrega                                                                                                                                 | Numérico \[até 15 posições], no formato: 5511999999999                                                                                                                                                                                         | Recomendado     |
| `bpmpi_shipTo_email`          | E-mail do contato do endereço de entrega                                                                                                                                   | Alfanumérico \[até 255], no formato `nome@exemplo.com`                                                                                                                                                                                         | Recomendado     |
| `bpmpi_shipTo_street1`        | Logradouro e Número do endereço de entrega                                                                                                                                 | Alfanumérico \[até 60]                                                                                                                                                                                                                         | Recomendado     |
| `bpmpi_shipTo_street2`        | Complemento e bairro do endereço de entrega                                                                                                                                | Alfanumérico \[até 60]                                                                                                                                                                                                                         | Recomendado     |
| `bpmpi_shipTo_city`           | Cidade do endereço de entrega                                                                                                                                              | Alfanumérico \[até 50]                                                                                                                                                                                                                         | Recomendado     |
| `bpmpi_shipTo_state`          | Sigla do estado do endereço de cobrança.<br /> **Brasil, Estados Unidos e Canadá**: insira a sigla do estado.<br /> **Outros países**: insira a sigla do país de cobrança. | Texto \[2 posições]                                                                                                                                                                                                                            | Recomendado     |
| `bpmpi_shipto_zipcode`        | CEP do endereço de entrega                                                                                                                                                 | Alfanumérico \[até 8 posições], no formato: 99999999                                                                                                                                                                                           | Recomendado     |
| `bpmpi_shipto_country`        | País do endereço de cobrança                                                                                                                                               | Texto \[2 posições] Ex. BR                                                                                                                                                                                                                     | Recomendado     |
| `bpmpi_shipTo_shippingmethod` | Tipo do método de envio                                                                                                                                                    | lowcost: envio econômico<br /> sameday: envio no mesmo dia<br /> oneday: envio no dia seguinte<br /> twoday: envio em dois dias<br /> threeday: envio em três dias<br /> pickup: retirada na loja<br /> other: outros<br /> none: não há envio | Recomendado     |
| `bpmpi_shipto_firstusagedate` | Indica a data de quando houve a primeira utilização do endereço de entrega                                                                                                 | Texto<br />AAAA-MM-DD – data da criação                                                                                                                                                                                                        | Recomendado     |

## Carrinho de compras

| **Campo**                  | **Descrição**                                  | **Tipo/Tamanho**                 | **Obrigatório** |
| -------------------------- | ---------------------------------------------- | -------------------------------- | --------------- |
| `bpmpi_cart_#_description` | Descrição do item                              | Alfanumérico \[até 255 posições] | Recomendado     |
| `bpmpi_cart_#_name`        | Nome do item                                   | Alfanumérico \[até 255 posições] | Recomendado     |
| `bpmpi_cart_#_sku`         | SKU do item                                    | Alfanumérico \[até 255 posições] | Recomendado     |
| `bpmpi_cart_#_quantity`    | Quantidade do item no carrinho                 | Numérico \[até 10 posições]      | Recomendado     |
| `bpmpi_cart_#_unitprice`   | Valor unitário do item do carrinho em centavos | Numérico \[até 10 posições]      | Recomendado     |

## Usuário

| **Campo**                                   | **Descrição**                                                            | **Tipo/Tamanho**                                                                                                                 | **Obrigatório** |
| :------------------------------------------ | :----------------------------------------------------------------------- | :------------------------------------------------------------------------------------------------------------------------------- | :-------------- |
| `bpmpi_useraccount_guest`                   | Indica se o comprador é um comprador sem login (guest)                   | Booleano<br /> true – sim<br /> false – não                                                                                      | Recomendado     |
| `bpmpi_useraccount_createddate`             | Indica a data de quando houve a criação da conta do comprador            | Texto<br /> AAAA-MM-DD – data da criação                                                                                         | Recomendado     |
| `bpmpi_useraccount_changeddate`             | Indica a data de quando houve a última alteração na conta do comprador   | Texto<br /> AAAA-MM-DD – data da última alteração                                                                                | Recomendado     |
| `bpmpi_useraccount_passwordchangeddate`     | Indica a data de quando houve a alteração de senha da conta do comprador | Texto<br /> AAAA-MM-DD – data da última alteração de senha                                                                       | Recomendado     |
| `bpmpi_useraccount_authenticationmethod`    | Método de autenticação do comprador na loja                              | 01- Não houve autenticação<br /> 02- Login da própria loja<br /> 03- Login com ID federado<br /> 04- Login com autenticador FIDO | Recomendado     |
| `bpmpi_useraccount_authenticationprotocol`  | Dado que representa o protocolo de login efetuado na loja                | Alfanumérico \[até 2048 posições]                                                                                                | Recomendado     |
| `bpmpi_useraccount_authenticationtimestamp` | A data e hora que o login foi efetuado na loja                           | Texto \[19 posições] <em>YYYY-MM-ddTHH:mm:SS</em>                                                                                | Recomendado     |
| `bpmpi_merchant_newcustomer`                | Identifica se um comprador novo na loja                                  | Booleano<br /> true – sim<br /> false – não                                                                                      | Recomendado     |

## Dispositivo

<Table align={["left","left","left","left"]}>
  <thead>
    <tr>
      <th>
        **Campo**
      </th>

      <th>
        **Descrição**
      </th>

      <th>
        **Tipo/Tamanho**
      </th>

      <th>
        **Obrigatório**
      </th>
    </tr>
  </thead>

  <tbody>
    <tr>
      <td>
        `bpmpi_device_ipaddress`
      </td>

      <td>
        Endereço IP da máquina do comprador
      </td>

      <td>
        Alfanumérico [até 45]
      </td>

      <td>
        Sim*
      </td>
    </tr>

    <tr>
      <td>
        `bpmpi_device_#_fingerprint`
      </td>

      <td>
        Id retornado pelo Device Fingerprint
      </td>

      <td>
        Alfanumérico [sem limitação]
      </td>

      <td>
        Recomendado
      </td>
    </tr>

    <tr>
      <td>
        `bpmpi_device_#_provider`
      </td>

      <td>
        Nome do provedor do Device Fingerprint<br /><br />

        * cardinal<br />
        * inauth<br />
        * threatmetrix
      </td>

      <td>
        Alfanumérico [até 32 posições]
      </td>

      <td>
        Recomendado
      </td>
    </tr>

    <tr>
      <td>
        `bpmpi_device_channel`
      </td>

      <td>
        Canal por onde chegou a transação. Valores possíveis:<br /><br />

        * Browser<br />
        * SDK<br />
        * 3RI
      </td>

      <td>
        Alfanúmerico [até 7 posições]
      </td>

      <td>
        Sim
      </td>
    </tr>
  </tbody>
</Table>

\***Transações Elo sem este campo serão rejeitadas.**

## Recorrência

| **Campo**                             | **Descrição**                                                            | **Tipo/Tamanho**                                                                                                                                                                                                                                                                        | **Obrigatório** |
| :------------------------------------ | :----------------------------------------------------------------------- | :-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- | :-------------- |
| `bpmpi_recurring_type`                | Tipo de pagamento recorrente.                                            | Número<br /> 1 - Primeira transação<br /> 2 - Transação subsequente<br /> 3 - Modificação<br /> 4 - Cancelamento                                                                                                                                                                        | Recomendado     |
| `bpmpi_recurring_validationIndicator` | Indica se a transação de pagamento recorrente foi validada ou não        | Número<br /> 0 - Não validado<br /> 1 - Validado                                                                                                                                                                                                                                        | Recomendado     |
| `bpmpi_recurring_maximumAmount`       | Valor máximo acordado pelo titular do cartão.                            | Numérico \[até 12 posições]                                                                                                                                                                                                                                                             | Recomendado     |
| `bpmpi_recurring_referenceNumber`     | Número de referência exclusivo para a transação de pagamento recorrente. | Alfanumérico \[até 35 posições]                                                                                                                                                                                                                                                         | Recomendado     |
| `bpmpi_recurring_occurrence`          | Indica a frequência com que ocorre um pagamento recorrente.              | Número<br /> 01 - Diariamente<br /> 02 - Duas vezes por semana<br /> 03 - Semanal<br /> 04 - Dez dias<br /> 05 - A cada 2 semanas<br /> 06 - Mensal<br /> 07 - Bimestral<br /> 08 - Trimestral<br /> 09 - Quadrimestral<br /> 10 - Semestral<br /> 11 - Anual<br /> 12 - Não programado | Recomendado     |
| `bpmpi_recurring_numberOfPayments`    | Número total de pagamentos durante a assinatura recorrente.              | Numérico \[até 2 posições]                                                                                                                                                                                                                                                              | Recomendado     |
| `bpmpi_recurring_amountType`          | Indica o tipo de valor recorrente acordado pelo titular do cartão.       | Valores suportados:<br /> 1 - Pagamento recorrente de valor fixo<br /> 2 - Pagamento recorrente com valor máximo                                                                                                                                                                        | Recomendado     |

## Companhias aéreas

| **Campo**                                 | **Descrição**                                                                             | **Tipo/Tamanho**                | **Obrigatório** |
| ----------------------------------------- | ----------------------------------------------------------------------------------------- | ------------------------------- | --------------- |
| `bpmpi_airline_travelleg_#_carrier`       | Código IATA para o trecho                                                                 | Alfanumérico \[2 posições]      | Recomendado     |
| `bpmpi_airline_travelleg_#_departuredate` | Data de partida                                                                           | Texto  AAAA-MM-DD               | Recomendado     |
| `bpmpi_airline_travelleg_#_origin`        | Código IATA do aeroporto de origem                                                        | Alfanumérico \[5 posições]      | Recomendado     |
| `bpmpi_airline_travelleg_#_destination`   | Código IATA do aeroporto de destino                                                       | Alfanumérico \[5 posições]      | Recomendado     |
| `bpmpi_airline_passenger_#_name`          | Nome do passageiro                                                                        | Alfanumérico \[até 60 posições] | Recomendado     |
| `bpmpi_airline_passenger_#_ticketprice`   | O valor da passagem em centavos  Numérico \[até 15 posições],  exemplo: R$ 125,54 = 12554 | Recomendado                     |                 |
| `bpmpi_airline_numberofpassengers`        | Número de passageiros                                                                     | Numérico \[3 posições]          | Recomendado     |
| `bpmpi_airline_billto_passportcountry`    | Código do país que emitiu o passaporte (ISO Standard Country Codes)                       | Texto \[2 posições]             | Recomendado     |
| `bpmpi_airline_billto_passportnumber`     | Número do passaporte                                                                      | Alfanumérico \[40 posições]     | Recomendado     |

## Estabelecimento

| **Campo**                        | **Descrição**                                                           | **Tipo/Tamanho**                 | **Obrigatório**                   |
| -------------------------------- | ----------------------------------------------------------------------- | -------------------------------- | --------------------------------- |
| `bpmpi_mdd1`                     | Dado Extra definido pelo lojista                                        | Alfanumérico \[até 255 posições] | Recomendado                       |
| `bpmpi_mdd2`                     | Dado Extra definido pelo lojista                                        | Alfanumérico \[até 255 posições] | Recomendado                       |
| `bpmpi_mdd3`                     | Dado Extra definido pelo lojista                                        | Alfanumérico \[até 255 posições] | Recomendado                       |
| `bpmpi_mdd4`                     | Dado Extra definido pelo lojista                                        | Alfanumérico \[até 255 posições] | Recomendado                       |
| `bpmpi_mdd5`                     | Dado Extra definido pelo lojista                                        | Alfanumérico \[até 255 posições] | Recomendado                       |
| `bpmpi_brand_establishment_code` | Código de estabelecimento (EC) Amex. Obrigatório em autenticações Amex. | Texto \[10 posições]             | Obrigatório em autenticações Amex |