---
updatedAt: 2025-10-30T01:04:50.000Z
agentTools:
  siteIndex: https://docs.cielo.com.br/llms.txt
  projectIndex: https://docs.cielo.com.br/ecommerce-cielo/llms.txt
---

# QR Code

> ℹ️
>
> Vá para a <a href="https://docs.cielo.com.br/ecommerce-cielo/reference/qr-code-api" target="\_blank">Referência da API para acessar os exemplos completos de requisição e resposta</a>.

<Image alt="Fluxo transacional QR Code" align="center" src="https://files.readme.io/85b8fa6-fluxo-qrcode-pt.png" />

Para criar uma transação que utilizará cartão de crédito, é necessário enviar uma requisição utilizando o método `POST` para o recurso Payment, conforme o exemplo da Referência da API. Esse exemplo contempla o mínimo de campos necessários a serem enviados para a autorização.

> ⚠️ Atenção
>
> Não é possível realizar uma transação com valor (`Amount`) 0.

> **Facilitadores de Pagamento** (ou subcredenciadores) devem, obrigatoriamente, enviar os parâmetros do nó `PaymentFacilitator` por exigência do Banco Central e das bandeiras. Caso não sejam enviados, a bandeira pode aplicar penalidades ao facilitador de pagamento.