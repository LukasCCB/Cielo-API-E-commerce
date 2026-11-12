---
updatedAt: 2025-10-30T01:05:42.000Z
agentTools:
  siteIndex: https://docs.cielo.com.br/llms.txt
  projectIndex: https://docs.cielo.com.br/ecommerce-cielo/llms.txt
---

# Tokenização externa

Crie pagamentos usando tokens de bandeira existentes

> ℹ️ Vá para <a href="https://docs.cielo.com.br/ecommerce-cielo/reference/token-bandeira-externo" target="_blank">Criar pagamento com token da bandeira via integração externa</a> para ver o exemplo de requisição à API E-commerce usando token de bandeira externo.

A Cielo está preparada para usar tokens de bandeira criados por outros serviços. Nessa situação, a loja precisa informar alguns parâmetros específicos na <a href="https://docs.cielo.com.br/ecommerce-cielo/reference/token-bandeira-externo" target="_blank">requisição de autorização</a>:

* Em `Payment.CreditCard.Holder`, informar o nome do comprador;
* Em `Payment.CreditCard.CardNumber`, informar o DPAN;
* Em `Payment.CreditCard.Cryptogram`, informar o criptograma gerado pela bandeira;
* Em `Payment.CreditCard.ExpirationDate`, informar a data de expiração do token gerado pela bandeira.

Confira a seguir o exemplo de fluxo de criação da transação usando token de bandeira criado fora da Cielo:

<Image align="center" src="https://files.readme.io/1ebd8a27dc8eb81a3eb2b308816d361e5e35e187f5b2ed86e5cb1db9cd48036f-tokenizacao-externa.png" />

<br />

1. O comprador escolhe comprar com um clique, usando o cartão salvo previamente pela loja;
2. A loja solicita autorização para a API E-commerce Cielo, informando o DPAN do cartão e o criptograma;
3. A API E-commerce Cielo solicita autorização da bandeira e emissor;
4. A bandeira e o emissor retornam a resposta da autorização para a API E-commerce Cielo;
5. A API E-commerce Cielo retorna a resposta da autorização para a loja;
6. A loja confirma o pagamento para o comprador.

<br />

> ℹ️
>
> Vá para <a href="https://docs.cielo.com.br/ecommerce-cielo/reference/token-bandeira-externo" target="_blank">Criar pagamento com token da bandeira via integração externa</a> para ver o exemplo de requisição à API E-commerce usando token de bandeira externo.

<br />

> ℹ️ **Se a loja não possui certificação<a href="https://www.pcisecuritystandards.org/standards/pci-dss/" target="_blank">PCI DSS</a>, é possível usar o serviço Silent Order Post, que evita o tráfego dos dados de cartão pelo servidor da loja e gera um `PaymentToken` temporário. Saiba mais em [Silent Order Post](https://docs.cielo.com.br/ecommerce-cielo/docs/sop) .**