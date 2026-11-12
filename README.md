# Cielo API E-commerce — Documentação (Markdown)

Espelho **offline e completo** da documentação oficial da **API E-commerce da
Cielo** em Markdown, empacotado como **Skill para agentes de IA** (Claude Code,
Cursor, etc.). Serve de fonte da verdade para integrar pagamentos com a Cielo
sem depender de acesso online à doc.

- **Fonte oficial:** <https://docs.cielo.com.br/ecommerce-cielo>
- **Última atualização da fonte:** `2026-11-11` (espelho capturado em `2026-11-12`)
- **Conteúdo:** 242 páginas — `docs/` (122) · `reference/` (110) · `changelog/` (10)
- **Índice completo:** [`INDEX-llms.txt`](INDEX-llms.txt)

---

## Como usar

### Como Skill (Claude Code)

```bash
# 1. Clone o repositório
git clone https://github.com/LukasCCB/Cielo-API-E-commerce.git

# 2. Mova a pasta para o diretório de skills (global ou do projeto)
#    Global:        ~/.claude/skills/cielo-ecommerce-api
#    Por projeto:   <seu-projeto>/.claude/skills/cielo-ecommerce-api
mv Cielo-API-E-commerce ~/.claude/skills/cielo-ecommerce-api
```

```text
# 3. Peça (prompt) ao agente — ele aciona a skill automaticamente:
"Implemente um pagamento com cartão de crédito usando a API E-commerce da Cielo"
"Como faço a confirmação de um Pix pela Cielo? Consulte a doc da skill."
```

A skill ([`SKILL.md`](SKILL.md)) orienta o agente a consultar primeiro o
`INDEX-llms.txt`, depois `docs/` (guias) e `reference/` (contratos de endpoint).

### Como consulta manual

Abra o [`INDEX-llms.txt`](INDEX-llms.txt), localize o tópico e abra o `.md`
correspondente em `docs/` ou `reference/`.

### Atualizar com a fonte

```powershell
pwsh ./atualizar.ps1
```

Re-baixa o índice e todas as páginas, e reporta o que mudou — inclusive novas
entradas de `changelog/`. Veja [`atualizar.ps1`](atualizar.ps1).

---

## Módulos

Cada módulo abaixo aponta para sua página na **fonte oficial**. O conteúdo
equivalente está em `docs/` e `reference/` deste repositório.

### Guias (`docs/`)

| Módulo | Fonte |
| --- | --- |
| Sobre a API E-commerce | <https://docs.cielo.com.br/ecommerce-cielo/docs/sobre-api-ecommerce> |
| Boas práticas de aprovação | <https://docs.cielo.com.br/ecommerce-cielo/docs/como-melhorar-a-performance-de-aprovacao-das-suas-transacoes> |
| Site Cielo (credenciamento) | <https://docs.cielo.com.br/ecommerce-cielo/docs/credenciamento-no-site-cielo> |
| Certificados e segurança | <https://docs.cielo.com.br/ecommerce-cielo/docs/certificado-ssl> |
| Antes da autorização (Zero Auth / BIN) | <https://docs.cielo.com.br/ecommerce-cielo/docs/consulta-bin> |
| Autenticação 3DS | <https://docs.cielo.com.br/ecommerce-cielo/docs/3ds-sobre> |
| Meios de pagamento | <https://docs.cielo.com.br/ecommerce-cielo/docs/criando-transacoes> |
| Facilitadores de pagamento | <https://docs.cielo.com.br/ecommerce-cielo/docs/facilitadores> |
| Conversor de moedas | <https://docs.cielo.com.br/ecommerce-cielo/docs/conversor-moedas-ecommerce> |
| Tokenização de cartões | <https://docs.cielo.com.br/ecommerce-cielo/docs/tokenization-types> |
| Recorrência | <https://docs.cielo.com.br/ecommerce-cielo/docs/recorrencia> |
| Retentativa | <https://docs.cielo.com.br/ecommerce-cielo/docs/retentativas> |
| Análise de fraude | <https://docs.cielo.com.br/ecommerce-cielo/docs/analise-de-fraude> |
| POST de notificação (webhook) | <https://docs.cielo.com.br/ecommerce-cielo/docs/webhook> |

### Referência da API (`reference/`)

