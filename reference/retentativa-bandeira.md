---
updatedAt: 2026-10-15T19:42:51.000Z
agentTools:
  siteIndex: https://docs.cielo.com.br/llms.txt
  projectIndex: https://docs.cielo.com.br/ecommerce-cielo/llms.txt
---

# Programa de Retentativa das Bandeiras

**O que são retentativas?**

Quando uma pessoa tenta fazer uma compra com cartão na sua loja, a transação pode ser negada devido a uma série de fatores. As **tentativas seguintes de concluir a transação usando o mesmo cartão** é o que chamamos de **retentativa**.

> **Importante**: As transações de compra com cartão (presente e não presente) e <a href="https://docs.cielo.com.br/ecommerce-cielo/docs/zero-auth" target="_blank">Zero Auth</a> (validação do cartão) estão sujeitas às regras das bandeiras para retentativas.

**O que mudou?**

Cada bandeira de cartão define os valores que serão cobrados por retentativa. A quantidade de vezes que uma transação pode ser retentada antes da cobrança também varia de acordo com a bandeira.

**E no e-commerce?**

As bandeiras de cartão definem regras diferentes para transações com cartão presente e não presente, como no caso das vendas feitas pela internet.

**Qual o impacto para a loja?**

Os e-commerces que não seguirem as regras serão penalizados com a cobrança de tarifas por transações excedidas, de acordo com o programa de cada bandeira.

Visando melhorar a experiência de compra, o mercado de meios de pagamento, em conjunto com a ABECS, promoveu a padronização nos códigos de respostas das transações recusadas feitas por cartão. As tentativas foram classificadas em dois tipos:

<Callout icon="❌" theme="default">
  ### **Irreversível: nunca realizar retentativa**

  Significa, por exemplo, que o cartão está cancelado para uso, foi perdido ou roubado, há uma fraude confirmada ou a transação não é permitida para aquele produto, indicando que não há circunstâncias nas quais o emissor concederia uma aprovação. Qualquer tentativa de autorização que, após uma recusa **irreversível**, não tenha alterado nenhum campo da mensageria, não obterá sucesso.

  ✅ **Reversível: permitido realizar retentativa**

  Significa que o emissor pode aprovar a transação, mas não pode fazê-lo agora, possivelmente devido a um problema do sistema (inoperante) ou falta de limite, suspeita de fraude ou excesso de número de tentativas de digitação da senha. São decisões de recusas temporárias tomadas pelo emissor que podem mudar com o tempo.
</Callout>

As bandeiras Visa, Mastercard e Elo ajustaram suas regras para limitar a quantidade de tentativas de autorização para uma transação negada. Essas mudanças preveem a cobrança de tarifas para o excesso de tentativas. Confira a seguir as regras de cada bandeira.

