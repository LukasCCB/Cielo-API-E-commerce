---
updatedAt: 2026-10-14T14:47:10.000Z
agentTools:
  siteIndex: https://docs.cielo.com.br/llms.txt
  projectIndex: https://docs.cielo.com.br/ecommerce-cielo/llms.txt
---

# Programa de monitoria de chargebacks e fraudes das bandeiras

Cada bandeira define suas próprias regras para a aplicação de chargeback, conforme o motivo envolvido.

O programa de monitoria é o processo de acompanhamento realizado pelas bandeiras para identificar estabelecimentos que apresentam índices elevados de chargebacks e fraudes, tanto domésticos quanto internacionais.

As regras e métricas desse processo são definidas previamente pelas bandeiras. Com base nos resultados, elas geram relatórios para as credenciadoras (como a Cielo) que, então, notificam os estabelecimentos.

Se a sua loja receber uma notificação por apresentar índices elevados de fraudes e chargebacks, a Cielo oferecerá suporte na elaboração do plano de ação que será enviado à bandeira.

### Programa de Monitoria Visa para fraudes e chargebacks

<Image align="center" src="https://files.readme.io/36569dd75cee4139d5448c25b3268ecaa62252d0345504768bad9aee6b0dad3b-image.png" />

#### **Métricas**

A tabela a seguir apresenta as métricas aplicadas no programa de monitoria de fraudes e chargebacks Visa:

| Status         | Valor das fraudes | Valor de fraude / Valor de venda |
| -------------- | ----------------- | -------------------------------- |
| **Excessivo**  | US$ 2.500         | 1,50%                            |
| **Padrão**     | US$ 1.500         | 1,00%                            |
| **Preventivo** | US$ 750           | 0,50%                            |

***

#### **Critérios**

Os seguintes critérios são aplicados programa de monitoria de fraudes e chargebacks Visa:

* Cartão Presente (CP);
* Modo de entrada POS: 05 ou 07;
* Razões de Fraude: Declaração Enganosa do Comerciante (C) e/ou Manipulação do Titular da Conta (D);
* Contabilização dos volumes pelo *nome do estabelecimento*.

***

#### **Saída do Programa**

Para a saída do programa de monitoria, considere:

* Métricas inferiores ao Status Preventivo por **3 meses consecutivos**.

> MCCs alto risco: **5962, 5966, 5967, 7995, 5912, 5122, 7273, 4816, 5816, 6051 e 5993**.

***

#### **Regras de Status**

A tabela a seguir apresenta as regras de status:

| Status         | Regras                                                                                                                                                      |
| -------------- | ----------------------------------------------------------------------------------------------------------------------------------------------------------- |
| **Excessivo**  | Necessário plano de ação no 1º mês notificado. Multas aumentam **trimestralmente**, seguindo a sequência: **US$10 mil, US$25 mil, US$50 mil e US$75 mil**.  |
| **Padrão**     | Necessário plano de ação. Multas a partir do 5º mês, seguindo a sequência: **5º e 6º mês: US$25 mil; 7º a 9º mês: US$50 mil; acima do 10º mês: US$75 mil**. |
| **Preventivo** | Não é necessário plano de ação e não há multas (notificação apenas para alerta).                                                                            |

Se o estabelecimento for classificado como Excessivo ou Alto Risco uma vez, será considerado sempre nesse status até a saída do programa de monitoria.

Durante o período classificado como status Excessivo ou Padrão (a partir do 5º mês), estará sujeito ao aceite de chargebacks do código 10.5. Essa medida permite ao emissor recuperar os valores referentes às fraudes classificadas nas razões C e D.

***

### Programa de monitoria Mastercard para fraudes

<Image align="center" src="https://files.readme.io/b2fbbffdbf72c99e916056f2795b56e58a2643fef2152cb58cb15c223c3e97cd-image.png" />

> ℹ️ A Mastercard considera o **número do estabelecimento** para fins de apuração.

#### Métricas

A tabela a seguir apresenta as métricas aplicadas no programa de monitoria de fraudes da Mastercard:

| Transações e-commerce (quantidade) | Valor de chargeback de fraude (US$) | Qtd chargeback / Qtd vendas do mês anterior (%) | Utilização de 3DS (Data Only)                                                                                                                          |
| ---------------------------------- | ----------------------------------- | ----------------------------------------------- | ------------------------------------------------------------------------------------------------------------------------------------------------------ |
| 1.000+                             | US$ 50.000,00+                      | 0,50%                                           | Se o estabelecimento processar **menos de 10%** das transações com **3DS ou Data Only** e atender às outras condições do programa, ele será reportado. |

