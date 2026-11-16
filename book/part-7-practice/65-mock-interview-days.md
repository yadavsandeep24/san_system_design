# 65 — Mock Interview Days

Three timed mock days. Each one is a full practice loop: prompts read aloud, a clock, interruptions, and scoring with the [Appendix C rubric](../appendix/C-rubric.md). Do them on paper or a whiteboard, **out loud**, ideally with a partner playing interviewer. Prompts without model answers for extra reps are in [Ch 66](66-practice-prompts.md).

| Mock day | When | Blocks |
|----------|------|--------|
| [1 — Generalist mobile](#mock-day-1-generalist-mobile) | Any mobile SD loop, 1–2 weeks out | Consumer app · offline feature · platform deep dive · rapid-fire |
| [2 — Libraries and SDKs](#mock-day-2-libraries-and-sdks) | Android/iOS library-heavy loops | Library API design · second library · platform constraints |
| [3 — Top fintech](#mock-day-3-top-fintech-1-day-intensive) | Payments / fintech loops | Checkout SDK · UPI · cross-rail capstone · staff rapid-fire |

**Stack choice:** before each block, decide the stack you're answering for (native, Flutter or React Native) and say it. Every block's scoring includes "names the platform-specific constraint that changes the design" (background work, push, native modules) — see [Ch 05](../part-2-building-blocks/05-platforms-android-ios-flutter-react-native.md).

---

## Mock day 1: Generalist mobile

**Total:** ~3.5 hours + scoring.

| Block | Time | Prompt | Reference |
|-------|------|--------|-----------|
| **1 — Consumer app** | 45 min | "Design the home feed of a social app: infinite scroll, images and video, likes, offline viewing." | [Ch 18](../part-3-consumer-apps/18-social-feed.md) |
| *Break* | 10 min | — | — |
| **2 — Offline-first** | 45 min | "Design a notes app that works fully offline and syncs across a phone and a tablet." | [Ch 22](../part-3-consumer-apps/22-offline-notes.md), [Ch 31](../part-4-libraries-and-sdks/31-data-sync-library.md) |
| *Lunch* | — | — | — |
| **3 — Realtime** | 45 min | "Design one-to-one and group chat with delivery receipts and push notifications." | [Ch 19](../part-3-consumer-apps/19-messaging-chat.md), [Ch 33](../part-4-libraries-and-sdks/33-push-notification-system.md) |
| **4 — Rapid-fire** | 20 min | Six probes below, 2–3 min each | Part 2 |
| **Score** | 30 min | Appendix C for blocks 1–3 | [Appendix C](../appendix/C-rubric.md) |

**Interviewer interrupts (pick two per block):**

1. "The user scrolls very fast on a low-end Android phone. What drops frames first, and what do you change?"
2. "The app was killed while a post was uploading. What does the user see on relaunch?"
3. "How does this change if we're a React Native app?" / "…a Flutter app?"
4. "iOS won't run your periodic sync. How do you keep data fresh?"
5. "Two devices edited the same note offline. Walk me through the merge."

**Rapid-fire probes:** (1) memory cache sizing for images; (2) cursor vs offset pagination; (3) what a push payload may and may not contain; (4) foreground vs background socket policy; (5) how you roll out a risky change; (6) one accessibility requirement for this screen.

**Pass bar:** average ≥ 3.5 on the rubric; each block names at least one platform-specific constraint and one failure mode **unprompted**.

---

## Mock day 2: Libraries and SDKs

**Total:** ~2.5 hours + scoring. Library rounds reward API design and constraints, not screens.

| Block | Time | Prompt | Reference |
|-------|------|--------|-----------|
| **1 — Library** | 45 min | "Design an image loading library used by every team in the app." | [Ch 28](../part-4-libraries-and-sdks/28-image-loading-library.md) |
| *Break* | 10 min | — | — |
| **2 — SDK with backend** | 45 min | "Design an analytics SDK: typed events, batching, offline, consent." | [Ch 29](../part-4-libraries-and-sdks/29-analytics-sdk.md) |
| **3 — Constraints round** | 30 min | "Our file downloader must keep downloading after the app is closed, on Android and iOS, and expose a Flutter and React Native API." | [Ch 36](../part-4-libraries-and-sdks/36-file-downloader-library.md), [Ch 14](../part-2-building-blocks/14-sdk-and-library-design.md) |
| **Score** | 20 min | Appendix C + checklist below | — |

**Library checklist (tick ≥ 7/9):**

- [ ] One explicit `initialize(config)` with safe defaults
- [ ] Thread-safety contract stated
- [ ] Typed results / errors, no exceptions crossing the boundary
- [ ] Bounded memory and disk; trims under pressure
- [ ] Uses the host's HTTP client / respects host config
- [ ] Persistence for anything that must survive process death
- [ ] OS scheduler for background work (WorkManager / BGTask / background URLSession)
- [ ] Versioning + remote kill switch / minimum version
- [ ] Cross-platform story: native core, thin Flutter / RN wrappers

---

## Mock day 3: Top fintech (1 day intensive)

Use this when you are **1–2 weeks from interviews** at top fintechs (PhonePe, Razorpay, Paytm, neobanks, checkout SDK teams). Total time: **~4 hours** + scoring. Do it on paper/whiteboard; **speak aloud**.

**Prep:** skim [Appendix A](../appendix/A-cheat-sheet.md) fintech snaps + [Ch 37 checklist](../part-5-fintech/37-top-fintech-system-design.md). Have [Appendix C](../appendix/C-rubric.md) open to score each block.

### Schedule

| Block | Time | Prompt | Reference chapter |
|-------|------|--------|-------------------|
| **1 — Core rail** | 45 min | “Design a mobile checkout / payment SDK for merchant apps (card + UPI + wallet).” | [Ch 38](../part-5-fintech/38-checkout-payment-sdk.md) |
| *Break* | 10 min | — | — |
| **2 — India rail** | 45 min | “Design UPI intent pay + collect in a payer app.” | [Ch 39](../part-5-fintech/39-upi-intent-collect.md) |
| *Lunch* | — | — | — |
| **3 — Cross-rail capstone** | 60 min | See script below | [Ch 43→39→41→54](../part-5-fintech/43-qr-payments.md) |
| *Break* | 10 min | — | — |
| **4 — Staff rapid-fire** | 20 min | Interviewer asks 6 probes (below) | Ch 37 + weakest block |
| **Score & debrief** | 30 min | Fill Appendix C for blocks 1–3 | [Appendix C](../appendix/C-rubric.md) |

**Optional swap (Razorpay / global checkout focus):** replace Block 2 with **Apple Pay / Google Pay** — “Design wallet pay with server confirm before OS sheet success” ([Ch 57](../part-5-fintech/57-apple-google-pay.md)), or **saved cards** ([Ch 45](../part-5-fintech/45-saved-cards-tokenization.md)).

---

### Block 1 — Core rail (45 min): Checkout SDK

**Prompt (read aloud):**  
*“You are designing a mobile Payment SDK embedded in merchant apps. Support tokenized card, UPI handoff, and wallet pay. The host app must handle success, failure, cancel, and pending.”*

**Suggested clock**

| Min | You should deliver |
|-----|-------------------|
| 0–7 | MVP rails; PCI scope; out of scope (ledger/settlement) |
| 7–18 | Boxes: host → SDK → state machine → local store → API/PSP |
| 18–35 | Start pay, idempotency key, txn states, 3DS/WebView path |
| 35–42 | Kill mid-3DS; double-tap Pay; `unknown` + poll |
| 42–45 | Summary + one trade-off (hosted fields vs native PAN) |

**Interviewer interrupts (pick 2 if practicing with a partner)**

1. “User double-taps Pay — what guarantees one charge?”
2. “WebView 3DS killed — what happens on cold start?”
3. “Why is `pending` a valid SDK callback?”

**Scoring anchors (Block 1)**

| Signal | Strong hire (4–5) | Weak (1–2) |
|--------|-------------------|------------|
| Money truth | Server/PSP decides; client renders status | Shows “Paid” from WebView or local guess |
| Idempotency | Same key on retry; UI single-flight | New request per tap |
| States | `requires_action`, `processing`, `unknown` | Binary success/fail only |
| PCI | Hosted fields; no PAN in app | Native card form in merchant process |
| Mobile | Process death + resume pending | Happy path only |

**Block 1 pass bar:** Fintech correctness ≥4; no dimension below 3. **Strong hire:** average ≥4.2 across all 11 dimensions.

---

### Block 2 — India rail (45 min): UPI intent + collect

**Prompt:**  
*“Design UPI payments in a consumer app: intent pay to external UPI apps and collect-request approval. Flaky networks and process death are common.”*

**Suggested clock**

| Min | You should deliver |
|-----|-------------------|
| 0–6 | MVP both flows; Android vs iOS handoff caveat |
| 6–15 | Orchestrator + durable `PaymentAttempt` store |
| 15–30 | Intent: server-built URI, chooser, return = hint only, poll |
| 30–40 | Collect: create → user approves in UPI app → poll until terminal |
| 40–45 | No UPI app installed; extras say SUCCESS but API pending |

**Interviewer interrupts**

1. “Intent extras say success; API says pending — UI?”
2. “User kills app while in GPay — reopen behavior?”
3. “Polling backoff — when do you stop?”

**Scoring anchors (Block 2)**

| Must mention unprompted | If missing → cap Fintech at 3 |
|-------------------------|-------------------------------|
| Intent result is **hint only** | Shows success from extras |
| Poll + idempotent create | Retries without same key |
| `unknown` after timeout/kill | Gives up or duplicates charge |
| No-app fallback path | Crashes or blank screen |

**Block 2 pass bar:** Same as Block 1. **Strong hire:** you proactively draw the sequence diagram with “Treat extras as hint only” note.

---

### Block 3 — Cross-rail capstone (60 min)

This is the **differentiator** for top fintech senior loops. One continuous story across modules.

**Prompt:**  
*“Design QR pay at a shop: scan merchant QR, confirm amount, pay via UPI, handle app kill mid-flow, show result in transaction history, and let the user raise a dispute if needed.”*

**Act it as one design (not four separate answers).**

| Min | Segment | Must cover |
|-----|---------|------------|
| 0–8 | Scope | Payer scan MVP; static vs dynamic QR; defer merchant POS deep dive |
| 8–20 | Scan → confirm | Parse; dynamic QR server resolve; **confirm before** UPI launch |
| 20–35 | Pay | Create payment idempotent → UPI intent (Ch 39) → persist `launched/processing` |
| 35–45 | Kill mid-pay | Cold start → pending rows → poll (Ch 41 backoff) |
| 45–52 | History | Merge local attempt + server row; show UTR/RRN refs |
| 52–58 | Dispute entry | Prefill from history; no optimistic “refunded” (Ch 54) |
| 58–60 | Staff close | Metrics: funnel to terminal, unknown age p95, kill switch per rail |

**Capstone “strong hire” checklist (tick ≥8/10)**

- [ ] Integer minor units on confirm screen  
- [ ] Dynamic QR validated server-side  
- [ ] Never auto-pay on scan alone  
- [ ] Idempotency key on create  
- [ ] UPI return ≠ terminal success  
- [ ] Durable attempt survives kill  
- [ ] Poll strategy with backoff  
- [ ] Push wakes fetch, not truth  
- [ ] History shows pending → terminal merge  
- [ ] Dispute prefills paymentId + refs  

**Capstone pass bar:** ≥7/10 checklist + Fintech ≥4. **Staff lean:** 9/10 + metrics + remote kill switch mentioned in last 2 min.

---

### Block 4 — Staff rapid-fire (20 min)

Answer out loud in **2–3 min each**. Use [Appendix B](../appendix/B-follow-up-questions.md) to grade yourself.

| # | Probe |
|---|--------|
| 1 | PSP error rate spikes — what does mobile do in the next hour? |
| 2 | New payment schema migration with 10M installs — client plan? |
| 3 | Fraud wants step-up on every new beneficiary for 24h — UX? ([Ch 53](../part-5-fintech/53-beneficiary-cool-off.md)) |
| 4 | Bill pay: directory cached 7 days, due fetched now — what breaks if you skip due refresh? ([Ch 46](../part-5-fintech/46-bill-pay.md)) |
| 5 | BNPL approved in WebView but capture API times out — merchant callback? ([Ch 52](../part-5-fintech/52-bnpl-checkout.md)) |
| 6 | Which Ch 37 top-12 prompt fits PhonePe vs Razorpay vs Jupiter — and why? |

**Rapid-fire pass:** clear answer on ≥5/6 without reading notes. **Strong:** each answer names a **client behavior**, not “backend will handle it.”

---

### End-of-day hire signals

Score Blocks 1–3 with [Appendix C](../appendix/C-rubric.md) (include Fintech row). Use this summary:

| Overall | Signal |
|---------|--------|
| **Strong hire (senior)** | All three blocks: avg ≥4.0, Fintech ≥4 each, no 1s; capstone ≥7/10 |
| **Hire** | Avg ≥3.5, Fintech ≥3 each, capstone ≥5/10 |
| **Hold / redo** | Any Fintech ≤2, or capstone below 5/10, or optimistic-paid in any block |
| **Staff lean** | Capstone ≥9/10 + Block 4 ≥5/6 + Observability ≥4 on every block |

**Same-day debrief (15 min)**

1. Photo whiteboards; note which block had lowest Fintech score.  
2. Re-read that chapter’s **Failures** + **Trade-offs** sections only.  
3. Re-run **only the weakest 15 minutes** of the capstone tomorrow.  
4. Log scores in a table — redo mock day when all three Fintech scores ≥4 two days in a row.

### Company-specific emphasis (pick one stretch mock next day)

| Company type | Extra 45-min mock | Chapter |
|--------------|-------------------|---------|
| PhonePe / GPay / Paytm | UPI Autopay + Lite | [48](../part-5-fintech/48-upi-autopay-mandates.md), [49](../part-5-fintech/49-upi-lite.md) |
| Razorpay / Cashfree | SoftPOS or BNPL host SDK | [50](../part-5-fintech/50-softpos-tap-to-phone.md), [52](../part-5-fintech/52-bnpl-checkout.md) |
| Neobank | KYC + cool-off + lending | [42](../part-5-fintech/42-kyc-onboarding.md), [53](../part-5-fintech/53-beneficiary-cool-off.md), [56](../part-5-fintech/56-lending-apply-esign.md) |
| Global checkout | Saved cards + Apple/Google Pay + fraud | [45](../part-5-fintech/45-saved-cards-tokenization.md), [57](../part-5-fintech/57-apple-google-pay.md), [47](../part-5-fintech/47-fraud-challenge-step-up.md) |
| Auth modernization | Passkeys + device bind | [58](../part-5-fintech/58-passkeys-webauthn.md), [44](../part-5-fintech/44-secure-auth-device-binding.md) |
