---
updatedAt: 2026-10-14T14:46:26.000Z
agentTools:
  siteIndex: https://docs.cielo.com.br/llms.txt
  projectIndex: https://docs.cielo.com.br/ecommerce-cielo/llms.txt
---

# Como começar a usar a API E-commerce Cielo

Veja como contratar e começar a usar a API E-commerce para vender online

## Contrate a API E-commerce

Informe o seu faturamento mensal e veja a melhor oferta de taxas para o seu negócio. A API E-commerce não cobra mensalidade e sua loja estará habilitada em até 5 dias úteis\*.

<Callout icon="🟢" theme="default">
  ### <a href="https://www.cielo.com.br/contrate-agora/?modality=API_ECOMMERCE" target="_blank">**Contratar agora**</a>
</Callout>

<Callout icon="🔵" theme="default">
  ### <a href="https://www.cielo.com.br/contrate-agora/?modality=API_ECOMMERCE" target="_blank"> **Contratar com especialista**</a>
</Callout>

<Callout icon="ℹ️" theme="info">
  ### EC Cielo

  Assim que a sua loja estiver habilitada para criar transações em ambiente de produção, você receberá um e-mail de boas-vindas com o número de estabelecimento chamado **EC Cielo**.  No site Cielo, você deverá selecionar o EC correspondente à API E-commerce para acessar as configurações do site.

  Se você for cliente de outras soluções Cielo, terá um EC para cada solução.
</Callout>

***

## Enquanto isso, teste a API E-commerce gratuitamente

1. Obtenha as <a href="https://docs.cielo.com.br/ecommerce-cielo/page/sandbox-api-ecommerce" target="_blank">credenciais para teste</a>;
2. Faça a sua primeira chamada à API – <a href="https://docs.cielo.com.br/ecommerce-cielo/reference/criar-pagamento-credito" target="_blank">crie uma transação de cartão de crédito</a>;
3. Teste a **<a href="https://docs.cielo.com.br/ecommerce-cielo/docs/3ds-sobre" target="_blank">autenticação 3DS</a>**;
4. Verifique os <a href="https://docs.cielo.com.br/ecommerce-cielo/reference/codigos-retorno-cancelamento" target="_blank">códigos de retorno</a> e <a href="https://docs.cielo.com.br/ecommerce-cielo/reference/retentativa-bandeira" target="_blank">regras de retentativas para transações negadas</a>.

<Callout icon="🔎" theme="default">
  ### O teste da API em ambiente sandbox é opcional.
</Callout>

### Funcionalidades disponíveis para testar a API

Ao obter as credenciais de teste, a maioria das funções da API E-commerce já estarão habilitadas. No entanto, alguns meios de pagamento e funcionalidades precisam ser habilitados com o Atendimento Cielo.

<Table>
  <thead>
    <tr>
      <th>
        Funcionalidades automaticamente habilitadas para teste após o cadastro no sandbox
      </th>
    </tr>
  </thead>

  <tbody>
    <tr>
      <td>
        - **[Zero Auth](https://docs.cielo.com.br/ecommerce-cielo/docs/zero-auth)**: validar cartão de teste;
        - **[Consulta BIN](https://docs.cielo.com.br/ecommerce-cielo/docs/consulta-bin)**: consultar informações do cartão;
        - **[Cartão de crédito](https://docs.cielo.com.br/ecommerce-cielo/docs/cartao-credito):** criar, capturar, consultar e cancelar pagamento;
        - **[Cartão de débito](https://docs.cielo.com.br/ecommerce-cielo/docs/cart%C3%A3o-de-debito):** criar, consultar e cancelar pagamento;
        - **[Pix](https://docs.cielo.com.br/ecommerce-cielo/docs/pix)**: criar e consultar pagamento;
        - **[QR Code](https://docs.cielo.com.br/ecommerce-cielo/docs/qr-code):** criar e consultar pagamento;
        - **[Recorrência](https://docs.cielo.com.br/ecommerce-cielo/docs/recorrencia):** criar transação recorrente;
        - **[Tokenização](https://docs.cielo.com.br/ecommerce-cielo/docs/tokenizando-cartoes):** criar token de cartão e criar transação com cartão tokenizado.
      </td>
    </tr>
  </tbody>
</Table>

<br />

<Table>
  <thead>
    <tr>
      <th>
        Funcionalidades de teste (sandbox) que devem ser habilitadas pelo Atendimento Cielo
      </th>
    </tr>
  </thead>

  <tbody>
    <tr>
      <td>
        - **[Boleto](https://docs.cielo.com.br/ecommerce-cielo/docs/boleto)**;
        - **[E-wallets](https://docs.cielo.com.br/ecommerce-cielo/docs/e-wallets)**;
        - **[Silent Order Post](https://docs.cielo.com.br/ecommerce-cielo/docs/sop)**;
        - **[Velocity](https://docs.cielo.com.br/ecommerce-cielo/docs/velocity)**;
        - **[Análise de fraude](https://docs.cielo.com.br/ecommerce-cielo/docs/analise-de-fraude)** (o produto Gestão de Risco deve ser contratado à parte).
      </td>
    </tr>
  </tbody>
</Table>

> Para uso em produção, as funcionalidades podem estar sujeitas a cobranças adicionais.

<br />

<Callout icon="ℹ️" theme="info">
  ###

  Saiba mais sobre as funções habilitadas para testes em <a href="https://docs.cielo.com.br/ecommerce-cielo/reference/como-usar-o-sandbox" target="_blank">Como testar a API</a>.
</Callout>

<br />

***

## Go live – comece a aceitar pagamentos online

**1. Obtenha as <a href="https://docs.cielo.com.br/ecommerce-cielo/reference/visualizar-as-credenciais-merchantid-e-merchantkey" target="_blank">credenciais de produção</a>**;

**2. Entre em contato com o <a href="https://docs.cielo.com.br/ecommerce-cielo/docs/suporte-cielo" target="_blank">Atendimento E-commerce</a> para habilitar funcionalidades adicionais**\*\*;

**3. Integre todos os <a href="https://docs.cielo.com.br/ecommerce-cielo/docs/criando-transacoes" target="blank">meios de pagamento</a> e comece a vender online.**

<br />

***

<Callout icon="ℹ️" theme="info">
  ### Habilitando funcionalidades em ambiente de produção

  No ambiente de produção, **a maioria das funcionalidades já estará habilitada por padrão**.

  No entanto, cada estabelecimento deve solicitar ao Atendimento E-commerce a habilitação das seguintes funcionalidades:

  - Recorrência (e retentativa de recorrências);
  - Zero Auth;
  - Consulta BIN;
  - Velocity;
  - Análise de fraude (mediante contratação adicional).

  As funcionalidades podem estar sujeitas a cobranças adicionais.
</Callout>

<br />

***

\**A Cielo irá avaliar a veracidade das informações fornecidas e poderá aprovar ou não o cadastro*.

\*\* *As funcionalidades que devem ser habilitadas separadamente com o Atendimento E-commerce são Zero Auth, Consulta BIN, Velocity, Recorrência e Análise de Fraude e podem estar sujeitas à cobrança adicional*.