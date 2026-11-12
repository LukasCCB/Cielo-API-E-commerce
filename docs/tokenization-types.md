---
updatedAt: 2026-01-20T14:41:47.000Z
agentTools:
  siteIndex: https://docs.cielo.com.br/llms.txt
  projectIndex: https://docs.cielo.com.br/ecommerce-cielo/llms.txt
---

# Tipos de tokenização oferecidos pela Cielo

A Cielo oferece dois tipos de tokenização para **cartões de crédito**:

1. **[Tokenização com armazenamento no cofre da Cielo (Cartão Protegido)](https://docs.cielo.com.br/ecommerce-cielo/docs/tokenization-types#cart%C3%A3o-protegido):** os dados do cartão são convertidos em um `CardToken`, que é armazenado com segurança pela Cielo;
2. **[Tokenização na bandeira](https://docs.cielo.com.br/ecommerce-cielo/docs/tokenization-types#tokeniza%C3%A7%C3%A3o-na-bandeira)**: é um identificador fornecido pela bandeira do cartão e pode ou não estar associado a um `CardToken`).

<Callout icon="ℹ️" theme="info">
  Se a sua loja já possui uma solução de tokenização na bandeira, é possível criar pagamentos pela API E-commerce Cielo usando o token de bandeira existente. Leia mais em [Tokenização externa](https://docs.cielo.com.br/ecommerce-cielo/docs/external-token) .
</Callout>

<Callout icon="⚠️" theme="warn">
  A API E-commerce Cielo não armazena o CVV do cartão. A sua loja precisa ter autorização da adquirência Cielo para transacionar sem o CVV ou o comprador do cartão precisará informar o CVV a cada transação.
</Callout>

## Formatos do cartão de crédito na transação

Antes de conhecer os tipos de tokenização, é importante diferenciar os formatos em que o cartão de crédito pode ser usado no fluxo transacional:

<Table align={["left","left"]}>
  <thead>
    <tr>
      <th>
        Formato
      </th>

      <th>
        Descrição
      </th>
    </tr>
  </thead>

  <tbody>
    <tr>
      <td>
        **PAN (Primary Account Number)**
      </td>

      <td>
        São os dados reais impressos no cartão.
      </td>
    </tr>

    <tr>
      <td>
        **`CardToken`**
      </td>

      <td>
        É uma sequência de caracteres que representa o conjunto de dados de um cartão de crédito de forma tokenizada.

        O `CardToken` é criado e armazenado pela API E-commerce.
      </td>
    </tr>

    <tr>
      <td>
        **DPAN (Device Primary Account Number)**
      </td>

      <td>
        É a versão tokenizada do cartão na bandeira, também chamada de _network token_
      </td>
    </tr>
  </tbody>
</Table>

<br />

<Image align="center" alt="PAN, CardToken, and DPAN" border={false} src="https://files.readme.io/1d9c68d5b0e46df7b4f4d281ed5348884938a60324fc6592c3e398e5a86cddaa-pan-cardtoken-dpan.jpg" />

## Qual é a diferença entre tokenização no Cartão Protegido e tokenização na bandeira?

### Cartão Protegido

A **tokenização de cartões no Cartão Protegido** é o armazenamento seguro de cartões de crédito em ambiente Cielo com certificação <a href="https://www.pcisecuritystandards.org/standards/pci-dss/" target="_blank">PCI DSS</a>. Os dados do cartão são armazenados pela Cielo e representados pelo `CardToken`; a loja, por sua vez, irá armazenar o `CardToken` e usá-lo na comunicação com a Cielo.

Esse método é ideal para transações recorrentes e compras com um clique, nas quais os dados do cartão são armazenados de forma segura e podem ser reutilizados sem a necessidade de o comprador informar os dados do cartão novamente em cada transação. Isso proporciona uma experiência de compra mais rápida e conveniente para o comprador, além de reduzir o risco de exposição dos dados sensíveis do cartão.

> ℹ️ Saiba mais em [Tokenização de cartões no Cartão Protegido](https://docs.cielo.com.br/ecommerce-cielo/docs/cielo-tokenization).

### Tokenização na bandeira

A **tokenização na bandeira** é a criação de um token no cofre da bandeira do cartão, em um processo regulamentado pela <a href="https://www.emvco.com/" target="_blank">EMVco</a>. Esse token substitui os dados do cartão aberto, criando o DPAN (Device Primary Account Number), que é o cartão no formato tokenizado, e o criptograma, que é um código único para o DPAN para cada transação.

O token da bandeira é usado na comunicação entre a Cielo e a bandeira e emissor do cartão, e é associado ao `CardToken`. Assim, a loja não precisa gerenciar os DPANs e criptogramas, pois eles já estão associados ao token do Cartão Protegido.

Para clientes da API E-commerce Cielo, o token da bandeira Visa está habilitado para todos os clientes e é transparente, não sendo necessário nenhuma integração adicional.

> ℹ️ Saiba mais em [Tokenização na bandeira (network token)](https://docs.cielo.com.br/ecommerce-cielo/docs/network-token).