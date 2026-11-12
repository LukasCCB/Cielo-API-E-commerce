---
updatedAt: 2026-10-14T14:48:03.000Z
agentTools:
  siteIndex: https://docs.cielo.com.br/llms.txt
  projectIndex: https://docs.cielo.com.br/ecommerce-cielo/llms.txt
---

# Gerenciar microsserviços

Veja como habilitar e configurar os microsserviços adicionais oferecidas pela Cielo

A área de **Microsserviços** permite habilitar e gerenciar recursos adicionais disponíveis para utilização com a API E-commerce Cielo.

Os seguintes microsserviços estão disponíveis:

* [Consulta BIN](https://docs.cielo.com.br/ecommerce-cielo/docs/como-habilitar-microsservi%C3%A7os#consulta-bin);

* [Cartão Protegido]();

* [Silent Order Post](https://docs.cielo.com.br/ecommerce-cielo/docs/como-habilitar-microsservi%C3%A7os#silent-order-post);

* [Recorrência programada](https://docs.cielo.com.br/ecommerce-cielo/docs/como-habilitar-microsservi%C3%A7os#recorr%C3%AAncia-programada);

* [3DS;](https://docs.cielo.com.br/ecommerce-cielo/docs/como-habilitar-microsservi%C3%A7os#3ds)

* [Zero Auth.](https://docs.cielo.com.br/ecommerce-cielo/docs/como-habilitar-microsservi%C3%A7os#zero-auth)

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
4. Clique na aba **Microsserviços**.

![](https://files.readme.io/570f019dd2692a8079710d6fd4063e0f348d3efed53d76bf275005f039be33ba-Gesto_API_E-commerce_3.0__Microservios.png)

***

## Consulta BIN

O microsserviço **Consulta BIN** permite consultar informações dos cartões a partir do BIN informado.

### Habilitar&#x20;

Para habilitar o serviço:

1. Localize **Consulta BIN**;
2. Ative a chave do microsserviço;
3. Leia e aceite o termo de uso;
4. Clique em **Continuar**;
5. Conclua a autenticação da operação via **aplicativo Cielo Gestão**.

<Image src="https://files.readme.io/21b4f3d54874da00109b92142f57730476e0d13254c1719db7348469a4d6d7d3-Microsservio_habilitado.png" align="center" width="450px" />

### Desabilitar

Para desabilitar o serviço:

1. Localize **Consulta BIN**;
2. Desative a chave do microsserviço;
3. Clique em **Desativar** para confirmar a operação;
4. Conclua a autenticação da operação via aplicativo **Cielo Gestão**.

<Image src="https://files.readme.io/45345905a54c625b57f57f79835963bb749066b93ff6a57c428169c35a1681cc-Confirmar_desativao_microsservios.png" align="center" width="450px" />

<br />

<Callout icon="⚠️" theme="warn">
  ### Atenção

  Após a desativação, as operações realizadas durante o período em que o microsserviço estiver desabilitado não serão contempladas pela funcionalidade.
</Callout>

***

## Cartão Protegido

O microsserviço **Cartão Protegido** permite armazenar e acessar dados de cartões tokenizados por meio do Cofre Cielo.

Para consultar o **ID do Cofre** vinculado ao estabelecimento:

1. Localize a opção **Cartão Protegido**;
2. Clique no ícone de configurações (<i class="fa-solid fa-gear"></i>).

<Image src="https://files.readme.io/c70381156510f4ea1670c389c17a83ecd832ef67c8cb29462a0d3bfdfd695a6a-Cofre_Cartao_protegido.png" align="center" width="350px" />

***

## Silent Order Post

O **Silent Order Post** permite capturar dados do cartão utilizando os recursos disponibilizados pela Cielo.

### Habilitar

Para habilitar o serviço:

1. Localize **Silent Order Post**;
2. Ative a chave do microsserviço;
3. Leia e aceite o termo de uso;
4. Clique em **Gerar chave** para gerar as credenciais do Silent Order Post (`Client ID` e `Client Secret`);
5. Conclua a autenticação da operação por meio do aplicativo **Cielo Gestão**;
6. Copie e armazene as credenciais geradas.

Após a conclusão da autenticação, o sistema exibirá as credenciais geradas para uso no microsserviço.

<Image src="https://files.readme.io/32bf5de5e9200cfb92721324f68d169d98720a7dda1a94e388fda48848db77cc-Credencial_gerada_SOP.png" align="center" width="350px" />

> Armazene o `Client ID` e o `Client Secret` em um ambiente seguro.

### Nova credencial

Após a habilitação do microsserviço, a opção **Nova credencial** ficará disponível em **Silent Order Post**.

Ao gerar uma nova credencial, um novo `Client Secret` será disponibilizado para uso no serviço.

<Image src="https://files.readme.io/9a0b8fea4fce0f7488248420921e1f019b6582bf79d022cca2424c8f113efef9-Silent_Order_Post_nova_credencial.png" align="center" width="450px" />

> Ao gerar uma nova credencial, a chave atual será automaticamente invalidada.

<Callout icon="ℹ️" theme="info">
  ### Importante

  As credenciais do Silent Order Post também podem ser gerenciadas pela área [**Credenciais**](https://docs.cielo.com.br/ecommerce-cielo/docs/revogar-e-criar-credenciais-no-site-cielo) da Gestão API E-commerce.
</Callout>

### Desabilitar

A desabilitação do Silent Order Post deve ser realizada por meio do <Anchor target="_blank" href="https://docs.cielo.com.br/ecommerce-cielo/docs/suporte-cielo">Atendimento E-commerce Cielo.</Anchor>

***

## Recorrência Programada

O microsserviço **Recorrência Programada** permite gerenciar cobranças recorrentes utilizando os recursos disponibilizados pela API E-commerce Cielo.

### Habilitar

Para habilitar o serviço:

1. Localize **Recorrência Programada**;
2. Ative a chave do microsserviço;
3. Leia e aceite o termo de uso;
4. Clique em **Continuar**;
5. Conclua a autenticação da operação por meio do aplicativo **Cielo Gestão**.

<Image src="https://files.readme.io/21b4f3d54874da00109b92142f57730476e0d13254c1719db7348469a4d6d7d3-Microsservio_habilitado.png" align="center" width="450px" />

### Configurar

Após a habilitação, a opção de configuração ficará disponível por meio do ícone de engrenagem (<i class="fa-solid fa-gear"></i>).

<Image src="https://files.readme.io/77bff513ada739ba1ce817cb5623e128aca3d31d6db3b3adb44d88781c5cb690-Recorrencia_programada_engrenagem_disponivel.png" align="center" />

<br />

Na tela de configuração, é possível definir as regras de retentativas automáticas das transações.

As seguintes opções estão disponíveis:

* **Número de tentativas:** define a quantidade máxima de retentativas automáticas para uma transação;
* **Intervalo de dias:** define o intervalo entre cada tentativa realizada;
* **Desabilitar após tentativas esgotadas:** encerra automaticamente a recorrência quando todas as tentativas configuradas forem esgotadas.

Após definir as configurações desejadas, clique em **Salvar**.

<Image src="https://files.readme.io/f6325b1b1fcae548fd73f4a361d3701dbcae7ad46beee084f467e9c896ee9633-Conf_recorrencia_programada.png" align="center" width="350px" />

### Desabilitar

Para desabilitar o serviço:

1. Localize **Recorrência Programada**;
2. Desative a chave do microsserviço;
3. Clique em **Desabilitar** para confirmar a operação;
4. Conclua a autenticação da operação por meio do aplicativo **Cielo Gestão**.

<Image src="https://files.readme.io/45345905a54c625b57f57f79835963bb749066b93ff6a57c428169c35a1681cc-Confirmar_desativao_microsservios.png" align="center" width="450px" />

***

## 3DS

O microsserviço **3DS** adiciona uma camada adicional de autenticação para transações realizadas com cartão.

### Habilitar

Para habilitar o serviço:

1. Localize **3DS**;
2. Ative a chave do microsserviço;
3. Leia e aceite o termo de uso;
4. Clique em **Gerar chave** para gerar as credenciais `Client ID` e `Client Secret`;
5. Conclua a autenticação da operação por meio do aplicativo **Cielo Gestão**;
6. Copie e armazene a credencial gerada.

Após a conclusão da autenticação, o sistema exibirá a credencial gerada para utilização.

<Image src="https://files.readme.io/8bc9118ee4379afe36305f9e4e468c9972befcfc716717324ca98c9f08e970f5-Credencial_3DS.png" align="center" width="350px" />

<Callout icon="ℹ️" theme="info">
  ### Importante

  Armazene as credenciais geradas em um ambiente seguro.
</Callout>

### Nova credencial

Após a habilitação, a opção **Nova credencial** ficará disponível em **3DS**.

Ao selecionar essa opção, novas credenciais `Client ID` e `Client Secret` serão geradas para uso no serviço.

<Image src="https://files.readme.io/613d4856abf25015ad2b1a4e33ab5b5d21a3b0de08e38b941ddfe422c6ae94d8-3ds_nova_credencial.png" align="center" width="450px" />

> Ao gerar uma nova credencial, a chave atual será automaticamente invalidada.

<Callout icon="ℹ️" theme="info">
  ### Importante

  As credenciais do 3DS também podem ser gerenciadas pela área [**Credenciais**](https://docs.cielo.com.br/ecommerce-cielo/docs/revogar-e-criar-credenciais-no-site-cielo) da Gestão API E-commerce.
</Callout>

### Desabilitar&#x20;

A desabilitação do 3DS deve ser realizada por meio do <Anchor target="_blank" href="https://docs.cielo.com.br/ecommerce-cielo/docs/suporte-cielo">Atendimento E-commerce Cielo</Anchor>.

***

## Zero Auth

O microsserviço **Zero Auth** permite validar cartões sem realizar uma autorização financeira.

### Habilitar

Para habilitar o serviço:

1. Localize o **Zero Auth**;
2. Ative a chave do microsserviço;
3. Leia e aceite o termo de uso;
4. Clique em **Continuar**;
5. Conclua a autenticação da operação via **aplicativo Cielo Gestão**.

Após a conclusão da autenticação, a configuração será processada e aplicada ao microsserviço.

<Image src="https://files.readme.io/21b4f3d54874da00109b92142f57730476e0d13254c1719db7348469a4d6d7d3-Microsservio_habilitado.png" align="center" width="450px" />

### Desabilitar

Para desabilitar o serviço:

1. Localize o **Zero Auth**;
2. Desative a chave do microsserviço;
3. Clique em **Desativar** para confirmar a operação;
4. Conclua a autenticação da operação por meio do aplicativo Cielo Gestão.

<Image src="https://files.readme.io/45345905a54c625b57f57f79835963bb749066b93ff6a57c428169c35a1681cc-Confirmar_desativao_microsservios.png" align="center" width="450px" />

<Callout icon="ℹ️" theme="info">
  ### Importante

  A opção de habilitação do Zero Auth pode não estar disponível para todos os estabelecimentos.&#x20;

  Caso o microsserviço não esteja disponível no Site Cielo, entre em contato com o <Anchor target="_blank" href="https://docs.cielo.com.br/ecommerce-cielo/docs/suporte-cielo">Atendimento E-commerce Cielo.</Anchor>
</Callout>

***

## Histórico de ações

As alterações realizadas nos microsserviços podem ser consultadas por meio do **Histórico de ações** da Gestão API E-commerce.

Para mais informações, consulte [**Histórico de ações**](https://docs.cielo.com.br/ecommerce-cielo/docs/historico-de-acoes).