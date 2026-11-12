---
updatedAt: 2026-09-24T21:34:03.000Z
agentTools:
  siteIndex: https://docs.cielo.com.br/llms.txt
  projectIndex: https://docs.cielo.com.br/ecommerce-cielo/llms.txt
---

# Transferência para carteira de pedágio

Transferência de saldo para uma carteira de pedágio usando o cartão de crédito ou débito

A transferência de fundos de um cartão para uma conta, dentro da carteira de pedágio, de mesma titularidade ou titularidade diferente. É usada para colocar saldo na carteira de pedágio (conta pré-paga) usando um cartão de crédito ou débito da bandeira.

> ⚠️ Identificação de transações oriundas de link de pagamento para cartões da bandeira Elo
>
> A partir de 17 de outubro de 2025 será obrigatório identificar transações oriundas de link de pagamento para cartões da bandeira Elo. Envie o parâmetro `Payment.SolutionType` = "ExternalLinkPay".

> ℹ️ CNPJs alfanuméricos serão implementados pela Receita Federal em julho de 2026
>
> Essa mudança afeta apenas novas inscrições, **não havendo mudanças em CNPJs existentes**.
>
> O CNPJ alfanumérico **já está sendo suportado pela Cielo**, sem mudanças na sua integração.
>
> Recomendamos verificar a necessidade de possíveis ajustes nos sistemas próprios de checkout de sua loja.

<br />

Confira a seguir um exemplo da requisição de SDWO do tipo pedágio, com envio do parâmetro `CashIn` = true e do nó `ReceiverData`, que representa os dados do recebedor, caso a titularidade seja diferente:

## Requisição

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

```json Exemplo transferência para carteira de pedágio Visa
{
    "MerchantOrderId": "2012345678",
    "Customer": {
        "Name": "Aline de Souza",
        "Identity": "12345678900",
        "IdentityType": "CPF"
    },
    "Payment": {
        "Type": "CreditCard",
        "Amount": 15700,
        "Installments": 1,
        "SoftDescriptor": "CARTEIRA*NOMELOJA",
        "CreditCard": {
            "CardNumber": "4532110000001234",
            "Holder": "Aline de Souza",
            "Brand": "Visa",
            "SecurityCode": "333",
            "ExpirationDate": "12/2035"
        },
        "Wallet": {
            "PlatformOperator": "ABC",
            "ReceiverData": {
                "Name": "NOME DO RECEBEDOR",
                "Identity": "11122233344",
                "CompanyName": "NOME RAZAO SOCIAL",
                "WalletId": "12345678900", 
                "CountryCode": "076"
            },
            "AdditionalData": {
                "Mcc": "4784",
                "CashIn": true
            }
        }
    }
}
```
```json JSON BANDEIRA ELO
{
    "MerchantOrderId": "2012345678",
    "Customer": {
        "Name": "Aline de Souza",
        "Identity": "12345678900",
        "IdentityType": "CPF"
    },
    "Payment": {
        "Type": "CreditCard",
        "Amount": 15700,
        "Installments": 1,
        "SoftDescriptor": "CARTEIRA*NOMELOJA",
        "SolutionType": "ExternalLinkPay",
        "CreditCard": {
            "CardNumber": "4532110000001234",
            "Holder": "Aline de Souza",
            "Brand": "Visa",
            "SecurityCode": "333",
            "ExpirationDate": "12/2035"
        },
        "Wallet": {
            "PlatformOperator": "ABC",
            "ReceiverData": {
                "Name": "NOME DO RECEBEDOR",
                "Identity": "11122233344",
                "CompanyName": "NOME RAZAO SOCIAL"
            },
            "AdditionalData": {
                "Mcc": "4784",
                "CashIn": true
            }
        }
    }
}
```

**Parâmetros no cabeçalho (header)**

| Parâmetro      | Descrição                                                                                          | Tipo   | Tamanho | Obrigatório |
| -------------- | -------------------------------------------------------------------------------------------------- | ------ | ------- | ----------- |
| `Content-Type` | Tipo de mídia aceito pelo recurso.                                                                 | String | 40      | Sim         |
| `MerchantId`   | Identificador da loja na Cielo.                                                                    | String | 36      | Sim         |
| `MerchantKey`  | Chave pública para autenticação dupla na Cielo.                                                    | String | 40      | Sim         |
| `RequestId`    | Identificador da requisição, usado quando a loja usa diferentes servidores para cada GET/POST/PUT. | String | 36      | Não         |

**Parâmetros no corpo (body)**

