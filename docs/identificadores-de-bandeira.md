---
updatedAt: 2026-10-29T18:56:02.000Z
agentTools:
  siteIndex: https://docs.cielo.com.br/llms.txt
  projectIndex: https://docs.cielo.com.br/ecommerce-cielo/llms.txt
---

# Identificadores de bandeira

Algumas bandeiras de cartão retornam identificadores que permitem rastrear e correlacionar transações ao longo do ciclo de pagamento, especialmente em cenários de credenciais armazenadas (Card on File), recorrência, parcelamentos e demais transações subsequentes iniciadas pelo estabelecimento.

Esses identificadores garantem rastreabilidade, conciliação e o vínculo entre transações relacionadas. Quando utilizados corretamente, conforme as regras das bandeiras e emissores, também podem contribuir para o aumento da taxa de aprovação, pois permitem ao emissor identificar que a transação está relacionada a uma interação anterior realizada pelo portador do cartão.

Atualmente, a Cielo disponibiliza os seguintes identificadores retornados pelas bandeiras:

| Identificador              | Bandeiras                               |
| -------------------------- | --------------------------------------- |
| `IssuerTransactionId`      | Visa, Mastercard, Elo, American Express |
| `TransactionLinkId` (TLID) | Mastercard                              |

## Onde os identificadores retornam e onde são enviados

Os identificadores retornam nas respostas de Zero Auth, cartão de crédito, cartão de débito e recorrência própria, e na consulta por `PaymentId`. A loja os envia no request das transações MIT de crédito, débito e recorrência própria. O Zero Auth retorna os identificadores (apenas resposta) e não recebe `IssuerTransactionId` nem `TransactionLinkId` no request.

> **Recorrência programada:** nas transações seguintes da recorrência programada, os campos `IssuerTransactionId` e `TransactionLinkId` são enviados automaticamente.

## Quando o envio é obrigatório

Siga estas regras de envio nas transações MIT:

* `IssuerTransactionId`: obrigatório para todas as bandeiras (Visa, Mastercard, Elo e American Express) em transações recorrentes, incrementais e reautorizadas;
* `TransactionLinkId`: obrigatório na Mastercard, junto com o `IssuerTransactionId`, a partir de 23/10/2026;
* `Payment.OriginalRecurrentAmount`: obrigatório na recorrência própria, junto com o `IssuerTransactionId` e, na Mastercard, o `TransactionLinkId`.

<Callout icon="⚠️" theme="warn">
  Não envie o valor do `IssuerTransactionId` no parâmetro `TransactionLinkId`, nem o valor do `TransactionLinkId` no parâmetro `IssuerTransactionId`. Os identificadores não são intercambiáveis e o envio trocado pode impactar a conversão da venda junto à bandeira.
</Callout>

## Como usar os identificadores

Para garantir o vínculo entre transações relacionadas, as transações iniciadas pela loja (**MIT** — Merchant-Initiated Transaction) devem referenciar o identificador da transação original iniciada pelo cliente (**CIT** — Cardholder-Initiated Transaction) ou do Zero Auth, ou o da MIT anterior do ciclo. O fluxo esperado pelas bandeiras e emissores é:

1. O cliente realiza a transação CIT (ou o Zero Auth);
2. A bandeira retorna os identificadores disponíveis para aquela transação;
3. A loja armazena os identificadores retornados e os mantém disponíveis para todo o ciclo transacional;
4. Nas transações MIT subsequentes (recorrência, parcelamento, credenciais armazenadas), a loja envia os identificadores recebidos, vinculando-as à transação original;
5. O emissor utiliza essas informações para identificar o relacionamento entre as transações e aplicar suas regras de autorização.

