---
updatedAt: 2026-10-07T20:09:11.000Z
agentTools:
  siteIndex: https://docs.cielo.com.br/llms.txt
  projectIndex: https://docs.cielo.com.br/ecommerce-cielo/llms.txt
---

# Como testar a API em sandbox

Para facilitar os testes durante a integração, a Cielo oferece um ambiente Sandbox que permite simular as mensagerias da API. O ambiente Sandbox está programado com respostas preparadas para todas as funcionalidades previstas na API Cielo E-commerce.

<Callout icon="ℹ️" theme="info">
  Não é necessária uma afiliação para usar o Sandbox Cielo. O `Provider` **"Simulado"** é exclusivo para testes em ambiente Sandbox. Não use em produção.
</Callout>

**URLs base para sandbox**:

| INFORMAÇÃO                 | URL                                                   |
| -------------------------- | ----------------------------------------------------- |
| Base da URL transacional   | `https://apisandbox.cieloecommerce.cielo.com.br`      |
| Base da URL para consultas | `https://apiquerysandbox.cieloecommerce.cielo.com.br` |

## Obter as credenciais de sandbox

[**Clique aqui para criar uma conta e obter as credenciais de sandbox**](https://docs.cielo.com.br/ecommerce-cielo/page/sandbox-api-ecommerce) (`MerchantId` e `MerchantKey`) para testar a API gratuitamente:

![](https://files.readme.io/730f1fa8df0172d8a63765f6a2642c3a22a31e317d24255c66047a605d756245-image.png)

Faça as requisições para a API de acordo com essa documentação, usando as suas credenciais de sandbox.

## Testar o Post de Notificação

É possível testar o Post de Notificação no ambiente Sandbox.

Para entender o funcionamento do recurso, consulte a documentação <Anchor target="_blank" href="https://docs.cielo.com.br/ecommerce-cielo/docs/webhook">Post de Notificação.</Anchor>

Para solicitar o cadastro da URL de notificação, envie um e-mail para **<cieloecommerce@cielo.com.br>** com:

* Merchant ID (MID) do ambiente Sandbox;
* URL que receberá as notificações;
* Headers, caso sejam usados.

Para criar e configurar a URL de notificação, consulte <Anchor target="_blank" href="https://docs.cielo.com.br/ecommerce-cielo/docs/url-de-notificacoes">URL de notificações.</Anchor>

<Callout icon="ℹ️" theme="info">
  ### Importante

  Os eventos notificados dependem dos cenários que podem ser simulados no ambiente Sandbox.
</Callout>

## Funcionalidades habilitadas no cadastro sandbox

* **Cartão de crédito**: criar, capturar, consultar e cancelar pagamento;
* **Cartão de débito**: criar, consultar e cancelar pagamento;
* **Pix**: criar e consultar pagamento;
* **QR Code**: criar e consultar pagamento;
* **Recorrência**: criar transação recorrente;
* **Zero Auth**: validar cartão de teste;
* **Consulta BIN**: consultar informações do cartão;
* **Tokenização**: criar token de cartão e criar transação com cartão tokenizado.

## Funcionalidades que requerem habilitação no ambiente sandbox

As seguintes funcionalidades estão disponíveis apenas mediante habilitação pelo Atendimento Cielo:

* **Boleto Bancário**;
* **Carteiras Digitais (E-wallets)**;
* **Silent Order Post**;
* **Velocity Check**;
* **Análise de Fraude** *(disponível somente com a contratação do produto Gestão de Risco)*.

<br />

<Callout icon="⚠️" theme="warn">
  ### Atenção

  O status de pagamento das transações de QR Code e Pix em sandbox será sempre **pendente**.
</Callout>

<br />

<Callout icon="ℹ️" theme="info">
  Para a autenticação 3DS em sandbox, use as credenciais disponíveis na <a href="https://docs.cielo.com.br/ecommerce-cielo/docs/token-acesso" target="_blank">documentação</a>.
</Callout>