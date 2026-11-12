---
updatedAt: 2026-03-13T11:29:29.000Z
agentTools:
  siteIndex: https://docs.cielo.com.br/llms.txt
  projectIndex: https://docs.cielo.com.br/ecommerce-cielo/llms.txt
---

# Validar cartão tokenizado com Cartão Protegido

Valida um cartão tokenizado no Zero Auth

| Ambiente | Método                                                                                                                                                                                                                  | Endpoint                                                    |
| :------- | :---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- | :---------------------------------------------------------- |
| Sandbox  | <div class="headline-container-article-info2GaOf2jMpV0r"><span class="rm-APIMethod APIMethod APIMethod_fixedWidth APIMethod_post headline-container-api-method1Hc-Fm7uaccR" data-testid="http-method">post</span></div> | `https://apisandbox.cieloecommerce.cielo.com.br/1/zeroauth` |
| Produção | <div class="headline-container-article-info2GaOf2jMpV0r"><span class="rm-APIMethod APIMethod APIMethod_fixedWidth APIMethod_post headline-container-api-method1Hc-Fm7uaccR" data-testid="http-method">post</span></div> | `https://api.cieloecommerce.cielo.com.br/1/zeroauth`        |

### Requisição

```json
{
  "CardToken": "23712c39-bb08-4030-86b3-490a223a8cc9",
  "SaveCard": "false",
  "Brand": "Visa"
}
```

**Parâmetros da requisição**:

<Table align={["left","left","left","left","center"]}>
  <thead>
    <tr>
      <th style={{ textAlign: "left" }}>
        Parâmetro
      </th>

      <th style={{ textAlign: "left" }}>
        Descrição
      </th>

      <th style={{ textAlign: "left" }}>
        Tipo
      </th>

      <th style={{ textAlign: "left" }}>
        Tamanho
      </th>

      <th style={{ textAlign: "center" }}>
        Obrigatório
      </th>
    </tr>
  </thead>

  <tbody>
    <tr>
      <td style={{ textAlign: "left" }}>
        `Brand`
      </td>

      <td style={{ textAlign: "left" }}>
        Bandeira do cartão. Valores possíveis:<br />
        Visa<br />
        Master
      </td>

      <td style={{ textAlign: "left" }}>
        Texto
      </td>

      <td style={{ textAlign: "left" }}>
        10
      </td>

      <td style={{ textAlign: "center" }}>
        Não
      </td>
    </tr>

    <tr>
      <td style={{ textAlign: "left" }}>
        `CardToken`
      </td>

      <td style={{ textAlign: "left" }}>
        Token do cartão na 3.0
      </td>

      <td style={{ textAlign: "left" }}>
        GUID
      </td>

      <td style={{ textAlign: "left" }}>
        36
      </td>

      <td style={{ textAlign: "center" }}>
        Condicional
      </td>
    </tr>
  </tbody>
</Table>

<br />