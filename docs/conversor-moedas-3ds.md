---
updatedAt: 2026-11-11T17:43:21.000Z
agentTools:
  siteIndex: https://docs.cielo.com.br/llms.txt
  projectIndex: https://docs.cielo.com.br/ecommerce-cielo/llms.txt
---

# Como criar um pagamento com conversão de moedas e autenticação 3DS

<Callout icon="ℹ️" theme="info">
  Saiba mais sobre essa funcionalidade <a href="https://docs.cielo.com.br/ecommerce-cielo/docs/conversor-moedas-ecommerce" target="_blank">na documentação</a>.
</Callout>

## Autenticação 3DS

O protocolo de autenticação 3DS está disponível na versão browser-based, ou seja, a loja deverá incluir o script do 3DS no arquivo HTML da página de pagamento (checkout). O protocolo 3DS, ao processar o script, permite a troca de dados entre a loja e o emissor para autenticar o portador do cartão.<br />A integração do script do protocolo de autenticação é composta por etapas, para saber mais acesse a <a href="https://docs.cielo.com.br/ecommerce-cielo/docs/script-autenticacao" target="_blank">documentação.</a>

## Conversor de moedas e-commerce com autenticação 3DS

A criação de uma pagamento com a conversão de moeda e autenticação de 3DS segue os seguintes passos: <br />

