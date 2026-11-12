---
updatedAt: 2025-10-30T01:16:57.000Z
agentTools:
  siteIndex: https://docs.cielo.com.br/llms.txt
  projectIndex: https://docs.cielo.com.br/ecommerce-cielo/llms.txt
---

# Lista de status da transação boleto

Possíveis status de uma transação

Lista de status retornados pela API:

| Código | Status               | Descrição                                                                 |
| ------ | -------------------- | ------------------------------------------------------------------------- |
| 0      | **NotFinished**      | Falhou a geração do boleto.                                               |
| 1      | **Authorized**       | Boleto gerado com sucesso e apto a ser pago.                              |
| 2      | **PaymentConfirmed** | Boleto pago.                                                              |
| 13     | **Aborted**          | Pagamento cancelado por falha no processamento ou por ação do Antifraude. |