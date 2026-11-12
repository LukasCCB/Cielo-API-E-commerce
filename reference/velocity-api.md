---
updatedAt: 2025-10-30T01:08:11.000Z
agentTools:
  siteIndex: https://docs.cielo.com.br/llms.txt
  projectIndex: https://docs.cielo.com.br/ecommerce-cielo/llms.txt
---

# Prevenir fraudes com o Velocity

> ℹ️
>
> Saiba mais sobre essa funcionalidade <a href="https://docs.cielo.com.br/ecommerce-cielo/docs/velocity"
> target="\_blank">na documentação</a>.

O **Velocity** é um tipo de mecanismo de prevenção a tentativas de fraude que analisa a frequência em que determinados dados são utilizados numa transação e se esse dados estão inscritos em uma lista de comportamentos passíveis de ações de segurança.

O **Velocity** é um aliado na avaliação de comportamentos de compra suspeitos, pois os cálculos são baseados em **elementos de rastreabilidade**.

> ℹ️ Importante
>
> Para que suas transações sejam analisadas pelo Velocity, solicite a inclusão desse serviço ao Suporte Cielo.

O Velocity funciona analisando dados enviados na integração padrão da API Cielo E-commerce. Assim, não é necessário incluir nenhum nó adicional na requisição de criação de transação.

Quando o Velocity está ativo, a resposta da transação irá trazer um nó específico chamado `VelocityAnalysis`, com os detalhes da análise.

```json
      "VelocityAnalysis": {
        "Id": "2d5e0463-47be-4964-b8ac-622a16a2b6c4",
        "ResultMessage": "Reject",
        "Score": 100
      },
```

| Propriedade                      | Descrição                         | Tipo   | Tamanho |
| -------------------------------- | --------------------------------- | ------ | ------- |
| `VelocityAnalysis.Id`            | Identificador da análise efetuada | GUID   | 36      |
| `VelocityAnalysis.ResultMessage` | Accept ou Reject                  | Texto  | 25      |
| `VelocityAnalysis.Score`         | 100                               | Número | 10      |

Confira a seguir uma resposta de transação de cartão de crédito com o nó `VelocityAnalysis`.

```json
{
    "MerchantOrderId": "2017051202",
    "Customer": {
      "Name": "Nome do Comprador",
      "Identity": "12345678909",
      "IdentityType": "CPF",
      "Email": "comprador@cielo.com.br",
      "Address": {
        "Street": "Alameda Xingu",
        "Number": "512",
        "Complement": "27 andar",
        "ZipCode": "12345987",
        "City": "São Paulo",
        "State": "SP",
        "Country": "BRA"
      },
    "Payment": {
      "ServiceTaxAmount": 0,
      "Installments": 1,
      "Interest": "ByMerchant",
      "Capture": true,
      "Authenticate": false,
      "Recurrent": false,
      "CreditCard": {
        "CardNumber": "455187******0181",
        "Holder": "Nome do Portador",
        "ExpirationDate": "12/2027",
        "SaveCard": false,
        "Brand": "Undefined"
      },
      "VelocityAnalysis": {
        "Id": "2d5e0463-47be-4964-b8ac-622a16a2b6c4",
        "ResultMessage": "Reject",
        "Score": 100
      },
      "PaymentId": "2d5e0463-47be-4964-b8ac-622a16a2b6c4",
      "Type": "CreditCard",
      "Amount": 10000,
      "Currency": "BRL",
      "Country": "BRA",
      "Provider": "Simulado",
      "ReasonCode": 16,
      "ReasonMessage": "AbortedByFraud",
      "Status": 0,
      "ProviderReturnCode": "BP171",
      "ProviderReturnMessage": "Rejected by fraud risk (velocity)",
      "Links": [
        {
          "Method": "GET",
          "Rel": "self",
          "Href": "https://apiquery.cieloecommerce.cielo.com.br/1/sales/2d5e0463-47be-4964-b8ac-622a16a2b6c4"
        }
      ]
    }
  }
```