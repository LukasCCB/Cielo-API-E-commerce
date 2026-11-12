---
updatedAt: 2026-09-14T19:30:47.000Z
agentTools:
  siteIndex: https://docs.cielo.com.br/llms.txt
  projectIndex: https://docs.cielo.com.br/ecommerce-cielo/llms.txt
---

# Pix

<Callout icon="ℹ️" theme="info">
  Vá para a <a href="https://docs.cielo.com.br/ecommerce-cielo/reference/qrcode-pix" target="\_blank">Referência da API para acessar os exemplos completos de requisição e resposta</a>.
</Callout>

O **Pix** permite receber pagamentos instantâneos por meio da API E-commerce Cielo. Ao habilitar essa forma de pagamento na sua loja, você gera QR Codes Pix para os compradores realizarem o pagamento e define como deseja receber os valores das vendas.

Com o Pix na Cielo, você pode:

* Gerar QR Codes Pix e receber pagamentos pela API E-commerce Cielo;
* Escolher o modelo de repasse dos valores recebidos;
* Devolver total ou parcialmente pagamentos já realizados;
* Consultar o extrato e o histórico das transações Pix.

> ⚠️ Nova integração Pix na Cielo
>
> A partir de 01/09/2025, novas integrações de Pix serão feitas com o novo provedor de Pix na Cielo, o `Cielo2`. Saiba mais sobre a <a href="https://docs.cielo.com.br/ecommerce-cielo/docs/pix-cielo" target="_blank">nova integração de Pix na Cielo</a>.

<Callout icon="ℹ️" theme="info">
  ### Antes de usar o Pix em produção, certifique-se de que o Pix está liberado em seu cadastro.

  Para confirmar basta acessar o <a href="https://www.cielo.com.br/" target="_blank">portal Cielo</a> na área logada em **Meu Cadastro** > **Autorizações** > **PIX**


  <Image src="https://files.readme.io/7b0531f-adesao-pix.png" alt="Tela de adesão ao Pix" align="center" />

</Callout>

<Callout icon="⚠️" theme="warn">
  ### Atenção

  O tempo de expiração do QRCode Pix Cielo na integração legada é de duas horas.
</Callout>

## Próximas seções

Consulte as páginas a seguir para configurar e gerenciar sua operação Pix:

<Cards>
  <Card title="Como funciona o pagamento por Pix" href="https://docs.cielo.com.br/ecommerce-cielo/docs/como-funciona-o-pagamento-por-pix" icon="far fa-rocket">
    Entenda o fluxo completo de uma transação Pix, da geração do QR Code à confirmação do pagamento.
  </Card>

  <Card title="Configurações Pix" href="https://docs.cielo.com.br/ecommerce-cielo/docs/configurações-pix" icon="far fa-gear">
    Consulte as configurações e opções disponíveis para a operação Pix no portal Cielo.
  </Card>

  <Card title="Gestão da conta Pix na Cielo" href="https://docs.cielo.com.br/ecommerce-cielo/docs/conta-pix-cielo" icon="far fa-building-columns">
    Configure o modelo de repasse e acompanhe o saldo disponível da conta Pix.
  </Card>

  <Card title="Extrato Pix" href="https://docs.cielo.com.br/ecommerce-cielo/docs/extrato-pix" icon="far fa-chart-line-up">
    Consulte o histórico de movimentações da conta Pix e acompanhe os valores recebidos e transferidos.
  </Card>

  <Card title="Devolução Pix" href="https://docs.cielo.com.br/ecommerce-cielo/docs/devolucao-pix" icon="far fa-rotate-left">
    Devolva total ou parcialmente pagamentos Pix já recebidos.
  </Card>
</Cards>