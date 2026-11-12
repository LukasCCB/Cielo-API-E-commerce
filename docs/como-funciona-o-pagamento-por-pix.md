---
updatedAt: 2026-10-14T14:48:30.000Z
agentTools:
  siteIndex: https://docs.cielo.com.br/llms.txt
  projectIndex: https://docs.cielo.com.br/ecommerce-cielo/llms.txt
---

# Como funciona o pagamento por Pix

Uma transação de **Pix** é diferente de uma transação de cartão de crédito ou débito.

Para pagamentos com cartão, a loja solicita a transação à API E-commerce Cielo, que autoriza o pagamento e retorna a resposta com a transação concluída.

Para uma transação Pix, a loja primeiro gera um QR Code Pix. O comprador faz o pagamento e, após isso, a transação Pix é criada. A loja então recebe uma notificação de alteração de status do pagamento e consulta os dados da transação.

<Image align="center" src="https://files.readme.io/a23b68225789a02fab91e6913c7fb1509c99385a2ee04b2b8217c882db2c3c78-fluxo-pix-api30.png" />

| Sequência | Responsável          | Descrição                                                                                                                                                             | Status da transação |
| :-------- | :------------------- | :-------------------------------------------------------------------------------------------------------------------------------------------------------------------- | :------------------ |
| 1         | Comprador            | Escolhe pagar por Pix                                                                                                                                                 | -                   |
| 2         | Loja                 | Envia requisição para gerar QR Code Pix. A resposta dessa requisição inclui o `SentOrderId` (txid), identificador do objeto de pagamento.                             | 12 - Pendente       |
| 3         | API E-commerce Cielo | Solicita o QR Code Pix ao provedor Pix.                                                                                                                               | 12 - Pendente       |
| 4         | Provedor             | Retorna o QR Code Pix em string.                                                                                                                                      | 12 - Pendente       |
| 5         | API E-commerce Cielo | Retorna o QR Code Pix em string.                                                                                                                                      | 12 - Pendente       |
| 6         | Loja                 | Apresenta o QR Code para o comprador.                                                                                                                                 | 12 - Pendente       |
| 7         | Comprador            | Efetua o pagamento.                                                                                                                                                   | 12 - Pendente       |
| 8         | App de pagamento     | Efetiva o pagamento.                                                                                                                                                  | 12 - Pendente       |
| 9         | Provedor             | Confirma o pagamento.                                                                                                                                                 | 2 - Pago            |
| 10        | API E-commerce Cielo | Atualiza o status da transação e envia notificação para a loja.                                                                                                       | 2 - Pago            |
| 11        | Loja                 | Consulta o status da transação na API E-commerce Cielo. A resposta dessa requisição inclui o `EndToEndId`, identificador da transação que só existe após o pagamento. | 2 - Pago            |
| 12        | API E-commerce Cielo | Confirma o pagamento.                                                                                                                                                 | 2 - Pago            |
| 13        | Loja                 | Confirma o pagamento para o comprador.                                                                                                                                | 2 - Pago            |

> ℹ️
>
> A configuração do webhook de Post de Notificação é importante para estabelecimentos que têm urgência na confirmação do pagamento.