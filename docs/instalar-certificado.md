---
updatedAt: 2026-09-24T11:56:08.000Z
agentTools:
  siteIndex: https://docs.cielo.com.br/llms.txt
  projectIndex: https://docs.cielo.com.br/ecommerce-cielo/llms.txt
---

# Como instalar o certificado no servidor da loja?

<Callout icon="⚠️" theme="warn">
  ### A Cielo não recomenda a pinagem (pinning) do certificado. O prazo de expiração do certificado é anual, e a loja é responsável por realizar a renovação e atualização do certificado no sistema.
</Callout>

A Cielo não oferece suporte para a instalação do certificado. Caso não tenha segurança para realizar esse procedimento, recomenda-se entrar em contato com o suporte do fornecedor do seu servidor.

## Instalação no servidor da loja virtual

Para o passo a passo para a instalação do certificado, contate o suporte do fornecedor do seu servidor. Caso a sua loja decida instalar o certificado, faça a instalação na TrustedStore do servidor.

<Callout icon="⚠️" theme="warn">
  ### Atenção

  A Cielo não oferece suporte para a instalação do certificado.
</Callout>

## Acesso do cliente à loja virtual

Normalmente, o browser faz a atualização do certificado automaticamente. Caso contrário, siga as etapas a seguir:

### Salve os arquivos dos certificados

Clique no certificado iniciar o download. Salve o arquivo para uso futuro:

| URL                                   | Certificado                                                                                                                                                                                                           | Expiração  |
| :------------------------------------ | :-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- | :--------- |
| \*cieloecommerce.com.br               | [Certificado E-Commerce Cielo](https://raw.githubusercontent.com/DeveloperCielo/developercielo.github.io/2cfa7ae47cbf12db0cd38e0f56223960fdc1e80a/attachment/star_cieloecommerce_cielo_com_br_1445551103%20\(7\).zip) | 24/02/2027 |
| \*cieloecommerce.com.br Raiz          | [Certificado Raiz](https://raw.githubusercontent.com/DeveloperCielo/developercielo.github.io/4ce8324c67de543a209b164d60e52de3dd5d28a5/attachment/certificados2025/TrustedRoot.zip)                                    | 15/01/2038 |
| \*cieloecommerce.com.br Intermediário | [Certificado Intermediário](https://raw.githubusercontent.com/DeveloperCielo/developercielo.github.io/4ce8324c67de543a209b164d60e52de3dd5d28a5/attachment/certificados2025/DigiCertCA.zip)                            | 29/03/2031 |
| api.cieloecommerce.com.br             | [Certificado API E-commerce](https://raw.githubusercontent.com/DeveloperCielo/developercielo.github.io/b4015d74b9f11f762433fe0a3db4d1db7aad5c9a/attachment/certificados2025/api.cieloecommerce.com.br.zip)            | 08/12/2026 |

<br />

### Instale os certificados no navegador

#### Google Chrome

1. Vá para **Configurações**> **Privacidade e Segurança** > **Segurança** > **Gerenciar Certificados**. Clique em **Importar**:

<Image src="https://files.readme.io/e5f2d2e-chrome-importar2.png" alt="Tela para importar os certificados no navegdor Google Chrome" align="center" />

2. No Assistente para Importação de Certificados, clique em **Avançar**:

<Image src="https://files.readme.io/bb9d1fc-chrome-assistente-avancar3.png" alt="Tela do assistente para importação dos certificados no navegdor Google Chrome" align="center" />

3. Clique em **Procurar** e selecione um dos três arquivos de certificados salvos anteriormente (raiz, intermediária ou E-commerce Cielo):

<br />

<Image src="https://files.readme.io/9168808-chrome-procurar4.png" alt="Tela do assistente para importação dos certificados no navegdor Google Chrome" align="center" />

<br />

4. Selecione o **Repositório de Certificados** desejado:

<Image src="https://files.readme.io/b76dd75-chrome-repositorio5.png" alt="Tela para acessar o repositório de certificados" align="center" />

5. Confira as informações e clique em **Concluir**:

<Image src="https://files.readme.io/eba4402-chrome-concluir6.png" alt="Tela de conclusão da importação de certificado" align="center" />

<br />

Repita a operação para os outros dois arquivos de certificados.