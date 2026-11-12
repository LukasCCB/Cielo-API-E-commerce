---
updatedAt: 2026-10-20T18:39:31.000Z
agentTools:
  siteIndex: https://docs.cielo.com.br/llms.txt
  projectIndex: https://docs.cielo.com.br/ecommerce-cielo/llms.txt
---

# Como melhorar a performance de aprovação das suas transações

Saiba como e quando usar cada funcionalidade da API E-commerce para aumentar sua taxa de aprovação

A combinação apropriada de parâmetros e produtos podem melhorar a taxa de aprovação das suas transações. Por exemplo, antes de salvar um cartão tokenizado, é possível validar o cartão pelo Zero Auth e apenas armazenar o cartão se estiver válido.

Confira a seguir alguns cenários com a indicação de informações que podem ser enviadas para auxiliar na aprovação junto aos emissores.

### Cenário: validação de cartão

A validação do cartão no Zero Auth é o primeiro passo antes do armazenamento do cartão ou do envio da transação.

1. Envie o código de segurança do cartão (CVV) no parâmetro `Payment.CreditCard.SecurityCode`: emissores e bandeiras recomendam o envio do campo para assertividade na validação dos dados do cartão;
2. Envie o parâmetro `Payment.CreditCard.CardOnFile.Usage` como "First" (se for a primeira vez que armazena o cartão);
3. Realize o tratamento dos códigos de retorno – armazene o cartão (tokenizado) apenas se o retorno da validação for “0 - aprovada”.

### Cenário: onboarding/armazenamento do cartão

Antes de salvar um cartão para uma compra futura do portador (compra com um clique ou envio de recorrências, por exemplo), a validação do cartão é recomendada.

1. Valide o cartão pelo Zero Auth, conforme cenário validação de cartão;
2. Se a validação foi positiva, salve o cartão para compras futuras ou recorrência.

### Cenário: transação iniciada pelo portador

Quando a transação é iniciada pelo portador do cartão e o cartão ainda não está armazenado.

1. Envie o código de segurança do cartão (CVV) no parâmetro `Payment.CreditCard.SecurityCode`;

> Se o cartão for armazenado a partir dessa primeira transação e a bandeira for Mastercard, é necessário enviar o [Indicador de Início da Transação Mastercard](https://docs.cielo.com.br/ecommerce-cielo/page/indicador-de-in%C3%ADcio-da-transa%C3%A7%C3%A3o-cit-e-mit)

### Cenário: transação recorrente iniciada pelo portador com armazenamento do cartão

Nesse cenário o portador está realizando uma compra de produto ou serviço recorrente (com cobrança periódica) e o cartão ainda não foi armazenado.

1. Valide o cartão utilizando o Zero Auth – antes do armazenamento do cartão, conforme cenário de **validação do cartão**;
2. Envie o parâmetro `Payment.Recurrent` como "true";
3. Envie o parâmetro `CardOnFile.Usage` como "First";
4. Envie o parâmetro `IssuerTransactionId` a partir da 2ª transação recorrente, pois o envio é obrigatório. Na Mastercard, envie também o `TransactionLinkId`. Os dois são retornados pelas bandeiras na transação CIT e vinculam as cobranças recorrentes. Saiba mais em [Identificadores de bandeira](https://docs.cielo.com.br/ecommerce-cielo/docs/identificadores-de-bandeira).

### Cenário: transação não recorrente iniciada pelo portador com cartão previamente armazenado

Nesse cenário o portador está iniciando a transação usando um cartão previamente salvo na loja, como a compra com um clique.

1. Envie o parâmetro `Payment.Recurrent` como "false";
2. Envie o parâmetro `CardOnFile.Usage` como "Used";
3. Envie o código de segurança do cartão (CVV) no parâmetro `Payment.CreditCard.SecurityCode`.

### Cenário: transação não recorrente iniciada pela loja

Nesse cenário entende-se que o cartão já está armazenado com a validação pelo Zero Auth.

1. Envie o parâmetro `Payment.Recurrent` como "false";
2. Envie o parâmetro `CardOnFile.Usage` como "Used".

O cartão deve ser excluído da base caso o emissor retorne um código irreversível.

### Cenário: transação recorrente iniciada pela loja

Nesse cenário entende-se que o cartão já está armazenado com a validação pelo Zero Auth.

1. Envie o parâmetro `Payment.Recurrent` como "true";
2. Envie o parâmetro `CardOnFile.Usage` como "Used";
3. Envie o parâmetro `IssuerTransactionId` a partir da 2ª transação recorrente, pois o envio é obrigatório. Na Mastercard, envie também o `TransactionLinkId`. Os dois são retornados pelas bandeiras na transação CIT e vinculam as cobranças recorrentes. Saiba mais em [Identificadores de bandeira](https://docs.cielo.com.br/ecommerce-cielo/docs/identificadores-de-bandeira).

O cartão deve ser excluído da base caso o emissor retorne um código irreversível.

### Cenário: transação recorrente iniciada pela loja com cartão armazenado não utilizado ou sem validação

Nesse cenário trata-se a primeira transação iniciada pela loja com cartão previamente armazenado (base antiga, por exemplo).

1. Valide o cartão pelo Zero Auth, conforme cenário validação de cartão;
2. Envie o parâmetro `Payment.Recurrent` como "true";
3. Envie o parâmetro `CardOnFile.Usage` como "Used".

O cartão deve ser excluído da base caso a validação pelo Zero Auth retorne um código irreversível.

### Cenário: transação não recorrente, iniciada pelo portador, com armazenamento de cartão não utilizado ou sem validação

Nesse caso trata-se a primeira transação iniciada pelo portador com cartão previamente armazenado (base antiga, por exemplo).

1. Valide o cartão pelo Zero Auth antes de armazenar o cartão, conforme cenário validação de cartão;
2. Envie o parâmetro `Payment.Recurrent` como "false";
3. Envie o parâmetro `CardOnFile.Usage` como "Used";
4. Envie o código de segurança do cartão (CVV) no parâmetro `Payment.CreditCard.SecurityCode`.

O cartão deve ser excluído da base caso a validação pelo Zero Auth retorne um código irreversível.