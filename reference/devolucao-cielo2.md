---
updatedAt: 2025-12-02T14:14:36.000Z
agentTools:
  siteIndex: https://docs.cielo.com.br/llms.txt
  projectIndex: https://docs.cielo.com.br/ecommerce-cielo/llms.txt
---

# Solicitar devolução de transação Pix

<Callout icon="ℹ️" theme="info">
  Saiba mais sobre essa funcionalidade <a href="https://docs.cielo.com.br/ecommerce-cielo/docs/pix-cielo" target="_blank">na documentação</a>.
</Callout>

<br />

Caso a sua loja precise cancelar uma transferência Pix, é possível realizar uma operação chamada de **devolução**. É importante ressaltar que a devolução não é uma operação instantânea, podendo ser acatada ou não pelo provedor Pix. Quando uma devolução é acatada, uma [notificação](https://docs.cielo.com.br/ecommerce-cielo/docs/webhook) será enviada para a sua loja.

<Callout icon="⚠️" theme="warn">
  * É necessário que o comprador (usuário pagador) solicite para a loja (usuário recebedor) a devolução total ou parcial de um pagamento realizado, via algum meio de comunicação adequado;
  * A loja (usuário recebedor) concorda e identifica o pagamento original realizado pelo Pix.
</Callout>

**Quando posso solicitar uma devolução Pix?**

É possível solicitar uma devolução Pix quando, por exemplo, houver devolução do produto, erro na cobrança e indisponibilidade do produto em estoque.

**Quem solicita a devolução Pix pela API E-commerce Cielo?**

A loja (vendedor que recebeu a transação Pix) é quem solicita a devolução à API E-commerce Cielo, em acordo com o comprador. É importante se atentar aos prazos (de acordo com regulamento do Banco Central).

**Como solicitar à devolução Pix?**

Via [API E-commerce Cielo](https://docs.cielo.com.br/ecommerce-cielo/docs/sobre-api-ecommerce) ou App Cielo Gestão.

### Regras para devolução Pix

* A devolução ocorrerá somente se houver saldo;
* Para transferências, vendas e demais transações com o Pix o prazo para cancelamento é de 90 dias, conforme especificação do BACEN;
* É necessário que a conta transitória de Pix na Cielo seja do tipo **transferência programada** ou **conta Cielo**;
* Os clientes que optarem pela **transferência automática não terão saldo** em conta de pagamento. Com isso não será possível efetuar a devolução com sucesso, e o retorno será “*Lojista com saldo insuficiente para devolução*”.

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
        <div class="headline-container-article-info2GaOf2jMpV0r">
          <span class="rm-APIMethod APIMethod APIMethod_fixedWidth APIMethod_put headline-container-api-method1Hc-Fm7uaccR" data-testid="http-method">put</span>
        </div>
      </td>

      <td>
        `https://apisandbox.cieloecommerce.cielo.com.br/1/sales/{PaymentId}/void`
      </td>
    </tr>

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

> ⚠️ Devolução parcial
>
> Para realizar uma devolução parcial, é necessário incluir o parâmetro `Amount` no path. Esse parâmetro define o valor que será estornado, em centavos (ex: R$1,00 = 100).
>
> Em uma devolução parcial, o endpoint será:
>
> * **Sandbox**: `https://apisandbox.cieloecommerce.cielo.com.br/1/sales/{PaymentId}/void?amount={Amount}`
> * **Produção**: `https://api.cieloecommerce.cielo.com.br/1/sales/{PaymentId}/void?amount={Amount}`
>
> Caso o parâmetro `Amount`não seja  informado, o estorno será considerado total.

**Parâmetros no path**

| Campo       | Tipo   | Descrição                                                                                        |
| :---------- | :----- | :----------------------------------------------------------------------------------------------- |
| `PaymentId` | string | Número de identificação do pagamento, retornado pela API na criação do QR Code Pix. Tamanho: 36. |

**Parâmetros na query string**

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
        `Amount`
      </td>

      <td>
        string
      </td>

      <td>
        Valor do pedido de devolução. Opcional.  
        Para devolução total, não é necessário informar o valor (`Amount`).  
        Para devolução parcial, informe o valor desejado para devolução em (`Amount`), que deve ser inferior ao valor total da transação.
      </td>
    </tr>
  </tbody>
</Table>

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
    "ProviderReturnMessage": "Devolução solicitada com sucesso",
    "ReturnCode": "0",
    "ReturnMessage": "Devolução solicitada com sucesso",
    "AuthorizationCode": "E01027058202412021928yOpJfcc9zLl",
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

A tabela a seguir apresenta os principais parâmetros que podem ser retornados pela API na devolução de um Pix:

| Campo                   | Tipo   | Descrição                                     |
| :---------------------- | :----- | :-------------------------------------------- |
| `Status`                | number | Status da transação.                          |
| `ReasonCode`            | number | Código de retorno.                            |
| `ReasonMessage`         | number | Mensagem de retorno.                          |
| `ProviderReturnCode`    | number | Código de retorno do provedor.                |
| `ProviderReturnMessage` | string | Mensagem de retorno do provedor.              |
| `AuthorizationCode`     | string | Corresponde ao `EndToEndId` da transação Pix. |

## Mudanças nos campos

Confira as mudanças nos campos retornados no estorno ao atualizar o provedor Cielo para Cielo2:

| Campos              | Integração anterior           | Integração nova (Cielo2)                    |
| :------------------ | :---------------------------- | :------------------------------------------ |
| `Tid`               | Representava o ID do QR Code. | Não existe mais.                            |
| `ProofOfSale`       | Representava o NSU do Pix.    | Não existe mais.                            |
| `AuthorizationCode` | Não existia.                  | Representa o `EndToEndId` da transação Pix. |