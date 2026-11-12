---
updatedAt: 2025-10-30T01:15:03.000Z
agentTools:
  siteIndex: https://docs.cielo.com.br/llms.txt
  projectIndex: https://docs.cielo.com.br/ecommerce-cielo/llms.txt
---

# Lista de status da transação para cartão de débito

Possíveis status de uma transação

Lista de status retornados pela API:

| Código | Status               | Descrição                                                                 |
| ------ | -------------------- | ------------------------------------------------------------------------- |
| 0      | **NotFinished**      | Aguardando atualização de status.                                         |
| 1      | **Authorized**       | Pagamento apto a ser capturado ou definido como pago.                     |
| 2      | **PaymentConfirmed** | Pagamento confirmado e finalizado.                                        |
| 3      | **Denied**           | Pagamento negado por Autorizador.                                         |
| 10     | **Voided**           | Pagamento cancelado.                                                      |
| 11     | **Refunded**         | Pagamento cancelado após 23h59 do dia de autorização.                     |
| 12     | **Pending**          | Aguardando retorno da instituição financeira.                             |
| 13     | **Aborted**          | Pagamento cancelado por falha no processamento ou por ação do Antifraude. |