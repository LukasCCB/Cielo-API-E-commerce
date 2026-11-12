---
agentTools:
  siteIndex: https://docs.cielo.com.br/llms.txt
  projectIndex: https://docs.cielo.com.br/ecommerce-cielo/llms.txt
---

# Julho 2026

Acompanhe as últimas atualizações da API E-commerce Cielo:

## 🛠️ Melhorias

Incluímos ajustes e otimizações com foco em qualidade e performance.

* [Esclarece prazo de captura de 7 dias para bandeira Mastercard na API 3.0](https://docs.cielo.com.br/link/docs/consultar-pedidos):
  * **Captura via API 3.0**: prazo de execução passa a **7 dias corridos** exclusivamente para a bandeira **Mastercard**;
  * Demais bandeiras mantêm o prazo padrão de **15 dias corridos**;

* [Atualiza tabela de Merchant Advice Code (MAC) da bandeira Mastercard](https://docs.cielo.com.br/ecommerce-cielo/reference/retentativa-bandeira#mastercard):
  * Inclui os códigos **MAC 06, 07, 08, 90 e 99** na tabela, com significado e ação sugerida para cada um;
  * Novos códigos entram em vigor a partir de **10/11/2026**;

* [Adiciona aviso sobre atualização do script de autenticação 3DS (MPI)](https://docs.cielo.com.br/ecommerce-cielo/docs/implementando-script):
  * Clientes que utilizam cópia local do script **JavaScript de autenticação 3DS (MPI)** devem atualizá-lo até **31/07/2026**;
  * Após essa data, versões antigas podem parar de funcionar devido à descontinuação das URLs anteriores;
  * Não se aplica a integrações que carregam o script diretamente dos servidores da **Braspag/Cielo**;

* [Adiciona novo código de resposta da bandeira Elo (vigência a partir de 23/10/2026)](https://docs.cielo.com.br/ecommerce-cielo/page/abecs#bandeira-elo):
  * Inclui o código **5C – Transação não suportada ou bloqueada pelo emissor**, classificado como **reversível**;
  * Atualiza a tabela de retentativa por bandeira, associando o código 5C ao **Grupo 2**;
  * Vigência a partir de **23/10/2026**;