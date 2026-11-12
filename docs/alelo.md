---
updatedAt: 2026-10-14T14:48:36.000Z
agentTools:
  siteIndex: https://docs.cielo.com.br/llms.txt
  projectIndex: https://docs.cielo.com.br/ecommerce-cielo/llms.txt
---

# Alelo

> ℹ️
>
> Vá para a <a href="https://docs.cielo.com.br/ecommerce-cielo/reference/criar-pagamento-com-voucher" target="\_blank">Referência da API para acessar os exemplos completos de requisição e resposta</a>.

A API E-commerce Cielo permite que estabelecimentos aceitem pagamentos com **voucher Alelo** em sua loja online.

Para processar um pagamento com cartão Alelo via API E-commerce Cielo, utilize o mesmo formato de requisição usado para uma transação com cartão de débito.

Além disso, é necessário configurar os seguintes parâmetros:

* `Payment.Authenticate` precisa estar como **"false"** ou não ser enviado;
* `DebitCard.Brand` precisa ser enviada como **"Elo"**.

## Habilitação do voucher Alelo

> ⚠️
>
> Para que o estabelecimento (EC) possa aceitar pagamentos com **voucher Alelo** via API E-commerce Cielo, é necessário que essa funcionalidade esteja previamente habilitada. **A habilitação deve ser solicitada diretamente à Alelo.**

Após a habilitação da bandeira pela Alelo, o lojista pode seguir com o desenvolvimento da integração com a API da Cielo.

Para verificar se a bandeira Alelo está habilitada, acesse o <a href="https://www.cielo.com.br/" target="_blank">site Cielo</a> na **seção de taxas e planos**.