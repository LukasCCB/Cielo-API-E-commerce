---
updatedAt: 2026-09-24T21:33:11.000Z
agentTools:
  siteIndex: https://docs.cielo.com.br/llms.txt
  projectIndex: https://docs.cielo.com.br/ecommerce-cielo/llms.txt
---

# SDWO de arranjo de compra

Compra de bem ou serviço com cartão vinculado a uma carteira digital (SDWO)

> ℹ️ CNPJs alfanuméricos serão implementados pela Receita Federal em julho de 2026
>
> Essa mudança afeta apenas novas inscrições, **não havendo mudanças em CNPJs existentes**.
>
> O CNPJ alfanumérico **já está sendo suportado pela Cielo**, sem mudanças na sua integração.
>
> Recomendamos verificar a necessidade de possíveis ajustes nos sistemas próprios de checkout de sua loja.

A transferência dentro do arranjo de compra se refere ao uso de um cartão (cartão não presente) atrelado a uma carteira digital SDWO para comprar um bem ou serviço junto a um estabelecimento comercial habilitado para aceitar a marca de pagamento da SDWO. É usada, por exemplo, em compra de bem ou serviço por QR Code, compra pelo botão de pagamento online (checkout) ou compra realizada dentro da própria SDWO.

Confira a seguir um exemplo da requisição de SDWO do tipo Arranjo de Compra:

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

