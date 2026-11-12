---
updatedAt: 2025-10-30T01:15:15.000Z
agentTools:
  siteIndex: https://docs.cielo.com.br/llms.txt
  projectIndex: https://docs.cielo.com.br/ecommerce-cielo/llms.txt
---

# Códigos e mensagens de erro Pix

| CÓDIGO | EVENTO       | MENSAGEM                                       | AÇÃO                                                                               |
| ------ | ------------ | ---------------------------------------------- | ---------------------------------------------------------------------------------- |
| 422    | Autorização  | Error on Merchant Integration                  | Verifique se o Pix consta habilitado em seu cadastro                               |
| 422    | Autorização  | Error on bki service integration for charge    | Erro Transação Pix Bancos, entre em contato com Suporte E-commerce                 |
| BP904  | Autorização  | O JSON informado não é válido                  | Entre em contato com Suporte E-commerce para avaliar o motivo.                     |
| BP901  | Autorização  | Falha na operação                              | Refaça o pagamento, caso persista entre em contato com suporte e-commerce          |
| 422    | Cancelamento | Error on pix service integration for moneyback | Não é possível cancelar a transação, A devolução ocorrerá somente se houver saldo. |
| 422    | Cancelamento | Merchant bank for moneyback is not Cielo       | Transação Pix Banco não permite operações de cancelamento                          |