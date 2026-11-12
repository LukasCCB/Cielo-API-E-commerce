---
updatedAt: 2025-10-30T01:06:19.000Z
agentTools:
  siteIndex: https://docs.cielo.com.br/llms.txt
  projectIndex: https://docs.cielo.com.br/ecommerce-cielo/llms.txt
---

# Renova Fácil

> ℹ️
>
> Vá para a <a href="https://docs.cielo.com.br/ecommerce-cielo/reference/renova-facil-sandbox" target="\_blank">Referência da API para acessar os exemplos completos de requisição e resposta</a>.

O **Renova Fácil** é um serviço desenvolvido pela Cielo em conjunto com os emissores, cujo objetivo é aumentar a taxa de conversão de vendas recorrentes com cartão de crédito.

O Renova Fácil permite **substituir um cartão de crédito antigo por um novo cartão** emitido pelo banco, em situações como vencimento, troca ou outros motivos.

A renovação do cartão pode ser automática ou não, dependendo do modelo de recorrência escolhido:

* **Recorrência programada**: quando a loja usa a recorrência gerenciada pela Cielo, o cartão é renovado **automaticamente**, ou seja, a Cielo informa os dados do novo cartão e ao mesmo tempo atualiza a série de recorrências com o novo cartão;
* **Recorrência própria**: quando a loja é responsável pelo próprio motor de recorrência, a Cielo informa os dados do novo cartão para que a loja possa criar uma **nova transação** com os dados do novo cartão.

## Como habilitar o Renova Fácil?

O Renova Fácil não exige habilitação prévia para utilização. Quando um cliente realiza uma transação marcada como recorrente (`Recurrent` igual a  *true*) e já existe atualização do cartão na base do Renova Fácil, as novas credenciais são disponibilizadas no response da transação, no nó `NewCard`. Dessa forma, o comércio pode realizar a substituição do cartão de forma automática.

> ⚠️
>
> O serviço está sujeito a condições comerciais e poderá implicar custos adicionais.
>
> **Para desativação do Renova Fácil, entre em contato com a equipe de suporte da Cielo.**

## Dados do novo cartão

Quando existir um novo cartão, a API irá retornar a resposta da transação negada om o código de retorno *57*. Informando os dados do novo cartão no nó `NewCard`, conforme o exemplo a seguir:

```json
  "Payment": {
(...)
    "NewCard": {
      "CardNumber": "40000000000000000",
      "ExpirationDate": "10/2032",
      "SaveCard": false,
      "Brand": "Visa"
}
```

