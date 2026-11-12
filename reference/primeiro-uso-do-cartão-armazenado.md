---
updatedAt: 2025-10-30T07:59:46.000Z
agentTools:
  siteIndex: https://docs.cielo.com.br/llms.txt
  projectIndex: https://docs.cielo.com.br/ecommerce-cielo/llms.txt
---

# Primeiro uso do cartão armazenado

O exemplo abaixo mostra como utilizar a funcionalidade **Card on File** quando o cartão está sendo armazenado pela primeira vez.\
Esse processo permite que o cartão seja reutilizado em transações futuras, oferecendo mais praticidade e segurança para a pessoa usuária.

> ℹ️
>
> Saiba mais sobre essa funcionalidade <a href="https://docs.cielo.com.br/ecommerce-cielo/docs/card-on-file-1" target="_blank">na documentação</a>.

<div class="headline-container-article-info2GaOf2jMpV0r">
  <span class="rm-APIMethod APIMethod APIMethod_fixedWidth APIMethod_post headline-container-api-method1Hc-Fm7uaccR" data-testid="http-method">post</span>
</div>

<Table align={["left","left","left"]}>
  <thead>
    <tr>
      <th style={{ textAlign: "left" }}>
        Ambiente
      </th>

      <th style={{ textAlign: "left" }}>
        Método
      </th>

      <th style={{ textAlign: "left" }}>
        Endpoint
      </th>
    </tr>
  </thead>

  <tbody>
    <tr>
      <td style={{ textAlign: "left" }}>
        Sandbox
      </td>

      <td style={{ textAlign: "left" }}>
        <div class="headline-container-article-info2GaOf2jMpV0r"><span class="rm-APIMethod APIMethod APIMethod_fixedWidth APIMethod_post headline-container-api-method1Hc-Fm7uaccR" data-testid="http-method">post</span></div>
      </td>

      <td style={{ textAlign: "left" }}>
        `https://apisandbox.cieloecommerce.cielo.com.br/1/sales`
      </td>
    </tr>

    <tr>
      <td style={{ textAlign: "left" }}>
        Produção
      </td>

      <td style={{ textAlign: "left" }}>
        <div class="headline-container-article-info2GaOf2jMpV0r"><span class="rm-APIMethod APIMethod APIMethod_fixedWidth APIMethod_post headline-container-api-method1Hc-Fm7uaccR" data-testid="http-method">post</span></div>
      </td>

      <td style={{ textAlign: "left" }}>
        `https://api.cieloecommerce.cielo.com.br/1/sales`
      </td>
    </tr>
  </tbody>
</Table>

## Requisição

```json
{  
   "MerchantOrderId":"2014111701",
   "Customer":{  
      "Name":"Aline de Souza",
      "Email":"alinedesouza@email.com",
      "Birthdate":"1990-01-01"
   },
   "Payment":{  
     "Type":"CreditCard",
     "Amount":15700,
     "Currency":"BRL",
     "Country":"BRA",
     "Installments":1,
     "Capture":true,
     "SoftDescriptor":"123456789ABCD",
     "CreditCard":{  
         "CardNumber":"4091688625337641",
         "Holder":"Teste Holder",
         "ExpirationDate":"12/2035",
         "SecurityCode":"333",
         "SaveCard":"false",
         "Brand":"Visa",
         "CardOnFile":{
            "Usage": "First"
         }
     }
   }
}
```

<br />

