---
updatedAt: 2026-07-08T19:10:25.000Z
agentTools:
  siteIndex: https://docs.cielo.com.br/llms.txt
  projectIndex: https://docs.cielo.com.br/ecommerce-cielo/llms.txt
---

# 2. Criar o token de acesso

> ℹ️ Obter credenciais de 3DS para cada ambiente
>
> * **Ambiente de produção**
>
> Use as credenciais [obtidas no site Cielo](https://docs.cielo.com.br/ecommerce-cielo/docs/3ds-credenciais).
>
> * **Ambiente sandbox**
>
> Para teste em sandbox, use:
>
> `ClientId`: **dba3a8db-fa54-40e0-8bab-7bfb9b6f2e2e**
>
> `ClientSecret`: **D/ilRsfoqHlSUChwAMnlyKdDNd7FMsM7cU/vo02REag=**

Para obter acesso a serviços Cielo que utilizam o **Cielo Oauth**, será necessário obter um token de acesso, conforme os passos abaixo:

1. Concatene o `ClientId` e o `ClientSecret`, `ClientId:ClientSecret`
2. Codifique o resultado em **Base64**
3. Envie a requisição de criação do token, utilizando o método HTTP POST.

**Exemplo da Concatenação**

| Campo                     | Formato                                                                                                        |
| ------------------------- | -------------------------------------------------------------------------------------------------------------- |
| **ClientId**              | dba3a8db-fa54-40e0-8bab-7bfb9b6f2e2e                                                                           |
| **ClientSecret**          | D/ilRsfoqHlSUChwAMnlyKdDNd7FMsM7cU/vo02REag=                                                                   |
| **ClientId:ClientSecret** | *dba3a8db-fa54-40e0-8bab-7bfb9b6f2e2e:D/ilRsfoqHlSUChwAMnlyKdDNd7FMsM7cU/vo02REag=*                            |
| **Base64**                | *ZGJhM2E4ZGItZmE1NC00MGUwLThiYWItN2JmYjliNmYyZTJlOkQvaWxSc2ZvcUhsU1VDaHdBTW5seUtkRE5kN0ZNc003Y1Uvdm8wMlJFYWc9* |

A autenticação segue o padrão **Basic Authentication**, então o campo `Authorization` será preenchido com o seguinte valor:

```json Basic Authentication
Basic YjUyMWI2YjItYjliNC00YTMwLTg4MWQtM2I2M2RlY2UwMDA2OjA4UWtqZTc5TndXUng1QmRnTkpzSWtCdUlUdDVjSVZP
```

### Requisição para criar o token de acesso

| Ambiente | Método                                                                                                                                                   | Endpoint                                          |
| :------- | :------------------------------------------------------------------------------------------------------------------------------------------------------- | :------------------------------------------------ |
| Sandbox  | <span class="rm-APIMethod APIMethod APIMethod_fixedWidth APIMethod_post headline-container-api-method1Hc-Fm7uaccR" data-testid="http-method">post</span> | `https://mpisandbox.braspag.com.br/v2/auth/token` |
| Produção | <span class="rm-APIMethod APIMethod APIMethod_fixedWidth APIMethod_post headline-container-api-method1Hc-Fm7uaccR" data-testid="http-method">post</span> | `https://mpi.braspag.com.br/v2/auth/token`        |

<br />

```json
{
  "EstablishmentCode": 1006993068,
  	"MerchantName": Loja Exemplo Ltda,
 		"MCC": 0000
}
```
```curl
curl
--request POST "https://mpisandbox.braspag.com.br/v2/auth/token"
--header "Content-Type: application/json"
--header "Authorization: Basic xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx"
--data-binary
--verbose
{
    "EstablishmentCode": 1006993068,
     	"MerchantName": Loja Exemplo Ltda,
     	"MCC": 0000
}
```

| **Campo**         | **Descrição**                                                                 | **Tipo**     | **Tamanho**     |
| :---------------- | :---------------------------------------------------------------------------- | :----------- | :-------------- |
| EstablishmentCode | Identificador do estabelecimento na adquirência                               | numérico     | 10 posições     |
| MerchantName      | Nome do estabelecimento conforme cadastrado na adquirência.                   | alfanumérico | até 25 posições |
| MCC               | ódigo de Categoria do estabelecimento.  Código MCC cadastrado na adquirência. | numérico     | 4 posições      |

### Resposta

```json
{
      "access_token": "eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJjbGllbnRfbmFtZSI6IlFBXzNEU19BdXRoZW50aWNhdG9yIiwiY2xpZW50X2lkIjoiZGJhM2E4ZGItZmE1NC00MGUwLThiYWItN2JmYjliNmYyZTJlIiwic2NvcGVzIjoie1wiU2NvcGVcIjpcIjNEU0F1dGhlbnRpY2F0b3JcIixcIkNsYWltc1wiOlt7XCJOYW1lXCI6XCJNZXJjaGFudE5hbWVcIixcIlZhbHVlc1wiOFwiVmFsdWVzXCI6W1wiNTU1NVwiXX0se1wiTmFtZVwiOlwiUmVmZXJlbmNlSWRcIixcIlZhbHVlc1wiOltcImY3MjE1YmQ3LWM0OTQtNGQ5Yi1NzEyfQ.daMqXko3dZOV0TzNFQ2vSsVSKqOsrwuswg7RB82ecAASSSSSSSSSSSSFFFFFFFFFFFFFGGGGGGGGGGGGGGGGGGGGGGGG",
      "token_type": "bearer",
      "expires_in": "86399"
}
```
```curl
--header "Content-Type: application/json"
--data-binary
{
      "access_token": "eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJjbGllbnRfbmFtZSI6IlFBXzNEU19BdXRoZW50aWNhdG9yIiwiY2xpZW50X2lkIjoiZGJhM2E4ZGItZmE1NC00MGUwLThiYWItN2JmYjliNmYyZTJlIiwic2NvcGVzIjoie1wiU2NvcGVcIjpcIjNEU0F1dGhlbnRpY2F0b3JcIixcIkNsYWltc1wiOlt7XCJOYW1lXCI6XCJNZXJjaGFudE5hbWVcIixcIlZhbHVlc1wiOFwiVmFsdWVzXCI6W1wiNTU1NVwiXX0se1wiTmFtZVwiOlwiUmVmZXJlbmNlSWRcIixcIlZhbHVlc1wiOltcImY3MjE1YmQ3LWM0OTQtNGQ5Yi1NzEyfQ.daMqXko3dZOV0TzNFQ2vSsVSKqOsrwuswg7RB82ecAASSSSSSSSSSSSFFFFFFFFFFFFFGGGGGGGGGGGGGGGGGGGGGGGG",
      "token_type": "bearer",
      "expires_in": "2018-07-23T11:29:32"
}
```

| **Campo**      | **Descrição**                                  | **Tipo/Tamanho**                 |
| -------------- | ---------------------------------------------- | -------------------------------- |
| `access_token` | Token necessário para realizar a autenticação. | alfanumérico \[tamanho variável] |
| `token_type`   | Fixo "bearer"                                  | alfanumérico                     |
| `expires_in`   | Tempo em segundos para expirar o token.        | numérico                         |

<br />

> ⚠️ Atenção
>
> * Para cada autenticação 3DS, é necessário obter e informar um novo token de acesso;
> * Testes em ambiente sandbox via Postman:  Ao realizar testes, insira o `ClientId` e o `ClientSecret` diretamente no Postman. A ferramenta se encarregará automaticamente de codificar essas credenciais em Base64 para a autenticação.