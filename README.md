# Mobile System Design Interview Study Book

Original senior/staff prep for mobile system design interviews on **Android, iOS, Flutter and React Native**, with dedicated tracks for **libraries & SDKs**, **fintech / payments** and **documents & e-signature**.

**Read online:** [yadavsandeep24.github.io/san_system_design](https://yadavsandeep24.github.io/san_system_design/) (menu ☰ for chapters, search for quick jumps). Everything is plain Markdown, so it also reads well on GitHub or in any editor.

---

## Start here

| Goal | Open this first |
|------|-----------------|
| New to the book | [Preface](book/00-preface.md) |
| How to run the interview | [Ch 01 — Interview Framework](book/part-1-foundations/01-interview-framework.md) |
| Flutter / React Native / "any platform" answers | [Ch 05 — Platforms map](book/part-2-building-blocks/05-platforms-android-ios-flutter-react-native.md) |
| "Design a library" rounds | [Ch 14 — SDK design](book/part-2-building-blocks/14-sdk-and-library-design.md), then Part 4 |
| Fintech / payments / UPI | [Ch 37 — Top fintech problems](book/part-5-fintech/37-top-fintech-system-design.md) |
| 1–2 weeks before interviews | [Ch 65 — Mock interview days](book/part-7-practice/65-mock-interview-days.md) |
| Cold practice without answers | [Ch 66 — Practice prompts](book/part-7-practice/66-practice-prompts.md) |
| Day-of revision | [Appendix A — Cheat sheet](book/appendix/A-cheat-sheet.md) |
| Score a mock | [Appendix C — Rubric](book/appendix/C-rubric.md) |

## How the book is organized

```text
book/
  00-preface.md
  part-1-foundations/          Ch 01–03  interview loop, scoping, mobile constraints
  part-2-building-blocks/      Ch 04–17  reusable patterns + platforms map, SDK design, build/release, a11y, backend
  part-3-consumer-apps/        Ch 18–27  timed model solutions for consumer apps
  part-4-libraries-and-sdks/   Ch 28–36  library and SDK designs
  part-5-fintech/              Ch 37–58  payments track (catalog first)
  part-6-documents-and-esign/  Ch 59–64  PDF, signing, AI summaries
  part-7-practice/             Ch 65–66  mock days and prompts without answers
  appendix/                    A–E       cheat sheet, follow-ups, rubric, 90-day plan, 12-day plan map
```

Every model solution follows the same shape — timed outline → scope → NFRs → architecture → data model → deep dives → failures → **platform implementation (Android, iOS, Flutter, React Native)** → trade-offs → metrics → staff stretch → follow-ups — and is meant to be **spoken aloud in 45–60 minutes**. Mermaid diagrams render on GitHub and on the site.

## Study paths

### 2 weeks — generalist (any stack)

| Days | Focus |
|------|-------|
| 1–2 | Part 1 + Ch 04–05 (architecture and platforms map) |
| 3–5 | Ch 06–13 building blocks: read the tables, say each "Say it in the interview" answer aloud, do one exercise per chapter |
| 6–10 | One consumer app per day: Ch 18, 19, 22, 25, 27 (speak aloud, 45–60 min) |
| 11 | Two library designs: Ch 28 + Ch 33 |
| 12 | Ch 15–17 (build/release, accessibility, backend) |
| 13–14 | [Mock day 1](book/part-7-practice/65-mock-interview-days.md#mock-day-1-generalist-mobile) + two prompts from Ch 66 |

### 2 weeks — libraries and SDKs (Android/iOS library-heavy loops)

| Days | Focus |
|------|-------|
| 1 | Ch 01–05 skim + Ch 14 SDK design (deep) |
| 2–10 | One library per day: Ch 28 → 36 |
| 11–12 | Ch 07, 08, 10 refresh + [Appendix E](book/appendix/E-12-day-android-sd-plan.md) gaps |
| 13–14 | [Mock day 2](book/part-7-practice/65-mock-interview-days.md#mock-day-2-libraries-and-sdks) + library prompts P8–P12 from Ch 66 |

### 2 weeks — fintech / payments

| Days | Focus |
|------|-------|
| 1 | Part 1 + Ch 06, 08, 12, 13 + [Ch 37](book/part-5-fintech/37-top-fintech-system-design.md) |
| 2–3 | Ch 38 Checkout SDK |
| 4–5 | Ch 39 UPI intent / collect |
| 6 | Ch 40 Wallet transfer |
| 7 | Ch 41 History + pending recovery |
| 8 | Ch 42 KYC + Ch 43 QR |
| 9 | Ch 44 Auth / binding + Ch 45 Saved cards |
| 10 | Ch 46 Bill pay + Ch 47 Fraud challenge |
| 11–12 | Stretch: pick two from Ch 48–58 + the kill-mid-pay drill |
| 13–14 | [Mock day 3](book/part-7-practice/65-mock-interview-days.md#mock-day-3-top-fintech-1-day-intensive) + Appendix C |

### 4 weeks — paced (generalist + one specialty)

| Week | Focus |
|------|-------|
| 1 | Part 1 + Part 2 Ch 04–10 |
| 2 | Part 2 Ch 11–17 + consumer apps Ch 18–20 |
| 3 | Consumer apps Ch 21–27 + libraries Ch 28–30 |
| 4 | Specialty (Part 4, 5 or 6) + Mock day 1 or 2 or 3 + Ch 66 prompts |

**Document / e-signature loops:** add Part 6 (Ch 59–64) in week 4, plus prompts P17–P18.

## Contents

### Part 1 — Foundations

- [01 — Interview Framework](book/part-1-foundations/01-interview-framework.md)
- [02 — Requirements and Scope](book/part-1-foundations/02-requirements-and-scope.md)
- [03 — Mobile Constraints](book/part-1-foundations/03-mobile-constraints.md)

### Part 2 — Building Blocks

- [04 — Client Architecture](book/part-2-building-blocks/04-client-architecture.md)
- [05 — Platforms: Android, iOS, Flutter and React Native](book/part-2-building-blocks/05-platforms-android-ios-flutter-react-native.md)
- [06 — Networking and APIs](book/part-2-building-blocks/06-networking-and-apis.md)
- [07 — Caching and Storage](book/part-2-building-blocks/07-caching-and-storage.md)
- [08 — Offline and Sync](book/part-2-building-blocks/08-offline-and-sync.md)
- [09 — Media: Images and Video](book/part-2-building-blocks/09-media-images-video.md)
- [10 — Realtime and Push](book/part-2-building-blocks/10-realtime-and-push.md)
- [11 — Performance, Battery, and Lifecycle](book/part-2-building-blocks/11-performance-battery-lifecycle.md)
- [12 — Security and Privacy](book/part-2-building-blocks/12-security-and-privacy.md)
- [13 — Observability and Quality](book/part-2-building-blocks/13-observability-and-quality.md)
- [14 — SDK and Library Design](book/part-2-building-blocks/14-sdk-and-library-design.md)
- [15 — Modularization, Build and Release](book/part-2-building-blocks/15-modularization-build-and-release.md)
- [16 — Accessibility and Localization](book/part-2-building-blocks/16-accessibility-and-localization.md)
- [17 — The Backend You're Expected to Sketch](book/part-2-building-blocks/17-backend-for-mobile.md)

### Part 3 — Consumer Apps

- [18 — Social Feed](book/part-3-consumer-apps/18-social-feed.md)
- [19 — Messaging / Chat](book/part-3-consumer-apps/19-messaging-chat.md)
- [20 — Ride Hailing](book/part-3-consumer-apps/20-ride-hailing.md)
- [21 — Video Player](book/part-3-consumer-apps/21-video-player.md)
- [22 — Offline Notes](book/part-3-consumer-apps/22-offline-notes.md)
- [23 — Maps / Location](book/part-3-consumer-apps/23-maps-location.md)
- [24 — News Reader](book/part-3-consumer-apps/24-news-reader.md)
- [25 — Photo Capture and Upload](book/part-3-consumer-apps/25-photo-camera-upload.md)
- [26 — Instagram-Style Stories](book/part-3-consumer-apps/26-stories.md)
- [27 — Food Ordering App](book/part-3-consumer-apps/27-food-ordering-app.md)

### Part 4 — Libraries & SDKs

- [28 — Image Loading Library](book/part-4-libraries-and-sdks/28-image-loading-library.md)
- [29 — Analytics SDK](book/part-4-libraries-and-sdks/29-analytics-sdk.md)
- [30 — App Caching Library](book/part-4-libraries-and-sdks/30-caching-library.md)
- [31 — Data Sync Library](book/part-4-libraries-and-sdks/31-data-sync-library.md)
- [32 — Authentication Module](book/part-4-libraries-and-sdks/32-authentication-module.md)
- [33 — Push Notification System](book/part-4-libraries-and-sdks/33-push-notification-system.md)
- [34 — Feature Flag & Remote Config Library](book/part-4-libraries-and-sdks/34-feature-flag-library.md)
- [35 — Server-Driven UI System](book/part-4-libraries-and-sdks/35-server-driven-ui.md)
- [36 — File Downloader Library](book/part-4-libraries-and-sdks/36-file-downloader-library.md)

### Part 5 — Fintech

- [37 — Top Fintech Mobile System Design Problems](book/part-5-fintech/37-top-fintech-system-design.md)
- [38 — Checkout / Payment SDK](book/part-5-fintech/38-checkout-payment-sdk.md)
- [39 — UPI Intent and Collect](book/part-5-fintech/39-upi-intent-collect.md)
- [40 — Wallet Transfer](book/part-5-fintech/40-wallet-transfer.md)
- [41 — Transaction History and Pending Recovery](book/part-5-fintech/41-txn-history-pending-recovery.md)
- [42 — KYC / Identity Onboarding](book/part-5-fintech/42-kyc-onboarding.md)
- [43 — QR Payments](book/part-5-fintech/43-qr-payments.md)
- [44 — Secure Auth and Device Binding](book/part-5-fintech/44-secure-auth-device-binding.md)
- [45 — Saved Cards / Tokenization](book/part-5-fintech/45-saved-cards-tokenization.md)
- [46 — Bill Pay / Biller List](book/part-5-fintech/46-bill-pay.md)
- [47 — Fraud Challenge / Step-up](book/part-5-fintech/47-fraud-challenge-step-up.md)
- [48 — UPI Autopay / Mandates](book/part-5-fintech/48-upi-autopay-mandates.md)
- [49 — UPI Lite / Low-value Offline-ish Balance](book/part-5-fintech/49-upi-lite.md)
- [50 — SoftPOS / Tap-to-Phone](book/part-5-fintech/50-softpos-tap-to-phone.md)
- [51 — Cross-border Remittance](book/part-5-fintech/51-cross-border-remittance.md)
- [52 — BNPL at Checkout](book/part-5-fintech/52-bnpl-checkout.md)
- [53 — Beneficiary Cool-off](book/part-5-fintech/53-beneficiary-cool-off.md)
- [54 — Payment Disputes / Chargeback Support UX](book/part-5-fintech/54-payment-disputes-support.md)
- [55 — Trading Watchlist + Orders](book/part-5-fintech/55-trading-watchlist-orders.md)
- [56 — Lending Apply + E-sign](book/part-5-fintech/56-lending-apply-esign.md)
- [57 — Apple Pay / Google Pay Wallet Rails](book/part-5-fintech/57-apple-google-pay.md)
- [58 — Passkeys (WebAuthn) on Mobile](book/part-5-fintech/58-passkeys-webauthn.md)

### Part 6 — Documents & E-sign

- [59 — PDF Viewer with Field Overlays](book/part-6-documents-and-esign/59-pdf-viewer-field-overlays.md)
- [60 — In-Person Signing on a Shared Tablet](book/part-6-documents-and-esign/60-in-person-signing-shared-tablet.md)
- [61 — URL Shortener for Signing Links](book/part-6-documents-and-esign/61-signing-link-url-shortener.md)
- [62 — Save a Signature Once, Reuse It Everywhere](book/part-6-documents-and-esign/62-saved-signature-reuse.md)
- [63 — Mobile-Friendly Signing on Small Screens](book/part-6-documents-and-esign/63-small-screen-signing.md)
- [64 — AI Summary of a Long Agreement](book/part-6-documents-and-esign/64-ai-agreement-summary.md)

### Part 7 — Practice

- [65 — Mock Interview Days](book/part-7-practice/65-mock-interview-days.md)
- [66 — Practice Prompts (No Model Answers)](book/part-7-practice/66-practice-prompts.md)

### Appendix

- [A — Cheat Sheet](book/appendix/A-cheat-sheet.md)
- [B — Follow-up Questions](book/appendix/B-follow-up-questions.md)
- [C — Evaluation Rubric](book/appendix/C-rubric.md)
- [D — Architect 90-Day Plan](book/appendix/D-mobile-architect-skills-90-day.md)
- [E — 12-Day Android SD Plan](book/appendix/E-12-day-android-sd-plan.md)

## Conventions

- Cache sizes, timeouts and budgets are **interview-reasonable defaults**, not product SLAs.
- Library names (Coil, WorkManager, Riverpod, FlashList…) are **examples**; the pattern is what you're scored on.
- Backend appears as the **contracts** the client depends on, plus a short sketch (Ch 17).
- Money uses **integer minor units** (e.g. paise); UI status follows **server verification**. Fintech rule: client proposes intent → **server / PSP is the source of truth** → never optimistically show "Paid".
- This material is **original**; it is not a copy of any commercial interview book.

## Preview the site locally

```bash
python3 -m venv .venv && source .venv/bin/activate
pip install -r requirements.txt
bash scripts/prepare-docs.sh && mkdocs serve
```

Pushing to `main` rebuilds and deploys the GitHub Pages site through the **Deploy GitHub Pages** workflow.
