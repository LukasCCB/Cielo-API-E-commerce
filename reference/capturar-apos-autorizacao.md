---
updatedAt: 2026-04-09T14:41:01.000Z
agentTools:
  siteIndex: https://docs.cielo.com.br/llms.txt
  projectIndex: https://docs.cielo.com.br/ecommerce-cielo/llms.txt
---

# Capturar transação de crédito após a autorização

Realiza a captura parcial ou total de uma transação de cartão de crédito.

| Ambiente | Método                                                                                                                                                                                                                | Endpoint                                                                                                                         |
| :------- | :-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- | :------------------------------------------------------------------------------------------------------------------------------- |
| Sandbox  | <div class="headline-container-article-info2GaOf2jMpV0r"><span class="rm-APIMethod APIMethod APIMethod_fixedWidth APIMethod_put headline-container-api-method1Hc-Fm7uaccR" data-testid="http-method">put</span></div> | `https://apisandbox.cieloecommerce.cielo.com.br/1/sales/{PaymentId}/capture?amount={Amount}&serviceTaxAmount={ServiceTaxAmount}` |
| Produção | <div class="headline-container-article-info2GaOf2jMpV0r"><span class="rm-APIMethod APIMethod APIMethod_fixedWidth APIMethod_put headline-container-api-method1Hc-Fm7uaccR" data-testid="http-method">put</span></div> | `https://api.cieloecommerce.cielo.com.br/1/sales/{PaymentId}/capture?amount={Amount}&serviceTaxAmount={ServiceTaxAmount}`        |

Quando a criação do pagamento de cartão de crédito é uma pré-autorização (ou seja, o parâmetro `Payment.Capture` foi enviado como *false*), é possível realizar a captura posterior.

É possível capturar um **valor parcial** ou o **valor total** da transação:

* Para captura total, não envie o campo `Amount`. Será considerado o valor total da autorização;
* Para captura parcial, envie o campo `Amount` na requisição de captura com o valor desejado a capturar. A captura parcial é o ato de capturar um valor menor que o valor autorizado. Esse modelo de captura pode ocorrer apenas uma vez por transação.

> ℹ️ Após uma captura, não é possível realizar capturas adicionais no mesmo pedido.

> ⚠️ Atenção
>
> * Transações com **valor inferior a 20 centavos** na agenda financeira **não são liquidadas**. Não recomendamos realizar a captura de valores menores que 20 centavos;
> * Existe uma limitação no número de tentativas de captura. Quando são realizadas aproximadamente **50 tentativas**, o autorizador bloqueia novas capturas e retorna o **código 841 (excesso de tentativas de captura)**. Após esse bloqueio, não é mais possível capturar a transação. Para concluir a operação, é necessário **gerar uma nova transação**.

> ℹ️ Importante: companhias aéreas
>
> * O campo `ServiceTaxAmount` é exclusivo para empresas aéreas;
> * Para realizar a captura da *taxa de embarque*, basta adicionar o valor do `ServiceTaxAmount` a ser capturado.

# OpenAPI definition

