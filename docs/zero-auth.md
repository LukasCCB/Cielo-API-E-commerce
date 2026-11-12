---
updatedAt: 2026-08-10T17:11:54.000Z
agentTools:
  siteIndex: https://docs.cielo.com.br/llms.txt
  projectIndex: https://docs.cielo.com.br/ecommerce-cielo/llms.txt
---

# Zero Auth

Verifica se o cartão está válido para autorização.

<Callout icon="ℹ️" theme="info">
  Vá para a <a href="https://docs.cielo.com.br/ecommerce-cielo/reference/validar-cartao" target="\_blank">Referência da API para acessar os exemplos completos de requisição e resposta</a>.
</Callout>

**O que é o Zero Auth?**

O Zero Auth é uma ferramenta da Cielo que permite verificar se um cartão está válido para realizar uma compra antes que o pedido seja finalizado. O Zero Auth simula uma autorização sem afetar o limite de crédito ou alertar o portador do cartão sobre o teste.

**Qual é o impacto do uso no meu negócio?**

* Melhor conversão, uma vez que a loja consegue criar pagamentos somente se o cartão estiver válido;
* Evitar a validação de cartões enviando transações com valor financeiro.

**Como usar o Zero Auth?**

1. Habilite o Zero Auth no [site Cielo](https://docs.cielo.com.br/ecommerce-cielo/docs/como-habilitar-microsservi%C3%A7os#zero-auth) ou com o Suporte E-commerce;
2. Envie a requisição do Zero Auth para validar o cartão.

<Callout icon="ℹ️" theme="info">
  ### Importante

  Caso a requisição retorne o erro **389 – Restrição Cadastral**, procure o gestor comercial para validar se o serviço está habilitado corretamente; se estiver, o retorno indica que essa tentativa não pode ser validada por critérios internos da Cielo, recomendamos tentar outro cartão para concluir a validação.
</Callout>

O **Zero Auth** é:

* Indicado para transações únicas e recorrentes;
* Essencial para anteceder o armazenamento de cartões em cofres seguros (tokenizar apenas cartões válidos).

**O que não fazer?**

* Na ocorrência de transações com valor *diferente de zero* e *inferior a um dólar*, seguidas do cancelamento da transação, as bandeiras aplicarão tarifas à Cielo, que serão repassadas aos estabelecimentos que estiverem em inconformidade. A bandeira Mastercard por exemplo, está cobrando uma tarifa no valor de R$ 0,21 centavos por transação;
* As transações Zero Auth também estão sujeitas as regras definidas nos programas de retentativas das bandeiras. O excesso de tentativas pode implicar em tarifas. Leia mais em <a href="https://docs.cielo.com.br/ecommerce-cielo/reference/retentativa-bandeira" target="_blank">Programa de Retentativa das Bandeiras</a>.

**Detalhes importantes**

* O Zero Auth não informa o limite disponível para o cartão validado e não apresenta as características do cartão ou do portador, apenas simula uma autorização com valor de zero reais;
* Para melhor desempenho, é importante informar o CVV.

> O **ZeroAuth** faz a validação de **cartões abertos ou tokenizados** (envio do `CardToken` criado na API Cielo E-commerce).

**Bandeiras suportadas**

O Zero Auth suporta as bandeiras **Visa, Master**, **Elo&#x20;**&#x65; **Diners\*** tanto para cartões de crédito quanto de débito.

Caso outras bandeiras sejam enviadas, haverá um erro com o retorno "**57-Bandeira inválida**".

> **\*** Disponível a partir de outubro de 2026.

<Callout icon="⚠️" theme="warn">
  ### Atenção:

  O serviço está sujeito a condições comerciais e poderá implicar custos adicionais.

  **Para ativação ou desativação do Zero Auth, entre em contato com a equipe de suporte da Cielo**.
</Callout>

**Integração**

Para realizar a consulta ao Zero Auth, a loja deverá enviar uma requisição `POST` para a API Cielo E-commerce, simulando uma transação.

A validação de um cartão aberto necessita de um contrato técnico diferente da validação de um cartão tokenizado ou de e-wallet. Confira os exemplos de requisição para <a href="https://docs.cielo.com.br/ecommerce-cielo/reference/validar-cartao" target="_blank">validar cartão Zero Auth</a>.