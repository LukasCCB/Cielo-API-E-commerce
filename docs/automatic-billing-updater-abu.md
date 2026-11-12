---
updatedAt: 2026-10-14T14:49:01.000Z
agentTools:
  siteIndex: https://docs.cielo.com.br/llms.txt
  projectIndex: https://docs.cielo.com.br/ecommerce-cielo/llms.txt
---

# Automatic Billing Updater (ABU)

> ℹ️
>
> Vá para a <a href="https://docs.cielo.com.br/ecommerce-cielo/reference/criar-recorrencia" target="_blank">Referência da API para acessar os exemplos completos de requisição e resposta</a>.

O **Automatic Billing Updater (ABU)** é um serviço originalmente oferecido pela **Mastercard**, mas também válido para cartões das bandeiras **Visa e Elo**. Ele é consultado automaticamente em **transações recorrentes** que tenham sido negadas com um dos códigos de resposta elegíveis.

Quando há um novo cartão disponível, o ABU retorna os dados atualizados, que são repassados pela Cielo ao estabelecimento no nó `NewCard`, seguindo o mesmo padrão do serviço [Renova Fácil.](https://docs.cielo.com.br/ecommerce-cielo/docs/renova-facil)

A loja pode utilizar os dados do novo cartão para realizar uma nova tentativa de autorização, com o objetivo de recuperar a transação originalmente recusada.

> ⚠️ Atenção:
>
> O serviço está sujeito a condições comerciais e poderá implicar custos adicionais.
>
> **Para ativação ou desativação do ABU, entre em contato com a equipe de suporte da Cielo**.

## Benefícios

A integração com o ABU traz vantagens tanto para os **lojistas** quanto para os **compradores**:

**Lojistas:**

* **Evitar diminuição da taxa de conversão** em transações recorrentes;
* **Menos atrito na jornada do cliente**, com pagamentos fluindo sem necessidade de reentrada de dados.

**Compradores:**

* **Continuidade de serviços** sem interrupções por falhas de cobrança;
* **Experiência mais fluida**, sem necessidade de atualizar manualmente os dados de pagamento em múltiplos serviços.

## Como funciona

Com o ABU habilitado, sempre haverá o retorno do campo `Payment.CardBrandStatus` e se houver novo cartão, retornará no nó `NewCard`.

Veja a seguir o exemplo de resposta de uma transação de crédito recorrente com os campos mencionados.

**Exemplo do retorno do campo`CardBrandStatus` e no`NewCard`**

```json
{
  "Payment":{
    "CardBrandStatus":"VALID",
    "NewCard": {
      "CardNumber": "40000000000000000",
      "ExpirationDate": "10/2032",
      "SaveCard": true,
      "Brand": "Master"
    }
  }
}
```

<br />

| Propriedade              | Descrição                                                                                                                                                        | Tipo     | Tamanho |
| :----------------------- | :--------------------------------------------------------------------------------------------------------------------------------------------------------------- | :------- | :------ |
| `CardBrandStatus`        | Retorno de status da conta Mastercard                                                                                                                            | string   | -       |
| `NewCard.CardNumber`     | Novo número do cartão do comprador.                                                                                                                              | string   | 16      |
| `NewCard.ExpirationDate` | Nova data de validade do cartão.                                                                                                                                 | string   | 7       |
| `NewCard.Brand`          | Bandeira do cartão.                                                                                                                                              | string   | 10      |
| `NewCard.SaveCard`       | Identifica se o cartão gerou `Cardtoken` durante a transação. Saiba mais sobre [Tokenização](https://docs.cielo.com.br/ecommerce-cielo/docs/tokenizando-cartoes) | booleano | \*\*\*  |

**Valores possíveis para`Payment.CardBrandStatus` :**

| Valor              | Descrição                                             |
| :----------------- | :---------------------------------------------------- |
| VALID              | Cartão valido ou sem atualizações na base             |
| UNKNOWN            | Cartão não está disponível na ABU                     |
| NON\_PARTICIPATING | Cartão não está disponível na ABU                     |
| ACCOUNT\_CLOSED    | Cartão está encerrado                                 |
| UPDATE             | Atualização plástico ou validade                      |
| EXPIRY             | Atualização da validade                               |
| ERROR              | Houve algum erro na atualização (Timeout por exemplo) |