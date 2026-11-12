---
updatedAt: 2025-11-11T17:37:53.000Z
agentTools:
  siteIndex: https://docs.cielo.com.br/llms.txt
  projectIndex: https://docs.cielo.com.br/ecommerce-cielo/llms.txt
---

# Cartões de teste para a autenticação 3DS

Use os **cartões de teste** a seguir para simular diversos cenários no ambiente **sandbox**.

## Cartões de teste para 3DS padrão

### Cartões de teste com desafio

<Table align={["left","left","left","left"]}>
  <thead>
    <tr>
      <th style={{ textAlign: "left" }}>
        **CARTÃO**
      </th>

      <th style={{ textAlign: "left" }}>
        **BANDEIRA**
      </th>

      <th style={{ textAlign: "left" }}>
        **RESULTADO**
      </th>

      <th style={{ textAlign: "left" }}>
        **CENÁRIO**
      </th>
    </tr>
  </thead>

  <tbody>
    <tr>
      <td style={{ textAlign: "left" }}>
        4000000000002503<br />
        5200000000002151<br />
        6505290000002190
      </td>

      <td style={{ textAlign: "left" }}>
        VISA  
        MASTER  
        ELO
      </td>

      <td style={{ textAlign: "left" }}>
        SUCCESS
      </td>

      <td style={{ textAlign: "left" }}>
        Autenticação com desafio e portador autenticado com sucesso.
      </td>
    </tr>

    <tr>
      <td style={{ textAlign: "left" }}>
        4000000000002370<br />
        5200000000002490  
        6505290000002208
      </td>

      <td style={{ textAlign: "left" }}>
        VISA  
        MASTER  
        ELO
      </td>

      <td style={{ textAlign: "left" }}>
        FAILURE
      </td>

      <td style={{ textAlign: "left" }}>
        Autenticação com desafio e portador autenticado com falha.
      </td>
    </tr>

    <tr>
      <td style={{ textAlign: "left" }}>
        4000000000002420  
        5200000000002664  
        6505290000002257
      </td>

      <td style={{ textAlign: "left" }}>
        VISA  
        MASTER  
        ELO
      </td>

      <td style={{ textAlign: "left" }}>
        UNENROLLED
      </td>

      <td style={{ textAlign: "left" }}>
        Autenticação com desafio indisponível no momento.
      </td>
    </tr>

    <tr>
      <td style={{ textAlign: "left" }}>
        4000000000002644  
        5200000000002656  
        6505290000002265
      </td>

      <td style={{ textAlign: "left" }}>
        VISA  
        MASTER  
        ELO
      </td>

      <td style={{ textAlign: "left" }}>
        ERROR
      </td>

      <td style={{ textAlign: "left" }}>
        Erro de sistema durante a etapa de autenticação.
      </td>
    </tr>
  </tbody>
</Table>

### Cartões de teste sem desafio

<Table align={["left","left","left","left"]}>
  <thead>
    <tr>
      <th>
        **CARTÃO**
      </th>

      <th>
        **BANDEIRA**
      </th>

      <th>
        **RESULTADO**
      </th>

      <th>
        **CENÁRIO**
      </th>
    </tr>
  </thead>

  <tbody>
    <tr>
      <td>
        4000000000002701<br />
        5200000000002235<br />
        6505290000002000
      </td>

      <td>
        VISA  
        MASTER  
        ELO
      </td>

      <td>
        SUCCESS
      </td>

      <td>
        Autenticação sem desafio e portador autenticado com sucesso.
      </td>
    </tr>

    <tr>
      <td>
        4000000000002925  
        5200000000002276  
        6505290000002018
      </td>

      <td>
        VISA  
        MASTER  
        ELO
      </td>

      <td>
        FAILURE
      </td>

      <td>
        Autenticação sem desafio e portador autenticado com falha.
      </td>
    </tr>
  </tbody>
</Table>

## Cartões de teste para 3DS Data Only

### Cartões de teste sem desafio

| Bandeira   | Cartão           |
| ---------- | ---------------- |
| Mastercard | 5200000000002805 |
| Visa       | 4000000000002024 |

> Os testes para 3DS Data Only são realizados sem a apresentação de desafio.