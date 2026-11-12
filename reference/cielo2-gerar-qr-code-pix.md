---
updatedAt: 2026-10-21T20:15:23.000Z
agentTools:
  siteIndex: https://docs.cielo.com.br/llms.txt
  projectIndex: https://docs.cielo.com.br/ecommerce-cielo/llms.txt
---

# Criar pagamento com QR Code Pix

Válido para a integração com o provedor "Cielo2".

> ✅ Essa é a nova integração Pix que você deve seguir a partir de 01/09.

<Callout icon="ℹ️" theme="info">
  Saiba mais sobre essa funcionalidade <a href="https://docs.cielo.com.br/ecommerce-cielo/docs/pix-cielo" target="_blank">na documentação</a>.
</Callout>

> ℹ️ CNPJs alfanuméricos serão implementados pela Receita Federal em julho de 2026
>
> Essa mudança afeta apenas novas inscrições, **não havendo mudanças em CNPJs existentes**.
>
> O CNPJ alfanumérico **já está sendo suportado pela Cielo**, sem mudanças na sua integração.
>
> Recomendamos verificar a necessidade de possíveis ajustes nos sistemas próprios de checkout de sua loja.

Para gerar um **QR code Pix** através da API E-commerce Cielo, faça a integração conforme a especificação a seguir.

O campo obrigatório `Payment.Type` deve ser enviado como "Pix". A resposta da requisição irá retornar o código base64 da imagem do QR Code Pix, que a loja deverá disponibilizar ao comprador.

<Callout icon="⚠️" theme="warn">
  O tempo de expiração máximo do QR Code Pix pela Cielo é 24 horas. Esse tempo de expiração pode ser alterado no campo `Payment.QrCode.Expiration`.

  Se o pagamento não for realizado, a transação permanece com o status "12 - Pendente" mesmo após a expiração do QR Code Pix. Para alterar o status para "Cancelado", siga o fluxo de <a href="https://docs.cielo.com.br/ecommerce-cielo/reference/cielo2-remover-um-qr-code-pix" target="_blank">remoção do QR Code Pix</a>.
</Callout>

<br />