<Table>
  <thead>
    <tr>
      <th>
        PROPRIEDADE
      </th>

      <th>
        TIPO
      </th>

      <th>
        TAMANHO
      </th>

      <th>
        OBRIGATÓRIO
      </th>

      <th>
        DESCRIÇÃO
      </th>
    </tr>
  </thead>

  <tbody>
    <tr>
      <td>
        `MerchantOrderId`
      </td>

      <td>
        Texto
      </td>

      <td>
        50
      </td>

      <td>
        Sim
      </td>

      <td>
        Número de identificação do pedido. *Atenção: Os caracteres permitidos são apenas a-z, A-Z, 0-9. Não são permitidos caracteres especiais e espaços em branco.*
      </td>
    </tr>

    <tr>
      <td>
        `Customer.Name`
      </td>

      <td>
        Texto
      </td>

      <td>
        255
      </td>

      <td>
        Não
      </td>

      <td>
        Nome do comprador. *Atenção: Os caracteres permitidos são apenas a-z, A-Z. Não são permitidos caracteres especiais e números.*
      </td>
    </tr>

    <tr>
      <td>
        `Customer.Email`
      </td>

      <td>
        Texto
      </td>

      <td>
        255
      </td>

      <td>
        Não
      </td>

      <td>
        E-mail do comprador.
      </td>
    </tr>

    <tr>
      <td>
        `Customer.Birthdate`
      </td>

      <td>
        Date
      </td>

      <td>
        10
      </td>

      <td>
        Não
      </td>

      <td>
        Data de nascimento do comprador (AAAA/MM/DD).
      </td>
    </tr>

    <tr>
      <td>
        `Payment.Type`
      </td>

      <td>
        Texto
      </td>

      <td>
        100
      </td>

      <td>
        Sim
      </td>

      <td>
        Tipo do meio de pagamento.
      </td>
    </tr>

    <tr>
      <td>
        `Payment.Amount`
      </td>

      <td>
        Número
      </td>

      <td>
        15
      </td>

      <td>
        Sim
      </td>

      <td>
        Valor do pedido (ser enviado em centavos).
      </td>
    </tr>

    <tr>
      <td>
        `Payment.Currency`
      </td>

      <td>
        Texto
      </td>

      <td>
        3
      </td>

      <td>
        Não
      </td>

      <td>
        Moeda na qual o pagamento será feito (BRL).
      </td>
    </tr>

    <tr>
      <td>
        `Payment.Country`
      </td>

      <td>
        Texto
      </td>

      <td>
        3
      </td>

      <td>
        Não
      </td>

      <td>
        País na qual o pagamento será feito.
      </td>
    </tr>

    <tr>
      <td>
        `Payment.SoftDescriptor`
      </td>

      <td>
        Texto
      </td>

      <td>
        13
      </td>

      <td>
        Não
      </td>

      <td>
        O complemento do nome da loja que aparecerá na fatura do cartão. Não permite caracteres especiais.
      </td>
    </tr>

    <tr>
      <td>
        `Payment.Installments`
      </td>

      <td>
        Número
      </td>

      <td>
        2
      </td>

      <td>
        Sim
      </td>

      <td>
        Número de parcelas. Se a transação for uma recorrência, o número de parcelas será 1. Para transações parceladas, o número de parcelas será sempre maior que 1.
      </td>
    </tr>

    <tr>
      <td>
        `Payment.Capture`
      </td>

      <td>
        Booleano
      </td>

      <td>
        —
      </td>

      <td>
        Não (Default false)
      </td>

      <td>
        Booleano que identifica que a autorização deve ser com captura automática (“true”) ou captura posterior (“false”).
      </td>
    </tr>

    <tr>
      <td>
        `CreditCard.CardNumber`
      </td>

      <td>
        Texto
      </td>

      <td>
        19
      </td>

      <td>
        Sim
      </td>

      <td>
        Número do cartão do comprador.
      </td>
    </tr>

    <tr>
      <td>
        `CreditCard.Holder`
      </td>

      <td>
        Texto
      </td>

      <td>
        25
      </td>

      <td>
        Sim
      </td>

      <td>
        Nome do comprador impresso no cartão. Não aceita caracteres especiais ou acentuação.
      </td>
    </tr>

    <tr>
      <td>
        `CreditCard.ExpirationDate`
      </td>

      <td>
        Texto
      </td>

      <td>
        7
      </td>

      <td>
        Sim
      </td>

      <td>
        Data de validade impressa no cartão. Ex. MM/AAAA.
      </td>
    </tr>

    <tr>
      <td>
        `CreditCard.SecurityCode`
      </td>

      <td>
        Texto
      </td>

      <td>
        4
      </td>

      <td>
        Não
      </td>

      <td>
        Código de segurança impresso no verso do cartão.
      </td>
    </tr>

    <tr>
      <td>
        `CreditCard.SaveCard`
      </td>

      <td>
        Booleano
      </td>

      <td>
        —
      </td>

      <td>
        Não (Default false)
      </td>

      <td>
        Booleano que identifica se o cartão será salvo para gerar o `CardToken`. Saiba mais sobre <a href="https://docs.cielo.com.br/ecommerce-cielo/docs/tokenizando-cartoes" target="_blank">Tokenização</a>
      </td>
    </tr>

    <tr>
      <td>
        `CreditCard.Brand`
      </td>

      <td>
        Texto
      </td>

      <td>
        10
      </td>

      <td>
        Sim
      </td>

      <td>
        Bandeira do cartão. Valores possíveis: Visa / Master / Amex / Elo / Aura / JCB / Diners / Discover.
      </td>
    </tr>

    <tr>
      <td>
        `CreditCard.CardOnFile.Usage`
      </td>

      <td>
        Texto
      </td>

      <td>
        *
      </td>

      <td>
        Não
      </td>

      <td>
        "First" se o cartão foi armazenado e é seu primeiro uso.\
        "Used" se o cartão foi armazenado e ele já foi utilizado anteriormente em outra transação
      </td>
    </tr>
  </tbody>
