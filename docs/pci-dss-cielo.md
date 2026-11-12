---
updatedAt: 2026-10-14T14:47:08.000Z
agentTools:
  siteIndex: https://docs.cielo.com.br/llms.txt
  projectIndex: https://docs.cielo.com.br/ecommerce-cielo/llms.txt
---

# PCI DSS

O PCI DSS é uma certificação de segurança internacional que garante que empresas que processam, armazenam e transmitem dados sensíveis de cartões mantenham esses dados seguros.

O PCI tem como objetivo:

* Manter a segurança e a integridade do sistema de pagamento
* Incentivar a adoção de tecnologias seguras e práticas de aceitação;
* Proteger informações pessoais dos portadores de cartões;
* Reduzir riscos de fraude e vazamento de dados.

Os estabelecimentos são divididos em níveis (ou tiers) que variam em exigências para a certificação:

| Nível                                               | Critério                                                                                         |
| --------------------------------------------------- | ------------------------------------------------------------------------------------------------ |
| Nível 1                                             | Acima de 6 milhões de transações anuais, ou Merchant que sofreu vazamento de dados.              |
| Nível 2                                             | Entre 1 milhão e 6 milhões de transações anuais.                                                 |
| Nível 3                                             | Entre 20.000 a 999.999 transações anuais.                                                        |
| Nível 4                                             | Menos de 20.000 transações anuais.                                                               |
| TPA - Nível 1 (Provedores de Serviços de Pagamento) | Armazena, processa e/ou transmite 300.000 ou mais contas/transações por ano.                     |
| TPA - Nível 2 (Provedores de Serviços de Pagamento) | Armazena, processa e/ou transmite menos de 300.000 contas/transações por ano.                    |
| TIP                                                 | Estabelecimentos que processam vendas de cartão presente com mais de 75% de transações via CHIP. |

Cada estabelecimento deve realizar o envio das certificações atualizadas anualmente, sujeito a penalidades por falta de certificações.

#### Requisitos

O PCI DSS tem 12 requisitos:

1. Instalar e manter uma configuração de firewall para proteger os dados do titular do cartão;
2. Não usar padrões de fornecedores para senhas do sistema e outros parâmetros de segurança;
3. Proteger os os armazenados do titular do cartão;
4. Criptografar a transmissão de dados do titular do cartão através de redes públicas;
5. Proteger todos os sistemas e atualizar o software antivírus;
6. Desenvolver e manter sistemas e aplicativos seguros;
7. Restringir o acesso aos dados do titular do cartão por empresas que precisam dessas informações;
8. Identificar e autenticar o acesso a componentes do sistema;
9. Restringir o acesso físico aos dados do titular do cartão;
10. Rastrear e monitorar todo o acesso a recursos de rede e dados do titular do cartão;
11. Testar frequentemente sistemas e processos de segurança;
12. Manter uma política que aborde segurança da informação para todos os funcionários.

#### Penalidades

As penalidades pelo não envio de certificação se aplicam apenas aos níveis 1, 2 e TPA (Provedores de Serviços de Pagamento). Os níveis 3, 4 e TIP não são passíveis a multa. Veja os valores:

| Nível   | Multa      |
| ------- | ---------- |
| Nível 1 | US$ 5.000  |
| Nível 2 | US$ 2.500  |
| TPA     | US$ 10.000 |

Após 24 meses no programa, as multas aumentam:

| Nível   | Multa      |
| ------- | ---------- |
| Nível 1 | US$ 10.000 |
| Nível 2 | US$ 5.000  |

<Callout icon="ℹ️" theme="info">
  Os valores são cobrados mensalmente até que o estabelecimento volte a se adequar ao programa.
</Callout>