```json
{
  "openapi": "3.1.0",
  "info": {
    "title": "cartão-de-crédito",
    "version": "3.0"
  },
  "servers": [
    {
      "url": "https://apisandbox.cieloecommerce.cielo.com.br"
    }
  ],
  "security": [
    {}
  ],
  "paths": {
    "/1/sales/{PaymentId}/capture": {
      "put": {
        "summary": "Capturar transação de crédito após a autorização",
        "description": "Realiza a captura parcial ou total de uma transação de cartão de crédito.",
        "operationId": "capturar-apos-autorizacao",
        "parameters": [
          {
            "name": "PaymentId",
            "in": "path",
            "description": "Número de identificação do pagamento, retornado pela API na criação do pagamento de cartão de crédito. Tamanho: 36.",
            "required": true,
            "schema": {
              "type": "string"
            }
          },
          {
            "name": "Amount",
            "in": "query",
            "description": "Valor a ser capturado, em centavos. Se essa campo não for preenchido, o valor da captura será o valor total da autorização. Tamanho: 15.",
            "schema": {
              "type": "integer",
              "format": "int32"
            }
          },
          {
            "name": "ServiceTaxAmount",
            "in": "query",
            "description": "Aplicável apenas para empresas aéreas. Montante do valor da autorização que deve ser destinado à taxa de serviço. O valor do ` ServiceTaxAmount ` será liquidado integralmente junto com o valor da primeira parcela.. Tamanho: 15.",
            "schema": {
              "type": "integer",
              "format": "int32"
            }
          },
          {
            "name": "MerchantId",
            "in": "header",
            "description": "Identificador da loja na Cielo. Tamanho: 36. Formato: GUID. <br>*Esta documentação traz um `MerchantId` padrão para permitir os testes em sandbox, mas você também pode informar o `MerchantId` habilitado durante o processo de implantação.*",
            "required": true,
            "schema": {
              "type": "string",
              "default": "8937bd5b-9796-494d-9fe5-f76b3e4da633"
            }
          },
          {
            "name": "MerchantKey",
            "in": "header",
            "description": "Chave pública para autenticação dupla na API. Tamanho: 40. Formato: GUID. <br>*Esta documentação traz um `MerchantKey` padrão para permitir os testes em sandbox, mas você também pode informar o `MerchantKey` habilitado durante o processo de implantação.*",
            "required": true,
            "schema": {
              "type": "string",
              "default": "XKGHUBSBKIRXKAVPSKWLVXYCLVJUGTNZLIHPUSYV"
            }
          },
          {
            "name": "RequestId",
            "in": "header",
            "description": "Identificador do Request, utilizado quando o lojista usa diferentes servidores para cada GET/POST/PUT. Tamanho: 36.",
            "schema": {
              "type": "string"
            }
          }
        ],
        "responses": {
          "200": {
            "description": "200",
            "content": {
              "application/json": {
                "examples": {
                  "Result": {
                    "value": "{\n  \"Status\": 2,\n  \"Tid\": \"0719094510712\",\n  \"ProofOfSale\": \"4510712\",\n  \"AuthorizationCode\": \"693066\",\n  \"ReturnCode\": \"6\",\n  \"ReturnMessage\": \"Operation Successful\",\n  \"Links\": [\n    {\n      \"Method\": \"GET\",\n      \"Rel\": \"self\",\n      \"Href\": \"https://api.cieloecommerce.cielo.com.br/1/sales/{PaymentId}\"\n    },\n    {\n      \"Method\": \"PUT\",\n      \"Rel\": \"void\",\n      \"Href\": \"https://api.cieloecommerce.cielo.com.br/1/sales/{PaymentId}/void\"\n    }\n  ]\n}"
                  }
                },
                "schema": {
                  "type": "object",
                  "properties": {
                    "Status": {
                      "type": "integer",
                      "example": 2,
                      "default": 0
                    },
                    "Tid": {
                      "type": "string",
                      "example": "0719094510712"
                    },
                    "ProofOfSale": {
                      "type": "string",
                      "example": "4510712"
                    },
                    "AuthorizationCode": {
                      "type": "string",
                      "example": "693066"
                    },
                    "ReturnCode": {
                      "type": "string",
                      "example": "6"
                    },
                    "ReturnMessage": {
                      "type": "string",
                      "example": "Operation Successful"
                    },
                    "Links": {
                      "type": "array",
                      "items": {
                        "type": "object",
                        "properties": {
                          "Method": {
                            "type": "string",
                            "example": "GET"
                          },
                          "Rel": {
                            "type": "string",
                            "example": "self"
                          },
                          "Href": {
                            "type": "string",
                            "example": "https://api.cieloecommerce.cielo.com.br/1/sales/{PaymentId}"
                          }
                        }
                      }
                    }
                  }
                }
              }
            }
          }
        },
        "deprecated": false
      }
    }
  },
  "x-readme": {
    "headers": [],
    "explorer-enabled": true,
    "proxy-enabled": true
  },
  "x-readme-fauxas": true
}
```