#### Definições

A seguir, as definições do programa de monitoria de fraudes da Mastercard:

* **Razões de chargeback considerados:**
  * 4837 (transação sem autorização da pessoa portadora);
  * 4863 (portador não reconhece – potencial de fraude).
* **Saída do programa:** ocorre após três meses consecutivos abaixo da métrica;
* **Contagem por parcelas:** Além das métricas por *status* e *índice*, a Mastercard considera também a **contagem dos volumes por parcelas**.
* **Suspensão:** se o plano de ação for aprovado, o estabelecimento recebe uma suspensão temporária de até **seis meses**. Para evitar penalidades retroativas, é necessário sair do programa de monitoria durante o período de suspensão.

#### Penalidades

A tabela a seguir apresenta as multas aplicáveis conforme o tempo acima do limite:

| Meses acima do limite | Multa         |
| --------------------- | ------------- |
| 1                     | —             |
| 2                     | R$ 2.586,14   |
| 3                     | R$ 5.172,28   |
| 4 a 6                 | R$ 25.861,38  |
| 7 a 11                | R$ 129.306,88 |
| 12 a 18               | R$ 258.613,75 |
| Acima de 18           | R$ 517.227,50 |

> ⚠️ Atenção
>
> Caso o estabelecimento seja listado nos programas de **fraude** e **chargeback**, será aplicada apenas a multa referente ao programa de fraude. A partir do **12º mês listado**, aplica-se a multa de **maior valor** entre os dois programas.

### Programa de Monitoria Mastercard para chargebacks

<Image align="center" src="https://files.readme.io/b2fbbffdbf72c99e916056f2795b56e58a2643fef2152cb58cb15c223c3e97cd-image.png" />

> ℹ️ A Mastercard considera o **número de estabelecimento** para fins de apuração.

#### **Definições**

A seguir, as definições do programa de monitoria de chargebacks da Mastercard:

* **Transações liquidadas**: Mínimo de **25 transações liquidadas** no mês anterior;
* **Contagem por parcelas**: Além das métricas por *status* e *índice*, a Mastercard considera também a **contagem dos volumes por parcelas**;
* **Saída do Programa:** ocorre após três meses consecutivos abaixo do status ECM;
* **Suspensão:** se o plano de ação for aprovado, o estabelecimento recebe uma suspensão temporária de até **seis meses**. Para evitar penalidades retroativas, é necessário sair do programa durante o período de suspensão.

> ⚠️ Atenção
>
> Caso o estabelecimento seja listado nos programas de **fraude** e **chargeback**, será aplicada apenas a multa referente ao programa de fraude. A partir do **12º mês listado**, aplica-se a multa de **maior valor** entre os dois programas.

***

#### Métricas

A tabela a seguir apresenta as métricas aplicadas no programa de monitoria de chargebacks da Mastercard:

| Status                    | Quantidade de Chargebacks | Qtde de Chargeback / Qtde de Vendas (mês anterior) |
| ------------------------- | ------------------------- | -------------------------------------------------- |
| **Excessivo (ECM)**       | 100                       | 1,50%                                              |
| **Alto Excessivo (HECM)** | 300                       | 3,00%                                              |

***

#### Penalidades

#### ECM – Meses acima do limite

A tabela a seguir apresenta as multas aplicáveis conforme o ECM:

| Meses acima do limite | Valor (R$)    |
| --------------------- | ------------- |
| **1**                 | -             |
| **2 a 3**             | R$ 5.172,28   |
| **4 a 6**             | R$ 25.861,38  |
| **7 a 11**            | R$ 129.306,88 |
| **12 a 18**           | R$ 258.613,75 |
| **Acima de 18**       | R$ 517.227,50 |

#### HECM – Meses acima do limite

A tabela a seguir apresenta as multas aplicáveis conforme o HECM:

| Meses acima do limite | Valor (R$)             |
| --------------------- | ---------------------- |
| **1**                 | -                      |
| **2**                 | R$ 5.172,28            |
| **3**                 | R$ 10.345,55           |
| **4 a 6**             | R$ 51.722,75 + IR\*    |
| **7 a 11**            | R$ 258.613,75 + IR\*   |
| **12 a 18**           | R$ 517.227,5 + IR\*    |
| **Acima de 18**       | R$ 1.034.455,00 + IR\* |

