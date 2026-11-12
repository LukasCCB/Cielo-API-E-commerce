---
updatedAt: 2026-10-07T20:09:11.000Z
agentTools:
  siteIndex: https://docs.cielo.com.br/llms.txt
  projectIndex: https://docs.cielo.com.br/ecommerce-cielo/llms.txt
---

# Cartão de crédito em sandbox

Com esse meio de pagamento é possível simular os fluxos de:

* Autorização;
* Captura parcial e total;
* Cancelamento;
* Consulta.

<Callout icon="⚠️" theme="warn">
  ### Atenção

  O `Provider` **"Simulado"** é exclusivo para testes em ambiente Sandbox. Não use em produção.
</Callout>

Para melhor aproveitar o meio de pagamento Simulado, você pode criar um número de cartão usando um gerador de cartões da internet ou escolhendo números aleatórios.

Para qualquer opção, os 15 primeiros dígitos do cartão podem ser aleatórios e o último dígito deve ser o número correspondente ao status da transação que deseja testar.

As informações de **Cód.Segurança (CVV)** e validade podem ser aleatórias, mantendo o CVV com 3 dígitos e a validade no formato MM/YYYY.

## Status

Os `Status` das transações são definidos pelos finais de cada cartão, assim como o `ReturnCode`.

<br />

<Table align={["left","left","left","left"]}>
  <thead>
    <tr>
      <th>
        Final do Cartão
      </th>

      <th>
        Status da Transação
      </th>

      <th>
        Código de Retorno
      </th>

      <th>
        Mensagem de Retorno
      </th>
    </tr>
  </thead>

  <tbody>
    <tr>
      <td>
        XXXX.XXXX.XXXX.XXX0
        XXXX.XXXX.XXXX.XXX1
        XXXX.XXXX.XXXX.XXX4
      </td>

      <td>
        Autorizado
      </td>

      <td>
        4/6
      </td>

      <td>
        Operação realizada com sucesso
      </td>
    </tr>

    <tr>
      <td>
        XXXX.XXXX.XXXX.XXX2
      </td>

      <td>
        Não Autorizado
      </td>

      <td>
        05
      </td>

      <td>
        Não autorizada
      </td>
    </tr>

    <tr>
      <td>
        XXXX.XXXX.XXXX.XXX3
      </td>

      <td>
        Não Autorizado
      </td>

      <td>
        57
      </td>

      <td>
        Cartão expirado
      </td>
    </tr>

    <tr>
      <td>
        XXXX.XXXX.XXXX.XXX5
      </td>

      <td>
        Não Autorizado
      </td>

      <td>
        78
      </td>

      <td>
        Cartão bloqueado
      </td>
    </tr>

    <tr>
      <td>
        XXXX.XXXX.XXXX.XXX6
      </td>

      <td>
        Não Autorizado
      </td>

      <td>
        99
      </td>

      <td>
        Timeout
      </td>
    </tr>

    <tr>
      <td>
        XXXX.XXXX.XXXX.XXX7
      </td>

      <td>
        Não Autorizado
      </td>

      <td>
        77
      </td>

      <td>
        Cartão cancelado
      </td>
    </tr>

    <tr>
      <td>
        XXXX.XXXX.XXXX.XXX8
      </td>

      <td>
        Não Autorizado
      </td>

      <td>
        70
      </td>

      <td>
        Problemas com o cartão de crédito
      </td>
    </tr>

    <tr>
      <td>
        XXXX.XXXX.XXXX.XXX9
      </td>

      <td>
        Autorização Aleatória
      </td>

      <td>
        6 ou 9
      </td>

      <td>
        6 - Operação realizada com sucesso
        9 - Timeout
      </td>
    </tr>
  </tbody>
</Table>

O cartão de teste **4024.0071.5376.3191**, por exemplo, irá simular o status **autorizado**.

<Callout icon="⚠️" theme="warn">
  ### Atenção

  - O ambiente de sandbox avalia o formato e o final do cartão. Caso um cartão real seja enviado, o resultado da operação será idêntico ao descrito na tabela de cartões de teste;
  - Os códigos de retorno em Sandbox **não são os mesmos** disponíveis em produção;
  - **Para consultar os retornos em Produção**, veja os [Códigos da API](https://docs.cielo.com.br/ecommerce-cielo/reference/api-codes).
</Callout>

<br />

## Tokenização e recorrência

Se o objetivo for testar uma transação na API Cielo E-commerce salvando o número do cartão (criando cartão tokenizado), recomendamos usar um gerador de cartões para atender a regra do mod10 (Algoritimo de Luhn), que é empregada nos ambientes Sandbox e de Produção.