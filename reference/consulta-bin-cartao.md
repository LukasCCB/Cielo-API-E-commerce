---
updatedAt: 2026-10-07T12:54:25.000Z
agentTools:
  siteIndex: https://docs.cielo.com.br/llms.txt
  projectIndex: https://docs.cielo.com.br/ecommerce-cielo/llms.txt
---

# Consultar BIN do cartão

Consulta e retorna informações do cartão.

<Table align={["left","left","left"]}>
  <thead>
    <tr>
      <th>
        Ambiente
      </th>

      <th>
        Método
      </th>

      <th>
        Endpoint
      </th>
    </tr>
  </thead>

  <tbody>
    <tr>
      <td>
        Sandbox
      </td>

      <td>
        <div class="headline-container-article-info2GaOf2jMpV0r">
          <span class="rm-APIMethod APIMethod APIMethod_fixedWidth APIMethod_get headline-container-api-method1Hc-Fm7uaccR" data-testid="http-method">get</span>
        </div>
      </td>

      <td>
        `https://apiquerysandbox.cieloecommerce.cielo.com.br/1/cardBin/{BIN}`
      </td>
    </tr>

    <tr>
      <td>
        Produção
      </td>

      <td>
        <div class="headline-container-article-info2GaOf2jMpV0r">
          <span class="rm-APIMethod APIMethod APIMethod_fixedWidth APIMethod_get headline-container-api-method1Hc-Fm7uaccR" data-testid="http-method">get</span>
        </div>
      </td>

      <td>
        `https://apiquery.cieloecommerce.cielo.com.br/1/cardBin/{BIN}`
      </td>
    </tr>
  </tbody>
</Table>

<br />

<Callout icon="ℹ️" theme="info">
  Saiba mais sobre essa funcionalidade <a href="https://docs.cielo.com.br/ecommerce-cielo/docs/consulta-bin" target="_blank">na documentação</a>.
</Callout>

