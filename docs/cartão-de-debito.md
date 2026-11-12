---
updatedAt: 2025-10-30T01:03:39.000Z
agentTools:
  siteIndex: https://docs.cielo.com.br/llms.txt
  projectIndex: https://docs.cielo.com.br/ecommerce-cielo/llms.txt
---

# Cartão de débito

Esse meio de pagamento é liberado automaticamente junto a afiliação da Cielo.

> ℹ️
>
> Vá para a <a href="https://docs.cielo.com.br/ecommerce-cielo/reference/debito" target="\_blank">Referência da API para acessar os exemplos completos de requisição e resposta</a>.

## Fluxo da transação de cartão de débito

A transação de cartão de débito é composta pela etapa da <Glossary>autenticação</Glossary> 3DS, que confirma que o comprador é de fato o titular do cartão e, em seguida, pela etapa de criação e <Glossary>autorização</Glossary> da transação.

<Image alt="Fluxo transacional de cartão de débito" align="center" src="https://files.readme.io/01f93ee-fluxo-debito-pt.png" />

1. O comprador escolhe pagar com cartão de débito;
2. A loja executa o script, solicitando à Cielo autenticação através da solução 3DS 2.2;
3. O 3DS Server solicita a autenticação para bandeira e emissor;
4. Se houver desafio, o emissor apresenta desafio ao comprador;
5. Se houver desafio, o <Glossary>portador</Glossary> responde ao desafio;
6. Bandeira e/ou emissor retornam o resultado da autenticação para o 3DS Server;
7. O 3DS Server retorna o resultado da autenticação para a loja;
8. A loja envia a requisição de autorização da transação de cartão de débito, informando os dados retornados na autenticação 3DS;
9. A API E-commerce Cielo solicita autorização da bandeira e emissor;
10. Bandeira e emissor enviam resultado da autorização;
11. A API E-commerce Cielo retorna o resultado da autorização e efetiva cobrança (caso autorizada);
12. A loja confirma o pagamento ao comprador.

## Autenticação das transações de cartão de débito

A autenticação de uma transação assegura que a pessoa que está tentando fazer uma compra online é de fato a pessoa titular do cartão.

> Todas as transações de débito devem ser autenticadas por exigência dos bancos emissores e bandeiras, com o objetivo de promover maior segurança.

Para autenticar uma transação de débito, usamos o protocolo EMV 3DS 2.2; esse protocolo é um script integrado ao seu e-commerce que verifica a identidade do portador do cartão enquanto mantém uma boa experiência de compra ao consumidor e reduz o risco de fraude.

Para integrar o método de autenticação, consulte a [documentação do 3DS](https://docs.cielo.com.br/ecommerce-cielo/docs/3ds-sobre)

> ℹ️
>
> A Cielo não disponibiliza mais a primeira versão do protocolo de autenticação (3DS 1.0) já que as bandeiras e emissores descontinuaram essa solução.