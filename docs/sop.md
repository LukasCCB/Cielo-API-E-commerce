---
updatedAt: 2026-10-14T14:48:58.000Z
agentTools:
  siteIndex: https://docs.cielo.com.br/llms.txt
  projectIndex: https://docs.cielo.com.br/ecommerce-cielo/llms.txt
---

# Silent Order Post

O Silent Order Post (SOP) é um serviço que oferece mais segurança ao comprador e controle sobre a experiência do checkout; é ideal para a loja que não possui estrutura para cumprir todos os requisitos de segurança do <Glossary>PCI DSS</Glossary> no uso de cartões de crédito.

O Silent Order Post possibilita o envio de dados do pagamento do seu cliente de forma segura, diretamente em nosso sistema. Os dados do cartão do comprador, tais como número do cartão e data de validade, não trafegam pelo ambiente da loja e são armazenados de forma criptografada (token) no ambiente da Cielo, que conta com a certificação <a href="https://www.pcisecuritystandards.org/get_involved/participation/" target="_blank">PCI DSS</a>.

> ℹ️ O que é a certificação <a href="https://www.pcisecuritystandards.org/get_involved/participation/" target="_blank">PCI DSS</a>?
>
> É um padrão global de segurança de dados de cartões. O <a href="https://www.pcisecuritystandards.org/get_involved/participation/" target="_blank">**PCI DSS**</a> foi desenvolvido para incentivar e aprimorar a segurança de dados de pagamento e facilitar a ampla adoção de medidas consistentes de segurança de dados.\
> A certificação é obrigatória para que um e-commerce possa receber, tratar e armazenar dados de cartão.

## Principais benefícios

* **Coleta direta dos dados**: a coleta dos dados do pagamento é feita diretamente para os sistemas da API Cielo E-commerce por um script, através dos campos definidos no seu checkout;
* **Total compatibilidade**: a solução é compatível com todos os meios de pagamento disponibilizados na API Cielo E-commerce (nacionais e internacionais);
* **Certificação PCI DSS**: a certificação da API Cielo E-commerce garante total conformidade com as normas da indústria de cartões, reduzindo o escopo de <a href="https://www.pcisecuritystandards.org/get_involved/participation/" target="_blank">PCI DSS</a>;
* **Checkout personalizado**: a personalização oferece controle total sobre a experiência de checkout e elementos da sua marca.

## Meios de pagamento suportados

O Silent Order Post é capaz de criptografar cartões de crédito, débito, voucher e múltiplo, desde que atendam ao formato *mod10*.

## Como funciona

A loja integra o script do **Silent Order Post** na página de checkout (*client-side*). Quando o comprador insere os dados do cartão no checkout, esses dados passam diretamente para o ambiente da API Cielo E-commerce por meio do script instalado. A API gera um token temporário para o cartão do comprador, o `PaymentToken`, que deverá ser usado pela loja para solicitar a autorização da transação. Assim, os dados sensíveis de cartão não passam pelo ambiente do seu e-commerce.

<Image alt="Fluxo Silent Order Post" align="center" width="650px" src="https://files.readme.io/3afd0a8378c10207a3a39436323bdf3c70194fbda4cf57f7b914d7e09cfbbce3-sop-sop-pt.drawio.png" />

1. O comprador acessa a tela de checkout da loja;
2. O script da página de checkout solicita o `access_token` para o autenticador OAuth2;
3. O OAuth2 retorna o `access_token`;
4. O script da página de checkout solicita o `AccessToken` do Silent Order Post (`AccessToken` SOP), informando o `access_token` obtido na etapa anterior;
5. O Silent Order Post retorna o `AccessToken` SOP;
6. O comprador preenche os dados de pagamento na tela de checkout;
7. O script da página de checkout envia os dados do cartão para o Silent Order Post, informando o `AccessToken` SOP;
8. O Silent Order Post retorna o `PaymentToken` (cartão criptografado);
9. O script da página de checkout envia o `PaymentToken` para o servidor da loja, e o servidor envia a requisição de autorização da transação para a API Cielo E-commerce, informando o `PaymentToken`;
10. A API Cielo E-commerce retorna a resposta da autorização;
11. A loja confirma o pedido do comprador, se desejar.

> O Silent Order Post permite mais segurança, sem interferir no layout da sua página.

<br />

> ℹ️ Veja como <a href="https://docs.cielo.com.br/ecommerce-cielo/docs/como-habilitar-microsservi%C3%A7os#silent-order-post" target="_blank">habilitar o Silent Order Post</a>.