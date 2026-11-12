---
updatedAt: 2026-09-25T14:53:16.000Z
agentTools:
  siteIndex: https://docs.cielo.com.br/llms.txt
  projectIndex: https://docs.cielo.com.br/ecommerce-cielo/llms.txt
---

# SDWO de arranjo de transferência de fundos

## Tabela de MCCs para cada tipo de SDWO

Para as carteiras digitais de arranjo de transferência de fundos, o valor do Merchant Category Code (MCC) pode variar conforme o tipo de SDWO e bandeira. Confira a tabela completa:

| Tipo                                                  | MCC para Mastercard (débito e crédito) | MCC para ELO (débito e crédito à vista - somente pré-pago)\* |                                                                               MCC para Visa                                                                               | MCC para Amex |
| ----------------------------------------------------- | :------------------------------------: | :----------------------------------------------------------: | :-----------------------------------------------------------------------------------------------------------------------------------------------------------------------: | :------------ |
| **Me2Me**                                             |                  6540                  |                         6540 ou 6051                         |                                                                                6540 ou 6051                                                                               | 6540          |
| **P2P**                                               |                  6540                  |                               -                              |                                                                                6540 ou 6051                                                                               | 6540          |
| **Transferência para outro arranjo**                  |                  6540                  |                               -                              |                                                                                    6540                                                                                   | 6540          |
| **Pagamento de Conta&#xD;**<br />**Não identificada** |                  6540                  |                               -                              | Consulte a [tabela de MCCs Visa](https://docs.cielo.com.br/ecommerce-cielo/reference/sdwo-transferencia-fundos#mccs-visa-para-pagamento-de-conta) para Pagamento de Conta | 6540          |
| **Pagamento de Conta**<br />**Identificada**          |                  6540                  |                               -                              | Consulte a [tabela de MCCs Visa](https://docs.cielo.com.br/ecommerce-cielo/reference/sdwo-transferencia-fundos#mccs-visa-para-pagamento-de-conta) para Pagamento de Conta | 6540          |
| **Pedágio**                                           |                  4784                  |                             4784                             |                                                                                    4784                                                                                   | 4784          |

> \*A bandeira Elo considera todos os arranjos como **Me2Me**.

## MCCs Visa para Pagamento de Conta

Para transações Visa classificadas como **Pagamento de Conta Identificada** ou **Pagamento de Conta Não Identificada**, são aceitos os seguintes MCCs:

<Callout icon="📘" theme="info">
  ### **Importante**

  Para transações Visa dos tipos **Pagamento de Conta Identificada** e **Pagamento de Conta Não Identificada**, informe o MCC de acordo com a atividade econômica do estabelecimento recebedor, observando a lista de MCCs elegíveis apresentada a seguir.
</Callout>

| MCC  | Descrição                                                       |
| ---- | --------------------------------------------------------------- |
| 4814 | Serviços de Telecomunicações                                    |
| 4899 | TV por Assinatura, Streaming e Rádio                            |
| 4900 | Concessionárias de Água, Energia, Gás e Saneamento              |
| 6012 | Instituições Financeiras - Pagamentos e Quitação de Dívidas     |
| 6051 | Instituições Não Financeiras - Pagamentos e Quitação de Dívidas |
| 6300 | Seguros                                                         |
| 6513 | Administração e Intermediação Imobiliária                       |
| 6540 | Instituições Financeiras / Transferência de Recursos            |
| 8011 | Médicos e Clínicas                                              |
| 8050 | Cuidados Residenciais e Home Care                               |
| 8062 | Hospitais                                                       |
| 8099 | Serviços de Saúde                                               |
| 8111 | Serviços Jurídicos                                              |
| 8211 | Ensino Fundamental e Médio                                      |
| 8220 | Universidades e Ensino Superior                                 |
| 8241 | Ensino por Correspondência                                      |
| 8244 | Escolas de Negócios e Secretariado                              |
| 8249 | Escolas Técnicas e Profissionalizantes                          |
| 8299 | Outros Serviços Educacionais                                    |
| 8351 | Creches e Serviços de Cuidados Infantis                         |
| 9311 | Pagamento de Tributos e Impostos                                |

## Exemplos de requisições para cada carteira

* [**Transferência para o mesmo portador (Me2Me)**](https://docs.cielo.com.br/ecommerce-cielo/reference/sdwo-me2me)
* [**Transferência para outro portador (P2P)**](https://docs.cielo.com.br/ecommerce-cielo/reference/sdwo-p2p)
* [**Transferência para outro arranjo**](https://docs.cielo.com.br/ecommerce-cielo/reference/sdwo-outro-arranjo)
* [**Pagamento de conta identificada**](https://docs.cielo.com.br/ecommerce-cielo/reference/sdwo-pagamento-de-conta-identificada)
* [**Pagamento de conta não identificada**](https://docs.cielo.com.br/ecommerce-cielo/reference/sdwo-pagamento-conta-nao-identificada)
* [**Pedágio**](https://docs.cielo.com.br/ecommerce-cielo/reference/pedagio-sdwo)