| Propriedade              | Descrição                                                                                                                                                        | Tipo     | Tamanho | Obrigatório |
| ------------------------ | ---------------------------------------------------------------------------------------------------------------------------------------------------------------- | -------- | ------- | ----------- |
| `NewCard.CardNumber`     | Novo número do cartão do comprador.                                                                                                                              | string   | 16      | Sim         |
| `NewCard.ExpirationDate` | Nova data de validade do cartão.                                                                                                                                 | string   | 7       | Sim         |
| `NewCard.Brand`          | Bandeira do cartão.                                                                                                                                              | string   | 10      | Sim         |
| `NewCard.SaveCard`       | Identifica se o cartão gerou `Cardtoken` durante a transação. Saiba mais sobre [Tokenização](https://docs.cielo.com.br/ecommerce-cielo/docs/tokenizando-cartoes) | booleano | \*\*\*  | Sim         |

## Bandeiras e emissores habilitados

O Renova Fácil está disponível para **cartões de crédito** das seguintes bandeiras e emissores:

| Emissores         | Visa | Mastercard | Elo    | Amex   |
| ----------------- | ---- | ---------- | ------ | ------ |
| `BRADESCO`        | Sim  | Sim        | Sim    | Sim    |
| `BANCO DO BRASIL` | Sim  | \*\*\*     | \*\*\* | \*\*\* |
| `SANTANDER`       | Sim  | \*\*\*     | \*\*\* | \*\*\* |
| `CITI`            | Sim  | \*\*\*     | \*\*\* | \*\*\* |
| `BANCO PAN`       | Sim  | \*\*\*     | \*\*\* | \*\*\* |

<br />

***

## Renova Fácil na recorrência programada

Durante a  cobrança de uma recorrência, caso o cartão seja atualizado na base do Renova Fácil, a Cielo retorna a transação como negada, com o código de retorno 57. Nessa resposta, os dados do novo cartão são informados no nó `NewCard`. A API realiza automaticamente uma nova tentativa de cobrança utilizando os dados atualizados e substitui o cartão na série de recorrências. Não é necessário realizar nenhuma ação manual pelo estabelecimento.

### Fluxo Renova Fácil recorrência programada

O fluxo a seguir é aplicado para a recorrência programada, quando a loja usa o motor de recorrência da Cielo.

![](https://files.readme.io/50436053c7f9703124ffc7151ab76cb9b48fa6d40e132ba1abc9cd015460f4af-Renova.drawio.png)

**1.** O comprador realiza uma compra recorrente;\
**2.** A loja cria ou agenda a série de recorrências;\
**3.** A API E-commerce Cielo solicita autorização da primeira transação para a bandeira e emissor do cartão;\
**4.** A bandeira e emissor retornam a resposta da autorização;\
**5.** A API E-commerce retorna a resposta da autorização para a loja;\
**6, 7 e 8. Cenário de sucesso (transação autorizada)**: a API E-commerce solicita autorização, recebe a aprovação da bandeira e emissor e envia a resposta de autorização para a loja;\
**9 e 10. Cenário de recusa (transação não autorizada por identificação de novo cartão)**: a API E-commerce identifica que há uma atualização de cartão e realiza a negativa da transação. A API E-commerce envia a resposta da transação negada para a loja, informando os dados do novo cartão no nó `NewCard`;\
**11, 12 e 13. Cenário de sucesso com os dados do novo cartão**: a API E-commerce solicita autorização usando os dados do novo cartão, recebe a aprovação da bandeira e emissor e envia a resposta de autorização para a loja.

> ℹ️ As próximas cobranças desta recorrência serão realizadas automaticamente com os dados atualizados do novo cartão.

***

## Renova Fácil na recorrência própria

O fluxo Renova Fácil para recorrência própria oferece uma solução eficiente para transações recorrentes com cartões expirados. Quando a loja envia uma requisição de pagamento marcada como recorrente (`Recurrent` igual a *true*) e há atualização do cartão na base do Renova Fácil, a API retorna a transação como não autorizada, com o código de retorno *57*. Nessa resposta, os dados do novo cartão são disponibilizados no nó `NewCard`.

A loja pode criar uma nova transação recorrente utilizando o cartão atualizado, sem exigir qualquer ação da pessoa compradora. Esse processo garante uma experiência de pagamento contínua, sem interrupções.

### Fluxo Renova Fácil com recorrência própria usando cartão aberto

Quando a loja envia os dados do cartão aberto (PAN) em uma transação recorrente e ocorre a renovação do cartão pelo Renova Fácil, a transação é negada. Nesse caso, a API retorna os dados do novo cartão no nó `NewCard`. A loja deve criar uma nova transação recorrente utilizando os dados do cartão atualizado recebido.

![](https://files.readme.io/159c713b552f0bff28afb0e1b14f595bbd54be739cc322f435a6ff7350dc9490-Diagrama_sem_nome-1741357690960-Usando_carto_aberto_.drawio_1.png)

**1.** O comprador realiza uma compra recorrente;\
**Cenário de sucesso a cada transação recorrente**\
**2.** A loja cria a transação com marcação de recorrência (`Payment.Recurrent` igual a *true*);\
**3.** A API E-commerce  solicita autorização da primeira transação para a bandeira e emissor do cartão;\
**4.** A bandeira e emissor retornam resposta da autorização para a API E-commerce;\
**5.** A API E-commerce retorna a resposta da transação para a loja;\
**Cenário de transação recorrente não autorizada por cartão inválido:**\
**6.** A loja cria a transação com marcação de recorrência (`Payment.Recurrent` igual a *true*);\
**7.** A API E-commerce identifica que há uma atualização de cartão e realiza a negativa da transação;

**8.** A API E-commerce envia a resposta da transação negada para a loja, informando os dados do novo cartão no nó `NewCard`;

**Cenário de transação recorrente com novo cartão:**\
**9.** A loja cria uma nova transação com a marcação de recorrência, informando os dados do novo cartão. A transação segue o fluxo padrão de autorização.

### Fluxo Renova Fácil com recorrência própria usando `CardToken` ou `Alias`

* **`CardToken`**

Quando a loja utiliza o `CardToken`  e ocorre a renovação do cartão, a transação é negada. Nesse caso, a API gera automaticamente um novo `CardToken`  vinculado ao cartão renovado e retorna à loja os dados do novo `CardToken`, juntamente com as informações do novo cartão (mascarado).

A loja deve iniciar uma nova transação recorrente utilizando o novo `CardToken` recebido.

* **`Alias`**

Quando a loja utiliza o `Alias` e ocorre a renovação do cartão, a transação é negada. Nesse cenário, a API gera automaticamente um novo `CardToken` vinculado ao cartão renovado e ao mesmo `Alias`. Na resposta, a API retorna à loja o novo `CardToken`, o cartão mascarado e o `Alias` previamente utilizado.

Assim, a loja pode iniciar uma nova transação recorrente utilizando o mesmo` Alias`, sem necessidade de ajustes adicionais no estabelecimento.

![](https://files.readme.io/c21d45275025f26883eda4e1b2346279e8fee38edfb234f045000749a4485ea9-Diagrama_sem_nome-1741357690960-Usando_CardToken_ou_Alias_.drawio_1.png)

**1.** O comprador realiza uma compra recorrente;\
**Cenário de transação autorizada:**\
**2.** A loja cria a transação com marcação de recorrência (`Payment.Recurrent` igual a *true*) usando o `CardToken` ou o `Alias` do cartão;\
**3, 4 e 5.**&#x41; API E-commerce solicita autorização da bandeira e emissor e retorna resposta da transação autorizada;\
**Cenário de transação não autorizada por cartão inválido:**\
**6.** A loja cria a transação com marcação de recorrência (`Payment.Recurrent` igual a *true*) usando o `CardToken` ou o `Alias` do cartão;\
**7.** A API E-commerce identifica que há uma atualização de cartão e realiza a negativa da transação;

**Cenário de transação com novo cartão:**

**8**. A API E-commerce solicita a criação de um novo `CardToken`associado ao novo cartão para o Cofre Cielo;\
**9 e 10**. O novo `CardToken`, referente ao cartão renovado, é criado e associado ao Alias existente no Cofre Cielo. Em seguida, a API E-commerce retornará à loja a resposta da transação negada, incluindo os dados mascarados do novo cartão no nó `NewCard`, além do novo `CardToken` e do `Alias` previamente utilizado, se houver;\
**11**. A loja cria uma nova transação com a marcação de recorrência, informando os dados do novo cartão. A transação segue o fluxo padrão de autorização.

### Fluxo Renova Fácil com recorrência própria usando `PaymentToken` Silent Order Post

Quando a loja utiliza o `PaymentToken` gerado no  <a href="https://docs.cielo.com.br/ecommerce-cielo/docs/sop" target="\_blank">Silent Order Post</a> e ocorre a renovação do cartão, a transação é negada. Nesse caso, a API gera automaticamente um novo `PaymentToken`  vinculado ao cartão renovado e retorna à loja os dados do novo `PaymentToken`, juntamente com as informações do novo cartão (mascarado).

A loja deve iniciar uma nova transação recorrente utilizando o novo `PaymentToken` recebido.

![](https://files.readme.io/80ed5399dec6009fd716d6243138b2e24cb9be5c0a25bd7d66c2a216c9761049-PaymentToken.drawio_1.png)

**1.** O comprador realiza uma compra recorrente;\
**Cenário de transação autorizada:**\
**2.** A loja cria a transação com marcação de recorrência (`Payment.Recurrent` igual a *true*) usando o `PaymentToken`;\
**3, 4 e 5.**&#x41; API E-commerce solicita autorização da bandeira e emissor e retorna resposta da transação autorizada;\
**Cenário de transação não autorizada por cartão inválido:**\
**6.** A loja cria a transação com marcação de recorrência (`Payment.Recurrent` igual a *true*) usando o `PaymentToken`;\
**7.** A API E-commerce identifica que há uma atualização de cartão e realiza a negativa da transação;

**Cenário de transação com novo cartão:**

**8**. A API E-commerce solicita a criação de um novo `PaymentToken`associado ao novo cartão para o Cofre Cielo;\
**9 e 10**. O novo `PaymentToken`, referente ao cartão renovado, é criado. Em seguida, a API E-commerce retornará à loja a resposta da transação negada, incluindo os dados mascarados do novo cartão no nó `NewCard`, além do novo `PaymentToken`.\
**11**. A loja cria uma nova transação com a marcação de recorrência, informando os dados do novo cartão. A transação segue o fluxo padrão de autorização.

***

## Perguntas frequentes

### O `CardToken` muda quando o cartão é renovado?

Sim. A API criará automaticamente um novo `CardToken` vinculado ao cartão renovado e retornará à loja os dados do novo `CardToken`. O `Alias` permanece o mesmo.

### O `Alias` muda quando o cartão é renovado?

Não. O `Alias` permanece o mesmo, mas o novo cartão e o novo `CardToken` serão relacionados ao `Alias` existente.

### O `PaymentToken` muda quando o cartão é renovado?

Sim. A API criará automaticamente um novo `PaymentToken` vinculado ao cartão renovado e retornará à loja os dados do novo `PaymentToken`.