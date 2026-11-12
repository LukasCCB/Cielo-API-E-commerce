---
updatedAt: 2026-04-15T14:45:14.000Z
agentTools:
  siteIndex: https://docs.cielo.com.br/llms.txt
  projectIndex: https://docs.cielo.com.br/ecommerce-cielo/llms.txt
---

# Status da transação

Esta é a informação mais importante para entender o estado de um pagamento, ou seja, em qual etapa do ciclo de vida a transação está.

O status transacional  é retornado no corpo da resposta, em `Payment.Status`, sempre que uma transação é criada (HTTP 201 Created) ou consultada com sucesso (HTTP 200 OK).

<Table align={["left","left","left","left"]}>
  <thead>
    <tr>
      <th style={{ textAlign: "left" }}>
        Código
      </th>

      <th style={{ textAlign: "left" }}>
        Status
      </th>

      <th style={{ textAlign: "left" }}>
        Meio de pagamento
      </th>

      <th style={{ textAlign: "left" }}>
        Descrição
      </th>
    </tr>
  </thead>

  <tbody>
    <tr>
      <td style={{ textAlign: "left" }}>
        0
      </td>

      <td style={{ textAlign: "left" }}>
        **NotFinished**
      </td>

      <td style={{ textAlign: "left" }}>
        Todos
      </td>

      <td style={{ textAlign: "left" }}>
        Aguardando atualização de status.
      </td>
    </tr>

    <tr>
      <td style={{ textAlign: "left" }}>
        1
      </td>

      <td style={{ textAlign: "left" }}>
        **Authorized**
      </td>

      <td style={{ textAlign: "left" }}>
        Todos
      </td>

      <td style={{ textAlign: "left" }}>
        Pagamento apto a ser capturado ou definido como pago.
      </td>
    </tr>

    <tr>
      <td style={{ textAlign: "left" }}>
        2
      </td>

      <td style={{ textAlign: "left" }}>
        **PaymentConfirmed**
      </td>

      <td style={{ textAlign: "left" }}>
        Todos
      </td>

      <td style={{ textAlign: "left" }}>
        Pagamento confirmado e finalizado.
      </td>
    </tr>

    <tr>
      <td style={{ textAlign: "left" }}>
        3
      </td>

      <td style={{ textAlign: "left" }}>
        **Denied**
      </td>

      <td style={{ textAlign: "left" }}>
        Cartões de crédito e débito (transferência eletrônica) e e-wallets.
      </td>

      <td style={{ textAlign: "left" }}>
        Pagamento negado por Autorizador.
      </td>
    </tr>

    <tr>
      <td style={{ textAlign: "left" }}>
        10
      </td>

      <td style={{ textAlign: "left" }}>
        **Voided**
      </td>

      <td style={{ textAlign: "left" }}>
        Todos, exceto boleto e Pix.
      </td>

      <td style={{ textAlign: "left" }}>
        Pagamento cancelado.
      </td>
    </tr>

    <tr>
      <td style={{ textAlign: "left" }}>
        11
      </td>

      <td style={{ textAlign: "left" }}>
        **Refunded**
      </td>

      <td style={{ textAlign: "left" }}>
        Cartões de crédito e débito, e-wallets e Pix.
      </td>

      <td style={{ textAlign: "left" }}>
        Pagamento cancelado após 23h59 do dia de autorização.  
        Para transações Pix com devolução do valor total, o status sempre será 11.
      </td>
    </tr>

    <tr>
      <td style={{ textAlign: "left" }}>
        12
      </td>

      <td style={{ textAlign: "left" }}>
        **Pending**
      </td>

      <td style={{ textAlign: "left" }}>
        Cartões de crédito e débito (transferência eletrônica), e-wallets e pix.
      </td>

      <td style={{ textAlign: "left" }}>
        Aguardando retorno da instituição financeira.
      </td>
    </tr>

    <tr>
      <td style={{ textAlign: "left" }}>
        13
      </td>

      <td style={{ textAlign: "left" }}>
        **Aborted**
      </td>

      <td style={{ textAlign: "left" }}>
        Todos
      </td>

      <td style={{ textAlign: "left" }}>
        Pagamento cancelado por falha no processamento ou por ação do Antifraude.
      </td>
    </tr>

    <tr>
      <td style={{ textAlign: "left" }}>
        20
      </td>

      <td style={{ textAlign: "left" }}>
        **Scheduled**
      </td>

      <td style={{ textAlign: "left" }}>
        Cartão de crédito e e-wallets.
      </td>

      <td style={{ textAlign: "left" }}>
        Recorrência agendada.
      </td>
    </tr>
  </tbody>
</Table>