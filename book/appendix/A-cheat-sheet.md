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

Fintech chapters: [21](../part-3-model-solutions/21-checkout-payment-sdk.md) · [22](../part-3-model-solutions/22-upi-intent-collect.md) · [23](../part-3-model-solutions/23-wallet-transfer.md) · [24](../part-3-model-solutions/24-txn-history-pending-recovery.md) · [25 catalog](../part-3-model-solutions/25-top-fintech-system-design.md) · [26](../part-3-model-solutions/26-kyc-onboarding.md) · [27](../part-3-model-solutions/27-qr-payments.md) · [28](../part-3-model-solutions/28-secure-auth-device-binding.md) · [29](../part-3-model-solutions/29-saved-cards-tokenization.md) · [30](../part-3-model-solutions/30-bill-pay.md) · [31](../part-3-model-solutions/31-fraud-challenge-step-up.md) · [32](../part-3-model-solutions/32-upi-autopay-mandates.md) · [33](../part-3-model-solutions/33-upi-lite.md) · [34](../part-3-model-solutions/34-softpos-tap-to-phone.md) · [35](../part-3-model-solutions/35-cross-border-remittance.md) · [36](../part-3-model-solutions/36-bnpl-checkout.md) · [37](../part-3-model-solutions/37-beneficiary-cool-off.md) · [38](../part-3-model-solutions/38-payment-disputes-support.md) · [39](../part-3-model-solutions/39-trading-watchlist-orders.md) · [40](../part-3-model-solutions/40-lending-apply-esign.md) · [41 Apple/Google Pay](../part-3-model-solutions/41-apple-google-pay.md) · [42 Passkeys](../part-3-model-solutions/42-passkeys-webauthn.md)
