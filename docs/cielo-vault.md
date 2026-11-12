---
updatedAt: 2026-10-08T17:12:22.000Z
agentTools:
  siteIndex: https://docs.cielo.com.br/llms.txt
  projectIndex: https://docs.cielo.com.br/ecommerce-cielo/llms.txt
---

# Como funciona o armazenamento no Cartão Protegido?

A API E-commerce Cielo gera um `CardToken` (identificador único no formato `6e1bf77a-b28b-4660-b14f-455e2a1c95e9`) que representa os dados do cartão de crédito. Os dados do cartão\* são armazenados com segurança pela Cielo, enquanto a loja armazena apenas o `CardToken`.

Para criar pagamentos online no futuro, a loja deverá informar o `CardToken` salvo - e não precisa solicitar novamente os dados do cartão à pessoa compradora.

> \*A Cielo não armazena o CVV do cartão de crédito.

### Fluxo de criação do `CardToken`

É possível criar e armazenar o `CardToken` antes ou durante a autorização. O exemplo a seguir contempla a criação do `CardToken`, sem uma transação associada.

**Criação do CardToken antes da autorização**

<Image src="https://files.readme.io/32581e1c652b18bc08729a85a3bf4217dea75212f9f57af2f66f2597c424c719-tokenizacao-cp-zeroauth.png" align="center" />

<br />

1. O comprador informa os dados do cartão (PAN) e permite que a loja armazene os dados do cartão (seja para compras recorrentes ou futuras compras com um clique);
2. A loja solicita validação do cartão no Zero Auth;
3. O Zero Auth retorna que o cartão é válido;
4. A loja solicita a tokenização do cartão para a API E-commerce Cielo;
5. A API E-commerce Cielo cria e armazena o `CardToken`;
6. A API E-commerce Cielo informa o token criado para o cartão no parâmetro `CardToken`;
7. A loja armazena o `CardToken`.

### Compartilhamento de cofre entre estabelecimentos

O compartilhamento de cofre permite que empresas com mais de um estabelecimento (MID) usem os mesmos cartões já armazenados no Cartão Protegido. Os `CardToken` criados no estabelecimento definido como origem ficam disponíveis para uso nos demais estabelecimentos que participam do compartilhamento.

#### Como funciona o compartilhamento de cofre

A empresa define qual estabelecimento será a origem do cofre compartilhado. Depois da configuração, todos os estabelecimentos selecionados passam a usar o cofre de cartões mantido pelo estabelecimento de origem.

A tabela a seguir mostra um exemplo com três estabelecimentos, antes e depois do compartilhamento, usando o Estabelecimento 1 como origem:

| Estabelecimento            | Cofre antes do compartilhamento | Cofre depois do compartilhamento |
| -------------------------- | ------------------------------- | -------------------------------- |
| Estabelecimento 1 (origem) | Cofre A                         | Cofre A                          |
| Estabelecimento 2          | Cofre B                         | Cofre A                          |
| Estabelecimento 3          | Cofre C                         | Cofre A                          |

Depois do compartilhamento, os três estabelecimentos usam um único cofre de cartões: o Cofre A.

#### Impactos do compartilhamento de cofre

Antes de solicitar o compartilhamento, considere os impactos a seguir:

* Cada estabelecimento pode ter apenas um cofre ativo;
* Os cofres dos estabelecimentos de destino são substituídos pelo cofre do estabelecimento de origem;
* Não é possível unificar ou mesclar cofres diferentes;
* Os cartões (`CardToken`) armazenados nos cofres substituídos deixam de estar disponíveis.

<Callout icon="⚠️" theme="warn">
  ### **Atenção**

  Avalie com cuidado qual estabelecimento será a origem do compartilhamento, pois os cartões dos cofres substituídos deixam de estar disponíveis.
</Callout>

#### Como solicitar o compartilhamento de cofre

Para solicitar o compartilhamento de cofre entre os seus estabelecimentos, entre em contato com a nossa equipe de atendimento pelo e-mail <cieloecommerce@cielo.com.br>.

> ℹ️ Confira na referência da API os exemplos de:
>
> * <a href="https://docs.cielo.com.br/ecommerce-cielo/reference/criar-cardtoken" target="_blank">Criação do `CardToken` antes da autorização</a>;
> * <a href="https://docs.cielo.com.br/ecommerce-cielo/reference/cardtoken-autorizacao" target="_blank">Criação do `CardToken` durante a autorização</a>;
> * <a href="https://docs.cielo.com.br/ecommerce-cielo/reference/cartao-tokenizado-api" target="_blank">Criação de pagamento com `CardToken` existente</a>.