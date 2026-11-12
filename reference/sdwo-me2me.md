---
updatedAt: 2026-09-24T19:00:31.000Z
agentTools:
  siteIndex: https://docs.cielo.com.br/llms.txt
  projectIndex: https://docs.cielo.com.br/ecommerce-cielo/llms.txt
---

# Transferência para o mesmo portador (Me2Me)

Transferência de fundos para o mesmo portador dentro da carteira digital

A transferência de fundos Me2Me se refere à transferência de valores de um cartão para uma conta, de **mesma titularidade**, dentro da SDWO. É usada, por exemplo, para colocar saldo na carteira digital usando um cartão da bandeira (seja crédito ou débito).

> ⚠️ Identificação de transações oriundas de link de pagamento para cartões da bandeira Elo
>
> A partir de 17 de outubro de 2025 será obrigatório identificar transações oriundas de link de pagamento para cartões da bandeira Elo. Envie o parâmetro `Payment.SolutionType` = "ExternalLinkPay".

<br />

> ℹ️ CNPJs alfanuméricos serão implementados pela Receita Federal em julho de 2026
>
> Essa mudança afeta apenas novas inscrições, **não havendo mudanças em CNPJs existentes**.
>
> O CNPJ alfanumérico **já está sendo suportado pela Cielo**, sem mudanças na sua integração.
>
> Recomendamos verificar a necessidade de possíveis ajustes nos sistemas próprios de checkout de sua loja.

Confira a seguir um exemplo da requisição de SDWO do tipo Me2Me:

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

```json Exemplo Me2Me Visa
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
            "CardNumber": "4091688625337641",
            "Holder": "Aline de Souza",
            "Brand": "Visa",
            "SecurityCode": "333",
            "ExpirationDate": "12/2035"
        },
        "Wallet": {
            "PlatformOperator": "ABC",
            "AdditionalData": {
                "Mcc": "6540",
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
            "CardNumber": "4091688625337641",
            "Holder": "Aline de Souza",
            "Brand": "Elo",
            "SecurityCode": "333",
            "ExpirationDate": "12/2035"
        },
        "Wallet": {
            "PlatformOperator": "ABC",
            "AdditionalData": {
                "Mcc": "6054",
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

Confira a requisição padrão de cartão de crédito ou débito para verificar os demais campos opcionais. A tabela abaixo apresenta os **parâmetros exclusivos para transação de SDWO do tipo Me2Me**.

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
        Nome do comprador. <br />_Atenção: Os caracteres permitidos são apenas a-z, A-Z. Não são permitidos caracteres especiais e números._
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
        `Payment.SoftDescriptor`
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
        Condicional
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
        `Payment.Wallet.AdditionalData.Mcc`
      </td>

      <td>
        MCC da carteira digital para transações de transferência de fundos Me2Me, conforme a bandeira do cartão. Consulte a [Tabela de MCCs para SDWO de arranjo de transferência de fundos.](https://docs.cielo.com.br/ecommerce-cielo/reference/sdwo-de-arranjo-de-transfer%C3%AAncia-de-fundos)
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
  </tbody>
</Table>