---
updatedAt: 2026-10-14T14:48:46.000Z
agentTools:
  siteIndex: https://docs.cielo.com.br/llms.txt
  projectIndex: https://docs.cielo.com.br/ecommerce-cielo/llms.txt
---

# Bradesco

<Callout icon="ℹ️" theme="info">
  Vá para a <a href="https://docs.cielo.com.br/ecommerce-cielo/reference/boleto-api" target="\_blank">Referência da API para acessar os exemplos completos de requisição e resposta</a>.
</Callout>

## Como funciona

1. O comprador, após escolher o produto na loja, seleciona a forma de pagamento Boleto Bradesco;
2. A loja envia para a Cielo uma requisição chamando o meio de pagamento correspondente;
3. A Cielo se comunica com a aplicação do Banco Bradesco solicitando o registro do boleto;
4. Caso o registro seja realizado com sucesso, o banco responde à solicitação devolvendo os dados de cobrança (código de barras, linha digitável, etc) e a **URL do Boleto**;
5. A Cielo envia no response o link para que a loja possa abrir um pop-up exibindo o boleto;
6. O comprador acessa a URL do boleto (renderização) e então pode realizar o pagamento;
7. A conciliação do boleto é feita via serviço de consulta da Cielo ao sistema do Bradesco;
8. Para receber as notificações de pagamento, a loja deve ter cadastrada a URL de Notificação ou utilizar o serviço de consulta.

## Configurando o Boleto

O Boleto Bradesco exige configurações realizadas tanto no **Painel Bradesco** quanto no **Portal Cielo E‑commerce**.

<Callout icon="ℹ️" theme="info">
  ### Importante

  - Para utilizar o boleto registrado Bradesco, o estabelecimento precisa **contratar a carteira registrada** diretamente com o banco;
  - A carteira contratada deve ser 26;
  - A emissão do boleto só será habilitada após a liberação realizada pelo Bradesco.
</Callout>

### Contratação do serviço com o Bradesco

O estabelecimento deve entrar em contato com o **gerente do Bradesco** e solicitar a contratação do serviço de boleto registrado via API.

Após a solicitação, a equipe técnica do Bradesco (Scopus) enviará por e-mail:

* Acesso ao Painel Bradesco (Gerenciador API);
* Usuário, senha e demais credenciais necessárias para configurar o meio de pagamento.

### Acesso ao Painel Bradesco

Após receber as credenciais enviadas pelo banco, acesse o <Anchor target="_blank" href="https://gerenciador.meiosdepagamentobradesco.com.br/gl/login.jsp">Gerenciador API</Anchor> e faça login utilizando os dados recebidos.

<Image src="https://files.readme.io/9568f653ee1f0005ef7fa7f8f72461950d7c05b06bd12e54b91e7e54a34c650c-0920bf49924f114fe421681cf443b306f259c40e61d5699c5abf1cd5964be7bd-Tela_1_Bradesco_E-mail.png" align="center" />

<br />

<Image src="https://files.readme.io/984d34ea0e9195aa1f4904e4ec473fa005ba9d9fc44eb7888bbff2f11e59b2f9-32bcc53dc168bce7121939364f73bc80ec7925b0232d08bfd73aeaac1b0d4191-Tela_2_Bradesco_login.png" align="center" />

### Configurar o meio de pagamento no Painel Bradesco

1. **Acessar as configurações do meio de pagamento**

No Painel Bradesco:

* Acesse **Configurações → Meios de pagamento**.

<Image src="https://files.readme.io/c2c2a3769f52d3ba88427019bedf00914b41f6d1fc31c8881c0a9f73a6956e4b-73ec1372e79908c96ac3fe615710cb198ac5ea363e9ae1cec2cce518038613c4-Tela_3_Bradesco_selecione_meio_de_pagamento.png" align="center" />

2. **Configurando credenciais**

Ainda na tela Meios de pagamento, localize a seção de **configuração de acesso (chave de Autenticação e Autorização)**.

* Preencha o campo **Palavra secreta** com uma senha definida pelo estabelecimento;
* Clique em **Gerar nova chave de segurança** para criar a **Chave de segurança** utilizada pela Cielo na consulta de status dos boletos.

<Callout icon="ℹ️" theme="info">
  ### Importante

  A chave de segurança **não é a senha de acesso ao Painel Bradesco**. Ela é usada exclusivamente para comunicação entre Bradesco e Cielo.
