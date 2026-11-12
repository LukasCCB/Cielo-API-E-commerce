---
updatedAt: 2026-07-16T20:42:45.000Z
agentTools:
  siteIndex: https://docs.cielo.com.br/llms.txt
  projectIndex: https://docs.cielo.com.br/ecommerce-cielo/llms.txt
---

# Ambientes e arquitetura da API

# Ambientes

## Sandbox

| API              |                        URL base                       |
| :--------------- | :---------------------------------------------------: |
| **Transacional** |    `https://apisandbox.cieloecommerce.cielo.com.br`   |
| **Consultas**    | `https://apiquerysandbox.cieloecommerce.cielo.com.br` |

## Produção

| API              |                     URL base                    |
| :--------------- | :---------------------------------------------: |
| **Transacional** |    `https://api.cieloecommerce.cielo.com.br/`   |
| **Consultas**    | `https://apiquery.cieloecommerce.cielo.com.br/` |

# Arquitetura da API

O modelo empregado na integração das APIs é simples e se baseia na utilização de duas URLs:

* **URL transacional**: específica para operações como <Glossary>autorização</Glossary>, captura e cancelamento de transações.
* **URL de consulta**: para operações consultivas, como uma pesquisa de transações.

Para executar uma operação:

1. Combine a **base** da URL do ambiente com o ***endpoint*** da operação desejada. Ex.: `https://api.cieloecommerce.cielo.com.br/1/sales/`
2. Envie a requisição para a URL utilizando o método HTTP adequado à operação.

| Método HTTP | Descrição                                                                                            |
| ----------- | ---------------------------------------------------------------------------------------------------- |
| **GET**     | Retorna recursos já existentes, ex.: consulta de transações.                                         |
| **POST**    | Cria um novo recurso, ex.: criação de uma transação.                                                 |
| **PUT**     | Atualiza um recurso existente, ex.: captura ou cancelamento de uma transação previamente autorizada. |

Todas a operações requerem as credenciais de acesso `MerchantId` e `MerchantKey`, que devem ser enviadas no cabeçalho (*header*) da requisição.

Cada envio de requisição irá retornar um código de <a href="https://docs.cielo.com.br/ecommerce-cielo/reference/http-status">Status HTTP</a>, indicando se ela foi realizada com sucesso ou não.