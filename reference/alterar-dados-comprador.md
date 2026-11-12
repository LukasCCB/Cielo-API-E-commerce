---
updatedAt: 2026-05-12T20:57:21.000Z
agentTools:
  siteIndex: https://docs.cielo.com.br/llms.txt
  projectIndex: https://docs.cielo.com.br/ecommerce-cielo/llms.txt
---

# Alterar dados do comprador

Altera informações pessoais do comprador

<Table align={["left","left","left"]}>
  <thead>
    <tr>
      <th style={{ textAlign: "left" }}>
        Ambiente
      </th>

      <th style={{ textAlign: "left" }}>
        Método
      </th>

      <th style={{ textAlign: "left" }}>
        Endpoint
      </th>
    </tr>
  </thead>

  <tbody>
    <tr>
      <td style={{ textAlign: "left" }}>
        Sandbox
      </td>

      <td style={{ textAlign: "left" }}>
        <div class="headline-container-article-info2GaOf2jMpV0r">
          <span class="rm-APIMethod APIMethod APIMethod_fixedWidth APIMethod_put headline-container-api-method1Hc-Fm7uaccR" data-testid="http-method">put</span>
        </div>
      </td>

      <td style={{ textAlign: "left" }}>
        `https://apisandbox.cieloecommerce.cielo.com.br/1/RecurrentPayment/{RecurrentPaymentId}/Customer`
      </td>
    </tr>

    <tr>
      <td style={{ textAlign: "left" }}>
        Produção
      </td>

      <td style={{ textAlign: "left" }}>
        <div class="headline-container-article-info2GaOf2jMpV0r">
          <span class="rm-APIMethod APIMethod APIMethod_fixedWidth APIMethod_put headline-container-api-method1Hc-Fm7uaccR" data-testid="http-method">put</span>
        </div>
      </td>

      <td style={{ textAlign: "left" }}>
        `https://api.cieloecommerce.cielo.com.br/1/RecurrentPayment/{RecurrentPaymentId}/Customer`
      </td>
    </tr>
  </tbody>
</Table>

> ℹ️ CNPJs alfanuméricos serão implementados pela Receita Federal em julho de 2026
>
> Essa mudança afeta apenas novas inscrições, **não havendo mudanças em CNPJs existentes**.
>
> O CNPJ alfanumérico **já está sendo suportado pela Cielo**, sem mudanças na sua integração.
>
> Recomendamos verificar a necessidade de possíveis ajustes nos sistemas próprios de checkout de sua loja.

<br />

# OpenAPI definition

