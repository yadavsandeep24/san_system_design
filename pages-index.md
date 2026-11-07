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
| Fintech / UPI / payments | [Ch 25 — Top Fintech Problems](book/part-3-model-solutions/25-top-fintech-system-design.md) |
| Day-of revision | [Appendix A — Cheat Sheet](book/appendix/A-cheat-sheet.md) |
| Score a practice mock | [Appendix C — Rubric](book/appendix/C-rubric.md) |

**On mobile:** tap **☰** (top-left) for the full chapter list, or use **Search**.

---

## Book structure

```text
Part 1   Ch 01–03   How to run the interview
Part 2   Ch 04–12   Reusable building blocks (cache, offline, security…)
Part 3   Ch 13–48   Full model solutions (speak aloud, 45–60 min each)
Appendix A–D        Cheat sheet, follow-ups, rubric, 90-day plan
```

### Part 1 — Foundations
Interview loop, scoping, mobile constraints.

### Part 2 — Building Blocks
Patterns you reuse in every answer: networking, cache, offline, media, push, perf, security.

### Part 3 — Model Solutions

**Consumer apps (Ch 13–20):** feed, chat, ride hail, video, notes, maps, news, upload.

**Fintech (Ch 21–42):** checkout, UPI, wallet, recovery, KYC, QR, auth, saved cards, bill pay, fraud, mandates, and more.  
**Documents & e-signature (Ch 43–48):** [PDF viewer with field overlays](book/part-3-model-solutions/43-pdf-viewer-field-overlays.md), in-person signing on a shared tablet, signing-link shortener, saved signatures, small-screen signing, AI agreement summary (Docusign-style loops).  
→ Full ranked list in [Ch 25](book/part-3-model-solutions/25-top-fintech-system-design.md). Consumer chapters: [13](book/part-3-model-solutions/13-social-feed.md)–[20](book/part-3-model-solutions/20-photo-camera-upload.md).

---

## Study paths

**2-week generalist:** Part 1 → Part 2 → Part 3 (one chapter/day) → Appendix C mocks.

**2-week fintech:** [Ch 05](book/part-2-building-blocks/05-networking-and-apis.md), [07](book/part-2-building-blocks/07-offline-and-sync.md), [11](book/part-2-building-blocks/11-security-and-privacy.md), [12](book/part-2-building-blocks/12-observability-and-quality.md) → **[Ch 25](book/part-3-model-solutions/25-top-fintech-system-design.md)** → Ch [21](book/part-3-model-solutions/21-checkout-payment-sdk.md)–[31](book/part-3-model-solutions/31-fraud-challenge-step-up.md) → pick 2 from Ch [32](book/part-3-model-solutions/32-upi-autopay-mandates.md)–[42](book/part-3-model-solutions/42-passkeys-webauthn.md).

**Before interviews:** one full day of timed mocks — see **Top fintech mock day** in the [GitHub README](https://github.com/yadavsandeep24/san_system_design#top-fintech-mock-day-1-day-intensive).

---

## Fintech rule (memorize)

Client proposes intent → **server / PSP is source of truth** for money → never show “Paid” from local guess alone. Use `pending` / `unknown` + poll.

Details: [Ch 21 Checkout](book/part-3-model-solutions/21-checkout-payment-sdk.md) · [Ch 22 UPI](book/part-3-model-solutions/22-upi-intent-collect.md) · [Ch 24 Recovery](book/part-3-model-solutions/24-txn-history-pending-recovery.md)

---

## How to use each chapter

1. Read the **Timed outline** at the top.
2. Speak the answer aloud (45–60 min for Part 3).
3. Drill **Failures** and **Trade-offs** sections.
4. Check **Appendix B** for follow-up questions.

Mermaid diagrams render in this site — scroll diagrams horizontally on small screens if needed.
