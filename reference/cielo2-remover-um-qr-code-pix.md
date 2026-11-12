---
updatedAt: 2025-10-30T01:15:36.000Z
agentTools:
  siteIndex: https://docs.cielo.com.br/llms.txt
  projectIndex: https://docs.cielo.com.br/ecommerce-cielo/llms.txt
---

# Remover um QR Code Pix

Válido para a integração com o provider "Cielo2".

> ✅ Essa é a nova integração Pix que você deve seguir a partir de 01/09.

> ℹ️
>
> Saiba mais sobre essa funcionalidade <a href="https://docs.cielo.com.br/ecommerce-cielo/docs/pix-cielo"
> target="_blank">na documentação</a>.

É possível remover um QR Code Pix já gerado caso ele não tenha sido pago. Caso o Pix tenha sido pago, veja <a href="https://docs.cielo.com.br/ecommerce-cielo/reference/devolucao-cielo2" target="_blank">como solicitar uma devolução Pix</a>.

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
          <span class="rm-APIMethod APIMethod APIMethod_fixedWidth APIMethod_put headline-container-api-method1Hc-Fm7uaccR" data-testid="http-method">put</span>
        </div>
      </td>

      <td>
        `https://api.cieloecommerce.cielo.com.br/1/sales/{PaymentId}/void`
      </td>
    </tr>
  </tbody>
</Table>

**Parâmetros do path**

| Campo       | Tipo   | Descrição                                                                                        |
| :---------- | :----- | :----------------------------------------------------------------------------------------------- |
| `PaymentId` | string | Número de identificação do pagamento, retornado pela API na criação do QR Code Pix. Tamanho: 36. |

**Parâmetros do cabeçalho**

| Propriedade   | Descrição                                                                                          | Tipo   | Tamanho | Obrigatório |
| ------------- | -------------------------------------------------------------------------------------------------- | ------ | ------- | ----------- |
| `MerchantId`  | Identificador da loja na API E-commerce Cielo.                                                     | GUID   | 36      | Sim         |
| `MerchantKey` | Chave pública para autenticação dupla na API E-commerce Cielo.                                     | string | 40      | Sim         |
| `RequestId`   | Identificador da requisição, usado quando a loja usa diferentes servidores para cada GET/POST/PUT. | GUID   | 36      | Não         |

## Resposta

```json
{
    "Status": 2,
    "ReasonCode": 8,
    "ReasonMessage": "Scheduled",
    "ProviderReturnCode": "0",
    "ProviderReturnMessage": "QRCode Pix removido com sucesso",
    "ReturnCode": "0",
    "ReturnMessage": "QRCode Pix removido com sucesso",
    "Links": [
        {
            "Method": "GET",
            "Rel": "self",
            "Href": "https://apiquerysandbox.cieloecommerce.cielo.com.br/1/sales/b8c1b2ea-e06a-4135-9389-8bdbdccacd20"
        },
        {
            "Method": "PUT",
            "Rel": "void",
            "Href": "https://apisandbox.cieloecommerce.cielo.com.br/1/sales/b8c1b2ea-e06a-4135-9389-8bdbdccacd20/void"
        }
    ]
}
```

<br />

> A nova integração Pix ainda não tem ambiente sandbox disponível.

A tabela a seguir apresenta os principais parâmetros que podem ser retornados pela API na remoção de um QR Code Pix:

| Campo                   | Tipo   | Descrição                        |
| :---------------------- | :----- | :------------------------------- |
| `Status`                | number | Status da transação.             |
| `ReasonCode`            | number | Código de retorno.               |
| `ReasonMessage`         | number | Mensagem de retorno.             |
| `ProviderReturnCode`    | number | Código de retorno do provedor.   |
| `ProviderReturnMessage` | string | Mensagem de retorno do provedor. |