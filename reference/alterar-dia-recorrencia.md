---
updatedAt: 2025-10-30T01:22:28.000Z
agentTools:
  siteIndex: https://docs.cielo.com.br/llms.txt
  projectIndex: https://docs.cielo.com.br/ecommerce-cielo/llms.txt
---

# Alterar dia da recorrência

Altera o dia de cobrança de um pedido recorrente

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
        <div class="headline-container-article-info2GaOf2jMpV0r"><span class="rm-APIMethod APIMethod APIMethod_fixedWidth APIMethod_put headline-container-api-method1Hc-Fm7uaccR" data-testid="http-method">put</span></div>
      </td>
      <td style={{ textAlign: "left" }}>
        `https://apisandbox.cieloecommerce.cielo.com.br/1/RecurrentPayment/{RecurrentPaymentId}/RecurrencyDay`
      </td>
    </tr>
    <tr>
      <td style={{ textAlign: "left" }}>
        Produção
      </td>
      <td style={{ textAlign: "left" }}>
        <div class="headline-container-article-info2GaOf2jMpV0r"><span class="rm-APIMethod APIMethod APIMethod_fixedWidth APIMethod_put headline-container-api-method1Hc-Fm7uaccR" data-testid="http-method">put</span></div>
      </td>
      <td style={{ textAlign: "left" }}>
        `https://api.cieloecommerce.cielo.com.br/1/RecurrentPayment/{RecurrentPaymentId}/RecurrencyDay`
      </td>
    </tr>
  </tbody>
</Table>

Ao efetuar a alteração do dia da recorrência, considere as seguintes regras para execução da atualização na API:

1. Se o novo dia informado for depois do dia atual, iremos atualizar o dia da recorrência com efeito na próxima recorrência.

**Exemplo**: hoje é dia 05/05 e a próxima recorrência é dia 25/05. Quando atualizado para o dia 10, a data da próxima recorrência será dia 10/05.

2. Se o novo dia informado for antes do dia atual, iremos atualizar o dia da recorrência, mas este só terá efeito depois que a próxima recorrência for executada com sucesso.

**Exemplo**: hoje é dia 05/05 e a próxima recorrência é dia 25/05. Quando atualizado para o dia 03, a data da próxima recorrência permanecerá dia 25/05. Após sua execução, a recorrência seguinte será agendada para o dia 03/06.

3. Se o novo dia informado for antes do dia atual, mas a próxima recorrência for em outro mês, iremos atualizar o dia da recorrência com efeito na próxima recorrência.

**Exemplo**: hoje é dia 05/05 e a próxima recorrência é dia 25/09. Quando atualizado para o dia 03, a data da próxima recorrência será 03/09.

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
    "/1/RecurrentPayment/{RecurrentPaymentId}/RecurrencyDay": {
      "put": {
        "summary": "Alterar dia da recorrência",
        "description": "Altera o dia de cobrança de um pedido recorrente",
        "operationId": "alterar-dia-recorrencia",
        "parameters": [
          {
            "name": "RecurrentPaymentId",
            "in": "path",
            "description": "Numero de identificação da Recorrência. Tamanho: 50.",
            "schema": {
              "type": "string"
            },
            "required": true
          },
          {
            "name": "RecurrencyDay",
            "in": "query",
            "description": "Dia da Recorrência. Tamanho: 2.",
            "schema": {
              "type": "string"
            }
          },
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