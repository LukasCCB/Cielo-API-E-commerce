---
updatedAt: 2025-10-30T01:15:17.000Z
agentTools:
  siteIndex: https://docs.cielo.com.br/llms.txt
  projectIndex: https://docs.cielo.com.br/ecommerce-cielo/llms.txt
---

# Lista de status da transação Pix

Possíveis status de uma transação

Lista de status retornados pela API:

<Table>
  <thead>
    <tr>
      <th>
        Código
      </th>

      <th>
        Status
      </th>

      <th>
        Descrição
      </th>
    </tr>
  </thead>

  <tbody>
    <tr>
      <td>
        0
      </td>

      <td>
        **NotFinished**
      </td>

      <td>
        Falhou a geração do QRCode.
      </td>
    </tr>

    <tr>
      <td>
        1
      </td>

      <td>
        **Authorized**
      </td>

      <td>
        Pagamento apto a ser capturado ou definido como pago.
      </td>
    </tr>

    <tr>
      <td>
        2
      </td>

      <td>
        **PaymentConfirmed**
      </td>

      <td>
        Pagou QRCode;\
        Solicitou estorno;\
        Processou estorno parcial.
      </td>
    </tr>

    <tr>
      <td>
        11
      </td>

      <td>
        **Refunded**
      </td>

      <td>
        Processou estorno total.\
        Pagamento cancelado após 23h59 do dia de autorização.\
        Para transações Pix com devolução do valor total, o status sempre será 11.
      </td>
    </tr>

    <tr>
      <td>
        12
      </td>

      <td>
        **Pending**
      </td>

      <td>
        Gerou QRCode.
      </td>
    </tr>

    <tr>
      <td>
        13
      </td>

      <td>
        **Aborted**
      </td>

      <td>
        Pagamento cancelado por falha no processamento ou por ação do Antifraude.
      </td>
    </tr>
  </tbody>
</Table>