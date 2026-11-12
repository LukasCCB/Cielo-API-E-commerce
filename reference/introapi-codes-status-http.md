---
updatedAt: 2026-07-23T20:21:37.000Z
agentTools:
  siteIndex: https://docs.cielo.com.br/llms.txt
  projectIndex: https://docs.cielo.com.br/ecommerce-cielo/llms.txt
---

# Códigos retornados pela API E‑commerce (HTTP, status e códigos de negócio)

## Estrutura geral dos códigos retornados pela API E-commerce

A API E-commerce usa uma estrutura de múltiplos códigos de retorno para fornecer um resultado detalhado sobre cada requisição. É fundamental entender que o sucesso na comunicação HTTP (código 2xx) não garante o sucesso da transação (autorização, captura, etc.). É necessário verificar também os códigos no corpo (body) da resposta.

O fluxograma a seguir ilustra a estrutura geral de retornos da API, exibindo a diferença entre sucesso técnico (HTTP) e resultado da operação:

![](https://files.readme.io/62f241f04cde7a7ff83b1b0ca7721f3fbc4b034eaa0549f616822d01a9c37acb-TW_-_E-commerce_API_Mapping_-_Copy_of_Caminho_da_requisio.jpg)

Se você está começando agora, use esta tabela como guia principal e consulte as seções específicas linkadas ao final da página para mais detalhes:

## Resumo dos códigos da API E-commerce

A tabela a seguir apresenta um resumo geral sobre os códigos retornados pela API E-commerce:

| Tipo de código                                                                                                  | Onde retorna (parâmetro)                       | Quando retorna                                                                                                                                                                                                                                                                          | Exemplos                                                                                                                                                                    | Observação                                                                                                                                                                                                                                                                                                                                            |
| :-------------------------------------------------------------------------------------------------------------- | :--------------------------------------------- | :-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- | :-------------------------------------------------------------------------------------------------------------------------------------------------------------------------- | :---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| [**Status HTTP**](https://docs.cielo.com.br/ecommerce-cielo/reference/http-status)                              | Cabeçalho da resposta                          | Retorna em toda resposta a uma requisição feita à API                                                                                                                                                                                                                                   | 200 – OK<br />201 – Criada<br />401 – Unauthorized                                                                                                                          | 4xx/5xx indicam falha na requisição ou no servidor (a API recebeu a chamada, mas não conseguiu processá‑la); confira `Code` `Message` quando presentes.<br />Os retornos 200 e 201 significam que a Cielo recebeu a requisição e deu uma resposta, mas é necessário verificar o `ReturnCode` e `ReturnMessage` para saber se é uma resposta positiva. |
| [**Erros da API**](https://docs.cielo.com.br/ecommerce-cielo/update/reference/api-errors-code-message)          | `Code` e<br /> `Message`                       | Retorna quando há um erro HTTP                                                                                                                                                                                                                                                          | Informar um MerchantKey inválido irá retornar código HTTP 400 e o `Code` = 123 com `Message` igual à *"MerchantKey is invalid"*.                                            | Podem ser os mesmos valores retornados em `ReturnCode` e `ReturnMessage` ou `ReasonCode` e `ReasonMessage`                                                                                                                                                                                                                                            |
| [**Status da transação**](https://docs.cielo.com.br/ecommerce-cielo/reference/payment-status)                   | `Payment.Status`                               | Nas operações relacionadas à criação e/ou consulta de transações (depois de a transação ter sido criada, ou seja, deverá ter um 201 criado). <br />- Criação de transação<br />- Consulta de transação<br />- Cancelamento de transação                                                 | `Payment.Status` = 2 indica que o pagamento foi confirmado.                                                                                                                 | --                                                                                                                                                                                                                                                                                                                                                    |
| [**Código de retorno das vendas**](https://docs.cielo.com.br/ecommerce-cielo/reference/api-codes)               | `ReturnCode` e `ReturnMessage`                 | Em qualquer operação\*, quando há um HTTP de sucesso. Na criação de transações, pode retornar um [código da Abecs]().  <br />- Criação de transações<br /> - Cancelamento <br /> e Captura                                                                                              | **Exemplo de sucesso:** `ReturnCode` = 00 e `ReturnMessage` = *Transacao autorizada* <br />**Exemplo de erro:** `ReturnCode` = 51 e  `ReturnMessage` = *Autorizacao negada* | Quando o retorno HTTP é de sucesso (200 ou 201), ainda assim pode ter acontecido outro erro ou pendência, que deve ser verificado pelo `ReturnCode` e `ReturnMessage`                                                                                                                                                                                 |
| [**Código de retorno do provedor de pagamento**](https://docs.cielo.com.br/ecommerce-cielo/reference/api-codes) | `ProviderReturnCode` e `ProviderReturnMessage` | Em operações que têm provedor envolvido, como Pix e Conversor de Moedas, ou na captura, onde representa a resposta do autorizador da Cielo.<br />  - Conversor de moedas e-commerce<br />- Novo Pix (devolução e remoção QR Code)<br />- Cancelamento de transação de cartão de crédito | `ProviderReturnCode` = *0* e `ProviderReturnMessage` = *Devolução solicitada com sucesso* (devolução Pix)                                                                   | Quando o retorno HTTP é de sucesso (200 ou 201), ainda assim pode ter acontecido outro erro ou pendência, que deve ser verificado pelo `ProviderReturnCode` e `ProviderReturnMessage`                                                                                                                                                                 |
| [**Códigos de motivo do retorno**](https://docs.cielo.com.br/ecommerce-cielo/reference/api-codes)               | `ReasonCode` e `ReasonMessage`                 | -Captura;<br />-Cancelamento;<br />-Conversão de moedas;<br />-Criação de pagamento com boleto.                                                                                                                                                                                         | Exemplo de sucesso: `ReasonCode` = 0 e `ReasonMessage` = *Operation Successful*<br /> Exemplo de erro: `ReasonCode` = 7 e `ReasonMessage` = *Denied*                        | Quando o retorno HTTP é de sucesso (200 ou 201), ainda assim pode ter acontecido outro erro ou pendência, que deve ser verificado pelo `ReasonCode` e `ReasonMessage`                                                                                                                                                                                 |

\**A operação de consulta normalmente não retorna&#x20;*`ReturnCode`*&#x20;ou&#x20;*`ReasonCode`*&#x20;e suas respectivas mensagens.*

<Callout icon="ℹ️" theme="info">
  A API também pode retornar códigos relacionados a operações e funcionalidades específicas, como captura, cancelamento, transações de Pix, recorrentes ou com análise de fraude.
</Callout>

### Exemplo da resposta de uma transação de cartão de crédito autorizada

A API retorna na resposta da transação de cartão de crédito todos os parâmetros enviados na requisição e também parâmetros exclusivos da resposta, como:

* Parâmetros relacionados à conciliação da transação, como o `Tid`, `SentOrderId` e `ProofOfSale`;
* Status da transação, no parâmetro `Payment.Status`;
* `Payment.ReturnCode` e `Payment.ReturnMessage`, que representam os retornos do fluxo de autorização e indicam se a transação foi bem-sucedida ou não;

`Links`, que indicam quais operações ainda podem ser executadas para essa transação, como captura, consulta e cancelamento.

```json
{
  "MerchantOrderId": "Pedido123456",
  "Customer": {
    "Name": "Pessoa Compradora",
    "Identity": "11122233344",
  },
  "Payment": {
    "Installments": 1,
    "Capture": false,
    "CreditCard": {
      "CardNumber": "123412******1234",
      "Holder": "Comprador Teste",
      "ExpirationDate": "12/2030",
      "SaveCard": false,
      "Brand": "Visa",
      "PaymentAccountReference": "ENCIVBXH61S4EIC6IKMAQHD30FE8X"
    },
    "Tid": "1104045449792",
    "ProofOfSale": "755991",
    "AuthorizationCode": "274780",
    "SentOrderId": "Pedido123456",
    "Amount": 10000,
    "ReceivedDate": "2025-11-04 16:54:49",
    "Status": 1,
    "ReturnMessage": "Operation Successful",
    "ReturnCode": "4",
    "PaymentId": "5f675bb7-8091-490e-b7d4-8d83a46fddd2",
    "Type": "CreditCard",
    "Currency": "BRL",
    "Country": "BRA",
    "Links": [
      {
        "Method": "GET",
        "Rel": "self",
        "Href": "https://apiquerysandbox.cieloecommerce.cielo.com.br/1/sales/5f675bb7-8091-490e-b7d4-8d83a46fddd2"
      },
      {
        "Method": "PUT",
        "Rel": "capture",
        "Href": "https://apisandbox.cieloecommerce.cielo.com.br/1/sales/5f675bb7-8091-490e-b7d4-8d83a46fddd2/capture"
      },
      {
        "Method": "PUT",
        "Rel": "void",
        "Href": "https://apisandbox.cieloecommerce.cielo.com.br/1/sales/5f675bb7-8091-490e-b7d4-8d83a46fddd2/void"
      }
    ]
  }
}
```

<br />

<br />

***

## Próximas seções

<Cards columns={3}>
  <Card title="Códigos HTTP da API" href="https://docs.cielo.com.br/ecommerce-cielo/reference/http-status" icon="fa-globe">
    Entenda os códigos HTTP retornados pela API e o que eles realmente indicam sobre o sucesso ou falha da comunicação com a Cielo.
  </Card>

  <Card title="Status da transação (ciclo de vida do pagamento)" href="https://docs.cielo.com.br/ecommerce-cielo/reference/payment-status" icon="fa-sync-alt">
    Conheça os status transacionais que representam o ciclo de vida de um pagamento, da criação até a confirmação do pagamento, cancelamento ou estorno.
  </Card>

  <Card title="Códigos de retorno de negócio" href="https://docs.cielo.com.br/ecommerce-cielo/update/reference/api-codes" icon="fa-triangle-exclamation">
    Consulte os códigos de retorno de negócio usados para identificar sucesso, negação ou pendência em operações de pagamento nos campos `RetunCode` e `ReturnMessage`.
  </Card>

  <Card title="Erros técnicos da API" href="https://docs.cielo.com.br/ecommerce-cielo/update/reference/api-errors-code-message" icon="fa-triangle-exclamation">
    Saiba como identificar e tratar erros técnicos da API retornados em respostas HTTP de erro, nos campos `Code` e `Message`.
  </Card>

  <Card title="Padrão de retorno Abecs" href="https://docs.cielo.com.br/ecommerce-cielo/page/abecs" icon="fa-credit-card">
    Consulte os códigos de retorno das bandeiras padronizados pela Abecs, e saiba como interpretá‑los nas respostas da API.
  </Card>

  <Card title="Programas de retentativas das bandeiras" href="https://docs.cielo.com.br/ecommerce-cielo/reference/retentativa-bandeira" icon="fa-rotate-right">
    Entenda quando é permitido reenviar uma transação de cartão negada e como funcionam os programas de retentativas definidos pelas bandeiras.
  </Card>
</Cards>

### Códigos de retorno e status específicos

<Cards>
  <Card title="Status da recorrência de cartão de crédito" href="https://docs.cielo.com.br/ecommerce-cielo/reference/lista-status-recorrencia" icon="fa-calendar" />

  <Card title="Status do Antifraude" href="https://docs.cielo.com.br/ecommerce-cielo/reference/lista-de-status-do-antifraude" icon="fa-shield-check" />

  <Card title="Códigos de retorno do cancelamento" href="https://docs.cielo.com.br/ecommerce-cielo/reference/codigos-retorno-cancelamento" icon="fa-undo" />
</Cards>

<br />