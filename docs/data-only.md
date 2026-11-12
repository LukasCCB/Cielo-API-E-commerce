---
updatedAt: 2025-10-30T01:02:32.000Z
agentTools:
  siteIndex: https://docs.cielo.com.br/llms.txt
  projectIndex: https://docs.cielo.com.br/ecommerce-cielo/llms.txt
---

# Data Only – somente notificação

## O que é Data Only?

O Data Only é um campo opcional que pode ser utilizado para contribuir para o banco de dados da bandeira e emissor, melhorando a performance da <Glossary>autenticação</Glossary>. As transações do tipo Data Only fazem parte do protocolo 3DS, mas excluem a etapa de pedido de autenticação por desafio. Assim, o fluxo de transação do Data Only sempre será sem atrito (*frictionless*) e sem *liability shift* (o risco em caso de chargeback permanece com a loja).

## Quando usar Data Only?

O Data Only pode ser usado para **compartilhar os dados de uma transação com o emissor**, sem que exista o desafio.  Nesse caso, se o campo do Data Only foi parametrizado no script, a bandeira vai receber os dados parametrizados e vai compartilhar essas informações com o emissor. Com o tempo, o emissor terá mais dados de transações daquele cartão e da pessoa titular do cartão e terá mais elementos para realizar a autenticação.

**Benefícios do Data Only**

* Zerar qualquer tipo de fricção com o comprador, pois não há apresentação do desafio;
* Melhorar a conversão por enriquecimento da base de dados do emissor.

## Como usar o Data Only?

### 1. Parametrize o campo `bpmpi_auth_notifyonly` no script

Para usar o Data Only, siga todos os passos da [Integração do script](https://docs.cielo.com.br/ecommerce-cielo/docs/script-autenticacao), parametrizando o campo `bpmpi_auth_notifyonly` descrito no item **Etapa de Autenticação – passo 3 – Mapeamento de classes**.

No modelo Data Only, os campos adicionais do 3DS são mapeados da mesma forma e enviados para a bandeira

| **Campo**               | **Descrição**                                                                                                                                                                                                                                | **Tipo/Tamanho**                                                           | **Obrigatório**                                             |
| ----------------------- | -------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- | -------------------------------------------------------------------------- | ----------------------------------------------------------- |
| `bpmpi_auth_notifyonly` | Booleano que indica se a transação com cartão será submetida no modo "somente notificação". Neste modo, o processo de autenticação não será acionado, porém, os dados serão submetidos à bandeira. **Válido para cartões Mastercard e Visa** | Booleano:  true – modo somente notificação;  false – modo com autenticação | Condicional - obrigatório somente para transações Data Only |

### 2. Na etapa de autorização, envie o campo `DataOnly` como true

Na autorização de transações com Data Only, informe o campo `DataOnly` como true no nó `ExternalAuthentication`

```json
     "ExternalAuthentication":{
       "Eci":"4",
       "ReferenceID":"a24a5d87-b1a1-4aef-a37b-2f30b91274e6",
       "Xid":"Uk5ZanBHcWw2RjRCbEN5dGtiMTB=",
       "Version":"2.2.0",
       "DataOnly":true
     }
```

> ℹ️ Veja exemplo completo da [requisição de autorização com DataOnly](https://docs.cielo.com.br/ecommerce-cielo/docs/data-only-autorizacao).

## Quais bandeiras aceitam Data Only?

O **Data Only** é válido para as bandeiras Mastercard e Visa.

Para **Data Only Mastercard, o ECI será sempre 4**;\
Para **Data Only Visa, o ECI será sempre 7**.

> ⚠️ Disponibilizamos  <a href="https://docs.cielo.com.br/ecommerce-cielo/docs/3ds-cartoes-teste#cart%C3%B5es-de-teste-para-3ds-data-only" target="_blank">cartões de teste</a> para simular o fluxo Data Only.

> ❗️ Importante
>
> A bandeira Visa não está aceitando autenticações Data Only para transações de cartão de crédito e débito do emissor Caixa no momento. Portanto, a autenticação Data Only Visa para a Caixa está desativada.

<br />

## Quais são as diferenças entre as transações 3DS padrão e 3DS Data Only?

| Característica                          | 3DS padrão                                        | 3DS Data Only                      |
| --------------------------------------- | ------------------------------------------------- | ---------------------------------- |
| Experiência sem atrito (*frictionless*) | Com ou sem atrito (desafio)                       | Sempre sem atrito (não há desafio) |
| Latência na transação                   | Maior                                             | Menor ou nenhuma                   |
| Responsabilidade em caso de chargeback  | Bandeira ou emissor, se autenticada com sucesso\* | Loja                               |
| Influência na aprovação do emissor      | Sim                                               | Sim                                |
| Ciclo de autenticação                   | Sim                                               | Não                                |

*\*É importante verificar o valor do[ECI](https://docs.cielo.com.br/ecommerce-cielo/docs/tabela-de-eci) para garantir se a transação foi autenticada ou não.*

<br />

## De quem é a responsabilidade em caso de chargeback?

Em transações Data Only, a loja é responsável em caso de [chargeback](https://docs.cielo.com.br/ecommerce-cielo/docs/prevencao#chargebacks).

> ℹ️
>
> É possível usar Antifraude nas transações de Autenticação 3DS com Data Only.