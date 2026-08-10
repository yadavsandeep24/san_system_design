# Appendix B — Follow-up Questions

Use these to stress-test any design. Practice answering in 1–2 minutes each.

## Cross-cutting

1. App is killed 200ms after the user taps Send—what is on disk and what replays?
2. Refresh token revoked on another device—how do in-flight calls behave?
3. User enables Low Data Mode / Data Saver—what degrades first?
4. How do you migrate local schema from v3→v4 without bricking launch?
5. What is your rollout plan if the sync algorithm is wrong for 2% of users?
6. Which PII appears in logs today, and how do you prevent it?
7. How do you test flaky networks in CI or pre-release?
8. What happens when disk cache corruption is detected?

## Social feed

1. How do you prevent duplicate posts across cursor pages?
2. Liked offline on two devices with conflicting state—resolution?
3. How does ads insertion affect pagination stability?
4. Video autoplay policy on cellular and in mute-required regions?

## Chat

1. How do you detect and fill sequence gaps after WS reconnect?
2. Group chat of 500 members—what changes on client?
3. E2E encryption: where are keys stored and rotated?
4. Message edits/deletes across offline peers?

## Ride hailing

1. Driver GPS jumps 1km—how do you filter?
2. Rider backgrounded during trip on iOS/Android—tracking policy?
3. Surge / fare change after request—UX + data integrity?

## Video

1. Live stream vs VOD—what changes in buffering?
2. DRM license server down mid-playback?
3. Multiple qualities and audio tracks—selection UX?

## Offline notes

1. Why not pure LWW for note bodies?
2. How do you compact the op log?
3. Shared note ACL change while offline editor open?

## Maps

1. Clustering algorithm choice at city zoom?
2. Rate limiting Places API from a popular event venue?
3. Spoofed location attacks on “nearby check-in”?

## News

1. Breaking push storms—collapse and dedupe?
2. Paywall token expiry while offline reading saved article?
3. Personalization requiring server round-trip vs cached mix?

## Upload

1. User deletes local original before upload completes?
2. Server reassembles chunks out of order?
3. HEIC vs JPEG cross-platform consumers?

## Checkout / Payment SDK

1. Host app double-taps Pay—what guarantees one charge?
2. 3DS WebView killed mid-challenge—recovery path?
3. Why is `pending` a valid SDK callback result?
4. How do you shrink PCI scope on mobile?

## UPI

1. Intent extras say success, API says pending—what does UI show?
2. No UPI apps installed—product options?
3. Collect expires while user is offline—what happens on next launch?
4. iOS vs Android UPI handoff differences you’d call out?

## Wallet transfer

1. Why is float amount dangerous?
2. Can you optimistic-decrement balance? When is it unacceptable?
3. Daily limit enforced only on client—what’s wrong?
4. Transfer unknown for 15 minutes—UX + polling policy?

## Transaction history / pending recovery

1. How do you merge local attempts with server ledger rows?
2. Push delayed—how does UI still converge?
3. What refs do you expose to support?
4. When do you stop polling a pending payment?

## KYC

1. User kills app mid-ID upload—what is durable?
2. Why not trust on-device “liveness passed” boolean alone?
3. How do you minimize PII at rest after server ack?
4. Rejected KYC—how do you reopen only failed steps?

## QR payments

1. Static vs dynamic QR—what is editable on confirm?
2. Why never auto-pay immediately on successful scan?
3. Merchant QR expired while customer still staring—UX?
4. Offline scan of static QR—can you complete pay?

## Secure auth / device binding

1. New phone install—why re-bind and cool-off?
2. Biometric unlock vs server session—what’s the difference?
3. Refresh token revoked on another device—local behavior?
4. Root/jailbreak signal—block, step-up, or ignore?

## Saved cards / tokenization

1. What exactly is stored on device vs PSP?
2. Why might CVV still be required for a tokenized card?
3. Kill mid-add-card hosted fields—how do you converge?
4. How does device binding change one-tap pay?

## Bill pay

1. Why bind pay to `quoteId` instead of a raw amount?
2. Directory cache fresh but due stale—what breaks?
3. Reminder notification vs autopay—difference?
4. Offline: which steps are allowed?

## Fraud challenge / step-up

1. Can the client choose to skip a challenge in debug builds?
2. Payment status while OTP is pending?
3. Soft vs hard block—product examples?
4. Kill mid-challenge—resume keys?

## UPI Autopay / mandates

1. Intent/approve return success but API pending—UI?
2. Who initiates execution-day debit—app or server?
3. Pre-debit notification requirements you’d mention?
4. Pause vs revoke differences?

## UPI Lite

1. Why isn’t Lite “free offline cash”?
2. Dual-device Lite attempt—expected behavior?
3. When do you freeze Lite pays?
4. Where do Lite secrets live on device?

## SoftPOS

1. Why fail closed on attestation?
2. PIN on glass—roll your own keypad?
3. Kill mid-authorize—recovery?
4. QR fallback when?

## Remittance

1. Quote expired at confirm—UX?
2. Funding success vs payout success?
3. Compliance hold—what does UI promise?
4. New beneficiary cool-off interaction?

## BNPL

1. Why is `pending` valid for the merchant host callback?
2. Disclosure before confirm—what must appear?
3. Decline copy—what do you avoid?
4. Kill mid-decisioning—resume how?

## Beneficiary cool-off

1. Why is server time mandatory?
2. Edit account number—new cool-off?
3. Low-value allowance during cool-off—risks?
4. Out-of-band alert purpose?

## Disputes / support

1. What do you prefill from history?
2. Why never optimistic “refunded”?
3. Evidence upload killed mid-way?
4. Payment still `unknown`—dispute now or wait?

## Trading

1. Stale quote—allow market order?
2. Partial fill UX?
3. Idempotency on place order?
4. MD websocket drop—fallback?

## Lending / e-sign

1. Offer TTL expiry at accept?
2. WebView e-sign success hint vs API?
3. Draft resume after process death?
4. EMI autopay—forced or opt-in?

## Apple Pay / Google Pay

1. When is the OS sheet “success” allowed to complete?
2. What if user authorizes but server confirm times out?
3. Difference vs saved card token (Ch 29)?
4. How do you detect wallet availability on each platform?

## Passkeys (WebAuthn)

1. Passkey vs biometric app lock—what’s the difference?
2. Why must `register_begin` / `login_begin` come from server?
3. Lost device with only passkey—recovery path?
4. Can passkey replace payment status polling?

## Staff-level probes

1. Ownership boundaries between mobile, BFF, and platform teams
2. SLOs you would page a human for vs dashboards only
3. Privacy review notes you’d write for this feature
4. Cost controls: CDN egress, push volume, telemetry volume
5. Payment kill switch when PSP error rate spikes
6. Which top-12 fintech prompt from Ch 25 fits this role best—and why?
7. Which stretch chapter (32–42) matches this company’s product?