* [Mastercard](https://docs.cielo.com.br/ecommerce-cielo/reference/retentativa-bandeira#mastercard);
* [Visa](https://docs.cielo.com.br/ecommerce-cielo/reference/retentativa-bandeira#visa);
* [Elo](https://docs.cielo.com.br/ecommerce-cielo/reference/retentativa-bandeira#elo);
* [Demais bandeiras](https://docs.cielo.com.br/ecommerce-cielo/reference/retentativa-bandeira#demais-bandeiras).

# Mastercard

A bandeira Mastercard possui o programa Transaction Processing Excellence (TPE), que engloba duas categorias:

**1. Excessive Attempts**: monitora as retentativas de transações negadas nos ambientes de cartão presente e cartão não presente. Válido tanto para códigos de negadas reversíveis quanto irreversíveis.

**2. Merchant Advice Code Transaction Excellence (MAC)**: monitora as retentativas de transações negadas, nos ambientes de cartão não presente e que são irreversíveis. Há cobrança nos MACs 03 e 21 e, desde 29/06/2026, também nos MACs 24 a 30.

## 1. Excessive Attempts

São cobranças efetuadas quando o estabelecimento comercial excede as regras de retentativas de transações.

A bandeira também realiza o monitoramento para qualquer autorização de valor nominal, aprovada, com estorno subsequente para transações abaixo de 1 unidade de moeda inteira ou o equivalente a US$ 1.

O monitoramento é aplicado para as retentativas de transações de compras negadas e aprovadas, realizadas em ambiente de cartão presente e cartão não presente.

**Tabela Excessive Attempts**

| Categorias                            | Códigos                                                                                                                                         | Vigência                          | Tarifa Doméstica | Tarifa Internacional | Quando Ocorre            | Permitido Retentar         |
| ------------------------------------- | ----------------------------------------------------------------------------------------------------------------------------------------------- | --------------------------------- | ---------------- | -------------------- | ------------------------ | -------------------------- |
| Cartão presente e cartão não presente | Qualquer código de negativa que não está atribuído ao MAC 03 e 21. E também os códigos MAC caso não respeite os limites do “Excessive Attempts" | Até 31/01/2023                    | R$ 2,00          | -                    | A partir 11ª retentativa | Permitido retentar em 24h. |
| Cartão presente e cartão não presente | Qualquer código de negativa que não está atribuído ao MAC 03 e 21. E também os códigos MAC caso não respeite os limites do “Excessive Attempts" | Nova regra a partir de 01/02/2023 | R$ 2,00          | -                    | A partir 8ª retentativa  | Permitido retentar em 24h. |

* Serão consideradas como retentativas todas as transações de pagamento no mesmo cartão, e mesmo número de estabelecimento;
* A Mastercard prorrogou a data de vigência para o dia **01/02/2023** referente as novas regras do programa **(Excessive Attempts)** antes prevista para início do dia 01/11/2022. Confira as mudanças:

1. O excesso considerado no programa ocorrerá a partir da oitava retentativa dentro do mês de apuração; os valores cobrados sofreram alteração.
2. E a Mastercard também está introduzindo um limite de 35 tentativas negadas no mesmo cartão e mesmo número de estabelecimento por período contínuo de 30 dias. Mesmo se a loja não ultrapassar o limite de sete retentativas no período de 24h, mas ultrapassar a quantidade do limite mensal, a cobrança será aplicada.

> **Observação**: A regra vigente do programa Excessive Attempts é válida até 31/01/2023 (tabela Excessive Attempts), permitindo apenas 10 tentativas de aprovar uma mesma transação (no mesmo cartão, e mesmo número de estabelecimento), e é permitido retentar após 24 horas.

## 2. Merchant Advice Code Transaction Excellence (MAC)

São cobranças efetuadas quando o estabelecimento comercial realiza retentativa de envio de autorização para códigos de respostas irreversíveis com um mesmo cartão valido para cartão não presente.

Dentro desse programa de retentativas, há programas que se destinam especificamente ao cenário de **“Não tente esta transação novamente”**. Para esses casos, a Mastercard identifica as transações com os valores MAC 03 e MAC 21, por exemplo.

O programa MAC comporta alguns valores. Os **MACs 03 e 21 têm uma cobrança específica**, descrita em **Programa de retentativas MAC 03 e MAC 21**. Desde 29/06/2026, os **MACs 24 a 30 também têm uma cobrança específica**, descrita em **Programa de retentativas MAC 24 a 30**. Os demais MACs (01, 02, 04, 40 e 41) não se enquadram nessas cobranças.

Os outros códigos MAC (01, 02, 04, 40 e 41) não entram nos programas de cobrança do MAC, mas entram na cobrança do programa Excessive Attempts, caso exceda os limites.

Desde **14/10/2022** a Mastercard introduziu novos códigos MAC (24, 25, 26, 27, 28, 29 e 30) quando um emissor recusa uma transação com o código de resposta 51 (insuficiência de fundos) seguido de um dos MAC da tabela a seguir, para que o comerciante tome a melhor ação.

#### **Tabela com toda relação de MACs**

| MAC  | Descrição                                                | Observação                                                                                                                                                                            |
| :--- | :------------------------------------------------------- | :------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------ |
| 01   | Informações da nova conta disponíveis (ABU)              | Necessidade de realizar atualização dos dados da conta que está sendo utilizada na transação, usando o ABU, por exemplo.                                                              |
| 02   | Não pode aprovar no momento, tente depois                | Tente novamente a transação após 72 horas ou tente a transação com um método de pagamento diferente. Válido para transações de cartão presente e cartão não presente.                 |
| 03   | Não é permitido retentar                                 | Busque outro meio de garantir o pagamento, evitando custos desnecessários de várias solicitações de autorização que continuarão a resultar em declínios.                              |
| 04   | Requisitos de token não atendidos para este token modelo | Há necessidade de revisar os requisitos de token, pois os requisitos não foram atendidos para este token modelo enviado na transação.                                                 |
| 06\* | Original aprovado                                        | Indica que a transação original já foi aprovada. Não retente.                                                                                                                         |
| 07\* | Original recusado                                        | A transação original foi negada. Pode ser retentada com novos dados (STAN/Timestamp).                                                                                                 |
| 08\* | Status desconhecido                                      | O status da transação original é incerto. Retente com cautela.                                                                                                                        |
| 21   | Plano cancelado                                          | Comprador realiza cancelamento de plano e mesmo após o cancelamento, estabelecimento continua enviando solicitação de autorização de compra.                                          |
| 24   | Tente novamente após 1 hora                              | Válido somente para o código de resposta 51 (insuficiência de fundos).                                                                                                                |
| 25   | Tente novamente após 24 horas                            | Válido somente para o código de resposta 51 (insuficiência de fundos).                                                                                                                |
| 26   | Tente novamente após 2 dias                              | Válido somente para o código de resposta 51 (insuficiência de fundos).                                                                                                                |
| 27   | Tente novamente após 4 dias                              | Válido somente para o código de resposta 51 (insuficiência de fundos).                                                                                                                |
| 28   | Tente novamente após 6 dias                              | Válido somente para o código de resposta 51 (insuficiência de fundos).                                                                                                                |
| 29   | Tente novamente após 8 dias                              | Válido somente para o código de resposta 51 (insuficiência de fundos).                                                                                                                |
| 30   | Tente novamente após 10 dias                             | Válido somente para o código de resposta 51 (insuficiência de fundos).                                                                                                                |
| 40   | Não é permitido retentar                                 | Cartão pré pago não recarregável para consumo.                                                                                                                                        |
| 41   | Não é permitido retentar                                 | Cartão virtual de uso único. Não armazenar o cartão. Se a transação for negada, recomenda-se orientar o consumidor a gerar um novo cartão virtual ou entrar em contato com o emissor. |
| 43   | -                                                        | Cartão virtual de uso múltiplo. Se a transação for negada, recomenda-se orientar o consumidor a gerar um novo cartão virtual ou entrar em contato com o emissor.                      |
| 45\* | Tente novamente com PIN                                  | Transação Maestro PIN-less foi negada, mas pode ser aprovada se for reenviada com a inserção do PIN.<br />Válido para transações de débito e pré-pago (Maestro).                      |
| 90\* | Decisão do Emissor                                       | Indica que a decisão da transação foi tomada pelo banco emissor.                                                                                                                      |
| 99\* | Decisão da Mastercard                                    | Indica que a decisão da transação foi tomada pela Mastercard (Stand-in).                                                                                                              |

> \*Os **códigos 06, 07, 08, 45, 90 e 99** entrarão em vigor em **10/11/2026** e devem ser considerados apenas a partir dessa data.

Além disso, alguns códigos de retorno deixarão de ser enviados:

* 04 (Cartão de Captura)
* 14 (Número de cartão inválido)
* 43 (Cartão Roubado)
* 54 (Cartão Expirado)
* 57 (Transação Não Permitida)
* 62 (Cartão Restrito)
* 63 (Violação de Segurança)

**Categorização de retornos Mastercard**

A Mastercard poderá consolidar alguns códigos de respostas dos emissores, que muitas vezes não indicam ao comerciante se pode ou não retentar, em três códigos de uso exclusivo Mastercard:

* **79** (Ciclo de vida);
* **82** (Política);
* **83** (Fraude/ Segurança).

Os códigos originais serão substituídos pelo Merchant Advice Code (MAC), que acompanharão os códigos 79, 82 e 83 para determinar se a transação pode ou não ser retentada.

**Por exemplo:**

|                                     Quando                                     |                                       Então                                      |             E o código de resposta            |
| :----------------------------------------------------------------------------: | :------------------------------------------------------------------------------: | :-------------------------------------------: |
| O emissor recusar a transação usando o código de resposta 54 (Cartão Expirado) | A Mastercard substituirá o código 54 para o código 79 (recusa por ciclo de vida) | Acompanha o devido Merchant Advice Code (MAC) |

**Programa de retentativas MAC 03 e MAC 21**

**Forma de apuração:**

* Serão consideradas as transações de cartão não presente;
* São consideradas como retentativas todas as transações de pagamento no mesmo cartão e mesmo número de estabelecimento;
* São contabilizadas as retentativas no programa MAC com os valores MAC 03 e MAC 21;
* Valido para qualquer código de resposta;
* O excesso contabilizado no programa ocorrerá a partir da 1ª retentativa dentro do mês de apuração;
* O contador é zerado após o período de 30 dias;
* As retentativas podem ser cobradas nos MACs 03/21 e no Excessive Attempts caso ultrapasse o limite de cada programa;
* Atualmente é aplicado o valor de tarifa de R$1,25 e esse valor será alterado a partir de 01 de janeiro de 2023, como listado a seguir.

**Tabela de valores:**

| Número de retentativa   | Regra                                                                                  |
| ----------------------- | -------------------------------------------------------------------------------------- |
| A partir 1ª retentativa | R$ 2,50 (dois reais e cinquenta centavos) por retentativa, a partir da 1ª retentativa. |

**Programa de retentativas MAC 24 a 30**

O programa Authorization Optimizer da Mastercard passou a abranger também as retentativas de pagamentos recorrentes recusados por motivos financeiros, como cobranças de mensalidades e assinaturas. Isso inclui os MACs 24, 25, 26, 27, 28, 29 e 30, que acompanham o código de resposta 51 (insuficiência de fundos). Os novos preços estão em vigor desde 29/06/2026.

**Tabela de valores:**

A tabela a seguir mostra o valor cobrado nas retentativas dos MACs 24 a 30:

| Parâmetro                   | Regra                                                       |
| --------------------------- | ----------------------------------------------------------- |
| Percentual aplicado         | 0,07% sobre o valor da autorização digital negada elegível. |
| Limite máximo por transação | R$ 0,40 por autorização digital negada elegível.            |

A cobrança é aplicada conforme os critérios definidos pela Mastercard e as condições comerciais e contratuais vigentes entre a Cielo e o estabelecimento comercial. Não é necessário fazer nenhuma alteração técnica ou operacional: o fluxo de venda, captura, autorização e acompanhamento das transações continua o mesmo.

# Visa

O programa de retentativas instituído pela bandeira Visa gera cobranças quando o estabelecimento comercial excede as regras de retentativas.

O objetivo é criar um equilíbrio no ecossistema de transações a fim de garantir que os credenciadores e estabelecimentos forneçam informações precisas sobre as retentativas e diminuam novas tentativas desnecessárias.

A bandeira exige que os emissores usem códigos de resposta corretos e não genéricos, para facilitar a identificação do motivo da recusa de uma transação.

A Visa divide esses códigos em reversíveis e irreversíveis, sendo válido tanto para transações com cartão presente e cartão não presente:

* **Códigos reversíveis**: são permitidas até 20\* tentativas de aprovar uma mesma transação (com mesmo cartão, transação, validade, valor e estabelecimento) no período de 30 dias. Após os 30 dias, a contar da primeira tentativa, qualquer retentativa será cobrada. Passado o período de 30 dias, o envio de uma retentativa da mesma transação, a cobrança já será aplicada.
* *A partir de 25/05/2025*.
* **Códigos irreversíveis**: é permitida apenas a 1ª tentativa de aprovar a transação (com mesmo cartão, transação, validade, valor e estabelecimento). Na segunda tentativa, a transação já será cobrada, independente do período em que for realizada.

<Callout icon="ℹ️" theme="info">
  ### Tarifas

  Ao ultrapassar os limites de tentativas estabelecidos pela bandeira, haverá uma cobrança de tarifa para cada transação excedente.

  - **Doméstico**: USD 0,10 + 13,83% de imposto;
  - **Estrangeiro**: USD 0,25 + 13,83% de imposto.

  _A cobrança de tarifas é aplicada desde abril de 2021_.
</Callout>

<br />

A Visa agrupou os códigos de retorno em quatro categorias:

* **Categoria 1: emissor nunca aprovará**

  Indica que o cartão foi cancelado ou nunca existiu ou que a negativa é resultado de uma restrição permanente ou condição de erro que impedirá uma aprovação futura.

* **Categoria 2: emissor não pode aprovar no momento**

  Indica que a negativa é resultado de uma condição temporária tal como risco de crédito, controles de velocidade do emissor ou outras restrições do cartão que podem permitir uma retentativa da transação ser aprovada. Em alguns casos, a negativa requer uma ação do portador ou emissor para remover a restrição antes que uma aprovação possa ser obtida.

* **Categoria 3: qualidade de dados**

  Quando um erro de dados é identificado pelo emissor essa transação é declinada como consequência. Os estabelecimentos devem revalidar dados de pagamentos antes de retentar. Estabelecimentos e credenciadores devem monitorar estes códigos de negativas devido a exposição potencial a fraudes.

  <Callout icon="⚠️" theme="warn">
    ### Atenção

    A categoria 3 tem, além dos limites considerados na categoria 2, um limite diferente que é cumulativo. Um estabelecimento pode realizar até 25.000 transações em um período de 30 dias (neste caso considerando apenas o número do estabelecimento e códigos de negadas). Se ultrapassar o limite, todas as transações recusadas por categoria 3 serão tarifadas.
  </Callout>

* **Categoria 4: códigos de respostas genéricos**

  A categoria 4 inclui todos os demais códigos de resposta de recusa que não estão nas categorias 1, 2 e 3, pois pode haver circunstâncias em que não haja valor de código de resposta para uma condição de recusa específica. Emissores podem usar outros valores de códigos de resposta definidos nas Especificações Técnicas VisaNet; no entanto, o uso deve permanecer mínimo.

Os emissores devem usar códigos de resposta que reflitam com mais precisão o motivo das recusas. Ou seja, focar nas categorias 1 (o emissor nunca aprovar), 2 (o emissor não pode aprovar neste momento) e 3 (qualidade dos dados) e evitar usar a 4 (código de resposta genérico). Os emissores devem limitar dessa categoria ao máximo. A taxa da Categoria 4 é cobrada para garantir que não mais do que a porcentagem aprovada regionalmente do total de recusas do emissor sejam categorizadas como Categoria 4. Os emissores que excederem o limite definido regionalmente receberão a Taxa de Código de Resposta Genérica por base de transação para cada declínio em excesso do limite definido.

**Tabela com as regras e códigos de recusa**:

As regras da tabela a seguir são válidas tanto para transações de compra, quanto para transações Zero Auth.

<Table align={["left","left","left","left"]}>
  <thead>
    <tr>
      <th>
        **Categoria**
      </th>

      <th>
        **Tipo**
      </th>

      <th>
        **Códigos**
      </th>

      <th>
        **Regras**
      </th>
    </tr>
  </thead>

  <tbody>
    <tr>
      <td>
        **Categoria 1** **Emissor não aprovará novas tentativas**
      </td>

      <td>
        **Irreversível**
      </td>

      <td>
        04 - Reter cartão<br />07 - Reter cartão, condições especiais<br />12\* - Transação inválida <br />  14\*\* - Número de conta inválido<br />15\* - Emissor não existe<br />41 -Reter cartão (cartão perdido)<br />43 - Reter cartão (cartão roubado)<br />46 - Conta encerrada<br />57 - Transação não permitida ao portador de cartão<br />R0 - Parar ordem de pagamento<br />R1 - Revogação do pedido de autorização<br />R3 - Revogação de todos os pedidos de autorização
      </td>

      <td>
        Cobrança de tarifa a partir da 2ª tentativa.
      </td>
    </tr>

    <tr>
      <td>
        **Categoria 2**<br />**Emissor não aprovará no momento; novas tentativas são permitidas**
      </td>

      <td>
        **Reversível**
      </td>

      <td>
        03 - Comerciante inválido<br />19 - Redigitar a transação<br />39\*\*\* - Sem conta de crédito<br />51 - Insuficiência de fundos<br />52\*\*\* - Sem conta corrente<br />53\*\*\* - Sem conta poupança<br />59 - Suspeita de fraude<br />61 - Excede os limites de valor de retiradas<br />62 - Cartão restrito (cartão inválido na região ou país)<br />65 - Excede a frequência de retiradas<br />75 - Excedeu o número permitido de tentativas de digitação de senha<br />78 - Bloqueado, usado pela primeira vez ou condição especial (a conta está temporariamente bloqueada)<br />83\*\*\*\*\* - Fraude/Segurança<br />86 - Mal funcionamento no caixa eletrônico<br />91 - Emissor ou switch inoperante<br />93 - A transação não pode ser concluída (violação da lei)<br />96 - Mal funcionamento do sistema<br />N3 - Serviço de saque indisponível<br />N4 - Solicitação de dinheiro excede o limite do emissor<br />Z5\*\*\*\* - Conta válida, mas valor não suportado

        - _5C_ - Transação não suportada/bloqueada pelo emissor
        - _9G_- Bloqueado pelo portador do cartão (contate o portador do cartão).
      </td>

      <td>
        Cobrança de tarifa a partir da 21ª tentativa: o estabelecimento pode retentar a mesma transação 20 vezes.<br />A partir da  21ª tentativa (com mesmo cartão, transação, validade, valor e estabelecimento) num período de 30 dias corridos a partir da 1ª tentativa, a transação será tarifada. Passado o período de 30 dias, a Visa não permite nenhuma nova tentativa. Então, caso haja envio de uma tentativa dessa mesma transação, a cobrança já será aplicada para essa retentativa enviada (daí, a regra de 20 tentativas deixa de ser válida, passado a ser válido o período de 30 dias corridos).
      </td>
    </tr>

    <tr>
      <td>
        - _Categoria 3_\* Qualidade de dados
      </td>

      <td>
        **Reversível**
      </td>

      <td>
        14\*\* - Número de conta inválido<br />54 - Cartão vencido<br />55 - Senha incorreta<br />70 - Dados de PIN necessários (somente na região da Europa)<br />82 - Os resultados de CAM,2 dCVV,3 iCVV4 ou CVV on-line foram negativos<br />1A - Autenticação de cliente adicional necessária (somente na região da Europa)<br />6P - Falha na verificação (a identificação do titular do cartão não corresponde aos registros do emissor)<br />N7 - Recusa decorrente de falha do CVV2 (Visa)
      </td>

      <td>
        Cobrança de tarifa a partir da 21ª tentativa: o estabelecimento pode retentar a mesma transação 20 vezes.<br />A partir da  21ª tentativa (com mesmo cartão, transação, validade, valor e estabelecimento) num período de 30 dias corridos a partir da 1ª tentativa, a transação será tarifada. Passado o período de 30 dias, a Visa não permite nenhuma nova tentativa. Então, caso haja envio de uma tentativa dessa mesma transação, a cobrança já será aplicada para essa retentativa enviada (daí, a regra de 20 tentativas deixa de ser válida, passado a ser válido o período de 30 dias corridos).
      </td>
    </tr>

    <tr>
      <td>
        **Categoria 4**<br />**Códigos de respostas genéricos**
      </td>

      <td>
        **Reversível**
      </td>

      <td>
        Códigos de respostas genéricos não listados nas categorias 1,2,3
      </td>

      <td>
        Cobrança de tarifa a partir da 21ª tentativa: o estabelecimento pode retentar a mesma transação 20 vezes.<br />A partir da  21ª tentativa (com mesmo cartão, transação, validade, valor e estabelecimento) num período de 30 dias corridos a partir da 1ª tentativa, a transação será tarifada. Passado o período de 30 dias, a Visa não permite nenhuma nova tentativa. Então, caso haja envio de uma tentativa dessa mesma transação, a cobrança já será aplicada para essa retentativa enviada (daí, a regra de 20 tentativas deixa de ser válida, passado a ser válido o período de 30 dias corridos).
      </td>
    </tr>
  </tbody>
</Table>

* *Os códigos&#x20;****12****&#x20;e&#x20;****15****&#x20;estão sendo convertidos pela bandeira Visa para o código&#x20;****05***.

\*\* *O código&#x20;****14****&#x20; é considerado na categoria 1 e também na categoria 3*.

\*\*\* *Os códigos&#x20;****39, 52 e 53****&#x20;irão migrar da categoria 4 para a categoria 2*.

\*\*\*\* *O código&#x20;****Z5****&#x20;é um código novo e está na categoria 2*.

\*\*\*\*\* *O código 83 entrará em vigor em 17/07/2026 e está na categoria 2*.

<Callout icon="ℹ️" theme="info">
  ### Atualizações a partir de 25 de maio de 2025

  O **número de retentativas permitidas** pela Visa após a recusa de códigos das categorias **2, 3 e 4 aumentou**:

  - **Quantidade de retentativas atual:**_15 tentativas em 30 dias_
  - **Quantidade de retentativas a partir de 25 de maio de 2025**: _20 tentativas em 30 dias_.
</Callout>

> **Importante**:<br />Desde abril de 2023, o limite permitido da contagem total de recusas para a categoria 3 passou de 10.000 para 25.000 recusas em um ciclo de faturamento de 30 dias.

# Elo

As regras apresentadas a seguir entraram em vigor em janeiro de 2025.

O objetivo da mudança é garantir que os estabelecimentos e credenciadores diminuam novas tentativas de aprovações desnecessárias.

O período de apuração das transações ocorre mensalmente, sendo contabilizado do 1º ao último dia corrido do mês de violação.

**Confira os valores:**

| Cobrança                                              |
| ----------------------------------------------------- |
| R$0,80 (oitenta centavos) por cada tentativa excedida |

### Quais são as regras de cobrança?

A bandeira vai considerar códigos **reversíveis** e **irreversíveis** de acordo com grupos separados em três categorias. Abaixo estão as alterações que entrarão em vigência:

| Grupo   | Descrição                                                                                                                                                            | Cobrança                                                                                                                                                                          |
| ------- | -------------------------------------------------------------------------------------------------------------------------------------------------------------------- | --------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| Grupo 1 | Transações de cartão não presente negadas com **códigos irreversíveis**, considerando o mesmo número de cartão, mesmo CNPJ do estabelecimento e mesmo valor.         | A cobrança ocorre a partir da 2ª retentativa dentro do mês de apuração.                                                                                                           |
| Grupo 2 | Transações de cartão não presente negadas com **códigos reversíveis**.                                                                                               | A cobrança ocorre a partir da 16ª retentativa dentro do mês de apuração.                                                                                                          |
| Grupo 3 | Transações de cartão não presente negadas com características de Ataques de Força Bruta, considerando transações com o mesmo CNPJ Raiz do Estabelecimento Comercial. | Ocorre a partir de 10.001 transações negadas (dentro da categoria de códigos) e excedam 5% do total de recusas, a depender do volume de transações de pagamento do CNP envolvido. |

#### Classificação dos Grupos:

<Table align={["left","left","left","left"]}>
  <thead>
    <tr>
      <th>
        Grupo 1

        Emissor nunca aprovará

        IRREVERSÍVEL
      </th>

      <th>
        Grupo 2

        Emissor não pode aprovar no momento

        REVERSÍVEL 
      </th>

      <th>
        Grupo 3

        Qualidade de dados, revalidar informação (\*)
      </th>

      <th>
        Grupo 4

        Códigos de recusa
        genérico
      </th>
    </tr>
  </thead>

  <tbody>
    <tr>
      <td>
        57 - Transação
        não permitida
        para esse cartão
      </td>

      <td>
        51 – Limite/saldo insuficiente 
      </td>

      <td>
        14 - Número do
        cartão inválido
      </td>

      <td>
        05 - Genérica
      </td>
    </tr>

    <tr>
      <td>
        56 - Sem
        registro do cartão
      </td>

      <td>
        59 – Suspeita de fraude
      </td>

      <td>
        54 - Data de validade do
        Cartão
      </td>

      <td>

      </td>
    </tr>

    <tr>
      <td>
        58 - Comerciante Inválido
      </td>

      <td>
        04 - Refazer a transação
      </td>

      <td>
        55 - Senha Inválida
      </td>

      <td>

      </td>
    </tr>

    <tr>
      <td>
        46 - Conta encerrada
      </td>

      <td>
        06 - Consultar credenciador
      </td>

      <td>
        63 - Violação de Segurança
      </td>

      <td>

      </td>
    </tr>

    <tr>
      <td>
        FM - Utilizar o Chip
      </td>

      <td>
        38 - Compra | Excedidas senhas
      </td>

      <td>
        79 - Segurança/Fraude
      </td>

      <td>

      </td>
    </tr>

    <tr>
      <td>
        19- Problemas
        adquirente
      </td>

      <td>
        61 - Valor máximo
        saque/compras
        excedido
      </td>

      <td>
        82 - Cartão inválido (dados internos)
      </td>

      <td>

      </td>
    </tr>

    <tr>
      <td>
        12 - Erro no cartão
      </td>

      <td>
        62 - Bloqueio temporário de cobrança
      </td>

      <td>

      </td>

      <td>

      </td>
    </tr>

    <tr>
      <td>
        13- Valor transação inválido
      </td>

      <td>
        75 - Saque | Excedidas
        tentativas senha
      </td>

      <td>

      </td>

      <td>

      </td>
    </tr>

    <tr>
      <td>
        23 - Valor da Parcela Inválido
      </td>

      <td>
        78 - Cartão novo sem desbloqueio / cartão bloqueado
      </td>

      <td>

      </td>

      <td>

      </td>
    </tr>

    <tr>
      <td>
        41 - Cartão Perdido
      </td>

      <td>
        91 - Emissor fora do ar
      </td>

      <td>

      </td>

      <td>

      </td>
    </tr>

    <tr>
      <td>
        43 - Cartão Roubado
      </td>

      <td>
        96 – Falha de
        sistema
      </td>

      <td>

      </td>

      <td>

      </td>
    </tr>

    <tr>
      <td>
        64 - Valor mínimo da transação inválido
      </td>

      <td>
        AB/AC – Função
        incorreta (Déb/Cred)
      </td>

      <td>

      </td>

      <td>

      </td>
    </tr>

    <tr>
      <td>
        83 - Não é possível
        validar a senha
      </td>

      <td>
        P6 – Nova senha não
        aceita
      </td>

      <td>

      </td>

      <td>

      </td>
    </tr>

    <tr>
      <td>
        76 - Conta destino inválida ou inexistente
      </td>

      <td>
        5C\* - Transação não suportada ou bloqueada pelo emissor
      </td>

      <td>

      </td>

      <td>

      </td>
    </tr>

    <tr>
      <td>
        77 - Conta origem inválida ou inexistente
      </td>

      <td>

      </td>

      <td>

      </td>

      <td>

      </td>
    </tr>

    <tr>
      <td>
        P5 – Troca de
        senha / Falha no
        desbloqueio
      </td>

      <td>

      </td>

      <td>

      </td>

      <td>

      </td>
    </tr>
  </tbody>
</Table>

> \*O **código 5C** entrará em vigor em **23/10/2026** e deve ser considerado apenas a partir dessa data.

# Demais bandeiras

* **Códigos reversíveis:** serão permitidas novas retentativas para o mesmo cliente e cartão. Não há limite e período pré-estabelecido;

  > **Importante**: antes de realizar uma nova tentativa, siga a orientação recebida na resposta da transação negada.

* **Códigos Irreversíveis:** não serão permitidas autorizações para o mesmo cartão ou estabelecimento, depois de receber 1ª resposta de recusa do emissor.

<br />