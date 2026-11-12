---
updatedAt: 2026-04-09T18:21:41.000Z
agentTools:
  siteIndex: https://docs.cielo.com.br/llms.txt
  projectIndex: https://docs.cielo.com.br/ecommerce-cielo/llms.txt
---

# Zero Auth em sandbox

<Callout icon="ℹ️" theme="info">
  Vá para a [Referência da API para acessar os exemplos completos de requisição e resposta](https://docs.cielo.com.br/ecommerce-cielo/reference/validar-cartao).
</Callout>

## Simular uma autorização

Para simular um cenário de **autorização** no **Zero Auth** no ambiente **sandbox**:

* Utilize um **número de cartão que inicie com o dígito `5` e termine com `0`**, independentemente da bandeira;
* Caso o serviço de **tokenização** esteja habilitado, o cartão também deve ser válido no **algoritmo de Luhn (mod10)**.

Exemplos de cartões para simular uma autorização no Zero Auth:

| **Número do Cartão** | Código de Retorno | **Mensagem de retorno** |
| -------------------- | :---------------- | :---------------------- |
| 5502095822650000     | 00                | Transação autorizada    |
| 5315281703921200     | 00                | Transação autorizada    |

> Cartões aplicáveis a qualquer bandeira aceita no Zero Auth: Visa, Master e Elo.

## Simular uma autorização negada

Para simular cenários de autorização negada no Zero Auth, utilize os cartões abaixo. Cada um retorna um código específico:

| **Número do Cartão** | **Bandeira** | **Código de Retorno** | **Mensagem de retorno** |
| -------------------- | ------------ | --------------------- | :---------------------- |
| 1230069300407910     | Visa         | 39                    | Autorização negada      |
| 1230069300407944     | Visa         | R2                    | Autorização negada      |
| 5270011231668402     | Master       | 82                    | Autorização negada      |
| 6540540000003836     | Elo          | 36                    | Autorização negada      |

<br />