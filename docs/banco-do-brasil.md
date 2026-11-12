---
updatedAt: 2026-10-14T14:48:47.000Z
agentTools:
  siteIndex: https://docs.cielo.com.br/llms.txt
  projectIndex: https://docs.cielo.com.br/ecommerce-cielo/llms.txt
---

# Banco do Brasil

<Callout icon="ℹ️" theme="info">
  Vá para a <a href="https://docs.cielo.com.br/ecommerce-cielo/reference/boleto-api" target="\_blank">Referência da API para acessar os exemplos completos de requisição e resposta</a>.
</Callout>

<Callout icon="⚠️" theme="warn">
  A integração de boleto do Banco do Brasil deve usar o provedor _BancoDoBrasil3_, válido a partir de 05/03/2026.
</Callout>

## Como funciona

1. O comprador, após escolher o produto na loja, seleciona a forma de pagamento Boleto Registrado Banco do Brasil.
2. A loja envia para a Cielo uma requisição chamando o meio de pagamento correspondente.
3. A Cielo retornará uma URL contendo a imagem do Boleto.

## Cadastro e configuração com o Banco do Brasil

### 1. Ambiente BB

Para habilitar o produto boleto registrado, entre em contato com o gerente de relacionamento do Banco do Brasil e forneça as informações abaixo:

| Dado                          | Formato                                                               |
| ----------------------------- | --------------------------------------------------------------------- |
| **URL (site) retorno à loja** | `https://www.pagador.com.br`                                          |
| **Formato arquivo retorno**   | (X) CBR643                                                            |
| **Meio de retorno**           | (X) Mainframe – para empresa com sistema próprio, que não usam o GFN. |

Ao concluir o credenciamento, o estabelecimento receberá um documento.

### 2. Obter credenciais no portal do Banco do Brasil

Acesse o portal do Banco do Brasil para obter suas credenciais e siga estas etapas:

• <Anchor target="_blank" href="https://www.youtube.com/watch?v=vJeC6KSwLi4">Criar cadastro no portal BB</Anchor>;

• <Anchor target="_blank" href="https://www.youtube.com/watch?v=WE6jP6_Zi_I&t=8s">Criar uma aplicação (API de cobranças)</Anchor>;

• <Anchor target="_blank" href="https://www.youtube.com/watch?v=-8ucQZFPUy0">Realizar testes e envio para produção</Anchor>.

### 3. Cadastrar credencias

