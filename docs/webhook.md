---
updatedAt: 2026-10-28T19:44:46.000Z
agentTools:
  siteIndex: https://docs.cielo.com.br/llms.txt
  projectIndex: https://docs.cielo.com.br/ecommerce-cielo/llms.txt
---

# Post de Notificação

O **Post de Notificação** é um **webhook** que informa mudanças no status das transações e eventos relacionados a pagamentos recorrentes.

Para receber as notificações, configure no <Anchor target="_blank" href="https://www.cielo.com.br/">Site Cielo</Anchor> a URL do endpoint e selecione os eventos que deseja receber.

<CieloSequenceDiagramV1
  title="Notificação de mudança de status da transação"
  description="Fluxo em que o emissor informa a alteração de status, a API E-commerce Cielo notifica a loja e a loja consulta os detalhes da transação."
  participants={[
    { id: 'loja', label: 'Loja', category: 'external' },
    { id: 'api', label: 'API E-commerce Cielo', category: 'cielo' },
    { id: 'emissor', label: 'Emissor', category: 'external' }
  ]}
  steps={[
    {
      from: 'emissor', to: 'api',
      label: 'Informa alteração de status',
      description: 'O Emissor informa à API E-commerce Cielo a alteração de status da transação.'
    },
    {
      from: 'api', to: 'loja',
      label: 'Envia post de notificação',
      description: 'A API E-commerce Cielo envia à Loja um POST de notificação sobre a alteração de status.'
    },
    {
      type: 'return', from: 'loja', to: 'api',
      label: 'Retorna o status 200 - OK',
      description: 'A Loja retorna à API E-commerce Cielo o status 200 - OK, confirmando o recebimento da notificação.'
    },
    {
      from: 'loja', to: 'api',
      label: 'Consulta os detalhes da transação',
      description: 'A Loja consulta na API E-commerce Cielo os detalhes da transação.'
    },
    {
      type: 'return', from: 'api', to: 'loja',
      label: 'Retorna detalhes da transação',
      description: 'A API E-commerce Cielo retorna à Loja os detalhes da transação.'
    }
  ]}
/>

## Eventos notificados

O Post de Notificação pode informar eventos relacionados a cartões, Pix, boleto, carteiras digitais, Open Finance, cancelamentos e recorrência.

Os eventos disponíveis podem variar de acordo com os produtos e serviços habilitados para o estabelecimento.

Para receber as notificações, configure no Site Cielo a URL do endpoint e selecione os eventos desejados.

Consulte [URL de notificações](https://docs.cielo.com.br/ecommerce-cielo/docs/url-de-notificacoes) para saber como configurar a URL, os headers personalizados e os eventos que devem gerar notificações.

As notificações são enviadas apenas para os eventos selecionados na configuração.

## Requisitos do endpoint

O endpoint configurado para receber o Post de Notificação deve:

* Ter protocolo HTTPS;
* Usar a porta padrão HTTPS (443);
* Ser estático;
* Ter, no máximo, 255 caracteres;
* Receber conteúdo no formato `application/json`.

O endpoint deve retornar o HTTP Status Code `200 OK` ao receber a notificação.

## Headers personalizados

Para aumentar a segurança, é possível configurar headers personalizados que serão enviados ao endpoint junto com a notificação.

Cada header é composto por:

* `KEY` : nome do parâmetro, limitado a 256 caracteres;
* `VALUE`: valor estático a ser retornado, limitado a 1500 caracteres.

É possível cadastrar até três headers.

A configuração dos headers é realizada no Site Cielo. Para mais informações, consulte [URL de notificações](https://docs.cielo.com.br/ecommerce-cielo/docs/url-de-notificacoes).

## Conteúdo da notificação

O conteúdo do Post de Notificação é formado pelos seguintes campos:

* `RecurrentPaymentId`: identificador do pedido recorrente, quando aplicável;
* `PaymentId`: número de identificação do pagamento;
* `ChangeType`: identifica o tipo de notificação.

Com o `PaymentId` ou o `RecurrentPaymentId`, consulte os dados atualizados da transação em [Consulta por PaymentId](https://docs.cielo.com.br/ecommerce-cielo/reference/consulta-paymentid-api) ou [Consulta de Recorrência](https://docs.cielo.com.br/ecommerce-cielo/reference/consulta-recorrencia-api).

Veja o exemplo do conteúdo do Post de Notificação:

```json
{
  "RecurrentPaymentId": "xxxxxxxx-xxxx-xxxx-xxxx-xxxxxxxxxxxx",
  "PaymentId": "xxxxxxxx-xxxx-xxxx-xxxx-xxxxxxxxxxxx",
  "ChangeType": 2
}
```
```shell
curl
--header "key: value"
{
   "RecurrentPaymentId": "xxxxxxxx-xxxx-xxxx-xxxx-xxxxxxxxxxxx",
   "PaymentId": "xxxxxxxx-xxxx-xxxx-xxxx-xxxxxxxxxxxx",
   "ChangeType": 2
}
```

| Propriedade          | Descrição                                                                               | Tipo   | Tamanho | Obrigatório |
| -------------------- | --------------------------------------------------------------------------------------- | ------ | ------- | ----------- |
| `RecurrentPaymentId` | Identificador do pedido recorrente. Aplica-se apenas aos valores 2 e 4 de `ChangeType`. | GUID   | 36      | Não         |
| `PaymentId`          | Identificador do pagamento.                                                             | GUID   | 36      | Sim         |
| `ChangeType`         | Identifica o tipo de notificação.                                                       | Número | 1       | Sim         |

## Tabela de ChangeType

O campo `ChangeType` identifica o evento que gerou a notificação.

| ChangeType | Descrição                                                                                                                                                                                |
| ---------- | ---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| 1          | Indica que houve uma alteração no status na transação. [Consulte a transação para verificar o status atual](https://docs.cielo.com.br/ecommerce-cielo/reference/consulta-paymentid-api). |
| 2          | Recorrência criada.                                                                                                                                                                      |
| 3          | Mudança de status do Antifraude. Exclusivo para clientes integrados ao Antifraude.                                                                                                       |
| 4          | Mudança de status do pagamento recorrente (Ex. desativação automática).                                                                                                                  |
| 5          | Cancelamento negado.                                                                                                                                                                     |
| 6          | Boleto registrado pago a menor.                                                                                                                                                          |
| 7          | Notificação de chargeback. Exclusivo para clientes integrados à **Risk Notification API** (legado)\*                                                                                     |
| 8          | Alerta de fraude.                                                                                                                                                                        |
| 25         | Transação cancelada ou estornada parcialmente.                                                                                                                                           |

<br />

<Callout icon="⚠️" theme="warn">
  A API Risk Notification está sendo descontinuada. O novo serviço de consulta, aceite e disputa de chargebacks  da Cielo é a <a href="https://developercielo.github.io/manual/api-chargeback-2-0" target="_blank">API de Chargeback</a>.
</Callout>