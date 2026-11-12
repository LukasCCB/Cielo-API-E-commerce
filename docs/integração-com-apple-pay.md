---
updatedAt: 2026-10-14T14:48:39.000Z
agentTools:
  siteIndex: https://docs.cielo.com.br/llms.txt
  projectIndex: https://docs.cielo.com.br/ecommerce-cielo/llms.txt
---

# Integração com Apple Pay

A disponibilização da opção de pagamento com Apple Pay depende da integração com a carteira digital. Recomendamos que siga as orientações disponíveis no site de <a href="https://developer.apple.com/documentation" target="_blank">Documentação da Apple</a> para a implementação.

No final da integração com a Apple, você receberá um JSON contendo dois campos necessários para seguir a transação com a API E-commerce Cielo. São os campos `paymentData.data` e `ephemeralPublicKey.header.EphemeralPublicKey`:

```json
{
  "applePayData": {
    "paymentData": {
      "version": "EC_v1",
      "data": "as01vRj+n9crY2vome7zc+u7Tz0+qg2La/8IUHpJIjFN6ThhUqLnSrskQHTrEbcYPiMksFK0+ddo9sZu70uJQJH1I+44N6PrVhilNDem97vOXq2VYDXiVJ27F/Q9wGQDgZBeGcZ6Pml9SIelHqUauBcQoOatrlnWPUL8kbdpT8WqgzXyaCh7oeTz=z6++rp/ofjvSjnGtOqAUsnrzvw4uzkcyKUSsfROdJ6B/Xzgu/T9fMIr5UxXD2DPF1SNh3ydEJABKz4HFjDW7ObvbQeua4GYxJdpQLpI3NgUbJy91E/LOyb/+PcCtO+0=a41tBrfnTTF9qsPuCIw8HWIEEKSRofn27NTofxev/i+nHEfqEtqNrN/epIvhzceD/gDiGetfiLKMzf94ARmpWUAMC==",
      "signature": "(…)",
      "header": {
        "ephemeralPublicKey": "MFkwEwZJKoZIzj0CAQYIKo12zj0DAQcDQgAEo+ReGClSmQ4hDJD1yh9nci3V4l7kPm2AQtKZMMvuNS0iK5sn/1A9l3kw1B1xCqOycZmnPSng7p5hpTvrei1BCA==",
        "publicKeyHash": "KXN06+BtJu6yEfF9zDhr7f4M/2HwVybnx0FGfC520gB=",
        "transactionId": "71c5b61c3791546e94d2b4893a6c69aaac2ab86b5c113c83a7d89057906a9b5f"
      }
    },
    "paymentMethod": {
      "displayName": "MasterCard 1212",
      "network": "MasterCard",
      "type": "credit"
    },
    "transactionIdentifier": "81C5B61C3791646E94D2B4893A6C69BBBC2AB86B5C363C83A7D89057906A9BAC"
  },
  "x_document": "24562608994",
  "x_name": "João da Silva"
}
```

> ⚠️ Atenção
>
> Durante a implementação da Apple, haverá uma referência ao certificado ".CER" para criptografar os dados durante a comunicação com a Apple. No fluxo de integração **não implemente** o processo de descriptografia dos dados retornados pela Apple pois esse trabalho é feito pela API E-commerce Cielo.