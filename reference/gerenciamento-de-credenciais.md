---
updatedAt: 2026-04-09T21:40:17.000Z
agentTools:
  siteIndex: https://docs.cielo.com.br/llms.txt
  projectIndex: https://docs.cielo.com.br/ecommerce-cielo/llms.txt
---

# Autenticação e credenciais

Saiba mais sobre as chaves de autenticação na API E-commerce, 3DS e Silent Order Post

## Autenticação na API E-commerce

A API E-commerce usa a autenticação por chaves de API no cabeçalho da requisição. As chaves são:

* `MerchantId`, que é o identificador da loja na Cielo;
* `MerchantKey`, que é a chave para autenticação dupla na Cielo.

**As chaves`MerchantId` e `MerchantKey` são usadas no cabeçalho de todas as requisições feitas para a [API transacional e de consulta](https://docs.cielo.com.br/ecommerce-cielo/reference/sobre-a-api)**.

<Callout icon="🔑" theme="default">
  ### Saiba como obter as chaves `MerchantId` e `MerchantKey` em [Revogar e criar credenciais no site Cielo](https://docs.cielo.com.br/ecommerce-cielo/reference/revogar-e-criar-credenciais-no-site-cielo).
</Callout>

> ℹ️
>
> Para obter as chaves do ambiente sandbox, <a href="https://docs.cielo.com.br/ecommerce-cielo/page/sandbox-api-ecommerce" target="_blank">cadastre-se gratuitamente</a>.

## Autenticação para outras funcionalidades

### Protocolo 3DS

A autenticação para implementação do protocolo 3DS segue o padrão Basic Authentication com uso de `ClientId` e `ClientSecret` codificados em Base64.

<Callout icon="🔑" theme="default">
  ### Saiba mais sobre credenciais de 3DS em:

  * <a href="https://docs.cielo.com.br/ecommerce-cielo/docs/3ds-credenciais" target="_blank">**Obter as credenciais 3DS**</a>
  * <a href="https://docs.cielo.com.br/ecommerce-cielo/docs/token-acesso" target="_blank">**Criar token de acesso do 3DS**</a>
</Callout>

<br />

### Silent Order Post

A autenticação para implementação do protocolo 3DS segue o padrão Basic Authentication com uso de `ClientId` e `ClientSecret` codificados em Base64.

<Callout icon="🔑" theme="default">
  ### Saiba mais sobre credenciais de Silent Order Post em:

  * <a href="https://docs.cielo.com.br/ecommerce-cielo/docs/solicitar-credencial-silent-order-post" target="_blank">**Obter credenciais do Silent Order Post**</a>
  * <a href="https://docs.cielo.com.br/ecommerce-cielo/docs/integrando-com-o-sop#1-obtendo-o-accesstoken-oauth2" target="_blank">**Criar token de acesso do Silent Order Post**</a>
</Callout>