---
updatedAt: 2026-10-20T18:39:31.000Z
agentTools:
  siteIndex: https://docs.cielo.com.br/llms.txt
  projectIndex: https://docs.cielo.com.br/ecommerce-cielo/llms.txt
---

# Criar pagamento com token da bandeira via integração externa

Cria pagamento usando token de bandeira criado fora da Cielo

<Callout icon="ℹ️" theme="info">
  Saiba mais sobre essa funcionalidade <Anchor label="na documentação" target="_blank" href="https://docs.cielo.com.br/ecommerce-cielo/docs/network-token">na documentação</Anchor>.
</Callout>

Se o estabelecimento usa um gateway ou outro parceiro que já oferece a solução de token de bandeira, é necessário enviar na requisição à API E-commerce Cielo alguns parâmetros específicos para que a bandeira receba os dados do token.

* `Payment.CreditCard.Cryptogram`: é o criptograma do token gerado pela bandeira a cada transação e associa o token à uma transação específica;
* `Payment.IssuerTransactionId`: é o identificador da bandeira para transações de uma série de recorrências (credenciais armazenadas). Envie o `Payment.IssuerTransactionId` em cada transação MIT recorrente, pois o envio é obrigatório: é ele que permite à bandeira e ao emissor identificar a transação CIT prévia com aquele token.

