---
edit_url: https://github.com/yadavsandeep24/san_system_design/edit/main/pages-index.md
---

# Mobile System Design Interview

Senior/staff prep for **Android, iOS, Flutter and React Native** interviews — with tracks for **libraries & SDKs**, **fintech / payments** and **documents & e-signature**.

---

## Start here

| If you… | Open |
|---------|------|
| New to the book | [Preface](book/00-preface.md) |
| First mock / generalist | [Ch 01 — Interview Framework](book/part-1-foundations/01-interview-framework.md) |
| Work on Flutter or React Native, or get "any platform" questions | [Ch 05 — Platforms map](book/part-2-building-blocks/05-platforms-android-ios-flutter-react-native.md) |
| Have a "design a library" round | [Ch 14 — SDK design](book/part-2-building-blocks/14-sdk-and-library-design.md) → Part 4 |
| Fintech / UPI / payments | [Ch 37 — Top Fintech Problems](book/part-5-fintech/37-top-fintech-system-design.md) |
| Are 1–2 weeks from interviews | [Ch 65 — Mock interview days](book/part-7-practice/65-mock-interview-days.md) |
| Want cold practice | [Ch 66 — Prompts without answers](book/part-7-practice/66-practice-prompts.md) |
| Day-of revision | [Appendix A — Cheat Sheet](book/appendix/A-cheat-sheet.md) |
| Score a practice mock | [Appendix C — Rubric](book/appendix/C-rubric.md) |

**On mobile:** tap **☰** (top-left) for the full chapter list, or use **Search**.

---

## Book structure

```text
Part 1   Ch 01–03   How to run the interview
Part 2   Ch 04–17   Building blocks + platforms map, SDK design, build/release, a11y, backend
Part 3   Ch 18–27   Consumer apps (feed, chat, rides, video, notes, maps, news, upload, stories, food)
Part 4   Ch 28–36   Libraries & SDKs (images, analytics, cache, sync, auth, push, flags, SDUI, downloads)
Part 5   Ch 37–58   Fintech (catalog first, then checkout, UPI, wallet, KYC, cards, fraud, …)
Part 6   Ch 59–64   Documents & e-signature
Part 7   Ch 65–66   Mock days and practice prompts
Appendix A–E        Cheat sheet, follow-ups, rubric, 90-day plan, 12-day plan map
```

Every model solution has a **Platform implementation** section showing the same design on Android (Views and Compose), iOS (UIKit and SwiftUI), Flutter and React Native — including what must stay native in cross-platform apps.

---

## Study paths

**2-week generalist:** Part 1 → Ch 04–13 (say each "Say it in the interview" answer aloud) → one consumer app per day → two libraries → [Mock day 1](book/part-7-practice/65-mock-interview-days.md#mock-day-1-generalist-mobile).

**2-week libraries:** [Ch 14](book/part-2-building-blocks/14-sdk-and-library-design.md) → one library per day, Ch 28–36 → [Mock day 2](book/part-7-practice/65-mock-interview-days.md#mock-day-2-libraries-and-sdks).

**2-week fintech:** [Ch 06](book/part-2-building-blocks/06-networking-and-apis.md), [08](book/part-2-building-blocks/08-offline-and-sync.md), [12](book/part-2-building-blocks/12-security-and-privacy.md), [13](book/part-2-building-blocks/13-observability-and-quality.md) → **[Ch 37](book/part-5-fintech/37-top-fintech-system-design.md)** → Ch [38](book/part-5-fintech/38-checkout-payment-sdk.md)–[47](book/part-5-fintech/47-fraud-challenge-step-up.md) → pick 2 from Ch [48](book/part-5-fintech/48-upi-autopay-mandates.md)–[58](book/part-5-fintech/58-passkeys-webauthn.md) → [Mock day 3](book/part-7-practice/65-mock-interview-days.md#mock-day-3-top-fintech-1-day-intensive).

---

## Fintech rule (memorize)

Client proposes intent → **server / PSP is source of truth** for money → never show “Paid” from local guess alone. Use `pending` / `unknown` + poll.

Details: [Ch 38 Checkout](book/part-5-fintech/38-checkout-payment-sdk.md) · [Ch 39 UPI](book/part-5-fintech/39-upi-intent-collect.md) · [Ch 41 Recovery](book/part-5-fintech/41-txn-history-pending-recovery.md)

---

## How to use each chapter

1. Read the **Timed outline** at the top.
2. Speak the answer aloud (45–60 min for model solutions).
3. Drill **Failures**, **Platform implementation** and **Trade-offs**.
4. Check **Appendix B** for follow-up questions; try a related prompt in **Ch 66** cold.

Mermaid diagrams render on this site — scroll diagrams horizontally on small screens if needed.