</Callout>

<Image src="https://files.readme.io/93a4b096c1bf00eab36ebe9e7df0a3c3e5f480a3482b7ad9793b9a74054a8dcd-536fce9178cd20ba6a47ad38429522811a7b159e44c1648f0d885188f150de1f-Tela_4_Bradesco_Configurar_meio_de_pagamento.png" align="center" />

<br />

3. **Configuração da integração**

Na mesma tela de **Meios de pagamento**, logo após os campos de credenciais, aparece a seção de **Configuração de integração.**

No campo **URL de notificação**, informe:

`https://meiosdepagamentobradesco.com.br/notification`

<Image src="https://files.readme.io/59057fea62e4028ad0cbbd94cf5828085eb9d2c738917c195763b0e6405e5b0f-1f90cb427fbde7317b14fea7da3526a3da85757e71d0940b69960360a51b0fa4-Tela_5_Bradesco_Configurao_url.png" align="center" />

<br />

4. **Ajustar as opções do boleto bancário**

Ainda na mesma página, o lojista encontra a seção **Configuração do Meio de Pagamento**. Ajuste as opções conforme necessidade:

* **Habilitar "frase" do boleto:** Ativo;
* **Habilitar "referência" do boleto:** Ativo;
* **Apresentar Agência e Conta:** Ativo;
* **Vencimento:** 3 dias.

<Image src="https://files.readme.io/1722161dfec2c7022e3bf01bfa3690f1fdbaa3735f9f939193b6752fd3af1af9-Conf_meio_de_pagto.jpg" align="center" />

<br />

<Callout icon="ℹ️" theme="info">
  A seção **Tipos de apresentação do boleto bancário** contém configurações opcionais, utilizadas conforme preferência do lojista.
</Callout>

5. **Configuração do SPS Notifica**

Na aba **SPS Notifica**, localize a seção **Configuração de integração**. No campo **URL de comunicação**, informe:

`https://meiosdepagamentobradesco.com.br/notification`

<Image src="https://files.readme.io/d122c354b9cb98305f9b48cdf63f02e550842497eadea5a014f727b141372f4e-270974143aa983e0fa30f5e61dd76e5e0ecfbd9ad906f03e0ae75e44dbc27133-image.png" align="center" width="800px" />

<br />

<Callout icon="ℹ️" theme="info">
  ### Importante:

  Em **Configuração do Meio de Pagamento**, deixe os campos **Boleto** e **Pix** como **Inativo** quando utilizar apenas o **Boleto Bradesco.**

  Caso também utilize o **Pix Bradesco**, mantenha o campo **Pix** como **Ativo**.
</Callout>

<Image src="https://files.readme.io/2e4bc6cb1b1143ded2d2f4922523a83f339609f63feb019440c3fd16acf28da0-714c3d665e3396dec564c7c4cf545856c86a3d76d5b31b68bbb12706de4638c8-image.png" align="center" />

Salve todas as alterações e prossiga para o próximo passo.

### Processamento do boleto, atualização de status e conciliação automática

Para habilitar o processamento do boleto registrado Bradesco, a atualização automática de status e a conciliação automática, é necessário configurar o **perfil Sonda** e o **usuário Sonda** no Painel Bradesco.

Nesta seção, você encontra como funciona a atualização de status dos boletos e as configurações necessárias para habilitar esse processo.

#### Atualização de Status

Para o meio de pagamento boleto registrado Bradesco a atualização de status é feita via **sondagem em lote**:

* Essa sondagem ocorre pela manhã: **4h, 6h, 8h, 10h e 12h**.

Para receber as notificações de pagamento, a loja deve ter cadastrada a URL de Notificação em conjunto com a realização de GETs.

> **OBS:** Hoje, a sonda considera transações que estejam com a data de vencimento dentro do intervalo de 30 dias anteriores e 30 dias posteriores à data de Sondagem.

<br />

#### Configuração de usuários no Painel Bradesco

Para habilitar o processamento do boleto e permitir a conciliação automática, é necessário configurar o **perfil Sonda** e criar o **usuário Sonda** no Painel Bradesco.

* Acesse **Usuários** → **Controle de Acesso**

<Image src="https://files.readme.io/0918d4c8260e1c17394afdf01dbe5d4305ba92ee56125a3269eaad7caf655008-d22ffabad15b748d5955f06c46cd12936d6234e269f8bad50219e36a72396162-Tela_7_Bradesco_Controle_de_acesso.png" align="center" />