1. Implementação do [script 3DS](https://docs.cielo.com.br/ecommerce-cielo/docs/script-autenticacao);
2. Criar pagamento com conversor de moeda, incluindo o nó do 3DS. Os campos `DynamicCurrencyConversion` e `Authenticate` devem ser enviados como *true*;
3. Confirmar a conversão de moeda, que deve ser realizada em até vinte minutos.

## Fluxo do conversor de moedas e-commerce com 3DS

<Image src="https://files.readme.io/1bdf74bd2609cecd9a435d690eb068c09180479f72b335200ddc64755c8536dc-DCC_com_3DS.PNG" align="center" />

1. O comprador escolhe pagar com cartão de crédito estrangeiro;
2. A loja executa um script, solicitando à Cielo autenticação através da solução 3DS;
3. A loja envia requisição com dados do comprador para a bandeira;
4. A bandeira envia a requisição para avaliação de risco do emissor;
5. O emissor avalia as informações e determina se o fluxo será com ou sem desafio ao portador;
6. O emissor envia o resultado da autenticação para o 3DS Server;
7. o 3DS server envia o resultado da autenticação;
8. O back-end da loja envia a requisição de autorização, informando o campo DynamicCurrencyConversion igual a *true* para verificar a elegibilidade do cartão ao conversor de moedas e o campo `Authenticate` igual a *true* para  autenticação do 3DS.
9. A API E-commerce Cielo retorna na resposta o nó `CurrencyExchangeData`, que informa se o cartão é elegível ao conversor de moedas e apresenta as opções de câmbio;
10. O front-end da loja exibe as opções de conversão na página de checkout, para decisão do comprador;
11. O comprador escolhe entre pagar em moeda estrangeira ou em real\_;
12. Se o comprador escolheu a moeda estrangeira (diferente de real), a loja envia requisição de confirmação da conversão com o campo `CurrencyConversion` igual a true;
13. A API E-commerce Cielo envia retorno de sucesso;
14. A loja envia confirmação de pagamento ao comprador.

## Criar pagamento com conversão de moedas com autenticação 3DS

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
    "MerchantOrderId": "507313793",
    "Customer": {
        "Name": "Aline de Souza"
    },
    "Payment": {
        "Type": "CreditCard",
        "Amount": 1000,
        "Provider": "Cielo",
        "Installments": 1,
         "Capture": true,
         "Authenticate": "true",
        "DynamicCurrencyConversion": true,
        "CreditCard": {
            "Holder": "Aline de Souza",
            "CardNumber": "4091688625337641",
            "ExpirationDate": "12/2035",
            "SecurityCode": "333",
            "Brand": "Visa"
        },
        "ExternalAuthentication": {
            "Cavv": "AAABB2gHA1B5EFNjWQcDAAAAAAB=",
            "Xid": "Uk5ZanBHcWw2RjRCbEN5dGtiMTB=",
            "Eci": "06",
            "Version": "2.2.0",
            "ReferenceID": "a24a5d87-b1a1-4aef-a37b-2f30b91274e6"
        }
    }
}
```

As tabelas a seguir apresentam os parâmetros que podem ser enviados para a  API na criação de um pagamento com conversão de moedas e autenticação 3DS.

### Parâmetros do header

| Propriedade   | Descrição                                                                                          | Tipo   | Tamanho | Obrigatório |
| ------------- | -------------------------------------------------------------------------------------------------- | ------ | ------- | ----------- |
| `MerchantId`  | Identificador da loja na API E-commerce Cielo.                                                     | GUID   | 36      | Sim         |
| `MerchantKey` | Chave pública para autenticação dupla na API E-commerce Cielo.                                     | string | 40      | Sim         |
| `RequestId`   | Identificador da requisição, usado quando a loja usa diferentes servidores para cada GET/POST/PUT. | GUID   | 36      | Não         |

### Parâmetros do body

<Table align={[null,null,null,"left",null]}>
  <thead>
    <tr>
      <th>
        Propriedade
      </th>

      <th>
        Tipo
      </th>

      <th>
        Tamanho
      </th>

      <th>
        Obrigatoriedade
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
        50
      </td>

      <td>
        Sim
      </td>

      <td>
        Identificação do pedido. Poderá ser usada para cancelar ou consultar a transação no futuro. <br />_Atenção: Os caracteres permitidos são apenas a-z, A-Z, 0-9. Não são permitidos caracteres especiais e espaços em branco._
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
        255
      </td>

      <td>
        Não
      </td>

      <td>
        Nome do comprador.
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
        \--
      </td>

      <td>
        Sim
      </td>

      <td>
        Tipo do meio de pagamento. Para a conversão de moedas, o tipo deve ser "CreditCard".
      </td>
    </tr>

    <tr>
      <td>
        `Payment.Amount`
      </td>

      <td>
        string
      </td>

      <td>
        15
      </td>

      <td>
        Sim
      </td>

      <td>
        Valor do pedido (ser enviado em centavos de real).
      </td>
    </tr>

    <tr>
      <td>
        `Payment.Installments`
      </td>

      <td>
        Integer
      </td>

      <td>
        2
      </td>

      <td>
        Sim
      </td>

      <td>
        Número de parcelas. Para transações parceladas, o número de parcelas será sempre maior que 1.
      </td>
    </tr>

    <tr>
      <td>
        `Payment.Capture`
      </td>

      <td>
        boolean
      </td>

      <td>
        \--
      </td>

      <td>
        Não
      </td>

      <td>
        Booleano que identifica se a autorização deve ser com captura automática ("true") ou captura posterior ("false").
      </td>
    </tr>

    <tr>
      <td>
        `Payment.Authenticate`
      </td>

      <td>
        boolean
      </td>

      <td>
        \--
      </td>

      <td>
        Sim, caso a autenticação seja validada.
      </td>

      <td>
        Indica se a transação foi autenticada via 3DS antes da autorização.
      </td>
    </tr>

    <tr>
      <td>
        `Payment.DynamicCurrencyConversion`
      </td>

      <td>
        boolean
      </td>

      <td>
        \--
      </td>

      <td>
        Sim
      </td>

      <td>
        Enviar como _true_ para solicitar a conversão do valor do pedido para a moeda local do cartão de crédito estrangeiro usado na compra.
      </td>
    </tr>

    <tr>
      <td>
        `Payment.CreditCard.CardNumber`
      </td>

      <td>
        string
      </td>

      <td>
        19
      </td>

      <td>
        Sim
      </td>

      <td>
        Número do cartão do comprador.
      </td>
    </tr>

    <tr>
      <td>
        `Payment.CreditCard.Holder`
      </td>

      <td>
        string
      </td>

      <td>
        25
      </td>

      <td>
        Sim
      </td>

      <td>
        Nome do comprador impresso no cartão. Não aceita caracteres especiais ou acentuação.
      </td>
    </tr>

    <tr>
      <td>
        `Payment.CreditCard.ExpirationDate`
      </td>

      <td>
        string
      </td>

      <td>
        7
      </td>

      <td>
        Sim
      </td>

      <td>
        Data de validade impressa no cartão. Ex. MM/AAAA.
      </td>
    </tr>

    <tr>
      <td>
        `Payment.CreditCard.SecurityCode`
      </td>

      <td>
        string
      </td>

      <td>
        4
      </td>

      <td>
        Não
      </td>

      <td>
        Código de segurança impresso no verso do cartão.
      </td>
    </tr>

    <tr>
      <td>
        `Payment.CreditCard.Brand`
      </td>

      <td>
        string
      </td>

      <td>
        10
      </td>

      <td>
        Sim
      </td>

      <td>
        Bandeira do cartão. Valores possíveis: Visa / Master
      </td>
    </tr>

    <tr>
      <td>
        `Payment.ExternalAuthentication.Eci`
      </td>

      <td>
        integer
      </td>

      <td>
        1
      </td>

      <td>
        Sim
      </td>

      <td>
        Electronic Commerce Indicator retornado no processo de autenticação.
      </td>
    </tr>

    <tr>
      <td>
        `Payment.ExternalAuthentication.ReferenceId`
      </td>

      <td>
        string
      </td>

      <td>
        36
      </td>

      <td>
        Não
      </td>

      <td>
        RequestID retornado no processo de autenticação.

        * O ReferenceId não é retornado em todas as autenticações.
        * O envio é recomendado caso o `ReferenceId` tenha sido retornado no script.
      </td>
    </tr>

    <tr>
      <td>
        `Payment.ExternalAuthentication.Cavv`
      </td>

      <td>
        string
      </td>

      <td>
        \--
      </td>

      <td>
        Sim
      </td>

      <td>
        Assinatura retornada nos cenários de sucesso na autenticação.<br />**⚠️Este campo é obrigatório para transações que foram autenticadas pelo emissor ou pela bandeira e nas solicitações de autorizações com Data Only.**
      </td>
    </tr>

    <tr>
      <td>
        `Payment.ExternalAuthentication.Xid`
      </td>

      <td>
        string
      </td>

      <td>
        \--
      </td>

      <td>
        Não
      </td>

      <td>
        XID retornado no processo de autenticação.

        * O Xid não é retornado em todas as autenticações.
        * O envio é recomendado caso o Xid tenha sido retornado no script.
      </td>
    </tr>

    <tr>
      <td>
        `Payment.ExternalAuthentication.Version`
      </td>

      <td>
        string
      </td>

      <td>
        5
      </td>

      <td>
        Sim
      </td>

      <td>
        **Campo obrigatório para transações com autenticação 3DS**.<br />Versão do 3DS aplicado no processo de autenticação.<br />Valores possíveis:

        * Visa e Mastercard: "2.2.0"
        * Elo e Amex: "2.1.0"<br />
      </td>
    </tr>
  </tbody>
</Table>

### Resposta

```json
{
  "MerchantOrderId": "507121234",
  "Customer": {
    "Name": "Aline de Souza"
  },
  "Payment": {
    "ServiceTaxAmount": 0,
    "Installments": 1,
    "Interest": 0,
    "Capture": true,
    "Authenticate": true,
    "Recurrent": false,
    "CreditCard": {
      "CardNumber": "409168******7641",
      "Holder": "Aline de Souza",
      "ExpirationDate": "12/2035
      "SaveCard": false,
      "Brand": "Visa"
    },
    "Tid": "28875720024AFF9F",
    "Provider": "Cielo",
    "Eci": "6",
    "ExternalAuthentication": {
      "Cavv": "AAABB2gHA1B5EFNjWQcDAAAAAAB=",
      "Xid": "Uk5ZanBHcWw2RjRCbEN5dGtiMTB=",
      "Eci": "06",
      "Version": "2.2.0",
      "ReferenceId": "24a5d87-b1a1-4aef-a37b-2f30b91274e6"
    },
    "IsQrCode": false,
    "DynamicCurrencyConversion": true,
    "CurrencyExchangeData": {
      "CurrencyExchanges": [
        {
          "ConvertedAmount": 21,
          "ConversionRate": 0.206799,
          "Currency": "USD"
        }
      ]
    },
    "Amount": 100,
    "ReceivedDate": "2025-05-15 09:43:32",
    "Status": 12,
    "IsSplitted": false,
    "ReturnMessage": "Deseja pagar na moeda do seu País? Would you like to pay in your currency? ¿Quieres pagar en la moneda de tu país?",
    "ReturnCode": "1",
    "PaymentId": "cedbc789647eb-ba5d-609955d582ff34"
    "Type": "CreditCard",
    "Currency": "BRL",
    "Country": "BRA",
    "Links": [
      {
        "Method": "GET",
        "Rel": "self",
        "Href": "https://apiquery.cieloecommerce.cielo.com.br/1/sales/cedbc48e-81ba-47eb-ba5d-609955d344ee"
      },
      {
        "Method": "PUT",
        "Rel": "confirm",
        "Href": "https://api.cieloecommerce.cielo.com.br/1/sales/cedbc48e-81ba-47eb-ba5d-609955d344ee/confirm"
      }
    ]
  }
}
```

A tabela a seguir apresenta os principais parâmetros que podem ser retornados pela API na criação de um pagamento com conversão de moedas e autenticação 3DS.

| Propriedade                                              | Descrição                                                                                                                                                                                                                     | Tipo    | Tamanho |
| -------------------------------------------------------- | ----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- | ------- | ------- |
| `CurrencyExchangeData.CurrencyExchanges.ConvertedAmount` | Valor convertido pelo DCC                                                                                                                                                                                                     | string  | 50      |
| `CurrencyExchangeData.CurrencyExchanges.ConversionRate`  | Taxa de câmbio do DCC                                                                                                                                                                                                         | string  | 255     |
| `CurrencyExchangeData.CurrencyExchanges.currency`        | Moeda local do cartão do comprador                                                                                                                                                                                            | string  | 15      |
| `Payment.Eci`                                            | Electronic Commerce Indicator retornado no processo de autenticação após a autorização. \_Para validar se a autenticação foi acatada na resposta da autorização, considere o ECI fora do nó `Payment.ExternalAuthentication`. | Integer | 1       |

\*Para verificar se a transação foi autorizada  com sucesso consulte o `Retuncode` , `ReturnMessage` e o `Status`.

\*Status 12: indica que a transação está pendente, aguardando uma requisição de [confirmação da loja ](https://docs.cielo.com.br/ecommerce-cielo/page/conversao-moedas-autenticacao-3ds#confirmar-convers%C3%A3o-da-moeda) para prosseguir com a transação.

A loja deve preparar a página de checkout para apresentar uma tela com as opções de conversão de moedas ao comprador, com base nas opções retornadas no nó `CurrencyExchangeData`.

> **Atenção**: O exemplo desta página apresenta os parâmetros necessários para o Conversor de Moedas E-commerce e a autenticação 3DS e apenas os parâmetros obrigatórios para uma transação de cartão de crédito. Para verificar todos os parâmetros possíveis, vá para [Criar pagamento com cartão de crédito](https://docs.cielo.com.br/ecommerce-cielo/reference/criar-pagamento-credito).

<Callout icon="⚠️" theme="warn">
  ### Importante

  * O valor da transação aparecerá em reais (R$) ao fazer consultas;
  * No site Cielo em pesquisa de transações o valor capturado aparecerá em reais (R$);
  * Para o comprador após confirmar a conversão de moeda o valor aparecerá convertido na moeda escolhida;
  * A operação de captura pode ser automática ou posterior mas deve ser feita em até 20 minutos.
</Callout>

## Confirmar conversão da moeda

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
        `https://api.cieloecommerce.cielo.com.br/1/sales/{PaymentId}/confirm`
      </td>
    </tr>
  </tbody>