<Callout icon="ℹ️" theme="info">
  Para mais informações sobre CIT e MIT, consulte [Indicador de início da transação - CIT e MIT](https://docs.cielo.com.br/ecommerce-cielo/page/indicador-de-in%C3%ADcio-da-transa%C3%A7%C3%A3o-cit-e-mit).
</Callout>

### Quando enviar e quando os campos retornam

O fluxograma a seguir mostra, para uma transação CIT e para as transações seguintes, quais campos a loja envia e quais campos a resposta retorna.

<CieloSequenceDiagramV1
  title="Identificadores de bandeira: transação CIT e transações seguintes"
  participants={[
    { id: 'loja', label: 'Loja', category: 'external' },
    { id: 'api', label: 'API E-commerce Cielo', category: 'cielo' },
    { id: 'bandeira', label: 'Bandeira', category: 'external' }
  ]}
  steps={[
    { type: 'phase', tone: 'primary', label: 'Transação CIT (ou Zero Auth)' },
    { from: 'loja', to: 'api', label: 'Envia a requisição da transação CIT' },
    { from: 'api', to: 'bandeira', label: 'Envia a transação para autorização' },
    {
      type: 'return', from: 'bandeira', to: 'api',
      label: 'Retorna IssuerTransactionId e TransactionLinkId'
    },
    {
      type: 'return', from: 'api', to: 'loja',
      label: 'Retorna a resposta com os identificadores'
    },
    { from: 'loja', to: 'loja', label: 'Armazena os identificadores' },

    { type: 'phase', tone: 'secondary', label: 'Transações seguintes (MIT)' },
    {
      from: 'loja', to: 'api',
      label: 'Envia a requisição com IssuerTransactionId e TransactionLinkId original'
    },
    { from: 'api', to: 'bandeira', label: 'Envia a transação com os identificadores' },
    {
      type: 'return', from: 'bandeira', to: 'api',
      label: 'Retorna a autorização e um novo TransactionLinkId'
    },
    {
      type: 'return', from: 'api', to: 'loja',
      label: 'Retorna IssuerTransactionId, SentTransactionLinkId e TransactionLinkId'
    },
    {
      type: 'note',
      label: 'Na recorrência própria, envie também Payment.OriginalRecurrentAmount. Na Mastercard, continue enviando o TransactionLinkId original da transação CIT.'
    }
  ]}
/>

#### Exemplo de request (MIT com IssuerTransactionId e TransactionLinkId)

O exemplo abaixo ilustra uma transação de crédito MIT Mastercard vinculada à transação CIT. Os valores de `IssuerTransactionId` e `TransactionLinkId` vêm da resposta da transação CIT (ou do Zero Auth), e o `TransactionLinkId` enviado deve ser sempre o **original**.

```json Request — transação de crédito MIT
curl --request POST \
  --url https://apisandbox.cieloecommerce.cielo.com.br/1/sales/ \
  --header 'Content-Type: application/json' \
  --header 'MerchantId: xxxxxxxx-xxxx-xxxx-xxxx-xxxxxxxxxxxx' \
  --header 'MerchantKey: 0123456789012345678901234567890123456789' \
  --header 'accept: application/json' \
  --data '
{
  "MerchantOrderId": "2017051001",
  "Customer": {
    "Name": "Aline de Souza"
  },
  "Payment": {
    "Type": "CreditCard",
    "Amount": 15700,
    "Installments": 1,
    "Capture": true,
    "CreditCard": {
      "CardNumber": "<CARTAO_DE_TESTE_MASTERCARD>",
      "Holder": "Aline de Souza",
      "ExpirationDate": "12/2035",
      "Brand": "Master"
    },
    "IssuerTransactionId": "580027442382078",
    "TransactionLinkId": "Xk7pQ2mR-9wLz_4TbN8vCd",
    "OriginalRecurrentAmount": 14900
  }
}'
```

<Callout icon="ℹ️" theme="info">
  Em sandbox, utilize um cartão Mastercard de teste conforme [Cartão de crédito em sandbox](https://docs.cielo.com.br/ecommerce-cielo/reference/credito-sandbox). Para ver todos os campos do request, consulte [Criar pagamento com cartão de crédito](https://docs.cielo.com.br/ecommerce-cielo/reference/criar-pagamento-credito).
</Callout>

## Identificadores disponibilizados pelas bandeiras

### IssuerTransactionId

O **IssuerTransactionId** é um identificador gerado pela bandeira ou emissor durante o processo de autorização. Ele representa a transação original no ecossistema da bandeira e deve ser utilizado para rastreabilidade e correlação de operações relacionadas ao mesmo ciclo transacional.

**Bandeiras:** Visa, Mastercard, Elo e American Express.

**Disponível em:** autorização de crédito, débito, recorrência, Zero Auth e consulta por `PaymentId`.

**Exemplos:**

O ciclo a seguir ilustra o `IssuerTransactionId` em uma venda de crédito Visa: o request da transação CIT não envia o identificador, a resposta o retorna e a transação MIT seguinte o envia.

```json Request — transação CIT
{
  "MerchantOrderId": "2017051001",
  "Customer": {
    "Name": "Aline de Souza"
  },
  "Payment": {
    "Type": "CreditCard",
    "Amount": 15700,
    "Installments": 1,
    "Capture": true,
    "CreditCard": {
      "CardNumber": "<CARTAO_DE_TESTE_VISA>",
      "Holder": "Aline de Souza",
      "ExpirationDate": "12/2035",
      "Brand": "Visa"
    }
  }
}
```
```json Resposta — transação CIT
{
  "MerchantOrderId": "2017051001",
  "Payment": {
    "Type": "CreditCard",
    "Amount": 15700,
    "Capture": true,
    "IssuerTransactionId": "580027442382078",
    "PaymentId": "6f8d1753-86bb-4dc0-9ebb-09a29093e1fb",
    "Status": 2,
    "ReturnCode": "6",
    "ReturnMessage": "Operation Successful"
  }
}
```
```json Request — transação MIT
{
  "MerchantOrderId": "2017051002",
  "Customer": {
    "Name": "Aline de Souza"
  },
  "Payment": {
    "Type": "CreditCard",
    "Amount": 15700,
    "Installments": 1,
    "Capture": true,
    "CreditCard": {
      "CardNumber": "<CARTAO_DE_TESTE_VISA>",
      "Holder": "Aline de Souza",
      "ExpirationDate": "12/2035",
      "Brand": "Visa"
    },
    "IssuerTransactionId": "580027442382078"
  }
}
```

<Callout icon="⚠️" theme="warn">
  O preenchimento do campo `IssuerTransactionId` é obrigatório, para todas as bandeiras (Visa, Mastercard, Elo e American Express), em transações de **pagamento recorrente**, **autorização incremental** e **venda no cartão reautorizada**.

  Veja exemplos em:

  - [Criar pagamento com cartão de crédito](https://docs.cielo.com.br/ecommerce-cielo/reference/criar-pagamento-credito);
  - [Criar pagamento com cartão de débito](https://docs.cielo.com.br/ecommerce-cielo/reference/debito);
  - [Criar recorrência própria](https://docs.cielo.com.br/ecommerce-cielo/reference/criar-recorr%C3%AAncia-pr%C3%B3pria).
</Callout>

### TransactionLinkId (TLID)

O **TransactionLinkId (TLID)** é um identificador retornado pela Mastercard para vincular transações iniciadas pelo cliente (CIT) a transações subsequentes iniciadas pelo estabelecimento (MIT). Ele complementa o `IssuerTransactionId` e não o substitui: quando ambos estiverem disponíveis, armazene e utilize os dois conforme suas respectivas finalidades.

Na Mastercard, envie `IssuerTransactionId` e `TransactionLinkId` juntos nas transações MIT: os dois parâmetros são obrigatórios.

**Bandeira:** Mastercard.

**Disponível nas respostas de:** autorização de crédito, débito, recorrência, Zero Auth e consulta por `PaymentId`.

Na **transação CIT** (ou no Zero Auth), a loja ainda não possui um TLID, pois ele só passa a existir quando a bandeira o retorna. Por isso o request não envia o campo `TransactionLinkId`, e a Mastercard retorna na resposta o identificador **original**, que deve ser armazenado para as transações seguintes.

A partir da **segunda transação do ciclo**, a loja envia no request o `TransactionLinkId` obtido anteriormente. O campo já está disponível no body das APIs de [crédito](https://docs.cielo.com.br/ecommerce-cielo/reference/criar-pagamento-credito) e [débito](https://docs.cielo.com.br/ecommerce-cielo/reference/debito). Nesse caso, a resposta traz dois campos:

* `SentTransactionLinkId`: o valor que o estabelecimento enviou no request e que a Cielo repassou à bandeira;
* `TransactionLinkId`: um novo valor, gerado pela bandeira para aquela transação específica.

O campo `SentTransactionLinkId` só aparece na resposta quando a Cielo envia o TLID à bandeira, independentemente de a transação ser aprovada ou não. Sem envio, o campo não aparece, mesmo que o request tenha o `TransactionLinkId`.

**Exemplos:**

O ciclo a seguir ilustra o TLID em uma venda de crédito Mastercard: o request da transação CIT não envia o `TransactionLinkId`, a resposta retorna os identificadores, a transação MIT seguinte os envia, e a resposta da MIT traz o `SentTransactionLinkId` e um novo `TransactionLinkId`.

```json Request — transação CIT
{
  "MerchantOrderId": "2017051001",
  "Customer": {
    "Name": "Aline de Souza"
  },
  "Payment": {
    "Type": "CreditCard",
    "Amount": 15700,
    "Installments": 1,
    "Capture": true,
    "CreditCard": {
      "CardNumber": "<CARTAO_DE_TESTE_MASTERCARD>",
      "Holder": "Aline de Souza",
      "ExpirationDate": "12/2035",
      "Brand": "Master"
    }
  }
}
```
```json Resposta — transação CIT
{
  "MerchantOrderId": "2017051001",
  "Payment": {
    "Type": "CreditCard",
    "Amount": 15700,
    "Capture": true,
    "IssuerTransactionId": "580027442382078",
    "TransactionLinkId": "Xk7pQ2mR-9wLz_4TbN8vCd",
    "PaymentId": "6f8d1753-86bb-4dc0-9ebb-09a29093e1fb",
    "Status": 2,
    "ReturnCode": "6",
    "ReturnMessage": "Operation Successful"
  }
}
```
```json Request — transação MIT
{
  "MerchantOrderId": "2017051002",
  "Customer": {
    "Name": "Aline de Souza"
  },
  "Payment": {
    "Type": "CreditCard",
    "Amount": 15700,
    "Installments": 1,
    "Capture": true,
    "CreditCard": {
      "CardNumber": "<CARTAO_DE_TESTE_MASTERCARD>",
      "Holder": "Aline de Souza",
      "ExpirationDate": "12/2035",
      "Brand": "Master"
    },
    "IssuerTransactionId": "580027442382078",
    "TransactionLinkId": "Xk7pQ2mR-9wLz_4TbN8vCd"
  }
}
```
```json Resposta — transação MIT
{
  "Payment": {
    "SentTransactionLinkId": "Xk7pQ2mR-9wLz_4TbN8vCd",
    "TransactionLinkId": "aH3nV6qP_2sKe-8YjW1uBf"
  }
}
```

<Callout icon="⚠️" theme="warn">
  Mesmo que a bandeira devolva um novo `TransactionLinkId` em cada resposta, a loja deve continuar enviando, em todas as transações subsequentes, o `TransactionLinkId` **original**, obtido na transação CIT ou no Zero Auth. Os valores retornados posteriormente não devem substituir esse identificador. Apenas se o valor original não tiver sido armazenado é que um valor mais recente pode ser usado como alternativa.
</Callout>

#### Formato do TLID

O `TransactionLinkId` enviado no request deve ter exatamente 22 caracteres, entre letras maiúsculas e minúsculas (A-Z, a-z), números (0-9), hífen (-) e sublinhado (\_).

<Callout icon="⚠️" theme="warn">
  Se o `TransactionLinkId` for nulo, vazio, tiver só espaços ou estiver fora desse formato, a Cielo o ignora: a transação segue sem o TLID, sem retornar erro e sem o campo `SentTransactionLinkId` na resposta. Confira o formato antes de enviar.
</Callout>

#### TLID no sandbox

No sandbox, o meio de pagamento Simulado devolve um `TransactionLinkId` simulado nas vendas Mastercard autorizadas e na validação de cartão (Zero Auth) Mastercard com cartão válido. Assim, você testa o ciclo do TLID antes de ir para produção.

#### Fases de implementação do TLID

| Fase   | Quando                 | O que muda                                                                                                                                                                                                                                               |
| ------ | ---------------------- | -------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| Fase 1 | Vigente                | O TLID é disponibilizado nas respostas de autorização das transações Mastercard, incluindo Zero Auth, e pode ser consultado pela [API de consulta](https://docs.cielo.com.br/ecommerce-cielo/reference/consulta-paymentid-api) utilizando o `PaymentId`. |
| Fase 2 | A partir de 23/10/2026 | O envio do `TransactionLinkId` passa a ser obrigatório para transações MIT vinculadas a uma transação CIT original.                                                                                                                                      |

O envio do `IssuerTransactionId` e do `OriginalRecurrentAmount` já é obrigatório e não depende dessas fases.

## Valor da transação original na recorrência própria

Na recorrência própria, envie no campo `Payment.OriginalRecurrentAmount` o valor da transação original (primeira do ciclo), como número inteiro em centavos. O campo é obrigatório e deve ser enviado junto com o `IssuerTransactionId` e, na Mastercard, com o `TransactionLinkId`.

O exemplo a seguir ilustra uma transação de recorrência própria Mastercard com os três campos:

```json Request — recorrência própria (MIT)
{
  "Payment": {
    "Type": "CreditCard",
    "Amount": 1500,
    "Recurrent": true,
    "OriginalRecurrentAmount": 1500,
    "IssuerTransactionId": "580027442382078",
    "TransactionLinkId": "mK8vT2qA-9LpX7dWc3Rf_H"
  }
}
```

## Teste em sandbox

No ambiente de sandbox, os campos `IssuerTransactionId` e `TransactionLinkId` só são retornados quando a transação usa o provider `Simulado` e o cenário é de transação autorizada.

## Recuperação de identificadores

Caso a loja não possua mais o `IssuerTransactionId` e/ou o `TransactionLinkId` da transação original (CIT), recomenda-se:

1. Priorizar a recuperação dos identificadores por meio da [consulta](https://docs.cielo.com.br/ecommerce-cielo/reference/consulta-paymentid-api) disponibilizada pela Cielo, utilizando as informações da transação original quando disponíveis;
2. Na impossibilidade de recuperação, utilizar o identificador de uma transação anterior relacionada ao mesmo ciclo transacional, desde que represente adequadamente a relação da transação com o portador.

Preferencialmente:

* Utilizar uma transação não contestada;
* Utilizar uma transação com histórico consistente de utilização (por exemplo, superior a 3 meses).

<Callout icon="⚠️" theme="warn">
  A ausência dos identificadores originais pode impactar a capacidade de correlação da transação pelos emissores e, consequentemente, influenciar a análise de autorização e a aderência aos requisitos das bandeiras.
</Callout>

## Veja também

* [Credenciais armazenadas (Card on File)](https://docs.cielo.com.br/ecommerce-cielo/docs/card-on-file)
* <Anchor target="_blank" href="https://docs.cielo.com.br/ecommerce-cielo/page/indicador-de-in%C3%ADcio-da-transa%C3%A7%C3%A3o-cit-e-mit">Indicador de início da transação (CIT e MIT)</Anchor>
* <Anchor target="_blank" href="https://docs.cielo.com.br/ecommerce-cielo/reference/criar-pagamento-credito">Criar pagamento com cartão de crédito</Anchor>
* <Anchor target="_blank" href="https://docs.cielo.com.br/ecommerce-cielo/reference/validar-cartao">Validar cartão com Zero Auth</Anchor>
* <Anchor target="_blank" href="https://docs.cielo.com.br/ecommerce-cielo/reference/consulta-paymentid-api">Consultar transação por PaymentId</Anchor>