<br />

Na tela **Controle de acesso**, preencha conforme abaixo:

* No campo **Perfil**, preencha com **Sonda**;
* No campo **Status**, selecione **Ativo**;
* Clique em **Gravar** para salvar a configuração.

<Image src="https://files.readme.io/ba1e3e5be17e6b7c05029112b1b19eacda76360a9dc79affdb7ccfd3300dfaa8-3401ea2e1c6b882ffa975c2a1cfa08e867022d3b1bf0e93af3c6aad1d5ac4b8a-Tela_8_Bradesco_Habilitar.png" align="center" />

Após salvar as configurações:

* Acesse o menu **Usuários**;
* Clique em **Incluir**.

<Image src="https://files.readme.io/98f2e0d9558ac6b7a0613e0a746dcaeb7c0575ab4148c8c2bf48db063a593148-882c1549e2ae728e4daeb09f6346326bd71bcbe57d9066f1e04ac52ba77a3410-Tela_9_Bradesco_Incluir_usurios.png" align="center" />

<br />

Na tela de **Formulário de Inclusão**, preencha conforme abaixo:

* No campo **Perfil**, selecione **Sonda** (configurado na etapa anterior);
* Preencha os campos obrigatórios:
  * **E-mail**: `sonda@nomedasualoja.com.br` - cadastre um e-mail exclusivo para o usuário de perfil Sonda, que deve obrigatoriamente começar com "sonda@" (não é o mesmo e-mail do login no portal Bradesco);
  * **Nome**: Sonda;
  * **Telefone**: Informe o número de telefone.
* No campo **Status**, selecione **Ativo**;
* Clique em **Gravar**.

<Image src="https://files.readme.io/24b9b9d43811563deac390104cb761127f1189ed111a95b64cf5c256d9c5a11a-0e6e4dc6ddac4115cb2d3224a6113ff10fc0aebfad83e01d9fbc576eb02f1fbd-Tela_10_Bradesco_Formulrio_de_incluso.png" align="center" />

<br />

<Callout icon="ℹ️" theme="info">
  ### Importante:

  O usuário criado com o perfil **Sonda** é utilizado pelo Bradesco para enviar as atualizações automáticas de status dos boletos.
</Callout>

### Finalizar ativação com o suporte Cielo

Com todas as configurações do Painel Bradesco concluídas, entre em contato com o suporte Cielo via e-mail ([cieloecommerce@cielo.com.br)](mailto:cieloeCommerce@cielo.com.br)) para finalizar a ativação do boleto Bradesco como meio de pagamento.

Ao solicitar a ativação, informe os seguintes dados:

**Dados de cadastro**

O Lojista precisará informar ao suporte Cielo os seguintes dados:

| Dados                       | Descrição                          | Formato       | OBS                                                                                                                                                                                                                                |
| :-------------------------- | :--------------------------------- | :------------ | :--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| **Agência**                 | Código agência                     | 4 dígitos     | com ou sem hífen                                                                                                                                                                                                                   |
| **Conta**                   | Conta corrente                     | 7 dígitos     | com hífen                                                                                                                                                                                                                          |
| **Carteira**                | Carteira de cobrança               | 2 dígitos     | Utilizar sempre a carteira 26, informada pelo Bradesco para operações de comércio eletrônico.                                                                                                                                      |
| **Conciliação**             | MID Bradesco (MerchantId)          | 9 dígitos     | Informado dentro do <Anchor target="_blank" href="https://gerenciador.meiosdepagamentobradesco.com.br/gl/login.jsp">Painel do Bradesco</Anchor>. MID recebido no e-mail da equipe técnica do Bradesco (Scopus).                    |
| **Convênio**                | Convênio de comércio eletrônico    | 6 dígitos     | Validar com o banco se é necessário preenchimento para a carteira                                                                                                                                                                  |
| **Nosso Numero**            | Contador incremental               | 5 dígitos     | Inserir "10000" - *A cada emissão de boleto esse numero aumenta em +1.*                                                                                                                                                            |
| **Vencimento**              | Prazo de validade do boleto        | 10 caracteres | Campo `data_vencimento`, tipo data, formato AAAA-MM-DD com hífen. <br />Exemplo: 2026-11-30.                                                                                                                                       |
| **Assinatura de Afiliação** | Chave de segurança do **Bradesco** | 44 caracteres | Gerada no Gerenciador do lojista, a partir da palavra-chave informada no momento da geração dentro do <Anchor target="_blank" href="https://gerenciador.meiosdepagamentobradesco.com.br/gl/login.jsp">Painel do Bradesco.</Anchor> |

