---
updatedAt: 2026-10-14T14:48:31.000Z
agentTools:
  siteIndex: https://docs.cielo.com.br/llms.txt
  projectIndex: https://docs.cielo.com.br/ecommerce-cielo/llms.txt
---

# Nova integração do Pix na Cielo

<Callout icon="✅" theme="okay">
  ### Essa é a nova integração Pix que você deve seguir a partir de 01/09.
</Callout>

## Pix na Cielo

No **Pix**, a transmissão da ordem de pagamento e a disponibilidade de fundos para o recebedor ocorrem em tempo real, 24 horas por dia e sem a necessidade de intermediários. Sendo assim, é um meio que viabiliza pagamentos rápidos e com menores custos de transação.

## Atualização do Pix na Cielo

A Cielo está disponibilizando uma **nova integração** com o Pix para o e-commerce. As principais novidades estão no valor do provedor, no tempo de expiração do QR Code e nos campos retornados:

* Será necessário enviar o `Payment.Provider` com o valor **Cielo2**;
* O tempo de expiração do QR Code, que anteriormente era de duas horas, poderá ser configurado pela loja no campo `Payment.QrCode.Expiration`;
* **Identificação do pagamento**: o pagamento será identificado pelos campos `SentOrderId` e  `AcquirerOrderId`, que representam o `txid`, e `EndToEndId`:
  * `txid`: é o identificador da criação do pedido de pagamento, retorna como `SentOrderId` na criação do QR Code Pix e como `AcquirerOrderId` ao consultar uma transação Pix;
  * `EndToEndId`: é o identificador do Pix pago, retorna como `EndToEndId` na consulta de uma transação de Pix **paga** e como `AuthorizationCode` na devolução de uma transação Pix.
* **Conciliação das transações Pix**: com as últimas atualizações, a loja poderá usar os valores de `EndToEndId` e `txid` para a conciliação.

<Callout icon="⚠️" theme="warn">
  Os campos podem aparecer de formas diferentes dependendo da operação, veja as <a href="https://docs.cielo.com.br/ecommerce-cielo/reference/de-para-pix" target="_blank">atualizações dos campos na Referência da API</a>.
</Callout>

### Como atualizar o provedor do Pix na Cielo

Para atualizar o provedor de Pix na Cielo, é necessário enviar o campo `Payment.Provider` com o valor **Cielo2**. Veja como deve ficar a requisição de geração de QR Code Pix após a atualização do provedor:

```json
{
    "MerchantOrderId": "123456789asdf",
    "Customer": {
        "Name": "Lorem Ipsum",
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

<br />

<br />

<Callout icon="ℹ️" theme="info">
  ### Operações da API

  * <a href="https://docs.cielo.com.br/ecommerce-cielo/reference/cielo2-gerar-qr-code-pix" target="_blank">Gerar QR Code Pix</a>;
  * <a href="https://docs.cielo.com.br/ecommerce-cielo/reference/cielo2-remover-um-qr-code-pix" target="_blank">Remover um QR Code Pix</a>;
  * <a href="https://docs.cielo.com.br/ecommerce-cielo/reference/consulta-cielo2" target="_blank">Consultar uma transação Pix</a>;
  * <a href="https://docs.cielo.com.br/ecommerce-cielo/reference/devolucao-cielo2" target="_blank">Solicitar devolução de transação Pix</a>;
  * <a href="https://docs.cielo.com.br/ecommerce-cielo/reference/de-para-pix" target="_blank">Atualizações nos campos Pix</a>.
</Callout>

<br />

<Callout icon="ℹ️" theme="info">
  * A nova integração Pix ainda não está disponível em ambiente sandbox.
  * Bradesco e Banco do Brasil não são compatíveis como provedores de Pix nessa integração.
</Callout>