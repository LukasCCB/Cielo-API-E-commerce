---
updatedAt: 2026-10-14T14:48:29.000Z
agentTools:
  siteIndex: https://docs.cielo.com.br/llms.txt
  projectIndex: https://docs.cielo.com.br/ecommerce-cielo/llms.txt
---

# Garantia de cancelamento

Evite a duplicidade de transações com a garantia do cancelamento de transações não finalizadas

Quando a loja cria uma transação, esta transação pode não ser autorizada de imediato e receber na resposta o status **Não finalizada** ([`Status` = 0  - Not Finished](https://docs.cielo.com.br/ecommerce-cielo/reference/payment-status)). Nesses casos, a API E-commerce Cielo realiza uma sondagem para verificar se houve alteração de status depois de 5 minutos. Durante esse tempo, existe a possibilidade de que a loja crie uma segunda transação para a mesma venda ao mesmo tempo em que a primeira transação pode ter sido aprovada. Com isso, ocorre uma duplicidade de transações para a mesma venda.

<Callout icon="✅" theme="okay">
  ### Com a **Garantia de Cancelamento Cielo**, a API E-commerce Cielo irá **cancelar automaticamente** todas as transações que retornaram o status **Não finalizada**, evitando duplicidades.
</Callout>

## Quem pode habilitar a Garantia de Cancelamento?

A Garantia de Cancelamento pode ser habilitada por qualquer loja integrada com a API E-commerce Cielo:

* É especialmente indicada para lojas que não têm o Post de Notificação (webhook) e seguradoras;
* É indicada para lojas cujo modelo de negócio não pode aguardar o tempo da sondagem (como delivery de comida ou transporte por aplicativo).

## Para quais meios de pagamento é válida?

A garantia de cancelamento é válida para transações de cartões de crédito e débito.

## Como funciona?

<Callout icon="ℹ️" theme="info">
  ### É necessário habilitar a funcionalidade junto ao Atendimento Cielo E-commerce;
</Callout>

Quando uma transação retornar com o status **Não finalizada**, se a Garantia de Cancelamento estiver habilitada para a loja, a API irá retornar também a propriedade `TryAutomaticCancellation` como verdadeira ("true").  Essa propriedade indicará que a transação foi cancelada pela API E-commerce Cielo.

Assim, a loja poderá submeter uma nova transação para a mesma venda imediatamente.

Veja no exemplo:

```json
{
      "TryAutomaticCancellation": true,
  }
```

| Parâmetro                | Descrição | Tipo    |
| ------------------------ | --------- | ------- |
| TryAutomaticCancellation | -         | Boolean |

### Sem Garantia de Cancelamento

Confira um exemplo de como funciona o ciclo sem a Garantia de Cancelamento:

<Image src="https://files.readme.io/b9df8e7b3a15351f87999fc20189d89a9864e6ea8d9b3d4d8e332763605097ed-3ds-novo-sem_garantia_de_cancelamento.drawio.png" alt="Fluxo de sem garantia de cancelamento" align="center" width="450px" />

**1.** O comprador escolhe pagar com cartão de crédito ou débito;<br />**2.** A loja solicita autorização a API E-commerce Cielo;<br />**3.** A API E-commerce Cielo retorna a resposta com o `Status` = 0 (Not Finished) para a loja;<br />**4.** A API E-commerce Cielo realiza a sondagem para verificar se houve alteração de status;<br />**5.** A API E-commerce Cielo envia para a loja a notificação via webhook informando que houve alteração de status;<br />**6.** A loja realiza a consulta da transação para verificar o novo status;<br />**7.** Se após a consulta da transação o novo `Status` for 3 (negada), e os códigos de retorno permitirem, a loja pode enviar a transação para autorização novamente;<br />**8.** A API E-commerce Cielo confirma o pagamento para a loja;<br />**9.** A loja confirma o pagamento ao comprador.

### Com Garantia de Cancelamento

Confira um exemplo de como funciona o ciclo com a Garantia de Cancelamento habilitada :

<Image src="https://files.readme.io/292dea84fee5bddd571d1ead276d276ab30510e0fdf728bc9f92a64976a73e07-3ds-novo-com_garantia_de_cancelamento.drawio_1.png" alt="Fluxo com garantia de cancelamento" align="center" width="450px" />

**1.** O comprador escolhe pagar com cartão de crédito ou débito;<br />**2.** A loja solicita <Glossary>autorização</Glossary> para a API E-commerce Cielo;<br />**3.** A API E-commerce Cielo retorna a resposta com o `Status` = 0 (Not Finished) para a loja;<br />**4.** A API E-commerce Cielo realiza a sondagem e se a transação foi paga, realiza o cancelamento;<br />**5.** A loja solicita autorização novamente para a API E-commerce Cielo. Essa transação será uma nova transação, com um novo `PaymentId` para a loja;<br />**6.** A API E-commerce Cielo confirma o pagamento para a loja;<br />**7.** A loja Confirma o pagamento ao comprador.

<Callout icon="⚠️" theme="warn">
  &#x20;Quando uma transação retornar com o status Não Finalizada e a funcionalidade **Garantia de Cancelamento** estiver habilitada para a loja, **não reutilize o mesmo valor de MerchantOrderID** em novas tentativas da transação.

  Para as tentativas subsequentes, **gere um novo identificador de pedido**. O reenvio de uma transação utilizando o mesmo `MerchantOrderID` da tentativa que retornou como **Não Finalizada** pode provocar erros de processamento.
</Callout>

<br />