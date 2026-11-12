---
updatedAt: 2026-08-06T19:02:48.000Z
agentTools:
  siteIndex: https://docs.cielo.com.br/llms.txt
  projectIndex: https://docs.cielo.com.br/ecommerce-cielo/llms.txt
---

# Carteiras digitais

Veja como habilitar e configurar carteiras digitais.

A área de **Carteiras digitais (e-wallets)** permite habilitar, desabilitar e gerenciar as carteiras digitais disponíveis para utilização com a API E-commerce Cielo.

Por meio dessa funcionalidade, é possível administrar integrações com **Apple Pay**, **Google Pay** e **Samsung Pay**.

<Callout icon="ℹ️" theme="info">
  ### Permissões necessárias

  As configurações indicadas só podem ser realizadas por usuários com permissões de **Administrador** ou **Analista**.

  Para gerenciar permissões de acesso, acesse **Meu cadastro >&#x20;**<Anchor target="_blank" href="https://docs.cielo.com.br/ecommerce-cielo/docs/gestao-de-acessos">**Gestão de acessos**</Anchor>.
</Callout>

***

## Como acessar

No <Anchor target="_blank" href="https://www.cielo.com.br/">Site Cielo</Anchor>:

1. Selecione o estabelecimento (EC) desejado;
2. No menu superior, clique em **E-commerce**;
3. Acesse **Gestão API E-commerce**;
4. Clique na aba **Meios de pagamento**.