<Callout icon="⚠️" theme="warn">
  ### Importante

  - Para habilitar a Consulta BIN, entre em contato com a equipe de suporte da Cielo;
  - Alguns BINs ou bandeiras podem não ter o retorno das informações do cartão;
  - Se a API retornar o código de erro 323, entre em contato com o Atendimento para habilitar a funcionalidade. Saiba mais em [Códigos de retorno Consulta BIN.](https://docs.cielo.com.br/ecommerce-cielo/reference/codigos-de-retorno-consulta-bin)
</Callout>

<Callout icon="ℹ️" theme="info">
  ### Para usar a Consulta BIN em sandbox, confira os cenários de simulação em [Consulta BIN em sandbox](https://docs.cielo.com.br/ecommerce-cielo/reference/consulta-bin-sandbox).

  Em sandbox, os valores retornados são simulações e não validações reais de BINS. Considere apenas o retorno da requisição e o seu formato. Para identificação real dos BINS, use o ambiente de produção.

  A correspondência baseada nos primeiros dígitos do cartão (dígitos 1 a 6) é utilizada apenas para geração de cenários simulados e não representa o comportamento da consulta em Produção.
</Callout>

## Resposta da consulta BIN

A API irá retornar as seguintes propriedades da Consulta BIN:

| Parâmetro       | Descrição                                                                                                                                                                                                                                                                                                                               | Tipo    | Tamanho |
| --------------- | --------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- | :------ | :------ |
| `Status`        | Status da requisição de análise de Bins: <br /> 00 – Análise autorizada <br /> 01 – Bandeira não suportada <br /> 02 – Cartão não suportado na consulta de bin <br /> 73 – Afiliação bloqueada<br />Consulte os [Códigos de retorno Consulta BIN.](https://docs.cielo.com.br/ecommerce-cielo/reference/codigos-de-retorno-consulta-bin) | string  | 2       |
| `Provider`      | Bandeira do cartão.                                                                                                                                                                                                                                                                                                                     | string  | 255     |
| `CardType`      | Tipo do cartão em uso : <br /><br /> Crédito <br /> Débito <br />Múltiplo                                                                                                                                                                                                                                                               | string  | 20      |
| `ForeingCard`   | Se o cartão é emitido no exterior (true/false).                                                                                                                                                                                                                                                                                         | boolean | -       |
| `CorporateCard` | Se o cartão é corporativo (true/false).                                                                                                                                                                                                                                                                                                 | boolean | -       |
| `Issuer`        | Nome do emissor do cartão.                                                                                                                                                                                                                                                                                                              | string  | 255     |
| `IssuerCode`    | Código do emissor do cartão.                                                                                                                                                                                                                                                                                                            | string  | 255     |
| `Prepaid`       | Retornará "true" caso o cartão seja do tipo pré-pago.                                                                                                                                                                                                                                                                                   | boolean | -       |

# OpenAPI definition

```json
{
  "openapi": "3.1.0",
  "info": {
    "title": "consulta-bin",
    "version": "3.0"
  },
  "servers": [
    {
      "url": "https://apiquerysandbox.cieloecommerce.cielo.com.br"
    }
  ],
  "security": [
    {}
  ],
  "paths": {
    "/1/cardBin/{BIN}": {
      "get": {
        "summary": "Consultar BIN do cartão",
        "description": "Consulta e retorna informações do cartão.",
        "operationId": "consulta-bin-cartao",
        "parameters": [
          {
            "name": "BIN",
            "in": "path",
            "description": "Informe o BIN (os 6 a 8 primeiros dígitos do cartão) ou o número completo do cartão (até 19 dígitos).",
            "schema": {
              "type": "integer",
              "format": "int32"
            },
            "required": true
          },
          {
            "name": "Content-Type",
            "in": "header",
            "schema": {
              "type": "string",
              "default": "application/json"
            }
          },
          {
            "name": "MerchantId",
            "in": "header",
            "description": "Identificador da loja na API. Tamanho: 36. Formato: GUID. <br>*Esta documentação traz um `MerchantId` padrão para permitir os testes em sandbox, mas você também pode informar o `MerchantId` habilitado durante o processo de implantação.*",
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
            "description": "Identificador do request definido pela loja, utilizado quando o lojista usa diferentes servidores para cada GET/POST/PUT. Tamanho: 36.",
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
                    "value": "{\n    \"Status\": \"00\",\n    \"Provider\": \"MASTERCARD\",\n    \"CardType\": \"Crédito\",\n    \"ForeignCard\": true,\n    \"CorporateCard\": true,\n    \"Issuer\": \"Bradesco\",\n    \"IssuerCode\": \"237\",\n    \"Prepaid\":true\n}"
                  }
                },
                "schema": {
                  "type": "object",
                  "properties": {
                    "Status": {
                      "type": "string",
                      "example": "00"
                    },
                    "Provider": {
                      "type": "string",
                      "example": "MASTERCARD"
                    },
                    "CardType": {
                      "type": "string",
                      "example": "Crédito"
                    },
                    "ForeignCard": {
                      "type": "boolean",
                      "example": true,
                      "default": true
                    },
                    "CorporateCard": {
                      "type": "boolean",
                      "example": true,
                      "default": true
                    },
                    "Issuer": {
                      "type": "string",
                      "example": "Bradesco"
                    },
                    "IssuerCode": {
                      "type": "string",
                      "example": "237"
                    },
                    "Prepaid": {
                      "type": "boolean",
                      "example": true,
                      "default": true
                    }
                  }
                }
              }
            }
          },
          "400": {
            "description": "400",
            "content": {
              "application/json": {
                "examples": {
                  "Result": {
                    "value": "Bad request"
                  },
                  "Serviço não habilitado": {
                    "value": "[\n   {\n      \"ReturnCode\": 323,\n      \"ReturnMessage\": \"Bin Query is not enabled\"\n   }\n ]"
                  }
                },
                "schema": {
                  "type": "array",
                  "items": {
                    "type": "object",
                    "properties": {
                      "ReturnCode": {
                        "type": "integer",
                        "example": 323,
                        "default": 0
                      },
                      "ReturnMessage": {
                        "type": "string",
                        "example": "Bin Query is not enabled"
                      }
                    }
                  }
                }
              }
            }
          },
          "500": {
            "description": "500",
            "content": {
              "application/json": {
                "examples": {
                  "Result": {
                    "value": "Internal Server Error"
                  }
                }
              }
            }
          }
        }
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