| Módulo | Fonte |
| --- | --- |
| Arquitetura da integração | <https://docs.cielo.com.br/ecommerce-cielo/reference/sobre-a-api> |
| Códigos da API (HTTP/retorno) | <https://docs.cielo.com.br/ecommerce-cielo/reference/introapi-codes-status-http> |
| Testando em Sandbox | <https://docs.cielo.com.br/ecommerce-cielo/reference/como-usar-o-sandbox> |
| Zero Auth | <https://docs.cielo.com.br/ecommerce-cielo/reference/validar-cartao> |
| Consulta BIN | <https://docs.cielo.com.br/ecommerce-cielo/reference/consulta-bin-cartao> |
| Velocity | <https://docs.cielo.com.br/ecommerce-cielo/reference/velocity-api> |
| Cartão de crédito | <https://docs.cielo.com.br/ecommerce-cielo/reference/criar-pagamento-credito> |
| Cartão de débito | <https://docs.cielo.com.br/ecommerce-cielo/reference/debito> |
| Pix | <https://docs.cielo.com.br/ecommerce-cielo/reference/qrcode-pix> |
| Pix — nova integração | <https://docs.cielo.com.br/ecommerce-cielo/reference/de-para-pix> |
| Boleto | <https://docs.cielo.com.br/ecommerce-cielo/reference/boleto-api> |
| Voucher | <https://docs.cielo.com.br/ecommerce-cielo/reference/criar-pagamento-com-voucher> |
| Cartão multibenefícios | <https://docs.cielo.com.br/ecommerce-cielo/reference/criar-pagamento-multibeneficios> |
| Click to Pay | <https://docs.cielo.com.br/ecommerce-cielo/reference/pagamento-click-to-pay> |
| E-wallets (Apple/Google Pay) | <https://docs.cielo.com.br/ecommerce-cielo/reference/e-wallet-criptografado> |
| QRCode | <https://docs.cielo.com.br/ecommerce-cielo/reference/qr-code-api> |
| Carnê | <https://docs.cielo.com.br/ecommerce-cielo/reference/carne-api> |
| Consultas | <https://docs.cielo.com.br/ecommerce-cielo/reference/consulta-paymentid-api> |
| Conversor de moedas | <https://docs.cielo.com.br/ecommerce-cielo/reference/conversor-moedas-api> |
| Tokenização de cartões | <https://docs.cielo.com.br/ecommerce-cielo/reference/criar-cardtoken> |
| Recorrência | <https://docs.cielo.com.br/ecommerce-cielo/reference/criando-transa%C3%A7%C3%B5es-recorrentes> |
| Antifraude — ClearSale | <https://docs.cielo.com.br/ecommerce-cielo/reference/af-clearsale> |
| Antifraude — CyberSource | <https://docs.cielo.com.br/ecommerce-cielo/reference/af-cybersource> |
| Facilitadores (subcredenciadores/marketplaces) | <https://docs.cielo.com.br/ecommerce-cielo/reference/subcredenciadores-e-marketplaces> |
| Implementações específicas | <https://docs.cielo.com.br/ecommerce-cielo/reference/quasi-cash> |

---

## Changelogs (da fonte)

Mais recentes primeiro, conforme a seção *Novidades* da documentação oficial:

| Atualização | Fonte |
| --- | --- |
| TLID obrigatório para transações MIT Mastercard | <https://docs.cielo.com.br/ecommerce-cielo/changelog/tlid-obrigatorio> |
| IssuerTransactionId obrigatório para Elo | <https://docs.cielo.com.br/ecommerce-cielo/changelog/issuertransactionid-elo> |
| Julho 2026 | <https://docs.cielo.com.br/ecommerce-cielo/changelog/julho-2026> |
| Junho de 2026 | <https://docs.cielo.com.br/ecommerce-cielo/changelog/junho-2026> |
| Atualização do script 3DS | <https://docs.cielo.com.br/ecommerce-cielo/changelog/atualiza%C3%A7%C3%A3o-do-script-3ds> |
| Maio de 2026 | <https://docs.cielo.com.br/ecommerce-cielo/changelog/maio-2026> |
| Abril de 2026 | <https://docs.cielo.com.br/ecommerce-cielo/changelog/abril-2026> |
| [MAR] Atualizações na documentação | <https://docs.cielo.com.br/ecommerce-cielo/changelog/marco-2026> |
| Atualização na documentação de retornos da API | <https://docs.cielo.com.br/ecommerce-cielo/changelog/atualiza%C3%A7%C3%A3o-na-documenta%C3%A7%C3%A3o-de-retornos-da-api> |
| [FEV] Atualizações na documentação | <https://docs.cielo.com.br/ecommerce-cielo/changelog/fevereiro-2026> |

---

> Conteúdo da documentação © Cielo. Este repositório é um espelho não-oficial
> para consulta e uso com agentes de IA. Para o conteúdo canônico e sempre
> atualizado, consulte <https://docs.cielo.com.br/ecommerce-cielo>.
