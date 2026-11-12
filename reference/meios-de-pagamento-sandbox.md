---
updatedAt: 2026-10-07T20:09:11.000Z
agentTools:
  siteIndex: https://docs.cielo.com.br/llms.txt
  projectIndex: https://docs.cielo.com.br/ecommerce-cielo/llms.txt
---

# Outros meios de pagamento em sandbox

<Callout icon="⚠️" theme="warn">
  ### Atenção

  O `Provider` **"Simulado"** é exclusivo para testes em ambiente Sandbox. Não use em produção.
</Callout>

Outros meios de pagamento não possuem cartões ou dados específicos simulados, como no caso do cartão de crédito.\
Abaixo especificamos qualquer diferença existente:

<Table>
  <thead>
    <tr>
      <th>
        Meio de pagamento
      </th>

      <th>
        Orientações para Sandbox
      </th>
    </tr>
  </thead>

  <tbody>
    <tr>
      <td>
        Boleto
      </td>

      <td>
        Para enviar uma transação de boleto no ambiente sandbox você deve colocar o `Provider` como **"Simulado"**.\
        O `Provider` **"Simulado"** é exclusivo para testes em ambiente Sandbox. Não use em produção.\
        Não há validação bancária. O boleto se comporta como um boleto sem registro.
      </td>
    </tr>

    <tr>
      <td>
        Pix
      </td>

      <td>
        Para criar um QR Code Pix em sandbox, é necessário apenas preencher os campos obrigatórios. O status sempre será "12" (pendente) e não é possível alterar o status para pago.
      </td>
    </tr>

    <tr>
      <td>
        QR Code
      </td>

      <td>
        Use os mesmos valores da requisição do ambiente de produção para [QR Code](https://docs.cielo.com.br/ecommerce-cielo/reference/qr-code-api). Não tem a conciliação bancária.  

        **Cartão de crédito via QR Code em Sandbox**  

        Para testar em sandbox o cenário de autorização com sucesso via QRCode, utilize o cartão **4551.8700.0000.0183**  

        As informações de **Cód.Segurança (CVV)** e validade podem ser aleatórias, mantendo o formato:  

        * CVV com 3 dígitos;
        * Validade no formato *MM/YYYY*.
      </td>
    </tr>

    <tr>
      <td>
        Carnê
      </td>

      <td>
        Use os mesmos valores da requisição do ambiente de produção para [Carnê](https://docs.cielo.com.br/ecommerce-cielo/reference/carne-api).
      </td>
    </tr>
  </tbody>
</Table>