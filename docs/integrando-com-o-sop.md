---
updatedAt: 2026-10-14T14:49:00.000Z
agentTools:
  siteIndex: https://docs.cielo.com.br/llms.txt
  projectIndex: https://docs.cielo.com.br/ecommerce-cielo/llms.txt
---

# Integrando com o Silent Order Post

O funcionamento do **Silent Order Post** ocorre em quatro etapas:

1. Autenticação da loja por meio da criação do `access_token` OAuth2 para acesso à API do Silent Order Post;
2. Criação do `AccessToken` do SOP na API do Silent Order Post para integrar o script;
3. Execução do script;
4. Envio da requisição de autorização da transação à API Cielo E-commerce informando o `PaymentToken`.

## 1. Obtendo o AccessToken OAuth2

Quando o comprador acessa o checkout, a loja deve gerar o `access_token` a partir da API de autenticação (**OAuth2**). Em caso de sucesso, a API retornará um `access_token` que deverá ser utilizado na próxima camada de autenticação da ferramenta.

Para obter o `access_token` no padrão <a href="https://oauth.net/2/" target="_blank">OAuth 2.0</a>, envie requisição utilizando o VERBO HTTP **POST** para a seguinte URL, formada pela "URL base do ambiente + endpoint", no modelo server-to-server:

| Ambiente     | URL base + endpoint                               | Authorization       |
| ------------ | ------------------------------------------------- | ------------------- |
| **SANDBOX**  | `https://authsandbox.braspag.com.br/oauth2/token` | "Basic *\{base64}*" |
| **PRODUÇÃO** | `https://auth.braspag.com.br/oauth2/token`        | "Basic *\{base64}*" |

**Nota:** O valor "*\{base64}*" para a autorização do tipo "Basic" deve ser obtido da seguinte forma:

1. Concatene o `ClientId` e o `ClientSecret` (`ClientId:ClientSecret`).
2. Codifique o resultado da concatenação em base64.
3. Realize uma requisição ao servidor de autenticação utilizando o código alfanumérico gerado.