![](https://files.readme.io/8f8afe78ccf4869b62310c0c3eac063b403cb0eecc6d4933bfc4350e60546464-Meios_de_pagamento_carteiras_digitais.png)

***

## Visão geral

Na área de Carteiras digitais, é possível:

* [Habilitar carteiras digitais](https://docs.cielo.com.br/ecommerce-cielo/docs/habilitar-desabilitar-e-gerenciar-carteiras-digitais#habilitar-carteira-digital);
* [Desabilitar carteiras digitais](https://docs.cielo.com.br/ecommerce-cielo/docs/habilitar-desabilitar-e-gerenciar-carteiras-digitais#desabilitar-carteira-digital);
* [Gerar um novo certificado para Samsung Pay e Apple Pay](https://docs.cielo.com.br/ecommerce-cielo/docs/habilitar-desabilitar-e-gerenciar-carteiras-digitais#gerar-novo-certificado-samsung-pay-e-apple-pay);

<Callout icon="📘" theme="info">
  ### Importante

  Antes de habilitar uma carteira digital, consulte a documentação da carteira para verificar os pré-requisitos e concluir a integração.

  Caso sua loja tenha certificação PCI DSS e realize a descriptografia dos dados do cartão, não será necessário habilitar as carteiras digitais com criptografia.
</Callout>

***

## Habilitar carteira digital

As etapas para habilitação variam de acordo com a carteira digital selecionada.

<Callout icon="⚠️" theme="warn">
  ### Tempo de ativação

  Após a ativação da carteira, aguarde aproximadamente 30 minutos antes de realizar testes de transação.
</Callout>

### Apple Pay

Ao habilitar o Apple Pay, será necessário informar a origem da sua loja para dar continuidade à configuração da carteira.

<Image src="https://files.readme.io/b458e6a7f564d52aafd770499f6a7123aaf850112b6b4abf1c4facd5d9fb8dc3-Apple_Pay_origem_da_loja.png" align="center" />

Selecione a opção correspondente à origem da sua loja:

* **Plataforma própria:** selecione esta opção para continuar a configuração do Apple Pay no Site Cielo;
* **VTEX:** consulte a documentação de <Anchor target="_blank" href="https://docs.cielo.com.br/conectores/docs/carteiras-digitais-vtex#apple-pay">Configuração de carteiras digitais na VTEX</Anchor>;
* **Wake:** consulte a documentação de <Anchor target="_blank" href="https://docs.cielo.com.br/conectores/docs/carteiras-digitais-wake-20#habilitar-apple-pay">Configuração de carteiras digitais na Wake 2.0.</Anchor>

Caso sua loja utilize uma **plataforma própria**, informe o **Merchant Identifier** disponibilizado pela Apple.

O [**Merchant Identifier**](https://docs.cielo.com.br/ecommerce-cielo/docs/configura%C3%A7%C3%A3o-do-merchant-identifier#) deve ser previamente configurado na plataforma Apple antes da habilitação da carteira.

Para concluir a habilitação:

* Informe o Merchant Identifier;
* Defina a data de expiração do certificado;
* Marque a opção **Estou ciente**;
* Clique em **Confirmar**;
* Conclua a autenticação para validar a solicitação.

<Image src="https://files.readme.io/01350576921b4bbb72b5fbe99f4fcd92d48181ca56d03bdd9ff03cb1bac4a3b6-Habilitar_Apple_pay.png" align="center" width="350px" />

Após a conclusão da autenticação, a habilitação da carteira será processada e concluída com sucesso.

A carteira poderá ser utilizada após a conclusão da integração com o provedor correspondente.

### Google Pay

Ao habilitar o Google Pay, será necessário informar a origem da sua loja para dar continuidade à configuração da carteira.

<Image src="https://files.readme.io/957d6c4a2f62561d6c4677badeadc16d133a58093181fcac4464efc9d5bdbc37-Google_Pay_origem_da_loja.png" align="center" />

Selecione a opção correspondente à origem da sua loja:

* **Plataforma própria:** selecione esta opção para continuar a configuração do Google Pay no Site Cielo;
* **Wake:** consulte a documentação de <Anchor target="_blank" href="https://docs.cielo.com.br/conectores/docs/carteiras-digitais-wake-20#google-pay">Configuração de carteiras digitais na Wake 2.0.</Anchor>

Caso sua loja utilize uma **plataforma própria**, conclua a configuração conforme as instruções desta seção.

Para concluir a habilitação:

* Defina a data de expiração do certificado;
* Marque a opção **Estou ciente**;
* Clique em **Confirmar**;
* Conclua a autenticação para validar a solicitação.

<Image src="https://files.readme.io/f5b47feeb9f1218434cafd3d7a1ea8cafedcc9828848ee6137cb7689688a430e-Habilitar_Google_pay.png" align="center" width="350px" />

Após a conclusão da autenticação, a habilitação da carteira será processada e concluída com sucesso.

A carteira poderá ser utilizada após a conclusão da integração com o provedor correspondente.

***

### Samsung Pay

Para habilitar o Samsung Pay:

1. Defina a data de expiração do certificado;
2. Marque a opção **Estou ciente**;
3. Clique em **Confirmar**;
4. Conclua a autenticação para validar a solicitação.

<Image src="https://files.readme.io/2c2ac53dd57f853e48102575520006337710eb1c26e0ea8e1d135bc3e09d8bde-Habilitar_samsung_pay.png" align="center" width="350px" />

Após a conclusão da autenticação, a habilitação da carteira será processada e concluída com sucesso.

A carteira poderá ser utilizada após a conclusão da integração com o provedor correspondente.

***

## Desabilitar carteira digital

Para desabilitar uma carteira digital:

1. Localize a carteira desejada;
2. Desative a chave da carteira;
3. Clique em **Desabilitar** para confirmar a operação;
4. Conclua a autenticação para validar a solicitação.

<Image src="https://files.readme.io/9c21aabb03a59e75537bfa24d131f7cdc8e5208412eec6301b7116e78ba9bdf6-Desabilitar_carteira_com_sucesso.png" align="center" width="450px" />

<br />

<Callout icon="⚠️" theme="warn">
  ### Atenção

  Após a desabilitação, a carteira deixará de estar disponível para novas transações até que seja habilitada novamente.
</Callout>

## Gerar novo certificado Samsung Pay e Apple Pay

A funcionalidade **Novo certificado** está disponível para as carteiras Samsung Pay e Apple Pay.

Para gerar um novo certificado:

1. Localize a carteira desejada;
2. Clique em **Novo certificado**;
3. Confira as informações apresentadas na tela;
4. Clique em **Confirmar**;
5. Conclua a autenticação da operação por meio do aplicativo **Cielo Gestão**.

Após a conclusão da autenticação, um novo certificado será gerado para a carteira selecionada.

A tela disponibiliza a opção **Baixar certificado** para download do novo certificado.

<Image src="https://files.readme.io/5f6a5d6872e2968fc0b99e6ad798cfc796c342bc5946e462f35005d4f757d25e-Certificado_gerado_com_sucesso.png" align="center" width="450px" />

<br />

<Callout icon="⚠️" theme="warn">
  ### Atenção

  Após gerar um novo certificado:

  - Faça o download do arquivo imediatamente;
  - Armazene o certificado em um ambiente seguro;
  - Atualize a integração com o novo certificado gerado.
</Callout>

## Histórico de ações

As ações relacionadas às carteiras digitais também ficam registradas no **Histórico de ações** da Gestão API E-commerce.

Para mais informações, consulte a página [**Histórico de ações**](https://docs.cielo.com.br/ecommerce-cielo/docs/historico-de-acoes).