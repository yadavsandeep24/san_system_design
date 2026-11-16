# 66 — Practice Prompts (No Model Answers)

Every other chapter gives you the answer. This one doesn't. Use these prompts for **cold practice**: set a 45-minute timer, answer out loud, score yourself with [Appendix C](../appendix/C-rubric.md), and only then open the related chapters listed under each prompt.

Each prompt has:

- **Twist:** a constraint that changes the design — say how it changes it.
- **Strong answers cover:** a short checklist to grade yourself against, not a solution.

**Rotate stacks:** do some prompts as native iOS + Android, some as Flutter and some as React Native. The checklist always includes "what stays native and why" for cross-platform answers ([Ch 05](../part-2-building-blocks/05-platforms-android-ios-flutter-react-native.md)).

---

## Consumer apps

### P1. Podcast player

"Design a podcast app: browse shows, stream and download episodes, resume where you left off across devices."

- **Twist:** downloads must continue with the app closed, and playback position syncs to a smart speaker.
- **Strong answers cover:** background audio session and media controls on both OSs · download queue on OS transfer services · position sync with conflict rule (latest timestamp per episode) · storage budget and auto-delete of played episodes · CarPlay / Android Auto mention.
- **Related:** [Ch 21](../part-3-consumer-apps/21-video-player.md), [Ch 36](../part-4-libraries-and-sdks/36-file-downloader-library.md), [Ch 31](../part-4-libraries-and-sdks/31-data-sync-library.md)

### P2. Calendar with shared events

"Design a calendar app with personal and shared calendars, invitations and reminders."

- **Twist:** reminders must fire on time with no network, and the user travels across time zones.
- **Strong answers cover:** local notifications scheduled from the local DB · reschedule on time-zone and DST changes · recurrence rules stored, expanded locally · invitation state machine · delta sync · accessibility of the day/week grid.
- **Related:** [Ch 08](../part-2-building-blocks/08-offline-and-sync.md), [Ch 16](../part-2-building-blocks/16-accessibility-and-localization.md)

### P3. E-commerce product listing and search

"Design product search with filters, sorting and a product detail page for a large catalogue."

- **Twist:** results must appear while typing on a 3G connection.
- **Strong answers cover:** debounce + cancellation of stale queries · cursor pagination with filters in the key · facet counts from the server · image sizes per grid density · recently viewed offline · deep links to products and filters.
- **Related:** [Ch 18](../part-3-consumer-apps/18-social-feed.md), [Ch 28](../part-4-libraries-and-sdks/28-image-loading-library.md), [Ch 30](../part-4-libraries-and-sdks/30-caching-library.md)

### P4. Fitness tracker

"Design a run-tracking app that records GPS routes, shows live pace and syncs workouts."

- **Twist:** a two-hour run in the background with the screen off, without draining the battery.
- **Strong answers cover:** background location mode per OS (foreground service type `location`; iOS background location + `CLBackgroundActivitySession`) · sampling rate vs battery · local storage of points, simplification before upload · crash-safe recording (append-only) · HealthKit / Health Connect integration.
- **Related:** [Ch 23](../part-3-consumer-apps/23-maps-location.md), [Ch 11](../part-2-building-blocks/11-performance-battery-lifecycle.md)

### P5. Live sports scores

"Design a live scores app with match lists, live commentary and goal alerts."

- **Twist:** 10 million users open the app within a minute of a goal.
- **Strong answers cover:** push as a hint + fetch · CDN-cached match snapshots with short TTL · socket/SSE only for the open match · Live Activities / ongoing notifications · thundering-herd protection (jittered fetch, cached responses).
- **Related:** [Ch 10](../part-2-building-blocks/10-realtime-and-push.md), [Ch 17](../part-2-building-blocks/17-backend-for-mobile.md), [Ch 33](../part-4-libraries-and-sdks/33-push-notification-system.md)

### P6. Collaborative to-do list

"Design a shared shopping list that family members edit at the same time."

- **Twist:** two people reorder and check off items simultaneously while offline in the supermarket basement.
- **Strong answers cover:** outbox + delta sync · ordering strategy (fractional indexes / position keys) · field-level merge for checked state · realtime updates when online · conflict UX.
- **Related:** [Ch 31](../part-4-libraries-and-sdks/31-data-sync-library.md), [Ch 22](../part-3-consumer-apps/22-offline-notes.md)

### P7. Home screen widget

"Add a home screen widget to the food ordering app showing the live order status."

- **Twist:** widgets run in a separate process with tight memory and refresh budgets.
- **Strong answers cover:** WidgetKit timeline + push-updated Live Activity vs App Widgets (Glance) update rules · shared storage (App Group / DataStore) · refresh budget · what Flutter / RN must write natively.
- **Related:** [Ch 27](../part-3-consumer-apps/27-food-ordering-app.md), [Ch 05](../part-2-building-blocks/05-platforms-android-ios-flutter-react-native.md)

---

## Libraries and SDKs

### P8. Networking library

"Design the networking layer every feature uses: requests, auth, retries, caching and observability."

- **Twist:** two SDKs inside the app also need authenticated calls without seeing tokens.
- **Strong answers cover:** typed request/response API · interceptor chain · single-flight refresh · idempotency for writes · cancellation · per-SDK scoped tokens · metrics per endpoint.
- **Related:** [Ch 06](../part-2-building-blocks/06-networking-and-apis.md), [Ch 32](../part-4-libraries-and-sdks/32-authentication-module.md)

### P9. Logging and crash reporting SDK

"Design a logging library with local ring buffer, crash reports and upload."

