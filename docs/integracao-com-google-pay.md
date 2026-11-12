---
updatedAt: 2026-10-14T14:48:40.000Z
agentTools:
  siteIndex: https://docs.cielo.com.br/llms.txt
  projectIndex: https://docs.cielo.com.br/ecommerce-cielo/llms.txt
---

# Integração com Google Pay

Nesta etapa inicial, você deverá configurar seu projeto e implementar o Google Pay em seu aplicativo Android:

### 1. Configuração do projeto

Para configurar seu projeto, siga as instruções descritas no <a href="https://developers.google.com/pay/api/android/guides/setup" target="_blank">Guia de Configuração</a> do Google Pay.\
Neste passo, você deverá **adicionar dependências** importando a biblioteca do Google Play Services ou então escolhendo as APIs que deseja compilar. Em seguida, para ativar o Google Pay no seu aplicativo Android, você deverá \*\*modificar o arquivo \_"AndroidManifest.xml"\_\*\* do seu projeto de acordo com as instruções dadas na página.

### 2. Implementação do Google Pay

Para integrar o Google Pay em seu aplicativo, siga todos os passos indicados no <a href="https://developers.google.com/pay/api/android/guides/tutorial" target="_blank">Tutorial de Implementação</a> do Google Pay.

Para a correta integração do Google Pay via Cielo, é necessário se atentar aos pontos abaixo:

#### Definição do gateway

No passo  **Step 2: Request a payment token for your payment provider**, siga o modelo indicado como **GATEWAY** e atribua o valor "PAYMENT\_GATEWAY" ao parâmetro `type` e o valor "cielo" ao parâmetro `gateway`, conforme o exemplo dado:

```json
private static JSONObject getTokenizationSpecification() {
  JSONObject tokenizationSpecification = new JSONObject();
  tokenizationSpecification.put("type", "PAYMENT_GATEWAY");
  tokenizationSpecification.put(
      "parameters",
      new JSONObject()
          .put("gateway", "cielo")
          .put("gatewayMerchantId", "exampleMerchantId"));
  return tokenizationSpecification;
}
```

Preencha o parâmetro `gatewayMerchantId` com o identificador de sua loja, gerado pelo gateway. O identificador da loja segue o formato "XXXXXXXX-XXXX-XXXX-XXXX-XXXXXXXXXXXX" (tipo *GUID* / tamanho *36*).

#### Definição das bandeiras

No passo **Step 3: Define supported payment card networks**, configure conforme as bandeiras aceitas pela *wallet*.

#### Definição do ambiente

No passo **Step 5: Create a PaymentsClient instance**, utilize o valor "WalletConstants.ENVIRONMENT\_TEST" para o ambiente de testes.

> ⚠️
>
> É recomendado que, antes de realizar os testes, o desenvolvedor se junte ao grupo específico de <a href="https://developers.google.com/pay/api/android/guides/test-and-deploy/integration-checklist?hl=pt-br" target="\_blank">usuários do Google Pay</a> para ter acesso a novos cartões de teste que são utilizados com a lista de verificação de integração do Google.

#### Definição dos Dados de Compra

No passo *"Step 7: Create a PaymentDataRequest object"*, utilize o valor "BRL" para o parâmetro `currencyCode`. O campo `merchantName` é o nome que o comprador verá durante o pagamento com Google Pay e recomendamos colocar um nome reconhecido.

#### Recuperação dos dados de pagamento

No passo **Step 9: Handle the response object**, está descrito o evento `Activity.RESULT_OK`, onde é retornado um objeto com todos os dados referentes ao dados de pagamento, inclusive o token de pagamento.

A partir do `PaymentData`, obtém-se o objeto `PaymentMethodToken`, através da chamada do método `getPaymentMethodToken()`. <a href="https://developers.google.com/android/reference/com/google/android/gms/wallet/PaymentData" target="_blank">Clique aqui</a> para mais informações.

Na sequência, deve-se obter a *string* que contém tokens de pagamento a partir do método `GetToken()` do objeto `PaymentMethodToken`. <a href="https://developers.google.com/android/reference/com/google/android/gms/wallet/PaymentMethodToken" target="_blank">Clique aqui</a> para mais informações.

A *string* obtida no passo anterior possui uma estrutura como a mostrada a seguir. <a href="https://developers.google.com/pay/api/android/guides/resources/payment-data-cryptography" target="_blank">Clique aqui</a> para mais informações.

```json
{
  "protocolVersion": "ECv1",
  "signature": "TJVA95OrM7E2cBab30RMHrHDcEfxjoYZgeFONFh7HgQ",
  "signedMessage": "{\"encryptedMessage\":
  \"ZW5jcnlwdGVkTWVzc2FnZQ==\",\"ephemeralPublicKey\":
  \"ZXBoZW1lcmFsUHVibGljS2V5\",\"tag\": \"c2lnbmF0dXJl\"}"
}
```

| Parâmetro       | Type   | Descrição               |
| --------------- | ------ | ----------------------- |
| `signedMessage` | string | Mensagem assinada.      |
| `signature`     | string | Assinatura da mensagem. |

Guarde os dados `signedMessage` e `signature`, que serão requisitados na autorização via API E-commerce Cielo.