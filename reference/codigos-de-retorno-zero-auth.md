---
updatedAt: 2026-10-07T12:03:26.000Z
agentTools:
  siteIndex: https://docs.cielo.com.br/llms.txt
  projectIndex: https://docs.cielo.com.br/ecommerce-cielo/llms.txt
---

# Códigos de retorno Zero Auth

Os códigos apresentados correspondem ao campo `ReturnCode`, retornado na validação do cartão. Quando a funcionalidade não está habilitada para o lojista, a API retorna erros técnicos nos campos `Code` e `Message`.

Veja os valores possíveis e as descrições na tabela a seguir.

| `ReturnCode` ou `Code` | `ReturnMessage` ou `Message`    | Descrição                                                                                                                                                                                                 |
| ---------------------- | ------------------------------- | --------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| 00                     | Transacao autorizada            | Cartão válido para transacionar.                                                                                                                                                                          |
| 57                     | Autorizacao negada              | Cartão inválido para transacionar.                                                                                                                                                                        |
| 322                    | Zero Dollar Auth is not enabled | O Zero Auth não está habilitado. Para habilitar, entre em contato com o suporte Cielo.                                                                                                                    |
| 389                    | Restrição Cadastral             | Não foi possível validar o cartão. Verifique com seu gestor comercial se o serviço está habilitado para o estabelecimento. Se a habilitação estiver correta, tente realizar a validação com outro cartão. |

<Callout icon="ℹ️" theme="info">
  Os códigos e comportamentos em Sandbox podem diferir dos ambientes de produção. Consulte a página [Zero Auth em Sandbox](https://docs.cielo.com.br/ecommerce-cielo/reference/zero-auth-em-sandbox) para mais informações.
</Callout>