---
updatedAt: 2025-10-30T01:03:41.000Z
agentTools:
  siteIndex: https://docs.cielo.com.br/llms.txt
  projectIndex: https://docs.cielo.com.br/ecommerce-cielo/llms.txt
---

# Cartão de crédito

> ℹ️
>
> Vá para a <a href="https://docs.cielo.com.br/ecommerce-cielo/reference/criar-pagamento-credito" target="\_blank">Referência da API para acessar os exemplos completos de requisição e resposta</a>.

Para que você possa usar todos os recursos disponíveis em nossa API, é importante que antes você conheça os conceitos envolvidos no processamento de uma transação de cartão de crédito.

| Conceito         | Descrição                                                                                                                                                                                                                                                                                        |
| ---------------- | ------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------ |
| **Autenticação** | É um processo de verificação do titular do cartão realizado pelo banco emissor para trazer mais segurança para a venda. Em caso de fraude em transação autenticada, o custo do chargeback é do emissor.                                                                                          |
| **Autorização**  | Etapa em que a Cielo faz a conexão com o sistema do banco emissor e da bandeira para aprovar uma transação de cartão. A pré-autorização apenas sensibiliza o limite do cliente, mas ainda não gera cobrança para o consumidor. Para efetivação da cobrança é necessária a ocorrência da captura. |
| **Captura**      | Após a autorização, para que a venda seja concretizada e a cobrança seja efetivada no cartão, ocorre o movimento de captura.                                                                                                                                                                     |
| **Cancelamento** | O cancelamento acontece quando o estabelecimento não quer mais prosseguir com uma transação. Esse movimento pode ser realizado tanto para transações autorizadas quanto para capturadas.                                                                                                         |

## Bandeiras aceitas

| Bandeira         | Crédito à vista | Crédito parcelado Loja | Internacional |
| ---------------- | --------------- | ---------------------- | ------------- |
| Visa             | Sim             | Sim                    | Sim           |
| Master Card      | Sim             | Sim                    | Sim           |
| American Express | Sim             | Sim                    | Sim           |
| Elo              | Sim             | Sim                    | Sim           |
| Diners Club      | Sim             | Não                    | Sim           |
| Discover         | Sim             | Não                    | Sim           |
| JCB              | Sim             | Não                    | Sim           |
| Aura             | Sim             | Sim                    | Sim           |

## Fluxo da transação de crédito

<Image alt="Fluxo transacional de cartão de crédito" align="center" src="https://files.readme.io/f368fac-fluxo-credito-pt.png" />

1. A pessoa que está comprando opta por pagar com cartão de crédito;
2. A loja solicita <Glossary>autorização</Glossary>;
3. A API E-commerce solicita a autorização da bandeira e emissor;
4. Bandeira e emissor enviam resultado da autorização;
5. Se a transação for autorizada, a API E-commerce envia o retorno para a loja e efetiva a cobrança;
6. A loja confirma o pagamento para a pessoa compradora.

## Tipos de parcelamento

A API E-commerce oferece dois tipos de parcelamento.

### Parcelamento pela loja ("ByMerchant")

Neste modelo, a própria loja define as condições de parcelamento e assume o risco da operação. A loja recebe o valor total da venda de forma parcelada, conforme acordado com a Cielo.

> 📘 Importante
>
> * O valor mínimo de cada parcela deve ser de R$5,00, conforme estipulado no <a href="https://www.cielo.com.br/docs/contrato-de-credenciamento/transacao-parceladas-e-credito-v3-23.10.27.pdf" target="_blank">Contrato de Credenciamento da Cielo</a>;
> * Confira as bandeiras disponíveis para o [parcelamento pela loja](https://docs.cielo.com.br/ecommerce-cielo/docs/cartao-credito#bandeiras-aceitas).

<br />

### Parcelamento pelo emissor ("ByIssuer")

Aqui, o banco emissor do cartão é quem oferece o parcelamento ao portador do cartão. A loja recebe o valor total da venda à vista, e o cliente paga as parcelas diretamente ao banco, que pode cobrar juros.