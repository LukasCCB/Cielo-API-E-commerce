---
updatedAt: 2026-10-14T14:48:44.000Z
agentTools:
  siteIndex: https://docs.cielo.com.br/llms.txt
  projectIndex: https://docs.cielo.com.br/ecommerce-cielo/llms.txt
---

# Click to Pay

> ℹ️
>
> Vá para a <a href="https://docs.cielo.com.br/ecommerce-cielo/reference/pagamento-click-to-pay" target="_blank">Referência da API para acessar os exemplos completos de requisição e resposta</a>.

O **Click to Pay** é um sistema regulado pelo padrão internacional <a href="https://www.emvco.com" target="_blank">Secure Remote Commerce EMVco®</a> que permite a **compra com um clique**. A API E-commerce Cielo está preparada para receber transações online que tenham a marcação de Click to Pay.

## Como funciona o Click to Pay?

A loja precisa se integrar a um provedor Secure Remote Commerce Initiator (SRCi) de sua escolha. Com isso, o Click to Pay poderá ser exibido como um meio de pagamento disponível na página de checkout da loja. Para que o consumidor possa realizar a compra usando o Click to Pay, é necessário que tenha o seu cartão cadastrado no Click to Pay.

> O **SRC Initiator (SRCi)** é um prestador de serviços de tecnologia, homologado e certificado pelas bandeiras, que faz a interface entre o sistema do Click to Pay e o estabelecimento, buscando as informações de pagamento necessárias para o e-commerce autorizar e processar uma transação.

## Onde os dados do cartão são armazenados?

São armazenados pelo sistema do Click to Pay.

## Para quais cartões e bandeiras o Click to Pay está disponível?

A Cielo aceita a marcação de Click to Pay para cartões de crédito das bandeiras Mastercard e Visa.

## Orientações para a loja

1. Integre a um provedor de SRCi da sua escolha;
2. Para criar uma transação via Click to Pay na API E-commerce Cielo, recomendamos enviar o marcador de transação Click to Pay (`Payment.Wallet.Type` como "ClickToPay"). Confira na Referência da API o <a href="https://docs.cielo.com.br/ecommerce-cielo/reference/pagamento-click-to-pay" target="_blank">exemplo de uma transação de Click to Pay com e sem o envio de `Cavv`</a>.

## Orientações para quem está comprando

Antes de usar o Click to Pay, o comprador (pessoa portadora do cartão) precisa fazer um cadastro no sistema do Click to Pay. O cadastro (opt-in) é feito no site da bandeira do cartão (Mastercard ou Visa), do banco emissor ou durante a finalização da compra no checkout da loja que fornece essa forma de pagamento. A chave principal de associação é o e‑mail do portador.

## Benefícios

* **Aumento de conversão:** reduz a fricção e promove agilidade para finalização das compras, reduzindo o abandono de carrinho;
* **Aumento da taxa de autorização:** alia a <Glossary>tokenização</Glossary> à <Glossary>autenticação</Glossary> do portador e promove aumento das taxas de autorização;
* **Experiência do cliente:** não há necessidade de digitar os dados do cartão, promovendo mais agilidade na compra;
* **Mais segurança:** reduz o risco de fraude e estornos porque verifica a identidade do comprador por meio de um dispositivo reconhecido ou de uma senha de uso único (OTP).

> ℹ️
>
> A Cielo oferece o **Click to Pay** embarcado nos serviços <a href="https://www.cielo.com.br/link-de-pagamento/" target="_blank">Link de Pagamento</a> e <a href="https://www.cielo.com.br/checkout" target="_blank">Checkout</a>.