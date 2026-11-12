---
updatedAt: 2025-10-30T01:15:45.000Z
agentTools:
  siteIndex: https://docs.cielo.com.br/llms.txt
  projectIndex: https://docs.cielo.com.br/ecommerce-cielo/llms.txt
---

# Consultar transação de Pix

Válido para a integração com o provedor "Cielo2".

> ℹ️
>
> Saiba mais sobre essa funcionalidade <a href="https://docs.cielo.com.br/ecommerce-cielo/docs/pix-cielo" target="_blank">na documentação</a>.

Na nova integração de Pix não há mudanças na requisição de consulta, mas sim nos campos retornados na resposta. Confira o detalhes a seguir.

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
        Sandbox
      </td>

      <td>
        <div class="headline-container-article-info2GaOf2jMpV0r"><span class="rm-APIMethod APIMethod APIMethod_fixedWidth APIMethod_get headline-container-api-method1Hc-Fm7uaccR" data-testid="http-method">get</span></div>
      </td>

      <td>
        `https://apiquerysandbox.cieloecommerce.cielo.com.br/1/sales/{PaymentId}`
      </td>
    </tr>

    <tr>
      <td>
        Produção
      </td>

      <td>
        <div class="headline-container-article-info2GaOf2jMpV0r"><span class="rm-APIMethod APIMethod APIMethod_fixedWidth APIMethod_get headline-container-api-method1Hc-Fm7uaccR" data-testid="http-method">get</span></div>
      </td>

      <td>
        `https://apiquery.cieloecommerce.cielo.com.br/1/sales/{PaymentId}`
      </td>
    </tr>
  </tbody>
</Table>

**Parâmetro do path**

| Campo       | Tipo   | Descrição                                                                                        |
| :---------- | :----- | :----------------------------------------------------------------------------------------------- |
| `PaymentId` | string | Número de identificação do pagamento, retornado pela API na criação do QR Code Pix. Tamanho: 36. |

**Parâmetros do cabeçalho**

| Propriedade   | Descrição                                                                                          | Tipo   | Tamanho | Obrigatório |
| ------------- | -------------------------------------------------------------------------------------------------- | ------ | ------- | ----------- |
| `MerchantId`  | Identificador da loja na API E-commerce Cielo.                                                     | GUID   | 36      | Sim         |
| `MerchantKey` | Chave pública para autenticação dupla na API E-commerce Cielo.                                     | string | 40      | Sim         |
| `RequestId`   | Identificador da requisição, usado quando a loja usa diferentes servidores para cada GET/POST/PUT. | GUID   | 36      | Não         |

<br />

## Resposta

```json
{
    "MerchantOrderId": "********************************",
    "AcquirerOrderId": "********************************",
    "Customer": {
        "Name": "Aline de Souza",
        "Identity": "***********",
        "Address": {}
    },
    "Payment": {
        "Installments": 1,
        "PaymentId": "********-****-****-****-************",
        "EndToEndId": "E010...",
        "Type": "Pix",
        "Amount": 457,
        "ReceivedDate": "2024-12-02 11:15:39",
        "Currency": "BRL",
        "Country": "BRA",
        "Status": 2,
        "Links": [
            {
                "Method": "GET",
                "Rel": "self",
                "Href": "https://apiquerysandbox.cieloecommerce.cielo.com.br/1/sales/660589f1-1076-4c8e-80fd-b001942f8915"
            }
        ]
    }
}
```

A tabela a seguir apresenta os principais parâmetros que podem ser retornados pela API na consulta de uma transação Pix:

| Campo                | Tipo   | Descrição                                                                           |
| :------------------- | :----- | :---------------------------------------------------------------------------------- |
| `AcquirerOrderId`    | string | Número de identificação do pedido enviado para o provedor. **Representa o`txid`** . |
| `Payment.PaymentId`  | string | Identificador da transação.                                                         |
| `Payment.EndToEndId` | string | Identificador de um Pix pago.                                                       |
| `Payment.Status`     | number | Status da transação.                                                                |

## Mudanças nos campos

Confira as mudanças nos campos retornados na consulta ao atualizar o provedor Cielo para *Cielo2*:

| Campos            | Integração anterior                 | Integração nova (Cielo2)                |
| :---------------- | :---------------------------------- | :-------------------------------------- |
| `AcquirerOrderId` | Representava o `Ecommerce Order Id` | Passou a representar o `txid`           |
| `Tid`             | Representava o ID do QR Code.       | Não existe mais.                        |
| `ProofOfSale`     | Representava o NSU do Pix.          | Não existe mais.                        |
| `EndToEndId`      | Não existia.                        | Representa o identificador do Pix pago. |

Os demais campos se mantém iguais.