</Table>

<br />

## Resposta

```json
{
    "MerchantOrderId": "2014111701",
    "Customer":{  
      "Name":"Aline de Souza",
      "Email":"alinedesouza@email.com",
      "Birthdate":"1990-01-01"
   },
    "Payment": {
        "ServiceTaxAmount": 0,
        "Installments": 1,
        "Interest": 0,
        "Capture": true,
        "CreditCard": {
            "CardNumber": "4091688625337641",
            "Holder": "Teste Holder",
            "ExpirationDate": "12/2035",
            "SaveCard": false,
            "Brand": "Visa",
            "CardOnFile": {
                "Usage": "First"               
            },
            "PaymentAccountReference": "JZHOZJHNZH87KQXM3G60B9I21GVZN"
        },
        "Tid": "0928084922246",
        "ProofOfSale": "652515",
        "AuthorizationCode": "927181",
        "SoftDescriptor": "123456789ABCD",
        "Provider": "Simulado",
        "IsQrCode": false,
        "DynamicCurrencyConversion": false,
        "Amount": 15700,
        "ReceivedDate": "2022-09-28 08:49:22",
        "CapturedAmount": 15700,
        "CapturedDate": "2022-09-28 08:49:22",
        "Status": 2,
        "IsSplitted": false,
        "ReturnMessage": "Operation Successful",
        "ReturnCode": "6",
        "PaymentId": "91bad53a-9198-4738-a280-f51dddc34988",
        "Type": "CreditCard",
        "Currency": "BRL",
        "Country": "BRA",
        "Links": [
            {
                "Method": "GET",
                "Rel": "self",
                "Href": "https://apiquerysandbox.cieloecommerce.cielo.com.br/1/sales/91bad53a-9198-4738-a280-f51dddc34988"
            },
            {
                "Method": "PUT",
                "Rel": "void",
                "Href": "https://apisandbox.cieloecommerce.cielo.com.br/1/sales/91bad53a-9198-4738-a280-f51dddc34988/void"
            }
        ]
    }
}
```

