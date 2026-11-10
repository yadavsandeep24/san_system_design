# Appendix E — 12-Day Android System Design Plan Map

A popular 12-day plan gives one Android system design problem per day ([Ishant, Medium](https://medium.com/@ishant.7123217/12-day-android-system-design-preparation-plan-72f9082e4e4d)). This appendix maps each day to where it is answered in this book. Five days were missing and were added as full model solutions (**Ch 49–53**). The other seven point to existing material: the news feed has full model solutions (Ch 13, 19); the rest are **partial** — covered by Part 2 *building blocks* or a neighbouring design — the right patterns, but not a full library or system design. For those **partial** days, use the building block plus the checklist below and practise the missing parts out loud.

| Day | Problem | Kind | Answer in this book | Coverage |
|-----|---------|------|---------------------|----------|
| 1 | App caching library | Library | [Ch 06 Caching & storage](../part-2-building-blocks/06-caching-and-storage.md) | Partial — building block: cache tiers, TTL, eviction; add the library API, config and module boundaries |
| 2 | Analytics library | Library | [Ch 12 Observability & quality](../part-2-building-blocks/12-observability-and-quality.md) | Partial — building block: logging/metrics only; add event schema, batching queue, persistence, flush policy, consent, sampling |
| 3 | Data sync library | Library | [Ch 07 Offline & sync](../part-2-building-blocks/07-offline-and-sync.md) · [Ch 17 Offline notes](../part-3-model-solutions/17-offline-notes.md) | Partial: sync patterns + a full offline-notes design; add the library API and sync policies |
| 4 | Push notification system | System | [Ch 09 Realtime & push](../part-2-building-blocks/09-realtime-and-push.md) | Partial — building block: client handling; add token registry, server fan-out, channels and categories |
| 5 | Feature flag / remote config library | Library | **[Ch 49 Feature flags](../part-3-model-solutions/49-feature-flag-library.md)** (new) | Full |
| 6 | Server-driven UI | System | **[Ch 50 Server-driven UI](../part-3-model-solutions/50-server-driven-ui.md)** (new) | Full |
| 7 | File downloader library | Library | **[Ch 51 File downloader](../part-3-model-solutions/51-file-downloader-library.md)** (new) | Full |
| 8 | News feed | App | [Ch 13 Social feed](../part-3-model-solutions/13-social-feed.md) · [Ch 19 News reader](../part-3-model-solutions/19-news-reader.md) | Full |
| 9 | Instagram-style stories | App feature | **[Ch 52 Stories](../part-3-model-solutions/52-stories.md)** (new) | Full |
| 10 | Authentication module | Library | [Ch 05 Networking & APIs (token refresh)](../part-2-building-blocks/05-networking-and-apis.md) · [Ch 28 Auth & device binding](../part-3-model-solutions/28-secure-auth-device-binding.md) · [Ch 42 Passkeys](../part-3-model-solutions/42-passkeys-webauthn.md) | Partial: token refresh + device binding; add the module API and auth state machine |
| 11 | Food ordering app | App | **[Ch 53 Food ordering](../part-3-model-solutions/53-food-ordering-app.md)** (new) | Full |
| 12 | Live location sharing | App feature | [Ch 15 Ride hailing](../part-3-model-solutions/15-ride-hailing.md) · [Ch 18 Maps & location](../part-3-model-solutions/18-maps-location.md) | Partial: viewer side only; add the sharer: location foreground service, background permission, battery-adaptive interval, expiry, who can view |

## How to run each day

1. **Requirements first.** Say what the system must do before naming Room, Retrofit, WorkManager or Compose.
2. **Android decisions out loud.** Lifecycle, background limits, coroutine cancellation, Flow, persistence, memory and battery.
3. **Beyond the happy path.** Failed requests, killed process, double taps, expired tokens, full storage.
4. **Library vs app.** A library needs a small public API, config with safe defaults and no coupling to the host; an app needs features, backend APIs and data models working together.
5. **Trade-offs.** Name the alternative you rejected and what would change your mind.
6. **UI both ways.** For any screen, say how it looks in Views (XML) and in Compose — see [Ch 04](../part-2-building-blocks/04-client-architecture.md#android-ui-toolkits-views-xml-and-compose).

Score each mock with the [rubric (Appendix C)](C-rubric.md).
