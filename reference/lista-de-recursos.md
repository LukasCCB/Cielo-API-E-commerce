---
updatedAt: 2026-07-16T20:45:11.000Z
agentTools:
  siteIndex: https://docs.cielo.com.br/llms.txt
  projectIndex: https://docs.cielo.com.br/ecommerce-cielo/llms.txt
---

# Lista de recursos

Confira a seguir os recursos disponíveis na API E-commerce Cielo.

## API transacional

URL sandbox: `https://apisandbox.cieloecommerce.cielo.com.br`

URL produção: `https://api.cieloecommerce.cielo.com.br`

<Table align={["left","left","left"]}>
  <thead>
    <tr>
      <th>
        Método
      </th>

      <th>
        Endpoint
      </th>

      <th>
        Descrição
      </th>
    </tr>
  </thead>

  <tbody>
    <tr>
      <td>
        <div class="headline-container-article-info2GaOf2jMpV0r">
          <span class="rm-APIMethod APIMethod APIMethod_fixedWidth APIMethod_get headline-container-api-method1Hc-Fm7uaccR" data-testid="http-method">get</span>
        </div>
      </td>

      <td>
        /1/cardBin/`{BIN}`
      </td>

      <td>
        Consulta o BIN do cartão.
      </td>
    </tr>

    <tr>
      <td>
        <div class="headline-container-article-info2GaOf2jMpV0r">
          <span class="rm-APIMethod APIMethod APIMethod_fixedWidth APIMethod_post headline-container-api-method1Hc-Fm7uaccR" data-testid="http-method">post</span>
        </div>
      </td>

      <td>
        /1/zeroauth/
      </td>

      <td>
        Faz a validação Zero Auth do cartão.
      </td>
    </tr>

    <tr>
      <td>
        <div class="headline-container-article-info2GaOf2jMpV0r">
          <span class="rm-APIMethod APIMethod APIMethod_fixedWidth APIMethod_post headline-container-api-method1Hc-Fm7uaccR" data-testid="http-method">post</span>
        </div>
      </td>

      <td>
        /1/sales
      </td>

      <td>
        Cria [pagamentos](https://docs.cielo.com.br/ecommerce-cielo/reference/criar-pagamento-credito)  (para cada meio de pagamento), cria pagamentos com [cartões tokenizados](https://docs.cielo.com.br/ecommerce-cielo/reference/criar-cardtoken) e [recorrências](https://docs.cielo.com.br/ecommerce-cielo/reference/criar-recorrencia).
      </td>
    </tr>

    <tr>
      <td>
        <div class="headline-container-article-info2GaOf2jMpV0r">
          <span class="rm-APIMethod APIMethod APIMethod_fixedWidth APIMethod_put headline-container-api-method1Hc-Fm7uaccR" data-testid="http-method">put</span>
        </div>
      </td>

      <td>
        /`{paymentId}`/capture?amount=`{Valor}`
      </td>

      <td>
        Captura transação de cartão de crédito.
      </td>
    </tr>

    <tr>
      <td>
        <div class="headline-container-article-info2GaOf2jMpV0r">
          <span class="rm-APIMethod APIMethod APIMethod_fixedWidth APIMethod_put headline-container-api-method1Hc-Fm7uaccR" data-testid="http-method">put</span>
        </div>
      </td>

      <td>
        /1/sales/`{PaymentId}`/void?amount=`{Valor}`
      </td>

      <td>
        - Cancela transação de cartão de crédito ou débito via `PaymentId`;
        - Solicita uma devolução Pix.
      </td>
    </tr>

    <tr>
      <td>
        <div class="headline-container-article-info2GaOf2jMpV0r">
          <span class="rm-APIMethod APIMethod APIMethod_fixedWidth APIMethod_put headline-container-api-method1Hc-Fm7uaccR" data-testid="http-method">put</span>
        </div>
      </td>

      <td>
        /1/sales/OrderId/`{MerchantOrderId}`/void?amount=`{Valor}`
      </td>

      <td>
        Cancela transação de cartão de crédito ou débito via `MerchantOrderId`.
      </td>
    </tr>

    <tr>
      <td>
        <div class="headline-container-article-info2GaOf2jMpV0r">
          <span class="rm-APIMethod APIMethod APIMethod_fixedWidth APIMethod_put headline-container-api-method1Hc-Fm7uaccR" data-testid="http-method">put</span>
        </div>
      </td>

      <td>
        /1/RecurrentPayment/`{RecurrentPaymentId}`/Customer
      </td>

      <td>
        Altera dados do comprador em um pagamento recorrente.
      </td>
    </tr>

    <tr>
      <td>
        <div class="headline-container-article-info2GaOf2jMpV0r">
          <span class="rm-APIMethod APIMethod APIMethod_fixedWidth APIMethod_put headline-container-api-method1Hc-Fm7uaccR" data-testid="http-method">put</span>
        </div>
      </td>

      <td>
        /1/RecurrentPayment/`{RecurrentPaymentId}`/Payment
      </td>

      <td>
        Altera dados do pagamento recorrente.
      </td>
    </tr>

    <tr>
      <td>
        <div class="headline-container-article-info2GaOf2jMpV0r">
          <span class="rm-APIMethod APIMethod APIMethod_fixedWidth APIMethod_put headline-container-api-method1Hc-Fm7uaccR" data-testid="http-method">put</span>
        </div>
      </td>

      <td>
        RecurrentPayment/`{RecurrentPaymentId}`/Amount
      </td>

      <td>
        Altera valor do pagamento recorrente.
      </td>
    </tr>

    <tr>
      <td>
        <div class="headline-container-article-info2GaOf2jMpV0r">
          <span class="rm-APIMethod APIMethod APIMethod_fixedWidth APIMethod_put headline-container-api-method1Hc-Fm7uaccR" data-testid="http-method">put</span>
        </div>
      </td>

      <td>
        /1/RecurrentPayment/`{RecurrentPaymentId}`/RecurrencyDay
      </td>

      <td>
        Altera dia do pagamento recorrente.
      </td>
    </tr>

    <tr>
      <td>
        <div class="headline-container-article-info2GaOf2jMpV0r">
          <span class="rm-APIMethod APIMethod APIMethod_fixedWidth APIMethod_put headline-container-api-method1Hc-Fm7uaccR" data-testid="http-method">put</span>
        </div>
      </td>

      <td>
        /1/RecurrentPayment/`{RecurrentPaymentId}`/NextPaymentDate
      </td>

      <td>
        Altera data do próximo pagamento recorrente.
      </td>
    </tr>

    <tr>
      <td>
        <div class="headline-container-article-info2GaOf2jMpV0r">
          <span class="rm-APIMethod APIMethod APIMethod_fixedWidth APIMethod_put headline-container-api-method1Hc-Fm7uaccR" data-testid="http-method">put</span>
        </div>
      </td>

      <td>
        /1/RecurrentPayment/`{RecurrentPaymentId}`/Interval
      </td>

      <td>
        Altera intervalo do pagamento recorrente.
      </td>
    </tr>

    <tr>
      <td>
        <div class="headline-container-article-info2GaOf2jMpV0r">
          <span class="rm-APIMethod APIMethod APIMethod_fixedWidth APIMethod_put headline-container-api-method1Hc-Fm7uaccR" data-testid="http-method">put</span>
        </div>
      </td>

      <td>
        /1/RecurrentPayment/`{RecurrentPaymentId}`/EndDate
      </td>

      <td>
        Altera data final do pagamento recorrente.
      </td>
    </tr>

    <tr>
      <td>
        <div class="headline-container-article-info2GaOf2jMpV0r">
          <span class="rm-APIMethod APIMethod APIMethod_fixedWidth APIMethod_put headline-container-api-method1Hc-Fm7uaccR" data-testid="http-method">put</span>
        </div>
      </td>

      <td>
        /1/RecurrentPayment/`{RecurrentPaymentId}`/Deactivate
      </td>

      <td>
        Desativa um pagamento recorrente.
      </td>
    </tr>

    <tr>
      <td>
        <div class="headline-container-article-info2GaOf2jMpV0r">
          <span class="rm-APIMethod APIMethod APIMethod_fixedWidth APIMethod_put headline-container-api-method1Hc-Fm7uaccR" data-testid="http-method">put</span>
        </div>
      </td>

      <td>
        /1/RecurrentPayment/`{RecurrentPaymentId}`/Reactivate
      </td>

      <td>
        Reativa um pagamento recorrente.
      </td>
    </tr>
  </tbody>
</Table>

## API de consulta

URL sandbox: `https://apiquerysandbox.cieloecommerce.cielo.com.br`

URL produção: `https://apiquery.cieloecommerce.cielo.com.br`

<br />

<Table align={["left","left","left"]}>
  <thead>
    <tr>
      <th>
        Método
      </th>

      <th>
        Endpoint
      </th>

      <th>
        Descrição
      </th>
    </tr>
  </thead>

  <tbody>
    <tr>
      <td>
        <div class="headline-container-article-info2GaOf2jMpV0r">
          <span class="rm-APIMethod APIMethod APIMethod_fixedWidth APIMethod_get headline-container-api-method1Hc-Fm7uaccR" data-testid="http-method">get</span>
        </div>
      </td>

      <td>
        /1/sales/`{PaymentId}`
      </td>

      <td>
        Consulta transação pelo `PaymentId`.
      </td>
    </tr>

    <tr>
      <td>
        <div class="headline-container-article-info2GaOf2jMpV0r">
          <span class="rm-APIMethod APIMethod APIMethod_fixedWidth APIMethod_get headline-container-api-method1Hc-Fm7uaccR" data-testid="http-method">get</span>
        </div>
      </td>

      <td>
        /1/sales/acquirerTid/`{TID}`
      </td>

      <td>
        Consulta transação pelo `Tid`.
      </td>
    </tr>

    <tr>
      <td>
        <div class="headline-container-article-info2GaOf2jMpV0r">
          <span class="rm-APIMethod APIMethod APIMethod_fixedWidth APIMethod_get headline-container-api-method1Hc-Fm7uaccR" data-testid="http-method">get</span>
        </div>
      </td>

      <td>
        /1/sales?merchantOrderId=`{merchantOrderId}`
      </td>

      <td>
        Consulta transação pelo `MerchantOrderId`.
      </td>
    </tr>

    <tr>
      <td>
        <div class="headline-container-article-info2GaOf2jMpV0r">
          <span class="rm-APIMethod APIMethod APIMethod_fixedWidth APIMethod_get headline-container-api-method1Hc-Fm7uaccR" data-testid="http-method">get</span>
        </div>
      </td>

      <td>
        /1/RecurrentPayment/`{RecurrentPaymentId}`
      </td>

      <td>
        Consulta transação recorrente.
      </td>
    </tr>
  </tbody>
</Table>

<br />