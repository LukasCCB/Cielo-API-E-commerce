---
updatedAt: 2026-01-16T12:38:36.000Z
agentTools:
  siteIndex: https://docs.cielo.com.br/llms.txt
  projectIndex: https://docs.cielo.com.br/ecommerce-cielo/llms.txt
---

# Autorização para transações Data Only

> ℹ️ Confira os exemplos completos de requisição e resposta para cada meio de pagamento:
>
> * <a href="https://docs.cielo.com.br/ecommerce-cielo/reference/criar-pagamento-credito" target="_blank">Criar pagamento com cartão de crédito</a>;
> * <a href="https://docs.cielo.com.br/ecommerce-cielo/reference/debito" target="\_blank">Criar pagamento com cartão de débito</a>.

Após a conclusão da autenticação do portador do cartão no modelo Data Only (com o campo `bpmpi_auth_notifyonly` como "true"), a loja deve submeter a transação ao processo de autorização, enviando os dados de autenticação no modelo de "autenticação externa" (nó `ExternalAuthentication`), tanto para 3DS Server interno quanto para 3DS Server externo.

<Callout icon="ℹ️" theme="info">
  Para as bandeiras Visa e Mastercard, é obrigatório usar a versão 2.2 do protocolo 3DS para autenticação DataOnly.
</Callout>

Veja a seguir um exemplo de requisição de autorização à API E-commerce Cielo.

## Requisição Data Only

<br />

| Environment | Método                                                                                                                                                                                                                  | Endpoint                                                 |
| :---------- | :---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- | :------------------------------------------------------- |
| Sandbox     | <div class="headline-container-article-info2GaOf2jMpV0r"><span class="rm-APIMethod APIMethod APIMethod_fixedWidth APIMethod_post headline-container-api-method1Hc-Fm7uaccR" data-testid="http-method">post</span></div> | `https://apisandbox.cieloecommerce.cielo.com.br/1/sales` |
| Production  | <div class="headline-container-article-info2GaOf2jMpV0r"><span class="rm-APIMethod APIMethod APIMethod_fixedWidth APIMethod_post headline-container-api-method1Hc-Fm7uaccR" data-testid="http-method">post</span></div> | `https://api.cieloecommerce.cielo.com.br/1/sales`        |

```json
{
   "MerchantOrderId":"2017051002",
   "Customer":
   {
     (...)
   },
   "Payment":
   {
     (...)
     "Authenticate":false,
     "CreditCard":{
         "CardNumber":"4000000000001000",
         "Holder":"Nome do Portador",
         "ExpirationDate":"12/2030",
         "SecurityCode":"123",
         "Brand":"Mastercard",
         "SaveCard":"false"
     },
     "ExternalAuthentication":{
       "Eci":"4",
       "ReferenceID":"a24a5d87-b1a1-4aef-a37b-2f30b91274e6",
       "Xid":"Uk5ZanBHcWw2RjRCbEN5dGtiMTB=",
       "Version":"2.2.0",
       "dataonly":true
     }
   }
}
```
```curl
curl
--request POST "https://apisandbox.cieloecommerce.cielo.com.br/1/sales"
--header "Content-Type: application/json"
--header "MerchantId: xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx"
--header "MerchantKey: xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx"
--data-binary
--verbose
{
   "MerchantOrderId":"2017051002",
   "Customer":
   {
     (...)
   },
   "Payment":
   {
     (...)
     "Authenticate":false,
     "ReturnUrl":"http://www.loja.com.br",
     "CreditCard":{
         "CardNumber":"4000000000001000",
         "Holder":"Nome do Portador",
         "ExpirationDate":"12/2030",
         "SecurityCode":"123",
         "Brand":"Mastercard",
         "SaveCard":"false"
     },
     "ExternalAuthentication":{
       "Eci":"4",
       "ReferenceID":"a24a5d87-b1a1-4aef-a37b-2f30b91274e6",
       "Xid":"Uk5ZanBHcWw2RjRCbEN5dGtiMTB=",
       "Version":"2.2.0",
       "dataonly":true
     }
   }
}
```

A resposta irá seguir o padrão de uma resposta de transação de crédito ou débito. Confira os detalhes na Referência da API.

<br />

<Table align={["left","left","left","left","left"]}>
  <thead>
    <tr>
      <th>
        **Campo**
      </th>

      <th>
        **Descrição**
      </th>

      <th>
        **Tipo**
      </th>

      <th>
        **Tamanho**
      </th>

      <th>
        **Obrigatório**
      </th>
    </tr>
  </thead>

  <tbody>
    <tr>
      <td>
        `Payment.Authenticate`
      </td>

      <td>
        Define se o comprador será direcionado ao emissor para autenticação do cartão.
      </td>

      <td>
        booleano ("true" / "false")
      </td>

      <td>
        \-
      </td>

      <td>
        Sim. No caso de transação _Data Only_, é obrigatório enviar como "false".
      </td>
    </tr>

    <tr>
      <td>
        `Payment.ExternalAuthentication.Eci`
      </td>

      <td>
        _E-Commerce Indicator_ retornado no processo de autenticação.
      </td>

      <td>
        número
      </td>

      <td>
        1 posição
      </td>

      <td>
        Sim.
      </td>
    </tr>

    <tr>
      <td>
        `Payment.ExternalAuthentication.ReferenceId`
      </td>

      <td>
        RequestID retornado no processo de autenticação.   

        * O `ReferenceId` não é retornado em todas as autenticações.
        * O envio é recomendado caso o `ReferenceId` tenha sido retornado no script.
      </td>

      <td>
        GUID
      </td>

      <td>
        36 posições
      </td>

      <td>
        Não
      </td>
    </tr>

    <tr>
      <td>
        `Payment.ExternalAuthentication.DataOnly`
      </td>

      <td>
        Define se é uma transação _Data Only_.
      </td>

      <td>
        booleano ("true" / "false")
      </td>

      <td>
        \-
      </td>

      <td>
        Sim. No caso de transação _Data Only_, é obrigatório enviar como "true".
      </td>
    </tr>

    <tr>
      <td>
        `Payment.ExternalAuthentication.Cavv`
      </td>

      <td>
        Assinatura retornada nos cenários de sucesso na autenticação.
      </td>

      <td>
        texto
      </td>

      <td>
        \-
      </td>

      <td>
        ⚠️Este campo é obrigatório para transações que foram autenticadas pelo emissor ou pela bandeira e nas solicitações de autorizações com Data Only.
      </td>
    </tr>

    <tr>
      <td>
        `Payment.ExternalAuthentication.Version`
      </td>

      <td>
        Versão do 3DS aplicado no processo de autenticação.\  
        Valores possíveis:

        * Visa e Mastercard: "2.2.0"
        * Elo e Amex: "2.1.0"
      </td>

      <td>
        texto
      </td>

      <td>
        5
      </td>

      <td>
        Campo obrigatório para transações com autenticação 3DS.
      </td>
    </tr>
  </tbody>
</Table>