---
updatedAt: 2025-12-19T18:28:29.000Z
agentTools:
  siteIndex: https://docs.cielo.com.br/llms.txt
  projectIndex: https://docs.cielo.com.br/ecommerce-cielo/llms.txt
---

# Velocity

Cria um conjunto de regras para evitar fraudes por tentativas repetitivas na mesma transação.

<Callout icon="ℹ️" theme="info">
  Vá para a <a href="https://docs.cielo.com.br/ecommerce-cielo/reference/velocity-api" target="\_blank">Referência da API para acessar os exemplos completos de requisição e resposta</a>.
</Callout>

O **Velocity** é um tipo de mecanismo de prevenção a tentativas de fraude, que analisa a frequência que determinados dados são utilizados numa transação e se esse dados estão inscritos em uma lista de comportamentos passíveis de ações de segurança.

O Velocity é um aliado na avaliação de comportamentos de compra suspeitas, pois os cálculos são baseados em **elementos de rastreabilidade**.

> Para que suas transações sejam analisadas pelo Velocity, solicite a inclusão desse serviço ao Suporte Cielo.

O Velocity funciona analisando dados enviados na integração padrão da API Cielo E-commerce. Assim, não é necessário incluir nenhum nó adicional na requisição de criação de transação.

Quando o Velocity está ativo, a resposta da transação trará um nó específico chamado `Velocity`, com os detalhes da análise.