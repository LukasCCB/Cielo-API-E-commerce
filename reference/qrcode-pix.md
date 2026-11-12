---
updatedAt: 2026-07-17T12:41:19.000Z
agentTools:
  siteIndex: https://docs.cielo.com.br/llms.txt
  projectIndex: https://docs.cielo.com.br/ecommerce-cielo/llms.txt
---

# Criar pagamento com QRCode Pix

Cria transação com o meio de pagamento Pix.

<Callout icon="ℹ️" theme="info">
  ###

  Saiba mais sobre essa funcionalidade <a href="https://docs.cielo.com.br/ecommerce-cielo/docs/pix" target="_blank">na documentação</a>.
</Callout>

| Ambiente | Método                                                                                                                                                                                                                  | Endpoint                                                  |
| :------- | :---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- | :-------------------------------------------------------- |
| Sandbox  | <div class="headline-container-article-info2GaOf2jMpV0r"><span class="rm-APIMethod APIMethod APIMethod_fixedWidth APIMethod_post headline-container-api-method1Hc-Fm7uaccR" data-testid="http-method">post</span></div> | `https://apisandbox.cieloecommerce.cielo.com.br/1/sales/` |
| Produção | <div class="headline-container-article-info2GaOf2jMpV0r"><span class="rm-APIMethod APIMethod APIMethod_fixedWidth APIMethod_post headline-container-api-method1Hc-Fm7uaccR" data-testid="http-method">post</span></div> | `https://api.cieloecommerce.cielo.com.br/1/sales/`        |

> ℹ️ CNPJs alfanuméricos serão implementados pela Receita Federal em julho de 2026
>
> Essa mudança afeta apenas novas inscrições, **não havendo mudanças em CNPJs existentes**.
>
> O CNPJ alfanumérico **já está sendo suportado pela Cielo**, sem mudanças na sua integração.
>
> Recomendamos verificar a necessidade de possíveis ajustes nos sistemas próprios de checkout de sua loja.

> ⚠️ Nova integração Pix na Cielo
>
> A partir de 01/09/2025, novas integrações de Pix serão feitas com o novo provedor de Pix na Cielo, o `Cielo2`. Saiba mais sobre a <a href="https://docs.cielo.com.br/ecommerce-cielo/docs/pix-cielo" target="_blank">nova integração de Pix na Cielo</a>.

<br />

<Callout icon="⚠️" theme="warn">
  ### Atenção

  A Cielo permite contratar mais de uma modalidade de Pix (como Pix Cielo, Pix Banco do Brasil ou Pix Bradesco). No entanto, **apenas uma modalidade pode ficar ativa por vez** para todo o CNPJ.CNPJ.

  A habilitação e a alteração da modalidade de Pix são feitas no <Anchor target="_blank" href="https://www.cielo.com.br/">site da Cielo</Anchor>. Para mais informações, consulte <Anchor target="_blank" href="https://docs.cielo.com.br/ecommerce-cielo/docs/como-habilitar-pix">Com habilitar o Pix</Anchor>.
</Callout>

### Resposta da criação do QR Code Pix

A tabela a seguir apresenta os principais parâmetros que podem ser retornados pela API na criação de um QR Code Pix.

