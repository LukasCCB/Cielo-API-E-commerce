---
updatedAt: 2026-07-29T14:45:32.000Z
agentTools:
  siteIndex: https://docs.cielo.com.br/llms.txt
  projectIndex: https://docs.cielo.com.br/ecommerce-cielo/llms.txt
---

# Códigos de retorno de negócio da API (Return, Provider e Reason)

Para saber se uma venda foi autorizada e/ou paga, confira o `Payment.Status`, e o `ReturnCode` e `ReturnMessage`.

> Os códigos retornados são dinâmicos e dependem do fluxo percorrido por cada solicitação.

***

Veja nesta seção:

* [Códigos de retorno da venda](https://docs.cielo.com.br/ecommerce-cielo/reference/api-codes#c%C3%B3digos-de-retorno-da-venda-returncode-e-returnmessage): `ReturnCode` e `ReturnMessage`;
* [Códigos de retorno do provedor](https://docs.cielo.com.br/ecommerce-cielo/reference/api-codes#c%C3%B3digos-de-retorno-do-provedor-providerreturncode-e-providerreturnmessage): `ProviderReturnCode` e `ProviderReturnMessage`;
* [Códigos de motivo](https://docs.cielo.com.br/ecommerce-cielo/reference/api-codes#c%C3%B3digos-de-motivo-reasoncode-e-reasonmessage): `ReasonCode` e `ReasonMessage`.

***

## Códigos de retorno da venda: `ReturnCode` e `ReturnMessage`

O `ReturnCode` e `ReturnMessage` fornecem o resultado da operação do ponto de vista do negócio e são apresentados no corpo da resposta para as seguintes operações:

* Criação de transações;
* Captura;
* Cancelamento.

Os principais `ReturnCode` de sucesso são:

* `00`: transação autorizada;
* `4`: transação autorizada (apta a ser capturada);
* `6`: transação capturada.

<Callout icon="ℹ️" theme="info">
  Valide o sucesso da venda pela combinação do `ReturnCode` com o `Payment.Status`.
</Callout>

Alguns exemplos de `ReturnCode` de transações negadas são:

* `51`: o portador do cartão não tem saldo suficiente para a compra;
* `54`: cartão vencido;
* `78`: cartão novo sem desbloqueio.

### Como interpretar o `ReturnCode`

Quando uma transação é negada, o `ReturnCode` é a base para determinar o fluxo de decisão. É importante que o estabelecimento analise se o retorno é reversível ou irreversível e decida por submeter ou não a transação para uma nova tentativa de autorização.

Analise o tipo de retorno para:

* Determinar se a transação pode ser enviada novamente para o mesmo cartão;

* Criar mensagens na página de pagamento ou enviar mensagem ao comprador orientando a usar outro cartão ou outro meio de pagamento.

<Callout icon="ℹ️" theme="info">
  ### Atenção para autorizações negadas de cartão de crédito ou débito:

  **Quando a transação é reversível:**

  - Envie a transação novamente para autorização (retentativa);
  - Respeite o limite de retentativas da bandeira para aquele código e evite penalidades.

  **Quando  transação é irreversível:**

  - Oriente o comprador a tentar outro cartão ou meio de pagamento.
</Callout>

<br />

***

### Cenários comuns de `ReturnCode` por meio de pagamento

A tabela a seguir exemplifica os principais cenários por meio de pagamento, com o seu `Status` e `ReturnCode` correspondentes:

| Cenário                        | `Payment.Status` | Exemplo\* de `ReturnCode`                                                           | Exemplo\* `ReturnMessage`                                 |
| ------------------------------ | ---------------- | ----------------------------------------------------------------------------------- | --------------------------------------------------------- |
| Crédito - autorizado           | 1                | 00 ou 4                                                                             | *Transação autorizada*                                    |
| Crédito - capturado  (pago)    | 2                | 6 ou 00                                                                             | *Transação capturada com sucesso*                         |
| Crédito - negado               | 3                | Diversos (ver [tabela Abecs](https://docs.cielo.com.br/ecommerce-cielo/page/abecs)) | Autorização negada                                        |
| Crédito - abortado             | 13               | —                                                                                   | Não retorna `ReturnCode`/`Message`                        |
| Crédito - não finalizado       | 0                | 001 ou BP171                                                                        | *XML inválido* or *Rejected by fraud risk*                |
| Crédito - recorrência agendada | 20               | 4                                                                                   | *Operation Successful*                                    |
| Débito - pago                  | 2                | 00 ou 6                                                                             | *Transação capturada com sucesso*                         |
| Débito - não Autorizado        | 3                | Diversos (ver tabela Abecs)                                                         | *Autorização negada*                                      |
| Pix - gerado com sucesso       | 12               | 0                                                                                   | *Pix gerado com sucesso*                                  |
| Pix - pago                     | 2                | 0                                                                                   | *Sucesso*                                                 |
| Pix - não finalizado           | 0                | 422                                                                                 | *Error on merchantResponse integration*                   |
| Pix - devolvido                | 11               | 0                                                                                   | *Devolução solicitada com sucesso*                        |
| Boleto - criado                | 1                | 0                                                                                   | *REGISTRO EFETUADO COM SUCESSO*                           |
| Boleto pago                    | 2                | --                                                                                  | --                                                        |
| Cancelamento aprovado          | 10               | 9                                                                                   | *Transação desfeita* ou *Transação cancelada com sucesso* |
| Estorno aprovado               | 11               | 9                                                                                   | *Transação desfeita*                                      |

> \*Os valores de `ReturnCode` e `ReturnMessage` apresentados na tabela são exemplos de retornos comuns para cada cenário. Consulte a [Tabela de `ReturnCode` e `ReturnMessage`](https://docs.cielo.com.br/ecommerce-cielo/reference/api-codes#/tabela-de-returncode-e-returnmessage) para ver a lista completa de valores possíveis.

<br />

### Tabela de `ReturnCode` e `ReturnMessage`

`ReturnCode` e `ReturnMessage` são os mesmos de `Code` e `Message`, mas retornam em situações diferentes:

* Os valores `ReturnCode` e `ReturnMessage` são retornados em operações HTTP de sucesso (200 ou 201);
* Os valores `Code` e `Message` são retornados em operações HTTP de erro (ex.: 400).

Confira a tabela completa:

<Table align={["left","left","left"]}>
  <thead>
    <tr>
      <th style={{ textAlign: "left" }}>
        `ReturnCode` ou `Code`
      </th>

      <th style={{ textAlign: "left" }}>
        `ReturnMessage` ou `Message`
      </th>

      <th style={{ textAlign: "left" }}>
        Descrição
      </th>
    </tr>
  </thead>

  <tbody>
    <tr>
      <td style={{ textAlign: "left" }}>
        00
      </td>

      <td style={{ textAlign: "left" }}>
        Internal error
      </td>

      <td style={{ textAlign: "left" }}>
        Dado enviado excede o tamanho do campo
      </td>
    </tr>

    <tr>
      <td style={{ textAlign: "left" }}>
        100
      </td>

      <td style={{ textAlign: "left" }}>
        RequestId is required
      </td>

      <td style={{ textAlign: "left" }}>
        Campo enviado está vazio ou inválido
      </td>
    </tr>

    <tr>
      <td style={{ textAlign: "left" }}>
        101
      </td>

      <td style={{ textAlign: "left" }}>
        MerchantId is required
      </td>

      <td style={{ textAlign: "left" }}>
        Campo enviado está vazio ou inválido
      </td>
    </tr>

    <tr>
      <td style={{ textAlign: "left" }}>
        102
      </td>

      <td style={{ textAlign: "left" }}>
        Payment Type is required
      </td>

      <td style={{ textAlign: "left" }}>
        Campo enviado está vazio ou inválido
      </td>
    </tr>

    <tr>
      <td style={{ textAlign: "left" }}>
        103
      </td>

      <td style={{ textAlign: "left" }}>
        Payment Type can only contain letters
      </td>

      <td style={{ textAlign: "left" }}>
        Caracteres especiais não permitidos
      </td>
    </tr>

    <tr>
      <td style={{ textAlign: "left" }}>
        104
      </td>

      <td style={{ textAlign: "left" }}>
        Customer Identity is required
      </td>

      <td style={{ textAlign: "left" }}>
        Campo enviado está vazio ou inválido
      </td>
    </tr>

    <tr>
      <td style={{ textAlign: "left" }}>
        105
      </td>

      <td style={{ textAlign: "left" }}>
        Customer Name is required
      </td>

      <td style={{ textAlign: "left" }}>
        Campo enviado está vazio ou inválido
      </td>
    </tr>

    <tr>
      <td style={{ textAlign: "left" }}>
        106
      </td>

      <td style={{ textAlign: "left" }}>
        Transaction ID is required
      </td>

      <td style={{ textAlign: "left" }}>
        Campo enviado está vazio ou inválido
      </td>
    </tr>

    <tr>
      <td style={{ textAlign: "left" }}>
        107
      </td>

      <td style={{ textAlign: "left" }}>
        OrderId is invalid or does not exists
      </td>

      <td style={{ textAlign: "left" }}>
        Campo enviado excede o tamanho ou contem caracteres especiais
      </td>
    </tr>

    <tr>
      <td style={{ textAlign: "left" }}>
        108
      </td>

      <td style={{ textAlign: "left" }}>
        Amount must be greater or equal to zero
      </td>

      <td style={{ textAlign: "left" }}>
        Valor da transação deve ser maior que "0"
      </td>
    </tr>

    <tr>
      <td style={{ textAlign: "left" }}>
        109
      </td>

      <td style={{ textAlign: "left" }}>
        Payment Currency is required
      </td>

      <td style={{ textAlign: "left" }}>
        Campo enviado está vazio ou inválido
      </td>
    </tr>

    <tr>
      <td style={{ textAlign: "left" }}>
        110
      </td>

      <td style={{ textAlign: "left" }}>
        Invalid Payment Currency
      </td>

      <td style={{ textAlign: "left" }}>
        Campo enviado está vazio ou inválido
      </td>
    </tr>

    <tr>
      <td style={{ textAlign: "left" }}>
        111
      </td>

      <td style={{ textAlign: "left" }}>
        Payment Country is required
      </td>

      <td style={{ textAlign: "left" }}>
        Campo enviado está vazio ou inválido
      </td>
    </tr>

    <tr>
      <td style={{ textAlign: "left" }}>
        112
      </td>

      <td style={{ textAlign: "left" }}>
        Invalid Payment Country
      </td>

      <td style={{ textAlign: "left" }}>
        Campo enviado está vazio ou inválido
      </td>
    </tr>

    <tr>
      <td style={{ textAlign: "left" }}>
        113
      </td>

      <td style={{ textAlign: "left" }}>
        Invalid Payment Code
      </td>

      <td style={{ textAlign: "left" }}>
        Campo enviado está vazio ou inválido
      </td>
    </tr>

    <tr>
      <td style={{ textAlign: "left" }}>
        114
      </td>

      <td style={{ textAlign: "left" }}>
        The provided MerchantId is not in correct format
      </td>

      <td style={{ textAlign: "left" }}>
        O MerchantId enviado não é um GUID
      </td>
    </tr>

    <tr>
      <td style={{ textAlign: "left" }}>
        115
      </td>

      <td style={{ textAlign: "left" }}>
        The provided MerchantId was not found
      </td>

      <td style={{ textAlign: "left" }}>
        O MerchantID não existe ou pertence a outro ambiente (EX: Sandbox)
      </td>
    </tr>

    <tr>
      <td style={{ textAlign: "left" }}>
        116
      </td>

      <td style={{ textAlign: "left" }}>
        The provided MerchantId is blocked
      </td>

      <td style={{ textAlign: "left" }}>
        Loja bloqueada. Verifique a situação do seu EC no site Cielo.
      </td>
    </tr>

    <tr>
      <td style={{ textAlign: "left" }}>
        117
      </td>

      <td style={{ textAlign: "left" }}>
        Credit Card Holder is required
      </td>

      <td style={{ textAlign: "left" }}>
        Campo enviado está vazio ou inválido
      </td>
    </tr>

    <tr>
      <td style={{ textAlign: "left" }}>
        118
      </td>

      <td style={{ textAlign: "left" }}>
        Credit Card Number is required
      </td>

      <td style={{ textAlign: "left" }}>
        Campo enviado está vazio ou inválido
      </td>
    </tr>

    <tr>
      <td style={{ textAlign: "left" }}>
        119
      </td>

      <td style={{ textAlign: "left" }}>
        At least one Payment is required
      </td>

      <td style={{ textAlign: "left" }}>
        Nó "Payment" não enviado
      </td>
    </tr>

    <tr>
      <td style={{ textAlign: "left" }}>
        120
      </td>

      <td style={{ textAlign: "left" }}>
        Request IP not allowed. Check your IP White List
      </td>

      <td style={{ textAlign: "left" }}>
        IP bloqueado por questões de segurança
      </td>
    </tr>

    <tr>
      <td style={{ textAlign: "left" }}>
        121
      </td>

      <td style={{ textAlign: "left" }}>
        Customer is required
      </td>

      <td style={{ textAlign: "left" }}>
        Nó "Customer" não enviado
      </td>
    </tr>

    <tr>
      <td style={{ textAlign: "left" }}>
        122
      </td>

      <td style={{ textAlign: "left" }}>
        MerchantOrderId is required
      </td>

      <td style={{ textAlign: "left" }}>
        Campo enviado está vazio ou inválido
      </td>
    </tr>

    <tr>
      <td style={{ textAlign: "left" }}>
        123
      </td>

      <td style={{ textAlign: "left" }}>
        Installments must be greater or equal to one
      </td>

      <td style={{ textAlign: "left" }}>
        Numero de parcelas deve ser superior a 1
      </td>
    </tr>

    <tr>
      <td style={{ textAlign: "left" }}>
        124
      </td>

      <td style={{ textAlign: "left" }}>
        Credit Card is Required
      </td>

      <td style={{ textAlign: "left" }}>
        Campo enviado está vazio ou inválido
      </td>
    </tr>

    <tr>
      <td style={{ textAlign: "left" }}>
        125
      </td>

      <td style={{ textAlign: "left" }}>
        Credit Card Expiration Date is required
      </td>

      <td style={{ textAlign: "left" }}>
        Campo enviado está vazio ou inválido
      </td>
    </tr>

    <tr>
      <td style={{ textAlign: "left" }}>
        126
      </td>

      <td style={{ textAlign: "left" }}>
        Credit Card Expiration Date is invalid
      </td>

      <td style={{ textAlign: "left" }}>
        Campo enviado está vazio ou inválido
      </td>
    </tr>

    <tr>
      <td style={{ textAlign: "left" }}>
        127
      </td>

      <td style={{ textAlign: "left" }}>
        You must provide CreditCard Number
      </td>

      <td style={{ textAlign: "left" }}>
        Numero do cartão de crédito é obrigatório
      </td>
    </tr>

    <tr>
      <td style={{ textAlign: "left" }}>
        128
      </td>

      <td style={{ textAlign: "left" }}>
        Card Number length exceeded
      </td>

      <td style={{ textAlign: "left" }}>
        Numero do cartão superiro a 16 digitos
      </td>
    </tr>

    <tr>
      <td style={{ textAlign: "left" }}>
        129
      </td>

      <td style={{ textAlign: "left" }}>
        Affiliation not found
      </td>

      <td style={{ textAlign: "left" }}>
        Meio de pagamento não vinculado a loja ou Provider inválido
      </td>
    </tr>

    <tr>
      <td style={{ textAlign: "left" }}>
        130
      </td>

      <td style={{ textAlign: "left" }}>
        Could not get Credit Card
      </td>

      <td style={{ textAlign: "left" }}>
        Pode significar que **não foi possível encontrar um cartão pelo cardtoken enviado** ou que houve uma **interrupção na consulta**.
      </td>
    </tr>

    <tr>
      <td style={{ textAlign: "left" }}>
        131
      </td>

      <td style={{ textAlign: "left" }}>
        MerchantKey is required
      </td>

      <td style={{ textAlign: "left" }}>
        Campo enviado está vazio ou inválido
      </td>
    </tr>

    <tr>
      <td style={{ textAlign: "left" }}>
        132
      </td>

      <td style={{ textAlign: "left" }}>
        MerchantKey is invalid
      </td>

      <td style={{ textAlign: "left" }}>
        O Merchantkey enviado não é um válido
      </td>
    </tr>

    <tr>
      <td style={{ textAlign: "left" }}>
        133
      </td>

      <td style={{ textAlign: "left" }}>
        Provider is not supported for this Payment Type
      </td>

      <td style={{ textAlign: "left" }}>
        Provider enviado não existe
      </td>
    </tr>

    <tr>
      <td style={{ textAlign: "left" }}>
        134
      </td>

      <td style={{ textAlign: "left" }}>
        FingerPrint length exceeded
      </td>

      <td style={{ textAlign: "left" }}>
        Dado enviado excede o tamanho do campo
      </td>
    </tr>

    <tr>
      <td style={{ textAlign: "left" }}>
        135
      </td>

      <td style={{ textAlign: "left" }}>
        MerchantDefinedFieldValue length exceeded
      </td>

      <td style={{ textAlign: "left" }}>
        Dado enviado excede o tamanho do campo
      </td>
    </tr>

    <tr>
      <td style={{ textAlign: "left" }}>
        136
      </td>

      <td style={{ textAlign: "left" }}>
        ItemDataName length exceeded
      </td>

      <td style={{ textAlign: "left" }}>
        Dado enviado excede o tamanho do campo
      </td>
    </tr>

    <tr>
      <td style={{ textAlign: "left" }}>
        137
      </td>

      <td style={{ textAlign: "left" }}>
        ItemDataSKU length exceeded
      </td>

      <td style={{ textAlign: "left" }}>
        Dado enviado excede o tamanho do campo
      </td>
    </tr>

    <tr>
      <td style={{ textAlign: "left" }}>
        138
      </td>

      <td style={{ textAlign: "left" }}>
        PassengerDataName length exceeded
      </td>

      <td style={{ textAlign: "left" }}>
        Dado enviado excede o tamanho do campo
      </td>
    </tr>

    <tr>
      <td style={{ textAlign: "left" }}>
        139
      </td>

      <td style={{ textAlign: "left" }}>
        PassengerDataStatus length exceeded
      </td>

      <td style={{ textAlign: "left" }}>
        Dado enviado excede o tamanho do campo
      </td>
    </tr>

    <tr>
      <td style={{ textAlign: "left" }}>
        140
      </td>

      <td style={{ textAlign: "left" }}>
        PassengerDataEmail length exceeded
      </td>

      <td style={{ textAlign: "left" }}>
        Dado enviado excede o tamanho do campo
      </td>
    </tr>

    <tr>
      <td style={{ textAlign: "left" }}>
        141
      </td>

      <td style={{ textAlign: "left" }}>
        PassengerDataPhone length exceeded
      </td>

      <td style={{ textAlign: "left" }}>
        Dado enviado excede o tamanho do campo
      </td>
    </tr>

    <tr>
      <td style={{ textAlign: "left" }}>
        142
      </td>

      <td style={{ textAlign: "left" }}>
        TravelDataRoute length exceeded
      </td>

      <td style={{ textAlign: "left" }}>
        Dado enviado excede o tamanho do campo
      </td>
    </tr>

    <tr>
      <td style={{ textAlign: "left" }}>
        143
      </td>

      <td style={{ textAlign: "left" }}>
        TravelDataJourneyType length exceeded
      </td>

      <td style={{ textAlign: "left" }}>
        Dado enviado excede o tamanho do campo
      </td>
    </tr>

    <tr>
      <td style={{ textAlign: "left" }}>
        144
      </td>

      <td style={{ textAlign: "left" }}>
        TravelLegDataDestination length exceeded
      </td>

      <td style={{ textAlign: "left" }}>
        Dado enviado excede o tamanho do campo
      </td>
    </tr>

    <tr>
      <td style={{ textAlign: "left" }}>
        145
      </td>

      <td style={{ textAlign: "left" }}>
        TravelLegDataOrigin length exceeded
      </td>

      <td style={{ textAlign: "left" }}>
        Dado enviado excede o tamanho do campo
      </td>
    </tr>

    <tr>
      <td style={{ textAlign: "left" }}>
        146
      </td>

      <td style={{ textAlign: "left" }}>
        SecurityCode length exceeded
      </td>

      <td style={{ textAlign: "left" }}>
        Dado enviado excede o tamanho do campo
      </td>
    </tr>

    <tr>
      <td style={{ textAlign: "left" }}>
        147
      </td>

      <td style={{ textAlign: "left" }}>
        Address Street length exceeded
      </td>

      <td style={{ textAlign: "left" }}>
        Dado enviado excede o tamanho do campo
      </td>
    </tr>

    <tr>
      <td style={{ textAlign: "left" }}>
        148
      </td>

      <td style={{ textAlign: "left" }}>
        Address Number length exceeded
      </td>

      <td style={{ textAlign: "left" }}>
        Dado enviado excede o tamanho do campo
      </td>
    </tr>

    <tr>
      <td style={{ textAlign: "left" }}>
        149
      </td>

      <td style={{ textAlign: "left" }}>
        Address Complement length exceeded
      </td>

      <td style={{ textAlign: "left" }}>
        Dado enviado excede o tamanho do campo
      </td>
    </tr>

    <tr>
      <td style={{ textAlign: "left" }}>
        150
      </td>

      <td style={{ textAlign: "left" }}>
        Address ZipCode length exceeded
      </td>

      <td style={{ textAlign: "left" }}>
        Dado enviado excede o tamanho do campo
      </td>
    </tr>

    <tr>
      <td style={{ textAlign: "left" }}>
        151
      </td>

      <td style={{ textAlign: "left" }}>
        Address City length exceeded
      </td>

      <td style={{ textAlign: "left" }}>
        Dado enviado excede o tamanho do campo
      </td>
    </tr>

    <tr>
      <td style={{ textAlign: "left" }}>
        152
      </td>

      <td style={{ textAlign: "left" }}>
        Address State length exceeded
      </td>

      <td style={{ textAlign: "left" }}>
        Dado enviado excede o tamanho do campo
      </td>
    </tr>

    <tr>
      <td style={{ textAlign: "left" }}>
        153
      </td>

      <td style={{ textAlign: "left" }}>
        Address Country length exceeded
      </td>

      <td style={{ textAlign: "left" }}>
        Dado enviado excede o tamanho do campo
      </td>
    </tr>

    <tr>
      <td style={{ textAlign: "left" }}>
        154
      </td>

      <td style={{ textAlign: "left" }}>
        Address District length exceeded
      </td>

      <td style={{ textAlign: "left" }}>
        Dado enviado excede o tamanho do campo
      </td>
    </tr>

    <tr>
      <td style={{ textAlign: "left" }}>
        155
      </td>

      <td style={{ textAlign: "left" }}>
        Customer Name length exceeded
      </td>

      <td style={{ textAlign: "left" }}>
        Dado enviado excede o tamanho do campo
      </td>
    </tr>

    <tr>
      <td style={{ textAlign: "left" }}>
        156
      </td>

      <td style={{ textAlign: "left" }}>
        Customer Identity length exceeded
      </td>

      <td style={{ textAlign: "left" }}>
        Dado enviado excede o tamanho do campo
      </td>
    </tr>

    <tr>
      <td style={{ textAlign: "left" }}>
        157
      </td>

      <td style={{ textAlign: "left" }}>
        Customer IdentityType length exceeded
      </td>

      <td style={{ textAlign: "left" }}>
        Dado enviado excede o tamanho do campo
      </td>
    </tr>

    <tr>
      <td style={{ textAlign: "left" }}>
        158
      </td>

      <td style={{ textAlign: "left" }}>
        Customer Email length exceeded
      </td>

      <td style={{ textAlign: "left" }}>
        Dado enviado excede o tamanho do campo
      </td>
    </tr>

    <tr>
      <td style={{ textAlign: "left" }}>
        159
      </td>

      <td style={{ textAlign: "left" }}>
        ExtraData Name length exceeded
      </td>

      <td style={{ textAlign: "left" }}>
        Dado enviado excede o tamanho do campo
      </td>
    </tr>

    <tr>
      <td style={{ textAlign: "left" }}>
        160
      </td>

      <td style={{ textAlign: "left" }}>
        ExtraData Value length exceeded
      </td>

      <td style={{ textAlign: "left" }}>
        Dado enviado excede o tamanho do campo
      </td>
    </tr>

    <tr>
      <td style={{ textAlign: "left" }}>
        161
      </td>

      <td style={{ textAlign: "left" }}>
        Boleto Instructions length exceeded
      </td>

      <td style={{ textAlign: "left" }}>
        Dado enviado excede o tamanho do campo
      </td>
    </tr>

    <tr>
      <td style={{ textAlign: "left" }}>
        162
      </td>

      <td style={{ textAlign: "left" }}>
        Boleto Demostrative length exceeded
      </td>

      <td style={{ textAlign: "left" }}>
        Dado enviado excede o tamanho do campo
      </td>
    </tr>

    <tr>
      <td style={{ textAlign: "left" }}>
        163
      </td>

      <td style={{ textAlign: "left" }}>
        Return Url is required
      </td>

      <td style={{ textAlign: "left" }}>
        URL de retorno não é valida - Não é aceito paginação ou extenções (EX .PHP) na URL de retorno
      </td>
    </tr>

    <tr>
      <td style={{ textAlign: "left" }}>
        166
      </td>

      <td style={{ textAlign: "left" }}>
        AuthorizeNow is required
      </td>

      <td style={{ textAlign: "left" }}>

      </td>
    </tr>

    <tr>
      <td style={{ textAlign: "left" }}>
        167
      </td>

      <td style={{ textAlign: "left" }}>
        Antifraud not configured
      </td>

      <td style={{ textAlign: "left" }}>
        Antifraude não vinculado ao cadastro do lojista
      </td>
    </tr>

    <tr>
      <td style={{ textAlign: "left" }}>
        168
      </td>

      <td style={{ textAlign: "left" }}>
        Recurrent Payment not found
      </td>

      <td style={{ textAlign: "left" }}>
        Recorrência não encontrada
      </td>
    </tr>

    <tr>
      <td style={{ textAlign: "left" }}>
        169
      </td>

      <td style={{ textAlign: "left" }}>
        Recurrent Payment is not active
      </td>

      <td style={{ textAlign: "left" }}>
        Recorrência não está ativa. Execução paralizada
      </td>
    </tr>

    <tr>
      <td style={{ textAlign: "left" }}>
        170
      </td>

      <td style={{ textAlign: "left" }}>
        Cartão Protegido not configured
      </td>

      <td style={{ textAlign: "left" }}>
        Token não vinculado ao cadastro do lojista
      </td>
    </tr>

    <tr>
      <td style={{ textAlign: "left" }}>
        171
      </td>

      <td style={{ textAlign: "left" }}>
        Affiliation data not sent
      </td>

      <td style={{ textAlign: "left" }}>
        Falha no processamento do pedido por erro de afiliação - verifique suas credenciais.
      </td>
    </tr>

    <tr>
      <td style={{ textAlign: "left" }}>
        172
      </td>

      <td style={{ textAlign: "left" }}>
        Credential Code is required
      </td>

      <td style={{ textAlign: "left" }}>
        Falha na validação das credenciadas enviadas
      </td>
    </tr>

    <tr>
      <td style={{ textAlign: "left" }}>
        173
      </td>

      <td style={{ textAlign: "left" }}>
        Payment method is not enabled
      </td>

      <td style={{ textAlign: "left" }}>
        Meio de pagamento não vinculado ao cadastro do lojista
      </td>
    </tr>

    <tr>
      <td style={{ textAlign: "left" }}>
        174
      </td>

      <td style={{ textAlign: "left" }}>
        Card Number is required
      </td>

      <td style={{ textAlign: "left" }}>
        Campo enviado está vazio ou inválido
      </td>
    </tr>

    <tr>
      <td style={{ textAlign: "left" }}>
        175
      </td>

      <td style={{ textAlign: "left" }}>
        EAN is required
      </td>

      <td style={{ textAlign: "left" }}>
        Campo enviado está vazio ou inválido
      </td>
    </tr>

    <tr>
      <td style={{ textAlign: "left" }}>
        176
      </td>

      <td style={{ textAlign: "left" }}>
        Payment Currency is not supported
      </td>

      <td style={{ textAlign: "left" }}>
        Campo enviado está vazio ou inválido
      </td>
    </tr>

    <tr>
      <td style={{ textAlign: "left" }}>
        177
      </td>

      <td style={{ textAlign: "left" }}>
        Card Number is invalid
      </td>

      <td style={{ textAlign: "left" }}>
        Campo enviado está vazio ou inválido
      </td>
    </tr>

    <tr>
      <td style={{ textAlign: "left" }}>
        178
      </td>

      <td style={{ textAlign: "left" }}>
        EAN is invalid
      </td>

      <td style={{ textAlign: "left" }}>
        Campo enviado está vazio ou inválido
      </td>
    </tr>

    <tr>
      <td style={{ textAlign: "left" }}>
        179
      </td>

      <td style={{ textAlign: "left" }}>
        The max number of installments allowed for recurring payment is 1
      </td>

      <td style={{ textAlign: "left" }}>
        Campo enviado está vazio ou inválido
      </td>
    </tr>

    <tr>
      <td style={{ textAlign: "left" }}>
        180
      </td>

      <td style={{ textAlign: "left" }}>
        The provided Card PaymentToken was not found
      </td>

      <td style={{ textAlign: "left" }}>
        Token não encontrado
      </td>
    </tr>

    <tr>
      <td style={{ textAlign: "left" }}>
        181
      </td>

      <td style={{ textAlign: "left" }}>
        The MerchantIdJustClick is not configured
      </td>

      <td style={{ textAlign: "left" }}>
        Token bloqueado
      </td>
    </tr>

    <tr>
      <td style={{ textAlign: "left" }}>
        182
      </td>

      <td style={{ textAlign: "left" }}>
        Brand is required
      </td>

      <td style={{ textAlign: "left" }}>
        Bandeira do cartão não enviado
      </td>
    </tr>

    <tr>
      <td style={{ textAlign: "left" }}>
        183
      </td>

      <td style={{ textAlign: "left" }}>
        Invalid customer bithdate
      </td>

      <td style={{ textAlign: "left" }}>
        Data de nascimento inválida ou futura
      </td>
    </tr>

    <tr>
      <td style={{ textAlign: "left" }}>
        184
      </td>

      <td style={{ textAlign: "left" }}>
        Request could not be empty
      </td>

      <td style={{ textAlign: "left" }}>
        Falha no formado da requisição. Verifique o código enviado
      </td>
    </tr>

    <tr>
      <td style={{ textAlign: "left" }}>
        185
      </td>

      <td style={{ textAlign: "left" }}>
        Brand is not supported by selected provider
      </td>

      <td style={{ textAlign: "left" }}>
        Bandeira não suportada pela API Cielo
      </td>
    </tr>

    <tr>
      <td style={{ textAlign: "left" }}>
        186
      </td>

      <td style={{ textAlign: "left" }}>
        The selected provider does not support the options provided (Capture, Authenticate, Recurrent or Installments)
      </td>

      <td style={{ textAlign: "left" }}>
        Meio de pagamento não suporta o comando enviado
      </td>
    </tr>

    <tr>
      <td style={{ textAlign: "left" }}>
        187
      </td>

      <td style={{ textAlign: "left" }}>
        ExtraData Collection contains one or more duplicated names
      </td>

      <td style={{ textAlign: "left" }}>

      </td>
    </tr>

    <tr>
      <td style={{ textAlign: "left" }}>
        188
      </td>

      <td style={{ textAlign: "left" }}>
        Avs with CPF invalid
      </td>

      <td style={{ textAlign: "left" }}>

      </td>
    </tr>

    <tr>
      <td style={{ textAlign: "left" }}>
        189
      </td>

      <td style={{ textAlign: "left" }}>
        Avs with length of street exceeded
      </td>

      <td style={{ textAlign: "left" }}>

      </td>
    </tr>

    <tr>
      <td style={{ textAlign: "left" }}>
        190
      </td>

      <td style={{ textAlign: "left" }}>
        Avs with length of number exceeded
      </td>

      <td style={{ textAlign: "left" }}>

      </td>
    </tr>

    <tr>
      <td style={{ textAlign: "left" }}>
        191
      </td>

      <td style={{ textAlign: "left" }}>
        Avs with length of district exceeded
      </td>

      <td style={{ textAlign: "left" }}>

      </td>
    </tr>

    <tr>
      <td style={{ textAlign: "left" }}>
        192
      </td>

      <td style={{ textAlign: "left" }}>
        Avs with zip code invalid
      </td>

      <td style={{ textAlign: "left" }}>

      </td>
    </tr>

    <tr>
      <td style={{ textAlign: "left" }}>
        193
      </td>

      <td style={{ textAlign: "left" }}>
        Split Amount must be greater than zero
      </td>

      <td style={{ textAlign: "left" }}>
        O valor para a realização de Split deve ser maior que 0
      </td>
    </tr>

    <tr>
      <td style={{ textAlign: "left" }}>
        194
      </td>

      <td style={{ textAlign: "left" }}>
        Split Establishment is Required
      </td>

      <td style={{ textAlign: "left" }}>
        Campo enviado está vazio ou inválido
      </td>
    </tr>

    <tr>
      <td style={{ textAlign: "left" }}>
        195
      </td>

      <td style={{ textAlign: "left" }}>
        The PlataformId is required
      </td>

      <td style={{ textAlign: "left" }}>
        Campo enviado está vazio ou inválido
      </td>
    </tr>

    <tr>
      <td style={{ textAlign: "left" }}>
        196
      </td>

      <td style={{ textAlign: "left" }}>
        DeliveryAddress is required
      </td>

      <td style={{ textAlign: "left" }}>
        Campo enviado está vazio ou inválido
      </td>
    </tr>

    <tr>
      <td style={{ textAlign: "left" }}>
        197
      </td>

      <td style={{ textAlign: "left" }}>
        Street is required
      </td>

      <td style={{ textAlign: "left" }}>
        Campo enviado está vazio ou inválido
      </td>
    </tr>

    <tr>
      <td style={{ textAlign: "left" }}>
        198
      </td>

      <td style={{ textAlign: "left" }}>
        Number is required
      </td>

      <td style={{ textAlign: "left" }}>
        Campo enviado está vazio ou inválido
      </td>
    </tr>

    <tr>
      <td style={{ textAlign: "left" }}>
        199
      </td>

      <td style={{ textAlign: "left" }}>
        ZipCode is required
      </td>

      <td style={{ textAlign: "left" }}>
        Campo enviado está vazio ou inválido
      </td>
    </tr>

    <tr>
      <td style={{ textAlign: "left" }}>
        200
      </td>

      <td style={{ textAlign: "left" }}>
        City is required
      </td>

      <td style={{ textAlign: "left" }}>
        Campo enviado está vazio ou inválido
      </td>
    </tr>

    <tr>
      <td style={{ textAlign: "left" }}>
        201
      </td>

      <td style={{ textAlign: "left" }}>
        State is required
      </td>

      <td style={{ textAlign: "left" }}>
        Campo enviado está vazio ou inválido
      </td>
    </tr>

    <tr>
      <td style={{ textAlign: "left" }}>
        202
      </td>

      <td style={{ textAlign: "left" }}>
        District is required
      </td>

      <td style={{ textAlign: "left" }}>
        Campo enviado está vazio ou inválido
      </td>
    </tr>

    <tr>
      <td style={{ textAlign: "left" }}>
        203
      </td>

      <td style={{ textAlign: "left" }}>
        Cart item Name is required
      </td>

      <td style={{ textAlign: "left" }}>
        Campo enviado está vazio ou inválido
      </td>
    </tr>

    <tr>
      <td style={{ textAlign: "left" }}>
        204
      </td>

      <td style={{ textAlign: "left" }}>
        Cart item Quantity is required
      </td>

      <td style={{ textAlign: "left" }}>
        Campo enviado está vazio ou inválido
      </td>
    </tr>

    <tr>
      <td style={{ textAlign: "left" }}>
        205
      </td>

      <td style={{ textAlign: "left" }}>
        Cart item type is required
      </td>

      <td style={{ textAlign: "left" }}>
        Campo enviado está vazio ou inválido
      </td>
    </tr>

    <tr>
      <td style={{ textAlign: "left" }}>
        206
      </td>

      <td style={{ textAlign: "left" }}>
        Cart item name length exceeded
      </td>

      <td style={{ textAlign: "left" }}>
        Os dados enviados excedem o tamanho do campo
      </td>
    </tr>

    <tr>
      <td style={{ textAlign: "left" }}>
        207
      </td>

      <td style={{ textAlign: "left" }}>
        Cart item description length exceeded
      </td>

      <td style={{ textAlign: "left" }}>
        Os dados enviados excedem o tamanho do campo
      </td>
    </tr>

    <tr>
      <td style={{ textAlign: "left" }}>
        208
      </td>

      <td style={{ textAlign: "left" }}>
        Cart item sku length exceeded
      </td>

      <td style={{ textAlign: "left" }}>
        Os dados enviados excedem o tamanho do campo
      </td>
    </tr>

    <tr>
      <td style={{ textAlign: "left" }}>
        209
      </td>

      <td style={{ textAlign: "left" }}>
        Shipping addressee sku length exceeded
      </td>

      <td style={{ textAlign: "left" }}>
        Os dados enviados excedem o tamanho do campo
      </td>
    </tr>

    <tr>
      <td style={{ textAlign: "left" }}>
        210
      </td>

      <td style={{ textAlign: "left" }}>
        Shipping data cannot be null
      </td>

      <td style={{ textAlign: "left" }}>
        Campo obrigatório não enviado
      </td>
    </tr>

    <tr>
      <td style={{ textAlign: "left" }}>
        211
      </td>

      <td style={{ textAlign: "left" }}>
        WalletKey is invalid
      </td>

      <td style={{ textAlign: "left" }}>
        Dados inválidos do Visa Checkout
      </td>
    </tr>

    <tr>
      <td style={{ textAlign: "left" }}>
        212
      </td>

      <td style={{ textAlign: "left" }}>
        Merchant Wallet Configuration not found
      </td>

      <td style={{ textAlign: "left" }}>
        A wallet não está habilitada. Veja como habilitar as wallets no site Cielo.
      </td>
    </tr>

    <tr>
      <td style={{ textAlign: "left" }}>
        213
      </td>

      <td style={{ textAlign: "left" }}>
        Credit Card Number is invalid
      </td>

      <td style={{ textAlign: "left" }}>
        O cartão de crédito enviado é inválido
      </td>
    </tr>

    <tr>
      <td style={{ textAlign: "left" }}>
        214
      </td>

      <td style={{ textAlign: "left" }}>
        Credit Card Holder Must Have Only Letters
      </td>

      <td style={{ textAlign: "left" }}>
        Não deve conter caracteres especiais
      </td>
    </tr>

    <tr>
      <td style={{ textAlign: "left" }}>
        215
      </td>

      <td style={{ textAlign: "left" }}>
        Agency is required in Boleto Credential
      </td>

      <td style={{ textAlign: "left" }}>
        Campo obrigatório não enviado
      </td>
    </tr>

    <tr>
      <td style={{ textAlign: "left" }}>
        216
      </td>

      <td style={{ textAlign: "left" }}>
        Customer IP address is invalid
      </td>

      <td style={{ textAlign: "left" }}>
        IP bloqueado por motivos de segurança
      </td>
    </tr>

    <tr>
      <td style={{ textAlign: "left" }}>
        220
      </td>

      <td style={{ textAlign: "left" }}>
        Service tax can not be sent with 1 installment
      </td>

      <td style={{ textAlign: "left" }}>
        `ServiceTaxAmount` precisa de parcelamento superior a 1.
      </td>
    </tr>

    <tr>
      <td style={{ textAlign: "left" }}>
        228
      </td>

      <td style={{ textAlign: "left" }}>
        Customer Anddress Country is required
      </td>

      <td style={{ textAlign: "left" }}>
        Campo enviado está vazio ou inválido.
      </td>
    </tr>

    <tr>
      <td style={{ textAlign: "left" }}>
        233
      </td>

      <td style={{ textAlign: "left" }}>
        Service tax not supported for the given brand.
      </td>

      <td style={{ textAlign: "left" }}>
        `ServiceTaxAmount` não suportado pela bandeira do cartão.
      </td>
    </tr>

    <tr>
      <td style={{ textAlign: "left" }}>
        298
      </td>

      <td style={{ textAlign: "left" }}>
        Split payment facilitator data not found
      </td>

      <td style={{ textAlign: "left" }}>
        O `MerchantId` informado não existe na base de dados do ambiente selecionado (produção ou sandbox).
      </td>
    </tr>

    <tr>
      <td style={{ textAlign: "left" }}>
        300
      </td>

      <td style={{ textAlign: "left" }}>
        MerchantId was not found
      </td>

      <td style={{ textAlign: "left" }}>

      </td>
    </tr>

    <tr>
      <td style={{ textAlign: "left" }}>
        301
      </td>

      <td style={{ textAlign: "left" }}>
        Request IP is not allowed
      </td>

      <td style={{ textAlign: "left" }}>
        O serviço de restrição de IP pode estar habilitado e o IP informado não está configurado. Você pode verificar os IPs usados pela sua loja no site Cielo em E-commerce > Gestão API E-commerce > Gerenciamento de IPs. Leia mais sobre <Anchor label="Configuração de IPs na documentação" target="_blank" href="https://docs.cielo.com.br/ecommerce-cielo/docs/configura%C3%A7%C3%A3o-de-ips">Configuração de IPs na documentação</Anchor>.
      </td>
    </tr>

    <tr>
      <td style={{ textAlign: "left" }}>
        302
      </td>

      <td style={{ textAlign: "left" }}>
        Sent MerchantOrderId is duplicated
      </td>

      <td style={{ textAlign: "left" }}>

      </td>
    </tr>

    <tr>
      <td style={{ textAlign: "left" }}>
        303
      </td>

      <td style={{ textAlign: "left" }}>
        Sent OrderId does not exist
      </td>

      <td style={{ textAlign: "left" }}>

      </td>
    </tr>

    <tr>
      <td style={{ textAlign: "left" }}>
        304
      </td>

      <td style={{ textAlign: "left" }}>
        Customer Identity is required
      </td>

      <td style={{ textAlign: "left" }}>
        Campo enviado está vazio ou inválido
      </td>
    </tr>

    <tr>
      <td style={{ textAlign: "left" }}>
        306
      </td>

      <td style={{ textAlign: "left" }}>
        Merchant is blocked
      </td>

      <td style={{ textAlign: "left" }}>
        Merchant está bloqueado
      </td>
    </tr>

    <tr>
      <td style={{ textAlign: "left" }}>
        307
      </td>

      <td style={{ textAlign: "left" }}>
        Transaction not found
      </td>

      <td style={{ textAlign: "left" }}>
        Transação não encontrada ou não existe no ambiente
      </td>
    </tr>

    <tr>
      <td style={{ textAlign: "left" }}>
        308
      </td>

      <td style={{ textAlign: "left" }}>
        Transaction not available to capture
      </td>

      <td style={{ textAlign: "left" }}>
        Transação não pode ser capturada - Recomendamos consultar o [status da transação](https://docs.cielo.com.br/ecommerce-cielo/reference/payment-status) via API.  
        A captura só pode ser realizada se o status da transação for 1. Cada transação pode ser capturada apenas uma vez, mesmo em casos de captura parcial. Para saber mais, entre em contato com o suporte da Cielo.
      </td>
    </tr>

    <tr>
      <td style={{ textAlign: "left" }}>
        309
      </td>

      <td style={{ textAlign: "left" }}>
        Transaction not available to void
      </td>

      <td style={{ textAlign: "left" }}>
        Transação não pode ser cancelada - entre em contato com o suporte da Cielo.
      </td>
    </tr>

    <tr>
      <td style={{ textAlign: "left" }}>
        310
      </td>

      <td style={{ textAlign: "left" }}>
        Payment method doest not support this operation
      </td>

      <td style={{ textAlign: "left" }}>
        Comando enviado não suportado por meios de pagamento
      </td>
    </tr>

    <tr>
      <td style={{ textAlign: "left" }}>
        311
      </td>

      <td style={{ textAlign: "left" }}>
        Refund is not enabled for this merchant
      </td>

      <td style={{ textAlign: "left" }}>
        Cancelamento após 24 horas não é liberado para o comerciante
      </td>
    </tr>

    <tr>
      <td style={{ textAlign: "left" }}>
        312
      </td>

      <td style={{ textAlign: "left" }}>
        Transaction not available to refund
      </td>

      <td style={{ textAlign: "left" }}>
        A transação não permite cancelamento após 24 horas
      </td>
    </tr>

    <tr>
      <td style={{ textAlign: "left" }}>
        313
      </td>

      <td style={{ textAlign: "left" }}>
        Recurrent Payment not found
      </td>

      <td style={{ textAlign: "left" }}>
        Recorrência não está habilitada, entre em contato com o suporte Cielo para habilitar
      </td>
    </tr>

    <tr>
      <td style={{ textAlign: "left" }}>
        314
      </td>

      <td style={{ textAlign: "left" }}>
        Invalid Integration
      </td>

      <td style={{ textAlign: "left" }}>

      </td>
    </tr>

    <tr>
      <td style={{ textAlign: "left" }}>
        315
      </td>

      <td style={{ textAlign: "left" }}>
        Cannot change NextRecurrency with pending payment
      </td>

      <td style={{ textAlign: "left" }}>

      </td>
    </tr>

    <tr>
      <td style={{ textAlign: "left" }}>
        316
      </td>

      <td style={{ textAlign: "left" }}>
        Cannot set NextRecurrency to past date
      </td>

      <td style={{ textAlign: "left" }}>
        Não é permitido alterar a data de recorrência para uma data passada
      </td>
    </tr>

    <tr>
      <td style={{ textAlign: "left" }}>
        317
      </td>

      <td style={{ textAlign: "left" }}>
        Invalid Recurrency Day
      </td>

      <td style={{ textAlign: "left" }}>

      </td>
    </tr>

    <tr>
      <td style={{ textAlign: "left" }}>
        318
      </td>

      <td style={{ textAlign: "left" }}>
        No transaction found
      </td>

      <td style={{ textAlign: "left" }}>

      </td>
    </tr>

    <tr>
      <td style={{ textAlign: "left" }}>
        319
      </td>

      <td style={{ textAlign: "left" }}>
        Smart recurrency is not enabled
      </td>

      <td style={{ textAlign: "left" }}>
        Recorrência não vinculada ao cadastro do comerciante
      </td>
    </tr>

    <tr>
      <td style={{ textAlign: "left" }}>
        320
      </td>

      <td style={{ textAlign: "left" }}>
        Can not Update Affiliation Because this Recurrency not Affiliation saved
      </td>

      <td style={{ textAlign: "left" }}>

      </td>
    </tr>

    <tr>
      <td style={{ textAlign: "left" }}>
        321
      </td>

      <td style={{ textAlign: "left" }}>
        Can not set EndDate to before next recurrency
      </td>

      <td style={{ textAlign: "left" }}>

      </td>
    </tr>

    <tr>
      <td style={{ textAlign: "left" }}>
        322
      </td>

      <td style={{ textAlign: "left" }}>
        Zero Dollar Auth is not enabled
      </td>

      <td style={{ textAlign: "left" }}>
        O Zero Auth não está habilitado, entre em contato com o suporte Cielo para habilitar
      </td>
    </tr>

    <tr>
      <td style={{ textAlign: "left" }}>
        323
      </td>

      <td style={{ textAlign: "left" }}>
        Bin Query is not enabled
      </td>

      <td style={{ textAlign: "left" }}>
        A Consulta Bin não está habilitada, entre em contato com o suporte Cielo para habilitar
      </td>
    </tr>

    <tr>
      <td style={{ textAlign: "left" }}>
        841
      </td>

      <td style={{ textAlign: "left" }}>
        Status nao permite capturar
      </td>

      <td style={{ textAlign: "left" }}>
        Limite de tentativas atingido. Gere uma nova transação para capturar.
      </td>
    </tr>
  </tbody>
</Table>

<br />

***

## Códigos de retorno do provedor: `ProviderReturnCode` e `ProviderReturnMessage`

O `ProviderReturnCode` e `ProviderReturnMessage` fornecem detalhes adicionais para operações específicas e podem ser úteis para depuração. Representam o retorno direto do provedor (ex: adquirente, banco) e os valores costumam ser os mesmos retornados em [`ReturnCode` e `ReturnMessage`](https://docs.cielo.com.br/ecommerce-cielo/reference/api-codes#/tabela-de-returncode-e-returnmessage) .

Exemplos de operações que retornam o `ProviderReturnCode`:

* Devolução de Pix;
* Cancelamento;
* Conversão de moedas;
* Criação de pagamento com boleto.

<br />

***

## Códigos de motivo `ReasonCode` e `ReasonMessage`

O `ReasonCode` e `ReasonMessage` podem indicar sucesso ou erro, e estão associados aos fluxos operacionais internos da Cielo e/ou entre a Cielo e a bandeira/emissor que ocorrem depois que a API E-commerce recebe a requisição.

O `ReasonCode` indica o código, enquanto o `ReasonMessage` traz a descrição correspondente ao código. As principais operações que retornam `ReasonCode` e `ReasonMessage` são:

* Captura;
* Cancelamento;
* Conversão de moedas;
* Criação de pagamento com boleto.

### Tabela de Reason Code e Reason Message

| Reason Code | Reason Message                              | Descrição                                                                                   |
| ----------- | ------------------------------------------- | ------------------------------------------------------------------------------------------- |
| 00          | Successful                                  | Operação concluída com sucesso.                                                             |
| 01          | AffiliationNotFound                         | Afiliação/credencial do meio de pagamento não encontrada para o estabelecimento.            |
| 02          | IssuficientFunds                            | Saldo insuficiente para realizar a operação.                                                |
| 03          | CouldNotGetCreditCard                       | Não foi possível obter os dados do cartão de crédito (ex.: token inválido ou indisponível). |
| 04          | ConnectionWithAcquirerFailed                | Falha na conexão com o adquirente.                                                          |
| 05          | InvalidTransactionType                      | Tipo de transação inválido.                                                                 |
| 06          | InvalidPaymentPlan                          | Plano de pagamento (parcelamento) inválido.                                                 |
| 07          | Denied                                      | Operação negada.                                                                            |
| 08          | Scheduled                                   | Operação agendada (ex.: recorrência).                                                       |
| 09          | Waiting                                     | Operação em espera/processamento.                                                           |
| 10          | Authenticated                               | Transação autenticada com sucesso.                                                          |
| 11          | NotAuthenticated                            | Transação não autenticada.                                                                  |
| 12          | ProblemsWithCreditCard                      | Problemas identificados com o cartão de crédito informado.                                  |
| 13          | CardCanceled                                | Cartão cancelado.                                                                           |
| 14          | BlockedCreditCard                           | Cartão de crédito bloqueado.                                                                |
| 15          | CardExpired                                 | Cartão expirado.                                                                            |
| 16          | AbortedByFraud                              | Operação abortada por suspeita/bloqueio de fraude.                                          |
| 17          | CouldNotAntifraud                           | Não foi possível executar a análise antifraude.                                             |
| 18          | TryAgain                                    | Falha temporária; recomenda-se tentar novamente.                                            |
| 19          | InvalidAmount                               | Valor da transação inválido.                                                                |
| 20          | ProblemsWithIssuer                          | Problemas com o emissor do cartão.                                                          |
| 21          | InvalidCardNumber                           | Número do cartão inválido.                                                                  |
| 22          | TimeOut                                     | Tempo limite de resposta excedido.                                                          |
| 23          | CartaoProtegidoIsNotEnabled                 | Serviço Cartão Protegido não habilitado para o estabelecimento.                             |
| 24          | PaymentMethodIsNotEnabled                   | Meio de pagamento não habilitado para o estabelecimento.                                    |
| 25          | CouldNotFindPaymentToken                    | Token de pagamento não encontrado.                                                          |
| 26          | MerchantIdJustClickNotFound                 | MerchantId do Just Click não encontrado.                                                    |
| 27          | BrandNotSupported                           | Bandeira do cartão não suportada.                                                           |
| 28          | CardOptionsNotSupported                     | Opção de cartão (ex.: recorrência, parcelamento) não suportada pelo provedor.               |
| 29          | WalletKeyIsInvalid                          | Chave da carteira digital (wallet) inválida.                                                |
| 30          | MerchantWalletConfigurationNotFound         | Configuração de carteira digital não encontrada para o estabelecimento.                     |
| 31          | BoletoRequiredDataNotSupported              | Dados obrigatórios do boleto não suportados ou enviados incorretamente.                     |
| 32          | ConnectionWithAntifraudFailed               | Falha na conexão com o serviço antifraude.                                                  |
| 33          | AbortedByCardVerification                   | Operação abortada pela verificação do cartão.                                               |
| 34          | ProblemsWithAcquirer                        | Problemas com o adquirente.                                                                 |
| 35          | ValidationError                             | Erro de validação dos dados enviados.                                                       |
| 36          | AcquirerTransactionNotFound                 | Transação não encontrada no adquirente.                                                     |
| 37          | SplitTransactionalError                     | Erro transacional no processamento do Split.                                                |
| 38          | MerchantSplitConfigurationNotFound          | Configuração de Split não encontrada para o estabelecimento.                                |
| 39          | SplitSoftDescriptorIsRequired               | Soft descriptor do Split é obrigatório e não foi informado.                                 |
| 40          | SplitFraudAnalysisIsRequired                | Análise de fraude é obrigatória para a operação de Split.                                   |
| 41          | SplitAntifraudMerchantConfigurationNotFound | Configuração antifraude do Split não encontrada para o estabelecimento.                     |
| 42          | ProviderNotFound                            | Provedor não encontrado.                                                                    |
| 43          | PaymentSettingsNotFound                     | Configurações de pagamento não encontradas.                                                 |
| 44          | SubAcquirerMerchantConfigurationNotFound    | Configuração do subadquirente não encontrada para o estabelecimento.                        |
| 45          | AbortedBySubAcquirer                        | Operação abortada pelo subadquirente.                                                       |
| 98          | InvalidRequest                              | Requisição inválida.                                                                        |
| 99          | InternalError                               | Erro interno.                                                                               |
| 100         | CieloPayCardHolderIsNotActive               | Portador do cartão não está ativo no Cielo Pay.                                             |
| 101         | CieloPayStrongValidationIsInvalid           | Validação forte (autenticação) do Cielo Pay inválida.                                       |
| 102         | CieloPayExpireDateDoesNotMatch              | Data de validade informada não corresponde à registrada no Cielo Pay.                       |
| 103         | CieloPayCardHolderApiError                  | Erro na API do portador de cartão do Cielo Pay.                                             |
| 104         | SplitPaymentFacilitatorDataNotFound         | Dados do facilitador de pagamento do Split não encontrados.                                 |

<br />

<br />

***

<br />

<br />