---
updatedAt: 2026-10-06T12:56:44.000Z
agentTools:
  siteIndex: https://docs.cielo.com.br/llms.txt
  projectIndex: https://docs.cielo.com.br/ecommerce-cielo/llms.txt
---

# Códigos de retorno de cancelamento

Ao realizar o cancelamento de uma transação, a API retorna um código (`ProviderReturnCode`) e uma mensagem (`ProviderReturnMessage`) indicando o resultado da operação. Esses valores, na maioria dos casos, também são os mesmos retornados em `ReturnCode` e `ReturnMessage`.&#x20;

Consulte a lista completa de valores possíveis, suas descrições e as ações recomendadas.

| RETURN CODE | DESCRIÇÃO                                                                                                                                    | AÇÃO RECOMENDADA                                                 |
| ----------- | -------------------------------------------------------------------------------------------------------------------------------------------- | ---------------------------------------------------------------- |
| 0           | Cancelamento aprovado com sucesso.                                                                                                           | Nenhuma ação necessária.                                         |
| 3           | Transação inexistente.                                                                                                                       | Valide os dados da transação informada e tente novamente.        |
| 5           | Erro de efetivação.                                                                                                                          | Consulte status da transação antes de realizar nova tentativa.   |
| 9           | Solicitação de cancelamento total aprovada com sucesso.                                                                                      | Nenhuma ação necessária.                                         |
| 10          | Cancelamento não efetuado. Solicitação pendente com as mesmas informações.                                                                   | Aguarde processamento da solicitação pendente.                   |
| 17          | Existe cancelamento/contestação total ou parcial para esta venda.                                                                            | Consulte histórico da transação.                                 |
| 40          | Prazo para cancelamento vencido.                                                                                                             | Não é permitido cancelar uma transação após o prazo.             |
| 41          | Status não permite cancelamento.                                                                                                             | Verifique status da transação.                                   |
| 42          | Existe cancelamento/contestação para esta venda.                                                                                             | Consulte histórico da transação.                                 |
| 43          | Saldo na Agenda insuficiente.                                                                                                                | Verifique o saldo na agenda.                                     |
| 51          | Cancelamento acima do valor original da venda.                                                                                               | Verifique o valor enviado.                                       |
| 52          | Venda original não encontrada.                                                                                                               | Valide os dados da transação.                                    |
| 53          | Produto não permite cancelar.                                                                                                                | Verifique as regras do produto.                                  |
| 54          | Cancelamento não efetuado.                                                                                                                   | Entre em contato com o suporte.                                  |
| 55          | Saldo da Venda insuficiente.                                                                                                                 | Verifique saldo remanescente da venda.                           |
| 56          | Saldo do Lojista insuficiente.                                                                                                               | Verifique agenda financeira e disponibilidade de saldo.          |
| 57          | Falha no processamento.                                                                                                                      | Tente novamente após alguns minutos.                             |
| 58          | Cartão divergente do informado na venda. Verifique também bandeira e CardType.                                                               | Verifique número do cartão, bandeira e CardType.                 |
| 60          | CardType divergente do informado na venda.                                                                                                   | Verifique CardType.                                              |
| 72          | Saldo na Agenda insuficiente para cancelamento da venda.                                                                                     | Entre em contato com o suporte.                                  |
| 76          | EC não possui saldo para cancelamento.                                                                                                       | Verifique agenda financeira do estabelecimento.                  |
| 77          | Venda original não encontrada para cancelamento.                                                                                             | Verifique os dados da venda original.                            |
| 97          | Sistema indisponível.                                                                                                                        | Aguarde normalização e tente novamente.                          |
| 98          | Timeout.                                                                                                                                     | Tente novamente.                                                 |
| 99          | Falha no processamento.                                                                                                                      | Tente novamente.                                                 |
| 100         | Venda original não encontrada para cancelamento. Ocorre quando a tentativa de cancelamento parcial é feita antes da liquidação da transação. | Aguarde liquidação da venda e tente novamente.                   |
| 101         | Cancelamento não realizado, por estar acima do prazo permitido pela bandeira.                                                                | Não é permitido cancelar uma transação após o prazo da bandeira. |
| 102         | Cancelamento solicitado acima do valor da transação original.                                                                                | Verifique o valor da transação original.                         |
| 103         | Restrição Cadastral. Cancelamento não permitido.                                                                                             | Entre em contato com o suporte.                                  |
| 104         | Restrição Cadastral. Cancelamento não permitido.                                                                                             | Entre em contato com o suporte.                                  |
| 105         | Restrição Cadastral. Cancelamento não permitido.                                                                                             | Entre em contato com o suporte.                                  |
| 106         | Restrição Cadastral. Cancelamento não permitido.                                                                                             | Entre em contato com o suporte.                                  |
| 107         | Restrição Cadastral. Cancelamento não permitido.                                                                                             | Entre em contato com o suporte.                                  |
| 108         | Número do Estabelecimento (EC) não encontrado.                                                                                               | Verifique o número do estabelecimento enviado.                   |
| 116         | Cancelamento não encontrado.                                                                                                                 | Consulte histórico de solicitações de cancelamento.              |
| 117         | Erro na chamada ao serviço de Clearing.                                                                                                      | Tente novamente após alguns minutos.                             |
| 120         | Produto da venda não permite cancelamento.                                                                                                   | Verifique as regras do produto.                                  |
| 121         | Erro de Efetivação. MCC’s 3000 ou 30001 não permite cancelamento de parcelado aberto.                                                        | Entre em contato com o suporte.                                  |
| 130         | Bandeira não permite cancelamento. Já Existe um cancelamento ou chargeback efetivado para esta transação.                                    | Verifique histórico da transação.                                |
| 160         | CardType divergente do informado na venda.                                                                                                   | Corrija CardType informado e tente novamente.                    |
| 206         | Cancelamento não efetuado. Não foi possível localizar a venda com o valor enviado.                                                           | Verifique os dados da transação.                                 |
| 209         | Cancelamento não efetuado. Não foi possível localizar a venda com o produto enviado.                                                         | Verifique os dados da transação.                                 |
| 215         | Cancelamento não efetuado. Não foi possível localizar a venda com a bandeira enviada.                                                        | Verifique os dados da transação.                                 |
| 217         | Cancelamento não efetuado. Foi localizado mais de uma venda com os dados enviados.                                                           | Verifique os dados da transação.                                 |
| 221         | Cancelamento não efetuado. Não foi possível localizar a venda com o valor do cancelamento enviado.                                           | Verifique os dados da transação.                                 |
| 223         | Cancelamento não efetuado. Solicitação pendente com as mesmas informações.                                                                   | Aguarde conclusão da solicitação já existente.                   |
| 340         | Transação bloqueada temporariamente para novas solicitações de cancelamento. Será liberada a partir de meia noite.                           | Tente novamente no dia seguinte.                                 |
| 475         | Cancelamento da transação não foi efetuado com sucesso.                                                                                      | Consulte status da venda e tentar novamente.                     |
| 476         | Cancelamento não realizado. Existe um cancelamento para esta venda em processamento.                                                         | Aguarde conclusão do processamento.                              |
| 477         | Cancelamento não efetivado.                                                                                                                  | Consulte status e tente novamente.                               |
| 504         | Tempo limite excedido.                                                                                                                       | Tente novamente.                                                 |
| 576         | Pré-autorização principal não localizada.                                                                                                    | Verifique os dados da transação.                                 |
| 9016        | Desfeito.                                                                                                                                    | Consulte o histórico da transação.                               |
| BP900       | Falha na operação. Recomendamos realizar a consulta do status da transação antes de fazer uma nova tentativa de requisição.                  | Consulte status da transação e tente novamente após 5 minutos.   |
| BP903       | Falha no cancelamento.                                                                                                                       | Tente novamente.                                                 |
| AA          | Timeout no cancelamento.                                                                                                                     | Tente novamente.                                                 |