---
updatedAt: 2026-07-20T21:14:23.000Z
agentTools:
  siteIndex: https://docs.cielo.com.br/llms.txt
  projectIndex: https://docs.cielo.com.br/ecommerce-cielo/llms.txt
---

# Revogar e criar credenciais no site Cielo

Obtenha as credenciais para a API E-commerce Cielo (transacional e consultas).

A funcionalidade **Credenciais** permite consultar as informações utilizadas na autenticação das integrações com a API E-commerce Cielo e gerar novas credenciais quando necessário.

Por meio desta funcionalidade, é possível gerar novas credenciais de acesso ( `Merchant Key` ou `Client Secret`), consultar o histórico de alterações realizadas e gerenciar as credenciais dos produtos e microsserviços vinculados ao estabelecimento.

<Callout icon="ℹ️" theme="info">
  ### Primeiro acesso

  Mesmo que esta seja a primeira consulta às credenciais do estabelecimento, será necessário gerar uma nova credencial para visualizar os dados utilizados na integração.
</Callout>

<Callout icon="ℹ️" theme="info">
  ### Permissões necessárias

  As credenciais podem ser gerenciadas apenas por usuários com perfil **Administrador** ou **Analista**.

  Para gerenciar permissões de acesso, acesse **Meu cadastro >&#x20;**[**Gestão de acessos**.](https://docs.cielo.com.br/ecommerce-cielo/docs/gestao-de-acessos)
</Callout>

***

## Como acessar

No <Anchor target="_blank" href="https://www.cielo.com.br/">Site Cielo:</Anchor>

1. Selecione o estabelecimento (EC) desejado;
2. No menu superior, clique em **E-commerce**;
3. Acesse **Gestão API E-commerce**;
4. Clique em **Credenciais.**

![](https://files.readme.io/dbac863d6ebb7d214befdd98683dfbc45e82181b9793836fedc65ce4d55f68e8-Credenciais_do_estabelecimento_2.png)

Na área de Credenciais, é possível consultar:

* Merchant ID e Client ID;
* Número do estabelecimento (EC);
* Produtos e microsserviços vinculados;
* Data da última geração da credencial;
* Credenciais disponíveis para gerenciamento no estabelecimento.

***

## Revogar e criar credenciais

Para revogar uma credencial existente, gere uma nova credencial para substituí-la.

Durante esse processo, é possível definir quando a credencial atual deixará de ser válida.

***

## Gerar nova credencial

Para gerar uma nova credencial:

1. Na tela **Credenciais**, localize o produto ou microsserviço desejado;
2. Clique em **Gerar nova Merchant Key** ou **Gerar novo Client Secret&#x20;**&#x63;orrespondente;
3. Confira as informações do estabelecimento apresentadas na tela;
4. Selecione o prazo de vencimento da credencial atual;
5. Confirme a operação para gerar a nova credencial;
6. Conclua a autenticação da operação por meio do aplicativo **Cielo Gestão.**

As opções de prazo de vencimento disponíveis são:

* **Imediatamente:** a credencial atual será revogada imediatamente após a geração da nova credencial.
* **Em 1 hora:** a credencial atual permanecerá válida por mais 1 hora;
* **Em 24 horas:** a credencial atual permanecerá válida por mais 24 horas;
* **Em 3 dias:** a credencial atual permanecerá válida por mais 3 dias;

<Image src="https://files.readme.io/9ef1abe18012efcf5c94892a0e3c2b19813fdeabcacc33705d17693185160224-Gerar_credencial.png" align="center" width="350px" />

Após a conclusão da autenticação, uma nova credencial será gerada e disponibilizada para visualização.

A tela apresenta as informações da credencial gerada e disponibiliza a opção **Copiar** para utilização na integração.

<Image src="https://files.readme.io/e09b1f2b98033e42f19325085955b1605aaf954b936619e92dbb18118266608f-Credencial_gerada_com_sucesso_2.png" align="center" width="350px" />

Clique em **Copiar** para copiar a credencial gerada e utilizá-la na integração.

<Callout icon="⚠️" theme="warn">
  ### Atenção

  Armazene a nova credencial em um ambiente seguro.

  Você e sua organização são responsáveis pela proteção e gerenciamento das credenciais utilizadas na integração.
</Callout>

<Callout icon="📘" theme="info">
  ### Atualização das credenciais

  Após gerar uma nova credencial:

  - Caso sua loja esteja integrada ao Gateway de Pagamento da Cielo, não será necessário atualizar as credenciais no Admin do Gateway;
  - Caso sua loja utilize essas credenciais em outro gateway ou plataforma, entre em contato com o provedor responsável para realizar a atualização das credenciais.
</Callout>

***

## Histórico de credenciais

As alterações realizadas nas credenciais podem ser consultadas por meio do histórico disponível na própria área de Credenciais.

Nesse histórico, são exibidas informações relacionadas à geração e ao gerenciamento das credenciais dos produtos e microsserviços vinculados ao estabelecimento, incluindo:

* Data e hora da ação;
* Usuário responsável;
* Produtos e microsserviços impactados;
* Merchant ID ou Client ID;
* Endereço IP da requisição.

<Image src="https://files.readme.io/220ef7c3761e425714e2b686fff8b810f2d59105718f5cac4fa3eaa88eda428d-Historico_de_aoes_credenciais.png" align="center" />

<br />

Para consultar eventos relacionados às demais funcionalidades da Gestão API E-commerce, acesse a página [**Histórico de ações**](https://docs.cielo.com.br/ecommerce-cielo/docs/historico-de-acoes).

<br />

<br />

<br />