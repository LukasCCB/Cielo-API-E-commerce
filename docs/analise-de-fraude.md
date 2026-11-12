---
updatedAt: 2025-10-30T01:06:22.000Z
agentTools:
  siteIndex: https://docs.cielo.com.br/llms.txt
  projectIndex: https://docs.cielo.com.br/ecommerce-cielo/llms.txt
---

# Pagamentos com análise de fraude

A **API E-commerce Cielo** oferece integração com o Antifraude (solução Braspag) para análise de risco de fraudes em transações online. Na contratação do Antifraude, é possível selecionar um dos providers disponíveis (**CyberSource** e **ClearSale**), que realizam uma validação dos dados transacionais e do histórico de compras do portador do cartão. Essa análise retorna fatores de risco e permite que a loja decida se irá prosseguir com a venda.

> O Antifraude (solução Braspag) está disponível mediante contratação adicional. <a href="https://www.cielo.com.br/e-commerce/" target="_blank">Saiba mais na página de soluções do e-commerce Cielo</a>.

> ⚠️
>
> A análise de fraude oferecida pela Cielo avalia o risco de uma transação, mas não vincula o resultado da análise com a cobertura de chargebacks. A Cielo não realiza transações garantidas.

> ℹ️ A análise de fraude está disponível apenas para transações de cartão de crédito.

## Fluxos da análise de fraude

| Tipo de Integração                                     | Descrição                                                                                                                                                                                                                                                                                                                                       | Parâmetros necessários                                                                                                                 |
| ------------------------------------------------------ | ----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- | -------------------------------------------------------------------------------------------------------------------------------------- |
| Análise antes da autorização                           | Antes da transação ser enviada para a autorização, o Antifraude avalia se ela tem alto risco ou não. Dessa forma, evita-se o envio de transações arriscadas para autorização                                                                                                                                                                    | `FraudAnalysis.Sequence` igual a *AnalyseFirst*                                                                                        |
| Análise após a autorização                             | Antes da transação ser enviada para o Antifraude, a mesma será enviada para a autorização                                                                                                                                                                                                                                                       | `FraudAnalysis.Sequence` igual a *AuthorizeFirst*                                                                                      |
| Análise de risco somente se a transação for autorizada | O Antifraude será acionado apenas para analisar transações com o staus *autorizada*. Dessa forma evita-se o custo com análises de transações que não seriam autorizadas                                                                                                                                                                         | `FraudAnalysis.SequenceCriteria` igual a *OnSuccess*                                                                                   |
| Análise de risco em qualquer hipótese                  | Independente do status da transação após a autorização, o AntiFraude analisará o risco                                                                                                                                                                                                                                                          | `FraudAnalysis.Sequence` igual a *AuthorizeFirst* e `FraudAnalysis.SequenceCriteria` como *Always*                                     |
| Autorização em qualquer hipótese                       | Independente do score de fraude da transação, ela sempre será enviada para a autorização                                                                                                                                                                                                                                                        | `FraudAnalysis.Sequence` como *AnalyseFirst* e `FraudAnalysis.SequenceCriteria` como *Always*                                          |
| Capturar apenas se uma transação for segura            | Após a análise de fraude, captura automaticamente uma transação já autorizada se definido baixo risco. Este mesmo parâmetro serve para você que irá trabalhar com revisão manual, que após a Cielo receber a notificação do novo status e for igual a aceita, a transação será capturada automaticamente                                        | `FraudAnalysis.Sequence` igual a *AuthorizeFirst*, `FraudAnalysis.CaptureOnLowRisk` igual a *true* e `Payment.Capture` igual a *false* |
| Cancelar uma transação comprometida                    | Caso a análise de fraude retorne um alto risco para uma transação já autorizada ou capturada, ela será imediamente cancelada ou estornada. Este mesmo parâmetro serve para você que irá trabalhar com revisão manual, que após a Cielo receber a notificação do novo status e for igual a rejeitada, a transação será cancelada automaticamente | `FraudAnalysis.Sequence` como *AuthorizeFirst* , `FraudAnalysis.VoidOnHighRisk` igual a *true* e `Payment.Capture` igual a *false*     |

<br />

## Implementando a análise Cybersource

Para que a análise de fraude via Cybersource seja efetuada durante uma transação de cartão de crédito, é necessário complementar o contrato de autorização com os nós `FraudAnalysis`, `Cart`, `MerchantDefinedFields` e `Travel` (este somente para venda de passagens aéreas).

Durante implantação do Cybersource, informações adicionais podem ser armazenadas através de MDDs (Merchand Defined Data), que são campos numerados de 0 a N, usados para armazenar informações exclusivas da loja (merchant). Saiba mais em <a href="https://docs.cielo.com.br/gateway/reference/tabela-de-mdds" target="_blank">Tabela de MDDs</a>.

### Fingerprint com a Cybersource

O Fingerprint é a identificação digital do dispositivo do comprador. Essa identificação é composta por uma série de dados coletados na página de checkout do site ou aplicativo. Na requisição de análise de fraude com a Cybersource, o valor do parâmetro `Payment.FraudAnalysis.Browser.BrowserFingerprint` será o `ProviderIdentifier` gerado pela loja.

Para configurar o Fingerprint com a Cybersource, consulte o manual de <a href="https://docs.cielo.com.br/risco/docs/fingerprint-cybersource" target="_blank">Gestão de Risco</a>.

## Implementando a análise ClearSale

Na requisição de análise de fraude com a ClearSale, envie o campo `Payment.FraudAnalysis.Provider` como "ClearSale".

### Fingerprint com a ClearSale

O Fingerprint é a identificação digital do dispositivo do comprador. Essa identificação é composta por uma série de dados coletados na página de checkout do site ou aplicativo.

Na integração da API E-commerce Cielo com análise de fraude ClearSale, o valor do `session_id` deve ser enviado no parâmetro `Payment.FraudAnalysis.Browser.BrowserFingerprint`.

Para configurar o Fingerprint com a ClearSale, consulte o manual de <a href="https://docs.cielo.com.br/risco/docs/fingerprint-clearsale" target="_blank">Gestão de Risco</a>.

> ℹ️ Como integrar a análise de fraude
>
> A análise de fraude pela API E-commerce Cielo é um serviço oferecido mediante contratação. É possível realizar a análise de fraude por meio de um dos provedores de Antifraude disponíveis.
>
> Confira detalhes na Referência da API:
>
> * Crie um pagamento com <a href="https://docs.cielo.com.br/ecommerce-cielo/reference/af-clearsale" target="_blank">análise de fraude na **ClearSale**</a>;
> * Crie um pagamento com <a href="https://docs.cielo.com.br/ecommerce-cielo/reference/af-cybersource" target="\_blank">análise de fraude na **Cybersource**</a>.