> ℹ️ Transações Mastercard
>
> Para transações MIT tokenizadas na bandeira Mastercard, **não é necessário enviar o criptograma**, pois o token já foi validado previamente na transação CIT original. Ou seja:
>
> * em transações **CIT**, o criptograma deve ser enviado no campo `Payment.CreditCard.Cryptogram`;
> * em transações **MIT**, o criptograma não deve ser enviado.
>
> Caso o criptograma não for enviado, é necessário informar o `Payment.IssuerTransactionId`.
>
> Saiba mais sobre transações CIT e MIT em [Indicador de início da transação - CIT e MIT](https://docs.cielo.com.br/ecommerce-cielo/page/indicador-de-in%C3%ADcio-da-transa%C3%A7%C3%A3o-cit-e-mit).

### TLID Mastercard

O **Transaction Link Identifier (TLID)**, enviado e retornado no campo `TransactionLinkId`, é um identificador único gerado pela bandeira **Mastercard** durante uma transação CIT, usado para vincular as transações MIT relacionadas. O TLID vale para a resposta do Zero Auth (apenas resposta) e para as transações de crédito, débito e recorrência própria.

Na Mastercard, envie `IssuerTransactionId` e `TransactionLinkId` juntos nas transações MIT: os dois parâmetros são obrigatórios.

| Fase   | Descrição                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                    |
| ------ | ---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| Fase 1 | Vigente. O campo `TransactionLinkId` está disponível na resposta da [validação de cartão por Zero Auth](https://docs.cielo.com.br/ecommerce-cielo/reference/validar-cartao), [criação de pagamento com cartão de crédito](https://docs.cielo.com.br/ecommerce-cielo/reference/criar-pagamento-credito), [criação de pagamento com cartão de débito](https://docs.cielo.com.br/ecommerce-cielo/reference/debito) e na [consulta por `PaymentId`](https://docs.cielo.com.br/ecommerce-cielo/reference/consulta-paymentid-api). |
| Fase 2 | Envio obrigatório do `TransactionLinkId` no request (MIT) a partir de **23/10/2026**.                                                                                                                                                                                                                                                                                                                                                                                                                                        |

> **Recorrência programada:** nas transações seguintes, os campos `IssuerTransactionId` e `TransactionLinkId` são enviados automaticamente.

O `TransactionLinkId` enviado no request deve ter exatamente 22 caracteres (A-Z, a-z, 0-9, hífen e sublinhado). Se o valor estiver fora desse formato, a Cielo o ignora, sem retornar erro. Quando a Cielo envia o TLID à bandeira, a resposta traz também o `SentTransactionLinkId`, com o valor enviado. O request do Zero Auth não aceita o campo.

> Saiba mais em <Anchor target="_blank" href="https://docs.cielo.com.br/ecommerce-cielo/docs/identificadores-de-bandeira">Identificadores de bandeira</Anchor>.

<br />

Confira o exemplo de requisição para uso de token de bandeira com **integração externa**:

# Requisição

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

<br />

```json
{
  "MerchantOrderId": "Loja123456",
  "Customer": {
    "Name": "Comprador Teste",
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
    "Amount": 15700,
    "Currency": "BRL",
    "Country": "BRA",
    "ServiceTaxAmount": 0,
    "Installments": 1,
    "Interest": "ByMerchant",
    "Capture": true,
    "Authenticate": false,
    "SoftDescriptor": "123456789ABCD",
    "CreditCard": {
      "CardNumber": "1234123412341231",
      "CardNumberType":"DPAN",
      "Holder": "Teste Holder",
      "Cryptogram": "abcdefghijklmnopqrstuvw==",
      "ExpirationDate": "12/2030",
      "SecurityCode": "123",
      "SaveCard": "true",
      "Brand": "Visa"
    }
  }
}
```

<br />

**Parâmetros no cabeçalho (header)**

| Parâmetro    | Descrição                                                                                          | Tipo   | Tamanho | Obrigatório |
| ------------ | -------------------------------------------------------------------------------------------------- | ------ | ------- | ----------- |
| Content-Type | Tipo de mídia aceito pelo recurso.                                                                 | String | 40      | Sim         |
| MerchantId   | Identificador da loja na Cielo.                                                                    | String | 36      | Sim         |
| MerchantKey  | Chave pública para autenticação dupla na Cielo.                                                    | String | 40      | Sim         |
| RequestId    | Identificador da requisição, usado quando a loja usa diferentes servidores para cada GET/POST/PUT. | String | 36      | Não         |

**Parâmetros no corpo (body)**

Confira a requisição padrão de cartão de crédito para verificar todos os campos obrigatórios. A tabela abaixo apresenta os **parâmetros exclusivos para a tokenização via integração externa**.

<Table align={["left","left","left","left","left"]}>
  <thead>
    <tr>
      <th>
        Parâmetro
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

      <th>
        Descrição
      </th>
    </tr>
  </thead>

  <tbody>
    <tr>
      <td>
        `Payment.CreditCard.CardNumber`
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
        Token gerado pela bandeira (DPAN). A indicação de que o `CardNumber` deve ser preenchido com o DPAN para caso de tokenização de bandeira.
      </td>
    </tr>

    <tr>
      <td>
        `Payment.CreditCard.CardNumberType`
      </td>

      <td>
        Texto
      </td>

      <td>
        --
      </td>

      <td>
        Condicional*
      </td>

      <td>
        Esse campo suporta os valores PAN e DPAN.

        * **Opcional**: Quando o cliente envia o Cryptogram.
        * **Obrigatório**: Quando o cliente envia um cartão tokenizado (DPAN) sem o Cryptogram. Nesse caso, o valor do `CardNumberType` deve ser DPAN.
      </td>
    </tr>

    <tr>
      <td>
        `Payment.CreditCard.Holder`
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
        Nome do Comprador impresso no cartão.
      </td>
    </tr>

    <tr>
      <td>
        `Payment.CreditCard.Cryptogram`
      </td>

      <td>
        Texto
      </td>

      <td>
        28
      </td>

      <td>
        Condicional*
      </td>

      <td>
        Criptograma gerado pela bandeira. Deve ser enviado caso a tokenização seja feita na bandeira (integração externa).
      </td>
    </tr>

    <tr>
      <td>
        `Payment.CreditCard.ExpirationDate`
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
        Data de validade do token gerado pela bandeira.
      </td>
    </tr>

    <tr>
      <td>
        `Payment.CreditCard.SecurityCode`
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
        Código de segurança impresso no verso do cartão - Ver Anexo.
      </td>
    </tr>

    <tr>
      <td>
        `Payment.CreditCard.SaveCard`
      </td>

      <td>
        Booleano
      </td>

      <td>
        ***
      </td>

      <td>
        Não (Default false)
      </td>

      <td>
        Booleano que identifica se o cartão será salvo para gerar o CardToken. Saiba mais sobre [Tokenização](https://docs.cielo.com.br/ecommerce-cielo/docs/tokenizando-cartoes).
      </td>
    </tr>

    <tr>
      <td>
        `Payment.CreditCard.Brand`
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
        Bandeira do cartão (Visa / Master / Amex / Elo / Aura / JCB / Dinners / Discover).
      </td>
    </tr>
  </tbody>
</Table>

\**Deve ser enviado caso a tokenização seja feita na bandeira (integração externa).*

# Resposta

```json
{
    "MerchantOrderId": "Loja123456",
    "Customer": {
        "Name": "Comprador Teste",
        "Identity":"11225468954",
        "IdentityType":"CPF",
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
        "Interest": "ByMerchant",
        "Capture": true,
        "Authenticate": false,
        "CreditCard": {
            "CardNumber": "455187******0183",
            "Holder": "Teste Holder",
            "ExpirationDate": "12/2030",
            "SaveCard": true,
            "CardToken": "d37bf475-307d-47be-b50a-8dcc38c5056c",
            "Brand": "Visa"
        },
        "ProofOfSale": "674532",
        "Tid": "0305020554239",
        "AuthorizationCode": "123456",
        "SoftDescriptor":"123456789ABCD",
        "PaymentId": "24bc8366-fc31-4d6c-8555-17049a836a07",
        "Type": "CreditCard",
        "Amount": 15700,
        "CapturedAmount": 15700,
        "Country": "BRA",
        "ExtraDataCollection": [],
        "Status": 2,
        "ReturnCode": "6",
        "ReturnMessage": "Operation Successful",
        "Links": [
            {
                "Method": "GET",
                "Rel": "self",
                "Href": "https://apiquerysandbox.cieloecommerce.cielo.com.br/1/sales/{PaymentId}"
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

**Propriedades da resposta**

<Table align={["left","left","left","left","left"]}>
  <thead>
    <tr>
      <th>
        Parâmetro
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
        Texto que será impresso na fatura bancária do portador - disponível apenas para VISA/MASTER - não permite caracteres especiais
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
        Número de identificação do pagamento, necessário para operações como Consulta, Captura e Cancelamento.
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
        Eletronic Commerce Indicator. Representa o quão segura é uma transação.
      </td>

      <td>
        Texto
      </td>

      <td>
        2
      </td>

      <td>
        Exemplos: 7
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
        ***
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
        `Cardtoken`
      </td>

      <td>
        Token de identificação do Cartão.
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
        `Payment.IssuerTransactionId`
      </td>

      <td>
        Identificador da transação gerado pela bandeira e retornado na transação CIT. Envie o valor nas transações MIT: o envio é obrigatório, para todas as bandeiras, em transações recorrentes, incrementais e reautorizadas. Consulte mais informações em <Anchor label="Identificadores da bandeira" target="_blank" href="https://docs.cielo.com.br/ecommerce-cielo/docs/identificadores-de-bandeira">Identificadores de bandeira</Anchor>.
      </td>

      <td>
        string
      </td>

      <td>
        30
      </td>

      <td>

      </td>
    </tr>

    <tr>
      <td>
        `Payment.TransactionLinkId`
      </td>

      <td>
        Identificador único (TLID) gerado pela Mastercard e retornado na transação CIT, usado para vincular a transação CIT às transações MIT seguintes. Na Mastercard, envie o `TransactionLinkId` original junto com o `IssuerTransactionId`: os dois são obrigatórios, e o envio do `TransactionLinkId` é obrigatório a partir de 23/10/2026. Consulte mais informações em <Anchor label="TLID Mastercard" target="_blank" href="https://docs.cielo.com.br/ecommerce-cielo/docs/identificadores-de-bandeira">Identificadores de bandeira</Anchor>.

        **Formato**: 22 caracteres alfanuméricos (A-Z, a-z), com diferenciação entre maiúsculas e minúsculas e podem incluir hífens (-) e sublinhados (_).
      </td>

      <td>
        string
      </td>

      <td>
        22
      </td>

      <td>

      </td>
    </tr>
  </tbody>
</Table>

<div class="headline-container-article-info2GaOf2jMpV0r"><span class="rm-APIMethod APIMethod APIMethod_fixedWidth APIMethod_post headline-container-api-method1Hc-Fm7uaccR" data-testid="http-method">post</span></div>