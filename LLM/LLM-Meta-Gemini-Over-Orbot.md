# Gemini AI via Orbot

To use Gemini AI on an Android 16 device via Orbot (Tor) and Firefox, you need to navigate a few "walled gardens" since Google often blocks known Tor exit nodes.

## Phase 1: Configure Orbot

### Install Orbot

- Download it from the Google Play Store or F-Droid.

### Enable VPN Mode

- Open Orbot and toggle the VPN Mode switch. This allows Orbot to intercept traffic from apps that don't have built-in proxy settings.

### Select Firefox

- Tap the "Choose Apps" (gear icon) in Orbot and ensure Firefox is checked.

### Bridge Configuration (Optional)

- If your ISP blocks Tor, tap "Use Bridges" and select "obfs4" to hide your Tor traffic.

### Start Tor

- Tap the "Connect" button, maybe a 2nd time, and wait

## Phase 2: Harden Firefox for Android

Standard Firefox needs a few tweaks to ensure it doesn't leak your real IP via DNS or WebRTC.

### Install Firefox

- Use the standard Firefox or Firefox Nightly.

Configure Proxy (Advanced):

1. In the address bar, type `about:config`.

2. Search for `network.proxy.type` and set it to `1` (Manual).

3. Set `network.proxy.socks` to `127.0.0.1` and `network.proxy.socks_port` to `9050`.

4. Set `network.proxy.socks_remote_dns` to `true` (This prevents DNS leaks).

### Disable WebRTC

- Search for `media.peerconnection.enabled` and set it to `false` to prevent your local IP from being exposed.

## Phase 3: Accessing Gemini

Google frequently challenges Tor users with CAPTCHAs or "Access Denied" errors.

### Navigate to Gemini

- Go to [gemini.google.com](https://gemini.google.com).

### The "New Identity" Trick

- If the site is blocked, go back to Orbot and swipe the "New Identity" notification to change your Tor circuit and try again.

### Sign In

- You must be signed into a Google Account. Note that Google may flag the login as "suspicious" due to the Tor IP; have a recovery email or 2FA method ready.

---

### Comparison of Connection Methods

| Feature | Standard VPN | Orbot (Tor) |
| --- | --- | --- |
| Anonymity | High (Provider-dependent) | Extreme (Multi-layered) |
| Speed | Fast | Slow (Higher latency) |
| Google Accessibility | Usually Easy | Difficult (Frequent CAPTCHAs) |
| Android 16 Support | Native | Via VPN Mode / Proxy |

> [!IMPORTANT]

> Because Tor exit nodes are public, Gemini may occasionally limit your "Deep Research" or "Gemini Live" features if it detects automated traffic. If the web interface fails, using a Bridge in Orbot is the most reliable fix.

----

----

