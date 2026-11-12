---
updatedAt: 2025-10-30T01:02:44.000Z
agentTools:
  siteIndex: https://docs.cielo.com.br/llms.txt
  projectIndex: https://docs.cielo.com.br/ecommerce-cielo/llms.txt
---

# Integração do script de autenticação

> ⚠️ Atenção
>
> Não oferecemos suporte para o desenvolvimento e implementação deste SDK.

O protocolo de autenticação 3DS 2.2 está disponível na versão *browser-based*, ou seja, a loja deverá incluir o script do 3DS no arquivo HTML da página de pagamento (checkout). O protocolo 3DS, ao processar o script, permite a troca de dados entre a loja e o emissor para autenticar o portador do cartão.

A integração do script do protocolo de <Glossary>autenticação</Glossary> é composta pelas seguintes etapas:

1. **Obtenção das credenciais**: acesse o site Cielo para obter as credenciais `ClientId` e `ClientSecret`, que serão usadas para criar o token na etapa 2;
2. **Criação do token de acesso**: o token de acesso deverá ser inserido no script (JavaScript) e no HTML na classe `bpmpi_accesstoken`. Veja as tabelas de mapeamento de classes para mais informações;
3. **Mapeamento de classes**: aqui você deve preparar o seu ambiente para coletar os dados do comprador e executar o script no navegador do comprador;
4. **Implementação do script**: insira as classes no HTML (tag `body`) e referencie o arquivo JavaScript com as classes mapeadas.
5. **Implementação da chamada ao evento de autenticação**: usando os dados retornados no resultado da autenticação, envie a transação para autorização (aprovação da adquirente).