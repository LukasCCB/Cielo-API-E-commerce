---
updatedAt: 2025-10-30T01:19:09.000Z
agentTools:
  siteIndex: https://docs.cielo.com.br/llms.txt
  projectIndex: https://docs.cielo.com.br/ecommerce-cielo/llms.txt
---

# Criar cartão tokenizado durante a autorização

Solicita a tokenização de um cartão no momento da criação do pagamento de crédito.

Para salvar um cartão criando o token durante a autorização da transação de crédito ou débito, envie a requisição padrão de transação de crédito e no campo `SaveCard` informe o valor “true”.

A resposta da requisição retornará o token do cartão no campo `CardToken`.

> ℹ️ Confira a requisição padrão de [cartão de crédito](https://docs.cielo.com.br/ecommerce-cielo/reference/criar-pagamento-credito).

Saiba mais sobre o <a href="https://docs.cielo.com.br/ecommerce-cielo/docs/cielo-tokenization" target="_blank">**Cartão Protegido** na documentação</a>.