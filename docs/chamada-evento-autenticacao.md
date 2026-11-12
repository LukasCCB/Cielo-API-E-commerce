---
updatedAt: 2025-10-30T01:03:33.000Z
agentTools:
  siteIndex: https://docs.cielo.com.br/llms.txt
  projectIndex: https://docs.cielo.com.br/ecommerce-cielo/llms.txt
---

# 5. Implementar chamada ao evento de autenticação

O evento `**bpmpi_Authenticate()**` deve ser chamado no momento de finalização do checkout (finalização da compra). Vide exemplo abaixo:

```html
<input type="button" onclick="bpmpi_authenticate()" />
```