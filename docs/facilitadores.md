---
updatedAt: 2026-01-16T12:49:04.000Z
agentTools:
  siteIndex: https://docs.cielo.com.br/llms.txt
  projectIndex: https://docs.cielo.com.br/ecommerce-cielo/llms.txt
---

# Facilitadores de pagamento: SDWO, subcredenciadores e marketplaces

Acompanhe as regras gerais para transações feitas por facilitadores de pagamento

**Facilitadores de pagamento** são intermediários que fornecem serviços de processamento e liquidação financeira para receber os pagamentos em cartão. Ou seja, ajudam a intermediar transações financeiras entre compradores e vendedores e entre vendedores e as credenciadoras, como a Cielo.

Os facilitadores de pagamentos são registrados nas bandeiras de acordo com categorias. No e-commerce Cielo atendemos as seguintes categorias:

* **Subcredenciadores e marketplaces**;
* **Wallets** (carteiras digitais), que subdivididas em:
  * **SDWO de arranjo de compra**;
  * **SDWO de arranjo de transferência de fundos**.

<Callout icon="ℹ️" theme="info">
  Os facilitadores de pagamento estão sujeitos a normas internas da Cielo assim como regras do Banco Central, da Abecs e das bandeiras de cartão. Cada uma dessas entidades pode atualizar as suas regras a qualquer momento e o facilitador tem a obrigação de se adequar às novas regras para continuar operando.
</Callout>

No processo de **credenciamento**, a Cielo realiza procedimentos para identificar e enquadrar o facilitador de acordo com a atividade exercida. O facilitador é enquadrado de acordo com modelo de negócio, bandeira e arranjo de pagamento e, de acordo com o enquadramento, é registrado nas bandeiras e está sujeito a regras distintas. Todo o processo de credenciamento é acompanhado pelo gestor comercial Cielo.

Ao submeter uma requisição para criação de um pagamento pela **API E-commerce Cielo**, é necessário enviar os parâmetros descritos na documentação Cielo e realizar os testes de mensageria no sandbox especificado. Caso os campos específicos da categoria de facilitador de pagamento não sejam enviados na mensageria transacional, a resposta será “XML inválido”. Além disso, a Cielo poderá solicitar campos adicionais específicos relacionados a determinados produtos, a depender do modelo de negócio e enquadramento como MCC dinâmico e Soft Descriptor, conforme determinações das bandeiras, Banco Central e Abecs.

Confira a seguir as diferentes categorias de facilitadores de pagamentos.

***

## Subcredenciadores e marketplaces

Os subcredenciadores são participantes que credenciam estabelecimentos comerciais de ramos de atividades específicos no intuito de oferecer soluções de captura mais adequados às suas necessidades. Para isso, o subcredenciador se conecta à Cielo (credenciadora) e opera como um intermediador entre a credenciadora e os estabelecimentos comerciais. É um modelo muito usado por estabelecimentos menores e negócios de nicho, pois conseguem oferecer serviços mais customizados.

Os **marketplaces** são empresas que anunciam produtos ou serviços de terceiros em seus sites, e precisam credenciar seus vendedores (sub-sellers) e repassar os valores das vendas aos seus clientes (vendedores).

> ℹ️ Liquidação dos valores das vendas
>
> A Cielo (credenciadora) liquida no domicílio bancário do subcredenciador ou marketplace e este repassa os valores aos seus clientes (repassa os valores das vendas a terceiros).

Para garantir a transparência e rastreabilidade das transações financeiras, subcredenciadores e marketplaces devem informar dados específicos na criação de pagamentos pelo e-commerce. É obrigatório enviar:

* `SoftDescriptor`;
* Nome do subestabelecimento;
* Endereço completo (rua, cidade, estado, país) do subestabelecimento;
* CNPJ/CPF do subestabelecimento;
* Razão social
* Telefone;
* ID Facilitador, conforme registro da bandeira;
* ID do subestabelecimento; e
* MCC do subestabelecimento.

<Callout icon="👉" theme="default">
  ### Confira na <a href="https://docs.cielo.com.br/ecommerce-cielo/reference/subcredenciadores-e-marketplaces" target="_blank">Referência da API o exemplo de requisição </a>com todos os campos obrigatórios para subcredenciadores e marketplaces.
</Callout>

***

## Wallets (carteiras digitais)