</Table>

```json
{
    "CurrencyConversion": true
}
```

A tabela a seguir apresenta os parâmetros que podem ser enviados para a  API na confirmação da conversão da moeda.

### Parâmetros do header

| Propriedade    | Tipo   | Tamanho | Obrigatório | Descrição                                                                                          |
| :------------- | :----- | :------ | :---------- | :------------------------------------------------------------------------------------------------- |
| `MerchantId`   | String | 36      | Sim         | Identificador da loja no Split de Pagamento                                                        |
| `MerchantKey`  | String | 40      | Sim         | Chave Publica para Autenticação Dupla no Split de Pagamento                                        |
| `Content-Type` | String | 40      | Sim         | Application/json                                                                                   |
| `RequestId`    | string | 36      | Não         | Identificador da requisição, usado quando a loja usa diferentes servidores para cada GET/POST/PUT. |

### Parâmetro do Path

| Propriedade | Tipo   | Tamanho | Obrigatoriedade | Descrição                                                                                                      |
| :---------- | :----- | :------ | :-------------- | :------------------------------------------------------------------------------------------------------------- |
| `PaymentId` | string | 36      | Sim             | Número de identificação do pagamento, necessário para futuras operações como Consulta, Captura e Cancelamento. |

### Parâmetro do body

| Propriedade          | Tipo     | Tamanho | Obrigatoriedade | Descrição                                                                                                                                                                                                                                                      |
| -------------------- | -------- | ------- | :-------------- | -------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| `CurrencyConversion` | Booleano | 50      | Sim             | Booleano que confirma que o comprador optou por realizar a conversão. <br />Quando *true*, indica que a transação será submetida para autorização na moeda estrangeira. <br />Quando *false*, indica que a transação será submetida para autorização em reais. |

