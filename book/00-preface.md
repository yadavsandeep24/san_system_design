# Preface

## Who this book is for

Mobile engineers — **Android, iOS, Flutter and React Native** — preparing for **senior and staff** system design rounds, including **fintech / payments** interviews. You already ship features; interviewers want to see whether you can design under device, network, and OS constraints—and defend trade-offs clearly.

## What “strong” looks like

| Signal | Weak | Strong |
|--------|------|--------|
| Scope | Designs the whole product | Pins MVP, names deferred work |
| Mobile reality | Ignores offline / battery / lifecycle | Budgets memory, battery, cold start |
| Data | “Call the API” | Local store, sync, idempotency, conflicts |
| Failure | Happy path only | Token expiry, kill mid-write, flaky radio |
| Money (fintech) | Optimistic “Paid” | Server/PSP truth; `pending`/`unknown` + poll |
| Communication | Jumps to libraries | Timed structure, explicit decisions |

## How chapters are built

| Part | Chapters | What it's for |
|------|----------|---------------|
| **1 — Foundations** | 01–03 | The interview loop, scoping, mobile constraints |
| **2 — Building blocks** | 04–17 | Reusable patterns to cite in every answer, including the cross-platform map (Ch 05), SDK design, build/release, accessibility and the backend you're expected to sketch |
| **3 — Consumer apps** | 18–27 | Timed model solutions: feed, chat, ride hailing, video, notes, maps, news, uploads, stories, food ordering |
| **4 — Libraries and SDKs** | 28–36 | The fast-growing "design a library" round: image loader, analytics, cache, sync, auth, push, flags, server-driven UI, downloader |
| **5 — Fintech** | 37–58 | Payments track, starting with the ranked catalog in Ch 37 |
| **6 — Documents and e-signature** | 59–64 | PDF overlays, signing flows, AI summaries |
| **7 — Practice** | 65–66 | Timed mock days and prompts without model answers |
| **Appendix** | A–E | Cheat sheet, follow-ups, rubric, 90-day plan, 12-day plan map |

Every model solution follows the same shape (timed outline → scope → NFRs → architecture → data model → deep dives → failures → **platform implementation** → trade-offs → metrics → staff stretch → follow-ups) and is meant to be spoken aloud in 45–60 minutes.

## Every stack

The architecture never depends on the UI toolkit, so each chapter's **Platform implementation** section shows the same design on **Android (Views and Compose), iOS (UIKit and SwiftUI), Flutter and React Native**: the APIs, the libraries, and — for Flutter and React Native — what has to stay native. Start with [Ch 05](part-2-building-blocks/05-platforms-android-ios-flutter-react-native.md) if you work on a cross-platform stack.

## Fintech track

Prefer [Ch 06](part-2-building-blocks/06-networking-and-apis.md), [08](part-2-building-blocks/08-offline-and-sync.md), [12](part-2-building-blocks/12-security-and-privacy.md), [13](part-2-building-blocks/13-observability-and-quality.md) then **[38](part-5-fintech/38-checkout-payment-sdk.md)–[47](part-5-fintech/47-fraud-challenge-step-up.md)** (start with [Ch 37](part-5-fintech/37-top-fintech-system-design.md)); add **[48](part-5-fintech/48-upi-autopay-mandates.md)–[58](part-5-fintech/58-passkeys-webauthn.md)** for staff/specialist loops (incl. [Ch 57](part-5-fintech/57-apple-google-pay.md) wallet rails, [Ch 58](part-5-fintech/58-passkeys-webauthn.md) passkeys). Rule: client proposes intent; **server is source of truth** for money.

## Original work notice

This guide is original educational material for interview practice. It is not affiliated with, and does not reproduce, any commercial “cracking the interview” title.