## Requisição

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
    "MerchantOrderId": "123456789asdf",
    "Customer": {
        "Name": "Aline de Souza",
        "Identity": "066...",
        "IdentityType": "CPF"
    },
    "Payment": {
        "Type": "Pix",
        "Provider": "Cielo2",
        "Amount": 100,
        "QrCode": {
            "Expiration": 86400
        }
    }
}
```

**Parâmetros do cabeçalho**

| Propriedade   | Descrição                                                                                          | Tipo   | Tamanho | Obrigatório |
| ------------- | -------------------------------------------------------------------------------------------------- | ------ | ------- | ----------- |
| `MerchantId`  | Identificador da loja na API E-commerce Cielo.                                                     | GUID   | 36      | Sim         |
| `MerchantKey` | Chave pública para autenticação dupla na API E-commerce Cielo.                                     | string | 40      | Sim         |
| `RequestId`   | Identificador da requisição, usado quando a loja usa diferentes servidores para cada GET/POST/PUT. | GUID   | 36      | Não         |

**Parâmetros do corpo**

<Table align={["left","left","left"]}>
  <thead>
    <tr>
      <th>
        Campo
      </th>

      <th>
        Tipo
      </th>

      <th>
        Descrição
      </th>
    </tr>
  </thead>

  <tbody>
    <tr>
      <td>
        `MerchantOrderId`
      </td>

      <td>
        string
      </td>

      <td>
        Número de identificação do pedido.  Caracteres especiais não são permitidos.  
        Tamanho: 25
      </td>
    </tr>

    <tr>
      <td>
        `Customer.Name`
      </td>

      <td>
        string
      </td>

      <td>
        Nome do comprador.  
        Tamanho: 255.
      </td>
    </tr>

    <tr>
      <td>
        `Customer.Identity`
      </td>

      <td>
        string
      </td>

      <td>
        Número do CPF ou CNPJ do comprador.  
        Tamanho: 14.  
        **Permite envio de CNPJs alfanuméricos.**
      </td>
    </tr>

    <tr>
      <td>
        `Payment.Type`
      </td>

      <td>
        string
      </td>

      <td>
        Tipo do meio de pagamento. Neste caso, insira “_Pix_”.  
        Tamanho: 15.
      </td>
    </tr>

    <tr>
      <td>
        `Payment.Provider`
      </td>

      <td>
        string
      </td>

      <td>
        Nome do provedor do meio de pagamento. Neste caso, “_Cielo2_”.
      </td>
    </tr>

    <tr>
      <td>
        `Payment.Amount`
      </td>

      <td>
        number
      </td>

      <td>
        Valor do pedido, em centavos.
      </td>
    </tr>

    <tr>
      <td>
        `Payment.QrCode`
      </td>

      <td>
        object
      </td>

      <td>
        Objeto contendo informações adicionais para o QR Code.
      </td>
    </tr>

    <tr>
      <td>
        `Payment.QrCode.Expiration`
      </td>

      <td>
        number
      </td>

      <td>
        Tempo de expiração do QR Code, em segundos. (Ex: 30 minutos = 1800).

        O envio é opcional. Caso não seja informado, o valor padrão será 86400 segundos (24 horas).
      </td>
    </tr>
  </tbody>
</Table>

## Resposta

```json
{
    "MerchantOrderId": "********************************",
    "Customer": {
        "Name": "Aline de Souza",
        "Identity": "066....",
        "IdentityType": "CPF"
    },
    "Payment": {
        "QrCode": {
            "Expiration": 86400
        },
        "QrCodeBase64Image": "iVBg3[...]",
        "QrCodeString": "00020[...]",
        "SentOrderId": "********************************",
        "Amount": 100,
        "ReceivedDate": "2024-11-28 16:29:52",
        "Provider": "Cielo2",
        "Status": 12,
        "IsSplitted": false,
        "ReturnMessage": "QRCode gerado com sucesso",
        "ReturnCode": "0",
        "PaymentId": "********-****-****-****-************",
        "Type": "Pix",
        "Currency": "BRL",
        "Country": "BRA",
        "Links": [
            {
                "Method": "GET",
                "Rel": "self",
                "Href": "https://apiquerysandbox.cieloecommerce.cielo.com.br/1/sales/********-****-****-****-************"
            }
        ]
    }
}
```

**Parâmetros da resposta**

A tabela a seguir apresenta os principais parâmetros que podem ser retornados pela API na geração de um QR code para pagamento em Pix:

| Campo                       | Tipo   | Descrição                                                       |
| :-------------------------- | :----- | :-------------------------------------------------------------- |
| `Payment.QrCodeBase64Image` | string | Base64 da imagem do QRCode gerado para pagamento do Pix.        |
| `Payment.QrCodeString`      | string | Código do Pix (copia e cola) que pode ser usado para pagamento. |
| `Payment.SentOrderId`       | string | Identificador da transação Pix, representa o `txid`.            |
| `Payment.ReturnCode`        | string | Código de retorno.                                              |
| `Payment.ReturnMessage`     | string | Mensagem de retorno.                                            |
| `Payment.PaymentId`         | string | Identificador da transação usado para consulta.                 |

<br />

> A nova integração Pix ainda não tem ambiente sandbox disponível.

## Mudanças nos campos

Confira as mudanças nos campos retornados ao atualizar o provedor Cielo para *Cielo2*:

| Campos                      | Integração anterior                                                                      | Integração nova (Cielo2)                                                                                                                                            |
| :-------------------------- | :--------------------------------------------------------------------------------------- | :------------------------------------------------------------------------------------------------------------------------------------------------------------------ |
| `Payment.QrCode.Expiration` | Não existia. Anteriormente o tempo padrão de expiração do QR Code Pix era de duas horas. | Representa o tempo de expiração do QR Code Pix em segundos e pode ser determinado pela loja. Caso não seja informado, o tempo de expiração padrão será de 24 horas. |
| `Tid`                       | Representava o ID do QR Code.                                                            | Passou a representar o `txid`.                                                                                                                                      |
| `ProofOfSale`               | Representava o NSU do Pix.                                                               | Não existe mais.                                                                                                                                                    |
| `SentOrderId`               | Representava o `Ecommerce Order Id`                                                      | Passou a representar o `txid`.                                                                                                                                      |

Os demais campos se mantém iguais.