## Resposta

```json
{
  "Status": 2,
  "ReasonCode": 0,
  "ReasonMessage": "Successful",
  "ProviderReturnCode": "6",
  "ProviderReturnMessage": "Transacao capturada com sucesso",
  "ReturnCode": "6",
  "ReturnMessage": "Transacao capturada com sucesso",
  "Tid": "28FGHJKTIOLPDSD28GM88FC",
  "ProofOfSale": "027113",
  "AuthorizationCode": "025930",
  "Links": [
    {
      "Method": "GET",
      "Rel": "self",
      "Href": "https://apiquery.cieloecommerce.cielo.com.br/1/sales/cedbc48e-81ba-47eb-ba5d-609955d344ee"
    },
    {
      "Method": "PUT",
      "Rel": "void",
      "Href": "https://api.cieloecommerce.cielo.com.br/1/sales/cedbc48e-81ba-47eb-ba5d-609955d344ee/void"
    }
  ]
}
```

Depois que o comprador decide pagar na moeda estrangeira, a loja deve enviar a requisição de confirmação da conversão com o campo `CurrencyConversion` igual a *true*.  Após a confirmação, a API E-commerce Cielo irá submeter a transação para autorização.

<Callout icon="⚠️" theme="warn">
  ### Atenção ao tempo limite para confirmação

  A confirmação deve ser feita em até vinte minutos.

  Se o tempo para confirmação da moeda desejada for superior a vinte minutos, a API irá retornar o código **020** com a mensagem “Status não permite autorização”.

  Se a captura não for automática (`Payment.Capture` igual a _true_), a captura posterior também deve se feita em até 20 minutos, para garantir o câmbio ao comprador.
</Callout>