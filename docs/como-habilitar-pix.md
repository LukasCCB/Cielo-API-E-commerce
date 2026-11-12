---
updatedAt: 2026-10-14T14:47:40.000Z
agentTools:
  siteIndex: https://docs.cielo.com.br/llms.txt
  projectIndex: https://docs.cielo.com.br/ecommerce-cielo/llms.txt
---

# Habilitar o Pix na Cielo

O Pix permite receber pagamentos instantaneamente pelos canais da Cielo.

Para começar a receber pagamentos por essa modalidade, habilite o Pix no <Anchor target="_blank" href="https://minhaconta2.cielo.com.br/site/login">Site Cielo</Anchor>.

Você pode usar o **Pix Cielo** ou uma modalidade vinculada a um banco parceiro, como **Banco do Brasil** ou **Bradesco**.

<Callout icon="⚠️" theme="warn">
  ### Atenção

  Mesmo que várias modalidades estejam contratadas, **apenas uma pode permanecer ativa** de cada vez. Todas as transações usam automaticamente a modalidade ativa no momento do pagamento.
</Callout>

A seguir, veja como funciona a habilitação de cada modalidade.

## Habilite o Pix Cielo

Para começar a receber pagamentos por meio do Pix Cielo, siga as etapas abaixo.

### Ambiente Sandbox

* O Pix Cielo já vem habilitado por padrão no sandbox;
* Para gerar um QR Code Pix, preencha os campos obrigatórios da requisição;
* O status do pagamento permanece em **"12" (pendente)**. Não é possível alterá-lo para pago.

### Ative o Pix Cielo

1. Acesse as configurações do seu perfil no Site Cielo;
2. Selecione **Autorizações**.

<Image src="https://files.readme.io/c45094e509bb5f2fc10b6381afe03d83b33afa3cd8ae72826ea2d4c1f2ccf9ff-Autorizao1.png" align="center" />

3. Selecione **Pix**;
4. Selecione **Iniciar habilitação**.

<Image src="https://files.readme.io/5a69fc88a6345f01d82ad0a8c1f4ad4da62a8dacdb70c766e3a202f15cce900b-Autorizao2_-_autorizar_Pix.png" align="center" width="600px" />

<br />

5. Escolha a modalidade **Pix Cielo** e selecione **Selecionar**.

<Image src="https://files.readme.io/e063c8d12198033c429589566aa019d5193072975f4df7bd34c65063f2daff3e-Autorizao3_-_Habilitar_o_pagamento_com_Pix.png" align="center" width="500px" />

<br />

6. Leia o contrato exibido e aceite o **Termo de Adesão**;
7. Selecione **Enviar**.

Após o envio:

* Você verá a mensagem **“Sua autorização do Pix foi enviada com sucesso”**;
* A confirmação será enviada por **e-mail** ou **SMS**.

Para conferir o status da habilitação a qualquer momento, acesse na aba superior **Pix → Configurações do Pix → Visão Geral**.

<Image src="https://files.readme.io/4d19374f3b53914541d0acaf543cba271fc72c5036c8e18e77962d0cfd49ced7-Visao_geral_Pix_-_autorizado.png" align="center" />

<Callout icon="ℹ️" theme="info">
  A ativação é obrigatória para transacionar com Pix. A modalidade escolhida será aplicada a todos os estabelecimentos (ECs) do mesmo CNPJ.
</Callout>

## Habilite o Pix Banco do Brasil ou o Pix Bradesco

É possível habilitar os bancos parceiros Bradesco ou Banco do Brasil como provedores de Pix. A contratação e habilitação são feitos direto com o banco.

Siga as etapas abaixo para solicitar a habilitação da modalidade.

1. Manifeste interesse no Banco do Brasil ou no Bradesco;
2. Faça as tratativas de habilitação diretamente com o banco escolhido;
3. Aguarde o banco e a Cielo concluírem a integração necessária.

Após a conclusão da habilitação:

* A modalidade já aparece ativa na Área Pix. Você não precisa autorizar, selecionar ou concluir nenhuma etapa adicional no Site Cielo;
* As vendas passam a ser liquidadas diretamente na conta do banco parceiro;
* Você acompanha as transações e os recebimentos pelos canais do banco parceiro.

<Image src="https://files.readme.io/37baf706f7d9fd9429b21f4cbbc104c57785e5506d48e3be4f45eaa4a2e80491-Pix_habilitado_-_nova.png" align="center" width="600px" />

<br />

## Crie transações Pix pela API E-commerce

Após a habilitação de uma modalidade Pix, envie as transações utilizando o meio de pagamento Pix.

A API E-commerce utiliza automaticamente a modalidade ativa no momento do pagamento, independentemente de ela ser Pix Cielo, Pix Banco do Brasil ou Pix Bradesco.

Consulte o exemplo de requisição e resposta em <Anchor target="_blank" href="https://docs.cielo.com.br/ecommerce-cielo/reference/api-pix-bb">**Criar pagamento com QR Code Pix**</Anchor>.

## Troca de modalidade Pix

Se você possui mais de uma modalidade Pix habilitada, pode alterar qual delas será utilizada para processar as transações do seu estabelecimento.

Siga as etapas abaixo para alterar a modalidade ativa.

1. Acesse **Pix → Configurações do Pix → Modalidades**.

<Image src="https://files.readme.io/5a3abe68fef9d2bdcc76528424ce20b7047bd6e428138f83bad89b9e9a85ba7e-Modalidades_Pix.png" align="center" width="600px" />

<br />

2. Selecione a modalidade desejada entre as que você já habilitou;
3. Revise o que muda ao ativar a modalidade.

<Image src="https://files.readme.io/7590e34c453278a634a0cd75ecd4e91713abd197f79da4bd0b44c38b4f66aa66-Alterao_da_modalidade.png" align="center" width="350px" />

<br />

4. Marque a opção **Confirmo que desejo mudar minha modalidade Pix**;
5. Selecione **Alterar modalidade**;
6. Conclua a autenticação da operação via aplicativ&#x6F;**&#x20;Cielo Gestão**.

<Image src="https://files.readme.io/f33ecf7ab0ce62862a1d0d3be00bf0ff3a7580e8da2d526b04335c1aba6afd11-modal-MFA.png" align="center" width="300px" />

<br />

O sistema exibe a mensagem **"Alteração de modalidade solicitada"**.

A nova modalidade passa a ficar ativa a partir das **00:00 (horário de Brasília) do dia seguinte**.

<Image src="https://files.readme.io/418e2aa01102bb8705bc2ca33ee551f096605a5441f75c34f34471698f0cafe2-Modal.png" align="center" width="450px" />

<Callout icon="⚠️" theme="warn">
  ### Atenção

  - Apenas uma modalidade Pix pode ficar ativa por vez, para todo o CNPJ;

  - A troca vale a partir das 00:00 (horário de Brasília) do dia seguinte. Até lá, as transações continuam usando a modalidade anterior;

  - Enquanto o status da solicitação for **Em andamento**, você pode selecionar **Cancelar solicitação**.
</Callout>

## Histórico de solicitações

Na tela **Modalidades**, você pode consultar o histórico das solicitações de alteração de modalidade Pix.

O histórico exibe informações como a data da solicitação, a modalidade anterior, a modalidade solicitada, a data prevista para conclusão e o status da solicitação.

<Image src="https://files.readme.io/8903e844d5b4aead277856f890c91b8f260e37b9ed2891ec2b6f85df9dcbd1d7-Historico_de_solicitaes.png" align="center" width="600px" />