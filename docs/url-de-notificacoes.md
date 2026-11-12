---
updatedAt: 2026-08-06T18:47:58.000Z
agentTools:
  siteIndex: https://docs.cielo.com.br/llms.txt
  projectIndex: https://docs.cielo.com.br/ecommerce-cielo/llms.txt
---

# URL de notificações

A funcionalidade **URL de notificações** permite configurar o endereço utilizado para receber notificações enviadas pela API E-commerce Cielo.

Além de configurar a URL, é possível definir headers personalizados e selecionar os eventos que devem gerar notificações.

<Callout icon="ℹ️" theme="info">
  ### Importante

  As notificações são enviadas apenas para os eventos selecionados e após a conclusão da configuração.
</Callout>

## Como acessar

No <Anchor target="_blank" href="https://www.cielo.com.br/">Site Cielo</Anchor>:

1. Selecione o estabelecimento (EC) desejado;
2. No menu superior, clique em **E-commerce**;
3. Acesse **Gestão API E-commerce**;
4. Clique em **Configurações > URL de notificações.**

<Image src="https://files.readme.io/4f60fd3d0e37588beac2f5b4e09fa650411db43beee4df52c21dbd811d88c05c-Configuraes.png" align="center" />

***

## Configurar notificações

Informe a URL que deverá receber as notificações enviadas pela API E-commerce Cielo.

Caso exista uma URL já cadastrada, ela será apresentada para edição.&#x20;

Ao configurar a URL:

* A URL deve estar acessível para recebimento das notificações;
* O endpoint deve responder às validações realizadas pela Cielo;
* A URL pode possuir até **255 caracteres**.

<Image src="https://files.readme.io/b19ac9cd1b5f676726502169c133cb4248a9b5aaf530971ad972e9e0967a3202-URL_de_notificao.png" align="center" width="650px" />

***

### Headers personalizados

Opcionalmente, é possível configurar cabeçalhos personalizados (*headers*) que serão enviados juntamente com as notificações.

Essa configuração permite enviar informações adicionais junto com as notificações recebidas pelo seu endpoint.

Para adicionar um header:

1. Informe o nome do cabeçalho no campo **Key**.
2. Informe o valor correspondente no campo **Value**.
3. Clique em **Adicionar**.

Após a inclusão, o header será apresentado na lista de configurações cadastradas.

> Cada novo header adicionado cria uma nova linha na listagem e pode ser removido individualmente.

<Image src="https://files.readme.io/49b3738aaba05e0fca42ba48ffb66fc16580e936f643ea056ca734c89cc8ead1-Adicionar_um_header.png" align="center" width="750px" />

***

### Selecionar notificações

Após informar a URL e configurar os headers desejados, selecione os eventos que devem gerar notificações para o endpoint cadastrado.

É possível habilitar ou desabilitar eventos individualmente ou utilizar a opção **Marcar/desmarcar todos** para alterar todas as notificações disponíveis de uma única vez.

<Image src="https://files.readme.io/b20c6404d9b935c556ee0bdd27353f7bd7006bd077061ee7269b12157f9d47f0-Selecionar_notificaes.png" align="center" />

> Os eventos disponíveis podem variar de acordo com os produtos e microsserviços habilitados para o estabelecimento.

## Salvar alterações

O botão **Salvar alterações** será habilitado quando:

* Uma URL válida estiver informada;
* Pelo menos um evento estiver selecionado.

Ao clicar em **Salvar alterações**, a Cielo realiza um teste automático da URL informada para verificar se o endereço está apto a receber notificações da API E-commerce Cielo.

Caso a URL seja validada com sucesso, conclua a autenticação da operação por meio do aplicativo **Cielo Gestão**.

<Image src="https://files.readme.io/78878508e82bfd8fe3080d65a051bea3fbecf91add9c46eb7ee3fbf5071fd3f7-Autenticao_duas_etapas.png" align="center" width="450px" />

***

## Resultados da configuração

Após a conclusão da operação, a plataforma apresenta o resultado da configuração realizada.

Quando todas as etapas forem concluídas com sucesso, a configuração será salva e as notificações passarão a ser enviadas para a URL configurada.

<Image src="https://files.readme.io/9b3232c3fdf14ccf73644ab78ccbeeaa0a325508da20ac2e865f5d6e67ff7780-Autenticao_Sucesso.png" align="center" />

> Algumas alterações podem levar alguns minutos para serem propagadas completamente no ambiente.

### Falha na validação da URL

Caso a URL não responda conforme esperado durante a validação realizada pela Cielo, a configuração não será aplicada.

<Image src="https://files.readme.io/400f48031ff331c066f2190aa159029a170f98d40c023851fc853243a19f9a54-Teste_erro_URL.png" align="center" />

Nessa situação:

* A configuração não é salva;
* A última configuração válida permanece ativa;
* O usuário deverá corrigir o endpoint e realizar uma nova tentativa.

Antes de tentar novamente, verifique:

* Disponibilidade da URL;
* Regras de autenticação do endpoint;
* Firewall ou bloqueios de rede;
* Formato da resposta retornada pela aplicação;
* Status HTTP retornado pelo endpoint.

### Falha parcial na aplicação das configurações

Em algumas situações, apenas parte das alterações solicitadas poderá ser aplicada.

<Image src="https://files.readme.io/affa4e28996118345d4f17f5600d82cdb3c9eea5d8814a6ab42b205dd60f630e-Falha_parcial.png" align="center" width="550px" />

Quando isso ocorrer:

* A plataforma exibirá os itens que não foram processados;
* Será disponibilizada a ação **Tente novamente**;
* As configurações aplicadas com sucesso permanecerão salvas.

<Callout icon="⚠️" theme="warn">
  ### Atenção

  Ao clicar em **Cancelar**, as alterações não salvas serão descartadas e a tela retornará para a última configuração salva.
</Callout>

<Callout icon="📘" theme="info">
  ### Informações adicionais

  O botão **Adicionar** para headers permanece disponível apenas durante o modo de edição.
</Callout>

## Histórico de ações

As ações relacionadas a URL de notificações ficam registradas no **Histórico de ações** da Gestão API E-commerce.

Para mais informações, consulte a página [**Histórico de ações**](https://docs.cielo.com.br/ecommerce-cielo/docs/historico-de-acoes).