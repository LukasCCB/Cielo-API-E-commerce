---
updatedAt: 2025-10-30T01:19:47.000Z
agentTools:
  siteIndex: https://docs.cielo.com.br/llms.txt
  projectIndex: https://docs.cielo.com.br/ecommerce-cielo/llms.txt
---

# Criando pagamentos recorrentes

A API E-commerce Cielo permite criar pagamentos recorrentes com cartão de crédito.

Veja na tabela a seguir as principais diferenças entres os modelos de recorrência e momento da autorização:

<Table align={["left","left"]}>
  <thead>
    <tr>
      <th>
        Tipo de Recorrência
      </th>

      <th>
        Particularidades
      </th>
    </tr>
  </thead>

  <tbody>
    <tr>
      <td>
        Recorrência Própria
      </td>

      <td>
        É usada quando a loja cria a própria inteligência de repetição de compra e armazena os dados do cartão.\
        A requisição segue a estrutura de uma transação de crédito padrão, mas o parâmetro `Payment.Recurrent` deve ser `true`; caso contrário, a transação será negada.
      </td>
    </tr>

    <tr>
      <td>
        Recorrência Programada
      </td>

      <td>
        É usada quando a Cielo é responsável pela inteligência da repetição e armazenamento dos dados do cartão.\
        Nessa modalidade de recorrência, a primeira transação deve ser autorizada (`AuthorizeNow` = "true"). Todas as transações posteriores serão autorizadas e capturadas automaticamente.
      </td>
    </tr>

    <tr>
      <td>
        Agendar uma Recorrência Programada
      </td>

      <td>
        O agendamento não autoriza imediatamente, mas agenda uma autorização futura.\
        Para programar a primeira transação da série de recorrências, envie o parâmetro `AuthorizeNow` como “false” e adicione o parâmetro `StartDate`.
      </td>
    </tr>

    <tr>
      <td>
        Recorrência com cartão tokenizado
      </td>

      <td>
        É possível criar uma recorrência usando um cartão tokenizado. Para isso, envie o campo`Payment.CreditCard.CardToken`.
      </td>
    </tr>
  </tbody>
</Table>