---
updatedAt: 2026-10-05T19:20:42.000Z
agentTools:
  siteIndex: https://docs.cielo.com.br/llms.txt
  projectIndex: https://docs.cielo.com.br/ecommerce-cielo/llms.txt
---

# Criar pagamento com e-wallet com cartão descriptografado

Cria uma transação de e-wallet usando um cartão descriptografado

A autorização com cartão descriptografado acontece quando a própria loja descriptografa o *payload* recebido da wallet e envia por conta própria para a API Cielo E-commerce para processamento e autorização. Nesse cenário, envie para autorização o modelo de requisição a seguir:

<Callout icon="ℹ️" theme="info">
  Para transações MIT, **não é necessário enviar o criptograma**, pois o token já foi validado previamente na transação CIT original. Ou seja:

  * em transações **CIT**, o criptograma deve ser enviado no campo `Payment.Wallet.Cavv`;
  * em transações **MIT**, o criptograma não deve ser enviado.

  Saiba mais sobre transações CIT e MIT em [Indicador de início da transação](https://docs.cielo.com.br/ecommerce-cielo/page/indicador-de-in%C3%ADcio-da-transa%C3%A7%C3%A3o-cit-e-mit).
</Callout>

### Requisição

```json
-- Envio de cartão
{
  "MerchantOrderId": "Loja123456",
  "Customer": {
    "Name": "Aline de Souza",
    "Identity": "58154781050",
    "IdentityType": "CPF"
  },
  "Payment": {
    "Type": "CreditCard",
    "Amount": 1100,
    "Provider": "Cielo",
    "Installments": 1,
    "CreditCard": {
      "CardNumber":"4091688625337641",
      "Holder":"Aline de Souza",
          "ExpirationDate":"12/2035",
          "SecurityCode":"333",
          "Brand":"Visa"
    },
    "Wallet": {
      "Type": "Tipo de wallet",
      "Eci":"7",
      "Cavv":"AM1mbqehL24XAAa0J04CAoABFA=="
    }
  }
}
```

| Propriedade               | Tipo   | Tamanho | Obrigatório                     | Descrição                                                                                                                                                                                                                                                                                                                                                                                    |
| ------------------------- | ------ | ------- | ------------------------------- | -------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| `MerchantId`              | Guid   | 36      | Sim                             | Identificador da loja na Cielo.                                                                                                                                                                                                                                                                                                                                                              |
| `MerchantKey`             | Texto  | 40      | Sim                             | Chave Pública para Autenticação Dupla na Cielo.                                                                                                                                                                                                                                                                                                                                              |
| `RequestId`               | Guid   | 36      | Não                             | Identificador do Request, utilizado quando o lojista usa diferentes servidores para cada GET/POST/PUT.                                                                                                                                                                                                                                                                                       |
| `MerchantOrderId`         | Texto  | 50      | Sim                             | Número de identificação do pedido. *Atenção: Os caracteres permitidos são apenas a-z, A-Z, 0-9. Não são permitidos caracteres especiais e espaços em branco.*                                                                                                                                                                                                                                |
| `Customer.Name`           | Texto  | 255     | Não                             | Nome do comprador. *Atenção: Os caracteres permitidos são apenas a-z, A-Z. Não são permitidos caracteres especiais e números.*                                                                                                                                                                                                                                                               |
| `Customer.Status`         | Texto  | 255     | Não                             | Status de cadastro do comprador na loja (NEW / EXISTING)                                                                                                                                                                                                                                                                                                                                     |
| `Payment.Type`            | Texto  | 100     | Sim                             | Tipo do Meio de Pagamento.                                                                                                                                                                                                                                                                                                                                                                   |
| `Payment.Amount`          | Número | 15      | Sim                             | Valor do Pedido (ser enviado em centavos).                                                                                                                                                                                                                                                                                                                                                   |
| `Payment.Installments`    | Número | 2       | Sim                             | Número de Parcelas.                                                                                                                                                                                                                                                                                                                                                                          |
| `CreditCard.CardNumber.`  | Texto  | 19      | Sim                             | Número do cartão do comprador ou DPAN.                                                                                                                                                                                                                                                                                                                                                       |
| ` CreditCard.Holder`      | Texto  | 25      | Não                             | Nome do comprador impresso no cartão (titular do cartão). Não aceita caracteres especiais ou acentuação. **Importante**: o nome do titular do cartão é informado pela carteira. Se a loja tiver recebido o nome do titular, recomendamos informar na requisição à Cielo. Caso a loja não tenha o nome do titular do cartão, não envie o campo `CreditCard.Holder` ou envie com o valor null. |
| `CreditCard.SecurityCode` | Texto  | 4       | Não                             | Código de segurança impresso no verso do cartão - Ver Anexo.                                                                                                                                                                                                                                                                                                                                 |
| `CreditCard.Brand`        | Texto  | 10      | Sim                             | Bandeira do cartão (Visa / Master / Amex / Elo / Aura / JCB / Diners / Discover).                                                                                                                                                                                                                                                                                                            |
| `Wallet.Type`             | Texto  | 255     | Sim                             | Indica qual o tipo de carteira: `AndroidPay` / `ApplePay` / `SamsungPay`                                                                                                                                                                                                                                                                                                                     |
| `Wallet.Eci`              | Texto  | 3       | Sim (quando a carteira devolve) | O ECI (Eletronic Commerce Indicator) representa o quão segura é uma transação. Esse valor deve ser levado em consideração pelo lojista para decidir sobre a captura da transação.                                                                                                                                                                                                            |
| `Wallet.Cavv`             | Texto  | 255     | Sim                             | Campo de validação retornado pela Wallet e utilizado como base de autorização                                                                                                                                                                                                                                                                                                                |

### Resposta

```json
{
  "MerchantOrderId": "Loja123456",
  "Customer": {
    "Name": "Aline de Souza"
  },
  "Payment": {
    "ServiceTaxAmount": 0,
    "Installments": 1,
    "Interest": 0,
    "Capture": false,
    "Authenticate": false,
    "Recurrent": false,
    "CreditCard": {
      "CardNumber": "4091688625337641",
      "Holder": "Aline de Souza",
      "ExpirationDate": "12/2035",
      "SaveCard": false,
      "Brand": "Visa"
    },
    "Tid": "0319040817883",
    "ProofOfSale": "817883",
    "AuthorizationCode": "027795",
    "Wallet": {
      "Type": "TIPO DE WALLET",
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
        "Href": "https://apiquerysandbox.cieloecommerce.cielo.com.br/1/sales/e57b09eb-475b-44b6-ac71-01b9b82f2491"
      },
      {
        "Method": "PUT",
        "Rel": "capture",
        "Href": "https://apisandbox.cieloecommerce.cielo.com.br/1/sales/e57b09eb-475b-44b6-ac71-01b9b82f2491/capture"
      },
      {
        "Method": "PUT",
        "Rel": "void",
        "Href": "https://apisandbox.cieloecommerce.cielo.com.br/1/sales/e57b09eb-475b-44b6-ac71-01b9b82f2491/void"
      }
    ]
  }
}
```

| Propriedade         | Descrição                                                                                                                      | Tipo  | Tamanho | Formato                              |
| ------------------- | ------------------------------------------------------------------------------------------------------------------------------ | ----- | ------- | ------------------------------------ |
| `ProofOfSale`       | Número da autorização, idêntico ao NSU.                                                                                        | Texto | 6       | Texto alfanumérico                   |
| `Tid`               | Id da transação na adquirente.                                                                                                 | Texto | 20      | Texto alfanumérico                   |
| `AuthorizationCode` | Código de autorização.                                                                                                         | Texto | 6       | Texto alfanumérico                   |
| `SoftDescriptor`    | Texto que será impresso na fatura bancária do portador - Disponível apenas para VISA/MASTER - não permite caracteres especiais | Texto | 13      | Texto alfanumérico                   |
| `PaymentId`         | Campo Identificador do Pedido.                                                                                                 | Guid  | 36      | xxxxxxxx-xxxx-xxxx-xxxx-xxxxxxxxxxxx |
| `ECI`               | Eletronic Commerce Indicator. Representa o quão segura é uma transação.                                                        | Texto | 2       | Exemplos: 7                          |
| `Status`            | Status da Transação.                                                                                                           | Byte  | \*\*\*  | 2                                    |
| `ReturnCode`        | Código de retorno da Adquirência.                                                                                              | Texto | 32      | Texto alfanumérico                   |
| `ReturnMessage`     | Mensagem de retorno da Adquirência.                                                                                            | Texto | 512     | Texto alfanumérico                   |
| `Type`              | Indica qual o tipo de carteira: ApplePay, SamsungPay ou Google Pay                                                             | Texto | 255     | Texto alfanumérico                   |