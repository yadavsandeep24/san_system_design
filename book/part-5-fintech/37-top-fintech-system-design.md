# 37 — Top Fintech Mobile System Design Problems

## Goal

A ranked shortlist of **mobile** system design prompts that show up for payments, banking, wallets, and India fintech roles in 2025–2026—plus what “good” deep-dives look like.

Use this chapter to pick mocks. Full walkthroughs: **Ch 38–41 and 42–58**.

## Ranking criteria

| Weight | Signal |
|--------|--------|
| High | Correctness under flaky networks (money safety) |
| High | Regulatory / PCI / RBI-shaped client constraints |
| High | Common in India fintech + global checkout interviews |
| Med | Appears in neobank / trading / lending mobile rounds |
| Low | Pure backend ledger/NPCI scale without client design |

## Top 12 (practice in this order for fintech roles)

| Rank | Prompt | Why it matters | Primary deep dives | Full chapter |
|------|--------|----------------|--------------------|--------------|
| 1 | Checkout / Payment SDK | Core product surface; PCI boundary | State machine, idempotency, 3DS, pending | [38](38-checkout-payment-sdk.md) |
| 2 | UPI intent + collect | India default rail | Intent hint≠truth, poll, no-app path | [39](39-upi-intent-collect.md) |
| 3 | Wallet transfer (P2P) | Ledger UX on device | Balance freshness, step-up, minor units | [40](40-wallet-transfer.md) |
| 4 | Txn history + pending recovery | Where flaky payments converge | Merge local/server, poller, refs | [41](41-txn-history-pending-recovery.md) |
| 5 | KYC / identity onboarding | Regulated funnel every neobank needs | Doc capture, upload, resume, PII | [42](42-kyc-onboarding.md) |
| 6 | QR pay (payer + merchant show) | High-frequency retail UX | Parse, amount confirm, offline QR limits | [43](43-qr-payments.md) |
| 7 | Secure auth + device binding | Session, SIM/device bind, step-up | Binding, biometric vault, revoke | [44](44-secure-auth-device-binding.md) |
| 8 | Saved cards / tokenization | Recurring checkout | Network tokens, CVV/3DS, one-tap bind | [45](45-saved-cards-tokenization.md) |
| 9 | Bill pay / biller list | BBPS-style product common in India | Directory cache, due quoteId, pay rail | [46](46-bill-pay.md) |
| 10 | Fraud challenge / step-up | Risk engine drives mobile UX | Challenge types, hard vs soft block | [47](47-fraud-challenge-step-up.md) |
| 11 | In-app support for payments | Ops reality | Prefill refs, evidence, case states | [54](54-payment-disputes-support.md) |
| 12 | Statements / PDF export | Trust + compliance UX | Background download, encryption at rest | Tie [Ch 25](../part-3-consumer-apps/25-photo-camera-upload.md) + [history](41-txn-history-pending-recovery.md) |

## Extended track (staff / top-company stretch)

| Prompt | Full chapter |
|--------|--------------|
| UPI Autopay / mandates | [48](48-upi-autopay-mandates.md) |
| UPI Lite / low-value offline-ish | [49](49-upi-lite.md) |
| SoftPOS / tap-to-phone | [50](50-softpos-tap-to-phone.md) |
| Cross-border remittance | [51](51-cross-border-remittance.md) |
| BNPL at checkout | [52](52-bnpl-checkout.md) |
| Beneficiary cool-off | [53](53-beneficiary-cool-off.md) |
| Trading watchlist + orders | [55](55-trading-watchlist-orders.md) |
| Lending apply + e-sign | [56](56-lending-apply-esign.md) |
| Apple Pay / Google Pay | [57](57-apple-google-pay.md) |
| Passkeys (WebAuthn) | [58](58-passkeys-webauthn.md) |

## Universal fintech checklist (say every time)

