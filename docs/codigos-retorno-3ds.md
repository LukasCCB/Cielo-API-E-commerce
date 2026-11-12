---
updatedAt: 2025-10-30T01:03:36.000Z
agentTools:
  siteIndex: https://docs.cielo.com.br/llms.txt
  projectIndex: https://docs.cielo.com.br/ecommerce-cielo/llms.txt
---

# Códigos de retorno 3DS

## Lista de Return Codes

São retornados como resposta à execução do script e também após autorização.

Na tabela a seguir, apresentamos os Return Codes que podem retornar como resultado de uma requisição.

<Table>
  <thead>
    <tr>
      <th>
        Reason Code
      </th>

      <th>
        Descrição
      </th>
    </tr>
  </thead>

  <tbody>
    <tr>
      <td>
        100
      </td>

      <td>
        Transação realizada com sucesso.
      </td>
    </tr>

    <tr>
      <td>
        101
      </td>

      <td>
        Está faltando um ou mais campos obrigatórios na requisição.\
        Ação possível: confira os campos **missingField\_0** até **missingField\_N** na resposta. Envie a requisição novamente com a informação completa.
      </td>
    </tr>

    <tr>
      <td>
        102
      </td>

      <td>
        Um ou mais campos da requisição contêm dados inválidos.\
        Ação possível: confira os campos  **invalidField\_0** até **invalidField\_N** na resposta. Reenvie a requisição com a informação correta.
      </td>
    </tr>

    <tr>
      <td>
        150
      </td>

      <td>
        Erro: falha geral no sistema.\
        Ação possível: aguarde alguns minutos e envie a requisição novamente.
      </td>
    </tr>

    <tr>
      <td>
        151
      </td>

      <td>
        Erro: a requisição foi recebida, mas houve *time-out* do servidor. Esse erro não inclui *time-outs* entre cliente e servidor.\
        Ação possível: aguarde alguns minutos e envie a requisição novamente.
      </td>
    </tr>

    <tr>
      <td>
        152
      </td>

      <td>
        Erro: a requisição foi recebida, mas houve *time-out* de serviço.\
        Ação possível: aguarde alguns minutos e envie a requisição novamente.
      </td>
    </tr>

    <tr>
      <td>
        234
      </td>

      <td>
        Há um problema na sua configuração de merchant.\
        Ação possível: não envie a requisição novamente. Entre em contato com o suporte da Braaspag para corrigir o problema de configuração.
      </td>
    </tr>

    <tr>
      <td>
        475
      </td>

      <td>
        O cliente está registrado na autenticação do pagante. Faça a autenticação do portador do cartão antes de prosseguir com a transação.
      </td>
    </tr>

    <tr>
      <td>
        476
      </td>

      <td>
        O cliente não pode ser autenticado.\
        Ação possível: revise o pedido do cliente.
      </td>
    </tr>

    <tr>
      <td>
        MPI901
      </td>

      <td>
        Erro inesperado.
      </td>
    </tr>

    <tr>
      <td>
        MPI902
      </td>

      <td>
        Resposta inesperada da autenticação.
      </td>
    </tr>

    <tr>
      <td>
        MPI900
      </td>

      <td>
        Ocorreu um erro.
      </td>
    </tr>

    <tr>
      <td>
        MPI601
      </td>

      <td>
        Desafio omitido.
      </td>
    </tr>

    <tr>
      <td>
        MPI600
      </td>

      <td>
        Bandeira não suporta a autenticação.
      </td>
    </tr>
  </tbody>
</Table>