```json
{
  "openapi": "3.1.0",
  "info": {
    "title": "recorrência",
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
    "/1/RecurrentPayment/{RecurrentPaymentId}/Customer": {
      "put": {
        "summary": "Alterar dados do comprador",
        "description": "Altera informações pessoais do comprador",
        "operationId": "alterar-dados-comprador",
        "parameters": [
          {
            "name": "RecurrentPaymentId",
            "in": "path",
            "description": "Numero de identificação da Recorrência. Tamanho: 50.",
            "required": true,
            "schema": {
              "type": "string"
            }
          },
          {
            "name": "Content-Type",
            "in": "header",
            "description": "Tamanho: 40.",
            "required": true,
            "schema": {
              "type": "string",
              "default": "application/json"
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
            "description": "Chave pública para autenticação dupla na Cielo. Tamanho: 40. Formato: GUID. <br>*Esta documentação traz um `MerchantKey` padrão para permitir os testes em sandbox, mas você também pode informar o `MerchantKey` habilitado durante o processo de implantação.*",
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
        "requestBody": {
          "content": {
            "application/json": {
              "schema": {
                "type": "object",
                "properties": {
                  "Name": {
                    "type": "string",
                    "description": "Nome do Comprador. Tamanho: 255."
                  },
                  "Status": {
                    "type": "string",
                    "description": "Status de cadastro do comprador na loja (NEW / EXISTING) - Utilizado pela análise de fraude. Tamanho: 255."
                  },
                  "Email": {
                    "type": "string",
                    "description": "Email do Comprador. Tamanho: 255."
                  },
                  "Birthdate": {
                    "type": "string",
                    "description": "Data de nascimento do Comprador (AAAA/MM/DD). Tamanho: 10.",
                    "format": "date"
                  },
                  "Identity": {
                    "type": "string",
                    "description": "Número do CPF ou CNPJ do comprador. Tamanho: 14.<br>**Permite envio de CNPJs alfanuméricos.**"
                  },
                  "IdentityType": {
                    "type": "string",
                    "description": "Tipo de documento de identificação do comprador (CFP/CNPJ). Tamanho: 255."
                  },
                  "Customer": {
                    "properties": {
                      "Address": {
                        "properties": {
                          "Street": {
                            "type": "string",
                            "description": "Endereço do Comprador. Tamanho: 255."
                          },
                          "Number": {
                            "type": "string",
                            "description": "Número do endereço do Comprador. Tamanho: 15."
                          },
                          "Complement": {
                            "type": "string",
                            "description": "Complemento do endereço do Comprador. Tamanho: 50."
                          },
                          "ZipCode": {
                            "type": "integer",
                            "description": "CEP do endereço do Comprador. Tamanho: 9.",
                            "format": "int32"
                          },
                          "City": {
                            "type": "string",
                            "description": "Cidade do endereço do Comprador. Tamanho: 50."
                          },
                          "State": {
                            "type": "string",
                            "description": "Estado do endereço do Comprador. Tamanho: 2."
                          },
                          "Country": {
                            "type": "string",
                            "description": "Pais do endereço do Comprador. Tamanho: 35."
                          },
                          "District": {
                            "type": "string",
                            "description": "Bairro do Comprador. Tamanho: 50."
                          }
                        },
                        "required": [],
                        "type": "object"
                      },
                      "DeliveryAddress": {
                        "properties": {
                          "Street": {
                            "type": "string",
                            "description": "Endereço do Comprador. Tamanho: 255."
                          },
                          "Number": {
                            "type": "integer",
                            "description": "Número do endereço do Comprador. Tamanho: 15.",
                            "format": "int32"
                          },
                          "Complement": {
                            "type": "string",
                            "description": "Complemento do endereço do Comprador. Tamanho: 50."
                          },
                          "ZipCode": {
                            "type": "integer",
                            "description": "CEP do endereço do Comprador. Tamanho: 9.",
                            "format": "int32"
                          },
                          "City": {
                            "type": "string",
                            "description": "Cidade do endereço do Comprador. Tamanho: 50."
                          },
                          "State": {
                            "type": "string",
                            "description": "Estado do endereço do Comprador. Tamanho: 2."
                          },
                          "Country": {
                            "type": "string",
                            "description": "Pais do endereço do Comprador. Tamanho: 35."
                          },
                          "District": {
                            "type": "string",
                            "description": "Bairro do Comprador. Tamanho: 50."
                          }
                        },
                        "required": [],
                        "type": "object"
                      }
                    },
                    "required": [],
                    "type": "object"
                  }
                }
              },
              "examples": {
                "Request Example": {
                  "value": {
                    "Name": "Nome do Comprador",
                    "Email": "customer@teste.com",
                    "Birthdate": "1999-12-12",
                    "Identity": "22658954236",
                    "IdentityType": "CPF",
                    "Address": {
                      "Street": "Rua Teste",
                      "Number": "174",
                      "Complement": "AP 201",
                      "ZipCode": "05426200",
                      "City": "São Paulo",
                      "State": "SP",
                      "Country": "BRA",
                      "District": "Alphaville"
                    },
                    "DeliveryAddress": {
                      "Street": "Outra Rua Teste",
                      "Number": "123",
                      "Complement": "AP 111",
                      "ZipCode": "21241111",
                      "City": "Qualquer Lugar",
                      "State": "QL",
                      "Country": "BRA",
                      "District": "Teste"
                    }
                  }
                }
              }
            }
          }
        },
        "responses": {
          "200": {
            "description": "200",
            "content": {
              "text/plain": {
                "examples": {
                  "Result": {
                    "value": "HTTP Status 200"
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