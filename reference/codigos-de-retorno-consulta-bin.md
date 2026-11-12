---
updatedAt: 2026-10-07T12:02:40.000Z
agentTools:
  siteIndex: https://docs.cielo.com.br/llms.txt
  projectIndex: https://docs.cielo.com.br/ecommerce-cielo/llms.txt
---

# Códigos de retorno Consulta BIN

Os códigos apresentados correspondem ao campo `Status`, retornado na consulta do BIN do cartão. Quando a funcionalidade não está habilitada para o lojista, a API retorna erros técnicos nos campos `Code` e `Message`.

| `Status` ou `Code` | Mensagem                 | Descrição                                                                               |
| ------------------ | ------------------------ | --------------------------------------------------------------------------------------- |
| 00                 | --                       | Análise autorizada.                                                                     |
| 01                 | --                       | Bandeira não suportada.                                                                 |
| 02                 | --                       | Cartão não suportado na consulta de BIN.                                                |
| 73                 | --                       | Afiliação bloqueada.                                                                    |
| 323                | Bin Query is not enabled | A Consulta BIN não está habilitada. Para habilitar, entre em contato com o Atendimento. |

<Callout icon="ℹ️" theme="info">
  Os códigos e comportamentos em Sandbox podem diferir dos ambientes de produção. Consulte a página [Consulta BIN em Sandbox](https://docs.cielo.com.br/ecommerce-cielo/reference/consulta-bin-sandbox) para mais informações.
</Callout>