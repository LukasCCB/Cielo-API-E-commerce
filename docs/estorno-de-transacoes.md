---
updatedAt: 2026-10-14T14:47:49.000Z
agentTools:
  siteIndex: https://docs.cielo.com.br/llms.txt
  projectIndex: https://docs.cielo.com.br/ecommerce-cielo/llms.txt
---

# Estorno de transações

O **estorno** permite devolver ao comprador o valor de uma transação processada, de acordo com as regras do meio de pagamento utilizado.

Você pode realizar o estorno de duas formas:

* **Individualmente**, para estornar uma única transação;
* **Em lote**, para estornar várias transações ao mesmo tempo.

<Callout icon="🔒" theme="info">
  ### Permissões de acesso

  As funcionalidades de captura e cancelamento estão disponíveis para usuários com perfil **Administrador** ou para usuários com perfil **Personalizado** que possuam as permissões necessárias.

  Para gerenciar permissões de acesso, acesse **Meu cadastro >&#x20;**[**Gestão de acessos**](https://docs.cielo.com.br/ecommerce-cielo/docs/gestao-de-acessos).
</Callout>

***

## Estornar uma transação

Use o **estorno individual** para estornar uma única transação.

1. Localize a transação desejada;
2. Abra os detalhes da transação;
3. Clique em **Estornar**.

<Image src="https://files.readme.io/f91e34d6b2b91684e3975d9b7d7125ad2ef588246595f2c349735e0ef304a1a0-Transaes_5.png" align="center" />

***

### Estorno total

O estorno total devolve integralmente o valor da transação.

1. Selecione **Estorno total**;
2. Clique em **Continuar**;

<Image src="https://files.readme.io/dbd58a8c6229daa7a734de1dc4a36632c9007ae10160a5db4f42e917fda77bcb-Group_6834.png" align="center" width="350px" />

3. Confira as informações da transação e o valor que será estornado;
4. Clique em **Continuar**;

<Image src="https://files.readme.io/03c2d6b3d56f1e7e8264fca231680a6490af1d18b72bbf05e2ad5b3fb316d83f-Group_6836.png" align="center" width="350px" />

5. Revise as informações apresentadas;
6. Clique em **Estornar**;

<Image src="https://files.readme.io/b58ae50defac7c33d71b3e72cc6e73c2d44c6dec2106d8c661b4c2681c043415-Modal_8.png" align="center" width="500px" />

7. Conclua a autenticação da operação no aplicativo **Cielo Gestão**.

<Image src="https://files.readme.io/78878508e82bfd8fe3080d65a051bea3fbecf91add9c46eb7ee3fbf5071fd3f7-Autenticao_duas_etapas.png" align="center" width="450px" />

Após a autenticação, a solicitação é processada e o sistema exibe o resultado da operação.

Para conhecer os possíveis resultados, consulte a seção [**Resultados do estorno**](https://docs.cielo.com.br/ecommerce-cielo/docs/estorno-de-transacoes#resultados-do-estorno).

***

### Estorno parcial

O estorno parcial permite devolver apenas parte do valor da transação.

1. Selecione **Estorno parcial** e clique em **Continuar**;

   <Image src="https://files.readme.io/156034921d63068bea8b31ba7f803574cbb5b4891a6d56b193c47616d5dff0e4-Group_6838.png" align="center" width="350px" />

   2\. Informe o valor que deseja estornar para a transação e clique em **Continuar**;

<Image src="https://files.readme.io/b388842fbd179b4227650589da058e6c8967751738a8d7979ba7245325ec3554-Group_6840.png" align="center" width="350px" />

3. Revise os dados apresentados;
4. Clique em **Estornar**;
5. Conclua a autenticação da operação no aplicativo **Cielo Gestão**.

Após a autenticação, a solicitação é processada e o sistema exibe o resultado da operação.

Para conhecer os possíveis resultados, consulte a seção **Resultados do estorno**.

***

## Resultados do estorno

Após o processamento da solicitação, o sistema pode exibir um dos seguintes resultados:

**Sucesso**

O estorno foi realizado com sucesso.

<Image src="https://files.readme.io/609e0d2ceb1154c43a26b6dc13d1e3c9de63d45df00f4ee2c40a7d311addb9b1-Modal_10.png" align="center" width="500px" />

**Sucesso parcial**

Nesse caso, o sistema apresenta as transações que não foram estornadas e os respectivos valores, para que o estorno seja realizada novamente, se necessário.

<Image src="https://files.readme.io/178b24159c6245edb9c8c8238e328c7d51ec69baea2f50fb4e0f718a2e11a78b-Modal_9.png" align="center" width="500px" />

**Erro**

O estorno não pôde ser concluído.

Verifique as informações da transação e tente novamente. Se o problema persistir, entre em contato com o Suporte Cielo.

<Image src="https://files.readme.io/7c9c3ca198c9bceecc537e4e426e65004cd009075f9b148ab95f9e040b648830-Modal_6.png" align="center" width="500px" />

***

## Estornar transações em lote

1. Acesse **E-commerce > Transações**.
2. Selecione **Opções em lote > Estorno**;

![](https://files.readme.io/3f9d11971410622b76bef38e883c58c087a0515a8937f2c3bb1aa876205de1b2-Transaes_3.png)

O sistema entra no modo de estorno e exibe apenas as transações disponíveis para essa operação.

3. Selecione as transações que deseja estornar;
4. Clique em **Estornar transações**;

![](https://files.readme.io/a7f2158717a537b6697c8aa23591bc91ea6876b01edb507709139efa13e87e70-Transaes_6.png)

5. Escolha o tipo de estorno:

* **Estorno total**;
* **Estorno parcial**.

A partir da escolha do tipo de estorno, o processo segue as mesmas etapas descritas em [**Estornar uma transação**](https://docs.cielo.com.br/ecommerce-cielo/docs/estorno-de-transacoes#estornar-uma-transa%C3%A7%C3%A3o).

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