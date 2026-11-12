---
name: cielo-ecommerce-api
description: >-
  Documentação completa e offline da API E-commerce da Cielo (gateway de
  pagamentos brasileiro). Use SEMPRE que o usuário quiser integrar, consultar,
  implementar ou depurar pagamentos com a Cielo E-commerce: cartão de crédito e
  débito, Pix, boleto, voucher/multibenefícios, QRCode, carnê, e-wallets
  (Apple Pay / Google Pay), Click to Pay, tokenização de cartões, recorrência,
  retentativa, Zero Auth, Consulta BIN, autenticação 3DS, análise de fraude
  (ClearSale/CyberSource), facilitadores/subcredenciadores/marketplaces e
  webhooks (POST de notificação). Dispara mesmo sem citar "Cielo" quando o
  contexto for claramente integração de pagamento com essa API (headers
  MerchantId/MerchantKey, endpoints /1/sales, apisandbox.cieloecommerce...).
---

# API E-commerce Cielo — base de conhecimento offline

Espelho em Markdown da documentação oficial da **API E-commerce Cielo**
(`https://docs.cielo.com.br/ecommerce-cielo`). Use estes arquivos locais como
fonte da verdade antes de escrever ou revisar qualquer código de integração.

## Como navegar (faça nesta ordem)

1. **`INDEX-llms.txt`** — índice de TODAS as páginas, agrupado por módulo, com a
   descrição de cada uma. Comece aqui para localizar o tópico certo.
2. **`docs/`** — guias conceituais e de implementação (quando/como usar cada
   recurso, boas práticas, fluxos). 122 páginas.
3. **`reference/`** — referência técnica dos endpoints: request, response,
   campos, códigos de status/retorno e exemplos. 110 páginas. É aqui que estão
   os contratos exatos de cada chamada.
4. **`changelog/`** — mudanças recentes da fonte.

> Prefira `grep`/busca nos arquivos a adivinhar. Cada arquivo tem o mesmo slug
> da URL oficial — a página online de qualquer arquivo é
> `https://docs.cielo.com.br/ecommerce-cielo/<docs|reference>/<slug>` (sem `.md`).

## Fundamentos da integração (confirmados na doc)

**Autenticação** — toda requisição usa dois headers:
`MerchantId` (GUID da loja) e `MerchantKey` (chave secreta). Trate a
`MerchantKey` como segredo: nunca faça commit, log ou exponha em cliente.

**Endpoints base:**

| Ambiente | Transações (POST/PUT) | Consultas (GET) |
| --- | --- | --- |
| Sandbox | `https://apisandbox.cieloecommerce.cielo.com.br` | `https://apiquerysandbox.cieloecommerce.cielo.com.br` |
| Produção | `https://api.cieloecommerce.cielo.com.br` | `https://apiquery.cieloecommerce.cielo.com.br` |

Criação de transação: `POST /1/sales`. Consulta: `GET /1/sales/{PaymentId}`.
Captura/cancelamento: `PUT /1/sales/{PaymentId}/capture|void`.
Confira sempre o path e o corpo exatos em `reference/`.

## Regras de segurança obrigatórias (PCI / LGPD)

- **Nunca** persista nem logue PAN (número do cartão) ou CVV/CVV2. Para compras
  futuras use **tokenização** (`docs/tokenization-types`, `reference/criar-cardtoken`).
- Use HTTPS/TLS e valide os certificados (`docs/certificado-ssl`).
- Trate `MerchantId`/`MerchantKey` como credenciais secretas (variáveis de
  ambiente / cofre, nunca em código versionado).
- Só libere o pedido após confirmação real do pagamento — para Pix e boleto a
  confirmação chega de forma assíncrona (webhook / consulta), não na resposta
  da criação. Veja `docs/webhook` (POST de notificação).

## Mapa rápido de módulos

- **Meios de pagamento:** `reference/criar-pagamento-credito`, `.../debito`,
  Pix (`reference/qrcode-pix`, `reference/de-para-pix`), boleto
  (`reference/boleto-api`), voucher/multibenefícios, QRCode, carnê, e-wallets,
  Click to Pay.
- **Antes da autorização:** Zero Auth (`reference/validar-cartao`), Consulta BIN
  (`reference/consulta-bin-cartao`), velocity.
- **3DS (autenticação):** `docs/3ds-sobre` e correlatos.
- **Tokenização / recorrência / retentativa:** `docs/recorrencia`,
  `docs/retentativas`, `reference/criar-cardtoken`.
- **Antifraude:** ClearSale (`reference/af-clearsale`), CyberSource
  (`reference/af-cybersource`).
- **Facilitadores:** subcredenciadores e marketplaces
  (`reference/subcredenciadores-e-marketplaces`).
- **Códigos:** `reference/introapi-codes-status-http` (HTTP e códigos de retorno).
- **Sandbox:** `reference/como-usar-o-sandbox`.

## Manter atualizado

A doc muda com frequência. Para re-sincronizar com a fonte oficial, rode o
script na raiz (ver `README.md`):

```powershell
pwsh ./atualizar.ps1
```

Ele re-baixa o índice e todas as páginas e informa o que mudou, inclusive novas
entradas de `changelog/`.
