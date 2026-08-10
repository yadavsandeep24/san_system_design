# Appendix C — Evaluation Rubric

Score mocks 1–5 in each row. Senior target: ≥4 average with no 1s. Staff target: ≥4 with explicit failure/rollout depth.

## Rubric

| Dimension | 1 | 3 | 5 |
|-----------|---|---|---|
| Structure & timeboxing | Jumps randomly | Covers main phases unevenly | Clear agenda; finishes with summary |
| Requirements & scope | Accepts vague prompt | Some cuts | Crisp MVP + out-of-scope + NFRs |
| Mobile constraints | Ignores device/OS | Mentions offline or battery | Memory, lifecycle, BG, battery woven in |
| Architecture clarity | Blurry boxes | Layered sketch | Clean layers; ownership of truth |
| Data & API | Hand-wavy | Basic models | Entities, cursors, idempotency, local schema |
| Deep dive quality | Shallow | One solid dive | 2–3 dives with mechanisms |
| Failure modes | None | A few | Kill, flaky net, auth, conflicts |
| Trade-offs | Lists tools | One alternative | Alternatives with costs |
| Observability / rollout | Absent | Metrics named | Metrics + flags + migration |
| Communication | Hard to follow | Mostly clear | Decisive, collaborative, precise |
| Fintech correctness* | Optimistic paid / no idempotency | Mentions retry | Server truth, idempotency, pending/unknown, resume |

\*Use the **Fintech** row for any money, wallet, UPI, KYC, QR, auth/bind, saved cards, bill pay, fraud step-up, mandates, remittance, BNPL, disputes, trading orders, lending, Apple/Google Pay, or passkey-in-fintech prompts.

## Fintech prompt → chapter map (for scoring)

| Prompt type | Model chapter(s) |
|-------------|------------------|
| Checkout / Payment SDK | [21](../part-3-model-solutions/21-checkout-payment-sdk.md) |
| UPI intent / collect | [22](../part-3-model-solutions/22-upi-intent-collect.md) |
| Wallet P2P transfer | [23](../part-3-model-solutions/23-wallet-transfer.md) |
| History / pending recovery | [24](../part-3-model-solutions/24-txn-history-pending-recovery.md) |
| Fintech catalog / pick mock | [25](../part-3-model-solutions/25-top-fintech-system-design.md) |
| KYC onboarding | [26](../part-3-model-solutions/26-kyc-onboarding.md) |
| QR pay | [27](../part-3-model-solutions/27-qr-payments.md) |
| Auth + device binding | [28](../part-3-model-solutions/28-secure-auth-device-binding.md) |
| Saved cards / tokenization | [29](../part-3-model-solutions/29-saved-cards-tokenization.md) |
| Bill pay | [30](../part-3-model-solutions/30-bill-pay.md) |
| Fraud / step-up | [31](../part-3-model-solutions/31-fraud-challenge-step-up.md) |
| UPI Autopay / mandates | [32](../part-3-model-solutions/32-upi-autopay-mandates.md) |
| UPI Lite | [33](../part-3-model-solutions/33-upi-lite.md) |
| SoftPOS / tap-to-phone | [34](../part-3-model-solutions/34-softpos-tap-to-phone.md) |
| Cross-border remittance | [35](../part-3-model-solutions/35-cross-border-remittance.md) |
| BNPL checkout | [36](../part-3-model-solutions/36-bnpl-checkout.md) |
| Beneficiary cool-off | [37](../part-3-model-solutions/37-beneficiary-cool-off.md) |
| Disputes / support | [38](../part-3-model-solutions/38-payment-disputes-support.md) |
| Trading watchlist + orders | [39](../part-3-model-solutions/39-trading-watchlist-orders.md) |
| Lending apply + e-sign | [40](../part-3-model-solutions/40-lending-apply-esign.md) |
| Apple Pay / Google Pay | [41](../part-3-model-solutions/41-apple-google-pay.md) |
| Passkeys (WebAuthn) | [42](../part-3-model-solutions/42-passkeys-webauthn.md) |

## Fintech correctness anchors (what 4 vs 5 looks like)

| Score | Signals |
|-------|---------|
| **1** | Shows “Paid” from UPI extras, WebView, wallet sheet, or push alone; no idempotency |
| **2** | Mentions server check but still optimistic UI; ignores kill mid-pay |
| **3** | Server truth + retry; weak on `unknown`/poll or PCI/wallet token boundary |
| **4** | Idempotency, pending/unknown, resume, minor units, step-up/FLAG_SECURE when relevant |
| **5** | Above + explicit forbidden table, metrics, kill switch, merge local/server (Ch 24 pattern) |

## Scoring worksheet

```text
Candidate: __________  Prompt: __________  Chapter ref: __________  Date: __________

Structure:     /5
Requirements:  /5
Constraints:   /5
Architecture:  /5
Data/API:      /5
Deep dives:    /5
Failures:      /5
Trade-offs:    /5
Observability: /5
Communication: /5
Fintech*:      /5   (*Ch 21–42 money/auth prompts — see map above)

Total: /50 or /55

Notes (strengths):
-

Notes (gaps):
-

Hiring signal: lean hire / hold / no
```

## Facilitation tips

- Interrupt only to redirect scope, not to lecture
- Ask one failure question if candidate never volunteers (“kill mid-UPI”, “wallet authorized but API timeout”)
- Save staff probes for final 8–10 minutes
- Prefer depth on sync/money truth over naming SDKs (Coil, Stripe SDK version, etc.)

## Self-mock protocol

1. Draw on paper/whiteboard; start timer 45:00
2. Speak aloud even alone
3. Photo the board; score with this rubric same day
4. Redo the weakest dimension next session
5. For fintech: re-run if **Fintech ≤3** even when average looks fine

## Hire signal quick reference

| Level | Fintech row | Overall avg |
|-------|-------------|-------------|
| Strong senior | ≥4 every mock | ≥4.0, no 1s |
| Hire | ≥3 | ≥3.5 |
| Hold | ≤2 on money truth | any |
| Staff lean | 5 on failures + observability | ≥4.2 + capstone drills (see README mock day) |