| PROPRIEDADE                     | DESCRIÇÃO                                                                                                                                                                                                                                                                 | TIPO    | TAMANHO  |
| ------------------------------- | ------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- | ------- | -------- |
| `Payment.PaymentId`             | Campo identificador do pedido.                                                                                                                                                                                                                                            | GUID    | 40       |
| `Payment.AcquirerTransactionId` | Identificador da transação na Cielo.                                                                                                                                                                                                                                      | GUID    | 36       |
| `Payment.ProofOfSale`           | NSU Pix.                                                                                                                                                                                                                                                                  | string  | 20       |
| `Payment.QrcodeBase64Image`     | Código em base64 da imagem do QR code.                                                                                                                                                                                                                                    | string  | -        |
| `Payment.QrCodeString`          | Texto codificado para o comprador "copiar" e "colar" no campo do internet banking em pagamentos feitos no ambiente mobile. A disponibilização deste código é de responsabilidade da loja. Recomendamos a exibição de um botão que, ao clicar, o comprador copie o código. | string  | Variável |
| `Payment.Status`                | Status da transação. Em caso de sucesso, o status inicial é “12” (*Pendente*). Veja a tabela completa de [Status transacional](https://docs.cielo.com.br/ecommerce-cielo/reference/payment-status)                                                                        | integer | -        |
| `Payment.ReturnCode`            | Código retornado pelo provedor do meio de pagamento.                                                                                                                                                                                                                      | string  | 32       |
| `Payment.ReturnMessage`         | Mensagem retornada pelo provedor do meio de pagamento.                                                                                                                                                                                                                    | string  | 512      |

<br />

# OpenAPI definition

```json
{
  "openapi": "3.1.0",
  "info": {
    "title": "pix",
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
    "/1/sales/": {
      "post": {
        "summary": "Criar pagamento com QRCode Pix",
        "description": "Cria transação com o meio de pagamento Pix.",
        "operationId": "qrcode-pix",
        "parameters": [
          {
            "name": "Content-Type",
            "in": "header",
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
            "description": "Identificador do request definido pela loja, utilizado quando o lojista usa diferentes servidores para cada GET/POST/PUT. Tamanho: 36.",
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
                "required": [
                  "MerchantOrderId"
                ],
                "properties": {
                  "MerchantOrderId": {
                    "type": "string",
                    "description": "Identificação do pedido. Poderá ser usada para solicitar a devolução ou consultar a transação no futuro.<br> *Atenção: Os caracteres permitidos são apenas a-z, A-Z, 0-9. Não são permitidos caracteres especiais e espaços em branco.* <br>Tamanho: 50."
                  },
                  "Customer": {
                    "properties": {
                      "Name": {
                        "type": "string",
                        "description": "Nome do pagador. Tamanho: 255.<br>_Atenção: Os caracteres permitidos são apenas a-z, A-Z. Não são permitidos caracteres especiais e números._"
                      },
                      "Identity": {
                        "type": "string",
                        "description": "Número do CPF ou CNPJ do cliente. Tamanho: 14.<br>**Permite envio de CNPJs alfanuméricos.**"
                      },
                      "IdentityType": {
                        "type": "string",
                        "description": "Tipo de documento de identificação do comprador (CPF ou CNPJ). Tamanho: 255."
                      }
                    },
                    "type": "object"
                  },
                  "Payment": {
                    "properties": {
                      "Type": {
                        "type": "string",
                        "description": "Tipo do meio de pagamento. Neste caso, \"Pix\"."
                      },
                      "Amount": {
                        "type": "string",
                        "description": "Valor do pedido, em centavos. Tamanho: 15."
                      }
                    },
                    "required": [
                      "Type",
                      "Amount"
                    ],
                    "type": "object"
                  }
                }
              },
              "examples": {
                "Request Example": {
                  "value": {
                    "MerchantOrderId": "Loja123456",
                    "Customer": {
                      "Name": "Nome do Pagador",
                      "Identity": "12345678909",
                      "IdentityType": "CPF"
                    },
                    "Payment": {
                      "Type": "Pix",
                      "Amount": 100
                    }
                  }
                }
              }
            }
          }
        },
        "responses": {
          "201": {
            "description": "201",
            "content": {
              "application/json": {
                "examples": {
                  "Result": {
                    "value": "{\n    \"MerchantOrderId\":\"Loja123456\",\n    \"Customer\":{\n       \"Name\":\"Nome do Pagador\"\n    },\n    \"Payment\":{\n       \"Paymentid\":\"1997be4d-694a-472e-98f0-e7f4b4c8f1e7\",\n       \"Type\":\"Pix\",\n       \"AcquirerTransactionId\":\"86c200c7-7cdf-4375-92dd-1f62dfa846ad\",\n          \"ProofOfSale\":\"123456\",\n       \"QrcodeBase64Image\":\"rfhviy64ak+zse18cwcmtg==[...]\",\n       \"QrCodeString\":\"00020101021226880014br.gov.bcb.pix2566qrcodes-h.cielo.com.br/pix-qr/d05b1a34-ec52-4201-ba1e-d3cc2a43162552040000530398654041.005802BR5918Merchant Teste HML6009Sao Paulo62120508000101296304031C\",\n       \"Amount\":100,\n       \"ReceivedDate\":\"2020-10-15 18:53:20\",\n       \"Status\":12,\n       \"ReturnCode\":\"0\",\n       \"ReturnMessage\":\"Pix gerado com sucesso\"\n    }\n }"
                  }
                },
                "schema": {
                  "type": "object",
                  "properties": {
                    "MerchantOrderId": {
                      "type": "string",
                      "example": "Loja123456"
                    },
                    "Customer": {
                      "type": "object",
                      "properties": {
                        "Name": {
                          "type": "string",
                          "example": "Nome do Pagador"
                        }
                      }
                    },
                    "Payment": {
                      "type": "object",
                      "properties": {
                        "Paymentid": {
                          "type": "string",
                          "example": "1997be4d-694a-472e-98f0-e7f4b4c8f1e7"
                        },
                        "Type": {
                          "type": "string",
                          "example": "Pix"
                        },
                        "AcquirerTransactionId": {
                          "type": "string",
                          "example": "86c200c7-7cdf-4375-92dd-1f62dfa846ad"
                        },
                        "ProofOfSale": {
                          "type": "string",
                          "example": "123456"
                        },
                        "QrcodeBase64Image": {
                          "type": "string",
                          "example": "rfhviy64ak+zse18cwcmtg==[...]"
                        },
                        "QrCodeString": {
                          "type": "string",
                          "example": "00020101021226880014br.gov.bcb.pix2566qrcodes-h.cielo.com.br/pix-qr/d05b1a34-ec52-4201-ba1e-d3cc2a43162552040000530398654041.005802BR5918Merchant Teste HML6009Sao Paulo62120508000101296304031C"
                        },
                        "Amount": {
                          "type": "integer",
                          "example": 100,
                          "default": 0
                        },
                        "ReceivedDate": {
                          "type": "string",
                          "example": "2020-10-15 18:53:20"
                        },
                        "Status": {
                          "type": "integer",
                          "example": 12,
                          "default": 0
                        },
                        "ReturnCode": {
                          "type": "string",
                          "example": "0"
                        },
                        "ReturnMessage": {
                          "type": "string",
                          "example": "Pix gerado com sucesso"
                        }
                      }
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
  "x-readme": {
    "headers": [],
    "explorer-enabled": true,
    "proxy-enabled": true
  },
  "x-readme-fauxas": true
}
```