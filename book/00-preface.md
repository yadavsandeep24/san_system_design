# Preface

## Who this book is for

Mobile engineers preparing for **senior and staff** system design rounds—including **fintech / payments** interviews. You already ship features; interviewers want to see whether you can design under device, network, and OS constraints—and defend trade-offs clearly.

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

- **Part 1** trains the interview loop.
- **Part 2** is a reusable toolbox—cite these patterns in Part 3 answers.
- **Part 3** is spoken-style model solutions you can rehearse in 45–60 minutes (Ch 25 is a ranked fintech catalog, not a timed prompt).
- **Appendix** is for last-mile recall and mock scoring.

## Fintech track

Prefer Ch **05, 07, 11, 12** then **21–31** (start with [Ch 25](part-3-model-solutions/25-top-fintech-system-design.md)); add **32–42** for staff/specialist loops (incl. [Ch 41](part-3-model-solutions/41-apple-google-pay.md) wallet rails, [Ch 42](part-3-model-solutions/42-passkeys-webauthn.md) passkeys). Rule: client proposes intent; **server is source of truth** for money.

## Original work notice

This guide is original educational material for interview practice. It is not affiliated with, and does not reproduce, any commercial “cracking the interview” title.
