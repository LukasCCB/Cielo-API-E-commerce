---
updatedAt: 2026-10-14T14:48:37.000Z
agentTools:
  siteIndex: https://docs.cielo.com.br/llms.txt
  projectIndex: https://docs.cielo.com.br/ecommerce-cielo/llms.txt
---

# Configuração do Merchant Identifier

Nesta etapa inicial, você deverá criar um **Merchant Identifier** para sua loja. O Merchant Identifier será usado para criar os certificados necessários para integrar:

## Criar o Merchant Identifier

A criação do merchant identifier deve ser feita através do <Anchor target="_blank" href="https://developer.apple.com/">Portal de Desenvolvedores da Apple</Anchor>, da seguinte maneira:

1. Na seção **Certificates, Identifiers & Profiles**, selecione **Identifiers** no menu lateral, e clique no botão `(+)` ao lado do título:

   <Image src="https://files.readme.io/b5dac47aa0ca580eb95abe02abfad2ee34dbf4c5561b2acb55b116594f058ed9-1.png" align="center" />

2. Selecione a opção **Merchant IDs** e clique em **Continue**:

   <Image src="https://files.readme.io/d185aa93011e7d2ec05b8cbecd5199e25764f21b805d5ec66491df35eac6d677-2.png" align="center" />

3. Preencha os campos **Description** e **Identifier**, conforme suas especificações, e clique em **Continue**:

   <Image src="https://files.readme.io/2257fbf66505d71b4086d46f8f796f617a74da19d216bfd05a06250d21f2b91d-3.png" align="center" />

4. Para concluir o cadastro, clique em **Register**:

   <Image src="https://files.readme.io/18b2dc015962d57411b81f462a1f4c9892db6b6edc55935c23b87617ca431483-4.png" align="center" />

***

### Certificado CSR

Veja [como habilitar Apple Pay](https://docs.cielo.com.br/ecommerce-cielo/docs/habilitar-e-wallet#apple-pay) e em seguida, baixe o certificado CSR via site Cielo.

***

### Criar o certificado CER

Para criar o certificado de processamento de pagamento CER, que será utilizado na loja virtual ou no aplicativo, acesse o [Portal de desenvolvedores da Apple](https://developer.apple.com/) e siga as instruções abaixo.

1. Na seção **Certificates, Identifiers & Profiles**, selecione **Identifiers**, no menu lateral.

2. No filtro localizado no canto superior direito (**App IDs**), selecione **Merchant IDs**:

   <Image src="https://files.readme.io/78df88aa65feb130a114983daeef0a0175405ddde243bae9c5982ffea583058c-5.png" align="center" />

3. Selecione o *merchant identifier* criado anteriormente:

   <Image src="https://files.readme.io/cc70ec9c56eba804f2b9aaf5df78d6e06cb9c4343837d1e6a6969ccd1fb0637b-6.png" align="center" />

4. No bloco **Apple Pay Payment Processing Certificate**, clique em **Create Certificate** ao final do texto explicativo:

   <Image src="https://files.readme.io/ef0434628e404f429b9480a9d4b024f52a3f3638f92ec94bcdda8f617a0e6de9-7.png" align="center" />

5. Em **Edit or Configure Merchant ID** selecione a opção **No**:

   <Image src="https://files.readme.io/8b4b0052229285c28397a212bbfcce98bcce7544c1b4dbd455742d5e14283ba4-8.png" align="center" />

6. Na caixa de diálogo, clique em **Choose File** e selecione o certificado CSR fornecido pelo atendimento Cielo:

> **Importante**
>
> Nessa etapa, **não utilize o certificado CER gerado automaticamente pela Apple**. Utilize exclusivamente o arquivo **CSR** fornecido pelo atendimento Cielo.

<Image src="https://files.readme.io/37ea6077371ec7b8274bbe8a5b822d96c7f027b10aa0cfb89c809dd90b134621-9.png" alt="Na caixa de diálogo, clique em `Choose File` e escolha o certificado &quot;.CSR&quot;" align="center" width="750px" />

7. Clique em **Continue** para gerar o certificado:

<Image src="https://files.readme.io/e844f849396cb92d93bf3631be5c6e245e0fcf44d9a87bade04997f3bfef2460-10.png" alt="Clique em &quot;continuar&quot; para gerar o o certificado" align="center" width="750px" />

8. Clique em **Download** para baixar o arquivo CER.

Para mais informações, consulte o <a href="https://help.apple.com/developer-account/#/devb2e62b839" target="_blank">Developer Account Help</a> da Apple.

<br />