- **Twist:** the crash happens during startup, before your SDK has finished initializing.
- **Strong answers cover:** signal / exception handlers installed first · ring buffer on disk · upload on next launch · symbolication (R8 mapping, dSYMs, Dart symbols, Hermes source maps) · PII scrubbing.
- **Related:** [Ch 13](../part-2-building-blocks/13-observability-and-quality.md), [Ch 14](../part-2-building-blocks/14-sdk-and-library-design.md)

### P10. A/B testing SDK

"Design the client SDK for experiments: assignment, exposure, and metrics."

- **Twist:** assignments must be stable before login and survive the user logging in.
- **Strong answers cover:** deterministic bucketing (hash of id + experiment salt) · anonymous → user id merge rules · exposure logging only when the variant is rendered · flicker avoidance at startup.
- **Related:** [Ch 34](../part-4-libraries-and-sdks/34-feature-flag-library.md), [Ch 29](../part-4-libraries-and-sdks/29-analytics-sdk.md)

### P11. In-app chat support SDK

"Design a support chat SDK that partner apps embed."

- **Twist:** the host app is a React Native app with its own navigation.
- **Strong answers cover:** UI module vs headless API · theming · push token sharing with the host · attachments upload · native core + RN wrapper · not owning the host's navigation.
- **Related:** [Ch 19](../part-3-consumer-apps/19-messaging-chat.md), [Ch 14](../part-2-building-blocks/14-sdk-and-library-design.md)

### P12. Media upload library

"Design a library to upload photos and videos reliably from any screen in the app."

- **Twist:** uploads must survive the app being killed and must not use cellular data for videos unless the user allows it.
- **Strong answers cover:** pre-signed multipart upload · OS transfer services · constraints (unmetered) · compression pipeline · progress API · resume after process death.
- **Related:** [Ch 25](../part-3-consumer-apps/25-photo-camera-upload.md), [Ch 17](../part-2-building-blocks/17-backend-for-mobile.md)

---

## Fintech

### P13. Split bills with friends

"Design a feature to split a restaurant bill and collect money from friends."

- **Twist:** some friends pay through UPI apps, others with saved cards, and one is offline.
- **Strong answers cover:** integer minor units and rounding rule · request state per participant · payment status from the server only · reminders · ledger view.
- **Related:** [Ch 39](../part-5-fintech/39-upi-intent-collect.md), [Ch 41](../part-5-fintech/41-txn-history-pending-recovery.md)

### P14. Recurring investments (SIP)

"Design monthly automatic investments into mutual funds."

- **Twist:** the debit date is a bank holiday and the mandate was revoked last week.
- **Strong answers cover:** mandate lifecycle · execution status vs order status · notifications before debit · pause / skip flows · NAV-date explanation in UI.
- **Related:** [Ch 48](../part-5-fintech/48-upi-autopay-mandates.md), [Ch 55](../part-5-fintech/55-trading-watchlist-orders.md)

### P15. Card controls

"Design card controls: freeze card, set limits, enable international usage."

- **Twist:** the user freezes the card while a payment is in flight.
- **Strong answers cover:** optimistic toggle vs server confirm (money-adjacent → confirm) · step-up for loosening limits · audit trail · push on blocked transactions.
- **Related:** [Ch 47](../part-5-fintech/47-fraud-challenge-step-up.md), [Ch 44](../part-5-fintech/44-secure-auth-device-binding.md)

### P16. Rewards and cashback

"Design a rewards screen: scratch cards, cashback credited to the wallet."

- **Twist:** the same scratch card is opened on two devices at once.
- **Strong answers cover:** server-side single claim (idempotent) · animation decoupled from claim result · balance freshness · fraud signals.
- **Related:** [Ch 40](../part-5-fintech/40-wallet-transfer.md)

---

## Documents and e-signature

### P17. Offline form filling

"Design a field-agent app that fills multi-page forms with photos and a customer signature, offline all day."

- **Twist:** the tablet is shared between agents.
- **Strong answers cover:** draft storage encrypted per agent · photo compression + upload queue · signature capture and binding to the document hash · wipe on agent switch.
- **Related:** [Ch 60](../part-6-documents-and-esign/60-in-person-signing-shared-tablet.md), [Ch 62](../part-6-documents-and-esign/62-saved-signature-reuse.md)

### P18. Document scanner

"Design a document scanner that detects edges, enhances images and exports a PDF."

- **Twist:** must run on mid-range Android phones and in a Flutter app.
- **Strong answers cover:** VisionKit / ML Kit document scanner APIs · on-device processing off the main thread · memory limits for multi-page PDFs · native module boundary for Flutter.
- **Related:** [Ch 59](../part-6-documents-and-esign/59-pdf-viewer-field-overlays.md), [Ch 09](../part-2-building-blocks/09-media-images-video.md)

---

## Platform twists (answer for any prompt above)

Ask a partner to pick one of these during any mock:

1. "Now it's a **React Native** app. What changes, and what must be native?"
2. "Now it's a **Flutter** app. Where do platform channels appear?"
3. "**iOS** won't run your background job. How do you keep it correct?"
4. "The app is used by someone with **VoiceOver / TalkBack** and 200% text. What changes?"
5. "Ship it to **40 engineers in 6 teams**. What's the module graph and release plan?"
6. "**Half the users** are on old Android devices with 2 GB of RAM."
7. "The backend team asks what you need from them. **Draw their side in two minutes.**"

## How to log practice

| Date | Prompt | Stack | Rubric average | Weakest dimension | Re-do date |
|------|--------|-------|----------------|-------------------|------------|
| | | | | | |

Re-do any prompt where a dimension scored ≤ 2, after re-reading only the related chapters' **Failures** and **Trade-offs** sections.