#### **IR* (Taxa do Emissor)*\*

**R$ 25,86 por chargeback**, cobrado a partir de 300 chargebacks. A cobrança inclui uma multa proporcional à frequência.

**Exemplo:**\
Um estabelecimento com 500 chargebacks:

* 500 – 300 = 200
* 200 × R$ 25,86 = **R$ 5.172,00 (IR)**

***

### Programa de Monitoria Elo para fraudes

<Image align="center" src="https://files.readme.io/f38bf98bb8124218364c87f40560c3132d9fa590710f54d1d6919b65b3b54a69-image.png" />

#### **Métricas**

A tabela a seguir apresenta as métricas aplicadas no programa de monitoria de fraudes da Elo:

| Critério de Apuração                | CP / CNP            | Valor de Fraude (R$) | Status    | Valor de fraudes reportadas no mês / Valor total das transações autorizadas do mês |
| ----------------------------------- | ------------------- | -------------------- | --------- | ---------------------------------------------------------------------------------- |
| **Estabelecimento Cielo**           | Cartão Presente     | R$ 100k              | Excessivo | 0,60%                                                                              |
| **Estabelecimento Cielo**           | Cartão Não Presente | R$ 240k              | Excessivo | 1,00%                                                                              |
| **Subcredenciador**                 | Cartão Presente     | R$ 500k              | Excessivo | 3,00%                                                                              |
| **Subcredenciador**                 | Cartão Não Presente | R$ 500k              | Excessivo | 0,90%                                                                              |
| **Estabelecimento Subcredenciador** | Cartão Presente     | R$ 100k              | Excessivo | 0,60%                                                                              |
| **Estabelecimento Subcredenciador** | Cartão Não Presente | R$ 100k              | Excessivo | 3,00%                                                                              |

***

#### Definições

A seguir, as definições do programa de monitoria de fraudes da Elo:

* **Consideração dos volumes**:  é feita por **CNPJ/CPF**;
* **Saída do programa**:  ocorre após três meses consecutivos abaixo da métrica;
* **Suspensão**: suspensão temporária, de até **3 meses**, conforme aprovação da bandeira e plano de ação enviado pelo estabelecimento comercial;
* **Plano de ação**: o estabelecimento que não enviar o plano de ação **dentro do prazo** estará sujeito à penalidade financeira prevista pela bandeira;

<Callout icon="⚠️" theme="warn">
  O estabelecimento notificado pelos dois programas (fraude e chargeback) será multado **somente no programa de excesso de fraude**. Caso saia desse programa e permaneça no de chargeback, será multado no de programa de chargeback.
</Callout>

> As novas regras do programa de fraude da Elo foram atualizadas em **janeiro de 2025**.

***

#### Penalidades

A tabela a seguir apresenta as penalidades aplicadas no programa de monitoria de fraudes da Elo:

| Período                 | Subcredenciador                                                                                 | Estabelecimento Comercial |
| ----------------------- | ----------------------------------------------------------------------------------------------- | ------------------------- |
| **1º mês**              | R$ –                                                                                            | R$ –                      |
| **2 a 3 meses**         | R$ 50.000,00                                                                                    | R$ 25.000,00              |
| **4 a 6 meses**         | R$ 100.000,00                                                                                   | R$ 150.000,00             |
| **7 a 9 meses**         | R$ 200.000,00                                                                                   | R$ 250.000,00             |
| **10 a 12 meses**       | R$ 400.000,00                                                                                   | R$ 400.000,00             |
| **A partir do 13º mês** | A penalidade será equivalente a **2x** o valor aplicado no mês anterior e assim sucessivamente. | –                         |

*As penalidades para estabelecimento comercial seguem o critério de apuração por credenciador e estabelecimentos da carteira do subcredenciador.*

***

### Programa de Monitoria Elo para chargebacks

<Image align="center" src="https://files.readme.io/f38bf98bb8124218364c87f40560c3132d9fa590710f54d1d6919b65b3b54a69-image.png" />

#### Métricas

A tabela a seguir apresenta as métricas aplicadas no programa de monitoria de chargebacks da Elo:

| Tipo de reporte | Qtd de vendas liquidadas igual ou maior do que (mês anterior) | Qtde de chargeback (mês atual) | Qtde de chargeback (mês atual) / Qtde de transações liquidadas (mês anterior) |
| --------------- | ------------------------------------------------------------- | ------------------------------ | ----------------------------------------------------------------------------- |
| CNPJ / CPF      | 1.000                                                         | 100                            | 1,49%                                                                         |

