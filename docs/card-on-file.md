---
updatedAt: 2026-10-22T20:08:38.000Z
agentTools:
  siteIndex: https://docs.cielo.com.br/llms.txt
  projectIndex: https://docs.cielo.com.br/ecommerce-cielo/llms.txt
---

# Card On File

<Callout icon="ℹ️" theme="info">
  Vá para a <a href="https://docs.cielo.com.br/ecommerce-cielo/reference/card-on-file-3" target="_blank">Referência da API para acessar os exemplos completos de requisição e resposta</a>.
</Callout>

### O que é o Card On File?

As transações de Card on File (COF) são utilizadas por estabelecimentos comerciais para enviar transações financeiras e não financeiras (validação de cartão) com credenciais armazenadas.

<Callout icon="ℹ️" theme="info">
  Essa funcionalidade é válida para cartão de crédito e débito.
</Callout>

A maioria dessas transações não contém um CVV pois as regras PCI impedem o estabelecimento de armazenar esse valor. Porém é importante considerar que um estabelecimento comercial pode ter validado o CVV em uma transação anterior, como no momento da primeira transação Card On File.

São exemplos de segmentos que usam esse tipo de modalidade os serviços de streaming, serviços de educação, academias e assinaturas, entre outros.

> ⚠️ Atenção
>
> A transação com Card On File pode ser recorrente ou não.

### Qual é o impacto do uso no meu negócio?

O **Card On File** permite maior agilidade na compra online, uma vez que não solicita que o portador do cartão envie novamente todos os dados (inclusive o CVV); também é possível notar uma melhor taxa de conversão de vendas uma vez que no processo para utilização do COF iniciada pelo estabelecimento comercial, obrigatoriamente, já existe uma transação anterior iniciada pelo portador de cartão que já auxilia na autorização da transação pelo emissor.

> O uso do Card On File pode melhorar a conversão de transações recorrentes e de retentativas de cartão não presente.

### Como usar o Card On File?

Primeiro é necessário armazenar o cartão, e então já é possível utilizar a marcação de **Card On File**.

* Caso seja a primeira transação (com ou sem valor financeiro) de um cartão armazenado, envie o campo `CardOnFile.Usage` com o valor "First";
* A partir da segunda transação, envie o campo `CardOnFile.Usage` com o valor "Used";

> Para a bandeira **Mastercard** é necessário enviar o nó `Payment.InitiatedTransactionIndicator` para indicar o <a href="https://docs.cielo.com.br/ecommerce-cielo/page/indicador-de-in%C3%ADcio-da-transa%C3%A7%C3%A3o-cit-e-mit" target="_blank">iniciador de transação</a>.

> ⚠️ Consulte os exemplos completos das requisições de Card on File:
>
> * <a href="https://docs.cielo.com.br/ecommerce-cielo/reference/primeiro-uso-do-cart%C3%A3o-armazenado" target="_blank">Primeiro uso do cartão armazenado</a>;
> * <a href="https://docs.cielo.com.br/ecommerce-cielo/reference/recorr%C3%AAncia" target="_blank">Recorrência</a>.

### O que não fazer?

Não envie a marcação de Card On File para transações sem o cartão armazenado.

> ℹ️ Importante
>
> Antes de armazenar o cartão, é muito importante utilizar o Zero Auth com CVV, para validar os dados do cartão.

### Bandeiras Suportadas

O Card On File suporta as seguintes bandeiras:

* **Mastercard**
* **Visa**
* **Elo**

> **Para transações Card On File com a bandeira Mastercard** é necessário enviar o nó de indicador do início da transação (`Payment.InitiatedTransactionIndicator`), para informar se a transação foi iniciada pelo comprador ou pela loja. Saiba mais em [Indicador de Início da Transação Mastercard](https://docs.cielo.com.br/ecommerce-cielo/page/indicador-de-in%C3%ADcio-da-transa%C3%A7%C3%A3o-cit-e-mit).