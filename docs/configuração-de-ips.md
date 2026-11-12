---
updatedAt: 2026-08-06T18:47:06.000Z
agentTools:
  siteIndex: https://docs.cielo.com.br/llms.txt
  projectIndex: https://docs.cielo.com.br/ecommerce-cielo/llms.txt
---

# Configurar IPs confiáveis no site Cielo

A funcionalidade **Gerenciar IPs confiáveis** permite cadastrar e administrar os endereços IP autorizados a usar recursos da integração com a API E-commerce Cielo.

Por meio dessa funcionalidade, é possível adicionar e remover IPs e acompanhar o resultado das alterações realizadas.

<Callout icon="ℹ️" theme="info">
  ### Permissões necessárias

  As configurações indicadas só podem ser realizadas por usuários com permissões de **Administrador** ou **Analista**.

  Para gerenciar permissões de acesso, acesse **Meu cadastro >&#x20;**<Anchor target="_blank" href="https://docs.cielo.com.br/ecommerce-cielo/docs/gestao-de-acessos">**Gestão de acessos**</Anchor>.
</Callout>

## Como acessar

No <Anchor target="_blank" href="https://www.cielo.com.br/">Site Cielo</Anchor>:

1. Selecione o estabelecimento (EC) desejado;
2. No menu superior, clique em **E-commerce**;
3. Acesse **Gestão API E-commerce**;
4. Clique em **Configurações > Gerenciar IPs confiáveis**.

![](https://files.readme.io/4f60fd3d0e37588beac2f5b4e09fa650411db43beee4df52c21dbd811d88c05c-Configuraes.png)

***

## Adicionar e remover IPs

Use o campo de cadastro para informar um ou mais endereços IP que deverão ser autorizados para utilização na integração.

Ao informar os endereços IP:

* Utilize vírgulas para separar múltiplos endereços;
* Endereços IP já cadastrados não serão adicionados novamente;
* Endereços IP duplicados informados na mesma solicitação serão ignorados.

![](https://files.readme.io/1ee6168a6f1fe62d273ec2fdfc0a1316e875a4d48dd95a71164db8a873a6d0f4-Gerenciar_IPs_confiaveis.png)

Após clicar em **Adicionar**, os endereços informados serão exibidos na lista de **IPs adicionados**.

Para remover um endereço da lista, clique no ícone **X** exibido ao lado do IP.

<Image src="https://files.readme.io/b3f8366377b0d126be9c048f9f32278168052b8eb699da4db0b9284fc04428dc-IP_Adicionado.png" align="center" width="450px" />

<br />

<Callout icon="⚠️" theme="warn">
  ### Atenção

  - Recomenda-se manter até **30 IPs cadastrados**;
  - Uma quantidade superior pode aumentar a latência dos processos transacionais;
  - IPs não cadastrados serão recusados, podendo impactar o funcionamento da integração.
</Callout>

Após concluir as alterações desejadas:

1. Clique em **Salvar**;
2. Conclua a autenticação da operação por meio do aplicativo **Cielo Gestão**.

<Image src="https://files.readme.io/78878508e82bfd8fe3080d65a051bea3fbecf91add9c46eb7ee3fbf5071fd3f7-Autenticao_duas_etapas.png" align="center" width="450px" />

<br />

Ao final do processamento, a plataforma apresenta o resultado das alterações realizadas para cada endereço IP informado.

<Image src="https://files.readme.io/e9c10785d327ee0d185d364b8a6a6320b0e35b05dd482c60db575516414e4dbc-Alterao_IPs.png" align="center" width="550px" />

Os seguintes **status** podem ser apresentados:

* **Ativo:** o endereço IP foi validado com sucesso e está autorizado para utilização;
* **IP inválido**: o endereço informado não atende às regras de validação e não foi cadastrado;
* **Excluído:&#x20;**&#x6F; endereço IP foi removido da lista de IPs confiáveis.

***

## Impacto de IPs não autorizados

Quando uma transação ou requisição for realizada por um endereço IP não autorizado, a comunicação poderá ser bloqueada.

Nesses casos, poderão ser retornados as seguintes mensagens:

### HTTP 403 – Forbidden

A requisição foi realizada por um endereço IP que não está cadastrado na lista de IPs confiáveis.

### Código de erro da API 301 – Request IP is not allowed

O recurso de restrição por IP está habilitado e o endereço informado não está autorizado para utilização.

Para regularizar o acesso, cadastre o IP na lista de IPs confiáveis ou solicite apoio da equipe responsável pela integração.

<Callout icon="📘" theme="info">
  ### Importante

  Ao tentar realizar uma transação ou requisição utilizando um IP não autorizado, o acesso será bloqueado até que o endereço seja devidamente cadastrado e validado na lista de IPs confiáveis.
</Callout>

## Histórico de ações

As ações relacionadas as configurações dos IPs confiáveis também ficam registradas no **Histórico de ações** da Gestão API E-commerce.

Para mais informações, consulte a página [**Histórico de ações**](https://docs.cielo.com.br/ecommerce-cielo/docs/historico-de-acoes).