Confira a requisição padrão de cartão de crédito ou débito para verificar os demais campos opcionais. A tabela abaixo apresenta os **parâmetros exclusivos para transação de SDWO do tipo pedágio**.

<Callout icon="ℹ️" theme="info">
  ### **Importante**

  #### Mastercard

  A partir de **30/10/2026**, será obrigatório o envio dos campos do remetente:

  * `Customer.Name`;
  * `Customer.Identity`;
  * `Customer.IdentityType` .

    e do destinatário, quando aplicável:
  * `Payment.Wallet.ReceiverData.Name` ;
  * `Payment.Wallet.ReceiverData.Identity`;
  * `Payment.Wallet.ReceiverData.CompanyName.`

  #### Visa

  Para transações com bandeira Visa, é obrigatório o envio dos campos:

  * `Payment.Wallet.ReceiverData.CountryCode`;
  * `Payment.Wallet.PlatformOperator`.
</Callout>

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
        Obrigatório?
      </th>
    </tr>
  </thead>

  <tbody>
    <tr>
      <td>
        `MerchantOrderId`
      </td>

      <td>
        Identificação do pedido. Poderá ser usada para cancelar ou consultar a transação no futuro.<br /> _Atenção: Os caracteres permitidos são apenas a-z, A-Z, 0-9. Não são permitidos caracteres especiais e espaços em branco._
      </td>

      <td>
        string
      </td>

      <td>
        50
      </td>

      <td>
        Sim
      </td>
    </tr>

    <tr>
      <td>
        `Customer.Name`
      </td>

      <td>
        Nome ou razão social do comprador. Deve ser enviado o nome da pessoa física quando `Customer.IdentityType` for CPF ou a razão social do estabelecimento quando `Customer.IdentityType` for CNPJ.<br />_Atenção: Os caracteres permitidos são apenas a-z, A-Z. Não são permitidos caracteres especiais e números._
      </td>

      <td>
        string
      </td>

      <td>
        255
      </td>

      <td>
        Sim
      </td>
    </tr>

    <tr>
      <td>
        `Customer.Identity`
      </td>

      <td>
        Número do CPF ou CNPJ do comprador.
      </td>

      <td>
        texto
      </td>

      <td>
        14
      </td>

      <td>
        Sim, se o portador for pessoa jurídica (CNPJ).<br />**Permite envio de CNPJs alfanuméricos.**
      </td>
    </tr>

    <tr>
      <td>
        `Customer.IdentityType`
      </td>

      <td>
        Tipo de documento de identificação do comprador (CPF/CNPJ).
      </td>

      <td>
        texto
      </td>

      <td>
        255
      </td>

      <td>
        Sim, se o portador for pessoa jurídica (CNPJ).
      </td>
    </tr>

    <tr>
      <td>
        `Payment.Type`
      </td>

      <td>
        Tipo do meio de pagamento. Valor padrão: CreditCard.
      </td>

      <td>
        string
      </td>

      <td>
        *
      </td>

      <td>
        Sim
      </td>
    </tr>

    <tr>
      <td>
        `Payment.Amount`
      </td>

      <td>
        Valor do pedido (enviado em centavos).
      </td>

      <td>
        integer
      </td>

      <td>
        15
      </td>

      <td>
        Sim
      </td>
    </tr>

    <tr>
      <td>
        `Payment.Installments`
      </td>

      <td>
        Número de parcelas. Para transações parceladas, o número de parcelas será sempre maior que 1.
      </td>

      <td>
        integer
      </td>

      <td>
        2
      </td>

      <td>
        Sim
      </td>
    </tr>

    <tr>
      <td>
        `SoftDescriptor`
      </td>

      <td>
        Texto que será impresso na fatura bancária do portador.  Não permite caracteres especiais.  Necessário preencher no formato **Nome da carteira\*nome do lojista**.
      </td>

      <td>
        texto
      </td>

      <td>
        13
      </td>

      <td>
        Sim
      </td>
    </tr>

    <tr>
      <td>
        `Payment.CreditCard.CardNumber`
      </td>

      <td>
        Número do cartão do comprador.
      </td>

      <td>
        string
      </td>

      <td>
        19
      </td>

      <td>
        Sim
      </td>
    </tr>

    <tr>
      <td>
        `Payment.CreditCard.Holder`
      </td>

      <td>
        Nome do comprador impresso no cartão. Não aceita caracteres especiais ou acentuação.
      </td>

      <td>
        string
      </td>

      <td>
        25
      </td>

      <td>
        Sim
      </td>
    </tr>

    <tr>
      <td>
        `Payment.CreditCard.Brand`
      </td>

      <td>
        Bandeira do cartão. Valores possíveis: Visa / Master / Amex / Elo / Aura / JCB / Diners / Discover.
      </td>

      <td>
        string
      </td>

      <td>
        10
      </td>

      <td>
        Sim
      </td>
    </tr>

    <tr>
      <td>
        `Payment.CreditCard.SecurityCode`
      </td>

      <td>
        Código de segurança impresso no verso do cartão.
      </td>

      <td>
        string
      </td>

      <td>
        4
      </td>

      <td>
        Sim
      </td>
    </tr>

    <tr>
      <td>
        `Payment.CreditCard.ExpirationDate`
      </td>

      <td>
        Data de validade impressa no cartão. Exemplo: MM/AAAA.
      </td>

      <td>
        string
      </td>

      <td>
        7
      </td>

      <td>
        Sim
      </td>
    </tr>

    <tr>
      <td>
        `Payment.Wallet.PlatformOperator`
      </td>

      <td>
        Sigla da carteira que está cadastrada na Cielo como carteira digital (verificar sua sigla com seu gestor comercial).
      </td>

      <td>
        string (texto)
      </td>

      <td>
        3
      </td>

      <td>
        Sim
      </td>
    </tr>

    <tr>
      <td>
        `Payment.Wallet.ReceiverData.Name`
      </td>

      <td>
        Nome do cliente ou estabelecimento recebedor.
      </td>

      <td>
        texto
      </td>

      <td>
        70
      </td>

      <td>
        Sim
      </td>
    </tr>

    <tr>
      <td>
        `Payment.Wallet.ReceiverData.Identity`
      </td>

      <td>
        Número do CPF ou CNPJ do recebedor.
      </td>

      <td>
        texto
      </td>

      <td>
        14
      </td>

      <td>
        Sim
      </td>
    </tr>

    <tr>
      <td>
        `Payment.Wallet.ReceiverData.CompanyName`
      </td>

      <td>
        Razão social do estabelecimento recebedor.
      </td>

      <td>
        texto
      </td>

      <td>
        40
      </td>

      <td>
        Sim, se o cliente recebedor for pessoa jurídica (CNPJ).
      </td>
    </tr>

    <tr>
      <td>
        `Payment.Wallet.ReceiverData.WalletId`
      </td>

      <td>
        Identificador da carteira digital (wallet) do estabelecimento ou pessoa recebedora, quando aplicável ao arranjo.
      </td>

      <td>
        texto
      </td>

      <td>
        20
      </td>

      <td>
        Sim
      </td>
    </tr>

    <tr>
      <td>
        `Payment.Wallet.ReceiverData.CountryCode`
      </td>

      <td>
        Código do país do destinatário/recebedor, com base na ISO 3166. Ex.: código ISO 3166 do Brasil é o 076.<br />Acesse a <Anchor target="_blank" href="https://www.iso.org/obp/ui/#search">lista completa</Anchor>.
      </td>

      <td>
        texto
      </td>

      <td>
        3
      </td>

      <td>
        Sim
      </td>
    </tr>

    <tr>
      <td>
        `Payment.Wallet.AdditionalData.Mcc`
      </td>

      <td>
        MCC da carteira digital para transações de transferência de fundos do tipo pedágio, conforme a bandeira do cartão.  Consulte a [Tabela de MCCs para SDWO de arranjo de transferência de fundos.](https://docs.cielo.com.br/ecommerce-cielo/reference/sdwo-de-arranjo-de-transfer%C3%AAncia-de-fundos)
      </td>

      <td>
        string (numérico)
      </td>

      <td>
        4
      </td>

      <td>
        Sim
      </td>
    </tr>

    <tr>
      <td>
        `Payment.Wallet.AdditionalData.CashIn`
      </td>

      <td>
        Enviar como _true_.
      </td>

      <td>
        boolean
      </td>

      <td>
        *
      </td>

      <td>
        Sim
      </td>
    </tr>

    <tr>
      <td>
        `Payment.SolutionType`
      </td>

      <td>
        Origem do pagamento. **Obrigatório para transação de cartão da bandeira Elo oriunda de link de pagamento**. <br />Enviar como _"ExternalLinkPay"_.
      </td>

      <td>
        string
      </td>

      <td>
        15
      </td>

      <td>
        Não
      </td>
    </tr>
  </tbody>
</Table>