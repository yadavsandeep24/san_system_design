# 16 — Accessibility and Localization

## Goal

Make every design usable by people who use screen readers, larger text, switch control or another language, and say so **unprompted** in interviews. It's a common staff signal and a legal requirement in many markets (the European Accessibility Act applies to many consumer apps from June 2025; ADA cases in the US).

## Accessibility checklist for any screen

| Area | What to say |
|------|-------------|
| Screen reader | Every control has a label, role and state ("Like, button, selected"); decorative images hidden; reading order matches visual order |
| Grouping | Combine a row's parts into one element ("Alex, 2 min ago, Hi there") with custom actions for secondary buttons |
| Dynamic / large text | Layouts reflow at 200%+ text size; no fixed-height text containers; truncation only with access to the full text |
| Touch targets | ≥ 44×44 pt (iOS) / 48×48 dp (Android), even if the visual icon is smaller |
| Contrast | 4.5:1 for body text, 3:1 for large text and UI components (WCAG 2.2 AA) |
| Colour alone | Status never conveyed by colour only (add icon/text) — crucial for payment states |
| Motion | Respect reduce-motion; no auto-playing parallax for users who opted out |
| Focus | Focus moves to new content (dialogs, errors); returns sensibly when it closes |
| Announcements | Async results announced ("Payment pending", "3 new messages") without stealing focus |
| Time limits | OTP and session timeouts can be extended, or warn before expiry |
| Custom gestures | Every swipe / long-press action also available as an accessibility action or button |

## Hard cases worth discussing

- **Infinite feeds:** screen-reader users need a way to jump past the feed or to a section; announce "loading more".
- **Maps:** provide a list alternative for POIs; markers need labels.
- **Charts (trading, spend insights):** an accessible summary ("Up 3.2% today, high 1,204") and audio graphs where supported.
- **Signature / drawing (Ch 62):** offer typed signature as an accessible alternative.
- **Video:** captions, audio descriptions; player controls labelled.
- **Payments:** amount read with currency ("one thousand two hundred rupees"), not digits; never rely on colour for success/failure.
- **Custom canvases (Flutter, Skia, PDF overlays):** you must build the semantics tree yourself.

## Localization and internationalization

| Area | What to say |
|------|-------------|
| Strings | All user-facing text in resource files; no concatenation — use placeholders so translators can reorder |
| Plurals and gender | ICU message format / platform plural rules (`one`, `few`, `many`, `other`) |
| Formatting | Dates, numbers, currency and units with locale-aware formatters; store values in UTC / minor units, format at the edge |
| RTL | Mirrored layouts (leading/trailing, not left/right); some icons mirror, some don't (media controls don't) |
| Text expansion | German/Finnish can be 30–40% longer; Thai and Arabic need taller line heights |
| Scripts and input | Name fields accept any script; don't validate names with ASCII regexes; IME composition in text fields |
| Server-driven copy | Server sends keys or localized strings with the locale it used; client falls back gracefully |
| App language | Per-app language settings (Android 13+ / iOS) — don't assume system locale |
| Delivery | Strings shipped in the binary, or fetched (OTA) with a bundled fallback |

## Platform implementation

| Concern | Android | iOS | Flutter | React Native |
|---------|---------|-----|---------|--------------|
| Label / role | `contentDescription`; Compose `Modifier.semantics { contentDescription; role }` | `accessibilityLabel`, `accessibilityTraits`; SwiftUI `.accessibilityLabel`, `.accessibilityAddTraits` | `Semantics(label:, button: true)` | `accessibilityLabel`, `accessibilityRole` |
| Grouping | `mergeDescendants = true`; `android:screenReaderFocusable` | `accessibilityElement(children: .combine)` | `MergeSemantics` | `accessible={true}` on the container |
| Custom actions | `AccessibilityNodeInfoCompat.addAction` / `semantics { customActions }` | `accessibilityCustomActions` / `.accessibilityAction(named:)` | `Semantics(customSemanticsActions: …)` | `accessibilityActions` + `onAccessibilityAction` |
| Announce | `announceForAccessibility` (deprecated) → live regions (`liveRegion = Polite`) | `UIAccessibility.post(notification: .announcement, argument:)` / `AccessibilityNotification.Announcement` | `SemanticsService.announce` | `AccessibilityInfo.announceForAccessibility` |
| Text scaling | `sp` units; test at 200% font scale (Android 14 nonlinear scaling) | Dynamic Type text styles, `@ScaledMetric` | `MediaQuery.textScalerOf` | `allowFontScaling`, `maxFontSizeMultiplier` sparingly |
| Reduce motion | `Settings.Global.ANIMATOR_DURATION_SCALE` / remove animations | `UIAccessibility.isReduceMotionEnabled`, `@Environment(\.accessibilityReduceMotion)` | `MediaQuery.disableAnimationsOf` | `AccessibilityInfo.isReduceMotionEnabled()` |
| Testing | Accessibility Scanner, Espresso `AccessibilityChecks`, TalkBack | Accessibility Inspector, XCUITest `performAccessibilityAudit()`, VoiceOver | `meetsGuideline` matchers, TalkBack/VoiceOver | RNTL role queries, TalkBack/VoiceOver |
| Strings / plurals | `strings.xml`, `plurals`, ICU `MessageFormat` | String Catalogs (`.xcstrings`) with plural/device variations | `intl` + ARB files (`flutter gen-l10n`) | `i18next` / `react-intl` (ICU), `expo-localization` |
| RTL | `start`/`end`, `android:supportsRtl` | Leading/trailing constraints, semantic content attribute | `Directionality`, `EdgeInsetsDirectional` | `I18nManager.forceRTL` (restart needed), `start`/`end` styles |
| Per-app language | `AppCompatDelegate.setApplicationLocales` / locale config | Per-app language in Settings (`Bundle` reload on relaunch) | `MaterialApp(locale:)` | Re-init i18n library; native strings need restart |

## Say it in the interview

> "Every row is one accessibility element with custom actions for like and share, the payment status is announced and shown with an icon as well as colour, layouts reflow at large text sizes, and amounts are formatted from minor units with the user's locale. All strings come from resources with plural rules, and the layout uses leading and trailing so RTL works without special cases."

## Checkpoint

For each screen: **labels and grouping**, **large text**, **announcements for async results**, **non-colour status**, **locale-aware formatting**, **RTL**.

## Exercises

1. Make a chat row (avatar, name, last message, time, unread badge, swipe-to-archive) accessible on two platforms of your choice.
2. A payment result screen shows a green tick and "₹1,200". List everything a screen-reader user and a colour-blind user would miss, and fix it.
3. Your server-driven UI (Ch 35) sends English strings. Design the localization contract between server and client.
4. Your Flutter app draws a custom chart with `CustomPainter`. How do you make it accessible?
