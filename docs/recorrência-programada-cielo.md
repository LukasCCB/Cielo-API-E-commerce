---
updatedAt: 2026-03-02T19:55:38.000Z
agentTools:
  siteIndex: https://docs.cielo.com.br/llms.txt
  projectIndex: https://docs.cielo.com.br/ecommerce-cielo/llms.txt
---

# Recorrência Programada Cielo

Nesse modelo, a Cielo é a responsável por executar uma recorrência de maneira automática.

A **Recorrência Programada** permite que a loja crie a primeira transação, e ao mesmo tempo informe as regras de recorrência (repetição) para as próximas transações, como data final e intervalo da cobrança.

É possível autorizar a primeira transação no momento da criação da recorrência ou agendar uma série de recorrências.

Na **Recorrência Programada**, a API E-commerce Cielo será responsável por:

* **Salvar dados transacionais**: salva dados da transação, criando um modelo de como serão as próximas recorrências;
* **Automatizar a recorrência**: sem atuação da loja, a API cria as transações futuras de acordo com as definições informadas;
* **Atualizar dados** : caso necessário, a API permite modificações das informações da transação (como dados do comprador) ou do ciclo de recorrência (como data e intervalo).

> ℹ️ Veja como <a href="https://docs.cielo.com.br/ecommerce-cielo/docs/como-habilitar-microsservi%C3%A7os#recorr%C3%AAncia-programada" target="_blank">habilitar e configurar a Recorrência Programada Cielo</a>.

## Características da Recorrência Programada

* **Intervalos programados:** mensal, bimestral, trimestral, semestral e anual;
* **Data final da recorrência:** permite definir se a recorrência tem data para acabar;
* **Retentativa:** se uma transação for negada, a API pode retentar a aprovação da transação até quatro vezes (conforme a configuração feita no site Cielo);
* **Atualização:** permite alterar dados da recorrência, como dados do comprador, valor, dia, intervalo e outros. Também é possível desativar e reativar um pagamento recorrente.

A Recorrência Programada possui dois fluxos de requisição; a diferença está no parâmetro `AuthorizeNow`.

### Retentativas automáticas

Quando a loja utiliza a **Recorrência Programada**, a Cielo pode realizar retentativas automáticas caso uma transação recorrente seja negada.

Essa funcionalidade precisa ser habilitada no **site da Cielo**, onde é possível configurar **até quatro retentativas automáticas** para cada transação recorrente.

