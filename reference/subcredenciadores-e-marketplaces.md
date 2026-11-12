---
updatedAt: 2026-11-09T17:54:59.000Z
agentTools:
  siteIndex: https://docs.cielo.com.br/llms.txt
  projectIndex: https://docs.cielo.com.br/ecommerce-cielo/llms.txt
---

# Subcredenciadores e marketplaces

<Callout icon="❗" theme="error">
  ### Novos campos obrigatórios para subcredenciadores e marketplaces

  A partir de **11 de abril de 2025**, todas as transações de subcredenciadores e marketplaces deverão informar os seguintes dados:

  - **Razão social do sub-comerciante**, no parâmetro `Payment.PaymentFacilitator.SubEstablishment.CompanyName` (máximo de 40 caracteres, não é permitido enviar caractere especial)
  - **CNPJ/CPF do sub-comerciante**, no parâmetro `Payment.PaymentFacilitator.SubEstablishment.Identity` (campo já existente).
  - **URL do sub-comerciante**, no parâmetro `Payment.PaymentFacilitator.SubEstablishment.EstablishmentUrl`.

  O Banco Central do Brasil (BCB) definiu uma regra obrigatória para os arranjos de meios de pagamentos, visando reforçar medidas preventivas à lavagem de dinheiro no Brasil, conforme disposto na Circular BCB nº 3.978/2020. Com essa nova regra, a Cielo passará a compartilhar os dados de razão social e CNPJ/CPF do sub-comerciante com as áreas de PLD das instituições envolvidas no processo transacional de compra (bancos emissores, bandeiras, credenciadores e BCB). Esses dados serão compartilhados única e exclusivamente com a finalidade de prevenção à lavagem de dinheiro.

  Veja a seguir como um exemplo do nó `PaymentFacilitator` com todos os campos que devem ser enviados a partir de 11 de abril de 2025:

  ```json
  {
      "PaymentFacilitator": {
          "EstablishmentCode": "1234",
          "SubEstablishment": {
              "EstablishmentCode": "1234",
              "Identity": "11111111000100",
              "Mcc": "1234",
              "Address": "Alameda Xingu, 512",
              "City": "Barueri",
              "State": "SP",
              "CountryCode": "076",
              "PostalCode": "06455914",
              "PhoneNumber": "11987654321",
              "CompanyName": "Subseller",
              "EstablishmentUrl": "URLdosubcomerciante.com.br"

          }
      }
  }
  ```

  Veja a seguir o exemplo da [requisição completa para facilitadores](https://docs.cielo.com.br/ecommerce-cielo/reference/facilitadores-de-pagamento#requisi%C3%A7%C3%A3o).
</Callout>

> ℹ️ CNPJs alfanuméricos serão implementados pela Receita Federal em julho de 2026
>
> Essa mudança afeta apenas novas inscrições, **não havendo mudanças em CNPJs existentes**.
>
> O CNPJ alfanumérico **já está sendo suportado pela Cielo**, sem mudanças na sua integração.
>
> Recomendamos verificar a necessidade de possíveis ajustes nos sistemas próprios de checkout de sua loja.

***

Todos os clientes de e-commerce que são **Facilitadores de Pagamento**, por **obrigatoriedade das bandeiras e do Banco Central** devem enviar campos específicos na **mensageria transacional**. A Cielo transmitirá as informações para as bandeiras por meio da mensageria transacional no momento da autorização.

Os campos específicos estão contidos dentro do nó `PaymentFacilitator`. Além dos campos deste nó, os facilitadores também precisam enviar obrigatoriamente o campo `SoftDescriptor` do nó `Payment`. Veja a seguir o exemplo do envio e da resposta.

<Callout icon="⚠️" theme="warn">
  ### Atenção

  - As bandeiras, ao identificarem inconformidade devido ao não envio dos dados obrigatórios na mensageria transacional, aplicarão multas à Cielo as quais serão repassadas ao Facilitador responsável pelo envio dos dados transacionais;
  - A bandeira **Visa**, desde 15 de abril de 2023, atualizou as regras para marketplace e todos os merchants que atuam como Facilitadores de Pagamentos e que tenham clientes que operam como Marketplace Estrangeiro precisam, obrigatoriamente, **enviar o indicador de varejo estrangeiro para evitar multa pela bandeira**. O parâmetro específico é o `Payment.PaymentFacilitator.SubEstablishment.CountryCode`, que indica o código do país.
</Callout>

<br />

<Callout icon="❗️" theme="error">
  ### Identificação de transações oriundas de link de pagamento para cartões da bandeira Elo

  A partir de 17 de outubro de 2025 será obrigatório identificar transações oriundas de link de pagamento para cartões da bandeira Elo. Envie o parâmetro `Payment.SolutionType` = "ExternalLinkPay".
</Callout>

<br />

### Requisição

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

```json
{
  "MerchantOrderId": "2222222222",
  "Customer": {
    "Name": "Comprador Teste",
    "Identity": "11225468954",
    "IdentityType": "CPF",
    "Email": "compradorteste@teste.com",
    "Birthdate": "1991-01-02",
    "Address": {
      "Street": "Rua Teste",
      "Number": "123",
      "Complement": "AP 123",
      "ZipCode": "12345987",
      "City": "Rio de Janeiro",
      "State": "RJ",
      "Country": "BRA"
    },
    "DeliveryAddress": {
      "Street": "Rua Teste",
      "Number": "123",
      "Complement": "AP 123",
      "ZipCode": "12345987",
      "City": "Rio de Janeiro",
      "State": "RJ",
      "Country": "BRA"
    }
  },
  "Payment": {
    "Type": "CreditCard",
    "Amount": 157000,
    "Currency": "BRL",
    "Country": "BRA",
    "Provider": "Cielo",
    "ServiceTaxAmount": 0,
    "Installments": 1,
    "Interest": "ByMerchant",
    "Capture": false,
    "Authenticate": false,
    "Recurrent": false,
    "SoftDescriptor": "123456789ABCD",
    "SolutionType": "ExternalLinkPay",
    "CreditCard": {
      "CardNumber": "4024007197692931",
      "Holder": "Teste Holder",
      "ExpirationDate": "12/2021",
      "SecurityCode": "123",
      "SaveCard": "false",
      "Brand": "Visa"
    },
    "PaymentFacilitator": {
      "EstablishmentCode": "1234",
      "SubEstablishment": {
        "EstablishmentCode": "1234",
        "Identity": "11111111000100",
        "Mcc": "1234",
        "Address": "Alameda Grajau, 512",
        "City": "Barueri",
        "State": "SP",
        "CountryCode": "076",
        "PostalCode": "06455914",
        "PhoneNumber": "1155855585",
        "CompanyName": "Subseller",
        "EstablishmentUrl": "URLdosubcomerciante.com.br"
      }
    }
  }
}
```
```json Apple Pay + Facilitador
{
  "MerchantOrderId": "2222222222",
  "Customer": {
    "Name": "Comprador Teste",
    "Identity": "11225468954",
    "IdentityType": "CPF",
    "Email": "compradorteste@teste.com"
  },
  "Payment": {
    "Provider": "Cielo",
    "Type": "CreditCard",
    "Amount": 157000,
    "Currency": "BRL",
    "Country": "BRA",
    "Installments": 1,
    "Capture": false,
    "SoftDescriptor": "123456789ABCD",
    "Wallet": {
      "Type": "ApplePay",
      "WalletKey": "9zcCAciwoTS+qBx8jWb++64eHT2QZTWBs6qMVJ0GO+AqpcDVkxGPNpOR/D1bv5AZ62+5lKvucati0+eu7hdilwUYT3n5swkHuIzX2KO80Apx/SkhoVM5dqgyKrak5VD2/drcGh9xqEanWkyd7wl200sYj4QUMbeLhyaY7bCdnnpKDJgpOY6J883fX3TiHoZorb/QlEEOpvYcbcFYs3ELZ7QVtjxyrO2LmPsIkz2BgNm5f+JaJUSAOectahgLZnZR+easdhghrsa/E9A6DwjMd0fDYnxjj0bQDfaZpBPeGGPFLu5YYn1IDc",
      "AdditionalData": {
        "EphemeralPublicKey": "MFkwEwYHKoZIzj0CAQYIKoZIzj0DAQcDQgAEoedz1NqI6hs9hEO6dBsnn0X0xp5/DKj3gXirjEqxNIJ8JyhGxVB3ITd0E+6uG4W6Evt+kugG8gOhCBrdUU6JwQ=="
      }
    },
    "PaymentFacilitator": {
      "EstablishmentCode": "1234",
      "SubEstablishment": {
        "EstablishmentCode": "1234",
        "Identity": "11111111000100",
        "Mcc": "1234",
        "Address": "Alameda Grajau, 512",
        "City": "Barueri",
        "State": "SP",
        "CountryCode": "076",
        "PostalCode": "06455914",
        "PhoneNumber": "1155855585",
        "CompanyName": "Subseller",
        "EstablishmentUrl": "URLdosubcomerciante.com.br"
      }
    }
  }
}
```
```json Google Pay + Facilitador
{
  "MerchantOrderId": "2222222222",
  "Customer": {
    "Name": "Comprador Teste",
    "Identity": "11225468954",
    "IdentityType": "CPF",
    "Email": "compradorteste@teste.com"
  },
  "Payment": {
    "Provider": "Cielo",
    "Type": "CreditCard",
    "Amount": 157000,
    "Currency": "BRL",
    "Country": "BRA",
    "Installments": 1,
    "Capture": false,
    "SoftDescriptor": "123456789ABCD",
    "Wallet": {
      "Type": "AndroidPay",
      "WalletKey": {
        "encryptedMessage": "0mXBb94Cy9JZhMuwtrBhMjXb8pDslrNsN5KhcEqnowOINqJgjXHD36KcCuzpQQ4cDAe64ZLmk2N3UBGXsN9hMMyeMakXlidVmteE+QMaNZIor048oJqlUIFPD54B/ic8zCdqq3xnefUmyKQe0I03x57TcEA9xAT/E4x3rYfyqLFUAEtu2lT0GwTdwgrsT8pKoTldHIgP+wVNTjrKvJrB4xM/Bhn6JfcSmOzFyI6w37mBU71/TK761nYOSxt7z1bNWSLZ4b8xBu1dlRgen2BSlqdafuQjV3UZjr6ubSvaJ8NiCh5FD/X013kAwLuLALMS2uAFS9j8cZ6R6zNIi13fK6Fe4ACbFTHwLzSNZjQiaRDb6MlMnY8/amncPIOXzpirb5ScIz8EZUL05xd+3YWVTVfpqgFo1eaaS+wZdUyRG0QEgOsr6eLBoH8d5lfV9Rx6XdioorUuT7s1Yqc0OJZO+fhBt6X0izE9hBGTexdZyg\\u003d\\u003d",
        "ephemeralPublicKey": "BMdwrkJeEgCOtLevYsN3MbdP8xbOItXiTejoB6vXy0Kn0ZM10jy4Aasd6jTSxtoxoTpFydLhj5kzoOhbw2OzZu0\\u003d",
        "tag": "yAQIjWZ0VuCC7SWyYwc4eXOzpSUKhZduF9ip0Ji+Gj8\\u003d"
      },
      "AdditionalData": {
        "Signature": "MEUCIQCGQLOmwxe5eFMSuTcr4EcwSZu35fB0KlCWcVop6ZxxhgIgbdtNHThSlynOopfxMIxkDs0cLh2NFh5es+J5uDmaViA="
      }
    },
    "PaymentFacilitator": {
      "EstablishmentCode": "1234",
      "SubEstablishment": {
        "EstablishmentCode": "1234",
        "Identity": "11111111000100",
        "Mcc": "1234",
        "Address": "Alameda Grajau, 512",
        "City": "Barueri",
        "State": "SP",
        "CountryCode": "076",
        "PostalCode": "06455914",
        "PhoneNumber": "1155855585",
        "CompanyName": "Subseller",
        "EstablishmentUrl": "URLdosubcomerciante.com.br"
      }
    }
  }
}
```

Para pagamentos com **Apple Pay** ou **Google Pay**, envie o nó `Payment.Wallet` no lugar de `Payment.CreditCard` e mantenha os campos obrigatórios de Facilitador, incluindo `Payment.SoftDescriptor`.

| **Propriedade**                                                 | **Tipo**     | **Tamanho** | **Obrigatório**                                                                    | **Descrição**                                                                                                                                                                                                                                                                                                                                                                               |
| :-------------------------------------------------------------- | :----------- | :---------- | :--------------------------------------------------------------------------------- | :------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------ |
| `Payment.PaymentFacilitator.EstablishmentCode`                  | alfanumérico | 15          | Obrigatório para facilitadores                                                     | Código do estabelecimento do Facilitador. "Facilitator ID” (Cadastro do facilitador com as bandeiras). O código é diferente por bandeira, podendo variar inclusive o tamanho do campo:<br />Bandeira Mastercard – 06 dígitos<br />Bandeira Visa – 08 dígitos<br />Bandeira ELO – de 04 à 05 dígitos<br />Para demais bandeiras, como Amex e JCB, o campo pode ser preenchido com “0” zeros. |
| `Payment.PaymentFacilitator.SubEstablishment.EstablishmentCode` | texto        | 15          | Obrigatório para facilitadores                                                     | Código do estabelecimento do sub Merchant. “Sub-Merchant ID” (Cadastro do subcredenciado com o facilitador).                                                                                                                                                                                                                                                                                |
| `Payment.PaymentFacilitator.SubEstablishment.Identity`          | texto        | 14          | Obrigatório para facilitadores                                                     | CNPJ ou CPF do sub-merchant. **Obrigatório a partir de 11 de abril de 2025.**<br />**Permite envio de CNPJs alfanuméricos.**                                                                                                                                                                                                                                                                |
| `Payment.PaymentFacilitator.SubEstablishment.CompanyName`       | texto        | 40          | Obrigatório para facilitadores                                                     | Razão social do sub-merchant. **Obrigatório a partir de 11 de abril de 2025.**                                                                                                                                                                                                                                                                                                              |
| `Payment.PaymentFacilitator.SubEstablishment.EstablishmentUrl`  | string       | 150         | Obrigatório para facilitadores                                                     | URL do sub-comerciante.                                                                                                                                                                                                                                                                                                                                                                     |
| `Payment.PaymentFacilitator.SubEstablishment.Mcc`               | texto        | 4           | Obrigatório para facilitadores                                                     | MCC do sub Merchant.                                                                                                                                                                                                                                                                                                                                                                        |
| `Payment.PaymentFacilitator.SubEstablishment.Address`           | texto        | 22          | Obrigatório para facilitadores                                                     | Endereço do sub Merchant.                                                                                                                                                                                                                                                                                                                                                                   |
| `Payment.PaymentFacilitator.SubEstablishment.City`              | texto        | 13          | Obrigatório para facilitadores                                                     | Cidade do sub Merchant.                                                                                                                                                                                                                                                                                                                                                                     |
| `Payment.PaymentFacilitator.SubEstablishment.State`             | texto        | 2           | Obrigatório para facilitadores                                                     | Estado do sub Merchant.                                                                                                                                                                                                                                                                                                                                                                     |
| `Payment.PaymentFacilitator.SubEstablishment.PostalCode`        | texto        | 9           | Obrigatório para facilitadores                                                     | Código postal do sub Merchant.                                                                                                                                                                                                                                                                                                                                                              |
| `Payment.PaymentFacilitator.SubEstablishment.CountryCode`       | texto        | 3           | Obrigatório para facilitadores                                                     | Código país do sub-merchant com base no ISO 3166.  Ex: código ISO 3166 do Brasil é o 076. <a href="https://www.iso.org/obp/ui/#search" target="_blank">Lista completa online</a>.                                                                                                                                                                                                           |
| `Payment.PaymentFacilitator.SubEstablishment.PhoneNumber`       | texto        | 13          | Obrigatório para facilitadores                                                     | Número de telefone do sub Merchant.                                                                                                                                                                                                                                                                                                                                                         |
| `Payment.Softdescriptor`                                        | texto        | 13          | Obrigatório para facilitadores                                                     | Texto impresso na fatura bancária do comprador. Deve ser preenchido de acordo com os dados do sub Merchant.                                                                                                                                                                                                                                                                                 |
| `Payment.SolutionType`                                          | texto        | 15          | Obrigatório para transação de cartão da bandeira Elo oriunda de link de pagamento. | Origem do pagamento. **Obrigatório para transação de cartão da bandeira Elo oriunda de link de pagamento**. <br />Enviar como *"ExternalLinkPay"*.                                                                                                                                                                                                                                          |

<Callout icon="❗️" theme="error">
  ### Não use acentos pois eles são considerados como dois caracteres
</Callout>

<Callout icon="⚠️" theme="warn">
  ### Atenção

  Os campos não devem ser enviados com espaçamento a esquerda. Sujeito a rejeição na liquidação das transações.
</Callout>

### Resposta

```json
{
  "MerchantOrderId": "2014111701",
  "Customer": {
    "Name": "Comprador Teste",
    "Identity": "11225468954",
    "IdentityType": "CPF",
    "Email": "compradorteste@teste.com",
    "Birthdate": "1991-01-02",
    "Address": {
      "Street": "Rua Teste",
      "Number": "123",
      "Complement": "AP 123",
      "ZipCode": "12345987",
      "City": "Rio de Janeiro",
      "State": "RJ",
      "Country": "BRA"
    },
    "DeliveryAddress": {
      "Street": "Rua Teste",
      "Number": "123",
      "Complement": "AP 123",
      "ZipCode": "12345987",
      "City": "Rio de Janeiro",
      "State": "RJ",
      "Country": "BRA"
    }
  },
  "Payment": {
    "ServiceTaxAmount": 0,
    "Installments": 1,
    "Interest": 0,
    "Capture": false,
    "Authenticate": false,
    "Recurrent": false,
    "CreditCard": {
      "CardNumber": "402400******2931",
      "Holder": "Teste Holder",
      "ExpirationDate": "12/2021",
      "SaveCard": false,
      "Brand": "Visa"
    },
    "Tid": "1223092935684",
    "ProofOfSale": "2935684",
    "AuthorizationCode": "065158",
    "SoftDescriptor": "123456789ABCD",
    "Provider": "Simulado",
    "IsQrCode": false,
    "PaymentFacilitator": {
      "EstablishmentCode": "1234",
      "SubEstablishment": {
        "EstablishmentCode": "1234",
        "Identity": "11111111000100",
        "Mcc": "1234",
        "Address": "Alameda Grajau, 512",
        "City": "Barueri",
        "State": "SP",
        "CountryCode": "076",
        "PostalCode": "06455914",
        "PhoneNumber": "1155855585",
        "CompanyName": "Subseller",
        "EstablishmentUrl": "URLofsubmerchant.com.br"
      }
    },
    "Amount": 157000,
    "ReceivedDate": "2019-12-23 09:29:34",
    "Status": 1,
    "IsSplitted": false,
    "ReturnMessage": "Operation Successful",
    "ReturnCode": "4",
    "PaymentId": "365c3a0d-fd86-480b-9279-4ba3da21333c",
    "Type": "CreditCard",
    "Currency": "BRL",
    "Country": "BRA",
    "Links": [
      {
        "Method": "GET",
        "Rel": "self",
        "Href": "https://apiquerysandbox.cieloecommerce.cielo.com.br/1/sales/365c3a0d-fd86-480b-9279-4ba3da21333c"
      },
      {
        "Method": "PUT",
        "Rel": "capture",
        "Href": "https://apisandbox.cieloecommerce.cielo.com.br/1/sales/365c3a0d-fd86-480b-9279-4ba3da21333c/capture"
      },
      {
        "Method": "PUT",
        "Rel": "void",
        "Href": "https://apisandbox.cieloecommerce.cielo.com.br/1/sales/365c3a0d-fd86-480b-9279-4ba3da21333c/void"
      }
    ]
  }
}
```
```json Apple Pay + Facilitador
{
  "MerchantOrderId": "2222222222",
  "Customer": {
    "Name": "Comprador Teste",
    "Identity": "11225468954",
    "IdentityType": "CPF",
    "Email": "compradorteste@teste.com"
  },
  "Payment": {
    "Installments": 1,
    "Capture": false,
    "CreditCard": {
      "CardNumber": "402400******2931",
      "ExpirationDate": "12/2035",
      "SaveCard": false,
      "Brand": "Visa"
    },
    "Tid": "1223092935684",
    "ProofOfSale": "2935684",
    "AuthorizationCode": "065158",
    "SoftDescriptor": "123456789ABCD",
    "Provider": "Cielo",
    "Wallet": {
      "Type": "ApplePay",
      "WalletKey": "9zcCAciwoTS+qBx8jWb++64eHT2QZTWBs6qMVJ0GO+AqpcDVkxGPNpOR/D1bv5AZ62+5lKvucati0+eu7hdilwUYT3n5swkHuIzX2KO80Apx/SkhoVM5dqgyKrak5VD2/drcGh9xqEanWkyd7wl200sYj4QUMbeLhyaY7bCdnnpKDJgpOY6J883fX3TiHoZorb/QlEEOpvYcbcFYs3ELZ7QVtjxyrO2LmPsIkz2BgNm5f+JaJUSAOectahgLZnZR+easdhghrsa/E9A6DwjMd0fDYnxjj0bQDfaZpBPeGGPFLu5YYn1IDc",
      "AdditionalData": {
        "EphemeralPublicKey": "MFkwEwYHKoZIzj0CAQYIKoZIzj0DAQcDQgAEoedz1NqI6hs9hEO6dBsnn0X0xp5/DKj3gXirjEqxNIJ8JyhGxVB3ITd0E+6uG4W6Evt+kugG8gOhCBrdUU6JwQ=="
      }
    },
    "PaymentFacilitator": {
      "EstablishmentCode": "1234",
      "SubEstablishment": {
        "EstablishmentCode": "1234",
        "Identity": "11111111000100",
        "Mcc": "1234",
        "Address": "Alameda Grajau, 512",
        "City": "Barueri",
        "State": "SP",
        "CountryCode": "076",
        "PostalCode": "06455914",
        "PhoneNumber": "1155855585",
        "CompanyName": "Subseller",
        "EstablishmentUrl": "URLdosubcomerciante.com.br"
      }
    },
    "Amount": 157000,
    "ReceivedDate": "2019-12-23 09:29:34",
    "Status": 1,
    "ReturnMessage": "Operation Successful",
    "ReturnCode": "4",
    "PaymentId": "365c3a0d-fd86-480b-9279-4ba3da21333c",
    "Type": "CreditCard",
    "Currency": "BRL",
    "Country": "BRA",
    "Links": [
      {
        "Method": "GET",
        "Rel": "self",
        "Href": "https://apiquerysandbox.cieloecommerce.cielo.com.br/1/sales/365c3a0d-fd86-480b-9279-4ba3da21333c"
      },
      {
        "Method": "PUT",
        "Rel": "capture",
        "Href": "https://apisandbox.cieloecommerce.cielo.com.br/1/sales/365c3a0d-fd86-480b-9279-4ba3da21333c/capture"
      },
      {
        "Method": "PUT",
        "Rel": "void",
        "Href": "https://apisandbox.cieloecommerce.cielo.com.br/1/sales/365c3a0d-fd86-480b-9279-4ba3da21333c/void"
      }
    ]
  }
}
```
```json Google Pay + Facilitador
{
  "MerchantOrderId": "2222222222",
  "Customer": {
    "Name": "Comprador Teste",
    "Identity": "11225468954",
    "IdentityType": "CPF",
    "Email": "compradorteste@teste.com"
  },
  "Payment": {
    "Installments": 1,
    "Capture": false,
    "CreditCard": {
      "CardNumber": "402400******2931",
      "ExpirationDate": "12/2035",
      "SaveCard": false,
      "Brand": "Visa"
    },
    "Tid": "1223092935684",
    "ProofOfSale": "2935684",
    "AuthorizationCode": "065158",
    "SoftDescriptor": "123456789ABCD",
    "Provider": "Cielo",
    "Wallet": {
      "Type": "AndroidPay",
      "WalletKey": {
        "encryptedMessage": "0mXBb94Cy9JZhMuwtrBhMjXb8pDslrNsN5KhcEqnowOINqJgjXHD36KcCuzpQQ4cDAe64ZLmk2N3UBGXsN9hMMyeMakXlidVmteE+QMaNZIor048oJqlUIFPD54B/ic8zCdqq3xnefUmyKQe0I03x57TcEA9xAT/E4x3rYfyqLFUAEtu2lT0GwTdwgrsT8pKoTldHIgP+wVNTjrKvJrB4xM/Bhn6JfcSmOzFyI6w37mBU71/TK761nYOSxt7z1bNWSLZ4b8xBu1dlRgen2BSlqdafuQjV3UZjr6ubSvaJ8NiCh5FD/X013kAwLuLALMS2uAFS9j8cZ6R6zNIi13fK6Fe4ACbFTHwLzSNZjQiaRDb6MlMnY8/amncPIOXzpirb5ScIz8EZUL05xd+3YWVTVfpqgFo1eaaS+wZdUyRG0QEgOsr6eLBoH8d5lfV9Rx6XdioorUuT7s1Yqc0OJZO+fhBt6X0izE9hBGTexdZyg\\u003d\\u003d",
        "ephemeralPublicKey": "BMdwrkJeEgCOtLevYsN3MbdP8xbOItXiTejoB6vXy0Kn0ZM10jy4Aasd6jTSxtoxoTpFydLhj5kzoOhbw2OzZu0\\u003d",
        "tag": "yAQIjWZ0VuCC7SWyYwc4eXOzpSUKhZduF9ip0Ji+Gj8\\u003d"
      },
      "AdditionalData": {
        "Signature": "MEUCIQCGQLOmwxe5eFMSuTcr4EcwSZu35fB0KlCWcVop6ZxxhgIgbdtNHThSlynOopfxMIxkDs0cLh2NFh5es+J5uDmaViA="
      }
    },
    "PaymentFacilitator": {
      "EstablishmentCode": "1234",
      "SubEstablishment": {
        "EstablishmentCode": "1234",
        "Identity": "11111111000100",
        "Mcc": "1234",
        "Address": "Alameda Grajau, 512",
        "City": "Barueri",
        "State": "SP",
        "CountryCode": "076",
        "PostalCode": "06455914",
        "PhoneNumber": "1155855585",
        "CompanyName": "Subseller",
        "EstablishmentUrl": "URLdosubcomerciante.com.br"
      }
    },
    "Amount": 157000,
    "ReceivedDate": "2019-12-23 09:29:34",
    "Status": 1,
    "ReturnMessage": "Operation Successful",
    "ReturnCode": "4",
    "PaymentId": "f728999d-2b9d-4e5b-8cb9-c29a8350f9de",
    "Type": "CreditCard",
    "Currency": "BRL",
    "Country": "BRA",
    "Links": [
      {
        "Method": "GET",
        "Rel": "self",
        "Href": "https://apiquerysandbox.cieloecommerce.cielo.com.br/1/sales/f728999d-2b9d-4e5b-8cb9-c29a8350f9de"
      },
      {
        "Method": "PUT",
        "Rel": "capture",
        "Href": "https://apisandbox.cieloecommerce.cielo.com.br/1/sales/f728999d-2b9d-4e5b-8cb9-c29a8350f9de/capture"
      },
      {
        "Method": "PUT",
        "Rel": "void",
        "Href": "https://apisandbox.cieloecommerce.cielo.com.br/1/sales/f728999d-2b9d-4e5b-8cb9-c29a8350f9de/void"
      }
    ]
  }
}
```

| Propriedade                                                     | Tipo  | Tamanho | Obrigatório                    | Descrição                                                                                                                                                                                                                                                                                                                                                                                    |
| :-------------------------------------------------------------- | :---- | :------ | :----------------------------- | :------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| `Payment.PaymentFacilitator.EstablishmentCode`                  | texto | 11      | Obrigatório para facilitadores | Código do estabelecimento do Facilitador. "Facilitator ID” (Cadastro do facilitador com as bandeiras)<br />O código é diferente por bandeira, podendo variar inclusive o tamanho do campo:<br />Bandeira Mastercard –06 dígitos<br />Bandeira Visa –08 dígitos<br />Bandeira ELO –de 04 à 05 dígitos<br />Para demais bandeiras, como Amex e JCB, o campo pode ser preenchido com “0” zeros. |
| `Payment.PaymentFacilitator.SubEstablishment.EstablishmentCode` | texto | 15      | Obrigatório para facilitadores | Código do estabelecimento do sub Merchant. “Sub-Merchant ID” (Cadastro do subcredenciado com o facilitador)                                                                                                                                                                                                                                                                                  |
| `Payment.PaymentFacilitator.SubEstablishment.Identity`          | texto | 14      | Obrigatório para facilitadores | CNPJ ou CPF do sub-merchant.**Permite envio de CNPJs alfanuméricos.**                                                                                                                                                                                                                                                                                                                        |
| `Payment.PaymentFacilitator.SubEstablishment.Mcc`               | texto | 4       | Obrigatório para facilitadores | MCC do sub Merchant.                                                                                                                                                                                                                                                                                                                                                                         |
| `Payment.PaymentFacilitator.SubEstablishment.Address`           | texto | 22      | Obrigatório para facilitadores | Endereço do sub Merchant.                                                                                                                                                                                                                                                                                                                                                                    |
| `Payment.PaymentFacilitator.SubEstablishment.City`              | texto | 13      | Obrigatório para facilitadores | Cidade do sub Merchant.                                                                                                                                                                                                                                                                                                                                                                      |
| `Payment.PaymentFacilitator.SubEstablishment.State`             | texto | 2       | Obrigatório para facilitadores | Estado do sub Merchant.                                                                                                                                                                                                                                                                                                                                                                      |
| `Payment.PaymentFacilitator.SubEstablishment.PostalCode`        | texto | 9       | Obrigatório para facilitadores | Código postal do sub Merchant.                                                                                                                                                                                                                                                                                                                                                               |
| `Payment.PaymentFacilitator.SubEstablishment.CountryCode`       | texto | 3       | Obrigatório para facilitadores | Código país do sub-merchant com base no ISO 3166.<br />Ex: código ISO 3166 do Brasil é o 076. [Lista completa online](https://www.iso.org/obp/ui/#search)                                                                                                                                                                                                                                    |
| `Payment.PaymentFacilitator.SubEstablishment.PhoneNumber`       | texto | 13      | Obrigatório para facilitadores | Número de telefone do sub Merchant.                                                                                                                                                                                                                                                                                                                                                          |
| `Payment.Softdescriptor`                                        | texto | 13      | Obrigatório para facilitadores | Texto impresso na fatura bancária comprador. Deve ser preenchido de acordo com os dados do sub Merchant. Não permite caracteres especiais.                                                                                                                                                                                                                                                   |

\*\*Evite utilizar acentos pois eles são considerados como dois caracteres.