---
edit_url: https://github.com/yadavsandeep24/san_system_design/edit/main/pages-index.md
---

# Mobile System Design Interview

Senior/staff prep for **iOS + Android** interviews — plus a **fintech / payments** track.

---

## Start here

| If you… | Open |
|---------|------|
| New to the book | [Preface](book/00-preface.md) |
| First mock / generalist | [Ch 01 — Interview Framework](book/part-1-foundations/01-interview-framework.md) |
| Fintech / UPI / payments | [Ch 37 — Top Fintech Problems](book/part-5-fintech/37-top-fintech-system-design.md) |
| Day-of revision | [Appendix A — Cheat Sheet](book/appendix/A-cheat-sheet.md) |
| Score a practice mock | [Appendix C — Rubric](book/appendix/C-rubric.md) |

**On mobile:** tap **☰** (top-left) for the full chapter list, or use **Search**.

---

## Book structure

```text
Part 1   Ch 01–03   How to run the interview
Part 2   Ch 04–13   Reusable building blocks (cache, offline, security…)
Part 3   Ch 18–27   Full model solutions (speak aloud, 45–60 min each)
Appendix A–E        Cheat sheet, follow-ups, rubric, 90-day plan, 12-day plan map
```

### Part 1 — Foundations
Interview loop, scoping, mobile constraints.

### Part 2 — Building Blocks
Patterns you reuse in every answer: networking, cache, offline, media, push, perf, security.

### Part 3 — Model Solutions

**Consumer apps (Ch 18–25):** feed, chat, ride hail, video, notes, maps, news, upload.

**Fintech (Ch 38–58):** checkout, UPI, wallet, recovery, KYC, QR, auth, saved cards, bill pay, fraud, mandates, and more.  
**Documents & e-signature (Ch 59–64):** [PDF viewer with field overlays](book/part-6-documents-and-esign/59-pdf-viewer-field-overlays.md), in-person signing on a shared tablet, signing-link shortener, saved signatures, small-screen signing, AI agreement summary (Docusign-style loops).  
**Android apps & libraries (Ch 34–27):** feature flags, server-driven UI, file downloader, stories, food ordering — plus a [12-day Android plan map](book/appendix/E-12-day-android-sd-plan.md) for daily practice.  
→ Full ranked list in [Ch 37](book/part-5-fintech/37-top-fintech-system-design.md). Consumer chapters: [18](book/part-3-consumer-apps/18-social-feed.md)–[25](book/part-3-consumer-apps/25-photo-camera-upload.md).

---

## Study paths

**2-week generalist:** Part 1 → Part 2 → Part 3 (one chapter/day) → Appendix C mocks.

**2-week fintech:** [Ch 06](book/part-2-building-blocks/06-networking-and-apis.md), [08](book/part-2-building-blocks/08-offline-and-sync.md), [12](book/part-2-building-blocks/12-security-and-privacy.md), [13](book/part-2-building-blocks/13-observability-and-quality.md) → **[Ch 37](book/part-5-fintech/37-top-fintech-system-design.md)** → Ch [38](book/part-5-fintech/38-checkout-payment-sdk.md)–[47](book/part-5-fintech/47-fraud-challenge-step-up.md) → pick 2 from Ch [48](book/part-5-fintech/48-upi-autopay-mandates.md)–[58](book/part-5-fintech/58-passkeys-webauthn.md).

**Before interviews:** one full day of timed mocks — see **Top fintech mock day** in the [GitHub README](https://github.com/yadavsandeep24/san_system_design#top-fintech-mock-day-1-day-intensive).

---

## Fintech rule (memorize)

Client proposes intent → **server / PSP is source of truth** for money → never show “Paid” from local guess alone. Use `pending` / `unknown` + poll.

Details: [Ch 38 Checkout](book/part-5-fintech/38-checkout-payment-sdk.md) · [Ch 39 UPI](book/part-5-fintech/39-upi-intent-collect.md) · [Ch 41 Recovery](book/part-5-fintech/41-txn-history-pending-recovery.md)

---

## How to use each chapter

1. Read the **Timed outline** at the top.
2. Speak the answer aloud (45–60 min for Part 3).
3. Drill **Failures** and **Trade-offs** sections.
4. Check **Appendix B** for follow-up questions.

Mermaid diagrams render in this site — scroll diagrams horizontally on small screens if needed.