As carteiras digitais (wallets) disponibilizam em suas plataformas a possibilidade de o comprador cadastrar o seu cartão de crédito ou débito e, por meio da plataforma, realizar o pagamento a clientes parceiros das carteiras. Permitem também fazer pagamentos por QR Code e usar o cartão para depositar saldo na carteira e usar esse dinheiro posteriormente.

Há duas classificações:

* **Staged Digital Wallet Operators (SDWO) - com arranjo de compra**
* **Staged Digital Wallet Operators (SDWO) - com arranjo de transferência de fundos**

<Callout icon="ℹ️" theme="info">
  O tipo Consumer Bill Pay Services (CBPS) da bandeira Visa passou a ser classificado como SDWO de arranjo de transferência de fundos.
</Callout>

<Callout icon="⚠️" theme="warn">
  A Cielo aceita transações de SDWO para as bandeiras Visa, Mastercard e Elo.
</Callout>

***

### SDWO de arranjo de compra

É quando portador usa cartão (cartão não presente) atrelado a uma carteira digital SDWO para comprar bem ou serviço junto a um estabelecimento comercial habilitado para aceitar a marca de pagamento da SDWO.

* Compra de bem ou serviço por QR Code;
* Compra de bem ou serviço pelo botão de pagamento online (checkout);
* Compra dentro da SDWO.

<br />

***

### SDWO de arranjo de transferência de fundos

É quando portador usa um cartão (cartão não presente) atrelado a uma carteira digital SDWO para retirar ou enviar recursos, sem o objetivo de adquirir bem ou serviço de forma imediata.

Alguns exemplos de transferência de fundos são recarga de celular, recarga de cartão de transporte público e bilhete de loteria, entre outros.

A API E-commerce Cielo suporta seis tipos de SDWO de arranjo de transferência de fundos. Para cada tipo é necessário enviar um \[MCC específico, que pode variar conforme a bandeira].

| Tipo                                 | Descrição                                                                                                                                                   | Exemplo                                                                                                                                                                      |
| ------------------------------------ | ----------------------------------------------------------------------------------------------------------------------------------------------------------- | ---------------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| **Me2Me**                            | Transferência de fundos de um cartão para uma conta, de **mesma titularidade**, dentro da SDWO.                                                             | Colocar saldo na sua carteira digital usando um cartão da bandeira (seja crédito ou débito).                                                                                 |
| **P2P**                              | Transferência de fundos de um cartão para uma conta, seguida de transferência para outra conta de **diferente titularidade**, dentro da SDWO                | Colocar saldo na carteira digital de outra pessoa usando um cartão da bandeira (seja crédito ou débito).                                                                     |
| **Transferência para outro arranjo** | Transferência de fundos de um cartão para uma conta SDWO, **seguida de uma transferência para outro arranjo** (ex. Pix ou outra SDWO).                      | Colocar saldo na sua carteira digital (ou de outra pessoa), escolher a opção pagar com Pix mas o débito do Pix será feito em um cartão da bandeira (seja crédito ou débito). |
| **Boleto não identificado**          | Transferência de fundos de um cartão para uma conta, com propósito de pagamento de um boleto, dentro da SDWO, cujo **cedente não foi informado** pela SDWO. | Pagar um boleto com um cartão da bandeira (seja crédito ou débito) usando a carteira digital e o boleto não possui identificação.                                            |
| **Boleto identificado**              | Transferência de fundos de um cartão para uma conta, com propósito de pagamento de um boleto, dentro da SDWO, cujo **cedente foi informado** pela SDWO.     | Pagar um boleto com um cartão da bandeira (seja crédito ou débito) usando a carteira digital e o boleto possui identificação.                                                |
| **Pedágio**                          | Transferência de fundos de um cartão para uma conta, de mesma titularidade, dentro da **SDWO de pedágio**.                                                  | Colocar saldo na carteira de pedágio (conta pré-paga) usando um cartão da bandeira (seja crédito ou débito).                                                                 |

* *Atualmente a API E-commerce Cielo de Pagamento não suporta SDWO de arranjo de transferência de fundos para criptomoedas*.

<Callout icon="👉" theme="default">
  ### Confira na <a href="https://docs.cielo.com.br/ecommerce-cielo/reference/sdwo-transferencia-fundos" target="_blank">Referência da API o exemplo de requisição</a> com todos os campos obrigatórios para SDWO de arranjo de transferência de fundos e a tabela com os valores de MCC para cada tipo de transferência.
</Callout>