<Table>
  <thead>
    <tr>
      <th>
        PROPRIEDADE
      </th>

      <th>
        DESCRIÇÃO
      </th>

      <th>
        TIPO
      </th>

      <th>
        TAMANHO
      </th>

      <th>
        FORMATO
      </th>
    </tr>
  </thead>

  <tbody>
    <tr>
      <td>
        `ProofOfSale`
      </td>

      <td>
        Número da autorização, identico ao NSU.
      </td>

      <td>
        Texto
      </td>

      <td>
        6
      </td>

      <td>
        Texto alfanumérico
      </td>
    </tr>

    <tr>
      <td>
        `Tid`
      </td>

      <td>
        Id da transação na adquirente.
      </td>

      <td>
        Texto
      </td>

      <td>
        20
      </td>

      <td>
        Texto alfanumérico
      </td>
    </tr>

    <tr>
      <td>
        `AuthorizationCode`
      </td>

      <td>
        Código de autorização.
      </td>

      <td>
        Texto
      </td>

      <td>
        6
      </td>

      <td>
        Texto alfanumérico
      </td>
    </tr>

    <tr>
      <td>
        `SoftDescriptor`
      </td>

      <td>
        Texto impresso na fatura bancária do portador. Não permite caracteres especiais.
      </td>

      <td>
        Texto
      </td>

      <td>
        13
      </td>

      <td>
        Texto alfanumérico
      </td>
    </tr>

    <tr>
      <td>
        `PaymentId`
      </td>

      <td>
        Número de identificação do pagamento, necessário para futuras operações como Consulta, Captura e Cancelamento.
      </td>

      <td>
        Guid
      </td>

      <td>
        36
      </td>

      <td>
        xxxxxxxx-xxxx-xxxx-xxxx-xxxxxxxxxxxx
      </td>
    </tr>

    <tr>
      <td>
        `ECI`
      </td>

      <td>
        Eletronic Commerce Indicator. Representa o quão segura é uma transação.
      </td>

      <td>
        Texto
      </td>

      <td>
        2
      </td>

      <td>
        Exemplo: 7
      </td>
    </tr>

    <tr>
      <td>
        `Status`
      </td>

      <td>
        Status da Transação.
      </td>

      <td>
        Byte
      </td>

      <td>
        —
      </td>

      <td>
        2
      </td>
    </tr>

    <tr>
      <td>
        `ReturnCode`
      </td>

      <td>
        Código de retorno da Adquirência.
      </td>

      <td>
        Texto
      </td>

      <td>
        32
      </td>

      <td>
        Texto alfanumérico
      </td>
    </tr>

    <tr>
      <td>
        `ReturnMessage`
      </td>

      <td>
        Mensagem de retorno da Adquirência.
      </td>

      <td>
        Texto
      </td>

      <td>
        512
      </td>

      <td>
        Texto alfanumérico
      </td>
    </tr>

    <tr>
      <td>
        `Payment.MerchantAdviceCode`
      </td>

      <td>
        Código de retorno da bandeira que define período para retentativa. Válido somente para bandeira Mastercard. Saiba mais em <a href="https://docs.cielo.com.br/ecommerce-cielo/reference/retentativa-bandeira" target="_blank">Programa de Retentativa das Bandeiras Mastercard</a>
      </td>

      <td>
        Texto
      </td>

      <td>
        2
      </td>

      <td>
        Numérico
      </td>
    </tr>

    <tr>
      <td>
        `CreditCard.PaymentAccountReference`
      </td>

      <td>
        O PAR (Payment Account Reference) é o número que associa diferentes tokens a um mesmo cartão. Será retornado pelas bandeiras Master e Visa e repassado para os clientes do e-commerce Cielo. Caso a bandeira não envie a informação o campo não será retornado.
      </td>

      <td>
        Alfanumérico
      </td>

      <td>
        29
      </td>

      <td>
        —
      </td>
    </tr>
  </tbody>
</Table>

> ℹ️
>
> Para a bandeira **Mastercard** é necessário enviar o nó `Payment.InitiatedTransactionIndicator` para indicar o <a href="https://docs.cielo.com.br/ecommerce-cielo/page/indicador-de-in%C3%ADcio-da-transa%C3%A7%C3%A3o-cit-e-mit" target="_blank">iniciador de transação</a>.