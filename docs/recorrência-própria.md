---
updatedAt: 2025-10-30T01:05:57.000Z
agentTools:
  siteIndex: https://docs.cielo.com.br/llms.txt
  projectIndex: https://docs.cielo.com.br/ecommerce-cielo/llms.txt
---

# Recorrência própria

A recorrência própria é uma configuração da API E-commerce Cielo que permite que uma loja use um sistema de recorrência interno específico às suas necessidades de negócio.

Nesse modelo, o sistema da loja é encarregado por definir o período, os dados transacionais e, quando necessário, nos enviar a transação de recorrência.

Nesse modelo, a loja é responsável por criar a inteligência necessária para:

* **Salvar os dados da transação** : a loja precisará armazenar os dados para repetição da transação e dados do pagamento;
* **Criar repetição transacional**:a loja deverá enviar uma nova transação sempre que necessitar de uma <Glossary>autorização</Glossary>;
* **Comportamento para transação negada**: a loja deve criar o seu próprio fluxo de decisão caso uma das transações seja negada, e a loja é responsável por *retentar* uma nova autorização.

> A recorrência própria segue o padrão para a criação de um pagamento de cartão de crédito; a única diferença é a necessidade de enviar um parâmetro adicional que a define como **Recorrência Própria**:
>
> **Parâmetro:** `Payment.Recurrent`= "true".

<br />

<Image alt="Fluxo transacional de Recorrência Própria" align="center" src="https://files.readme.io/a8d8a9a-recorrencia-cielo-rec-propria.png" />

> ℹ️ **Meio de pagamento aceito**: cartão de crédito e débito.

## Caso de uso

**Recorrência Própria + Tokenização Cielo**

A academia *CleverFit* possui um sistema de cobrança diferenciado onde a matrícula é cobrada quinzenalmente, mas nunca nos fins de semana.

Por ser um modelo altamente customizado, a *CleverFit* possui um sistema de recorrência própria, usando a API E-commerce Cielo via dois mecanismos:

1. **Recorrência Própria**: a *CleverFit* envia os dados da transação como uma venda normal, e identificando que é uma recorrência (`Payment.Recurrent`= "true"). A API E-commerce Cielo irá aplicar regras de autorização diferenciadas ao pedido;
2. **Cartão Tokenizado**: a *CleverFit* mantém os cartões salvos de forma tokenizada na Cielo, de acordo com as regras de segurança, evitando armazenar dados de cartões em seu sistema.

A *CleverFit* envia a transação quinzenalmente para a API E-commerce Cielo, usando os tokens salvos na própria API e optando pela Recorrência Própria, que altera a regra de autorização para se adequar ao seu modelo de cobrança.