> ℹ️ Saiba mais sobre a configuração de uma recorrência programada em [Configurando a Recorrência](https://docs.cielo.com.br/ecommerce-cielo/docs/como-habilitar-microsservi%C3%A7os#recorr%C3%AAncia-programada).

## Criando a recorrência e aprovando a primeira transação

**Quando a primeira transação deve ser autorizada no momento do agendamento, envie`AuthorizeNow` como "true".**

```json
"RecurrentPayment":
{
       "AuthorizeNow":"true",
       "EndDate":"2030-12-01",
       "Interval":"Monthly"
}
```

<Image align="center" alt="Fluxo recorrência programada com primeira transação no momento do agendamento " src="https://files.readme.io/f282ec5-recorrencia-cielo-rec-programada-primeiratransacao.png" />

\*Se o Post de Notificação estiver configurado pela loja.

## Agendando uma recorrência

**Quando a primeira transação deve ser autorizada em momento posterior ao agendamento, envie`AuthorizeNow` como "false"; nesse caso, envie também o parâmetro `StartDate`, que representa a data de início da recorrência.**

```json
"RecurrentPayment":
{
       "AuthorizeNow":"false",
       "StartDate":"2024-06-01"
       "EndDate":"2030-12-01",
       "Interval":"Monthly"
}
```

<Image align="center" alt="Fluxo recorrência programada com primeira transação em momento posterior ao agendamento " src="https://files.readme.io/4d7119d-recorrencia-cielo-rec-programada-agendamento.png" />

\*A transação de agendamento precisa do nó `RecurrentPayment`, da data da transação e do campo `AuthorizeNow` = "false".\
\*\*Se o Post de Notificação estiver configurado pela loja.

<br />

> Quando uma transação é enviada à API E-commerce Cielo com o nó de Recorrência Programada (`RecurrentPayment`), o processo de recorrência passa a ser efetivo quando a transação é considerada **autorizada**. Desse ponto em diante, a transação passará a ocorrer dentro do intervalo definido pela loja.

<br />

## Como funciona

<Table>
  <thead>
    <tr>
      <th>
        Informação
      </th>

      <th>
        Descrição
      </th>
    </tr>
  </thead>

  <tbody>
    <tr>
      <td>
        **Criação da recorrência**
      </td>

      <td>
        A primeira transação será autorizada e todas as transações posteriores serão cópias dessa primeira transação.
      </td>
    </tr>

    <tr>
      <td>
        **Captura**
      </td>

      <td>
        É possível fazer a captura automática ou posterior da primeira transação. Após a primeira transação, todas as transações subsequentes são capturadas automaticamente pela API.
      </td>
    </tr>

    <tr>
      <td>
        **Agendamento da recorrência**
      </td>

      <td>
        A loja cria uma série de recorrências com início em data futura determinada.
      </td>
    </tr>

    <tr>
      <td>
        **Identificação**
      </td>

      <td>
        As transações de Recorrência Programada geram dois tipos de identificação:  
        **`PaymentId`**: identifica cada transação. É o mesmo identificador das outras transações na API.  
        **`RecurrentPaymentId`**: identifica pedido de recorrência.  
        Um `RecurrentPaymentId` possui inúmeros `PaymentId`s vinculados a ele. Essa é a variável usada para cancelar uma Recorrência Programada.
      </td>
    </tr>

    <tr>
      <td>
        **Consulta**
      </td>

      <td>
        É possível realizar dois tipos de consulta (de acordo com o tipo de identifição):  
        **`PaymentId`**: consulta uma transação específica dentro da recorrência.  
        **`RecurrentPaymentId`**: consulta a recorrência.
      </td>
    </tr>

    <tr>
      <td>
        **Cancelamento**
      </td>

      <td>
        Uma Recorrência Programada pode ser cancelada de duas maneiras:  
        **Por solicitação da loja**: a loja solicita a <a href="https://docs.cielo.com.br/ecommerce-cielo/reference/desabilitar-recorrencia" target="_blank"> desativação da recorrência</a>. Transações já finalizadas antes da ordem de cancelamento da recorrência não serão canceladas.  
        **Por cartão inválido**: caso a API identifique que um cartão salvo está inválido (ex.: expirado) a recorrência será cancelada e não se repetirá, até que a loja atualize o meio de pagamento.  
        **Atenção:** O cancelamento de transações dentro da recorrência não encerra o agendamento de transações futuras. Somente o cancelamento usando o <a href="https://docs.cielo.com.br/ecommerce-cielo/reference/desabilitar-recorrencia" target="_blank">**`RecurrentPaymentId`*</a> encerra agendamentos futuros.
      </td>
    </tr>
  </tbody>
</Table>

<br />

### Momento do agendamento e captura

<Image align="center" src="https://files.readme.io/088256b9b0099340123ca99512d5747d941bb090b8aee9bb353c46bf097c5a21-fluxo-rec-programada-e-agendamento.png" />

### Estrutura de um `RecurrentPaymentId`

Uma série de recorrências é identificada pelo `RecurrentPaymentId`, e cada transação da recorrência será identificada pelo próprio `PaymentId`.

<br />

<Image align="center" alt="Estrutura de um _RecurrentPaymentId_" src="https://files.readme.io/0722580-recorrencia-cielo-rec-prog-identificacao.png" />

## Caso de uso

Este é um exemplo de como usar as recorrências da API E-commerce Cielo para elevar suas vendas.

A recorrência é o processo de salvar uma transação e repeti-la em um intervalo de tempo pré-definido. É ideal para modelo de assinaturas.

**Recorrência mensal e anual**

A empresa *Musicfy* oferece um serviço de assinatura online no qual seus clientes pagam para poderem acessar uma biblioteca de músicas e ouví-las via streaming.

Para captar o máximo de clientes, eles oferecem duas maneiras de pagamento:

* Mensal, por R$19,90;
* Anual (com desconto); por R$180,00.

Como eles executam a cobrança mensal ou anual de seus clientes?

A *MusicFy* utiliza a Recorrência Programada da API E-commerce Cielo.

Ao criar uma transação, o *Musicfy* informa que o pedido em questão deve se repetir mensalmente ou anualmente e que não há data de término para a cobrança.

Quais as vantagens de usar a recorrência programada para o *MusicFy*?

1. **Facilidade:** a cobrança de mensalidade é automática, logo o *MusicFy* não precisa se preocupar em construir um sistema de cobrança;
2. **Usabilidade:** o valor das assinaturas pode ser atualizado sem a necessidade de refazer a transação. Um mês pode ser cancelado ou a recorrência pode ter um *delay* (o modelo de 30 dias gratuito) com apenas uma configuração;
3. **Segurança:** a *MusicFy* não precisa armazenar dados sensíveis do cartão e do comprador;
4. **Conversão:** a Recorrência Programada Cielo possui um sistema de retentativa automática. Caso uma das transações seja negada, ela será retentada até quatro vezes, buscando atingir a autorização.

## O que acontece se uma transação recorrente for negada?

Na Recorrência Programada, dependendo do motivo de recusa de uma transação recorrente, a API E-commerce irá realizar a retentativa, reenviando a transação para aprovação.

É possível deixar até quatro retentativas habilitadas de forma automática pelo site Cielo.

> ℹ️ Saiba mais sobre a configuração de uma recorrência programada em [Configurando a Recorrência](https://docs.cielo.com.br/ecommerce-cielo/docs/como-habilitar-microsservi%C3%A7os#recorr%C3%AAncia-programada).