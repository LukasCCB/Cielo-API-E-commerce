---
updatedAt: 2026-03-02T20:05:43.000Z
agentTools:
  siteIndex: https://docs.cielo.com.br/llms.txt
  projectIndex: https://docs.cielo.com.br/ecommerce-cielo/llms.txt
---

# Retentativas

### O que é retentativa?

Retentativa é a ação de reenviar uma transação previamente negada com a finalidade de obter a aprovação. Para realizar uma retentativa, é importante que o código de resposta da transação negada seja considerado pela bandeira como reversível.

> ⚠️ Atenção:
>
> O serviço está sujeito a condições comerciais e poderá implicar custos adicionais.

### Qual é o impacto da retentativa no meu negócio?

A retentativa pode trazer um resultado positivo e converter vendas que foram negadas inicialmente. Entretanto, o excesso de retentativas pode prejudicar o estabelecimento perante os emissores e bandeiras, ao diminuir o índice de aprovação do estabelecimento e/ou gerar multa ao retentar quando não permitido.

### Quando fazer uma retentativa?

É permitido retentar quando o código de resposta for reversível. A estratégia de retentativa também deve levar em consideração o código de resposta de cada bandeira.

**Exemplos:**

* **Saldo/Limite insuficiente (51)**: esta resposta é normalmente reversível e, portanto, faz sentido retentar a transação. Contudo, uma estratégia de retentativas para este código deve levar em consideração que o comprador precisa realizar uma ação como pagamento de fatura ou aumento de limite para que haja sucesso na transação. Nesse caso, recomendamos intervalos maiores entre retentativas;
* **Cartão inválido (14)**: esta resposta é irreversível. Para este código, não adianta realizar novas transações nos mesmos parâmetros pois não serão aprovadas pelos emissores.

Portanto, tenha atenção à resposta da transação para elaboração de uma boa estratégia de retentativa. Veja outros códigos de resposta e suas características em <a href="https://docs.cielo.com.br/ecommerce-cielo/page/abecs" target="_blank">Códigos de retorno ABECS</a>.

> ⚠️ O excesso de tentativas não aprovadas pode implicar em multas.
>
> As bandeiras determinam regras e valores de multas para o excesso de retentativas. Leia mais em <a href="https://docs.cielo.com.br/ecommerce-cielo/reference/retentativa-bandeira" target="_blank">Programa de Retentativa das Bandeiras</a>.

As retentativas devem sempre considerar o motivo da negativa e as orientações das bandeiras.
A estratégia adotada precisa equilibrar a possibilidade de conversão com os limites e regras definidos para cada código de resposta.