```json Exemplo Arranjo de Compra 
{  
  "MerchantOrderId": "1234567897",
  "Customer": {
    "Name": "Aline de Souza",
    "Identity": "12345678900",
    "IdentityType": "CPF"
  },
  "Payment": {
    "Type": "CreditCard",
    "Amount": 100,
    "Installments": 1,
    "SoftDescriptor": "PAY*LOJATESTE",
    "CreditCard": {
      "CardNumber": "5067470000003000",
      "Holder": "Cielo",
      "ExpirationDate": "01/2030",
      "SecurityCode": "480",
      "Brand": "Elo"
    },
    "Wallet": {
      "PlatformOperator": "PAY",
      "TransferType": "PurchaseArrangement",
      "ReceiverData": {
        "Identity": "13730109000126",
        "Name": "Razao Social LTDA",
        "CompanyName": "Razao Social LTDA",
        "WalletId": "12345678900",
        "CountryCode": "076"
      },
      "AdditionalData": {
        "Mcc": "6540"
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

Confira a requisição padrão de cartão de crédito ou débito para verificar os demais campos opcionais. A tabela abaixo apresenta os **parâmetros exclusivos para transação de SDWO de arranjo de compra**.

<Callout icon="ℹ️" theme="info">
  ### **Importante**

  #### Mastercard

  A partir de **30/10/2026**, será obrigatório o envio dos campos do remetente (`Customer.Name`, `Customer.Identity` e `Customer.IdentityType`) e do destinatário (`Payment.Wallet.ReceiverData.Name`, `Payment.Wallet.ReceiverData.Identity` e `Payment.Wallet.ReceiverData.CompanyName`, quando aplicável).
</Callout>

<br />

<Callout icon="⚠️" theme="warn">
  ### **Campos obrigatórios para SDWO Arranjo de Compra**

  Para transações de SDWO do tipo **Arranjo de Compra**, é obrigatório o envio dos campos:

  - `Payment.Wallet.PlatformOperator`;
  - `Payment.Wallet.TransferType`;
  - `Payment.Wallet.ReceiverData.Identity`;
  - `Payment.Wallet.ReceiverData.Name`;
  - `Payment.Wallet.ReceiverData.CompanyName`;
  - `Payment.Wallet.ReceiverData.WalletId`.

  A ausência de qualquer um desses campos pode resultar na rejeição da transação.

  Para transações com bandeira **Visa**, também é obrigatório o envio do campo `Payment.Wallet.ReceiverData.CountryCode`.
</Callout>

| Parâmetro                                 | Descrição                                                                                                                                                                                                                                                                      | Tipo              | Tamanho | Obrigatório?                                                                         |
| ----------------------------------------- | ------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------ | ----------------- | ------- | ------------------------------------------------------------------------------------ |
| `MerchantOrderId`                         | Identificação do pedido. Poderá ser usada para cancelar ou consultar a transação no futuro. Atenção: apenas a-z, A-Z, 0-9. Não são permitidos caracteres especiais e espaços em branco.                                                                                        | string            | 50      | Sim                                                                                  |
| `Customer.Name`                           | Nome ou razão social do comprador. Deve ser enviado o nome da pessoa física quando `Customer.IdentityType` for CPF, ou a razão social do estabelecimento quando `Customer.IdentityType` for CNPJ. Atenção: apenas a-z, A-Z. Não são permitidos caracteres especiais e números. | string            | 255     | Sim                                                                                  |
| `Customer.Identity`                       | Número do CPF ou CNPJ do comprador.                                                                                                                                                                                                                                            | texto             | 14      | Sim, se o portador for pessoa jurídica (CNPJ). Permite envio de CNPJs alfanuméricos. |
| `Customer.IdentityType`                   | Tipo de documento de identificação do comprador (CPF/CNPJ).                                                                                                                                                                                                                    | texto             | 255     | Sim, se o portador for pessoa jurídica (CNPJ).                                       |
| `Payment.Type`                            | Tipo do meio de pagamento. Valor padrão: CreditCard.                                                                                                                                                                                                                           | string            | —       | Sim                                                                                  |
| `Payment.Amount`                          | Valor do pedido (enviado em centavos).                                                                                                                                                                                                                                         | integer           | 15      | Sim                                                                                  |
| `Payment.Installments`                    | Número de parcelas.                                                                                                                                                                                                                                                            | integer           | 2       | Sim                                                                                  |
| `Payment.SoftDescriptor`                  | Texto que será impresso na fatura bancária do portador. Não permite caracteres especiais. Necessário preencher no formato Nome da carteira\*nome do lojista.                                                                                                                   | texto             | 13      | Sim                                                                                  |
| `Payment.CreditCard.CardNumber`           | Número do cartão do comprador.                                                                                                                                                                                                                                                 | string            | 19      | Sim                                                                                  |
| `Payment.CreditCard.Holder`               | Nome do comprador impresso no cartão. Não aceita caracteres especiais ou acentuação.                                                                                                                                                                                           | string            | 25      | Sim                                                                                  |
| `Payment.CreditCard.Brand`                | Bandeira do cartão. Valores possíveis: Visa / Master / Amex / Elo / Aura / JCB / Diners / Discover.                                                                                                                                                                            | string            | 10      | Sim                                                                                  |
| `Payment.CreditCard.SecurityCode`         | Código de segurança impresso no verso do cartão.                                                                                                                                                                                                                               | string            | 4       | Sim                                                                                  |
| `Payment.CreditCard.ExpirationDate`       | Data de validade impressa no cartão. Exemplo: MM/AAAA.                                                                                                                                                                                                                         | string            | 7       | Sim                                                                                  |
| `Payment.Wallet.PlatformOperator`         | Sigla da carteira cadastrada na Cielo como carteira digital (verificar sigla com gestor comercial).                                                                                                                                                                            | string (texto)    | 3       | Sim                                                                                  |
| `Payment.Wallet.TransferType`             | Indica o tipo de arranjo da transação de wallet. Para transações do arranjo de compra, deve ser enviado o valor fixo PurchaseArrangement, que identifica que se trata desse arranjo.                                                                                           | string (texto)    | 20      | Sim                                                                                  |
| `Payment.Wallet.ReceiverData.Identity`    | Número do CPF ou CNPJ do recebedor.                                                                                                                                                                                                                                            | texto             | 14      | Sim                                                                                  |
| `Payment.Wallet.ReceiverData.Name`        | Nome do cliente ou estabelecimento recebedor.                                                                                                                                                                                                                                  | texto             | 70      | Sim                                                                                  |
| `Payment.Wallet.ReceiverData.CompanyName` | Razão social do estabelecimento recebedor.                                                                                                                                                                                                                                     | texto             | 40      | Sim, se o cliente recebedor for pessoa jurídica (CNPJ).                              |
| `Payment.Wallet.ReceiverData.WalletId`    | Identificador da carteira digital (wallet) do estabelecimento ou pessoa recebedora, quando aplicável ao arranjo.                                                                                                                                                               | texto             | 20      | Sim, para os arranjos que envolvem carteira digital (ex.: Arranjo de Compra).        |
| `Payment.Wallet.ReceiverData.CountryCode` | Código do país do destinatário/recebedor, com base na ISO 3166. Ex.: o código ISO 3166 do Brasil é 076.<br />Acesse a <Anchor target="_blank" href="https://www.iso.org/obp/ui/#search">Lista completa online</Anchor>.                                                        | texto             | 3       | Sim                                                                                  |
| `Payment.Wallet.AdditionalData.Mcc`       | MCC da carteira digital para transações de compra dentro do arranjo de compra. Seguir o MCC configurado no cadastro para o estabelecimento comercial.                                                                                                                          | string (numérico) | 4       | Sim                                                                                  |