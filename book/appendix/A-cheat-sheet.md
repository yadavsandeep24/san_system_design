# Appendix A — Cheat Sheet

## Interview timebox

Clarify → Scope/NFRs → High-level → Data/API → Deep dives → Failures/trade-offs → Metrics

## Always name

1. Source of truth (local vs server)
2. Read path & write path
3. Offline behavior
4. Pagination style
5. Cache tiers + eviction
6. Auth/token refresh
7. Process death survival
8. One battery risk
9. Three metrics + kill switch

## Decision snaps

| Problem | Default lean |
|---------|----------------|
| Feed/list | Cursor + local-first |
| Chat | WS foreground + push background + outbox |
| User edits offline | Outbox + version/etag |
| Images | Size-aware decode + mem/disk LRU + cancel |
| Video | Manifest + ABR + persist position |
| Uploads | Chunked resumable + durable jobs |
| Location | Fine only when feature-active |
| Conflicts (notes) | Detect via version; merge or duplicate |
| Conflicts (likes) | Server truth reconcile |
| Search offline | Local FTS |

## Platform callouts

| Concern | Android | iOS |
|---------|---------|-----|
| BG work | WorkManager | BGAppRefresh / BGProcessing |
| Secure store | Keystore + Encrypted DataStore/Tink (not plain SharedPreferences; avoid new EncryptedSharedPreferences) | Keychain + Access Control |
| UI state | Kotlin Flow / StateFlow + coroutines | Swift async-await / `@Observable` / MainActor |
| Images | Coil/Glide patterns | Kingfisher/SDWebImage patterns |
| DB | Room | Core Data / SQLite / GRDB |
| Push | FCM | APNs |
| Location | Fused Location | Core Location |

(Libraries are optional; patterns matter more.)

## Failure checklist

- Flaky network mid-write
- Kill after local write before ack
- Token expiry mid-batch
- Clock skew
- Duplicate delivery
- Storage full
- Permission denied
- Partial sync apply

## NFR phrase bank

- “Warm cache first paint under ~1s”
- “Main thread free of decode/network/parse”
- “Idempotency key on create”
- “Push is best-effort; reconcile on foreground”
- “Budget disk media cache ~300MB LRU”

## Fintech snaps

| Topic | Default lean |
|-------|----------------|
| Payment truth | Server/PSP status; client hints only |
| Pay button | Idempotency key + UI single-flight |
| Mid-flow kill | Persist attempt; resume + poll |
| UPI intent result | Hint → always `GET` verify |
| Balance | Fresh fetch on send; short TTL + “as of” |
| Offline money | Draft/queue intent; never local “paid” |
| Amounts | Integer minor units (paise) |
| Card data | Hosted fields / PSP token; no PAN in app |
| Sensitive UI | FLAG_SECURE / secure screens |
| Pending UX | First-class `pending`/`unknown` + backoff poll |
| Saved cards | Token ids + last4 only; hosted fields to add |
| Bill pay | Fresh due `quoteId`; never pay stale amount |
| Step-up | Server-driven challenge; payment stays requires_action |
| Mandates | Approve via UPI; pre-debit notify; poll status |
| Cool-off | Server clock; client cannot skip |
| Disputes | Prefill refs; no optimistic “refunded” |
| Wallet pay | Apple/Google token → server confirm before sheet success |
| Passkeys | Challenge from server; keys in enclave; OTP fallback |

Fintech chapters: [38](../part-5-fintech/38-checkout-payment-sdk.md) · [39](../part-5-fintech/39-upi-intent-collect.md) · [40](../part-5-fintech/40-wallet-transfer.md) · [41](../part-5-fintech/41-txn-history-pending-recovery.md) · [25 catalog](../part-5-fintech/37-top-fintech-system-design.md) · [42](../part-5-fintech/42-kyc-onboarding.md) · [43](../part-5-fintech/43-qr-payments.md) · [44](../part-5-fintech/44-secure-auth-device-binding.md) · [45](../part-5-fintech/45-saved-cards-tokenization.md) · [46](../part-5-fintech/46-bill-pay.md) · [47](../part-5-fintech/47-fraud-challenge-step-up.md) · [48](../part-5-fintech/48-upi-autopay-mandates.md) · [49](../part-5-fintech/49-upi-lite.md) · [50](../part-5-fintech/50-softpos-tap-to-phone.md) · [51](../part-5-fintech/51-cross-border-remittance.md) · [52](../part-5-fintech/52-bnpl-checkout.md) · [53](../part-5-fintech/53-beneficiary-cool-off.md) · [54](../part-5-fintech/54-payment-disputes-support.md) · [55](../part-5-fintech/55-trading-watchlist-orders.md) · [56](../part-5-fintech/56-lending-apply-esign.md) · [41 Apple/Google Pay](../part-5-fintech/57-apple-google-pay.md) · [42 Passkeys](../part-5-fintech/58-passkeys-webauthn.md)