Para usar o provedor **BancoDoBrasil3**, é obrigatório cadastrar as credenciais abaixo com o [suporte Cielo](https://docs.cielo.com.br/ecommerce-cielo/docs/suporte-cielo#/):

| Campo                       | Valor          |
| --------------------------- | -------------- |
| **Assinatura de Afiliação** | `AppKey`       |
| **Username**                | `ClientId`     |
| **Senha**                   | `ClientSecret` |

## Configuração do boleto na Cielo

#### Dados de cadastro

Você deve informar ao [suporte Cielo](https://docs.cielo.com.br/ecommerce-cielo/docs/suporte-cielo#/) os seguintes dados:

<Table>
  <thead>
    <tr>
      <th>
        Dados
      </th>

      <th>
        Descrição
      </th>

      <th>
        Formato
      </th>

      <th>
        OBS
      </th>
    </tr>
  </thead>

  <tbody>
    <tr>
      <td>
        <p><strong>Agência</strong></p>
      </td>

      <td>
        <p>Código agência</p>
      </td>

      <td>
        <p>4 dígitos</p>
      </td>

      <td>
        <p>Apenas os quatro números da agência são obrigatórios, sem incluir dígito</p>
      </td>
    </tr>

    <tr>
      <td>
        <p><strong>Conta:</strong></p>
      </td>

      <td>
        <p>Conta corrente</p>
      </td>

      <td>
        <p>7 dígitos</p>
      </td>

      <td>
        <p>Hífen obrigatório</p>
      </td>
    </tr>

    <tr>
      <td>
        <p><strong>Carteira:</strong></p>
      </td>

      <td>
        <p>Número da carteira e variação\*.<br />A carteira determina as características do serviço de cobrança e define como os boletos serão tratados pelo BB.</p>
      </td>

      <td>
        <p>5 dígitos no formato "XX/XX".</p>
      </td>

      <td>
        <p>Exemplo: "17/27".</p>
      </td>
    </tr>

    <tr>
      <td>
        <p><strong>Convênio</strong></p>
      </td>

      <td>
        <p>Convênio de comércio eletrônico</p>
      </td>

      <td>
        <p>6 dígitos</p>
      </td>

      <td>
        <p>É o mesmo valor de Conciliação (Convênio de cobrança) fornecido pelo banco.</p>
      </td>
    </tr>

    <tr>
      <td>
        <p><strong>Nosso Número</strong></p>
      </td>

      <td>
        <p>Número do boleto que permite sua identificação junto ao BB. É um contador incremental</p>
      </td>

      <td>
        <p>5 dígitos</p>
      </td>

      <td>
        <p>Inserir "10000" - A cada emissão de boleto esse numero aumenta em +1.</p>
      </td>
    </tr>

    <tr>
      <td>
        <p><strong>Vencimento</strong></p>
      </td>

      <td>
        <p>Prazo de validade do boleto</p>
      </td>

      <td>
        <p>2 dígitos no formato "XX".</p>
      </td>

      <td>
        <p>É o valor padrão, se nenhum outro valor for enviado via API</p>
      </td>
    </tr>

    <tr>
      <td>
        <p><strong>Instruções</strong></p>
      </td>

      <td>
        <p>Informações exibidas no boleto</p>
      </td>

      <td>
        <p>50 dígitos</p>
      </td>

      <td>
        <p>Somente números e letras de A-Z, não pode haver caracteres especiais ou mais de um espaçamento entre cada palavra</p>
      </td>
    </tr>

    <tr>
      <td>
        <p><strong>AppKey</strong></p>
      </td>

      <td>
        <p>Assinatura de afiliação fornecida pelo Banco do Brasil. *Disponível no portal BB.*</p>
      </td>

      <td>
        <p>32 dígitos</p>
      </td>

      <td>
        <p>É uma sequência hexadecimal.</p>
      </td>
    </tr>

    <tr>
      <td>
        <p><strong>ClientId</strong></p>
      </td>

      <td>
        <p>Identificador no Banco do Brasil</p>
      </td>

      <td>
        <ul>
          \--
        </ul>
      </td>

      <td>
        <p>Credencial fornecida pelo Banco do Brasil.</p>
      </td>
    </tr>

    <tr>
      <td>
        <p><strong>ClientSecret</strong></p>
      </td>

      <td>
        <p>Chave no Banco do Brasil</p>
      </td>

      <td>
        <ul>
          \--
        </ul>
      </td>

      <td>
        <p>Credencial fornecida pelo Banco do Brasil.</p>
      </td>
    </tr>
  </tbody>
</Table>

\***Variação da carteira para o Banco do Brasil**: parâmetro de agrupamento de boletos dentro de uma mesma carteira, permite que a loja agrupe seus boletos, de acordo com modelos de negócios diferentes (filiais, pontos de venda, etc.).

> *OBS*: A loja deverá obrigatoriamente enviar no contrato da API os dados (nome do comprador, CPF e endereço completo).

## Conciliação automática de boletos

Atualmente, o Banco do Brasil não oferece atualização automática de status para boletos registrados.

Para atualizar o status das transações pagas, realize a conciliação manual no Site Cielo.

<br />

## Conciliação manual

A conciliação manual do boleto pode ser feita no **Site Cielo** quando necessário. Para conciliar:

1. Acesse o <Anchor target="_blank" href="https://www.cielo.com.br/">Site Cielo</Anchor>;

2. Selecione o estabelecimento (EC) desejado;
   * No menu superior, clique em **E-commerce**;
   * Acesse **Transações**;

3. Em **Transações**, aplique os filtros **Forma de pagamento: Boleto** e **Situação: Não Paga**;

   <Image src="https://files.readme.io/dd60d3bc6a2ef1c6cd5ab5ceddf48af976757aa89f20c566b709c776da6df47f-Lista_de_transaes.png" align="center" width="1000px" />

4. Localize o pedido desejado e acesse os **Detalhes da transação**;

5. Clique em **Conciliar**;

<Image src="https://files.readme.io/6c0f59133c84cda356a4a64ac21c989a23aca35f8c149aed455d2929c7ca0b82-Detalhes_da_transao.png" align="center" width="1000px" />

<br />

6. No painel **Conciliar boleto**, confira os dados da transação e clique em **Continuar**;

   <Image src="https://files.readme.io/6f2a43e8359e825c964e1275b75e6ddd942f7a4037d2e3b1f411b4494bc7c052-Conciliar_boleto.png" alt="Painel Conciliar boleto com os dados da transação e botão Continuar" align="center" width="350px" />

   7\. Na janela de confirmação, confira o valor e o nome do cliente e clique em **Conciliar**;

   <Image src="https://files.readme.io/494aaaead286b985a53e069ff6ca9a1f06d4aa5433f6184dece823cfdc34f299-Confirmar_conciliao.png" alt="Janela de confirmação: Deseja continuar com a conciliação?" align="center" width="450px" />

   8\. Conclua a autenticação da operação por meio do **aplicativo Cielo Gestão**.&#x20;

Ao concluir, a plataforma apresenta uma mensagem de sucesso e o status da transação é atualizado para *Conciliação manual*.

<Image src="https://files.readme.io/adbc198f7b028e8a35f8d0c86ba4235b80c248715e4f6b51433f267675c7bf88-Conciliao_realizad_com_sucesso.png" align="center" width="1000px" />

<br />

<br />

<br />

<br />