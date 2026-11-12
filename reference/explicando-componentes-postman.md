---
updatedAt: 2025-10-30T01:07:04.000Z
agentTools:
  siteIndex: https://docs.cielo.com.br/llms.txt
  projectIndex: https://docs.cielo.com.br/ecommerce-cielo/llms.txt
---

# Explicando Componentes do Postman

Nesta área vamos explicar os diferentes componentes do Postman e suas funções. Depois dessa introdução, as próximas partes deste tutorial vão focar na configurações e usos para teste das APIs

<Image alt="Tela inicial do Postman" align="center" src="https://files.readme.io/3a24608136d672aa3d12ef3402f114f680d0c449d2f2868e6fcf501da4478218-pc.png" />

**A** - **Environment (Ambiente)**:\
Ambiente para onde serão direcionadas as requisições. Nesta área que serão definidos dados de:

| Dados               | Descrição                                     |
| ------------------- | --------------------------------------------- |
| **MerchantId**      | Identificador de sua loja nas APIs Cielo      |
| **MerchantKey**     | Chave de segurança da sua loja nas APIs Cielo |
| **URL do POST/PUT** | Endpoint Para criar ou editar transações      |
| **URL do GET**      | Endpoint para consulta de transações          |

Sugerimos que sejam criados dois ambientes, um com dados de produção e outro para Sandbox, cada um com suas respectivas credenciais e URLs.\
Desta maneira se torna muito mais simples realizar testes com o mesmo contrato para ambos os ambientes.

**B** - **Header**\
Aqui existem o MerchantId/MerchantKey, que por padrão usam os mesmos dados registrados em `Environment`.

**C** - **Body**:\
É o conteúdo das Requisições. Aqui é onde você pode alterar ou criar exemplos para a API e validar o conteúdo do seu `POST`/`GET`/`PUT`

**D** - **Collection (Coleções)** :\
Local que contém todas os exemplos e códigos que podem ser utilizados na API. Aqui existem as criações de transações, consultas e outras funcionalidades que existem nas APIs Cielo.\
O número de coleções é ilimitado, ou seja, você pode criar várias coleções para se adequar ao seu estilo de uso do Postman.