Serão necessárias as credenciais do Bradesco:

> Essas credenciais são usadas para que a Cielo possa consultar o status do Boleto.

| Credenciais                  | Descrição                                                                                                                                                                                                            | Exemplo                                         |
| :--------------------------- | :------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- | :---------------------------------------------- |
| **Usuário**                  | E-mail usado no acesso do <Anchor target="_blank" href="https://gerenciador.meiosdepagamentobradesco.com.br/gl/login.jsp">Painel do Bradesco</Anchor>                                                                |                                                 |
| **Senha/Chave de Segurança** | Chave de segurança criada dentro do <Anchor target="_blank" href="https://gerenciador.meiosdepagamentobradesco.com.br/gl/login.jsp">Painel do Bradesco</Anchor>.<br />**Não é a senha de acesso ao Painel Bradesco** | **qcnmFA-Y2rGm4meWLzrEzSpdPARBsmblZSqfKLwq7DM** |

## Conciliação manual

A conciliação manual do boleto pode ser feita no **Site Cielo** quando necessário. Para conciliar:

1. Acesse o <Anchor target="_blank" href="https://www.cielo.com.br/">Site Cielo</Anchor>;

2. Selecione o estabelecimento (EC) desejado;
   * No menu superior, clique em **E-commerce**;
   * Acesse **Transações**;

3. Em **Transações**, aplique os filtros **Forma de pagamento: Boleto** e **Situação: Não Paga**;

   <Image src="https://files.readme.io/dd60d3bc6a2ef1c6cd5ab5ceddf48af976757aa89f20c566b709c776da6df47f-Lista_de_transaes.png" align="center" width="1000px" />

4. Localize o pedido desejado e acesse os **Detalhes da transação**;

5. Clique em **Conciliar**;

<Image src="https://files.readme.io/6c0f59133c84cda356a4a64ac21c989a23aca35f8c149aed455d2929c7ca0b82-Detalhes_da_transao.png" align="center" width="1000px" />

<br />

6. No painel **Conciliar boleto**, confira os dados da transação e clique em **Continuar**;

   <Image src="https://files.readme.io/6f2a43e8359e825c964e1275b75e6ddd942f7a4037d2e3b1f411b4494bc7c052-Conciliar_boleto.png" alt="Painel Conciliar boleto com os dados da transação e botão Continuar" align="center" width="350px" />

   7\. Na janela de confirmação, confira o valor e o nome do cliente e clique em **Conciliar**;

   <Image src="https://files.readme.io/494aaaead286b985a53e069ff6ca9a1f06d4aa5433f6184dece823cfdc34f299-Confirmar_conciliao.png" alt="Janela de confirmação: Deseja continuar com a conciliação?" align="center" width="450px" />

   8\. Conclua a autenticação da operação por meio do **aplicativo Cielo Gestão**.&#x20;

Ao concluir, a plataforma apresenta uma mensagem de sucesso e o status da transação é atualizado para *Conciliação manual*.

<Image src="https://files.readme.io/adbc198f7b028e8a35f8d0c86ba4235b80c248715e4f6b51433f267675c7bf88-Conciliao_realizad_com_sucesso.png" align="center" width="1000px" />

<br />

<br />

<br />

<br />

## Suporte

### Suporte Bradesco

Para dúvidas sobre credenciais, acesso, notificações ou configurações bancárias:

`kit@scopus.com.br`; `homologacao@scopus.com.br`; `com.eletronico@bradesco.com.br`; `comerciobradesco@scopus.com.br`

### Suporte Cielo

Em caso de dúvidas em qualquer etapa ou outras informações técnicas, entre em contato com o **Suporte Web do Cielo e-Commerce** nos seguintes canais:

* **E-mail:** [cieloecommerce@cielo.com.br](mailto:cieloeCommerce@cielo.com.br)
* **Capitais:** 4002-5472
* **Demais Cidades:** 0800 570 8472
* **Horário de atendimento:** 24h por dia, 7 dias por semana.

<br />

<br />