---
updatedAt: 2026-08-07T13:16:04.000Z
agentTools:
  siteIndex: https://docs.cielo.com.br/llms.txt
  projectIndex: https://docs.cielo.com.br/ecommerce-cielo/llms.txt
---

# Consulta BIN em sandbox

O BIN de um cartão é composto pelos seis ou nove primeiros dígitos. **Na simulação da Consulta BIN em ambiente sandbox, cada um dos *seis* primeiros dígitos vai reger um resultado simulado**.

É possível montar uma numeração de cartão para teste e observar o retorno esperado de acordo com diferentes cenários.

O BIN de um cartão retorna a bandeira, o tipo, a nacionalidade, se o cartão é corporativo ou não, o retorno da análise de BIN e o emissor do cartão.

<Callout icon="ℹ️" theme="info">
  ### Para saber mais, leia a seção [**Consulta BIN**](https://docs.cielo.com.br/ecommerce-cielo/docs/consulta-bin) neste mesmo manual.
</Callout>

| Dígito    | O que indica                      | Retorno                                                                                                                                                                                                              |
| --------- | --------------------------------- | -------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| 1º dígito | Bandeira.                         | Se for '**3**' retorna "**AMEX**"<br />Se for '**5**' retorna "**MASTERCARD**"<br />Se for '**6**' retorna "**DISCOVER**"<br />Qualquer outro número retorna "**VISA**".                                             |
| 2º dígito | Tipo do cartão.                   | Se for '**3**' retorna "**Débito**"<br />Se for '**5**' retorna "**Crédito**"<br />Se for '**7**' retorna "**Crédito**" e retorna o campo `Prepaid`como "**true**"<br />Qualquer outro número retorna"**Múltiplo**". |
| 3º dígito | Nacionalidade do cartão.          | Se for '**1**' retorna "**true**" (cartão nacional)<br />Qualquer número diferente de '**1**' retorna "**false**" (cartão internacional).                                                                            |
| 4º dígito | Se o cartão é corporativo ou não. | Se for '**1**' retorna "**true**" (é cartão corporativo)<br />Qualquer número diferente de '**1**' retorna "**false**" (não é cartão corporativo).                                                                   |
| 5º dígito | Retorno da análise.               | Se for '**2**' retorna "**01 - Bandeira não suportada**"<br />Se for '**3**' retorna "**02 - Voucher - Não suportado na consulta de bins**"<br />Qualquer outro número retorna "**00 - Analise autorizada**"         |
| 6º dígito | Banco emissor.                    | Se for '**1**' retorna "**104**" e "**Caixa**"<br />Se for '**2**' retorna "**001**" e "**Banco do Brasil**"<br />Qualquer outro número retorna "**237**" e "**Bradesco**"                                           |

**Exemplo**

O cartão com a numeração **4110110012341234** irá retornar os seguintes dados:

<br />

<Image src="https://files.readme.io/5680d2e-consultabin-sdbx-cielo.png" alt="Ilustração de cartão de crédito indicando as informações do BIN do cartão." align="center" />

<Callout icon="⚠️" theme="warn">
  &#x20;

  Em ambiente Sandbox, determinados retornos são simulados para fins de teste.

  A correspondência baseada nos primeiros dígitos do cartão (dígitos 1 a 6) é utilizada apenas para geração de cenários simulados e não representa o comportamento da consulta em Produção.
</Callout>