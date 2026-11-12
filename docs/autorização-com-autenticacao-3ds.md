---
updatedAt: 2025-10-30T01:02:17.000Z
agentTools:
  siteIndex: https://docs.cielo.com.br/llms.txt
  projectIndex: https://docs.cielo.com.br/ecommerce-cielo/llms.txt
---

# Como funciona a autorização com autenticação via 3DS?

O processo de autorização de cartão autenticada via 3DS ocorre em duas etapas:

1. **Etapa de autenticação**: por meio do protocolo 3DS, a bandeira ou o emissor autentica que o comprador é de fato o titular do cartão. O protocolo é integrado ao e-commerce por meio de um script em JavaScript, que retorna o resultado da autenticação e **alguns parâmetros** que devem ser enviados na autorização. Saiba mais em [Integração do script](https://docs.cielo.com.br/ecommerce-cielo/docs/script-autenticacao);
2. **Etapa de autorização**: a loja submete a transação para autorização, informando os parâmetros retornados pelo script na etapa de autenticação. Saiba mais em [Autorização com Autenticação](https://docs.cielo.com.br/ecommerce-cielo/docs/autorizacao-autenticacao).

O fluxo a seguir descreve as etapas de autenticação em alto nível:

<Image alt="fluxo das etapas de autenticação em alto nível" align="center" src="https://files.readme.io/3af97b5-fluxo-3ds-novo-pt.png" />

**1.** O comprador escolhe pagar com cartão de crédito ou débito;\
**2.** A loja executa um script, solicitando à Cielo <Glossary>autenticação</Glossary> através da solução 3DS;\
**3.** A loja envia requisição com dados do comprador para a bandeira;\
**4.** A bandeira envia a requisição para avaliação de risco do emissor;\
**5.** O emissor avalia as informações e determina se fluxo será **[com ou sem desafio](https://docs.cielo.com.br/ecommerce-cielo/docs/autoriza%C3%A7%C3%A3o-com-autenticacao-3ds#fluxo-com-desafio-x-fluxo-sem-desafio)** ao portador;\
**5.1.** Se o emissor solicitar desafio, cria e envia a URL para a loja;\
**5.2.** A loja apresenta lightbox do <Glossary>desafio</Glossary> na página de checkout para obter resposta do comprador;\
**5.3.** O comprador responde o desafio, completando a autenticação;\
**6.** O emissor envia o resultado da autenticação para o 3DS Server;\
**7.** O 3DS Server envia resultado da autenticação. A loja decide seguir ou não para <Glossary>autorização</Glossary>.

> A loja pode optar por submeter uma transação não autenticada para autorização; no entanto, nesse caso, a loja será responsável pelo risco se houver chargeback.

## Fluxo com desafio x fluxo sem desafio

* **Com desafio (challenge)**: o emissor exige que o comprador passe por uma validação adicional, que pode ser por SMS, token, reconhecimento facial ou biometria;
* **Sem desafio (frictionless):** o emissor entende que as informações analisadas são suficientes para identificar e autenticar o titular do cartão ou negar a autenticação.