<Callout icon="🗝️" theme="default">
  ### Credenciais do Silent Order Post

  Nessa etapa, você irá usar as credenciais `ClientId` e  `ClientSecret`.

  * **Ambiente de produção:** obtenha as [credenciais do Silent Order Post em produção no site Cielo](https://docs.cielo.com.br/ecommerce-cielo/docs/solicitar-credencial-silent-order-post) ;
  * **Ambiente sandbox:** use as credenciais fixas informadas a seguir
    * `ClientId`:  **6631016d-72e6-4db1-a2d2-9cbe61464925**
    * `ClientSecret`: **flY1vN/dDx/5A9g/shJoOlTEiZfb9bZrig/WtJojqMM=**
</Callout>

<br />

### Requisição

<HTMLBlock>{`
<div class="headline-container-article-info2GaOf2jMpV0r"><span class="rm-APIMethod APIMethod APIMethod_fixedWidth APIMethod_post headline-container-api-method1Hc-Fm7uaccR" data-testid="http-method">post</span> <span class="headline-container-article-info-url2nV_XrjpFuVQ">https://auth.braspag.com.br/oauth2/token</span></div>
`}</HTMLBlock>

```shell
--request POST "https://authsandbox.braspag.com.br/oauth2/token"
--header "Authorization: Basic {base64}"
--header "Content-Type: application/x-www-form-urlencoded" 
--data-binary "grant_type=client_credentials"
```

| Parâmetros      | Formato                             | Envio            |
| --------------- | ----------------------------------- | ---------------- |
| `Authorization` | "Basic *\{base64}*"                 | Envio no header. |
| `Content-Type`  | "application/x-www-form-urlencoded" | Envio no header. |
| `grant_type`    | "client\_credentials"               | Envio no body.   |

### Resposta

```json
{
  "access_token": "faSYkjfiod8ddJxFTU3vti_ ... _xD0i0jqcw",
  "token_type": "bearer",
  "expires_in": 599
}
```

| Propriedades da Resposta | Descrição                                                                                            |
| ------------------------ | ---------------------------------------------------------------------------------------------------- |
| `access_token`           | O token de autenticação solicitado. Ele será utilizado no passo de obtenção do `AccessToken` do SOP. |
| `token_type`             | Indica o tipo de token.                                                                              |
| `expires_in`             | Expiração do token de acesso, em segundos. Quando o token expira, é necessário obter um novo.        |

## 2. Obtendo o AccessToken SOP

Crie o `AccessToken` do **Silent Order Post (SOP)** enviando uma requisição **POST**. Informe o `access_token` **OAuth2** obtido na etapa anterior como o `Bearer` no cabeçalho da requisição.

> O `AccessToken` do SOP será informado no script na etapa 3.

| Ambiente | URL base + endpoint                                                        |
| -------- | -------------------------------------------------------------------------- |
| Sandbox  | `https://transactionsandbox.pagador.com.br/post/api/public/v2/accesstoken` |
| Produção | `https://transaction.pagador.com.br/post/api/public/v2/accesstoken`        |

### Requisição

<HTMLBlock>{`
<div class="headline-container-article-info2GaOf2jMpV0r"><span class="rm-APIMethod APIMethod APIMethod_fixedWidth APIMethod_post headline-container-api-method1Hc-Fm7uaccR" data-testid="http-method">post</span> <span class="headline-container-article-info-url2nV_XrjpFuVQ">https://transaction.pagador.com.br/post/api/public/v2/accesstoken</span></div>
`}</HTMLBlock>

```shell
--request POST "https://transactionsandbox.pagador.com.br/post/api/public/v2/accesstoken"
--header "Content-Type: application/json"
--header "MerchantId: XXXXXXXX-XXXX-XXXX-XXXX-XXXXXXXXXXXX"
--header "Authorization: Bearer faSYkjfiod8ddJxFTU3vti_ ... _xD0i0jqcw"
--data-binary
--verbose
```

| Propriedade     | Descrição                                                                                                                                        | Tipo  | Tamanho | Obrigatório? |
| --------------- | ------------------------------------------------------------------------------------------------------------------------------------------------ | ----- | ------- | ------------ |
| `MerchantId`    | Identificador da loja na API Cielo E-commerce.                                                                                                   | GUID  | 36      | Sim          |
| `Authorization` | Bearer AcessToken OAuth2 [obtido no passo 1](https://docs.cielo.com.br/ecommerce-cielo/docs/integrando-com-o-sop#1-obtendo-o-accesstoken-oauth2) | texto | 36      | Sim          |

<Callout icon="🔑" theme="default">
  ### `MerchantId` em produção e sandbox

  * **Ambiente de produção:** use o `MerchantId` do seu estabelecimento;
  * **Ambiente sandbox:** use o `MerchantId` **832ce400-9c97-4fe7-9d4f-0928675e36cd**
</Callout>

### Resposta

Como resposta, a loja receberá um JSON ("HTTP 201 Created") contendo, entre outras informações, o token (`AccessToken` SOP).

```json
{
    "MerchantId": "XXXXXXXX-XXXX-XXXX-XXXX-XXXXXXXXXXXX",
    "AccessToken": "MzA5YWIxNmQtYWIzZi00YmM2LWEwN2QtYTg2OTZjZjQxN2NkMDIzODk5MjI3Mg==",
    "Issued": "2023-08-05T08:50:04",
    "ExpiresIn": "2023-08-05T09:10:04"
}
```

| Propriedade   | Descrição                                                                                                                                                                                                                                                                                                                                              | Tipo  | Tamanho | Formato                                                          |
| ------------- | ------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------ | ----- | ------- | ---------------------------------------------------------------- |
| `MerchantId`  | Identificador da loja na API Cielo E-commerce.                                                                                                                                                                                                                                                                                                         | GUID  | 36      | xxxxxxxx-xxxx-xxxx-xxxx-xxxxxxxxxxxx                             |
| `AccessToken` | Token de acesso do Silent Order Post (`AccessToken` SOP). Por questões de segurança, este token dará permissão para o estabelecimento salvar apenas um cartão dentro de um prazo já estipulado na resposta, através do atributo *ExpiresIn* (por padrão, 20 minutos). O que acontecer primeiro invalidará esse mesmo token para impedir um uso futuro. | texto | --      | NjBhMjY1ODktNDk3YS00NGJkLWI5YTQtYmNmNTYxYzhlNjdiLTQwMzgxMjAzMQ== |
| `Issued`      | Data e hora da geração do `AccessToken`.                                                                                                                                                                                                                                                                                                               | texto | --      | AAAA-MM-DDTHH:MM:SS                                              |
| `ExpiresIn`   | Data e hora da expiração do `AccessToken`.                                                                                                                                                                                                                                                                                                             | texto | --      | AAAA-MM-DDTHH:MM:SS                                              |

## 3. Implementando o script

### Mapeando classes

Faça o <a href="https://www.pagador.com.br/post/scripts/silentorderpost-1.0.min.js" target="_blank">download do script do Silent Order Post</a> e insira o script no formato JavaScript na sua página de checkout. Esse script permitirá à Cielo processar todas as informações de cartão sem intervenção da loja.

Parametrize os elementos de formulário com as seguintes classes:

| Propriedade                                                          | Nome da Classe              | Obrigatório? |
| -------------------------------------------------------------------- | --------------------------- | ------------ |
| Nome do portador do cartão de crédito/débito                         | `bp-sop-cardholdername`     | Sim          |
| Número do cartão de crédito/débito                                   | `bp-sop-cardnumber`         | Sim          |
| Data de validade do cartão de crédito/débito                         | `bp-sop-cardexpirationdate` | Sim          |
| Código de segurança do cartão de crédito/débito                      | `bp-sop-cardcvvc`           | Sim          |
| Modalidade do cartão a ser verificada ("debitCard" ou "creditCard"). | `bp-sop-cardtype`           | Não\*        |

\*Se a classe `bp-sop-cardtype` não for informada, o script irá assumir que o cartão usado na compra é um cartão de crédito.

### Definindo parâmetros

#### Parâmetros do script

Os parâmetros do script devem ser inseridos no HTML da página de checkout para referenciar o script.

| Propriedade        | Descrição                                                                                                                                                                                                                                                   |
| ------------------ | ----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| `accessToken`      | Token de acesso do Silent Order Post (`AccessToken` SOP).                                                                                                                                                                                                   |
| `environment`      | Tipo de ambiente: "sandbox" para teste / "production" para produção.                                                                                                                                                                                        |
| `language`         | Idioma: "pt" para português/ "en" para inglês/ "es"para espanhol.                                                                                                                                                                                           |
| `enableBinQuery`   | "true" (habilita o *Consulta BIN*, retornando as características do cartão) / "false" (caso contrário). Saiba mais sobre no manual [Consulta BIN](https://docs.cielo.com.br/ecommerce-cielo/docs/consulta-bin) . Obs.: Disponível somente para Cielo 3.0.\* |
| `enableVerifyCard` | "true" (habilita o *ZeroAuth*, retornando se o cartão é válido ou não) / "false" (caso contrário).\* Saiba mais no manual [Zero Auth](https://docs.cielo.com.br/ecommerce-cielo/docs/zero-auth).                                                            |
| `enableTokenize`   | "true" (salva o cartão diretamente no cofre Cielo, retornando um *CardToken* ao invés de um *PaymentToken*) / "false" (caso contrário).\*                                                                                                                   |
| `cvvRequired`      | "false" (desliga a obrigatoriedade de envio do CVV) / "true" (caso contrário). *A loja precisa ter autorização da adquirente para transacionar sem o CVV*.                                                                                                  |
| `cardType`         | Use "creditCard" ou "debitCard" para forçar a verificação da modalidade do cartão. Importante para validar cartões múltiplos. Se nada for enviado, o emissor considerará apenas a modalidade "Crédito".                                                     |

* O serviço correspondente precisa estar habilitado.

> ℹ️ Para habilitar a Consulta BIN, VerifyCard ou Tokenização de cartões, entre em contato com o Atendimento.

> **Usando o Silent Order Post com a tokenização e armazenamento de cartões**\
> Você pode usar o **Silent Order Post** para trafegar os dados de cartão pela Cielo e armazenar e tokenizar o cartão de forma segura e criptografada no cofre Cielo, que conta com a certificação PCI DSS.
>
> Saiba mais em <a href="https://docs.cielo.com.br/ecommerce-cielo/docs/tokenizando-cartoes" target="_blank"> Tokenização de cartões</a>

#### Retornos do script

O script irá retornar um JSON com o `PaymentToken` (cartão tokenizado que deverá ser enviado na autorização) e informações sobre o cartão.

**Exemplo de JSON de retorno do script**

```json
{
  "PaymentToken": "366f8470-54d0-43cb-95f5-c80a502afc27",
  "ForeignCard": false, 
  "BinQueryReturnCode": "00",
  "BinQueryReturnMessage": "Analise autorizada",
  "Brand": "Visa",
  "VerifyCardStatus": 1,
  "VerifyCardReturnCode": "00",
  "VerifyCardReturnMessage": "Transacao autorizada",
  "CardBin": "453202",
  "CardLast4Digits": "4044",
  "CardType": "Multiple",
  "Issuer": "Banco Santander",
  "IssuerCode": "033",
  "Prepaid": false   
}
```

**Propriedades do retorno do script**

| Propriedade               | Descrição                                                                                                                                                                                  | Condição                                                               |
| ------------------------- | ------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------ | ---------------------------------------------------------------------- |
| `PaymentToken`\*          | Token efêmero utilizado para pagamento no formato de um GUID (36). Tem duração de 20 minutos e pode ser usado apenas uma vez. É o valor que deve ser enviado na requisição de autorização. | \*\*\*                                                                 |
| `CardToken`               | Token permanente utilizado para pagamento no formato de um GUID (36).                                                                                                                      | Quando *enableTokenize* for "true".                                    |
| `Brand`                   | Nome da bandeira do cartão (Visa, Master, Elo, Amex, Diners, JCB).                                                                                                                         | Quando *enableBinQuery* for "true". Disponível somente para Cielo 3.0. |
| `BinQueryReturnCode`      | "00" se a análise do BIN for um sucesso.                                                                                                                                                   | Quando *enableBinQuery* for "true". Disponível somente para Cielo 3.0. |
| `BinQueryReturnMessage`   | Ex.: “Transacao Autorizada” se a análise do BIN for um sucesso.                                                                                                                            | Quando *enableBinQuery* for "true". Disponível somente para Cielo 3.0. |
| `CardBin`                 | Ex.: “455187”.                                                                                                                                                                             | Quando *enableBinQuery* for "true". Disponível somente para Cielo 3.0. |
| `CardLast4Digits`         | Ex.: “0181”.                                                                                                                                                                               | Quando *enableBinQuery* for "true". Disponível somente para Cielo 3.0. |
| `ForeignCard`             | O campo retorna "true" se é um cartão emitido fora do Brasil. "false" caso contrário.                                                                                                      | Quando *enableBinQuery* for "true". Disponível somente para Cielo 3.0. |
| `Issuer`                  | O campo retorna nome do emissor do cartão.                                                                                                                                                 | Quando *enableBinQuery* for "true". Disponível somente para Cielo 3.0. |
| `IssuerCode`              | O campo retorna código do emissor do cartão.                                                                                                                                               | Quando *enableBinQuery* for "true". Disponível somente para Cielo 3.0. |
| `CardType`                | Retorna o tipo do cartão, por exemplo: Crédito, Débito, Múltiplo, Voucher, etc.                                                                                                            | Quando *enableBinQuery* for "true". Disponível somente para Cielo 3.0. |
| `VerifyCardReturnCode`    | Esse é o mesmo código retornado pelo provedor durante uma autorização padrão. Ex: provedor Cielo30 código "00" significa sucesso na validação.                                             | Quando *enableBinQuery* for "true". Disponível somente para Cielo 3.0. |
| `VerifyCardReturnMessage` | Ex.: “Transacao Autorizada”.                                                                                                                                                               | Quando *enableBinQuery* for "true". Disponível somente para Cielo 3.0. |
| `VerifyCardStatus`        | "0"- Cartão Inválido; "1"- Cartão Válido; "99"- Situação Desconhecida.                                                                                                                     | Quando *enableVerifyCard* for "true".                                  |
| `Prepaid`                 | Retorna “true” se é um cartão pré-pago e "false" se não for cartão pré-pago.                                                                                                               | \*\*\*                                                                 |

*Em **Parâmetros do script**, se `enableTokenize` for*true\*, o script irá retornar o `CardToken` em vez do `PaymentToken`. Saiba mais sobre `CardToken` em <a href="https://docs.cielo.com.br/ecommerce-cielo/docs/tokenizando-cartoes" target="_blank">Tokenização de cartões</a>.

### Implementando eventos

O script fornecido pela Cielo oferece os seguintes três eventos para manipulação e tratamento por parte da loja:

| Evento        | Descrição                                                                                                                                                                                                                                                                         |
| ------------- | --------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| **onSuccess** | Evento em caso de sucesso. Retorna o *PaymentToken* e também os dados do cartão, caso tenha solicitado realizar a verificação do cartão. Por questões de segurança, esse *PaymentToken* poderá ser usado para uma única autorização. Após seu processamento, ele será invalidado. |
| **onError**   | Evento em caso de erro. Retorna o código e a descrição do erro.                                                                                                                                                                                                                   |
| **onInvalid** | Evento em caso de fornecimento de dados incorretos. Retorna detalhes de campos com erro. As mensagens retornadas no resultado da validação são disponibilizadas nas seguintes linguagens: português (default), inglês e espanhol.                                                 |

> **Características do`PaymentToken`** :\
> Por questões de segurança, o `PaymentToken` poderá ser usado para uma única autorização e/ou dentro do período de 20 minutos. Após seu processamento, o `PaymentToken` será invalidado.

## 4. Autorizando com PaymentToken

Após a obtenção do *PaymentToken* através do script, execute o processo de autorização, enviando o *PaymentToken* no lugar de dados do cartão.

> **Para submeter uma transação de crédito**, envie o parâmetro `Payment.CreditCard.PaymentToken` em vez de `Payment.CreditCard`. Saiba mais no manual da <a href="https://docs.cielo.com.br/ecommerce-cielo/reference/criar-pagamento-credito" target="_blank">API Cielo E-commerce</a>;\
> **Para submeter uma transação de débito**, envie o parâmetro `Payment.DebitCard.PaymentToken` em vez de `Payment.DebitCard`. Saiba mais no manual da <a href="https://docs.cielo.com.br/ecommerce-cielo/reference/debito" target="_blank">API Cielo E-commerce</a>.

Veja o exemplo abaixo, descrevendo o envio dos dados de autenticação da requisição de autorização da API Cielo E-commerce.

### Requisição

<HTMLBlock>{`
<div class="headline-container-article-info2GaOf2jMpV0r"><span class="rm-APIMethod APIMethod APIMethod_fixedWidth APIMethod_post headline-container-api-method1Hc-Fm7uaccR" data-testid="http-method">post</span> <span class="headline-container-article-info-url2nV_XrjpFuVQ">https://apisandbox.cieloecommerce.cielo.com.br/v2/sales/</span></div>
`}</HTMLBlock>

**Parâmetros no cabeçalho (header)**

| Propriedade   | Descrição                                                                                          | Tipo   | Tamanho | Obrigatório |
| ------------- | -------------------------------------------------------------------------------------------------- | ------ | ------- | ----------- |
| `MerchantId`  | Identificador da loja na API E-commerce Cielo.                                                     | GUID   | 36      | Sim         |
| `MerchantKey` | Chave pública para autenticação dupla na API E-commerce Cielo.                                     | string | 40      | Sim         |
| `RequestId`   | Identificador da requisição, usado quando a loja usa diferentes servidores para cada GET/POST/PUT. | GUID   | 36      | Não         |

<br />

<Callout icon="🔑" theme="default">
  ### `MerchantId` e `MerchantKey`em produção e sandbox

  * **Ambiente de produção:** use o `MerchantId` e `MerchantKey` do seu estabelecimento;
  * **Ambiente sandbox:** use as credenciais fixas informadas a seguir

  `MerchantId`:  **832ce400-9c97-4fe7-9d4f-0928675e36cd**

  `MerchantKey`: **IIHc5F35mO9BS1FQ64ZGaqqYPG9L1OvMh2ld8kYv**
</Callout>

```json
{  
   "MerchantOrderId":"2017051002",
   "Customer":
   {  
     (...)
   },
   "Payment":
   {  
     (...)
     "CreditCard":{  
         "PaymentToken":"eedcb896-40e1-465b-b34c-6d1119dbb6cf"
     }
   }
}
```

**Parâmetros no corpo (body)**:

| Campo                             | Descrição                                                                                                                                                     | Tipo/Tamanho | Obrigatório? |
| --------------------------------- | ------------------------------------------------------------------------------------------------------------------------------------------------------------- | ------------ | ------------ |
| `Payment.CreditCard.PaymentToken` | Fornece o PaymentToken gerado através do script. Esta informação substitui os dados do cartão. Substituir por `DebitCard` se for utilizar um cartão de débito | GUID / 36    | Sim          |

### Resposta

Consulte o <a href="https://docs.cielo.com.br/ecommerce-cielo/reference/criar-pagamento-credito" target="_blank">Manual da API Cielo E-commerce</a> para exemplos de resposta a requisições de autorização.

## Exemplo de integração

Compartilhamos no nosso GitHub um <a href="https://github.com/Braspag/silent-order-post" target="_blank">exemplo prático</a> de como você deve mapear as classes e integrar o Silent Order Post ao seu checkout.