---
updatedAt: 2026-10-02T18:13:32.000Z
agentTools:
  siteIndex: https://docs.cielo.com.br/llms.txt
  projectIndex: https://docs.cielo.com.br/ecommerce-cielo/llms.txt
---

# Autorização com autenticação

<Callout icon="ℹ️" theme="info">
  ### Confira os exemplos completos de requisição e resposta para cada meio de pagamento:

  * <a href="https://docs.cielo.com.br/ecommerce-cielo/reference/criar-pagamento-credito" target="_blank">Criar pagamento com cartão de crédito</a>;
  * <a href="https://docs.cielo.com.br/ecommerce-cielo/reference/debito" target="_blank">Criar pagamento com cartão de débito</a>.
</Callout>

Após a conclusão da <Glossary>autenticação</Glossary> do portador do cartão, a loja deve submeter a transação ao processo de <Glossary>autorização</Glossary>, enviando os dados de autenticação no modelo de "autenticação externa" (nó `ExternalAuthentication`), tanto para 3DS Server interno quanto para 3DS Server externo.

Veja a seguir um exemplo de requisição de autorização à API E-commerce Cielo:

### Requisição de autorização com o nó da autenticação

Confira a seguir o exemplo de uma autorização de cartão de crédito com o nó da autenticação.

<Table align={["left","left","left"]}>
  <thead>
    <tr>
      <th>
        Ambiente
      </th>

      <th>
        Método
      </th>

      <th>
        Endpoint
      </th>
    </tr>
  </thead>

  <tbody>
    <tr>
      <td>
        Sandbox
      </td>

      <td>
        <div class="headline-container-article-info2GaOf2jMpV0r">
          <span class="rm-APIMethod APIMethod APIMethod_fixedWidth APIMethod_post headline-container-api-method1Hc-Fm7uaccR" data-testid="http-method">post</span>
        </div>
      </td>

      <td>
        `https://apisandbox.cieloecommerce.cielo.com.br/1/sales`
      </td>
    </tr>

    <tr>
      <td>
        Produção
      </td>

      <td>
        <div class="headline-container-article-info2GaOf2jMpV0r">
          <span class="rm-APIMethod APIMethod APIMethod_fixedWidth APIMethod_post headline-container-api-method1Hc-Fm7uaccR" data-testid="http-method">post</span>
        </div>
      </td>

      <td>
        `https://api.cieloecommerce.cielo.com.br/1/sales`
      </td>
    </tr>
  </tbody>
</Table>

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
     "Authenticate":true,
     "CreditCard":{
         "CardNumber":"4000000000001000",
         "Holder":"Nome do Portador",
         "ExpirationDate":"12/2021",
         "SecurityCode":"123",
         "Brand":"Visa",
         "SaveCard":"false"
     },
     "ExternalAuthentication":{
       "Cavv":"AAABB2gHA1B5EFNjWQcDAAAAAAB=",
       "Xid":"Uk5ZanBHcWw2RjRCbEN5dGtiMTB=",
       "Eci":"5",
       "Version":"2",
       "ReferenceID":"a24a5d87-b1a1-4aef-a37b-2f30b91274e6"
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
     "Authenticate":true,
     "CreditCard":{
         "CardNumber":"4000000000001000",
         "Holder":"Nome do Portador",
         "ExpirationDate":"12/2021",
         "SecurityCode":"123",
         "Brand":"Visa",
         "SaveCard":"false"
     },
     "ExternalAuthentication":{
       "Cavv":"AAABB2gHA1B5EFNjWQcDAAAAAAB=",
       "Xid":"Uk5ZanBHcWw2RjRCbEN5dGtiMTB=",
       "Eci":"5",
       "Version":"2",
       "ReferenceId":"a24a5d87-b1a1-4aef-a37b-2f30b91274e6"
     }
   }
}
```

<Table align={["left","left","left","left","left"]}>
  <thead>
    <tr>
      <th>
        Campo
      </th>

      <th>
        Descrição
      </th>

      <th>
        Tipo
      </th>

      <th>
        Tamanho
      </th>

      <th>
        Obrigatório
      </th>
    </tr>
  </thead>

  <tbody>
    <tr>
      <td>
        `Payment.Provider`
      </td>

      <td>
        Nome do provedor do meio de pagamento. <br />Valor possível: Cielo.
      </td>

      <td>
        texto
      </td>

      <td>
        15 posições
      </td>

      <td>
        Sim.
      </td>
    </tr>

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
        *
      </td>

      <td>
        Sim, caso a autenticação seja validada.
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
        *
      </td>

      <td>
        ⚠️Este campo é obrigatório para transações que foram autenticadas pelo emissor ou pela bandeira e nas solicitações de autorizações com Data Only.
      </td>
    </tr>

    <tr>
      <td>
        `Payment.ExternalAuthentication.Xid`
      </td>

      <td>
        XID retornado no processo de autenticação.<br />- _O_`Xid`_&#x20;não é retornado em todas as autenticações._<br />- _O envio é recomendado caso o_`Xid`_&#x20;tenha sido retornado no script._
      </td>

      <td>
        texto
      </td>

      <td>
        *
      </td>

      <td>
        Não
      </td>
    </tr>

    <tr>
      <td>
        `Payment.ExternalAuthentication.Eci`
      </td>

      <td>
        * Electronic Commerce Indicator\_ retornado no processo de autenticação.
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
        `Payment.ExternalAuthentication.Version`
      </td>

      <td>
        Versão do 3DS aplicado no processo de autenticação.<br /> Valores possíveis:<br />

        * Visa e Mastercard: "2.2.0"<br />
        * Elo e Amex: "2.1.0"
      </td>

      <td>
        alfanumérico
      </td>

      <td>
        5 posições.
      </td>

      <td>
        Campo obrigatório para transações com autenticação 3DS.
      </td>
    </tr>

    <tr>
      <td>
        `Payment.ExternalAuthentication.ReferenceID`
      </td>

      <td>
        RequestID retornado no processo de autenticação.<br />

        * _O&#x20;_`ReferenceId`_&#x20;não é retornado em todas as autenticações._<br />
        * _O envio é recomendado caso o&#x20;_`ReferenceId`_&#x20;tenha sido retornado no script._
      </td>

      <td>
        GUID
      </td>

      <td>
        36 posições
      </td>

      <td>
        Condicional
      </td>
    </tr>
  </tbody>
</Table>

A resposta irá seguir o padrão de uma resposta de transação de crédito ou débito. Confira os detalhes na Referência da API.