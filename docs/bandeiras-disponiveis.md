---
updatedAt: 2025-10-30T01:02:29.000Z
agentTools:
  siteIndex: https://docs.cielo.com.br/llms.txt
  projectIndex: https://docs.cielo.com.br/ecommerce-cielo/llms.txt
---

# Bandeiras disponíveis

As **bandeiras** disponíveis para autenticação via 3DS são:

### 3DS 2.2

* Visa;
* Mastercard;

### 3DS 2.1

* Elo;
* Amex.

<br />

> ⚠️
>
> A partir de 1º de maio de 2024, a bandeira Mastercard identificará os estabelecimentos comerciais que não tiveram atividade de autenticação 3DS por 11 ou mais meses. Após 13 meses sem uso da autenticação, os estabelecimentos perderão seu registro.

<br />

> ℹ️ *Stand-in* pela bandeira (válido para Visa e Mastercard)
>
> Além das bandeiras, o emissor do cartão também precisa processar o protocolo 3DS. Caso o emissor ainda não esteja apto a responder um pedido de autenticação usando 3DS, a bandeira avalia os dados enviados, como por exemplo o histórico transacional e comportamental do portador do cartão, classificando os pedidos de autenticação como “Baixo Risco” e “Não Baixo Risco”. A partir dessas informações, os emissores poderão contar com uma proteção mesmo não possuindo uma solução própria de 3DS, e terão uma maior confiança nas transações autenticadas. Em casos de *stand-in*, a autenticação ocorre de forma silenciosa (sem desafio para o portador) e, uma vez que a transação foi autenticada, o *liability* em caso de fraude ficará com o emissor.