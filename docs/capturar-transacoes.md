---
updatedAt: 2026-10-14T14:47:46.000Z
agentTools:
  siteIndex: https://docs.cielo.com.br/llms.txt
  projectIndex: https://docs.cielo.com.br/ecommerce-cielo/llms.txt
---

# Capturar transações

A **captura** confirma o pagamento de uma transação autorizada e efetiva a cobrança junto ao comprador.

Você pode realizar a captura de duas formas:

* **Individualmente**, para capturar uma única transação;
* **Em lote**, para capturar várias transações ao mesmo tempo.

<Callout icon="🔒" theme="info">
  ### Permissões de acesso

  As funcionalidades de captura e cancelamento estão disponíveis para usuários com perfil **Administrador** ou para usuários com perfil **Personalizado** que possuam as permissões necessárias.

  Para gerenciar permissões de acesso, acesse **Meu cadastro >&#x20;**[**Gestão de acessos**](https://docs.cielo.com.br/ecommerce-cielo/docs/gestao-de-acessos).
</Callout>

***

## Capturar uma transação

Use a **captura individual** para confirmar o pagamento de uma única transação autorizada.

1. Localize a transação desejada;
2. Abra os detalhes da transação;
3. Clique em **Capturar**.

<Image src="https://files.readme.io/711943a5f49d9c01af6871d94bcc58ff7ea5bf4a43d6216023b2ad19eded7bb3-imagem4.png" align="center" />

### Captura total

A captura total confirma integralmente o valor autorizado da transação.

1. Selecione **Captura total**;
2. Clique em **Continuar**;

<Image src="https://files.readme.io/256f1da4d69b2514f0bac57ea576454c9335a4da8f9479b82f40abbb5256a9e6-Group_6828.png" align="center" width="350px" />

3. Confira as informações da transação e o valor que será capturado;
4. Clique em **Continuar**;

<Image src="https://files.readme.io/20f0a3b6464b3f61526c4c80f1102dd6964986aed200190c659ddab2687aed5a-Group_6803.png" align="center" width="350px" />

5. Revise as informações apresentadas;
6. Clique em **Capturar**.

<Image src="https://files.readme.io/c2c75e31d9f37098bcef82d899c2a39203089d589d7cc650971dfa64f1131205-Modal_3.png" align="center" width="500px" />

7. Conclua a autenticação da operação no aplicativo **Cielo Gestão**.

<Image src="https://files.readme.io/78878508e82bfd8fe3080d65a051bea3fbecf91add9c46eb7ee3fbf5071fd3f7-Autenticao_duas_etapas.png" align="center" width="450px" />

Após a autenticação, a solicitação é processada e o sistema exibe o resultado da operação.

Para conhecer os possíveis resultados, consulte a seção [Resultados da captura](https://docs.cielo.com.br/ecommerce-cielo/docs/capturar-transacoes#resultados-da-captura).

***

### Captura parcial

A captura parcial permite capturar apenas parte do valor autorizado da transação.

1. Selecione **Captura parcial** e clique em **Continuar**;

<Image src="https://files.readme.io/d1b3ae76d870bdfcd2857a741a844a78b24c130a363a60e9941f80cda965dac8-Group_6831.png" align="center" width="350px" />

2. Informe o valor que deseja capturar para a transação e clique em **Continuar**;

<Image src="https://files.readme.io/da7bb2ba96d89f91ea163009e7664d60ccd05c4f8da237f4d2ed2711888b360a-Group_6804.png" align="center" width="350px" />

3. Revise os dados apresentados;
4. Clique em **Capturar**;
5. Conclua a autenticação da operação no aplicativo **Cielo Gestão**.

Após a autenticação, a solicitação é processada e o sistema exibe o resultado da operação.

***

## Resultados da captura

Após o processamento da solicitação, o sistema pode exibir um dos seguintes resultados:

**Sucesso**

A captura foi realizada com sucesso.

<Image src="https://files.readme.io/11e2e1ad99a7d1f05f437c13eebb05461e6f17e581ff73093f663139089cb614-Modal_4.png" align="center" width="500px" />

**Sucesso parcial**

Nesse caso, o sistema apresenta as transações que não foram capturadas e os respectivos valores, para que a captura seja realizada novamente, se necessário.

<Image src="https://files.readme.io/91b9ae5cdaa212587a9d88615020ec50d4ab094f256c89ab55a68c418c4c44c8-Modal_5.png" align="center" width="500px" />

**Erro**

A captura não pôde ser concluída.

Verifique as informações da transação e tente novamente. Se o problema persistir, entre em contato com o Suporte Cielo.

<Image src="https://files.readme.io/7c9c3ca198c9bceecc537e4e426e65004cd009075f9b148ab95f9e040b648830-Modal_6.png" align="center" width="500px" />

***

## Capturar transações em lote

Use a captura em lote para capturar várias transações ao mesmo tempo.

1. Acesse **E-commerce > Transações**;
2. Selecione **Opções em lote > Capturar**;

![](https://files.readme.io/3f9d11971410622b76bef38e883c58c087a0515a8937f2c3bb1aa876205de1b2-Transaes_3.png)

O sistema entra no modo de captura e exibe apenas as transações disponíveis para essa operação.

3. Selecione as transações que deseja capturar;
4. Clique em **Capturar transações**;

![](https://files.readme.io/3ae82282f7393e2a5471d36dcac50e37e43421a6ac34f690cf701224174b4e57-Transaes_2.png)

5. Escolha o tipo de captura:

* **Captura total**;
* **Captura parcial**;

<Image src="https://files.readme.io/49920698da9a5dc2c8f3ec86229000718e25341ba8cac3505921ec859e8bbd5d-Group_6851.png" align="center" width="350px" />

A partir da escolha do tipo de captura, o processo segue as mesmas etapas descritas em [Capturar uma transação](https://docs.cielo.com.br/ecommerce-cielo/docs/capturar-transacoes#capturar-uma-transa%C3%A7%C3%A3o).

***

## Histórico da transação

Acesse o histórico da transação para consultar os eventos registrados durante o processamento do pagamento.

1. Localize a transação desejada;
2. Abra os detalhes da transação;
3. Acesse a aba **Histórico da transação**.

![](https://files.readme.io/f69cfc9f956f39b11c3a2ff70a93e8fa4579dbb0dcd3894eb3d0a00e67924ab9-Transaes_8.png)

No histórico, você pode acompanhar a evolução da transação e consultar informações como:

* Situação registrada em cada etapa;
* Data de ocorrência dos eventos;
* Código e mensagem de retorno;
* Identificador da requisição associada à operação.