---
updatedAt: 2026-01-08T19:18:11.000Z
agentTools:
  siteIndex: https://docs.cielo.com.br/llms.txt
  projectIndex: https://docs.cielo.com.br/ecommerce-cielo/llms.txt
---

# Atualizações nos campos Pix

Válido para a integração com o provedor "Cielo2".

<Callout icon="ℹ️" theme="info">
  Saiba mais sobre essa funcionalidade <a href="https://docs.cielo.com.br/ecommerce-cielo/docs/pix-cielo" target="\_blank">na documentação</a>.
</Callout>

> ⚠️ Nova integração Pix na Cielo
>
> A partir de 01/09/2025, novas integrações de Pix serão feitas com o novo provedor de Pix na Cielo, o `Cielo2`. Saiba mais sobre a <a href="https://docs.cielo.com.br/ecommerce-cielo/docs/pix-cielo" target="_blank">nova integração de Pix na Cielo</a>.

O Pix na Cielo foi atualizado e recomendamos migrar para a nova integração. As principais atualizações são:

* Será necessário enviar o `Payment.Provider` com o valor **Cielo2**;
* **Identificação do pagamento**: o pagamento será identificado pelos campos `SentOrderId` e  `AcquirerOrderId`, que representam o `txid`, e `EndToEndId`:
  * `txid`: é o identificador da criação do pedido de pagamento, retorna como `SentOrderId` na criação do QR Code Pix e como `AcquirerOrderId` ao consultar uma transação Pix;
  * `EndToEndId`: é o identificador do Pix pago, retorna como `EndToEndId` na consulta de uma transação de Pix **paga** e como `AuthorizationCode` na devolução de uma transação Pix.
* **Conciliação das transações Pix**: com as últimas atualizações, a loja poderá usar os valores de `EndToEndId` e `txid` para a conciliação.

## Campos retornados na geração de QR Code Pix

Confira a relação das atualizações nos campos retornados na geração de QR Code Pix:

| Campos                      | Integração anterior                                                                      | Integração nova (Cielo2)                                                                                                                                            |
| :-------------------------- | :--------------------------------------------------------------------------------------- | :------------------------------------------------------------------------------------------------------------------------------------------------------------------ |
| `Payment.QrCode.Expiration` | Não existia. Anteriormente o tempo padrão de expiração do QR Code Pix era de duas horas. | Representa o tempo de expiração do QR Code Pix em segundos e pode ser determinado pela loja. Caso não seja informado, o tempo de expiração padrão será de 24 horas. |
| `Tid`                       | Representava o ID do QR Code.                                                            | Passou a representar o `txid`.                                                                                                                                      |
| `ProofOfSale`               | Representava o NSU do Pix.                                                               | Não existe mais.                                                                                                                                                    |
| `SentOrderId`               | Representava o `Ecommerce Order Id`                                                      | Passou a representar o `txid`.                                                                                                                                      |

Os demais campos se mantém iguais.

## Campos retornados na consulta de uma transação Pix

Confira a relação das atualizações nos campos retornados na consulta de uma transação Pix:

| Campos            | Integração anterior                 | Integração nova (Cielo2)                |
| :---------------- | :---------------------------------- | :-------------------------------------- |
| `AcquirerOrderId` | Representava o `Ecommerce Order Id` | Passou a representar o `txid`           |
| `Tid`             | Representava o ID do QR Code.       | Não existe mais.                        |
| `ProofOfSale`     | Representava o NSU do Pix.          | Não existe mais.                        |
| `EndToEndId`      | Não existia.                        | Representa o identificador do Pix pago. |

Os demais campos se mantém iguais.

## Campos retornados na devolução de um Pix

Confira a relação das atualizações nos campos retornados na devolução de um Pix:

| Campos              | Integração anterior           | Integração nova (Cielo2)                    |
| :------------------ | :---------------------------- | :------------------------------------------ |
| `Tid`               | Representava o ID do QR Code. | Não existe mais.                            |
| `ProofOfSale`       | Representava o NSU do Pix.    | Não existe mais.                            |
| `AuthorizationCode` | Não existia.                  | Representa o `EndToEndId` da transação Pix. |