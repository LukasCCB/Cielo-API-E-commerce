---
updatedAt: 2025-11-27T20:00:21.000Z
agentTools:
  siteIndex: https://docs.cielo.com.br/llms.txt
  projectIndex: https://docs.cielo.com.br/ecommerce-cielo/llms.txt
---

# Samsung Pay

**Pré-requisito**

É necessário que a loja já possua cadastro e integração Samsung Pay, caso contrário não será possível a integração com a API.

> **Atenção**: A integração a seguir deve ser feita por lojas que enviam dados de cartão de forma criptografada. Se a sua loja envia a requisição de autorização de e-wallet com dados descriptografados, vá para <a href="https://docs.cielo.com.br/ecommerce-cielo/reference/e-wallet-descriptografado" target="_blank">Cartão descriptografado</a>.

<Callout icon="⚠️" theme="warn">
  Habilite a carteira virtual [Samsung Pay](https://docs.cielo.com.br/ecommerce-cielo/docs/habilitar-e-wallet#/) diretamente no site Cielo.
</Callout>

## Exemplo de integração

Exemplo de requisição padrão Samsung Pay:

POST/1/sales/

```json
{
  "MerchantOrderId": "6242-642-723",
  "Customer": {
    "Name": "Exemplo Wallet Padrão",
    "Identity": "11225468954",
    "IdentityType": "CPF"
  },
  "Payment": {
    "Type": "CreditCard",
    "Amount": 1,
    "Installments": 1,
    "Currency": "BRL",
    "Wallet": {
      "Type": "SamsungPay",
      "WalletKey": "IDENTIFICADOR DA LOJA NA WALLET"
    }
  }
}
```
```curl
curl
--request POST "https://apisandbox.cieloecommerce.cielo.com.br/1/sales/"
--header "Content-Type: application/json"
--header "MerchantId: xxxxxxxx-xxxx-xxxx-xxxx-xxxxxxxxxxxx"
--header "MerchantKey: 0123456789012345678901234567890123456789"
--header "RequestId: xxxxxxxx-xxxx-xxxx-xxxx-xxxxxxxxxxxx"
--data-binary
{
   "MerchantOrderId":"6242-642-723",
   "Customer":{
      "Name":"Exemplo Wallet Padrão",
      "Identity":"11225468954",
      "IdentityType":"CPF"
   },
   "Payment":{
      "Type":"CreditCard",
      "Amount":1,
      "Installments":1,
      "Currency":"BRL",
      "Wallet":{
         "Type":"SamsungPay",
         "WalletKey":"IDENTIFICADOR DA LOJA NA WALLET"
      }
   }
}
```

| Propriedade            | Descrição                                                                                                                                                                                                                               | Tipo   | Tamanho | Obrigatório?            |
| :--------------------- | :-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- | :----- | :------ | :---------------------- |
| `MerchantId`           | Identificador da loja na Cielo.                                                                                                                                                                                                         | GUID   | 36      | Sim (envio no *header*) |
| `MerchantKey`          | Chave pública para autenticação dupla na Cielo.                                                                                                                                                                                         | Texto  | 40      | Sim (envio no *header*) |
| `RequestId`            | Identificador do request, utilizado quando o lojista usa diferentes servidores para cada GET/POST/PUT.                                                                                                                                  | GUID   | 36      | Não (envio no *header*) |
| `MerchantOrderId`      | Número de identificação do pedido.                                                                                                                                                                                                      | Texto  | 50      | Sim                     |
| `Customer.Name`        | Nome do comprador.                                                                                                                                                                                                                      | Texto  | 255     | Não                     |
| `Customer.Status`      | Status de cadastro do comprador na loja ("NEW" / "EXISTING").                                                                                                                                                                           | Texto  | 255     | Não                     |
| `Payment.Type`         | Tipo do meio de pagamento.                                                                                                                                                                                                              | Texto  | 100     | Sim                     |
| `Payment.Amount`       | Valor do pedido, em centavos.                                                                                                                                                                                                           | Número | 15      | Sim                     |
| `Payment.Installments` | Número de parcelas.                                                                                                                                                                                                                     | Número | 2       | Sim                     |
| `Wallet.Type`          | Tipo de carteira: "ApplePay" / "SamsungPay" / "GooglePay".                                                                                                                                                                              | Texto  | 255     | Sim                     |
| `Wallet.WalletKey`     | Chave criptográfica que representa os dados do cartão. Consultar a tabela <a href="https://docs.cielo.com.br/ecommerce-cielo/reference/e-wallet-descriptografado#tabela-walletkey" target="_blank">WalletKey</a> para mais informações. | Texto  | 255     | Sim                     |

### Exemplo de resposta

```json
{
  "MerchantOrderId": "2014111703",
  "Customer": {
    "Name": "[Guest]"
  },
  "Payment": {
    "ServiceTaxAmount": 0,
    "Installments": 1,
    "Interest": 0,
    "Capture": false,
    "Authenticate": false,
    "Recurrent": false,
    "CreditCard": {
      "CardNumber": "453211******1521",
      "Holder": "BJORN IRONSIDE",
      "ExpirationDate": "08/2020",
      "SaveCard": false,
      "Brand": "Visa"
    },
    "Tid": "0319040817883",
    "ProofOfSale": "817883",
    "AuthorizationCode": "027795",
    "Wallet": {
      "Type": "SamsungPay",
      "WalletKey": "IDENTIFICADOR DA LOJA NA WALLET",
      "Eci": 0
    },
    "SoftDescriptor": "123456789ABCD",
    "Amount": 100,
    "ReceivedDate": "2018-03-19 16:08:16",
    "Status": 1,
    "IsSplitted": false,
    "ReturnMessage": "Operation Successful",
    "ReturnCode": "4",
    "PaymentId": "e57b09eb-475b-44b6-ac71-01b9b82f2491",
    "Type": "CreditCard",
    "Currency": "BRL",
    "Country": "BRA",
    "Links": [
      {
        "Method": "GET",
        "Rel": "self",
        "Href": "https://apiquerysandbox.cieloecommerce.cielo.com.br/1/sales/{PaymentId}"
      },
      {
        "Method": "PUT",
        "Rel": "capture",
        "Href": "https://apisandbox.cieloecommerce.cielo.com.br/1/sales/{paymentId}/capture"
      },
      {
        "Method": "PUT",
        "Rel": "void",
        "Href": "https://apisandbox.cieloecommerce.cielo.com.br/1/sales/{PaymentId}/void"
      }
    ]
  }
}
```
```curl
--header "Content-Type: application/json"
--header "RequestId: xxxxxxxx-xxxx-xxxx-xxxx-xxxxxxxxxxxx"
--data-binary
{
    "MerchantOrderId": "2014111703",
    "Customer": {
        "Name": "[Guest]"
    },
    "Payment": {
        "ServiceTaxAmount": 0,
        "Installments": 1,
        "Interest": 0,
        "Capture": false,
        "Authenticate": false,
        "Recurrent": false,
        "CreditCard": {
            "CardNumber": "453211******1521",
            "Holder": "BJORN IRONSIDE",
            "ExpirationDate": "08/2020",
            "SaveCard": false,
            "Brand": "Visa"
        },
        "Tid": "0319040817883",
        "ProofOfSale": "817883",
        "AuthorizationCode": "027795",
        "Wallet": {
            "Type": "SamsungPay",
            "WalletKey": "IDENTIFICADOR DA LOJA NA WALLET",
            "Eci": 0
        },
        "SoftDescriptor": "123456789ABCD",
        "Amount": 100,
        "ReceivedDate": "2018-03-19 16:08:16",
        "Status": 1,
        "IsSplitted": false,
        "ReturnMessage": "Operation Successful",
        "ReturnCode": "4",
        "PaymentId": "e57b09eb-475b-44b6-ac71-01b9b82f2491",
        "Type": "CreditCard",
        "Currency": "BRL",
        "Country": "BRA",
        "Links": [
            {
                "Method": "GET",
                "Rel": "self",
                "Href": "https://apiquerysandbox.cieloecommerce.cielo.com.br/1/sales/{PaymentId}"
            },
            {
                "Method": "PUT",
                "Rel": "capture",
                "Href": "https://apisandbox.cieloecommerce.cielo.com.br/1/sales/{paymentId}/capture"
            },
            {
                "Method": "PUT",
                "Rel": "void",
                "Href": "https://apisandbox.cieloecommerce.cielo.com.br/1/sales/{PaymentId}/void"
            }
        ]
    }
}
```

<Table align={["left","left","left","left","left"]}>
  <thead>
    <tr>
      <th>
        Propriedade
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
        Formato
      </th>
    </tr>
  </thead>

  <tbody>
    <tr>
      <td>
        `ProofOfSale`
      </td>

      <td>
        Número da autorização, idêntico ao NSU.
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
        Identificador da transação na adquirente.
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
        Texto que será impresso na fatura bancária do portador. Obs.: Não permite caracteres especiais. Disponível apenas para VISA/MASTER.
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
        Campo identificador do pedido.
      </td>

      <td>
        GUID
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
        * Electronic Commerce Indicator_. Representa o quão segura é uma transação.
      </td>

      <td>
        Texto
      </td>

      <td>
        2
      </td>

      <td>
        Ex.: 7
      </td>
    </tr>

    <tr>
      <td>
        `Status`
      </td>

      <td>
        Status da transação.
      </td>

      <td>
        Byte
      </td>

      <td>
        2
      </td>

      <td>
        Ex.: 1
      </td>
    </tr>

    <tr>
      <td>
        `ReturnCode`
      </td>

      <td>
        Código de retorno da adquirência.
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
        Mensagem de retorno da adquirência.
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
        `Type`
      </td>

      <td>
        Tipo de carteira: "ApplePay" / "SamsungPay" / "GooglePay".
      </td>

      <td>
        Texto
      </td>

      <td>
        255
      </td>

      <td>
        Texto alfanumérico
      </td>
    </tr>

    <tr>
      <td>
        `WalletKey`
      </td>

      <td>
        Chave criptográfica que representa os dados do cartão. Consulte a tabela <a href="https://docs.cielo.com.br/ecommerce-cielo/reference/e-wallet-descriptografado#tabela-walletkey" target="_blank">WalletKey</a> para mais informações.
      </td>

      <td>
        Texto
      </td>

      <td>
        255
      </td>

      <td>
        Consulte a tabela <a href="https://docs.cielo.com.br/ecommerce-cielo/reference/e-wallet-descriptografado#tabela-walletkey" target="_blank">WalletKey</a>
      </td>
    </tr>
  </tbody>
</Table>