***

#### Definições

A seguir, as definições do programa de monitoria de chargebacks da Elo:

* **Saída do programa**: ocorre após dois meses consecutivos abaixo da métrica;
* **Suspensão**:  a suspensão é temporária, com duração de até **3 meses**, dependendo da aprovação da bandeira e da análise do plano de ação enviado pelo estabelecimento;
* **Plano de ação**: o estabelecimento que não enviar o plano de ação **dentro do prazo estabelecido** estará sujeito à penalidade financeira prevista pela bandeira;

<Callout icon="⚠️" theme="warn">
  O estabelecimento reportado nos dois programas (fraudes e chargebacks) será multado **apenas no de fraude**. Caso saia do programa de fraude e permaneça no de chargebacks, será multado no programa de chargebacks.
</Callout>

> As regras do programa foram atualizadas em **janeiro de 2025**.

***

#### Penalidades

A tabela a seguir apresenta as multas aplicadas no programa de monitoria de chargebacks da Elo:

| Período              | Multa (R$)                         |
| -------------------- | ---------------------------------- |
| **1º mês**           | –                                  |
| **2º mês em diante** | R$ 100,00 por chargeback excessivo |

> **Chargeback excessivo:** Volume que ultrapassou o limite permitido para atingir o índice.

#### Exemplo

O estabelecimento registrou noventa chargebacks no mês reportado e realizou mil vendas no mês anterior. Com isso, apresentou setenta e cinco chargebacks acima do limite permitido.

**Cálculo**: 90 (chargebacks) − 1.000 (vendas) × 1,49% (índice da bandeira) = 75.

Assim, receberia R$ 7.510,00 de multa por chargeback excessivo.

***

### QMAP

#### Sobre o programa

O QMAP permite que o emissor recupere parcial ou totalmente perdas por fraude quando não houver recuperação durante o período em que as transações fraudulentas ocorreram no estabelecimento.

A Mastercard realiza um conjunto de critérios específicos para o Brasil, com foco em estabelecimentos comerciais menores com altos índices de fraude do **código 56 (manipulação do titular do cartão)**.

#### Fluxo do programa

A Mastercard notifica a adquirente sobre o comerciante que atende aos critérios QMAP. A notificação é enviada por e-mail para o time de segurança da adquirente.

Dentro do prazo de quinze dias corridos a partir da data da notificação, o credenciador pode contestar a notificação, enviando informações adicionais para a Mastercard.

> ℹ️ Importante
>
> * A atividade de transação (on‑us) não é considerada no QMAP (transações realizadas dentro do mesmo sistema ou rede do banco emissor);
>
> * Se um emissor tiver motivos para acreditar que um comerciante é um comerciante questionável, poderá notificar a Mastercard para iniciar uma investigação, mediante o pagamento de uma taxa de US$ 500,00 por cada indicação QMAP.

> O programa entrou em vigor em abril de 2024.

#### Critérios de apuração

* **Período de escopo do caso**: período de 120 dias corridos anteriores à data em que a Mastercard inicia a investigação;
* **Período de auditoria do caso**:  varia de seis a oito meses para conclusão;
* Transações com cartão presente (modo de entrada POS 05 ou 07);
* Transações CNP (modos de entrada POS 10 e 81) totalmente autenticadas via 3DS;
* No mínimo cem mil em transações fraudulentas do código 56 (dentro do período de escopo do caso), reportadas pela adquirente;
* o estabelecimento apresenta percentual de fraude igual ou superior a 75% em relação às vendas, considerando as fraudes informadas sob o tipo de fraude 56 (manipulação do titular do cartão).

#### Penalidades

As penalidades e multas referentes ao QMAP são:

| Penalidades                      | Multas                                               |
| -------------------------------- | ---------------------------------------------------- |
| **Taxa de auditoria Mastercard** | US$ 2.500,00                                         |
| **Consulta MATCH Mastercard**    | US$ 5.000,00                                         |
| **Reporte MATCH Mastercard**     | US$ 5.000,00                                         |
| **Valor da recuperação**         | Variável, conforme o valor da transação identificada |

> Estabelecimentos que não comprovarem a consulta e o reporte na ferramenta MATCH Mastercard estarão sujeitos a penalidades.

<br />