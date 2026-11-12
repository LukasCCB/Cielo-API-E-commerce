---
updatedAt: 2026-10-08T17:22:55.000Z
agentTools:
  siteIndex: https://docs.cielo.com.br/llms.txt
  projectIndex: https://docs.cielo.com.br/ecommerce-cielo/llms.txt
---

# O que é tokenização no Cartão Protegido?

Armazene cartões de crédito de forma tokenizada e segura no cofre Cielo

A **tokenização** é um serviço que permite o **armazenamento seguro** de dados sensíveis de cartão de crédito (com exceção do CVV), relacionando essas informações a um token (série de caracteres que representa aquele cartão).

Desta forma, a loja pode usar o token nas próximas compras ao invés de solicitar que o comprador digite novamente todas as informações de pagamento, oferecendo melhor experiência para seu cliente e melhor conversão.

O objetivo da tokenização no cofre Cielo é armazenar os dados de cartões com segurança em ambiente com a certificação <a href="https://www.pcisecuritystandards.org/standards/pci-dss/" target="_blank">PCI DSS</a>, fornecendo melhor experiência para o comprador e garantindo maior conversão de vendas.

***

### Quais são os benefícios da tokenização de cartões?

A tokenização permite o armazenamento seguro de dados sensíveis de cartão de crédito em ambiente em conformidade com as normas do <a href="https://www.pcisecuritystandards.org/standards/pci-dss/" target="_blank">PCI DSS</a>.

* **Maior taxa de conversão pela melhor experiência do comprador**: uma vez que a loja tem o cartão salvo (de forma tokenizada), é possível realizar vendas sem que o comprador precise informar novamente os dados do cartão (como recorrência, compra com um clique e recuperação de carrinhos);
* **Maior taxa de conversão pela confiabilidade da transação**: quando a tokenização é combinada com o uso do [Card On File](https://docs.cielo.com.br/ecommerce-cielo/docs/card-on-file)  (indicador para cartões armazenados), os emissores identificam que a transação se refere a um cartão armazenado, aumentando a confiabilidade da transação e a taxa de aprovação;
* **Mais segurança nas transações**: o uso do cartão tokenizado **evita o tráfego dos dados reais** do cartão de crédito **entre a loja e a Cielo**, minimizando riscos de exposição indevida de dados sensíveis e evitando vazamentos;
* **Ambiente seguro PCI DSS**: a Cielo conta com ambiente certificado <a href="https://www.pcisecuritystandards.org/standards/pci-dss/" target="_blank">PCI DSS</a>, que assegura a integridade e segurança de dados sensíveis como os de cartões de crédito;
* **Redução do escopo PCI DSS**: as lojas que trafegam os dados de cartões tokenizados reduzem o escopo para obter a certificação <a href="https://www.pcisecuritystandards.org/standards/pci-dss/" target="_blank">PCI DSS</a>.

***

### Casos de uso

* **Compra recorrente**: permite armazenar os dados de cartão de crédito e processar as transações recorrentes através de tokens de pagamento;
* **Compra com um clique**: permite armazenar os dados de um cartão de crédito, com a permissão do titular do cartão, para realizar um pagamento online usando o cartão salvo e pulando a etapa de preenchimento dos dados para pagamento ou até mesmo todo o processo do carrinho de compras;
* **Recuperação de carrinho**: permite que estabelecimentos possam entrar novamente em contato com clientes que eventualmente tenham tido problemas na compra, oferecendo uma nova tentativa de cobrança, sem a necessidade de o comprador informar os dados do cartão novamente.

### Boas práticas para a tokenização de cartões

* **Não crie tokens para cartões inválidos**: sempre valide o cartão no Zero Auth antes de tokenizar o cartão;
* **Não crie token para o cartão** se o retorno do Zero Auth for uma [recusa com código irreversível](https://docs.cielo.com.br/ecommerce-cielo/page/abecs)**;**
* Somente armazene cartões quando tiver o **consentimento do portador**;
* Não tokenize cartões que estejam vinculados a qualquer tipo de **fraude** confirmada: ao receber uma notificação de chargeback por fraude, exclua o `CardToken` relacionado à fraude da base de cartões;
* Ao usar um `CardToken`, informe os parâmetros do `CardOnFile` para reforçar que é uma transação com cartão armazenado e melhorar as chances de aprovação.

<Callout icon="ℹ️" theme="info">
  - O **Zero Auth** é uma ferramenta da Cielo que permite verificar se um cartão está válido para realizar uma compra antes que o pedido seja finalizado. [Saiba mais em Zero Auth](https://docs.cielo.com.br/ecommerce-cielo/docs/zero-auth);
  - O **Card on File** é um indicador de que a transação está usando dados de cartão armazenados e pode contribuir para o aumento da conversão. [Saiba mais em CardOnFile](https://docs.cielo.com.br/ecommerce-cielo/docs/card-on-file).
</Callout>

<Callout icon="⚠️" theme="warn">
  ### **Recomendamos atualizar os cartões no cofre quando:**

  * O cartão recebe <a href="https://docs.cielo.com.br/ecommerce-cielo/page/abecs" target="_blank">negativa irreversível da bandeira</a>;
  * O cartão estiver inválido;
  * O cartão estiver relacionado à uma fraude confirmada.
</Callout>

<Callout icon="ℹ️" theme="info">
  Empresas com mais de um estabelecimento (MID) também podem [compartilhar o mesmo cofre entre os estabelecimentos](https://docs.cielo.com.br/ecommerce-cielo/docs/cielo-vault#compartilhamento-de-cofre-entre-estabelecimentos).
</Callout>