1. **Source of truth** = server (and PSP/NPCI), not UI.
2. **Idempotency key** on every money create.
3. **States:** `created → requires_action → processing → succeeded|failed|unknown`.
4. **Kill mid-flow** → durable attempt + resume/poll.
5. **Amounts** in integer minor units.
6. **Step-up** above threshold; FLAG_SECURE on sensitive screens.
7. **No PAN/CVV** in app memory when avoidable (hosted fields).
8. **Metrics:** funnel to terminal, unknown age, double-submit blocked.
9. **Kill switch** per rail via remote config.
10. **Support refs** visible (paymentId, UTR/RRN).

## Architecture pattern that repeats

```mermaid
flowchart LR
  ui[UI] --> intent[Create_Intent_Idempotent]
  intent --> local[(Durable_Attempt)]
  local --> rail[Rail_UPI_Card_Wallet]
  rail --> verify[Server_Verify_Poll]
  verify --> ui
```

## Mock matrix (2 weeks fintech)

| Day | Mock A | Mock B |
|-----|--------|--------|
| 1 | Checkout SDK | Pending recovery |
| 2 | UPI intent | UPI collect |
| 3 | Wallet send | Balance freshness debate |
| 4 | KYC | QR payer |
| 5 | Device binding | Saved cards |
| 6 | Bill pay | Fraud challenge |
| 7 | Mandates | Beneficiary cool-off |
| 8 | Remittance **or** BNPL | SoftPOS **or** Lite |
| 9 | Disputes support | Trading **or** Lending |
| 10 | Full path: QR → UPI → history | Kill mid-UPI drill |
| 11 | Staff: kill switches + metrics | Cross-rail unknown states |
| 12–14 | Weakest two chapters again | Appendix C scored mocks |

## How this differs from consumer apps

| Consumer default | Fintech default |
|------------------|-----------------|
| Optimistic success | Processing until server ack |
| Local-first truth | Server-first for balances/txns |
| Long disk cache | Short TTL on money reads |
| Push as truth | Push as wake-up to fetch |
| Offline edit freely | Offline draft; careful send queue |

## Checkpoint

If you can run Ch **21→22→24** as one story (start pay, leave to UPI, kill app, reopen, land terminal status in history) **and** defend Ch **29–31** follow-ups, you are interview-ready for most mobile fintech SD rounds. Add **32–42** for staff / specialist loops.

## Related full solutions

| Ch | File |
|----|------|
| 21 | [Checkout / Payment SDK](38-checkout-payment-sdk.md) |
| 22 | [UPI Intent and Collect](39-upi-intent-collect.md) |
| 23 | [Wallet Transfer](40-wallet-transfer.md) |
| 24 | [Txn History + Pending Recovery](41-txn-history-pending-recovery.md) |
| 26 | [KYC Onboarding](42-kyc-onboarding.md) |
| 27 | [QR Payments](43-qr-payments.md) |
| 28 | [Secure Auth + Device Binding](44-secure-auth-device-binding.md) |
| 29 | [Saved Cards / Tokenization](45-saved-cards-tokenization.md) |
| 30 | [Bill Pay](46-bill-pay.md) |
| 31 | [Fraud Challenge / Step-up](47-fraud-challenge-step-up.md) |
| 32 | [UPI Autopay / Mandates](48-upi-autopay-mandates.md) |
| 33 | [UPI Lite](49-upi-lite.md) |
| 34 | [SoftPOS / Tap-to-Phone](50-softpos-tap-to-phone.md) |
| 35 | [Cross-border Remittance](51-cross-border-remittance.md) |
| 36 | [BNPL at Checkout](52-bnpl-checkout.md) |
| 37 | [Beneficiary Cool-off](53-beneficiary-cool-off.md) |
| 38 | [Payment Disputes / Support](54-payment-disputes-support.md) |
| 39 | [Trading Watchlist + Orders](55-trading-watchlist-orders.md) |
| 40 | [Lending Apply + E-sign](56-lending-apply-esign.md) |
| 41 | [Apple Pay / Google Pay](57-apple-google-pay.md) |
| 42 | [Passkeys (WebAuthn)](58-passkeys-webauthn.md) |
